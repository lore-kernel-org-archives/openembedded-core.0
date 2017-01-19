Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1BBD471B50;
	Thu, 19 Jan 2017 11:43:40 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so11371117wmi.1;
	Thu, 19 Jan 2017 03:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=TexdYuYuUB4HJVmSMM/X5IAJQYSB3QTaSGqowo0B0BM=;
	b=TLGaq+8zKAD9DTEgopmYazJ+cS+ZpIXpL/O/VN9ZEQlQSfBk/m618yTTmOJ7bU2cx7
	xMRfHNJd1XcR5jL7Dozmvc6QEPwEIjMA8BoDsrhkqn7n6idhj8lIFQlYZpA3TsguIY/h
	A7mKQ7XuzHRvEqJSE9i6AhJUiF6aJFyRWqUHSa81j8mTd+gWsFB7No6/MstaddBXCY3m
	FYcBx09lKDepUsxr35kb2ammdQJIsdPtmNncziXdwfek+elZtYV56xjU+NxtAbGQ4q1Y
	613L1QTijj6/a01I4ltLw6+xCAwrVnuNCCOxlPY9/AUocdkOy3NPDPHtnm/yCOAsJoUq
	wEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=TexdYuYuUB4HJVmSMM/X5IAJQYSB3QTaSGqowo0B0BM=;
	b=qmlWD4zsCBOQRRoODYSfwOqO2Cb4GwZjHCS0Wq5L8c68ZVjZIG/GjRXKq9ZLg2v9ct
	7iqOziHqolq2vP300GcE8s8yBzb6noUJgCO5rvJZV4PUgOglsNHTtC2unSKfT0l6PYJ0
	C+m/HZEFGASw8aJL/GgrR3HZjPeqTX6/FffRDDKNEGH5PZxh/6inW/Fu9VTZTPMBYezN
	d3zbRf+p2Y75vh9HtZD4uPzbHZnYKXMSyGvO+rgQhVK3tp/XFaq0w4tk91rt5QfYeAb6
	HBBgCt7AF5omsCEIu/6W3qnJo9RerQN35OKles6rMkxo2mAi/saj8nzFTjzn68HbQqfq
	EvNw==
X-Gm-Message-State: AIkVDXLF/QKGFQE2gdJYLRLxM2e8IvCvu3kxuGki9V7j1a3Rkoxejumvgfn9KbkZq14bGg==
X-Received: by 10.28.43.129 with SMTP id r123mr10077633wmr.120.1484826220229; 
	Thu, 19 Jan 2017 03:43:40 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	191sm12256241wmo.21.2017.01.19.03.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jan 2017 03:43:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jan 2017 12:43:41 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170119114341.GE3265@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-01-15
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
X-List-Received-Date: Thu, 19 Jan 2017 11:43:41 -0000
X-Groupsio-MsgNum: 91902
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline

--TD8GDToEDw0WLGOL
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
||2017-01-15	||7	||8	||7	||15	||7	||7	||17	||8	||8	||0	||0		||0		||3		||2		=
||7		||0		||1		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-01-15 =3D=3D

INFO: jenkins-job.sh-1.8.12 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170119_013902.log

=3D=3D=3D common (6) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb=
:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/chromium-utils/chromium-ut=
ils.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-gla=
mo_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.2.bb:do_com=
pile
    * meta-openembedded/meta-webserver/recipes-php/xdebug/xdebug_2.2.6.bb:d=
o_compile
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb:do_configure

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nou=
veau_1.0.12.bb:do_compile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:do_compi=
le

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (22) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170114_033204.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/28601/
|-
|| qemux86 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170114_033144.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/28602/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170115_060811.log/ || http://errors.yoctoproject.or=
g/Errors/Build/28827/
|}

=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D

=3D=3D=3D QA issues (13) =3D=3D=3D
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
||0	||version-going-backwards
|-
||1	||host-user-contaminated
|-
||2	||build-deps
|-
||3	||textrel
|-
||7	||file-rdeps
|}



=3D=3D=3D Failed dependencies for qemuarm (15) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170115_042610.log/
Found differences:=20
Found errors:=20
    * ERROR: 15 issues were found in these recipes: chromium-utils kodi ope=
ncv pmbw qtwayland xdebug xf86-video-glamo

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (7) =3D=3D=
=3D
    * chromium-utils -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170115_042610.log//2_max/failed/chromium-utils.=
log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170115_042610.log//2_max/failed/kodi.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170115_042610.log//2_max/failed/opencv.log
    * pmbw -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170115_042610.log//2_max/failed/pmbw.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170115_042610.log//2_max/failed/qtwayland.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170115_042610.log//2_max/failed/xdebug.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170115_042610.log//2_max/failed/xf86-video-gl=
amo.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (7) =3D=3D=
=3D
    * chromium-utils -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20170115_042610.log//3_min/failed/chromium-utils.=
log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170115_042610.log//3_min/failed/kodi.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170115_042610.log//3_min/failed/opencv.log
    * pmbw -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20170115_042610.log//3_min/failed/pmbw.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20170115_042610.log//3_min/failed/qtwayland.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20170115_042610.log//3_min/failed/xdebug.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20170115_042610.log//3_min/failed/xf86-video-gl=
amo.log

=3D=3D=3D Failed dependencies for qemux86 (17) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170116_061328.log/
Found differences:=20
Found errors:=20
    * ERROR: 17 issues were found in these recipes: chromium-utils kodi ope=
ncv qtwayland qtwebengine xdebug xf86-video-glamo xf86-video-nouveau

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (8) =3D=3D=
=3D
    * chromium-utils -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20170116_061328.log//2_max/failed/chromium-utils.=
log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170116_061328.log//2_max/failed/kodi.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170116_061328.log//2_max/failed/opencv.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20170116_061328.log//2_max/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20170116_061328.log//2_max/failed/qtwebengine.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170116_061328.log//2_max/failed/xdebug.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20170116_061328.log//2_max/failed/xf86-video-gl=
amo.log
    * xf86-video-nouveau -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemux86.20170116_061328.log//2_max/failed/xf86-video-=
nouveau.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (8) =3D=3D=
=3D
    * chromium-utils -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20170116_061328.log//3_min/failed/chromium-utils.=
log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20170116_061328.log//3_min/failed/kodi.log
    * opencv -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170116_061328.log//3_min/failed/opencv.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20170116_061328.log//3_min/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20170116_061328.log//3_min/failed/qtwebengine.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20170116_061328.log//3_min/failed/xdebug.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20170116_061328.log//3_min/failed/xf86-video-gl=
amo.log
    * xf86-video-nouveau -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemux86.20170116_061328.log//3_min/failed/xf86-video-=
nouveau.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170115_080450.log/

No issues detected


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
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/reo new qtwayland-5.7"
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


count: 3	issue: textrel
chromium-52.0.2743.76: ELF binary '/tmp/work/i586-oe-linux/chromium/52.0.27=
43.76-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations i=
n .text [textrel]
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2491+gitAUTOINC+86b71982e1: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2491+gitAUTOINC+86b71982e1-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 2	issue: build-deps
fwts-16.12.00: fwts rdepends on libpci, but it isn't a build dependency, mi=
ssing pciutils in DEPENDS or PACKAGECONFIG? [build-deps]
nano-2.7.4: nano rdepends on file, but it isn't a build dependency, missing=
 file in DEPENDS or PACKAGECONFIG? [build-deps]


count: 7	issue: file-rdeps
firefox-45.6.0esr: /usr/lib/firefox/libxul.so contained in package firefox =
requires libnss3.so(NSS_3.12.9)(64bit), but no providers found in RDEPENDS_=
firefox? [file-rdeps]
firefox-45.6.0esr: /usr/lib/firefox/libxul.so contained in package firefox =
requires libnssutil3.so(NSSUTIL_3.12.5), but no providers found in RDEPENDS=
_firefox? [file-rdeps]
firefox-45.6.0esr: /usr/lib/firefox/libxul.so contained in package firefox =
requires libssl3.so, but no providers found in RDEPENDS_firefox? [file-rdep=
s]
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
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]


count: 0	issue: version-going-backwards


count: 1	issue: host-user-contaminated
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-bo-in/usr/lib/loc=
ale/bo_IN/LC_TELEPHONE is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changot-cruft.sh: Extend the whitelist
f03308c recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
ab53522 buildhistory.bbclass: metadata-revs show repo parent
16f5d50 metadata-revs: provide more information
6505249 report-error: Allow to upload reports automatically

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
fa65be9 iperf3: update to 3.1.3
not included in master yet:=20
434130b kodi: Add krypton/17.x Jarvis/16.x recipes
69534f8 kodi: Fix build with pic on x86_64
997fb08 kodi-17: Add packageconfig for lcms support
bbeef1a kodi-17: Fix build with musl
75e4b46 kodi-17: Update to latest
56c9050 kodi-17: Fix build for qemuarm and update to latest
4a994dd usrsctp: Add recipe
10f1524 opensaf: 5.0.0 -> 5.1.0
f327429 openl2tp: update SRC_URI
dfccfce ctdb: update SRC_URI
cc6e045 pimd: update SRC_URI
0f5be89 waf-samba.bbclass: fix build error with PARALLEL_MAKE=3D"-j X -l Y"
7e3e145 samba: conditionalize sed call for onnode
d44da0d quagga: update to 1.1.0
fa5a1df tcpreplay: upgrade to 4.1.2
ec6069b strongswan: update to 5.5.1
953e84f strongswan: delete obsolete patches
4df63df wireshark: update to 2.2.3
f7a1576 lcov: fix env command argument pass issue
9a7751d mm-common: update 0.9.8 -> 0.9.10
b82bd6a libsigc++-2.0: update 2.2.11 -> 2.10.0
4985d4c glibmm: update 2.44.0 -> 2.50.0
f44392f cairomm: update 1.11.2 -> 1.12.0
9d81a38 pangomm: update 2.36.0 -> 2.40.1
4494aba atkmm: update 2.22.7 -> 2.24.2
dfdd24f gtkmm: update 2.24.3 -> 2.24.5
5672555 gnome-system-monitor: fix build after update of gnome c++ bindings
30a0320 python-chardet: provide both python2 and python3 packages
2e54d09 python-pytz: provide both python2 and python3 packages
c104c0a python-yaml: provide both python2 and python3 package
27712d8 python3-multidict: add package for multidict
c61b3a8 raptor2: initial add 2.0.15
94ca17b makedumpfile: update to 1.6.1
982402b Chromium-utils: add recipe for Chromium Embedded Controller utiliti=
es
7a4de2f sip: re-add 4.19
193af98 python-pytz: provide native and nativesdk version for pytz
8d7f03a python-sqlalchemy: update to 1.1.4 and provide python2 and python3 =
package
d014fdf lftp: update to 4.7.5 and change SRC_URI source
d89b2f6 poco: update to 1.7.7
6e13802 tcpdump: upgrade to 4.8.1
8559f49 libiio: Update to 0.8
ad59630 log4c: add support for log4c-native
a4505e7 nodejs: update to 4.7.2
3090f3d jsoncpp: upgrade to 1.8.0
96440db nano: upgrade to 2.7.4
6d51135 syslog-ng: drop attempts to disable LFS
be5164d syslog-ng: drop obsolete pcre PACKAGECONFIG option

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
c0ba8ab qtbase: Remove comments about ICU and QtWebKit
not included in master yet:=20
8aa8260 Upgrade to Qt 5.8
eb28660 qtwayland: fix typo

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
5d155da Merge pull request #24 from ashie/firefox-45.6.0-2
not included in master yet:=20
319fe89 firefox: fix configure with oe-core master - there is no nss-config
3c74e38 firefox: use pkg-config to find nspr
3d896d5 firefox: do not link against crmf library - it is not there
26eb308 chromium: add i586 (qemux86) support

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
469e850 Merge pull request #205 from Tofee/krogoth-cm12.1
not included in master yet:=20
8a54d87 pulseaudio-distro-conf: update webos-system.pa from latest pulseaud=
io
042960a README: update to depend on morty branches
ec4a597 glib-2.0: rename .bbappend to match new version from oe-core
d8f
8a83e2a opkg: rename bbappend to match new version from oe-core
8fb2a6f pulseaudio: rename bbappend to match new version from oe-core
2f1b265 freeimage: bump SRCREV to fix build with gcc6
7c3478e alsa-{lib,utils}: rename bbappend to match new version from oe-core
6b140a1 glib-2.0: rename bbappend to match new version from oe-core
f097e70 pidgin: rename bbappend to match new version from oe-core
b1a8bd0 geoclue: use 2.4.4 version from meta-oe
970f049 mesa: add LIC_FILES_CHKSUM for 10.3.8
a446611 libsdl2: use gles2 instead of opengl
bf7c6ee Mojomail: Switch to own fork for testing
230ba65 FreeImage: Use test branch for gcc6
a9892ec pulseaudio: install also 2 new headers mem.h and srbchannel.h to fi=
x pulseaudio-modules-droid build
49d402d luneos(-package): update for new kernel names
7ae56ea README: update to depend on master branches
33c2288 qtbase: enable fontconfig
fe232d6 qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.7
7bb96bb luna-next: Make compatible with Qt 5.7
e52e78b qtwayland, qtwebengine: temporary drop bbappend
dff4580 luna-sysservice: Fix build with qt 5.7
b0a406f luna-next, luna-webappmanager: temporary drop from image
c196876 packagegroup-luneos-development: drop qt5-opengles2-test
d7bd937 libconnman-qt: replace with libconnman-qt5 from meta-qt5
5cf14c4 libqofono: use the recipe from meta-qt5

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
ce9bd59 maguro: use kernel source from shr repo.
not included in master yet:=20

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWICmHQAKCRA3VSO3ZXaA
HHjbAJ4tF/FnylhW5tl/l/x1xVHPV2e96gCglJHmZKNX6djWY8pKLxe3vIzK3to=
=98y+
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
