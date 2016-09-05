Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEAD6FFFE;
	Mon,  5 Sep 2016 11:26:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a6so1594728wmc.2;
	Mon, 05 Sep 2016 04:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=IxJhk882q6L3Iwz2PAcY1lTsBgG+LLuYEjIs2pJFlsM=;
	b=ZaC/m+BYa9X8fylSvcu4Jf6mkmZTxWKhFOz2j1Sj7c8fZJo5aAQA0a2ghbfM6rkHyU
	6qz+qGkKc3glGWSLvDeKAGHtB+TLyFjv5bTQQrSZKQIr6UJTb9BHBCibHz70Eh2r54Wy
	xnKUQXPk49Ug3jGJFVkro742wlWxl9dMD/ExU9T7zx8J/v/rXjKBi4T3StsyIx0cU3WE
	Bktd1iSZywF8ieB/3HuZLJBdChaJgh/hzm1wNuFJYKNfs5yMySXp6X7EwwD5bVDOmrf/
	ryBwRISmn6O4gRIQ5vwrhb71iayQANePoO7V316YZEQ0t/tOob6pZCAyUJG9Bz9e+ZTp
	jPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=IxJhk882q6L3Iwz2PAcY1lTsBgG+LLuYEjIs2pJFlsM=;
	b=IT0aR83qamaSAPHmgNd/GrWR5lkpomgGmxxoaFVI5OIwQ8nDtpX6FdPrPv1F7DgK2d
	4v6Cf4lXW2+3kcoVccOWn3uu0+fAOb0zCh5gUqgN6PPOKBgTWsK5U2M3cEI1klWxWuXZ
	9NLs/vKtznBcFPR2CrhGcANNXYfc4KNgy3R2VDfdLIs1qE1OI5T7tQ2mU+XnW9TOofc1
	UTMxKAirDqfWpOoP+tQw/f1zpj13FI5JTDkIZnBXYtKJuiLebirVNAsb504itRCy7Z98
	K5W3CNyH1O1jciQv3QD2V8DS5kOOSNSEwDkDQ5Nj9Ry4Xjl2evImmextaXS5ekl75JdA
	hjqA==
X-Gm-Message-State: AE9vXwMnwjmKXMC+EbkFjbfapUKmo0I3lPlMhyjcngPz4poprsa+GdGkmGe3sQs39vZMcw==
X-Received: by 10.28.103.87 with SMTP id b84mr14911404wmc.89.1473074761486;
	Mon, 05 Sep 2016 04:26:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	i195sm1772229wmg.14.2016.09.05.04.26.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Sep 2016 04:26:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Sep 2016 13:26:00 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160905112600.zn4ckfygskphp4ph@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: State of bitbake world 2016-09-01
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
X-List-Received-Date: Mon, 05 Sep 2016 11:26:02 -0000
X-Groupsio-MsgNum: 86743
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5bcl2vzwdnfifh7w"
Content-Disposition: inline

--5bcl2vzwdnfifh7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This time with complete QA log, I've also upgraded jenkins slaves
running these builds from 14.04 to 16.04.

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
||2016-09-01	||1	||5	||4	||13	||2	||2	||17	||4	||4	||0	||0		||0		||1		||10	=
	||16		||0		||1		||1		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-09-01 =3D=3D

INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20160905_011801.log

=3D=3D=3D common (1) =3D=3D=3D
    * openembedded-core/meta/recipes-support/libunwind/libunwind_git.bb:do_=
compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb=
:do_patch

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (3) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/directfb/directfb_1.7.7.bb=
:do_configure

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb:=
do_compile

=3D=3D=3D Number of failed tasks (10) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemuarm.20160901_181341.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/20858/
|-
|| qemux86 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemux86.20160831_080009.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/20794/
|-
|| qemux86_64 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
world.qemux86-64.20160901_060523.log/ || http://errors.yoctoproject.org/Err=
ors/Build/20867/
|}
=3D=3D=3D PNBLACKLISTs (125) =3D=3D=3D

=3D=3D=3D QA issues (29) =3D=3D=3D
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
||0	||version-going-backwards
|-
||10	||build-deps
|-
||16	||file-rdeps
|-
||1	||host-user-contaminated
|-
||1	||installed-vs-shipped
|-
||1	||textrel
|}



=3D=3D=3D Failed dependencies for qemuarm (13) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160901_045319.log/
Found differences:=20
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
    * ERROR: 13 issues were found in these recipes: enchant jasper libdrm l=
ibunwind samba

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (2) =3D=3D=
=3D
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160901_045319.log//2_max/failed/libunwind.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160901_045319.log//2_max/failed/samba.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (2) =3D=3D=
=3D
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160901_045319.log//3_min/failed/libunwind.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160901_045319.log//3_min/failed/samba.log

=3D=3D=3D Failed dependencies for qemux86 (17) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160902_030118.log/
Found differences:=20
    * WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build d=
ependency?
    * WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build=
 dependency?
    * WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dep=
endency?
    * WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build de=
pendency?
    * WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a =
build dependency?
    * WARN: enchant: enchant rdepends on hunspell, but it isn't a build dep=
endency?
Found errors:=20
    * ERROR: 17 issues were found in these recipes: chromium chromium-wayla=
nd enchant jasper libdrm libunwind samba

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (4) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160902_030118.log//2_max/failed/chromium.log
    * chromium-wayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/lo=
g.dependencies.qemux86.20160902_030118.log//2_max/failed/chromium-wayland.l=
og
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160902_030118.log//2_max/failed/libunwind.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160902_030118.log//2_max/failed/samba.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (4) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160902_030118.log//3_min/failed/chromium.log
    * chromium-wayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/lo=
g.dependencies.qemux86.20160902_030118.log//3_min/failed/chromium-wayland.l=
og
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160902_030118.log//3_min/failed/libunwind.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160902_030118.log//3_min/failed/samba.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160901_092915.log/


    * ERROR: Nothing RPROVIDES 'samba' (but /home/jenkins/oe/world/shr-core=
/meta-smartphone/meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.b=
b RDEPENDS on or otherwise requires it)
    * ERROR: samba was skipped: Recipe is blacklisted: BROKEN: fails to bui=
ld with new binutils-2.27
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /ho=
me/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'samba' (but /home/jenkins/oe/world/shr-core=
/meta-smartphone/meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.b=
b RDEPENDS on or otherwise requires it)
    * ERROR: samba was skipped: Recipe is blacklisted: BROKEN: fails to bui=
ld with new binutils-2.27
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'samba' (but /home/jenkins/oe/world/shr-core=
/meta-smartphone/meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.b=
b RDEPENDS on or otherwise requires it)
    * ERROR: samba was skipped: Recipe is blacklisted: BROKEN: fails to bui=
ld with new binutils-2.27
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
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[s=
mbnetfs] ?=3D "Depends on broken samba"
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
meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.b=
b:PNBLACKLIST[gnome-control-center] ?=3D "Depends on broken gnome-menus"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnom=
e-menus] ?=3D "BROKEN: fails to build because of python"
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
meta-networking/recipes-connectivity/samba/samba_4.4.5.bb:PNBLACKLIST[samba=
] ?=3D "BROKEN: fails to build with new binutils-2.27"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D "BROKEN: Tries to build kernel module and fails, either it should be di=
sabled or there should be dependency on kernel like in netmap-modules"
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[ac=
cel-ppp] ?=3D "BROKEN: fails to build with new binutils-2.27"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
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
meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb:PNBLACKLIST[geany-plug=
ins] ?=3D "Causes multiple QA errors and LICENSE warnings"
meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt] ?=3D=
 "BROKEN: fails since last autotools.bbclass changes"
meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb:PNBLACKLIST[mpich] ?=3D "BROK=
EN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc fa=
iled sanity test (tmpdir)"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
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
otgps] ?=3D "Depends on broken gpsd"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5"
meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb:PNBLACKLIST[gpsd] ?=3D "BROKEN=
: fails to build with new binutils 2.27"
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
hicce-image] =3D "tries to include whole downloads directory in /home/build=
er/poky :/"
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking other=
 kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other kernels a=
nd modules - broken for years"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 1	issue: textrel
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 10	issue: build-deps
apt-1.2.12: apt rdepends on lz4, but it isn't a build dependency, missing l=
z4 in DEPENDS or PACKAGECONFIG? [build-deps]
chrony-2.4: chronyc rdepends on nss, but it isn't a build dependency, missi=
ng nss in DEPENDS or PACKAGECONFIG? [build-deps]
chrony-2.4: chrony rdepends on libcap, but it isn't a build dependency, mis=
sing libcap in DEPENDS or PACKAGECONFIG? [build-deps]
chrony-2.4: chrony rdepends on nss, but it isn't a build dependency, missin=
g nss in DEPENDS or PACKAGECONFIG? [build-deps]
gammu-1.32.0: libgsmsd rdepends on unixodbc, but it isn't a build dependenc=
y, missing unixodbc in DEPENDS or PACKAGECONFIG? [build-deps]
libqmi-1.16.0: libqmi rdepends on libcap, but it isn't a build dependency, =
missing libcap in DEPENDS or PACKAGECONFIG? [build-deps]
libqmi-1.16.0: libqmi rdepends on libgudev, but it isn't a build dependency=
, missing libgudev in DEPENDS or PACKAGECONFIG? [build-deps]
libqmi-1.16.0: libqmi rdepends on libmbim, but it isn't a build dependency,=
 missing libmbim in DEPENDS or PACKAGECONFIG? [build-deps]
libqmi-1.16.0: libqmi rdepends on libudev, but it isn't a build dependency,=
 missing systemd in DEPENDS or PACKAGECONFIG? [build-deps]
mpv-0.15.0: mpv rdepends on libjack, but it isn't a build dependency, missi=
ng jack in DEPENDS or PACKAGECONFIG? [build-deps]


count: 16	issue: file-rdeps
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
networkmanager-1.0.12: /usr/bin/nmtui contained in package networkmanager-n=
mtui requires libnewt.so()(64bit), but no providers found in RDEPENDS_netwo=
rkmanager-nmtui? [file-rdeps]
networkmanager-1.0.12: /usr/bin/nmtui contained in package networkmanager-n=
mtui requires libnewt.so, but no providers found in RDEPENDS_networkmanager=
-nmtui? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /xcmd.so.0()(64bit), but no providers f=
ound in RDEPENDS_xfsprogs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_quota contained in package xfsprogs requires =
libxcmd.so.0, but no providers found in RDEPENDS_xfsprogs? [file-rdeps]


count: 0	issue: version-going-backwards


count: 1	issue: host-user-contaminated
opensaf-5.0.0: opensaf: /opensaf/etc/init.d/opensafd is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
upower: 3 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
0ed8975 fetch2: clean up remaining cwd saves/changes
not included in master yet:=20
52acda8 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
384cf92 init-install: Fixes the install script failing when not finding any=
 mmcblk devices
not included in master yet:=20
f97db2c base,autotools: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF only =
in autotools.bbclass
7357f22 qemux86: Add identical qemux86copy variant for tests
accd67c sstate-sysroot-cruft.sh: Extend the whitelist
73a4bc9 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
2b9c211 buildhistory.bbclass: metadata-revs show repo parent
09e5908 metadata-revs: provide more information
75e6505 report-error: Allow to upload reports automatically
9538153 icecc.bbclass: replace os.popen with subprocess.check_output
b1e9b80 test-dependencies.sh: Strip also '\.bb: .*' before adding failed re=
cipe to list of failed

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
fef7b1f libqb: 0.17.1 -> 0.17.2
not included in master yet:=20
92e72f2 openconnect: fix do_compile failure
ec38a11 libtevent: Add back the dependency on libcap
3287f5a snort: Add lzma to PACKAGECONFIG
6ac1a89 wireshark: update to 2.0.5
1e5b2ca ifenslave: upgrade to 2.7
f238200 lftp: 4.6.3a -> 4.7.3
32f598e postfix: 3.0.3 -> 3.1.1
b4a529b squid: add missing patch header
188a385 yp-tools: fix compile errors
bea1107 ipvsadm: fix QA warning for GNU_HASH
cdbb4b2 iscsitarget: fix QA warning for GNU_HASH
7cdb4ab vboxguestdrivers: Add recipe for vbox 5.x
1146c78 core-image-minimal-xfce: add kernel modules to image
d328779 python-cffi: Extend recipe to support Python 3
b3cf1e3 python-cryptography: Extend recipe to support Python 3
9602f1e python-idna: Extend recipe to support Python 3
30770d9 python-pyasn1: Extend recipe to support Python 3
d25cd94 python-pycparser: Extend recipe to support Python 3
b567720 python-pyopenssl: Extend recipe to support Python 3
c17c77e python-urllib3: Extend recipe to support Python 3
de7507a python-cryptography-vectors: Extend recipe to support Python 3
6ba4f3f python-iso8601: Extend recipe to support Python 3
4c08fcd python-pretend: Extend recipe to support Python 3
68362c6 python-pytest: Extend support to python 3
f58d8e4 python-py: Extend recipe to support Python 3
3af0f3f python-wcwidth, python3-wcwidth: Add recipe for version 0.1.7
7f244f2 python-ndg-httpsclient, python3-ndg-httpsclient: Add recipe for ver=
sion 0.4.2
9deab0c python-prompt-toolkit, python3-prompt-toolkit: Add recipe for versi=
on 1.0.6
3d51199 python-pysocks, python3-pysocks: Add recipe for version 1.5.7
5dfba13 python-requests, python3-requests: Update to version 2.11.1
9511TRO_FEATURES
ead0a93 tnftp: control ipv6 support based on DISTRO_FEATURES
cac0fd5 wolfssl: control ipv6 support based on DISTRO_FEATURES
86f528a znc: control ipv6 support based on DISTRO_FEATURES
9649458 iperf: control ipv6 support based on DISTRO_FEATURES
5e9a245 php: control ipv6 support based on DISTRO_FEATURES
fb7f493 cherokee: control ipv6 support based on DISTRO_FEATURES
a9fc96a xfce4-mailwatch-plugin: control ipv6 support based on DISTRO_FEATUR=
ES
5bb151c inetutils: fixes for ipv6 feature
4891913 nodejs: update to 4.5.0
d9c18e2 gitpkgv: Fix $GITPKV for a single named git source
5018d20 libhugetlbfs: add libhugetlbfs-perl to RDEPENDS
2d3e6ff openldap: 2.4.43 -> 2.4.44
b019044 squid: don't do squid-conf-tests at build time
842407b openvpn: 2.3.8 -> 2.3.9
a859121 vim: split tools directory into vim-tools package
b3fe02f krb5: Fix S4U2Self KDC crash when anon is restricted
a5e07e0 libglade: add a recipe from oe-core
02d5732 gnome-control-center, gthumb: correctly remove a file from the sour=
ce tree
860d256 gtk-doc: disable where necessary
fabd870 mailcap: 2.1.45 -> 2.1.46
3ba4584 mcelog: 1.09 -> 1.40
c457fb1 networkmanager: 1.0.10 -> 1.0.12
476dcf0 asio: fix musl compilation (strerror_r)
85ce287 python3-vcversioner: add recipe
ab3cf76 python3-jsonschema: set dependency to vcversioner
3298ddf gnome-keyring: Turn off QA check dev-elf
4fd8bd0 php: update to 5.5.38 and 5.6.25
73866a8 lvm2: tweak MODPROBE_CMD for cross compile
6a65bfa thin-provisioning-tools: add version 0.6.3
147c171 lua: 5.3.2 -> 5.3.3
781f5f8 crda: fix QA Issue: No GNU_HASH in the elf binary
b1399ea openwsman: 2.6.2 -> 2.6.3
c0f993c gpsd, foxtrotgps: blacklist, fails to build with new binutils-2.27
f2a8470 gnome-menus, gnome-panel3, gnome-control-center: blacklist, gnome-m=
enus fails to build because of python
1433245 accel-ppp: blacklist, fails to build with new binutils-2.27
b84b8be samba: blacklist, fails to build with new binutils-2.27
b8fe56d glmark2: blacklist, fails to build with gcc-6
4c696b8 tracker: blacklist, fails to build with new binutils-2.27
4e6ad12 geany-plugins: blacklist because of QA issues
22222ea smbnetfs: blacklist, depends on broken samba
4bbd087 xf86-input-tslib: remove
619cb58 efl: remove dependency on tslib
436d91c directfb: add PACKAGECONFIG for inputdrivers
6e98c43 pidgin-sipe purple-skypeweb whatsapp-purple freeimage: add more pid=
gin plugins
30dd260 Revert "pidgin-sipe purple-skypeweb whatsapp-purple freeimage: add =
more pidgin plugins"

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
d9cd5ed qtbase: fix drm dependency for eglfs PACKAGECONFIG
not included in master yet:=20
c2ddf66 qtbase: Fix build with QT_NO_OPENGL
5041f27 qtbase: avoid QA warning if PACKAGECONFIG_RELEASE =3D "debug"
3c27915 qtvirtualkeyboard: add PACKAGECONFIG options
37a165b qtdeclarative: add upstream patch to fix QtQml crash with GCC 6
97a1813 libconnman-qt5: move to recipes-connectivity and don't use MeeGo as=
 prefix
e01ea26 libqofono: import from meta-luneos layer

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
d4deef1 Merge pull request #13 from twoerner/contrib/twoerner/chromium-spli=
t-3
not included in master yet:=20
c2fb29f firefox: Fix build using gcc 6
4e93f95 chromium: install all pak files plus resources and blob.bin files.

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
b0ca23f freeimage: bump SRCREV to fix build with gcc6
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
test upstream commit:=20
02777ec meta-palm, meta-htc: drop tslib references
not included in master yet:=20
f5cde02 aceofpenguins: blacklist, fails to build with new binutils-2.27
ee001db xserver-xorg: return bbappend
0475eb0 packagegroup-shr-feed: remove dependency on tslib
d35e96d fsotdld: add PACKAGECONFIG for gpsd and disable by default
852f829 packagegroup-shr-feed: remove dependency on samba

--5bcl2vzwdnfifh7w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfNVkcACgkQN1Ujt2V2gBwrLwCeLFkV7BywrXWgwPqu780SNQ7C
Ca8An1CjoZmDR1HydZwK8TZ+PKyQqptA
=pY+q
-----END PGP SIGNATURE-----

--5bcl2vzwdnfifh7w--
