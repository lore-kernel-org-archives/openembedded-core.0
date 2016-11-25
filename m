Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BBAFC719C9;
	Fri, 25 Nov 2016 23:59:22 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t79so104196816wmt.0;
	Fri, 25 Nov 2016 15:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=LR6CvgLPgUCnPngkmjxAlI+FVetMu6WiG/nM15tCyOU=;
	b=U3L6wBss0jk2oWQm2Vg1Xa13NBjwOZ+BXJX+wlwU7ioT4TiYPHxRXbb4SJm96YBJD1
	k5jCsCVnllUR/ensmeojH37QWDSLD0mK3gE0Rui9ul6w8ztgjkRMFdgi+GLJciAXQlJ8
	jikcqB+VjGudKcgaQzzaccIZqy9FTmMQ/86fMUGODIHCXKvCcqfIg4X/W1A5w1OH0oSP
	kvGTkQbQRE1mgoEgin6R3oYgGiQxbJW2D7OU3O6+CoXGchFPQW/UuAMJ16H5GBpuMjyH
	YexN/tN+CXBuk9v2fs4gQET7N+PBnbmc2yKpegAh5i7WgBoQo0zZC92VAlMuTdi7gAnS
	Sv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=LR6CvgLPgUCnPngkmjxAlI+FVetMu6WiG/nM15tCyOU=;
	b=ExLlG/USnFL4QVK1dlBnpCyEHfm4QTV6fmZ+rXB/rQFsRWYc6ljO4IJYj0akfZtaS1
	eBBR8xcMXPTbze2dwErYqBcLGUxyMBhhawxRF/sAfp8h5Tri6F3t75Q0/0/a5ZkYtVR8
	dzQXG+jb/VQjfBIOIIG15bfh3DEckm/79l8yxx/y5+gUMmyspI96I2GMnj5o1WM7Ujkr
	rmRaz8mCrzFQmsmImPg9rFp5DTv+XKl4OWmFPPp8bkM7HY6DKs+PB/QOHLLT/sBh/nn/
	FuMd+ZAks6BR9qwPxeIFT2/7iOPvqWekfoHZNX59utYbtHS2K+X9MALHl5FQjAMUwreS
	2Y+Q==
X-Gm-Message-State: AKaTC01Mc6bDjxjMcs3GMhTGlJqbkLhpe7toN9N9+e64DzCDFrqsnI/sqnLhVYkjMy84/Q==
X-Received: by 10.28.234.85 with SMTP id i82mr9377290wmh.6.1480118361590;
	Fri, 25 Nov 2016 15:59:21 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e188sm15832211wma.21.2016.11.25.15.59.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Nov 2016 15:59:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 26 Nov 2016 00:59:25 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20161125235925.GA3271@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: State of bitbake world, Failed tasks 2016-11-24
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
X-List-Received-Date: Fri, 25 Nov 2016 23:59:23 -0000
X-Groupsio-MsgNum: 89881
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||=09
|-
||2016-11-24	||8	||7	||5	||14	||7	||6	||14	||7	||6	||0	||0		||0		||2		||14	=
	||5		||581		||1		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-11-24 =3D=3D

INFO: jenkins-job.sh-1.8.12 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20161125_134053.log

=3D=3D=3D common (5) =3D=3D=3D
    * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.=
8.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb:d=
o_compile
    * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.b=
b:do_configure
    * meta-qt5/recipes-qt/qt5/qtenginio_git.bb:do_compile
    * openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb:do_c=
ompile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb=
:do_configure
    * meta-qt5/recipes-qt/maliit/maliit-framework-qt5_git.bb:do_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb:do_com=
pile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (20) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20161123_082709.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/24841/
|-
|| qemux86 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20161123_082731.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/24842/
|-
|| qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20161124_084723.log/ || http://errors.yoctoproject.or=
g/Errors/Build/24872/
|}

=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D

=3D=3D=3D QA issues (603) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
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
||14	||build-deps
|-
||1	||host-user-contaminated
|-
||2	||textrel
|-
||581	||version-going-backwards
|-
||5	||file-rdeps
|}



=3D=3D=3D Failed dependencies for qemuarm (14) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161124_075124.log/
Found differences:=20
Found errors:=20
    * ERROR: 14 issues were found in these recipes: kodi libgxim libsdl2 qt=
enginio webkitgtk xfce4-vala xfsprogs

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (7) =3D=3D=
=3D
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161124_075124.log//2_max/failed/kodi.log
    * libgxim -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161124_075124.log//2_max/failed/libgxim.log
    * libsdl2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161124_075124.log//2_max/failed/libsdl2.log
    * qtenginio -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161124_075124.log//2_max/failed/qtenginio.log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161124_075124.log//2_max/failed/webkitgtk.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20161124_075124.log//2_max/failed/xfce4-vala.log
    * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20161124_075124.log//2_max/failed/xfsprogs.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (6) =3D=3D=
=3D
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161124_075124.log//3_min/failed/kodi.log
    * libgxim -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161124_075124.log//3_min/failed/libgxim.log
    * qtenginio -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161124_075124.log//3_min/failed/qtenginio.log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161124_075124.log//3_min/failed/webkitgtk.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20161124_075124.log//3_min/failed/xfce4-vala.log
    * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20161124_075124.log//3_min/failed/xfsprogs.log

=3D=3D=3D Failed dependencies for qemux86 (14) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161125_073240.log/
Found differences:=20
Found errors:=20
    * ERROR: 14 issues were found in these recipes: chromium libgxim libsdl=
2 qtenginio qtwebengine xfce4-vala xfsprogs

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (7) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161125_073240.log//2_max/failed/chromium.log
    * libgxim -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161125_073240.log//2_max/failed/libgxim.log
    * libsdl2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161125_073240.log//2_max/failed/libsdl2.log
    * qtenginio -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161125_073240.log//2_max/failed/qtenginio.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20161125_073240.log//2_max/failed/qtwebengine.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemux86.20161125_073240.log//2_max/failed/xfce4-vala.log
    * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161125_073240.log//2_max/failed/xfsprogs.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (6) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161125_073240.log//3_min/failed/chromium.log
    * libgxim -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161125_073240.log//3_min/failed/libgxim.log
    * qtenginio -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161125_073240.log//3_min/failed/qtenginio.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20161125_073240.log//3_min/failed/qtwebengine.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemux86.20161125_073240.log//3_min/failed/xfce4-vala.log
    * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161125_073240.log//3_min/failed/xfsprogs.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20161124_135421.log/


    * ERROR: Nothing PROVIDES 'libva' (but /home/jenkins/oe/world/shr-core/=
meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb DEPEN=
DS on or otherwise requires it). Close matches:
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /ho=
me/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing PROVIDES 'libva' (but /home/jenkins/oe/world/shr-core/=
meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb DEPEN=
DS on or otherwise requires it). Close matches:
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
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
meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?=3D "BROKEN: =
fails to build with latest oe-core"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D "Ol=
d and unmaintaned fork with many security issues"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi] ?=
=3D "Depends on broken xfsprogs"
meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump=
] ?=3D "Depends on broken xfsprogs"
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
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken gnome-panel"
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.b=
b:PNBLACKLIST[gnome-control-center] ?=3D "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnom=
e-menus] ?=3D "BROKEN: fails to build because of python + conflicts with gn=
ome-menu3"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnom=
e-panel] ?=3D "Depends on broken libgweather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:PNBLACKLIST[=
gnome-session] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-t=
erminal] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecu=
ps] ?=3D "Depends on broken libgnomeui"
meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnome=
print] ?=3D "Depends on broken libgnomecups"
meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric] =
?=3D "Depends on broken libgnomeprint"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgwea=
ther] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=3D "Fai=
ls to build with gcc-6"
meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=3D "Fail=
s to build with gcc-6"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker] ?=
=3D "BROKEN: fails to build with new binutils-2.27"
meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader] ?=
=3D "BROKEN: fails to build with gcc-6"
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
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:PNBLACKLIST[net=
map-modules] ?=3D "BROKEN: not compatible with default kernel version 4.8"
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D "BROKEN: Tries to build kernel module and fails, either it should be di=
sabled or there should be dependency on kernel like in netmap-modules"
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[ac=
cel-ppp] ?=3D "BROKEN: fails to build with new binutils-2.27"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
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
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=3D=
 "Depends on broken wvstreams"
meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstream=
s] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=3D=
 "BROKEN: QA Issue: -dev package contains non-symlink .so"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?=3D=
 "BROKEN: fails since last autotools.bbclass changes"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
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
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-v=
cdiff] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACK=
LIST[vboxguestdrivers] ?=3D "BROKEN: not compatible with default kernel ver=
sion 4.8"
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PN=
BLACKLIST[libframeworkd-glib] ?=3D "BROKEN: many errors when building with =
gcc-6"
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zho=
ne] ?=3D "rdepends on python-pycairo which was removed"
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedca=
ching] ?=3D "RDEPENDS on python-pygtk was removed from oe-core"
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
meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]=
 ?=3D "RDEPENDS on python-pygtk which was removed from oe-core"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "RDEPEND=
S on python-pygtk which was removed from oe-core"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKL vala upgrade from 0.24=
=2E0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins] =
?=3D "BROKEN: fails to build with new binutils-2.27"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
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


count: 2	issue: textrel
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2491+gitAUTOINC+86b71982e1: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2491+gitAUTOINC+86b71982e1-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 14	issue: build-deps
dante-1.4.1: dante-libdsocks rdepends on libpam, but it isn't a build depen=
dency, missing libpam in DEPENDS or PACKAGECONFIG? [build-deps]
dante-1.4.1: dante rdepends on libpam, but it isn't a build dependency, mis=
sing libpam in DEPENDS or PACKAGECONFIG? [build-deps]
dante-1.4.1: dante-sockd rdepends on libpam, but it isn't a build dependenc=
y, missing libpam in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libvdpau, but it isn't a build depende=
ncy, missing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libx11, but it isn't a build dependenc=
y, missing libx11 in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxau, but it isn't a build dependenc=
y, missing libxau in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxcb, but it isn't a build dependenc=
y, missing libxcb in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxdmcp, but it isn't a build depende=
ncy, missing libxdmcp in DEPENDS or PACKAGECONFIG? [build-deps]
directfb-1.7.7: directfb rdepends on libxext, but it isn't a build dependen=
cy, missing libxext in DEPENDS or PACKAGECONFIG? [build-deps]
miniupnpd-2.0: miniupnpd rdepends on libmnl, but it isn't a build dependenc=
y, missing libmnl in DEPENDS or PACKAGECONFIG? [build-deps]
miniupnpd-2.0: miniupnpd rdepends on libnetfilter-conntrack, but it isn't a=
 build dependency, missing libnetfilter-conntrack in DEPENDS or PACKAGECONF=
IG? [build-deps]
obexftp-0.24.2: obexftp rde8de585e18be705055259484518d94: tvheadend rdepend=
s on uriparser, but it isn't a build dependency, missing uriparser in DEPEN=
DS or PACKAGECONFIG? [build-deps]


count: 5	issue: file-rdeps
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in=
 package numptyphysics requires /usr/bin/perl, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
tvheadend-4.0.9+git64fec8120158de585e18be705055259484518d94: /usr/bin/tvhea=
dend contained in package tvheadend requires libucsi.so, but no providers f=
ound in RDEPENDS_tvheadend? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]


count: 581	issue: version-going-backwards
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-dbg went backwards whi=
ch would break package feeds from (0:svn-r0.37 to 0:1.0+git0+2f6cb866d6_d8c=
b47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-going-ba=
ckwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-dbg went backwards whi=
ch would break package feeds from (0:svn-r0.40 to 0:1.0+git0+2f6cb866d6_d8c=
b47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-going-ba=
ckwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-dbg went backwards whi=
ch would break package feeds from (0:svn-r0.43 to 0:1.0+git0+2f6cb866d6_d8c=
b47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-going-ba=
ckwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-dev went backwards whi=
ch would break package feeds from (0:svn-r0.37 to 0:1.0+git0+2f6cb866d6_d8c=
b47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-going-ba=
ckwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-dev went backwards whi=
ch would break package feeds from (0:svn-r0.40 to 0:1.0+git0+2f6cb866d6_d8c=
b47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-going-ba=
ckwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-dev went backwards whi=
ch would break package feeds from (0:svn-r0.43 to 0:1.0+git0+2f6cb866d6_d8c=
b47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-going-ba=
ckwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-doc went backwards whi=
ch would break package feeds from (0:svn-r0.37 to 0:1.0+git0+2f6cb866d6_d8c=
b47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-going-ba=
ckwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-doc went backwards whi=
ch would break package feeds from (0:svn-r0.40 to 0:1.0+git0+2f6cb866d6_d8c=
b47f79d20f6d: Package version for package breakpad-locale went backwards wh=
ich would break package feeds from (0:svn-r0.37 to 0:1.0+git0+2f6cb866d6_d8=
cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-going-b=
ackwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-locale went backwards =
which would break package feeds from (0:svn-r0.40 to 0:1.0+git0+2f6cb866d6_=
d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-going=
-backwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-locale went backwards =
which would break package feeds from (0:svn-r0.43 to 0:1.0+git0+2f6cb866d6_=
d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-going=
-backwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-minidump-upload went b=
ackwards which would break package feeds from (0:svn-r0.37 to 0:1.0+git0+2f=
6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [vers=
ion-going-backwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-minidump-upload went b=
ackwards which would break package feeds from (0:svn-r0.40 to 0:1.0+git0+2f=
6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [vers=
ion-going-backwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-minidump-upload went b=
ackwards which would break package feeds from (0:svn-r0.43 to 0:1.0+git0+2f=
6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [vers=
ion-going-backwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-staticdev went backwar=
ds which would break package feeds from (0:svn-r0.37 to 0:1.0+git0+2f6cb866=
d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-go=
ing-backwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-staticdev went backwar=
ds which would break package feeds from (0:svn-r0.40 to 0:1.0+git0+2f6cb866=
d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-go=
ing-backwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-staticdev went backwar=
ds which would break package feeds from (0:svn-r0.43 to 0:1.0+git0+2f6cb866=
d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-go=
ing-backwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-sym-upload went backwa=
rds which would break package feeds from (0:svn-r0.37 to 0:1.0+git0+2f6cb86=
6d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-g=
oing-backwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-sym-upload went backwa=
rds which would break package feeds from (0:svn-r0.40 to 0:1.0+git0+2f6cb86=
6d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [version-g=
oing-backwards]
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d: Package version for package breakpad-sym-upload went backwa=
rds which would break package feeds from version for package breakpad went =
backwards which would break package feeds from (0:svn-r0.43 to 0:1.0+git0+2=
f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6d-r0.0) [ver=
sion-going-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-dbg went backwards which would break package feeds from (0:5.8.0+git0+6=
e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [version-going-=
backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-dev went backwards which would break package feeds from (0:5.8.0+git0+6=
e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [version-going-=
backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-doc went backwards which would break package feeds from (0:5.8.0+git0+6=
e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [version-going-=
backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-examples-dbg went backwards which would break package feeds from (0:5.8=
=2E0+git0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [ver=
sion-going-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-examples-dev went backwards which would break package feeds from (0:5.8=
=2E0+git0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [ver=
sion-going-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-examples-staticdev went backwards which would break package feeds from =
(0:5.8.0+git0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) =
[version-going-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-examples went backwards which would break package feeds from (0:5.8.0+g=
it0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [version-g=
oing-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-locale went backwards which would break package feeds from (0:5.8.0+git=
0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [version-goi=
ng-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-mkspecs went backwards which would break package feeds from (0:5.8.0+gi=
t0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [version-go=
ing-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-plugins-dbg went backwards which would break package feeds from (0:5.8.=
0+git0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [versio=
n-going-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-plugins went backwards which would break package feeds from (0:5.8.0+gi=
t0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [version-go=
ing-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-qmldesigner went backwards which would break package feeds from (0:5.8.=
0+git0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [versio=
n-going-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-qmlplugins-dbg went backwards which would break package feeds from (0:5=
=2E8.0+git0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [v=
ersion-going-backwards]
qt3d-5.7.99+5.8.0-beta+gitAUTOINC+6e8e228852: Package version for package q=
t3d-qmlplugins went backwards which would break package feeds from (0:5.8.0=
+git0+6e8e228852-r0.0 to 0:5.7.99+5.8.0-beta+git0+6e8e228852-r0.0) [version=
-going-b5.8.0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r=
0.0) [version-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-dev went backwards which would break package feeds from (0:5.8.0+gi=
t0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [version-go=
ing-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-doc went backwards which would break package feeds from (0:5.8.0+gi=
t0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [version-go=
ing-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-examples-dbg went backwards which would break package feeds from (0=
:5.8.0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [v=
ersion-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-examples-dev went backwards which would break package feeds from (0=
:5.8.0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [v=
ersion-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-examples-staticdev went backwards which would break package feeds f=
rom (0:5.8.0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0=
=2E0) [version-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-examples went backwards which would break package feeds from (0:5.8=
=2E0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [ver=
sion-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-locale went backwards which would break package feeds from (0:5.8.0=
+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [version=
-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-mkspecs went backwards which would break package feeds from (0:5.8.=
0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [versio=
n-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-plugins-dbg went backwards which would break package feeds from (0:=
5.8.0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [ve=
rsion-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-plugins went backwards which would break package feeds from (0:5.8.=
0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [versio=
n-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-qmldesigner went backwards which would break package feeds from (0:=
5.8.0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [ve=
rsion-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-qmlplugins-dbg went backwards which would break package feeds from =
(0:5.8.0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) =
[version-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-qmlplugins went backwards which would break package feeds from (0:5=
=2E8.0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [v=
ersion-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+969bb10eed: Package version for package=
 qtbase-staticdev went backwards which would break package feeds from (0:5.=
8.0+git0+969bb10eed-r0.0 to 0:5.7.99+5.8.0-beta+git0+969bb10eed-r0.0) [vers=
ion-going-backwards]
qtbase-5.7.99+5.8.0-beta+gitAUTOINC+90:5.7.99+5.8.0-beta+git0+6c5121eab7-r0=
=2E0) [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-dev went backwards which would break package feeds from (0:=
5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7-r0.0) [ve=
rsion-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-doc went backwards which would break package feeds from (0:=
5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7-r0.0) [ve=
rsion-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-examples-dbg went backwards which would break package feeds=
 from (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7-=
r0.0) [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-examples-dev went backwards which would break package feeds=
 from (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7-=
r0.0) [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-examples-staticdev went backwards which would break package=
 feeds from (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c512=
1eab7-r0.0) [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-examples went backwards which would break package feeds fro=
m (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7-r0.0=
) [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-locale went backwards which would break package feeds from =
(0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7-r0.0) =
[version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-mkspecs went backwards which would break package feeds from=
 (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7-r0.0)=
 [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-plugins-dbg went backwards which would break package feeds =
=66rom (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7=
-r0.0) [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-plugins went backwards which would break package feeds from=
 (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7-r0.0)=
 [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-qmldesigner went backwards which would break package feeds =
=66rom (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7=
-r0.0) [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-qmlplugins-dbg went backwards which would break package fee=
ds from (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab=
7-r0.0) [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-qmlplugins went backwards which would break package feeds f=
rom (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+git0+6c5121eab7-r0=
=2E0) [version-going-backwards]
qtcanvas3d-5.7.99+5.8.0-beta+gitAUTOINC+6c5121eab7: Package version for pac=
kage qtcanvas3d-staticdev went backwards which would break package feeds fr=
om (0:5.8.0+git0+6c5121eab7-r0.0 to 0:5.7.99+5.8.0-beta+gite feeds from (0:=
5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0) [ve=
rsion-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-dev went backwards which would break package feeds from (0:5.8.=
0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0) [versio=
n-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-doc went backwards which would break package feeds from (0:5.8.=
0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0) [versio=
n-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-examples-dbg went backwards which would break package feeds fro=
m (0:5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0=
) [version-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-examples-dev went backwards which would break package feeds fro=
m (0:5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0=
) [version-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-examples-staticdev went backwards which would break package fee=
ds from (0:5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed9=
6-r0.0) [version-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-examples went backwards which would break package feeds from (0=
:5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0) [v=
ersion-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-locale went backwards which would break package feeds from (0:5=
=2E8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0) [v=
ersion-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-mkspecs went backwards which would break package feeds from (0:=
5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0) [ve=
rsion-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-plugins-dbg went backwards which would break package feeds from=
 (0:5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0)=
 [version-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-plugins went backwards which would break package feeds from (0:=
5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0) [ve=
rsion-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-qmldesigner went backwards which would break package feeds from=
 (0:5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0)=
 [version-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-qmlplugins-dbg went backwards which would break package feeds f=
rom (0:5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0=
=2E0) [version-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-qmlplugins went backwards which would break package feeds from =
(0:5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed96-r0.0) =
[version-going-backwards]
qtcharts-5.7.99+5.8.0-beta+gitAUTOINC+15447eed96: Package version for packa=
ge qtcharts-staticdev went backwards which would break package feeds from (=
0:5.8.0+git0+15447eed96-r0.0 to 0:5.7.99+5.8.0-beta+git0+15447eed.99+5.8.0-=
beta+gitAUTOINC+515ff5b0f9: Package version for package qtconnectivity-dbg =
went backwards which would break package feeds from (0:5.8.0+git0+515ff5b0f=
9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515ff5b0f9-r0.0) [version-going-backward=
s]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-dev went backwards which would break package feeds =
=66rom (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515ff5b0f9=
-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-doc went backwards which would break package feeds =
=66rom (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515ff5b0f9=
-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-examples-dbg went backwards which would break packa=
ge feeds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515=
ff5b0f9-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-examples-dev went backwards which would break packa=
ge feeds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515=
ff5b0f9-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-examples-staticdev went backwards which would break=
 package feeds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+gi=
t0+515ff5b0f9-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-examples went backwards which would break package f=
eeds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515ff5b=
0f9-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-locale went backwards which would break package fee=
ds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515ff5b0f=
9-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-mkspecs went backwards which would break package fe=
eds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515ff5b0=
f9-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-plugins-dbg went backwards which would break packag=
e feeds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515f=
f5b0f9-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-plugins went backwards which would break package fe=
eds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515ff5b0=
f9-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-qmldesigner went backwards which would break packag=
e feeds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+515f=
f5b0f9-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-qmlplugins-dbg went backwards which would break pac=
kage feeds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5.7.99+5.8.0-beta+git0+5=
15ff5b0f9-r0.0) [version-going-backwards]
qtconnectivity-5.7.99+5.8.0-beta+gitAUTOINC+515ff5b0f9: Package version for=
 package qtconnectivity-qmlplugins went backwards which would break package=
 feeds from (0:5.8.0+git0+515ff5b0f9-r0.0 to 0:5is3d-5.7.99+5.8.0-beta+gitA=
UTOINC+96086b01a3: Package version for package qtdatavis3d-doc went backwar=
ds which would break package feeds from (0:5.8.0+git0+96086b01a3-r0.0 to 0:=
5.7.99+5.8.0-beta+git0+96086b01a3-r0.0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-examples-dbg went backwards which would break package fee=
ds from (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a=
3-r0.0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-examples-dev went backwards which would break package fee=
ds from (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a=
3-r0.0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-examples-staticdev went backwards which would break packa=
ge feeds from (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+960=
86b01a3-r0.0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-examples went backwards which would break package feeds f=
rom (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a3-r0=
=2E0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-locale went backwards which would break package feeds fro=
m (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a3-r0.0=
) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-mkspecs went backwards which would break package feeds fr=
om (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a3-r0.=
0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-plugins-dbg went backwards which would break package feed=
s from (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a3=
-r0.0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-plugins went backwards which would break package feeds fr=
om (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a3-r0.=
0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-qmldesigner went backwards which would break package feed=
s from (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a3=
-r0.0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-qmlplugins-dbg went backwards which would break package f=
eeds from (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b0=
1a3-r0.0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-qmlplugins went backwards which would break package feeds=
 from (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a3-=
r0.0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-staticdev went backwards which would break package feeds =
=66rom (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a3=
-r0.0) [version-going-backwards]
qtdatavis3d-5.7.99+5.8.0-beta+gitAUTOINC+96086b01a3: Package version for pa=
ckage qtdatavis3d-tools-dbg went backwards which would break package feeds =
=66rom (0:5.8.0+git0+96086b01a3-r0.0 to 0:5.7.99+5.8.0-beta+git0+96086b01a3=
-r0.0) [version-going-backwark package feeds from (0:5.8.0+git0+9d085bf002-=
r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085bf002-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-examples-dbg went backwards which would break package=
 feeds from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085=
bf002-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-examples-dev went backwards which would break package=
 feeds from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085=
bf002-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-examples-staticdev went backwards which would break p=
ackage feeds from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0=
+9d085bf002-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-examples went backwards which would break package fee=
ds from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085bf00=
2-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-locale went backwards which would break package feeds=
 from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085bf002-=
r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-mkspecs went backwards which would break package feed=
s from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085bf002=
-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-plugins-dbg went backwards which would break package =
feeds from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085b=
f002-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-plugins went backwards which would break package feed=
s from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085bf002=
-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-qmldesigner went backwards which would break package =
feeds from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085b=
f002-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-qmlplugins-dbg went backwards which would break packa=
ge feeds from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d0=
85bf002-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-qmlplugins went backwards which would break package f=
eeds from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085bf=
002-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-staticdev went backwards which would break package fe=
eds from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085bf0=
02-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package version for =
package qtdeclarative-tools-dbg went backwards which would break package fe=
eds from (0:5.8.0+git0+9d085bf002-r0.0 to 0:5.7.99+5.8.0-beta+git0+9d085bf0=
02-r0.0) [version-going-backwards]
qtdeclarative-5.7.99+5.8.0-beta+gitAUTOINC+9d085bf002: Package veeta+gitAUT=
OINC+8b5cb6185a: Package version for package qtgraphicaleffects-examples-db=
g went backwards which would break package feeds from (0:5.8.0+git0+8b5cb61=
85a-r0.0 to 0:5.7.99+5.8.0-beta+git0+8b5cb6185a-r0.0) [version-going-backwa=
rds]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-examples-dev went backwards which would bre=
ak package feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-beta+=
git0+8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-examples-staticdev went backwards which wou=
ld break package feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0=
-beta+git0+8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-examples went backwards which would break p=
ackage feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-beta+git0=
+8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-locale went backwards which would break pac=
kage feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-beta+git0+8=
b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-mkspecs went backwards which would break pa=
ckage feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-beta+git0+=
8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-plugins-dbg went backwards which would brea=
k package feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-beta+g=
it0+8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-plugins went backwards which would break pa=
ckage feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-beta+git0+=
8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-qmldesigner went backwards which would brea=
k package feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-beta+g=
it0+8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-qmlplugins-dbg went backwards which would b=
reak package feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-bet=
a+git0+8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-qmlplugins went backwards which would break=
 package feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-beta+gi=
t0+8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-staticdev went backwards which would break =
package feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-beta+git=
0+8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtgraphicaleffects-tools-dbg went backwards which would break =
package feeds from (0:5.8.0+git0+8b5cb6185a-r0.0 to 0:5.7.99+5.8.0-beta+git=
0+8b5cb6185a-r0.0) [version-going-backwards]
qtgraphicaleffects-5.7.99+5.8.0-beta+gitAUTOINC+8b5cb6185a: Package version=
 for package qtNC+99d9e0c527: Package version for package qtimageformats-ex=
amples-dbg went backwards which would break package feeds from (0:5.8.0+git=
0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d9e0c527-r0.0) [version-goi=
ng-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-examples-dev went backwards which would break packa=
ge feeds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d=
9e0c527-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-examples-staticdev went backwards which would break=
 package feeds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+gi=
t0+99d9e0c527-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-examples went backwards which would break package f=
eeds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d9e0c=
527-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-locale went backwards which would break package fee=
ds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d9e0c52=
7-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-mkspecs went backwards which would break package fe=
eds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d9e0c5=
27-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-plugins-dbg went backwards which would break packag=
e feeds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d9=
e0c527-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-plugins went backwards which would break package fe=
eds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d9e0c5=
27-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-qmldesigner went backwards which would break packag=
e feeds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d9=
e0c527-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-qmlplugins-dbg went backwards which would break pac=
kage feeds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+9=
9d9e0c527-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-qmlplugins went backwards which would break package=
 feeds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d9e=
0c527-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-staticdev went backwards which would break package =
feeds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d9e0=
c527-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-tools-dbg went backwards which would break package =
feeds from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8.0-beta+git0+99d9e0=
c527-r0.0) [version-going-backwards]
qtimageformats-5.7.99+5.8.0-beta+gitAUTOINC+99d9e0c527: Package version for=
 package qtimageformats-tools went backwards which would break package feed=
s from (0:5.8.0+git0+99d9e0c527-r0.0 to 0:5.7.99+5.8cation-5.7.99+5.8.0-bet=
a+gitAUTOINC+8aabdb0975: Package version for package qtlocation-examples-de=
v went backwards which would break package feeds from (0:5.8.0+git0+8aabdb0=
975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975-r0.0) [version-going-backwa=
rds]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-examples-staticdev went backwards which would break package=
 feeds from (0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabd=
b0975-r0.0) [version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-examples went backwards which would break package feeds fro=
m (0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975-r0.0=
) [version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-locale went backwards which would break package feeds from =
(0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975-r0.0) =
[version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-mkspecs went backwards which would break package feeds from=
 (0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975-r0.0)=
 [version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-plugins-dbg went backwards which would break package feeds =
=66rom (0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975=
-r0.0) [version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-plugins went backwards which would break package feeds from=
 (0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975-r0.0)=
 [version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-qmldesigner went backwards which would break package feeds =
=66rom (0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975=
-r0.0) [version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-qmlplugins-dbg went backwards which would break package fee=
ds from (0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb097=
5-r0.0) [version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-qmlplugins went backwards which would break package feeds f=
rom (0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975-r0=
=2E0) [version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-staticdev went backwards which would break package feeds fr=
om (0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975-r0.=
0) [version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-tools-dbg went backwards which would break package feeds fr=
om (0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975-r0.=
0) [version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation-tools went backwards which would break package feeds from (=
0:5.8.0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975-r0.0) [=
version-going-backwards]
qtlocation-5.7.99+5.8.0-beta+gitAUTOINC+8aabdb0975: Package version for pac=
kage qtlocation went backwards which would break package feeds from (0:5.8.=
0+git0+8aabdb0975-r0.0 to 0:5.7.99+5.8.0-beta+git0+8aabdb0975-r0.0) [versio=
n-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gfor package qtmultimedia-examples-staticdev=
 went backwards which would break package feeds from (0:5.8.0+git0+0cb4dc5c=
1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c1f-r0.0) [version-going-backwar=
ds]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-examples went backwards which would break package feeds=
 from (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c1f-=
r0.0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-locale went backwards which would break package feeds f=
rom (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c1f-r0=
=2E0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-mkspecs went backwards which would break package feeds =
=66rom (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c1f=
-r0.0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-plugins-dbg went backwards which would break package fe=
eds from (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c=
1f-r0.0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-plugins went backwards which would break package feeds =
=66rom (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c1f=
-r0.0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-qmldesigner went backwards which would break package fe=
eds from (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c=
1f-r0.0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-qmlplugins-dbg went backwards which would break package=
 feeds from (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4d=
c5c1f-r0.0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-qmlplugins went backwards which would break package fee=
ds from (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c1=
f-r0.0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-staticdev went backwards which would break package feed=
s from (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c1f=
-r0.0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-tools-dbg went backwards which would break package feed=
s from (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c1f=
-r0.0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia-tools went backwards which would break package feeds fr=
om (0:5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c1f-r0.=
0) [version-going-backwards]
qtmultimedia-5.7.99+5.8.0-beta+gitAUTOINC+0cb4dc5c1f: Package version for p=
ackage qtmultimedia went backwards which would break package feeds from (0:=
5.8.0+git0+0cb4dc5c1f-r0.0 to 0:5.7.99+5.8.0-beta+git0+0cb4dc5c1f-r0.0) [ve=
rsion-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-dbg went backwards which would break package feeds from (0:5.8.=
0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0) [versio=
n-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package vent backwards wh=
ich would break package feeds from (0:5.8.0+git0+64faeb0d80-r0.0 to 0:5.7.9=
9+5.8.0-beta+git0+64faeb0d80-r0.0) [version-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-locale went backwards which would break package feeds from (0:5=
=2E8.0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0) [v=
ersion-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-mkspecs went backwards which would break package feeds from (0:=
5.8.0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0) [ve=
rsion-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-plugins-dbg went backwards which would break package feeds from=
 (0:5.8.0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0)=
 [version-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-plugins went backwards which would break package feeds from (0:=
5.8.0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0) [ve=
rsion-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-qmldesigner went backwards which would break package feeds from=
 (0:5.8.0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0)=
 [version-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-qmlplugins-dbg went backwards which would break package feeds f=
rom (0:5.8.0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0=
=2E0) [version-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-qmlplugins went backwards which would break package feeds from =
(0:5.8.0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0) =
[version-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-staticdev went backwards which would break package feeds from (=
0:5.8.0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0) [=
version-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-tools-dbg went backwards which would break package feeds from (=
0:5.8.0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0) [=
version-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1-tools went backwards which would break package feeds from (0:5.=
8.0+git0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0) [vers=
ion-going-backwards]
qtquick1-5.7.99+5.8.0-beta+gitAUTOINC+64faeb0d80: Package version for packa=
ge qtquick1 went backwards which would break package feeds from (0:5.8.0+gi=
t0+64faeb0d80-r0.0 to 0:5.7.99+5.8.0-beta+git0+64faeb0d80-r0.0) [version-go=
ing-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-dbg went backwards which would break package fe=
eds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+e09a8591=
99-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-dev went backwards which would break package fe=
eds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+e09a8591=
99-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-doc went backwards which would break package fe=
eds from (0:5.8.0+git0+ion-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-mkspecs went backwards which would break packag=
e feeds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+e09a=
859199-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-plugins-dbg went backwards which would break pa=
ckage feeds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+=
e09a859199-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-plugins went backwards which would break packag=
e feeds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+e09a=
859199-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-qmldesigner went backwards which would break pa=
ckage feeds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+=
e09a859199-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-qmlplugins-dbg went backwards which would break=
 package feeds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+gi=
t0+e09a859199-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-qmlplugins went backwards which would break pac=
kage feeds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+e=
09a859199-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-staticdev went backwards which would break pack=
age feeds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+e0=
9a859199-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-tools-dbg went backwards which would break pack=
age feeds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+e0=
9a859199-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2-tools went backwards which would break package =
feeds from (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+e09a85=
9199-r0.0) [version-going-backwards]
qtquickcontrols2-5.7.99+5.8.0-beta+gitAUTOINC+e09a859199: Package version f=
or package qtquickcontrols2 went backwards which would break package feeds =
=66rom (0:5.8.0+git0+e09a859199-r0.0 to 0:5.7.99+5.8.0-beta+git0+e09a859199=
-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-dbg went backwards which would break package feed=
s from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3bc99dd69f=
-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-dev went backwards which would break package feed=
s from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3bc99dd69f=
-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-doc went backwards which would break package feed=
s from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3bc99dd69f=
-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-examples-dbg went backwards which wod69f-r0.0) [v=
ersion-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-plugins-dbg went backwards which would break pack=
age feeds from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3b=
c99dd69f-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-plugins went backwards which would break package =
feeds from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3bc99d=
d69f-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-qmldesigner went backwards which would break pack=
age feeds from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3b=
c99dd69f-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-qmlplugins-dbg went backwards which would break p=
ackage feeds from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0=
+3bc99dd69f-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-qmlplugins went backwards which would break packa=
ge feeds from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3bc=
99dd69f-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-staticdev went backwards which would break packag=
e feeds from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3bc9=
9dd69f-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-tools-dbg went backwards which would break packag=
e feeds from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3bc9=
9dd69f-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols-tools went backwards which would break package fe=
eds from (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3bc99dd6=
9f-r0.0) [version-going-backwards]
qtquickcontrols-5.7.99+5.8.0-beta+gitAUTOINC+3bc99dd69f: Package version fo=
r package qtquickcontrols went backwards which would break package feeds fr=
om (0:5.8.0+git0+3bc99dd69f-r0.0 to 0:5.7.99+5.8.0-beta+git0+3bc99dd69f-r0.=
0) [version-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript-dbg went backwards which would break package feeds from (0:5.8.=
0+git0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+89e980b8e0-r0.0) [versio=
n-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript-dev went backwards which would break package feeds from (0:5.8.=
0+git0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+89e980b8e0-r0.0) [versio=
n-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript-doc went backwards which would break package feeds from (0:5.8.=
0+git0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+89e980b8e0-r0.0) [versio=
n-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript-examples-dbg went backwards which would break package feeds fro=
m (0:5.8.0+git0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+89e980b8e0-r0.0=
) [version-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript-examples-dev went backwards which would break package feeds fro=
m (0:5.8.0+git0+89e980b8e0-r0.0 to 0:5.7.9nt backwards which would break pa=
ckage feeds from (0:5.8.0+git0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+=
89e980b8e0-r0.0) [version-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript-qmlplugins-dbg went backwards which would break package feeds f=
rom (0:5.8.0+git0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+89e980b8e0-r0=
=2E0) [version-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript-qmlplugins went backwards which would break package feeds from =
(0:5.8.0+git0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+89e980b8e0-r0.0) =
[version-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript-staticdev went backwards which would break package feeds from (=
0:5.8.0+git0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+89e980b8e0-r0.0) [=
version-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript-tools-dbg went backwards which would break package feeds from (=
0:5.8.0+git0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+89e980b8e0-r0.0) [=
version-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript-tools went backwards which would break package feeds from (0:5.=
8.0+git0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+89e980b8e0-r0.0) [vers=
ion-going-backwards]
qtscript-5.7.99+5.8.0-beta+gitAUTOINC+89e980b8e0: Package version for packa=
ge qtscript went backwards which would break package feeds from (0:5.8.0+gi=
t0+89e980b8e0-r0.0 to 0:5.7.99+5.8.0-beta+git0+89e980b8e0-r0.0) [version-go=
ing-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-dbg went backwards which would break package feeds from (0:5.=
8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0.0) [vers=
ion-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-dev went backwards which would break package feeds from (0:5.=
8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0.0) [vers=
ion-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-doc went backwards which would break package feeds from (0:5.=
8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0.0) [vers=
ion-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-examples-dbg went backwards which would break package feeds f=
rom (0:5.8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0=
=2E0) [version-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-examples-dev went backwards which would break package feeds f=
rom (0:5.8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0=
=2E0) [version-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-examples-staticdev went backwards which would break package f=
eeds from (0:5.8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46=
142-r0.0) [version-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-examples went backwards which would break package feeds from =
(0:5.8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0.0) =
[version-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-locale went backwards which would break package feeds from (0=
:5.8.0+git0+8065e46142-r0.0 to a+git0+8065e46142-r0.0) [version-going-backw=
ards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-qmlplugins-dbg went backwards which would break package feeds=
 from (0:5.8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-=
r0.0) [version-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-qmlplugins went backwards which would break package feeds fro=
m (0:5.8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0.0=
) [version-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-staticdev went backwards which would break package feeds from=
 (0:5.8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0.0)=
 [version-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-tools-dbg went backwards which would break package feeds from=
 (0:5.8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0.0)=
 [version-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors-tools went backwards which would break package feeds from (0:=
5.8.0+git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0.0) [ve=
rsion-going-backwards]
qtsensors-5.7.99+5.8.0-beta+gitAUTOINC+8065e46142: Package version for pack=
age qtsensors went backwards which would break package feeds from (0:5.8.0+=
git0+8065e46142-r0.0 to 0:5.7.99+5.8.0-beta+git0+8065e46142-r0.0) [version-=
going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-dbg went backwards which would break package feeds from (=
0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd-r0.0) [=
version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-dev went backwards which would break package feeds from (=
0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd-r0.0) [=
version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-doc went backwards which would break package feeds from (=
0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd-r0.0) [=
version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-examples-dbg went backwards which would break package fee=
ds from (0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcf=
d-r0.0) [version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-examples-dev went backwards which would break package fee=
ds from (0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcf=
d-r0.0) [version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-examples-staticdev went backwards which would break packa=
ge feeds from (0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4=
bd5bcfd-r0.0) [version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-examples went backwards which would break package feeds f=
rom (0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd-r0=
=2E0) [version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-locale went backwards which would break package feeds fro=
m (0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd-r0.0=
) [version-going-g went backwards which would break package feeds from (0:5=
=2E8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd-r0.0) [v=
ersion-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-qmlplugins went backwards which would break package feeds=
 from (0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd-=
r0.0) [version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-staticdev went backwards which would break package feeds =
=66rom (0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd=
-r0.0) [version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-tools-dbg went backwards which would break package feeds =
=66rom (0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd=
-r0.0) [version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus-tools went backwards which would break package feeds from=
 (0:5.8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd-r0.0)=
 [version-going-backwards]
qtserialbus-5.7.99+5.8.0-beta+gitAUTOINC+8e4bd5bcfd: Package version for pa=
ckage qtserialbus went backwards which would break package feeds from (0:5.=
8.0+git0+8e4bd5bcfd-r0.0 to 0:5.7.99+5.8.0-beta+git0+8e4bd5bcfd-r0.0) [vers=
ion-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-dbg went backwards which would break package feeds from=
 (0:5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a247-r0.0)=
 [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-dev went backwards which would break package feeds from=
 (0:5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a247-r0.0)=
 [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-doc went backwards which would break package feeds from=
 (0:5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a247-r0.0)=
 [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-examples-dbg went backwards which would break package f=
eeds from (0:5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a=
247-r0.0) [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-examples-dev went backwards which would break package f=
eeds from (0:5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a=
247-r0.0) [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-examples-staticdev went backwards which would break pac=
kage feeds from (0:5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e=
2a658a247-r0.0) [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-examples went backwards which would break package feeds=
 from (0:5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a247-=
r0.0) [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-locale went backwards which would break package feeds f=
rom (0:5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a247-r0=
=2E0) [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-mkspecs we version for package qtserialport-staticdev w=
ent backwards which would break package feeds from (0:5.8.0+git0+e2a658a247=
-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a247-r0.0) [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-tools-dbg went backwards which would break package feed=
s from (0:5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a247=
-r0.0) [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport-tools went backwards which would break package feeds fr=
om (0:5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a247-r0.=
0) [version-going-backwards]
qtserialport-5.7.99+5.8.0-beta+gitAUTOINC+e2a658a247: Package version for p=
ackage qtserialport went backwards which would break package feeds from (0:=
5.8.0+git0+e2a658a247-r0.0 to 0:5.7.99+5.8.0-beta+git0+e2a658a247-r0.0) [ve=
rsion-going-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-dbg went backwards which would break package feeds from (0:5.8.0+git0=
+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0) [version-goin=
g-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-dev went backwards which would break package feeds from (0:5.8.0+git0=
+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0) [version-goin=
g-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-doc went backwards which would break package feeds from (0:5.8.0+git0=
+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0) [version-goin=
g-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-examples-dbg went backwards which would break package feeds from (0:5=
=2E8.0+git0+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0) [v=
ersion-going-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-examples-dev went backwards which would break package feeds from (0:5=
=2E8.0+git0+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0) [v=
ersion-going-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-examples-staticdev went backwards which would break package feeds fro=
m (0:5.8.0+git0+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0=
) [version-going-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-examples went backwards which would break package feeds from (0:5.8.0=
+git0+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0) [version=
-going-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-locale went backwards which would break package feeds from (0:5.8.0+g=
it0+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0) [version-g=
oing-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-mkspecs went backwards which would break package feeds from (0:5.8.0+=
git0+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0) [version-=
going-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-plugins-dbg went backwards which would break package feeds from (0:5.=
8.0+git0+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0) [vers=
ion-going-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg-plugins went backwards which would break package feeds from (0:5.8.0+=
git0+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+9+5.8.0-beta+gitAUTOINC+5a00abd=
efd: Package version for package qtsvg-tools went backwards which would bre=
ak package feeds from (0:5.8.0+git0+5a00abdefd-r0.0 to 0:5.7.99+5.8.0-beta+=
git0+5a00abdefd-r0.0) [version-going-backwards]
qtsvg-5.7.99+5.8.0-beta+gitAUTOINC+5a00abdefd: Package version for package =
qtsvg went backwards which would break package feeds from (0:5.8.0+git0+5a0=
0abdefd-r0.0 to 0:5.7.99+5.8.0-beta+git0+5a00abdefd-r0.0) [version-going-ba=
ckwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-dbg went backwards which would break package feeds from (0:5.=
8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.0) [vers=
ion-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-dev went backwards which would break package feeds from (0:5.=
8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.0) [vers=
ion-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-doc went backwards which would break package feeds from (0:5.=
8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.0) [vers=
ion-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-examples-dbg went backwards which would break package feeds f=
rom (0:5.8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0=
=2E0) [version-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-examples-dev went backwards which would break package feeds f=
rom (0:5.8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0=
=2E0) [version-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-examples-staticdev went backwards which would break package f=
eeds from (0:5.8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af78=
9f0-r0.0) [version-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-examples went backwards which would break package feeds from =
(0:5.8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.0) =
[version-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-locale went backwards which would break package feeds from (0=
:5.8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.0) [v=
ersion-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-mkspecs went backwards which would break package feeds from (=
0:5.8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.0) [=
version-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-plugins-dbg went backwards which would break package feeds fr=
om (0:5.8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.=
0) [version-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-plugins went backwards which would break package feeds from (=
0:5.8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.0) [=
version-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-qmldesigner went backwards which would break package feeds fr=
om (0:5.8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.=
0) [version-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-qmlplugins-dbg on-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems-tools went backwards which would break package feeds from (0:=
5.8.0+git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.0) [ve=
rsion-going-backwards]
qtsystems-5.7.99+5.8.0-beta+gitAUTOINC+434af789f0: Package version for pack=
age qtsystems went backwards which would break package feeds from (0:5.8.0+=
git0+434af789f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+434af789f0-r0.0) [version-=
going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-dbg went backwards which would break package feeds from (0:5.8.0+=
git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) [version-=
going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-dev went backwards which would break package feeds from (0:5.8.0+=
git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) [version-=
going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-doc went backwards which would break package feeds from (0:5.8.0+=
git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) [version-=
going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-examples-dbg went backwards which would break package feeds from =
(0:5.8.0+git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) =
[version-going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-examples-dev went backwards which would break package feeds from =
(0:5.8.0+git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) =
[version-going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-examples-staticdev went backwards which would break package feeds=
 from (0:5.8.0+git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-=
r0.0) [version-going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-examples went backwards which would break package feeds from (0:5=
=2E8.0+git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) [v=
ersion-going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-locale went backwards which would break package feeds from (0:5.8=
=2E0+git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) [ver=
sion-going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-mkspecs went backwards which would break package feeds from (0:5.=
8.0+git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) [vers=
ion-going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-plugins-dbg went backwards which would break package feeds from (=
0:5.8.0+git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) [=
version-going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-plugins went backwards which would break package feeds from (0:5.=
8.0+git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) [vers=
ion-going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-qmldesigner went backwards which would break package feeds from (=
0:5.8.0+git0+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) [=
version-going-backwards]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools-qmlplugins-dbg went ds]
qttools-5.7.99+5.8.0-beta+gitAUTOINC+b8113e90e2: Package version for packag=
e qttools went backwards which would break package feeds from (0:5.8.0+git0=
+b8113e90e2-r0.0 to 0:5.7.99+5.8.0-beta+git0+b8113e90e2-r0.0) [version-goin=
g-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-assistant went backwards which would break package =
feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b1=
05fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-dbg went backwards which would break package feeds =
=66rom (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b105fb=
-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-designer went backwards which would break package f=
eeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b10=
5fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-dev went backwards which would break package feeds =
=66rom (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b105fb=
-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-doc went backwards which would break package feeds =
=66rom (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b105fb=
-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-examples-dbg went backwards which would break packa=
ge feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f=
3b105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-examples-dev went backwards which would break packa=
ge feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f=
3b105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-examples-staticdev went backwards which would break=
 package feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+gi=
t0+64f3b105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-examples went backwards which would break package f=
eeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b10=
5fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-linguist went backwards which would break package f=
eeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b10=
5fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-locale went backwards which would break package fee=
ds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b105f=
b-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-mkspecs went backwards which would break package fe=
eds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b105=
fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-plugins-dbg went backwards which would break packag=
e feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.ckage feeds from=
 (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b105fb-r0.0)=
 [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qmlviewer went backwards which would break package =
feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b1=
05fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtbase went backwards which would break package fee=
ds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b105f=
b-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtconfig went backwards which would break package f=
eeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b10=
5fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtconnectivity went backwards which would break pac=
kage feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+6=
4f3b105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtdeclarative went backwards which would break pack=
age feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64=
f3b105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qthelp went backwards which would break package fee=
ds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b105f=
b-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtlocation went backwards which would break package=
 feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b=
105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtmultimedia went backwards which would break packa=
ge feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f=
3b105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtquick1 went backwards which would break package f=
eeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b10=
5fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtquickcontrols2 went backwards which would break p=
ackage feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0=
+64f3b105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtquickcontrols went backwards which would break pa=
ckage feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+=
64f3b105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtscript went backwards which would break package f=
eeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b10=
5fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-qtserialport went backwards which would break packa=
ge feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f=
3b105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOls-dbg went backwards which would b=
reak package feeds from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-bet=
a+git0+64f3b105fb-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations-tools went backwards which would break package feed=
s from (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b105fb=
-r0.0) [version-going-backwards]
qttranslations-5.7.99+5.8.0-beta+gitAUTOINC+64f3b105fb: Package version for=
 package qttranslations went backwards which would break package feeds from=
 (0:5.8.0+git0+64f3b105fb-r0.0 to 0:5.7.99+5.8.0-beta+git0+64f3b105fb-r0.0)=
 [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-dbg went backwards which would break package =
feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+git0+947a55=
149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-dev went backwards which would break package =
feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+git0+947a55=
149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-dictionaries went backwards which would break=
 package feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+gi=
t0+947a55149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-doc went backwards which would break package =
feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+git0+947a55=
149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-examples-dbg went backwards which would break=
 package feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+gi=
t0+947a55149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-examples-dev went backwards which would break=
 package feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+gi=
t0+947a55149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-examples-staticdev went backwards which would=
 break package feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-b=
eta+git0+947a55149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-examples went backwards which would break pac=
kage feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+git0+9=
47a55149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-locale went backwards which would break packa=
ge feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+git0+947=
a55149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-mkspecs went backwards which would break pack=
age feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+git0+94=
7a55149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-plugins-dbg went backwards which would break =
package feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+git=
0+947a55149a-r0ols-dbg went backwards which would break package feeds from =
(0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+git0+947a55149a-r0.0) =
[version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard-tools went backwards which would break packag=
e feeds from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+git0+947a=
55149a-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.7.99+5.8.0-beta+gitAUTOINC+947a55149a: Package version =
for package qtvirtualkeyboard went backwards which would break package feed=
s from (0:5.8.0+git0+947a55149a-r0.0 to 0:5.7.99+5.8.0-beta+git0+947a55149a=
-r0.0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-dbg went backwards which would break package feeds from=
 (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a8531e-r0.0)=
 [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-dev went backwards which would break package feeds from=
 (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a8531e-r0.0)=
 [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-doc went backwards which would break package feeds from=
 (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a8531e-r0.0)=
 [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-examples-dbg went backwards which would break package f=
eeds from (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a85=
31e-r0.0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-examples-dev went backwards which would break package f=
eeds from (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a85=
31e-r0.0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-examples-staticdev went backwards which would break pac=
kage feeds from (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+b=
f66a8531e-r0.0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-examples went backwards which would break package feeds=
 from (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a8531e-=
r0.0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-locale went backwards which would break package feeds f=
rom (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a8531e-r0=
=2E0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-mkspecs went backwards which would break package feeds =
=66rom (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a8531e=
-r0.0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-plugins-dbg went backwards which would break package fe=
eds from (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a853=
1e-r0.0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-plugins went backwards which would break package feeds =
=66rom (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a8531e=
-r0.0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version foch =
would break package feeds from (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.=
8.0-beta+git0+bf66a8531e-r0.0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel-tools went backwards which would break package feeds fr=
om (0:5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a8531e-r0.=
0) [version-going-backwards]
qtwebchannel-5.7.99+5.8.0-beta+gitAUTOINC+bf66a8531e: Package version for p=
ackage qtwebchannel went backwards which would break package feeds from (0:=
5.8.0+git0+bf66a8531e-r0.0 to 0:5.7.99+5.8.0-beta+git0+bf66a8531e-r0.0) [ve=
rsion-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-dbg went backwards which would break package f=
eeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.0-beta+g=
it0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-dev went backwards which would break package f=
eeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.0-beta+g=
it0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-doc went backwards which would break package f=
eeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.0-beta+g=
it0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-examples-dbg went backwards which would break =
package feeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8=
=2E0-beta+git0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-examples-dev went backwards which would break =
package feeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8=
=2E0-beta+git0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-examples-staticdev went backwards which would =
break package feeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.=
99+5.8.0-beta+git0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-examples went backwards which would break pack=
age feeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.0-b=
eta+git0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-locale went backwards which would break packag=
e feeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.0-bet=
a+git0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-mkspecs went backwards which would break packa=
ge feeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.0-be=
ta+git0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-plugins-dbg went backwards which would break p=
ackage feeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.=
0-beta+git0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: rom (0:5.8.=
0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.0-beta+git0+ac3d8780a0_f3=
ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-tools-dbg went backwards which would break pac=
kage feeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.0-=
beta+git0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine-tools went backwards which would break package=
 feeds from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.0-beta=
+git0+ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebengine-5.7.99+5.8.0-beta+gitAUTOINC+ac3d8780a0_f3ce802c71: Package ver=
sion for package qtwebengine went backwards which would break package feeds=
 from (0:5.8.0+git0+ac3d8780a0_f3ce802c71-r0.0 to 0:5.7.99+5.8.0-beta+git0+=
ac3d8780a0_f3ce802c71-r0.0) [version-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-dbg went backwards which would break package feeds from (0:5.8.=
0+git0+431520f150-r0.0 to 0:5.7.99+5.8.0-beta+git0+431520f150-r0.0) [versio=
n-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-dev went backwards which would break package feeds from (0:5.8.=
0+git0+431520f150-r0.0 to 0:5.7.99+5.8.0-beta+git0+431520f150-r0.0) [versio=
n-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-doc went backwards which would break package feeds from (0:5.8.=
0+git0+431520f150-r0.0 to 0:5.7.99+5.8.0-beta+git0+431520f150-r0.0) [versio=
n-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-locale went backwards which would break package feeds from (0:5=
=2E8.0+git0+431520f150-r0.0 to 0:5.7.99+5.8.0-beta+git0+431520f150-r0.0) [v=
ersion-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-mkspecs went backwards which would break package feeds from (0:=
5.8.0+git0+431520f150-r0.0 to 0:5.7.99+5.8.0-beta+git0+431520f150-r0.0) [ve=
rsion-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-plugins-dbg went backwards which would break package feeds from=
 (0:5.8.0+git0+431520f150-r0.0 to 0:5.7.99+5.8.0-beta+git0+431520f150-r0.0)=
 [version-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-plugins went backwards which would break package feeds from (0:=
5.8.0+git0+431520f150-r0.0 to 0:5.7.99+5.8.0-beta+git0+431520f150-r0.0) [ve=
rsion-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-qmldesigner went backwards which would break package feeds from=
 (0:5.8.0+git0+431520f150-r0.0 to 0:5.7.99+5.8.0-beta+git0+431520f150-r0.0)=
 [version-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-qmlplugins-dbg went backwards which would break package feeds f=
rom (0:5.8.0+git0+431520f150-r0.0 to 0:5.7.99+5.8.0-beta+git0+431520f150-r0=
=2E0) [version-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-qmlplugins went backwards which would break package feeds from =
(0:5.8.0+git0+431520f150-r0.0 to 0:5.7.99+5.8.0-beta+git0+431520f150-r0.0) =
[version-going-backwards]
qtwebkit-5.7.99+5.8.0-beta+gitAUTOINC+431520f150: Package version for packa=
ge qtwebkit-staticdev went backwards which w56: Package version for package=
 qtwebkit-examples-dev went backwards which would break package feeds from =
(0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+git0+1a839b5056-r0.0) =
[version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-doc went backwards which would break package =
feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+git0+1a839b=
5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-examples-dbg went backwards which would break=
 package feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+gi=
t0+1a839b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-examples-dev went backwards which would break=
 package feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+gi=
t0+1a839b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-examples-staticdev went backwards which would=
 break package feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-b=
eta+git0+1a839b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-examples went backwards which would break pac=
kage feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+git0+1=
a839b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-locale went backwards which would break packa=
ge feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+git0+1a8=
39b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-mkspecs went backwards which would break pack=
age feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+git0+1a=
839b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-plugins-dbg went backwards which would break =
package feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+git=
0+1a839b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-plugins went backwards which would break pack=
age feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+git0+1a=
839b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-qmldesigner went backwards which would break =
package feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+git=
0+1a839b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-qmlplugins-dbg went backwards which would bre=
ak package feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+=
git0+1a839b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-qmlplugins went backwards which would break p=
ackage feeds from (0:5.8.0+git0+1a839b5056-r0.0 to 0:5.7.99+5.8.0-beta+git0=
+1a839b5056-r0.0) [version-going-backwards]
qtwebkit-examples-5.7.99+5.8.0-beta+gitAUTOINC+1a839b5056: Package version =
for package qtwebkit-examples-staticdev went backwards which would break pa=
 feeds from (0:5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb13=
85483-r0.0) [version-going-backwards]
qtwebsockets-5.7.99+5.8.0-beta+gitAUTOINC+ccb1385483: Package version for p=
ackage qtwebsockets-mkspecs went backwards which would break package feeds =
=66rom (0:5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb1385483=
-r0.0) [version-going-backwards]
qtwebsockets-5.7.99+5.8.0-beta+gitAUTOINC+ccb1385483: Package version for p=
ackage qtwebsockets-plugins-dbg went backwards which would break package fe=
eds from (0:5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb13854=
83-r0.0) [version-going-backwards]
qtwebsockets-5.7.99+5.8.0-beta+gitAUTOINC+ccb1385483: Package version for p=
ackage qtwebsockets-plugins went backwards which would break package feeds =
=66rom (0:5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb1385483=
-r0.0) [version-going-backwards]
qtwebsockets-5.7.99+5.8.0-beta+gitAUTOINC+ccb1385483: Package version for p=
ackage qtwebsockets-qmldesigner went backwards which would break package fe=
eds from (0:5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb13854=
83-r0.0) [version-going-backwards]
qtwebsockets-5.7.99+5.8.0-beta+gitAUTOINC+ccb1385483: Package version for p=
ackage qtwebsockets-qmlplugins-dbg went backwards which would break package=
 feeds from (0:5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb13=
85483-r0.0) [version-going-backwards]
qtwebsockets-5.7.99+5.8.0-beta+gitAUTOINC+ccb1385483: Package version for p=
ackage qtwebsockets-qmlplugins went backwards which would break package fee=
ds from (0:5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb138548=
3-r0.0) [version-going-backwards]
qtwebsockets-5.7.99+5.8.0-beta+gitAUTOINC+ccb1385483: Package version for p=
ackage qtwebsockets-staticdev went backwards which would break package feed=
s from (0:5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb1385483=
-r0.0) [version-going-backwards]
qtwebsockets-5.7.99+5.8.0-beta+gitAUTOINC+ccb1385483: Package version for p=
ackage qtwebsockets-tools-dbg went backwards which would break package feed=
s from (0:5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb1385483=
-r0.0) [version-going-backwards]
qtwebsockets-5.7.99+5.8.0-beta+gitAUTOINC+ccb1385483: Package version for p=
ackage qtwebsockets-tools went backwards which would break package feeds fr=
om (0:5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb1385483-r0.=
0) [version-going-backwards]
qtwebsockets-5.7.99+5.8.0-beta+gitAUTOINC+ccb1385483: Package version for p=
ackage qtwebsockets went backwards which would break package feeds from (0:=
5.8.0+git0+ccb1385483-r0.0 to 0:5.7.99+5.8.0-beta+git0+ccb1385483-r0.0) [ve=
rsion-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-dbg went backwards which would break package feeds from (=
0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091-r0.0) [=
version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-dev went backwards which would break package feeds from (=
0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091-r0.0) [=
version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-doc went backwards which would break package feeds from (=
0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091-r0.0) [=
version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-examples-dbg went backwards which would break package fee=
rsion-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-examples-dev went backwards which would break package fee=
ds from (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f9121809=
1-r0.0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-examples-staticdev went backwards which would break packa=
ge feeds from (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f9=
1218091-r0.0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-examples went backwards which would break package feeds f=
rom (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091-r0=
=2E0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-locale went backwards which would break package feeds fro=
m (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091-r0.0=
) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-mkspecs went backwards which would break package feeds fr=
om (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091-r0.=
0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-plugins-dbg went backwards which would break package feed=
s from (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091=
-r0.0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-plugins went backwards which would break package feeds fr=
om (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091-r0.=
0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-qmldesigner went backwards which would break package feed=
s from (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091=
-r0.0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-qmlplugins-dbg went backwards which would break package f=
eeds from (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218=
091-r0.0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-qmlplugins went backwards which would break package feeds=
 from (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091-=
r0.0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-staticdev went backwards which would break package feeds =
=66rom (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091=
-r0.0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-tools-dbg went backwards which would break package feeds =
=66rom (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091=
-r0.0) [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras-tools went backwards which would break package feeds from=
 (0:5.8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091-r0.0)=
 [version-going-backwards]
qtx11extras-5.7.99+5.8.0-beta+gitAUTOINC+0f91218091: Package version for pa=
ckage qtx11extras went backwards which would break package feeds from (0:5.=
8.0+git0+0f91218091-r0.0 to 0:5.7.99+5.8.0-beta+git0+0f91218091-r0.0) [v.0-=
beta+gitAUTOINC+977d0fb3f0: Package version for package qtxmlpatterns-examp=
les-staticdev went backwards which would break package feeds from (0:5.8.0+=
git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0fb3f0-r0.0) [version-=
going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-examples went backwards which would break package fee=
ds from (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0fb3f=
0-r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-locale went backwards which would break package feeds=
 from (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0fb3f0-=
r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-mkspecs went backwards which would break package feed=
s from (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0fb3f0=
-r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-plugins-dbg went backwards which would break package =
feeds from (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0f=
b3f0-r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-plugins went backwards which would break package feed=
s from (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0fb3f0=
-r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-qmldesigner went backwards which would break package =
feeds from (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0f=
b3f0-r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-qmlplugins-dbg went backwards which would break packa=
ge feeds from (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977=
d0fb3f0-r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-qmlplugins went backwards which would break package f=
eeds from (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0fb=
3f0-r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-staticdev went backwards which would break package fe=
eds from (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0fb3=
f0-r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-tools-dbg went backwards which would break package fe=
eds from (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0fb3=
f0-r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns-tools went backwards which would break package feeds =
=66rom (0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0fb3f0=
-r0.0) [version-going-backwards]
qtxmlpatterns-5.7.99+5.8.0-beta+gitAUTOINC+977d0fb3f0: Package version for =
package qtxmlpatterns went backwards which would break package feeds from (=
0:5.8.0+git0+977d0fb3f0-r0.0 to 0:5.7.99+5.8.0-beta+git0+977d0fb3f0-r0.0) [=
version-going-backwards]


count: 1	issue: host-user-contaminated
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-so-so/usr/lib/loc=
ale/so_SO/LC_CTYPE is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host conluded in master yet) - meta-openemb=
edded =3D=3D
latest upstream commit:=20
ac2abd4 python-pycparser: update to version 2.17
not included in master yet:=20
4f50b30 lksctp-tools: 1.0.16 -> 1.0.17
e73836f drbd-utils: 8.9.3 -> 8.9.6
6f7392e squid: disable gnu atomic operations for mipsel
f5bf953 chrony: remove unrecognized option ipv6
19fc83a opensaf: fix QA Issue
39086af tsock: Make use of LDFLAGS
749d279 fwknop: Initial add 2.6.9
7bb7db2 samba: Fix build with musl
73035d2 ifenslave: make option '-h' work
b2b491e libowfat: add v0.31
18cc24b samba: Fix qa issue and update ctdb-tests
d25b4b5 samba: correct sub-package name for multilib
f179234 curlpp: fix qa issue of do_configure
4361461 ncp: add v1.2.4
f44a5a1 syslog-ng: don't use update-alternatives to manage init script
a7b26c8 rsyslog: don't use update-alternatives to manage init script
96187f7 dnsmasq: read the conf files found in dnsmasq.d
6877c80 dnsmasq: allow for dnsmasq instances to reuse default dnsmasq.conf
3c98c3e net-snmp: fix snmptrap to use clientaddr from snmp.conf.
17f1793 net-snmp: snmplib, UDPIPv6 transport: Add a missing return statement
c7de532 nis, opencv: Update getVar/setVar syntax
6c9a996 libqmi: Fix build with clang
b5f1407 kodi: Add krypton/17.x Jarvis/16.x recipes
aca836c libvdpau: Add recipe
d3b8ad2 libvdpau: Disable PIE
b444f24 kodi: Fix build with pic on x86_64
7ba4038 kodi-17: Add packageconfig for lcms support
ee6fdea kodi-17: Fix build with musl
9ae9b81 breakpad: Upgrade to latest
c2331c9 xfsprogs: Upgrade 3.2.3 -> 4.8.0
94787f9 arno-iptables-firewall: Add recipe
6bffa1f dibbler: Add recipe
697b7af ez-ipupdate: Add recipe
409daf6 miniupnpd: Add recipe
7fa2470 inetutils: Disable rsh,rcp,rlogin on musl
386478a ssmtp: Add recipe
df2bba8 ne10: Update to latest
fe1a6dd libgit2: Update to 0.24.3
8701904 openldap: Fix Build error due to missing -fPIC
e7e10f7 dante: Add recipe for 1.4.1
22af005 networkmanager-openvpn: Update 1.0.8->1.2.6
d998f9a openobex,obexftp: Update recipes
f5a08a8 md5deep: Fix build with clang
a3471e9 dialog: Update 1.3-20160424 -> 1.3-20160828
7e81cc4 ipsec-tools: Fix build with clang
95d318e crda: Fix build with clang
212a11f obex-data-server: Fix build with new openobex version
184cc80 flashrom: Remove redundant const qualifier
50dec91 fribidi: Fix build with security flags turned on
0945b3d jsoncpp: Add new recipe
ea8ba70 jsonrpc: Add recipe
b6484ee libmad: Fix build with clang
7bb6b77 modemmanager: Fix build with clang
76a99ee libcec: Add missing dep on ncurses
86feda5 kodi-17: Update to latest
31b3e2b tvheadend: Update to 4.0.9
6ad96b4 memcached: Update to 1.4.33
96dbe71 vlc: Add packageconfig for vdpau
df97b80 mpv: Add libvdpau to DEPENDS
d24f36b vala-dbus-binding-tool: remove redundant dependency on intltool
7bbcd0e meta-oe: add explicit dependencies on gnome-common
98fdcd7 meta-gnome: remove redundant gnome-common dependencies
3bde80e meta-gnome: add explicit gnome-common dependencies
cfecd2c xserver-nodm-init-2.0: Remove recipe
1878155 xserver-common: Don't install some Xsession files

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
81fb771 Update Qt5's git repositories to match new locations
not included in master yet:=20
c0c461f Upgrade to Qt 5.8
f89f8f2 qtwebengine: use QT_GIT_PROTOCOL variable

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
1edcce7 chromium-wayland: skip when CHROMIUM_ENABLE_WAYLAND isn't enabled
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
e1432c6 libqofono: use the recipe from meta-qt5
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
176f337  linux-hp-tenderloin: Update kernel
not included in master yet:=20
0ad046f meta-fso: replace deprecated bb.data.getVar('PV',d,1) with d.getVar=
('PV', True)


--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDjQXAAKCRA3VSO3ZXaA
HIZuAKC6s3Wdc3Bfvicx+UjVaY8HZqyE6QCeIeS58fYENCl9D+cP+b0BKYVAU+8=
=d8mi
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
