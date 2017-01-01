Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBF86022F;
	Sun,  1 Jan 2017 08:13:22 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id j10so65442236wjb.3;
	Sun, 01 Jan 2017 00:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=Z8cgja7dhQ5tOWqAMAoRB8XSd6onvTInP9+J3iXeJUM=;
	b=csncY7K6OWERALnymwA++BsiYMDaw+E6lqNZ/8ck3xuIopAdJEn2IwZ6hy27ZwbcvP
	8sNyl9tcs4bogLD5suAvID30GnI730megZsPiJBH8+5z/TAWKh97b/maZmes6IvbUem7
	WY7Z4XZwQPCXB9BvVWZ7nt/I3wUvW5UKYtfPzV0wTGO5dgmGD4kT158pFThPZODIZddN
	8tAAjijDtfhDN6sxem83UsMUQvMNVJZX/IvxXxR2XiBtpLDgpT/FDBN3uMrSNJ6uk5aL
	doVzGPDSwgKKl4jq/XeVDEzTaJ87N0PCTQ49ENcByphzlXT76Tt2hXpPADnFL5qhOpOW
	2LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=Z8cgja7dhQ5tOWqAMAoRB8XSd6onvTInP9+J3iXeJUM=;
	b=TL6+/BajxI/ho4q+C6pE2AHaWrZN0IeLwaTYyJwgHpPXJNIsc3nt+6kG5RPtkSH33D
	GElkXRJxXWGFEKiOcarHBdePvSJRtkWTNCnk++RoSJA4MZ3dpwhsCsiqqoyPzCPEIZee
	h5KoaWY3n4H6TzVwFr3Xp5oEtCZLZ0OJukAxXfgPh+RccW8VAUi1RQGRDCf2AptY5FxN
	xyszDPfz+Uoed/+Ul57QPRjvYz3/CCcPijxjFBB0BiL14eBqrjROjD7dwGL71KqLcFBY
	/wB+qKCmeLl01QyTrOJ2oHYvi6IpxuyFXM/EWRREgar/BomrsusUvJrS584fESYTcXCC
	OHDA==
X-Gm-Message-State: AIkVDXL90jmeNSRD3LeqKpAZ5x+4sIy3tbUBPdzUMtCK4Fut1drsDvz/QWG2OrA2Sf2qiw==
X-Received: by 10.194.86.34 with SMTP id m2mr45172033wjz.173.1483258402457;
	Sun, 01 Jan 2017 00:13:22 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i15sm81658212wjs.16.2017.01.01.00.13.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 01 Jan 2017 00:13:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 1 Jan 2017 09:13:23 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170101081323.GC3408@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2016-12-31
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
X-List-Received-Date: Sun, 01 Jan 2017 08:13:24 -0000
X-Groupsio-MsgNum: 91276
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Content-Disposition: inline

--DqhR8hV3EnoxUkKN
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
||2016-12-31	||6	||8	||7	||13	||6	||6	||17	||8	||8	||0	||0		||0		||1		||0		=
||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-12-31 =3D=3D

INFO: jenkins-job.sh-1.8.12 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20161231_221003.log

=3D=3D=3D common (5) =3D=3D=3D
    * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.=
8.0.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb=
:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-gla=
mo_git.bb:do_compile
    * meta-openembedded/meta-webserver/recipes-php/xdebug/xdebug_2.2.6.bb:d=
o_compile
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb:do_configure

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati=
_7.6.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nou=
veau_1.0.12.bb:do_compile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:do_compi=
le

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (21) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20161231_063206.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/27814/
|-
|| qemux86 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20161231_063209.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/27815/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20161231_095054.log/ || http://errors.yoctoproject.or=
g/Errors/Build/27829/
|}

=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D

=3D=3D=3D QA issues (1) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
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
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||1	||textrel
|}



=3D=3D=3D Failed dependencies for qemuarm (13) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161231_082036.log/
Found differences:=20
Found errors:=20
    * ERROR: 13 issues were found in these recipes: kodi pmbw qtwayland xde=
bug xf86-video-glamo xfsprogs

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (6) =3D=3D=
=3D
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161231_082036.log//2_max/failed/kodi.log
    * pmbw -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161231_082036.log//2_max/failed/pmbw.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161231_082036.log//2_max/failed/qtwayland.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20161231_082036.log//2_max/failed/xdebug.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20161231_082036.log//2_max/failed/xf86-video-gl=
amo.log
    * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20161231_082036.log//2_max/failed/xfsprogs.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (6) =3D=3D=
=3D
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161231_082036.log//3_min/failed/kodi.log
    * pmbw -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161231_082036.log//3_min/failed/pmbw.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161231_082036.log//3_min/failed/qtwayland.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemuarm.20161231_082036.log//3_min/failed/xdebug.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20161231_082036.log//3_min/failed/xf86-video-gl=
amo.log
    * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20161231_082036.log//3_min/failed/xfsprogs.log

=3D=3D=3D Failed dependencies for qemux86 (17) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161231_114127.log/
Found differences:=20
Found errors:=20
    * ERROR: 17 issues were found in these recipes: kodi qtwayland qtwebeng=
ine xdebug xf86-video-ati xf86-video-glamo xf86-video-nouveau xfsprogs

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (8) =3D=3D=
=3D
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161231_114127.log//2_max/failed/kodi.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161231_114127.log//2_max/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20161231_114127.log//2_max/failed/qtwebengine.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20161231_114127.log//2_max/failed/xdebug.log
    * xf86-video-ati -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20161231_114127.log//2_max/failed/xf86-video-ati.=
log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20161231_114127.log//2_max/failed/xf86-video-gl=
amo.log
    * xf86-video-nouveau -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemux86.20161231_114127.log//2_max/failed/xf86-video-=
nouveau.log
    * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161231_114127.log//2_max/failed/xfsprogs.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (8) =3D=3D=
=3D
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161231_114127.log//3_min/failed/kodi.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161231_114127.log//3_min/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20161231_114127.log//3_min/failed/qtwebengine.log
    * xdebug -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dep=
endencies.qemux86.20161231_114127.log//3_min/failed/xdebug.log
    * xf86-video-ati -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20161231_114127.log//3_min/failed/xf86-video-ati.=
log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20161231_114127.log//3_min/failed/xf86-video-gl=
amo.log
    * xf86-video-nouveau -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemux86.20161231_114127.log//3_min/failed/xf86-video-=
nouveau.log
    * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161231_114127.log//3_min/failed/xfsprogs.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20161231_113157.log/

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
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
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
PNBLx86copy variant for tests
788c84b sstate-sysroot-cruft.sh: Extend the whitelist
5346d16 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
eb5179e buildhistory.bbclass: metadata-revs show repo parent
3a43dd6 metadata-revs: provide more information
a5ea624 report-error: Allow to upload reports automatically

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
380f0ce samba: simplify LSB handling
not included in master yet:=20
5ffa702 syslog-ng: don't use update-alternatives to manage init script
ccecb78 rsyslog: don't use update-alternatives to manage init script
3b4b32a kodi: Add krypton/17.x Jarvis/16.x recipes
aeb0471 kodi: Fix build with pic on x86_64
e32981a kodi-17: Add packageconfig for lcms support
fc25bc5 kodi-17: Fix build with musl
6565de6 kodi-17: Update to latest
a2290b1 kodi-17: Fix build for qemuarm and update to latest
d67cba2 makedumpfile: add ARM into COMPATIBLE_HOST
918c327 libupnp: Fix out-of-bound access in create_url_list() (CVE-2016-886=
3)
c20e42a protobuf: switch from mips16 to mips32 due to in-line assembler
a43fd54 php: add 7.1.0 remove 5.5.38
233520e opencv: Update repository location
b2349d6 opencv: Metapkg should not rdepend on -staticdev
a9e59cb opencv: Add missing depends
88e8255 opencv: Add support for OpenJDK
eb626dc opencv: Add support for python3
dc83100 opencv: Add missing DEPEND for opencl PKGCFG
340b5df opencv: Add new PACKAGECONFIG dnn
6c2db38 opencv: Merge dbg packages and Fix QA Issues
3c0427f tinymembench: fix QA warning for GNU_HASH
3e2a164 libmng: Add recipe
5b9895d zbar: Add recipe
0bd5590 avro: Add recipe
00712a8 liboop: Add recipe
79c0c20 gimp: Enable libmng plugins
b8f1c0b gtest, gmock: update 1.7.0 -> 1.8.0
9a86b8a dibbler: add initial recipe, dibbler 1.0.1
7bdd54f zlog: Add recipe
2b89622 usrsctp: Add recipe
d61410d poppler: Disable PIE, it does not compile
bf68f19 audiofile: update to 0.3.6
7856f0c esound: fix build after update of audiofile
790de05 hplip: Fix build with clang
7860ff4 xfsprogs: Fix parallel install and Make dependencies
e8c9a01 rapidjson: add initial recipe
fed7fa1 gst-plugins-bad_0.10.23.bb: Add packageconfig for zbar plugin
d07aadd directfb: Disable vdpau x11 spport
6f7e56a python-pygobject: 3.20.1 -> 3.22.0
6bc5fd6 cxxtest: Add CxxTest framework to recipe-devtools.
c1199fd pmbw: add recipe for ram benchmarks
e3d0cef python-urllib3: update to version 1.19.1
0572182 yajl_1.0.12: Add recipe for yajl1
81f614b opensaf: 5.0.0 -> 5.1.0
919a209 python-lxml: update to version 3.7.0
4a904a7 python-dominate: update to version 2.3.1
ee90133 apache2: update to version 2.4.25
0c7bc57 python-passlib: update to version 1.7.0
2b3cddf python-webcolors: update to version 1.7
83b915d python-dateutil: update to version 2.6.0
66581ab python-zopeinterface: update to version 4.3.3
122207f python-wrapt: update RDEPENDS to work with minimal python install
c9074c0 python-astroid: update to version 1.4.9
24c481a fwts: upgrade to 16.12.00 release
c2ab89e openl2tp: update SRC_URI
53c1880 ctdb: update SRC_URI
137abcf pimd: update SRC_URI
50ca421 cryptsetup: Add kernel-module-xts to RRECOMMENDS
c54c744 python-cffi: update to version 1.9.1
fe08774 python-cython: update to version 0.25.2
cf3fb15 python-bcrypt: update to version 3.1.2
ea9a823 python-pysocks: update to version 1.6.5 and fix RDEPENDS
096789b python3-wekzeug: update RDEPENDS to pull in http module
af1039d python-flask-login: update to version 0.4.0
d012e59 hwloc: Add
76b6a58 poppler: update to 0.50.0
c3bfb7b xfce4-whiskermenu-plugin: update to 2.0.3
d6d5777 geany: update to 1.29
2576263 geany-plugins: update to 1.29
d96d367 mpd: add PACKAGECONFIG for audiofile
2df9b3c mpd: update to 0.19.21
b190005 mpd: add PACKAGECONFIG for libcdio-paranoia
10acfd4 waf-samba.bbclass: fix build error with PARALLEL_MAKE=3D"-j X -l Y"
01094e1 samba: conditionalize sed call for onnode
bf243e2 linuxptp: fix cross compilation not using host headers
4ffddd5 apache2: always use the archive.apache.org to ensure older releases=
 are always available

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
c0ba8ab qtbase: Remove comments about ICU and QtWebKit
not included in master yet:=20
8aa8260 Upgrade to Qt 5.8

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
922bf4b libqofono: use the recipe from meta-qt5
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
176f337  linux-hp-tenderloin: Update kernel
not included in master yet:=20
0ad046f meta-fso: replace deprecated bb.data.getVar('PV',d,1) with d.getVar=
('PV', True)

--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWGi6IgAKCRA3VSO3ZXaA
HLr+AJ0ZjzLWjuXZ6FFx30FZ9+vd+KwiuACfUGhmh9aQgZQRmU+MK7T3pNVdhLM=
=esVe
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--
