Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7695471A8B;
	Fri, 18 Nov 2016 16:49:32 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g23so8002886wme.1;
	Fri, 18 Nov 2016 08:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=JKi0GvJckR/SJTowoMNZ8+OZZibWNQwa2OqhkXSMvw8=;
	b=bTPSfPGzrFbigkzJODomAush2GnRUS34y+AOOUPSTRmfJkkZP6JiajBywpmX3KuO++
	NCIX4srs/335ojOfM9kfNL7tGUfXbzbPmK/04w6Ck30Rv99BUKCIhLe8s3mKuqGw9oxo
	fgzqQ/1ejdEsq26vmbsXYa+PoO7AzzzH3ff3/VDuggqscpaX0q9jN1/qezCOSrSQyC+Z
	HAmTfaMj2Dae0buo+QfnSmY14A+Y1T6BqAhFPzeOxvBBOov35561e6gCUa5eJTdCut4o
	9IZlKSCugJHNPCJbw6VYFXPyk0qA7BknSQz8v6b5dLXhj6Em3v/Zzce5OIdt8lwzj1hN
	wVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=JKi0GvJckR/SJTowoMNZ8+OZZibWNQwa2OqhkXSMvw8=;
	b=KwWWkE2TemagOuVwfaHagQNA3LMgZJLaHPKfBRRmIQnDDA8zbghEMenjZFq4x6WxJv
	CM1YgPMTx65P94f1xOOTcrjbywNPCWdMto4vPRmrJ5YZBc7eGFcLnSX9hFKaz2XguCOl
	NY9JeQSkRw7mkOoMTtQlnB0aQLRmeIUZix1Uv2p3/BuLIkvryrgMSnYJcLFTz/Yhsyx8
	Exp1SdT7mvXpz0nPbHtDmS3sWa1Z5EiL/BXdj7pOhHad80FD4wP5+aIdsFrFwKIoVG/7
	cGc8qKmRe9uUIv/Xj24Atog1fnNoZOAUgAQpNc0buqgb65fG+lrHvk7VnN1ZPwtf0DpB
	F33Q==
X-Gm-Message-State: AKaTC02cIggxrRWmpeSlAl2jQmw9S2t/DuMj1Xq/DmvCm+L2jwoSW3vjEM4pbyroIEJc7A==
X-Received: by 10.28.225.11 with SMTP id y11mr1094845wmg.93.1479487772569;
	Fri, 18 Nov 2016 08:49:32 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k11sm4254673wmb.18.2016.11.18.08.49.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Nov 2016 08:49:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Nov 2016 17:49:32 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20161118164932.GB3324@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: State of bitbake world 2016-11-17
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
X-List-Received-Date: Fri, 18 Nov 2016 16:49:37 -0000
X-Groupsio-MsgNum: 89578
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline

--3lcZGd9BuhuYXNfi
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
||2016-11-17	||9	||7	||6	||17	||9	||7	||12	||6	||5	||0	||0		||0		||2		||1		=
||3		||24		||2		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-11-17 =3D=3D

INFO: jenkins-job.sh-1.8.12 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20161118_063609.log

=3D=3D=3D common (6) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/wireshark/wireshark=
_2.2.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/obex/obex-data-server_=
0.4.6.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-scales_=
1.0.9.bb:do_populate_lic
    * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.b=
b:do_configure
    * openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb:do_c=
ompile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb=
:do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb=
:do_package_qa
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb:do_com=
pile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (22) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20161116_034630.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/24510/
|-
|| qemux86 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20161116_034634.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/24517/
|-
|| qemux86_64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20161117_042142.log/ || http://errors.yoctoproject.or=
g/Errors/Build/24596/
|}
=3D=3D=3D PNBLACKLISTs (116) =3D=3D=3D
=3D=3D=3D QA issues (32) =3D=3D=3D
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
||1	||build-deps
|-
||24	||version-going-backwards
|-
||2	||host-user-contaminated
|-
||2	||textrel
|-
||3	||file-rdeps
|}



=3D=3D=3D Failed dependencies for qemuarm (17) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161117_032146.log/
Found differences:=20
Found errors:=20
    * ERROR: 17 issues were found in these recipes: kodi libsdl2 obex-data-=
server obexftp python3-scales vlc webkitgtk wireshark xfce4-vala

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (9) =3D=3D=
=3D
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161117_032146.log//2_max/failed/kodi.log
    * libsdl2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161117_032146.log//2_max/failed/libsdl2.log
    * obex-data-server -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20161117_032146.log//2_max/failed/obex-data-ser=
ver.log
    * obexftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161117_032146.log//2_max/failed/obexftp.log
    * python3-scales -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20161117_032146.log//2_max/failed/python3-scales.=
log
    * vlc -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20161117_032146.log//2_max/failed/vlc.log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161117_032146.log//2_max/failed/webkitgtk.log
    * wireshark -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161117_032146.log//2_max/failed/wireshark.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20161117_032146.log//2_max/failed/xfce4-vala.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (7) =3D=3D=
=3D
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161117_032146.log//3_min/failed/kodi.log
    * obex-data-server -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20161117_032146.log//3_min/failed/obex-data-ser=
ver.log
    * obexftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161117_032146.log//3_min/failed/obexftp.log
    * python3-scales -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemuarm.20161117_032146.log//3_min/failed/python3-scales.=
log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161117_032146.log//3_min/failed/webkitgtk.log
    * wireshark -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161117_032146.log//3_min/failed/wireshark.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20161117_032146.log//3_min/failed/xfce4-vala.log

=3D=3D=3D Failed dependencies for qemux86 (12) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161118_031152.log/
Found differences:=20
Found errors:=20
    * ERROR: 12 issues were found in these recipes: chromium libsdl2 obex-d=
ata-server obexftp wireshark xfce4-vala

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (6) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161118_031152.log//2_max/failed/chromium.log
    * libsdl2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161118_031152.log//2_max/failed/libsdl2.log
    * obex-data-server -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20161118_031152.log//2_max/failed/obex-data-ser=
ver.log
    * obexftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161118_031152.log//2_max/failed/obexftp.log
    * wireshark -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161118_031152.log//2_max/failed/wireshark.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemux86.20161118_031152.log//2_max/failed/xfce4-vala.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (5) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161118_031152.log//3_min/failed/chromium.log
    * obex-data-server -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20161118_031152.log//3_min/failed/obex-data-ser=
ver.log
    * obexftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161118_031152.log//3_min/failed/obexftp.log
    * wireshark -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161118_031152.log//3_min/failed/wireshark.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemux86.20161118_031152.log//3_min/failed/xfce4-vala.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20161117_101022.log/


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
meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb:PNBLACKLIST[xfspr=
ogs] ?=3D "BROKEN: Needs upgrade to 4.5.0 version to be compatible with Ker=
nel uapi changes from 4.5"
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
meta-shr/recipes-BROKEN: needs to be adapted to new qtwayland-5.7"
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


count: 1	issue: build-deps
mpv-0.15.0: mpv rdepends on libvdpau, but it isn't a build dependency, miss=
ing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]


count: 3	issue: file-rdeps
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]


count: 24	issue: version-going-backwards
breakpad-git: Package version for package breakpad-dbg went backwards which=
 would break package feeds from (0:svn-r0.36 to 0:git-r0.0) [version-going-=
backwards]
breakpad-git: Package version for package breakpad-dbg went backwards which=
 would break package feeds from (0:svn-r0.39 to 0:git-r0.0) [version-going-=
backwards]
breakpad-git: Package version for package breakpad-dbg went backwards which=
 would break package feeds from (0:svn-r0.42 to 0:git-r0.0) [version-going-=
backwards]
breakpad-git: Package version for package breakpad-dev went backwards which=
 would break package feeds from (0:svn-r0.36 to 0:git-r0.0) [version-going-=
backwards]
breakpad-git: Package version for package breakpad-dev went backwards which=
 would break package feeds from (0:svn-r0.39 to 0:git-r0.0) [version-going-=
backwards]
breakpad-git: Package version for package breakpad-dev went backwards which=
 would break package feeds from (0:svn-r0.42 to 0:git-r0.0) [version-going-=
backwards]
breakpad-git: Package version for package breakpad-doc went backwards which=
 would break package feeds from (0:svn-r0.36 to 0:git-r0.0) [version-going-=
backwards]
breakpad-git: Package version for package breakpad-doc went backwards which=
 would break package feeds from (0:svn-r0.39 to 0:git-r0.0) [version-going-=
backwards]
breakpad-git: Package version for package breakpad-doc went backwards which=
 would break package feeds from (0:svn-r0.42 to 0:gitdump-upload went backw=
ards which would break package feeds from (0:svn-r0.42 to 0:git-r0.0) [vers=
ion-going-backwards]
breakpad-git: Package version for package breakpad-staticdev went backwards=
 which would break package feeds from (0:svn-r0.36 to 0:git-r0.0) [version-=
going-backwards]
breakpad-git: Package version for package breakpad-staticdev went backwards=
 which would break package feeds from (0:svn-r0.39 to 0:git-r0.0) [version-=
going-backwards]
breakpad-git: Package version for package breakpad-staticdev went backwards=
 which would break package feeds from (0:svn-r0.42 to 0:git-r0.0) [version-=
going-backwards]
breakpad-git: Package version for package breakpad-sym-upload went backward=
s which would break package feeds from (0:svn-r0.36 to 0:git-r0.0) [version=
-going-backwards]
breakpad-git: Package version for package breakpad-sym-upload went backward=
s which would break package feeds from (0:svn-r0.39 to 0:git-r0.0) [version=
-going-backwards]
breakpad-git: Package version for package breakpad-sym-upload went backward=
s which would break package feeds from (0:svn-r0.42 to 0:git-r0.0) [version=
-going-backwards]
breakpad-git: Package version for package breakpad went backwards which wou=
ld break package feeds from (0:svn-r0.36 to 0:git-r0.0) [version-going-back=
wards]
breakpad-git: Package version for package breakpad went backwards which wou=
ld break package feeds from (0:svn-r0.39 to 0:git-r0.0) [version-going-back=
wards]
breakpad-git: Package version for package breakpad went backwards which wou=
ld break package feeds from (0:svn-r0.42 to 0:git-r0.0) [version-going-back=
wards]


count: 2	issue: host-user-contaminated
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-doi-in/usr/lib/lo=
cale/doi_IN/LC_MEASUREMENT is owned by uid 3004, which is the same as the u=
ser running bitbake. This may be due to host contamination [host-user-conta=
minated]
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-pt-br/usr/lib/loc=
ale/pt_BR/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
91c3b34 lib/bb/cooker.py: fix for BBFILE_PATTERN =3D ""
not included in master yet:=20
4f95c8d world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
a675b2c sanity.bbclass: fix logging of an error
not included in master yet:=20
42633bc qemux86: Add identical qemux86copy variant for tests
6bb13b6 sstate-sysroot-cruft.sh: Extend the whitelist
51d1286 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
f1c2480 buildhistory.bbclass: metadata-revs show repo parent
b060f95 metadata-revs: provide more information
a956d2c report-error: Allow to upload reports automatically

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
7f8915a wireshark: install missing header files
not included in master yet:=20
52829ae lksctp-tools: 1.0.16 -> 1.0.17
1ef70fd drbd-utils: 8.9.3 -> 8.9.6
03cf724 fftw: Remove the fftw-dev package dependency on non-existent fftw p=
ackage.
5313d04 libxklavier: upgrade 5.4
2af1cea nginx: update to version 1.10.2
3d9e6de sdparm: 1.09 -> 1.10
3e695ae apache2: cve-2016-5387
ac41e03 libtinyxml2: Upgrade 3.0.0 -> 4.0.1
ac5e765 libmicrohttpd: update to version 0.9 menulibre: initial add 2.1.3
2a39d56 xfce4-whiskermenu-plugin: update to 2.0.2
8f95aa8 xfce4-whiskermenu-plugin: add menulibre to RRECOMMENDS
a864648 ristretto: update to 0.8.1
983b9d7 xfconf: update to 4.12.1
c6991d3 xfce4-notifyd: update to 0.3.3
3c6da1a poppler: update to 0.48.0
63516c9 xfce4-terminal: update to 0.8.1
7e31544 xfce4-panel: do not display desktop icon when no window is opened
1b414ce xfce4-panel: update to 4.12.1
a7c4608 libwnck3: add a recipe
dfaeb3e gstreamer: fix rare but annoying build errors
bf81a51 ttf-abyssinica: update SRC_URI
e2325f4 libiio: add recipe
7061283 squid: disable gnu atomic operations for mipsel
23a7f8d python-m2crypto: inherit siteinfo
a56dddd chrony: remove unrecognized option ipv6
6b0be77 meta_oe_security_flags: Disable PIE for s3c64xx-gpio/s3c24xx-gpio/c=
pufrequtils
170de5a boinc: Add recipe for boinc-client
c292e99 meta_oe_security_flags.inc: Add libcec, libmodplug, libcdio
7d9dd8c dcadec, libsquish: Add new recipes
b032a63 fix QA Issue for opensaf
9d2b852 libiio: add recipe
5914eab fwts: Update to 16.09 release
70e09c1 libvdpau: Add recipe
0533796 krb5: Add -fPIC to compile flags
84d6a1f libvdpau: Disable PIE
7fdf37f libcec: Update to 3.1.0+
04dc34b kodi: Add krypton/17.x Jarvis/16.x recipes
4a7d3d6 streamripper: add v1.64.6
bcf35d9 tsock: Make use of LDFLAGS
0adff8f kodi: Fix build with pic on x86_64
a7d71db mariadb: use faster download URL
264b8db edac-utils: fix systemd service
65705ee python-scales: add recipe for version 1.0.9
f4cd45e python-cassandra-driver: add recipe for version 3.7.1
a88416a python-spidev: add recipe for version 3.2
661d598 augeas: fix QA warning
6d95ecc fwknop: Initial add 2.6.9
9012b24 libplist: Remove rpaths surgically
993b0f2 kodi-17: Add packageconfig for lcms support
d3ab4e4 Revert "physfs: move to sources found at github/supertux"
1d2d076 xfce4-battery-plugin: update to 1.1.0
070bd73 xfce4-datetime-plugin: update to 0.7.0
bd77ca4 xfce4-diskperf-plugin: update to 2.6.0
60e78ec xfce4-fsguard-plugin: update to 1.1.0
7372707 xfce4-mpc-plugin: update to 0.5.0
6155b86 xfce4-netload-plugin: update to 1.3.0
0e9129f xfce4-smartbookmark-plugin: update to 0.5.0
fc4a397 xfce4-systemload-plugin: update to 1.2.0
c3fdac8 xfce4-wavelan-plugin: update to 0.6.0
6cd6847 xfmpc: update to 0.2.3
90f7486 gparted: update to 0.27.0
36860f8 networkmanager: update to 1.4.2
b918893 network-manager-applet: update to 1.4.2
36c59fc portaudio-v19: update to v190600 released on 20161030
f6c3339 python-pyserial: remove serialjava.py
cfda0ae samba: Fix build with musl
fc5abe2 lockdev: Pretend GNU libc on musl
ada6bc5 kodi-17: Fix build with musl
a290a4e gnuplot: upgrade to 5.0.5
8079ede glmark: update to latest sources
3ccde0f pyyaml: Enable nativesdk bake
6b7fe33 breakpad: Upgrade to latest
9975789 iozone3: 434 -> 465
86fbc95 libhugetlbfs: 1.19 -> 1.20
6faacd0 phoronix-test-suite: 6.0.1 -> 6.6.1
b8b4b2c asio: DEPENDS on openssl
bda3baf asio: fix a musl compilation warning
60e0c96 apache2: include .load files in modules.d
5589fea openjpeg: rename the download file
d1a0a87 openobex: upgrade to 1.7.2
94a0bd0 python-humanize, python3-humanize: Add recipe for version 0.5.1
e3dbe72 ifenslave: make option '-h' work
c00fd46 opencv: fix QA issue
ace909b libeigen: set tarball name as ${BP}.tar.bz2
68bda63 libowfat: add v0.31
19cc43c lvm2: 2.02.138 -> 2.02.166
666342d opencv: checking existence of /usr/lib
5928fab libdbus-c++: added recipe for it
357ab85 ncp: add v1.2.4

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
81fb771 Update Qt5's git repositories to match new locations
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
1edcce7 chromium-wayland: skip when CHROMIUM_ENABLE_WAYLAND isn't enabled
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
6d82a3f libqofono: use the recipe from meta-qt5
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
eb87e6d linux-lg-mako: bump SRCREV to fix build with gcc6
not included in master yet:=20

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgvMRsACgkQN1Ujt2V2gByXmACeN90409ULky98yb9K+MIZtJdV
448AoLJPiedwaC28lvOlv1Wwx8eDdjAm
=awQD
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
