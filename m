Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A23BE73286;
	Fri, 26 Aug 2016 15:51:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so11859226wmf.3;
	Fri, 26 Aug 2016 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=JsZG8yjaqdlBYsK8clGvDx7Yayy1lXGAq67GDrEA9Uo=;
	b=OpZKtAVh9gqebsdMJsiUOoiU57qsoqGFvwSzxBn0kLg3bCtSHZJEJF0vacQHqsrjy8
	B5l/E55z2rmWcvcRD/67o7bCGr1jyVsXJ34brYJ/pJKt5bTl4tsYaMyIfBv2QwKLVwo2
	RGLQMPik5HEY0CuRg+Nzlu8GqLU2wwvTAf6gHl6svsmIKTN+Oimu2Ue/QOAjNmjI2y3a
	6gINtUybXpeitiOy4fCV7T1EBVo9yLO9tTOp5KyT9YYzDTtfg1s5c/s+F486veo8o7NO
	H9D5AHG59bUW7ABttf1PLO3gOYWPQdmpVlHWoqWVJn0A73OFqMy5H4Oeno6sGVRPIh41
	KL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=JsZG8yjaqdlBYsK8clGvDx7Yayy1lXGAq67GDrEA9Uo=;
	b=RHaOZUzRq1Fg2iyxD0HxpsY+FOZdYmy0cUu0G1tXYiXntjGGlgqvRQkH4fbNyJpBR9
	4U5OG1yKFydIJUyTwfZudP/W7T8BJqASD9p++mIzAhWojnhubf9Lst4RxoH0qNK5Ph0z
	Om3oKNZfaHChj/oNRX3HfHi7VlMWp/6jlZonq9AZLfNdg+ZOD69YPsVGGcNQJNkLcyZm
	SWYE7/ct4s9fu7zwX01zrrRw+GnF2GAMU6sKi+wUkJUNDV4im4RqnAEZ3xSTlCqe692f
	OmKyNLp/Fd4gVQ6HOo1/W8KC/IEb/+oEMuz7For151cHH73CNx3aSKxQT9LGqWSlIgxd
	8xog==
X-Gm-Message-State: AE9vXwOoc8YKrDQEh8TDvLKZwUoLM0vntLLYRBRBzYTu2keCpSdV0+yyyHSFWaw/kN2YDA==
X-Received: by 10.28.65.84 with SMTP id o81mr4768596wma.83.1472226709129;
	Fri, 26 Aug 2016 08:51:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	i3sm20559217wjd.31.2016.08.26.08.51.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Aug 2016 08:51:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 26 Aug 2016 17:51:54 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160826155154.6fzokkxh5hsuvxld@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: State of bitbake world 2016-08-24
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
X-List-Received-Date: Fri, 26 Aug 2016 15:51:53 -0000
X-Groupsio-MsgNum: 86384
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ff6oy2hjslfadbw"
Content-Disposition: inline

--7ff6oy2hjslfadbw
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
||2016-08-24	||8	||10	||12	||0	ls: cannot access log.dependencies.qemuarm.2=
0160824_054936.log//2_max/failed/*.log: No such file or directory
||0	ls: cannot access log.dependencies.qemuarm.20160824_054936.log//3_min/f=
ailed/*.log: No such file or directory
||0	||27	||10	||10	||1	||0		||0		||1		||13		||15		||0		||2		||2		||0		||0		=
||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-08-24 =3D=3D

INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20160826_054137.log

=3D=3D=3D common (8) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.=
30.5.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-support/tracker/tracker_0.14.2.b=
b:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.=
4.5.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/accel-ppp/accel-p=
pp_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb:do=
_compile
    * meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb:do_com=
pile
    * meta-smartphone/meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:do_co=
mpile
    * openembedded-core/meta/recipes-support/libunwind/libunwind_git.bb:do_=
compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb=
:do_patch

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.=
bb:do_fetch
    * meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb:=
do_compile

=3D=3D=3D Number of failed tasks (30) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemuarm.20160823_072911.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/20291/
|-
|| qemux86 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wo=
rld.qemux86.20160824_212924.log/ || http://errors.yoctoproject.org/Errors/B=
uild/20389/
|-
|| qemux86_64 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log=
=2Eworld.qemux86-64.20160824_231321.log/ || http://errors.yoctoproject.org/=
Errors/Build/20442/
|}

=3D=3D=3D PNBLACKLISTs (114) =3D=3D=3D

=3D=3D=3D QA issues (33) =3D=3D=3D
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
||13	||build-deps
|-
||15	||file-rdeps
|-
||1	||textrel
|-
||2	||host-user-contaminated
|-
||2	||installed-vs-shipped
|}



=3D=3D=3D Failed dependencies for qemuarm (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160824_054936.log/
ls: cannot access log.dependencies.qemuarm.20160824_054936.log//2_max/faile=
d/*.log: No such file or directory

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (0) =3D=3D=
=3D
    * * -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.=
qemuarm.20160824_054936.log//2_max/failed/*
ls: cannot access log.dependencies.qemuarm.20160824_054936.log//3_min/faile=
d/*.log: No such file or directory

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (0) =3D=3D=
=3D
    * * -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.=
qemuarm.20160824_054936.log//3_min/failed/*

=3D=3D=3D Failed dependencies for qemux86 (27) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160825_203254.log/
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
    * ERROR: 27 issues were found in these recipes: accel-ppp aceofpenguins=
 chromium chromium-wayland enchant glmark2 gnome-menus gpsd jasper libdrm l=
ibunwind samba tracker

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (10) =3D=3D=
=3D
    * accel-ppp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160825_203254.log//2_max/failed/accel-ppp.log
    * aceofpenguins -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160825_203254.log//2_max/failed/aceofpenguins.log
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160825_203254.log//2_max/failed/chromium.log
    * chromium-wayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/lo=
g.dependencies.qemux86.20160825_203254.log//2_max/failed/chromium-wayland.l=
og
    * glmark2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160825_203254.log//2_max/failed/glmark2.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160825_203254.log//2_max/failed/gnome-menus.log
    * gpsd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160825_203254.log//2_max/failed/gpsd.log
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160825_203254.log//2_max/failed/libunwind.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160825_203254.log//2_max/failed/samba.log
    * tracker -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160825_203254.log//2_max/failed/tracker.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (10) =3D=3D=
=3D
    * accel-ppp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160825_203254.log//3_min/failed/accel-ppp.log
    * aceofpenguins -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160825_203254.log//3_min/failed/aceofpenguins.log
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160825_203254.log//3_min/failed/chromium.log
    * chromium-wayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/lo=
g.dependencies.qemux86.20160825_203254.log//3_min/failed/chromium-wayland.l=
og
    * glmark2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160825_203254.log//3_min/failed/glmark2.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160825_203254.log//3_min/failed/gnome-menus.log
    * gpsd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160825_203254.log//3_min/failed/gpsd.log
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160825_203254.log//3_min/failed/libunwind.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160825_203254.log//3_min/failed/samba.log
    * tracker -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160825_203254.log//3_min/failed/tracker.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (1) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160822_183717.log/
    * ERROR: 1 issues were found in these recipes: systemd-compat-units

    * ERROR: 1 errors found in signatures.qemuarm.do_package_write_ipk.sigd=
ata.log

    * ERROR: systemd-compat-units different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1471927037/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 1 issues were found in these recipes: systemd-compat-units


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
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D "BROKEN: Tries to build kernel module and fails, either it should be di=
sabled or there should be dependency on kernel like in netmap-modules"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
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
PNBLACKLIST[build-appliance-image] =3D "tries to inclusues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 1	issue: textrel
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 13	issue: build-deps
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
geany-plugins-1.27: geany-plugins-debugger rdepends on libvte9, but it isn'=
t a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
geany-plugins-1.27: geany-plugins-multiterm rdepends on libvte9, but it isn=
't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-dep=
s]
geany-plugins-1.27: geany-plugins-scope rdepends on libvte9, but it isn't a=
 build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
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


count: 15	issue: file-rdeps
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
anager-nmtui requires libnewt.so, but no providers found in RDEPENDS_networ=
kmanager-nmtui? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui contained in package networkmanager-n=
mtui requires libnewt.so()(64bit), but no providers found in Res libxfs.so.=
0()(64bit), but no providers found in RDEPENDS_xfsprogs-mkfs? [file-rdeps]
xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires =
libxfs.so.0, but no providers found in RDEPENDS_xfsprogs-mkfs? [file-rdeps]
xfsprogs-3.2.3: /sbin/xfs_repair contained in package xfsprogs requires lib=
xfs.so.0, but no providers found in RDEPENDS_xfsprogs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_copy contained in package xfsprogs requires l=
ibxfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs? [file-rde=
ps]


count: 0	issue: version-going-backwards


count: 2	issue: host-user-contaminated
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-ga-ie/usr/lib/loc=
ale/ga_IE/LC_CTYPE is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]
opensaf-5.0.0: opensaf: /opensaf/etc/init.d/opensafd is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]


count: 2	issue: installed-vs-shipped
geany-plugins: 1 installed and not shipped files. [installed-vs-shipped]
upower: 3 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
deab9a3 siggen: Fix file variable typo in compare_sigfiles
not included in master yet:=20
ee4c1f4 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
e279c9a xserver-xf86-config: pre-load int10 and exa modules
not included in master yet:=20
5ceb1b0 qemux86: Add identical qemux86copy variant for tests
01e9a51 sstate-sysroot-cruft.sh: Extend the whitelist
c3c010a recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
178b2d1 buildhistory.bbclass: metadata-revs show repo parent
48bc134 metadata-revs: provide more information
f9348c7 report-error: Allow to upload reports automatically
c1272b9 icecc.bbclass: replace os.popen with subprocess.check_output
fc5001e test-dependencies.sh: Strip also '\.bb: .*' before adding failed re=
cipe to list of failed
348b3c9 base,autotools: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF only =
in autotools.bbclass

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
dc48e76 meta-oe: remove trailing spaces
not included in master yet:=20
332b32e openconnect: fix do_compile failure
7458e7a libtevent: Add back the dependency on libcap
1ae085e snort: Add lzma to PACKAGECONFIG
79c2c32 wireshark: update to 2.0.5
1ac81d9 ifenslave: upgrade to 2.7
b7836bc lftp: 4.6.3a -> 4.7.3
b6a9168 postfix: 3.0.3 -> 3.1.1
0a2d0d6 squid: add missing patch header
2450d3d yp-tools: fix compile errors
36961f2 yaffs2-utils: fix QA warning for GNU_HASH
f9d4036 libqb: 0.17.1 -> 0.17.2
b492824 ipvsadm: fix QA warning for GNU_HASH
81a2f50 iscsitarget: fix QA warning for GNU_HASH
9513d89 testfloat: Fix No GNU_HASH in the elf binary warnings
481f680 Revert "testfloat: Fix No GNU_HASH in the elf binary warnings"
7f354f5 poco: update to 1.7.4
71298e2 nodejs: use shared zlib instead of bundled one
9d5e830 nodejs, arm: map TUNE_FEATURES to --with-arm-fpu parameters
4d0fbaf libnet-dns-perl: 0.81 -> 1.06.
4a4839c pidgin-sipe purple-skypeweb whatsapp-purple freeimage: add more pid=
gin plugins
d590fe5 Revert "pidgin-sipe purple-skypeweb whatsapp-purple freeimage: add =
more pidgin plugins"

=3D=3D Tester =3D=3D
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
latest upstream commit:=20
e6f2ad9 meta-android: android-tools-conf: enable mtp
not included in master yet:=20
2613aa6 u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
46cfefb linux-gta04: bump SRCREV to get fixes for build with gcc-5

--7ff6oy2hjslfadbw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfAZTIACgkQN1Ujt2V2gBwX6wCeOiokWTZAECzoqRfaEnypTzW5
+EgAnjDyCSqVl3zM0lrDIlvBSKXDGwm+
=kHZi
-----END PGP SIGNATURE-----

--7ff6oy2hjslfadbw--
