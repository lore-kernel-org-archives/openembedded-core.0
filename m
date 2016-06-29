Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 48B7E60043;
	Wed, 29 Jun 2016 15:07:36 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r201so78390524wme.1;
	Wed, 29 Jun 2016 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=7Jf28UOr1JBWE+Dpp7yTbP8LcY6bPVLUdaTM4VtWrkU=;
	b=heskxDiaYHcVlPEJ/lw02e911Fc/0hHJtklhJEvtjf/23f0GZT0/BZH/NEYGYYgR/J
	1vibUsKj4TGwF0ils/yLtIUxUnaylv50TbnNIrUW81csHDs2e4qVZoDGbONslj9DKgIX
	FtNMNtFoWMocrKdTXvP+OtMHATgOxUzSTrgvAEUmd5LUxEEuok4JXDEB/IHYJTWAg+Ej
	weVE7YbejZbAGFOjGwbmCmUIz6DsZ9Axp2RE4mCmWbl2iKdN/PXGWp1b5iUNxGh90lxz
	7SV9ZqT1i0ce5Z5XMkCbTsEF2wxuCS1jb3Exlx3iHOYDzjcyPaOnVNbGVzpXPybefCOK
	ezmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=7Jf28UOr1JBWE+Dpp7yTbP8LcY6bPVLUdaTM4VtWrkU=;
	b=iG5xpGPB/Z85HXJRyhvGH5zGSg6xSFAsiywnBYvppFE4f+mOaCEVFkWqQZYIehPn85
	QKH5/NSaRLow7/qSWfAdw/1xRGBD8mqV5vb3NzMWwcsO+x6jdzcRko9g1unSkLH2qHhY
	ubtOqTlUxYLi/uoSE5Uxau8jjWrq5iotJcRzVJqVnjaB0/m5xGF/mUuHFZqrOidR2tih
	hDdaXwGF6uGTWyMU2qx+x+zW+ipwJShx8VOyqO8VRNtNyKKe+E+moG4mYC6mGn2kkdmp
	Gtdkrlu1RHnA95gRaclAhJ9sAAOCe7GFHfty7LZKqX6dzCJ8fy+Qw1NWBTU3wrcL67vx
	3gUw==
X-Gm-Message-State: ALyK8tKpUVM1Rx5UIPe9y5n7rinCWlJR3GQTHmsxtobpXoC1hmK5gAROja/7Kr5wUCzxAw==
X-Received: by 10.194.5.166 with SMTP id t6mr8901436wjt.58.1467212855906;
	Wed, 29 Jun 2016 08:07:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	t198sm4650370wmt.16.2016.06.29.08.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 Jun 2016 08:07:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Jun 2016 17:08:39 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160629150839.GC2558@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: State of bitbake world 2016-06-24
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
X-List-Received-Date: Wed, 29 Jun 2016 15:07:38 -0000
X-Groupsio-MsgNum: 83969
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline

--lCAWRPmW1mITcIfM
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
||2016-06-24	||2	||2	||2	||23	||6	||5	||23	||6	||5	||0	||0		||0		||1		||5		=
||18		||12		||3		||1		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-06-24 =3D=3D

INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20160629_050230.log

=3D=3D=3D common (1) =3D=3D=3D
    * openembedded-core/meta/recipes-multimedia/gstreamer/gst-player_git.bb=
:do_compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_compi=
le

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * openembedded-core/meta/recipes-core/meta/meta-ide-support.bb:do_packa=
ge_write_ipk

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (6) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemuarm.20160623_090846.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/17688/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemux86.20160623_092456.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/17689/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
world.qemux86-64.20160624_082257.log/ || http://errors.yoctoproject.org/Err=
ors/Build/17722/
|}

=3D=3D=3D PNBLACKLISTs (130) =3D=3D=3D

=3D=3D=3D QA issues (40) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
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
||12	||version-going-backwards
|-
||18	||file-rdeps
|-
||1	||installed-vs-shipped
|-
||1	||textrel
|-
||3	||host-user-contaminated
|-
||5	||build-deps
|}



=3D=3D=3D Failed dependencies for qemuarm (23) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160624_073633.log/
Found differences:=20
    * WARN: samba: samba rdepends on libpam, but it isn't a build dependenc=
y?
    * WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build de=
pendency?
    * WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a =
build dependency?
    * WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build d=
ependency?
    * WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build=
 dependency?
    * WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dep=
endency?
    * WARN: enchant: enchant rdepends on hunspell, but it isn't a build dep=
endency?
Found errors:=20
    * ERROR: 23 issues were found in these recipes: chkconfig-alternatives-=
native enchant gst-player gtkmathview jasper libdrm meta-world-pkgdata netm=
ap proxy-libintl samba

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (6) =3D=3D=
=3D
    * chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlog=
s/oe/world/log.dependencies.qemuarm.20160624_073633.log//2_max/failed/chkco=
nfig-alternatives-native.log
    * gst-player -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160624_073633.log//2_max/failed/gst-player.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160624_073633.log//2_max/failed/gtkmathview.log
    * meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
log.dependencies.qemuarm.20160624_073633.log//2_max/failed/meta-world-pkgda=
ta.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160624_073633.log//2_max/failed/netmap.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160624_073633.log//2_max/failed/proxy-libintl.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (5) =3D=3D=
=3D
    * gst-player -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160624_073633.log//3_min/failed/gst-player.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160624_073633.log//3_min/failed/gtkmathview.log
    * meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
log.dependencies.qemuarm.20160624_073633.log//3_min/failed/meta-world-pkgda=
ta.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160624_073633.log//3_min/failed/netmap.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160624_073633.log//3_min/failed/proxy-libintl.log
=3D=3D=3D Failed dependencies for qemux86 (23) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160629_010727.log/
Found differences:=20
    * WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build d=
ependency?
    * WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build=
 dependency?
    * WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dep=
endency?
    * WARN: samba: samba rdepends on libpam, but it isn't a build dependenc=
y?
    * WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build de=
pendency?
    * WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a =
build dependency?
    * WARN: enchant: enchant rdepends on hunspell, but it isn't a build dep=
endency?
Found errors:=20
    * ERROR: 23 issues were found in these recipes: chkconfig-alternatives-=
native enchant gst-player gtkmathview jasper libdrm netmap piglit proxy-lib=
intl samba

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (6) =3D=3D=
=3D
    * chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlog=
s/oe/world/log.dependencies.qemux86.20160629_010727.log//2_max/failed/chkco=
nfig-alternatives-native.log
    * gst-player -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20160629_010727.log//2_max/failed/gst-player.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160629_010727.log//2_max/failed/gtkmathview.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160629_010727.log//2_max/failed/netmap.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160629_010727.log//2_max/failed/piglit.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160629_010727.log//2_max/failed/proxy-libintl.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (5) =3D=3D=
=3D
    * gst-player -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20160629_010727.log//3_min/failed/gst-player.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160629_010727.log//3_min/failed/gtkmathview.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160629_010727.log//3_min/failed/netmap.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160629_010727.log//3_min/failed/piglit.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160629_010727.log//3_min/failed/proxy-libintl.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160624_124629.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
recipes-browser/chromium/chromium_48.0.2548.0.bb:PNBLACKLIST[chromium] ?=3D=
 "BROKEN: fails to build with gcc-6"
recipes-mozilla/firefox/firefox_38.7.1esr.bb:PNBLACKLIST[firefox] ?=3D "BRO=
KEN: fails to build with gcc-6"
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
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-devtools/glade/glade3_%.bbappend:PNBLACKLIST[glade3] ?=
=3D "Depends on broken libgnomeui"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size o=
f array '_GStaticAssertCompileTimeAssertion_2' is negative"
meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb:PNBLACKLIST[abiword] ?=3D=
 "Depends on broken gtkmathview"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken gnome-panel"
meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb:PNBLACKLIST[gedit] ?=3D "Dep=
ends on broken gtksourceview2"
meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb:PN=
BLACKLIST[gnome-disk-utility] ?=3D "BROKEN: fails to find avahi-ui even whe=
n it's in depends"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
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
meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb:PNBLACKLIST=
[gtksourceview2] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgwea=
ther] ?=3D "BROKEN: fails to build with gcc-6"
meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb:PNBLACKLIST[libgnome=
ui] ?=3D "BROKEN: fails to build with gcc-6"
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
meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader] ?=
=3D "BROKEN: fails to build with gcc-6"
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
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D "BROKEN: Tries to build kernel module and fails, either it should be di=
sabled or there should be dependency on kernel like in netmap-modules"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] ?=
=3D "BROKEN: fails to build for qemuarm."
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D "BROKEN: Depends on broken yp-tools"
meta-oe/recipes-benchmark/glmark2/glmark2_git.bb:PNBLACKLIST[glmark2] ?=3D =
"BROKEN: fails to build with gcc-6"
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
meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb:PNBLACKLIS=
T[modemmanager] ?=3D "Depends on broken libqmi"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb:PNBLACKLIST[thrift] ?=
=3D "BROKEN: fails to build with gcc-6"
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
meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb:PNBLACKLIST[mpich] ?=3D "BROK=
EN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc fa=
iled sanity test (tmpdir)"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
meta-oe/recipes-extended/collectd/collectd_5.5.0.bb:PNBLACKLIST[collectd] ?=
=3D "BROKEN: fails to build with glibc-2.24"
meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb:PNBLACKLIST[gtkmat=
hview] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb:PNBLACKLIST[glc=
ompbench] ?=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them"
meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb:PNBLACKLIST[tessera=
ct] ?=3D "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
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
meta-oe/recipes-support/espeak/espeak_1.37.bb:PNBLACKLIST[espeak] ?=3D "BRO=
KEN: fails to build with gcc-6"
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
meta-oe/recipes-support/opencv/opencv_3.1.bb:PNBLACKLIST[opencv] ?=3D "BROK=
EN: fails to build with gcc-6"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb:PNBLACKLIST[openwbem] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb:PNBLACKLIST[postgres=
ql] ?=3Dfreesmartphone/libframeworkd-glib_git.bb:PNBLACKLIST[libframeworkd-=
glib] ?=3D "BROKEN: many errors when building with gcc-6"
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


count: 1	issue: textrel
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 5	issue: build-deps
geany-plugins-1.27: geany-plugins-debugger rdepends on libvte9, but it isn'=
t a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
geany-peps]
samba-4.4.2: samba rdepends on libpam, but it isn't a build dependency, mis=
sing libpam in DEPENDS or PACKAGECONFIG? [build-deps]
sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof rdepends on polkit, but it is=
n't a build dependency, missing polkit in DEPENDS or PACKAGECONFIG? [build-=
deps]


count: 18	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires =
libnewt.so()(64bit), but no providers found in RDEPENDS_chkconfig? [file-rd=
eps]
chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires =
libnewt.so, but no providers found in RDEPENDS_chkconfig? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
libnewt-0.52.19: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdep=
s]
libnewt-0.52.19: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]
libnewt-python-0.52.19: /usr/lib/python3.5/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so()(64bit), but no providers =
found in RDEPENDS_libnewt-python? [file-rdeps]
libnewt-python-0.52.19: /usr/lib/python3.5/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so, but no providers found in =
RDEPENDS_libnewt-python? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so()(64bit), but no providers found in RDEPEN=
DS_networkmanager-nmtui? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so, but no providers found in RDEPENDS_networ=
kmanager-nmtui? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-hostname contained in package network=
manager-nmtui requires libnewt.so, but no providers found in RDEPENDS_netwo=
rkmanager-nmtui? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in=
 package numptyphysics requires /usr/bin/perl, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]
xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires =
libxfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs-mkfs? [fi=
le-rdeps]
xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires =
libxfs.so.0, but no providers found in RDEPENDS_xfsprogs-mkfs? [file-rdeps]
xfsprogs-3.2.3: /sbin/xfs_repair contained in package xfsprogs requires lib=
xlog.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs? [file-rdep=
s]
xfsprogs-3.2.3: /usr/sbin/xfs_growfs contained in package xfsprogs requires=
 libxfs.so.0, but no providers found in RDEPENDS_xfsprogs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_logprint contained in package xfsprogs requir=
es libxfs.so.0, but no providers found in RDEPENDS_xfsprogs? [file-rdeps]


count: 12	issue: version-going-backwards
fwts-14.12.00: Package version for package fwts-dbg went backwards which wo=
uld break package feeds from (0:16.05.01-r0.0 to 0:14.12.00-r0.16) [version=
-going-backwhich would break package feeds from (0:16.05.01-r0.0 to 0:14.12=
=2E00-r0.16) [version-going-backwards]
fwts-14.12.00: Package version for package fwts-dev went backwards which wo=
uld break package feeds from (0:16.05.01-r0.0 to 0:14.12.00-r0.20) [version=
-going-backwards]
fwts-14.12.00: Package version for package fwts-doc went backwards which wo=
uld break package feeds from (0:16.05.01-r0.0 to 0:14.12.00-r0.16) [version=
-going-backwards]
fwts-14.12.00: Package version for package fwts-doc went backwards which wo=
uld break package feeds from (0:16.05.01-r0.0 to 0:14.12.00-r0.20) [version=
-going-backwards]
fwts-14.12.00: Package version for package fwts-locale went backwards which=
 would break package feeds from (0:16.05.01-r0.0 to 0:14.12.00-r0.16) [vers=
ion-going-backwards]
fwts-14.12.00: Package version for package fwts-locale went backwards which=
 would break package feeds from (0:16.05.01-r0.0 to 0:14.12.00-r0.20) [vers=
ion-going-backwards]
fwts-14.12.00: Package version for package fwts-staticdev went backwards wh=
ich would break package feeds from (0:16.05.01-r0.0 to 0:14.12.00-r0.16) [v=
ersion-going-backwards]
fwts-14.12.00: Package version for package fwts-staticdev went backwards wh=
ich would break package feeds from (0:16.05.01-r0.0 to 0:14.12.00-r0.20) [v=
ersion-going-backwards]
fwts-14.12.00: Package version for package fwts went backwards which would =
break package feeds from (0:16.05.01-r0.0 to 0:14.12.00-r0.16) [version-goi=
ng-backwards]
fwts-14.12.00: Package version for package fwts went backwards which would =
break package feeds from (0:16.05.01-r0.0 to 0:14.12.00-r0.20) [version-goi=
ng-backwards]


count: 3	issue: host-user-contaminated
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-ar-bh.iso-8859-6/=
usr/lib/locale/ar_BH.ISO-8859-6/LC_NAME is owned by uid 3004, which is the =
same as the user running bitbake. This may be due to host contamination [ho=
st-user-contaminated]
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-en-ng/usr/lib/loc=
ale/en_NG/LC_PAPER is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-uz-uz/usr/lib/loc=
ale/uz_UZ/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]


count: 1	issue: installed-vs-shipped
sysprof: 9 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
779d736 lib/bb/build.py: remove task flag in deltask()
not included in master yet:=20
161af1b world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
afb40bf puzzles: fix Samba conflict, clean up recipe
not included in master yet:=20
b0fc827 qemux86: Add identical qemux86copy variant for tests
6c5c961 sstate-sysroot-cruft.sh: Extend the whitelist
ec09912 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
37a6cc2 buildhistory.bbclass: metadata-revs show repo parent
95a1374 metadata-revs: provide more information
aab9737 report-error: Allow to upload reports automatically
653238d icecc.bbclass: replace os.popen with subprocess.check_output
c1dd5d5 test-dependencies.sh: Strip also '\.bb;.*' before adding failed rec=
ipe to list of failed

=3D=3D Tested changes (not included in master yfix issues with multiple sig=
nbit definitions and remove from the blacklist
044b51c Samba: use only libsystemd
2167136 netmap: blacklist

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
15a4f86 qtwayland: add dependency on libxcomposite
not included in master yet:=20
9b98004 qtbase: add PACKAGECONFIG for journald logging

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
825ea93 chromium: Add workarounds for compiler errors
not included in master yet:=20
93fb0a3 firefox, cef3, chromium: blacklist, fails to build with gcc-6

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
4417aad org.webosports.app.settings: Bump SRCREV
not included in master yet:=20
20b2c6f qtbase: append to QT_CONFIG_FLAGS not EXTRA_OECONF
8ca0d9a README: update to depend on krogoth branches
65eb5ab Revert "systemd: Downgrade to v219 supplied by Fido"
9aa9fbf Revert "PulseAudio: Downgrade to 6.0 from Fido"
680e783 glib: rename bbappend to match new version from oe-core
dbff529 opkg: rename bbappend to match new version from oe-core
fe8af27 alsa-lib: rename bbappend to match new version from oe-core
bce331c glib: rename bbappend to match new version from oe-core
48a0e73 packagegroup-luneos-extended: Temporary remove imaccountvalidator, =
imlibpurpleservice
b50ca7a nodejs-module-webos-dynaload: Fix build with newer nodejs
b9829f9 pulseaudio: rename bbappend to apply for new version from oe-core
1667043 alsa-utils: rename bbappend to apply for new version from oe-core
2085708 pulseaudio: install few more headers needed by pulseaudio-modules-d=
roid
f425714 geoclue: explicitly disable introspection
78d59a7 wayland: Remove backported 1.9.0
4d97d7d luneos-{package,emulator-appliance}: exclude DATETIME from signatur=
es
282655f meta-luneos: Remove PACKAGECONFIG_CONFARGS work around
001f715 systemd: Disable fdinfo stat
ddee1e2 pulseaudio-modules-droid: Fix PA8 on Krogoth
1e89594 pulseaudio-modules-droid: Switch back to own fork with Mako specifi=
c patches
cc159fb pulseaudio-modules-droid: Bump SRCREV
612ecfa pulseaudio-modules-droid: Switch back to upstream for now
16d63fe pulseaudio-modules-droid: Add patches for detection of external con=
nection changes & mako fix
e87cb52 nodejs-module-webos: Move to own forks & drop patches
2bd3334 nodejs-module-webos: Use webos_ports_fork_repo instead
cf5d284 qtwebengine: Force PulseAudio & fix proprietary codecs
fcb40d1 luna-next-cardshell: Bump SRCREV
af83016 mmsd: Update mmd.service with correct location
70011f7 pidgin: Update to 2.10.12
172f93f packagegroup-luneos-extended: Bring back imaccountvalidator & imlib=
purpleservice
06bd43c keymanager: Disable node-sqlite3 for now
528da06 packagegroup-luneos-extended: Enable keymanager again
76e07cf org.webosports.service.downloadmgr: initial recipe
e4db9df Merge pull request #180 from Garfonso/patch-29
d7a8b1e packagegroup-luneos-extended: Add downloadmanager
89f3cf3 org.webosports.cdav: Bump SRCREV
b7c96c6 keymanager: Bump SRCREV
1327a03 connman: Drop our recipe and use oe-core one
f087e19 mesa-10.3.7: Remove unsupported --with-sha options
b6ccaab libqofono: Fix QA warning
837c951 luna-sysmgr: Fix do_install
b97746d imaccountvalidator: Fix QA issues
9d1304c imlibpurpleservice: Fix QA issues
67e9378 recipes: replace base_contains with bb.utils.contains
0ef7cbc packagegroup-luneos-extended: install kernel-module-snd-intel8x0 fo=
r QEMU
a9c7130 pulseaudio-distro-conf: update webos-system.pa from latest pulseaud=
io
d7c51a6 qtwebengine: Bump SCREV for chromium
1b69941 phonesiSRCREV
7cf3b5b qtwebengine: Bump SRCREV
91e0516 luneos-default-wallpapers: use cp -R --no-dereference --preserve=3D=
mode,links -v to fix QA warnings:
2f3ef79 connman-conf: install wired-setup to datadir
10b92b4 hunspell: move ispellaff2myspell to separate package
cbb6057 presage: add dependency on ncurses
9f9fa81 luna-webappmanager: Bump SRCREV
d2d90da android-property-service: Add DEPENDS on luna-prefs
6b478b7 org.webosports.service.update: Add RDEPENDS for bash
7a850f8 core-apps: Add RDEPENDS on bash
1f92761 loadable-frameworks: Add RDEPENDS on bash
bda6013 lxc: Add bash to RDEPENDS
1b2b4d0 org.webosports.app.calendar: Move recipe to unused
a552da7 org.webosinternals.tweaks: Bump SRCREV
462d3c0 webos-telephonyd: Bump SRCREV
754ccc1 org.webosports.app.settings: Bump SRCREV
8f82278 webos-telephonyd: Bump SRCREV
be7f810 org.webosports.update: Bump SRCREV
8f159e7 packagegroup-luneos-development: return valgrind
6e8e1a2 org.webosports.app.phone: Bump SRCREV
16ddf45 luna-next-cardshell: Bump SRCREV
cd8b169 org.webosinternals.tweaks: Change enjo-app into enyo-app
f4fbc4f Initial work to support Enyo 2.7 applications using enyo-dev
2b1ba13 presage: Fix QA issues
8572199 luneos.inc: Add Ubuntu 15.10 and 16.04 to sanity tested distros
346c70f geoclue: Add avahi to DEPENDS
91f622b sensorfw: Add bash to RDEPENDS
856f4bf ofono: Add patches to revert Python 3
47f0fc6 ofono: Fix missing \
8c55fd7 presage: Version independent approach to Python
b31fb8c webos-telephonyd: Bump SRCREV
cb3feb4 Add https-everywhere recipe for providing https rulesets for Browse=
r app
22111b8 https-everywhere: Use SQLite db instead
ed46ebf pidgin: simplify bbappend
b1f219d qtscenegraph-adaptations: Drop patches & follow upstream directly
772a5f1 LXC 2.0 Upgrade
80c56dc qtwebengine: bump SRCREV
b8839cf lxc: Update patches & recipes
1fe40df Merge pull request #181 from webOS-ports/herrie/lxc
7393c3c qtwebengine: Bump SRCREV
71d656f mediaindexer: Bump SRCREV
f6d3bc4 Working Enyo 2.7 recipes
14d38e5 Merge pull request #182 from Andolamin/herrie/enyodev
b50d254 Merge pull request #184 from webOS-ports/herrie/enyodev
670549e org.webosports.app.contacts: Bump SRCREV
b8ce88e app-services, foundation-frameworks, mojoloader, mojoservicelaunche=
r, nodejs-module-webos-dynaload: Cleanup and switch to own fork
59b9beb foundation-frameworks, mojoservicelauncher: Bump SRCREV
8da18db app-services: Bump SRCREV
fd8f80f imaccountvalidator: Bump SRCREV
ad5a52f imlibpurpleservice: Bump SRCREV
773780b imlibpurpleservice: Bump SRCREV
e8d95f2 luna-next-cardshell: Bump SRCREV
1ebbc84 luna-service2: Bump SRCREV
090b244 org.webosports.app.settings: Bump SRCREV
bac08ba core-apps: Bump SRCREV and cleanup
dd71dca webos-telephonyd: Bump SRCREV
b69e02a Add recipe for org.webosports.app.tasks
75f4492 packagegroup-luneos-extended: Add org.webosports.app.tasks and mess=
aging-accounts
090d5a8 messaging-accounts: Initial recipe
8dd1656 mediaindexer: Bump SRCREV
91db79e org.webosports.app.contacts: Bump SRCREV
026fca2 luna-appmanager: Bump SRCREV
c32c88f org.webosports.app.contacts: Bump SRCREV
085d4e7 pulseaudio-distro-conf: update webos-system.pa from latest pulseaud=
io
098a35a README: update to depend on master branches
46ba83a qtbase: enable fontconfig
99f72ec qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.7
4a01591 luna-next: Make compatible with Qt 5.7
37586fe qtwebengine: temporary drop bbappend
1bab4c4 luna-sysservice: Fix build with qt 5.7
e7f5372 glib-2.0: rename .bbappend to match new version from oe-core
94f34c5 connman: rename .bbappend to match new version  upstream commit:=20
d6d9f42 tenderloin-bluetooth-utilities: Bump SRCREV
not included in master yet:=20
cd39921 zhone: blacklist because of python-pycairo runtime dependency
35029f2 libframeworkd-glib: blacklist, fails with gcc-6
b1ee9cc packagegroup-shr-feed: Remove firefox and fbreader
c560043 frameworkd, mdbus, gta04-gps-handler, pisi: Remove runtime dependen=
cy on broken python-pygobject
bea9494 packagegroup-shr-feed: drop oh-puzzles
105303b u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
af5cc06 linux-gta04: bump SRCREV to get fixes for build with gcc-5
5b2261a linux-gta04: enable SGX530
46ce288 defaulttunes.inc: switch to hf, because SGX SDK for SGX530 is avail=
able only for hf
66a7873 om-gta04: drop u-boot from EXTRA_IMAGEDEPENDS
9cfbb34 linux-gta04: upgrade to 4.4
f412709 shr: add wayland to DISTRO_FEATURES
2d86ad1 linux-gta04: include linux-dtb
823d562 packagegroup-shr-feed: drop leafpad

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldz5HcACgkQN1Ujt2V2gByHYQCfWs9U09m5ehtAdpv4+NnIotgA
t6wAnAmGkp33SLRjkxDkU5zqh0Yp0+q+
=4Qo3
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
