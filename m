Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0867E60721;
	Fri, 29 Jul 2016 08:40:48 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so14685585wma.1;
	Fri, 29 Jul 2016 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=+oVaUkG4zxfDGF7qDiMvUDptSDCKC4PglWLCq0wBrmY=;
	b=fXBPgErwqlYa67Uu0Ru7dctCLc1RY/G8u1zYEFF73wiImjJ6bwh/rnaHrnl+7vzRnr
	rfzJvTe8UFMv9aazC8sl17Bs6r8g/TxKQqUphhvPbjDf4aHtkrxSF37nIHHNQKSnT4Y1
	q74t5mZg4UQ71/2CYHpZIBIcB9wmUWwLxClS1H1AT/Ygu4Rs/JujDseJSDA4AiHj5Tnc
	hYSGyMrK7X3vzuN4eWg/2Jm/Ouq6wVB4+mRUjvt+Qhd5c23YyJDNZQ5o+MWQ1knmeWb6
	pcxlRHlA9ZbImY08/3F51Fm+TvuPqhoGSGzXgu6+qtwHnylQe9Sb8MYUS+x1IaQ1VtCx
	IEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=+oVaUkG4zxfDGF7qDiMvUDptSDCKC4PglWLCq0wBrmY=;
	b=TkjCbPa3TYZInqVWQJwilcaepsTmcJX0/WBy2Sr+iUiW+to/uh/9WYoHObYFBXXDeY
	VBqncQTClmdlpLmk326uJAjg+Edq8Cg2O6/6+/BfgkFjugRFIVJK0SjXthi75rGkA0q/
	FWWDwEYRNcuaSpn1HlptfnoWTp/9JtYqtv+c9mKzuph6NtQTpLqwmIxaMf0jrdbTq+8L
	eaPpQw+gaEJkE4jJQdB+vjeUtcq2r9TD5lMJDkXoUbn5ubB91O/MwSO0w4OtIyQ5xMdx
	irNU2c04Vaj1dv6DXyhrbYfM6/t77DRG3iEzX7Qvvjhp7KNlN6w2TRL/GMO3wl3RDvZA
	/diw==
X-Gm-Message-State: AEkoousN4G4d5f1wGmbe54UDb4qFVqlvlRPR3nEEOgK0zky4vib6bmbnUEKxwbAZPD+oow==
X-Received: by 10.194.65.170 with SMTP id y10mr37734927wjs.26.1469781648356;
	Fri, 29 Jul 2016 01:40:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a3sm15377787wjm.30.2016.07.29.01.40.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 29 Jul 2016 01:40:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 29 Jul 2016 10:40:53 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160729084053.gisow6sf4gvdqp33@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: State of bitbake world 2016-07-29
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
X-List-Received-Date: Fri, 29 Jul 2016 08:40:51 -0000
X-Groupsio-MsgNum: 85097
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w2v4fhv256er6zrc"
Content-Disposition: inline

--w2v4fhv256er6zrc
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
||2016-07-28	||3	||3	||5	||14	||3	||3	||14	||3	||3	||0	||0		||0		||0		||0		=
||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-07-28 =3D=3D

INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20160728_212227.log

=3D=3D=3D common (3) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.=
30.5.bb:do_compile
    * meta-openembedded/meta-python/recipes-connectivity/gateone/gateone_gi=
t.bb:do_install
    * openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_compi=
le

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb:=
do_install
    * meta-openembedded/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.=
5.bb:do_install

=3D=3D=3D Number of failed tasks (11) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemuarm.20160728_054026.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/18812/
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemux86.20160728_054022.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/18813/
|-
|| qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
world.qemux86-64.20160728_071544.log/ || http://errors.yoctoproject.org/Err=
ors/Build/18819/
|}

=3D=3D=3D PNBLACKLISTs (123) =3D=3D=3D

=3D=3D=3D QA issues (0) =3D=3D=3D
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
||0	||textrel
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|}



=3D=3D=3D Failed dependencies for qemuarm (14) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160728_071553.log/
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
    * ERROR: 14 issues were found in these recipes: enchant gateone gnome-m=
enus jasper libdrm piglit samba

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (3) =3D=3D=
=3D
    * gateone -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160728_071553.log//2_max/failed/gateone.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160728_071553.log//2_max/failed/gnome-menus.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160728_071553.log//2_max/failed/piglit.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (3) =3D=3D=
=3D
    * gateone -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160728_071553.log//3_min/failed/gateone.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160728_071553.log//3_min/failed/gnome-menus.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160728_071553.log//3_min/failed/piglit.log

=3D=3D=3D Failed dependencies for qemux86 (14) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160728_085511.log/
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
    * ERROR: 14 issues were found in these recipes: enchant gateone gnome-m=
enus jasper libdrm piglit samba

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (3) =3D=3D=
=3D
    * gateone -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160728_085511.log//2_max/failed/gateone.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160728_085511.log//2_max/failed/gnome-menus.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160728_085511.log//2_max/failed/piglit.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (3) =3D=3D=
=3D
    * gateone -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160728_085511.log//3_min/failed/gateone.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160728_085511.log//3_min/failed/gnome-menus.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160728_085511.log//3_min/failed/piglit.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160728_105249.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
recipes-browser/chromium/chromium_48.0.2548.0.bb:PNBLACKLIST[chromium] ?=3D=
 "BROKEN: fails to build with gcc-6"
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
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
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
PNBLACKLIST[bigbuckbunny-48big and doesn't really need to be tested so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads di=
rectory in /home/builder/poky :/"
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking other=
 kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other kernels a=
nd modules - broken for years"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 0	issue: textrel


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
5081127 lib/bb/build: handle incomplete message fragments in log FIFO
not included in master yet:=20
28b2bd2 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
b32d430 dpkg: use snapshot.debian.org for SRC_URI
not included in master yet:=20
89643e2 qemux86: Add identical qemux86copy variant for tests
4af76e1 sstate-sysroot-cruft.sh: Extend the whitelist
82da615 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
5eec2a8 buildhistory.bbclass: metadata-revs show repo parent
a05c853 metadata-revs: provide more information
24f8bbd0 report-error: Allow to upload reports automatically
a5e917e icecc.bbclass: replace os.popen with subprocess.check_output
4e7b423 test-dependencies.sh: Strip also '\.bb: .*' before adding failed re=
cipe to list of failed

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
5c69367 python-flask-bootstrap: update to version 3.3.6.0 and fix RDEPENDS
not included in master yet:=20
29d3953 openconnect: fix do_compile failure
1837b06 mpg123: remove the recipe
8fa44e4 libmad: add the recipe
197e46c cpuset: add new python package
5ef064d libxfce4ui: Use native intltool for building the lib
aa93e9b x11vnc: remove redundant RPATH to fix QA issue
a4e9fbb libtevent: Add back the dependency on libcap
8543c05 nodejs: update to 4.4.7
d88a877 sshfs-fuse: update to 2.8
2b1a3c5 directfb: move recipe to meta-oe
4d08985 Mpd: use libsystemd
6b42d6c gtksourceview2: fix build with gcc6
fb61d4a mousepad: remove blacklist caused by gtksourceview2
8de8f82 plymouth: remove virtual prefix for RPROVIDES
b7303b1 nginx: update to version 1.11.2
fd00896 freeglut: add opengl to REQUIRED_DISTRO_FEATURES
eeadbd8 atftp: do not create user nobody
5af7667 apache2: update to version 2.4.23
1a1297d zeromq: Update to version 4.1.5.
eafef83 libsodium: Update to 1.0.10.
4c281d9 augeas: Move from oe-core
e865a47 uw-imap: use cross-tools to create static library
da9ff5c klibc: fix install destination in 64bit env
5792a16 contrib: add MIPS_INSTRUCTION_SET
23bde3b poco: update to 1.7.3
630b9b5 tokyocabinet: add recipe
face9e2 cfengine: add recipe and base policy
d2c59b1 ttf-liberation-sans-narrow: add a ttf font
fbdab31 ttf-vlgothic: add a ttf font
71f1de4 c-ares: use our compilation flags
71565bf meta-networking: override SECURITY_CFLAGS for c-ares
00c076e meta_networking_security_flags.inc: add weak assignment for lcl_may=
be_fortify
15abc08 php: update to 5.5.37 and 5.6.23
0b52174 snort: fix to remove from blacklist
dfbcc2b curlpp: fix QA issue for cav-octeon3
7a40115 squid: upgrade to 3.5.20
56fb026 wireshark: inherit perlnative
4cf7dthe new recipe
d47761e psqlodbc: Add the new recipe
9791b00 mariadb: upgrade to 5.5.50
8b4a08d xfce4-vala: unbreak by telling configure new vala API version
b103e54 packagegroup-tools-bluetooth: Fix incorrect LIC_FILES_CHKSUMs
8984206 libebml: fix do_unpack failure
ea59059 libnih: add new recipe to meta-oe
dd5a8fd sysbench: add new recipe
fa26f67 libssh: upgrade to 0.7.3
73224f1 libssh2: upgrade to 1.7.0

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
ecf7db0 qtwayland: Rework recipe to allow PACKAGECONFIG use
not included in master yet:=20
663f596 qtbase: add PACKAGECONFIG for journald logging
ec32b28 qtserialbus: add recipe

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
7773698 Merge pull request #12 from WarheadsSE/firefox-38.8.0esr
not included in master yet:=20
eaeed7e firefox: Fix build using gcc 6
1a26e29 chromium: install all pak files plus resources and blob.bin files.

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
d82a979 mmsd, packagegroup-webos-test: drop python-pygobject
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
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


--w2v4fhv256er6zrc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlebFpAACgkQN1Ujt2V2gBzLOwCfactuqT3fctQGl55FUbBi8UZi
l2AAnivdhu2AkecsfuBK4NxiRmdg9JrE
=TnTz
-----END PGP SIGNATURE-----

--w2v4fhv256er6zrc--
