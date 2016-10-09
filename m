Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E6672719A9;
	Sun,  9 Oct 2016 09:40:33 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f193so9573573wmg.2;
	Sun, 09 Oct 2016 02:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=f2JYjKWTWshbSeWr81wK0+vpK3HBhbQ5LVStzwjtLM0=;
	b=WnafDSTocgtyUcWnIxf8kJ2v1oH6c+kpruTLQVOTmADCqhI+OzRQXTbIYaAbtC7yW9
	Avhluy/5cGBN07Xn+cPasCez4RhRuRHJ0b2dYY5jG7PKRlftOU56kP3zqcXMQHDbA53b
	Au9DBw9vOAJWtQk4FrxCqls7Am4RDCBTiIxunjabkFGIBMSI6im9EOCNymYHP5nLCiPD
	A2G/olLavynomftJr2aajTscVAC9FomtpVORuEOq3FEq3RHqFuqRq2ZTN86FQav1QZiH
	gtehwRf6PtQNI7PKN2Zp+Vo4vEcN+rZlA++Mpkh3fexIvgicpzM0iIddcNF9J+h4Uu8g
	VpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=f2JYjKWTWshbSeWr81wK0+vpK3HBhbQ5LVStzwjtLM0=;
	b=WN8SX9GGD2VfWybYrljy3stXU//6auFJZoT1tnlm+6wzlth3jhDK2vTwLth00EfXJ/
	ll1yuiU+hXEuns1lWfExplh4JZKo/yu3jV4Mrra5OPBlmto8m20ZA3AeoON4/rZcHgbS
	sw60b1GV7WTuFMvVeB1NUY//aqzDRAGXoVDQkbcrzmeo+9LSQGhxU3nBWaMKtaE+zV5Y
	Cma7V5HBKdSc6NMMD60pR/c+ZfFXJaEQD69ZoU7aCCvnbtJZBzX0tZ2v6diJk0zl75ST
	GH+dThkWtgkmZy0l+rzXDphpNJ0CFFAWKUf9aJXxuDsRPcmgRdJ/Sy7a91hQrPYc/exh
	1kmA==
X-Gm-Message-State: AA6/9RmsproJoiAFop5260PirEDxaNwbW+JHbsUtv7Hf4iqEvhlkA96B/9LD+l6rbm7ELQ==
X-Received: by 10.194.103.165 with SMTP id fx5mr22467066wjb.188.1476006033918; 
	Sun, 09 Oct 2016 02:40:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	o196sm12387018wmg.8.2016.10.09.02.40.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 09 Oct 2016 02:40:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 9 Oct 2016 11:40:35 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20161009094035.GA3546@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: State of bitbake world 2016-10-07
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
X-List-Received-Date: Sun, 09 Oct 2016 09:40:36 -0000
X-Groupsio-MsgNum: 88014
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
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
||2016-10-07	||1	||3	||1	||7	||2	||2	||7	||3	||3	||0	||0		||0		||2		||7		||=
3		||408		||1		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-10-07 =3D=3D

INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20161008_092901.log

=3D=3D=3D common (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/linux-atm/linux-atm=
_2.5.2.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_c=
ompile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (5) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemuarm.20161006_120745.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/23018/
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemux86.20161005_233741.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/23033/
|-
|| qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
world.qemux86-64.20161007_003245.log/ || http://errors.yoctoproject.org/Err=
ors/Build/23046/
|}

=3D=3D=3D PNBLACKLISTs (118) =3D=3D=3D

=3D=3D=3D QA issues (421) =3D=3D=3D
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
||1	||host-user-contaminated
|-
||2	||textrel
|-
||3	||file-rdeps
|-
||408	||version-going-backwards
|-
||7	||build-deps
|}



=3D=3D=3D Failed dependencies for qemuarm (7) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20161006_140415.log/
Found differences:=20
Found errors:=20
    * ERROR: 7 issues were found in these recipes: linux-atm xfsprogs

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (2) =3D=3D=
=3D
    * linux-atm -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20161006_140415.log//2_max/failed/linux-atm.log
    * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20161006_140415.log//2_max/failed/xfsprogs.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (2) =3D=3D=
=3D
    * linux-atm -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20161006_140415.log//3_min/failed/linux-atm.log
    * xfsprogs -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20161006_140415.log//3_min/failed/xfsprogs.log

=3D=3D=3D Failed dependencies for qemux86 (7) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20161008_000108.log/
Found differences:=20
Found errors:=20
    * ERROR: 7 issues were found in these recipes: chromium linux-atm mongo=
db

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (3) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20161008_000108.log//2_max/failed/chromium.log
    * linux-atm -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20161008_000108.log//2_max/failed/linux-atm.log
    * mongodb -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20161008_000108.log//2_max/failed/mongodb.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (3) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20161008_000108.log//3_min/failed/chromium.log
    * linux-atm -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20161008_000108.log//3_min/failed/linux-atm.log
    * mongodb -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20161008_000108.log//3_min/failed/mongodb.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20161006_162413.log/

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
chromium-wayland-48.0.2548.0: ELF binary '/tmp/work/i586-oe-linux/chromium-=
wayland/48.0.2548.0-r0/packages-split/chromium-wayland/usr/bin/chromium/chr=
ome' has relocations in .text [textrel]
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 7	issue: build-deps
chromium-wayland-48.0.2548.0: chromium-wayland rdepends on atk, but it isn'=
t a build dependency, missing atk in DEPENDS or PACKAGECONFIG? [build-deps]
chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gdk-pixbuf, but =
it isn't a build dependency, missing gdk-pixbuf in DEPENDS or PACKAGECONFIG=
? [build-deps]
chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gtk+, but it isn=
't a build dependency, missing gtk+ in DEPENDS or PACKAGECONFIG? [build-dep=
s]
chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcomposite, b=
ut it isn'backwards
linux-libc-headers-4.8: Package version for package linux-libc-headers-dbg =
went backwards which would break package feeds from (0:4.8-rc4-r0.6 to 0:4.=
8-r0.0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers-dbg =
went backwards which would break package feeds from (0:4.8-rc4-r0.7 to 0:4.=
8-r0.0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers-dev =
went backwards which would break package feeds from (0:4.8-rc4-r0.6 to 0:4.=
8-r0.0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers-dev =
went backwards which would break package feeds from (0:4.8-rc4-r0.7 to 0:4.=
8-r0.0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers-doc =
went backwards which would break package feeds from (0:4.8-rc4-r0.6 to 0:4.=
8-r0.0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers-doc =
went backwards which would break package feeds from (0:4.8-rc4-r0.7 to 0:4.=
8-r0.0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers-loca=
le went backwards which would break package feeds from (0:4.8-rc4-r0.6 to 0=
:4.8-r0.0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers-loca=
le went backwards which would break package feeds from (0:4.8-rc4-r0.7 to 0=
:4.8-r0.0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers-stat=
icdev went backwards which would break package feeds from (0:4.8-rc4-r0.6 t=
o 0:4.8-r0.0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers-stat=
icdev went backwards which would break package feeds from (0:4.8-rc4-r0.7 t=
o 0:4.8-r0.0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers went=
 backwards which would break package feeds from (0:4.8-rc4-r0.6 to 0:4.8-r0=
=2E0) [version-going-backwards]
linux-libc-headers-4.8: Package version for package linux-libc-headers went=
 backwards which would break package feeds from (0:4.8-rc4-r0.7 to 0:4.8-r0=
=2E0) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-base went backwards which would break package feeds from (0:4.8-r=
c8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r0.1=
) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-devicetree went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-dev went backwards which would break package feeds from (0:4.8-rc=
8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r0.1)=
 [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-firmware-stv0672-vp4 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-image-bzimage went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-image went backwards which would break package feeds from (0:4.8-=
rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r0.=
1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-6lowpan went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-8021q went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-8139cp went backwards which would1) [version-going-backwar=
ds]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-act-mirred went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-af-key went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ah4 went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-anubis went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-arc4 went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-arptable-filter went backwards which would break package f=
eeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e4=
7c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-arp-tables went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-arpt-mangle went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-at24 went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ata-piix went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ath5k went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ath9k-common went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ath9k-hw went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ath9k went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ath went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-atl1e went backwards whiculd break package feeds from (0:4=
=2E8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-blowfish-generic went backwards which would break package =
feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e=
47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-bluetooth-6lowpan went backwards which would break package=
 feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9=
e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-bnep went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-bonding went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-brcmfmac went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-brcmsmac went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-brcmutil went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-bridge went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-br-netfilter went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-bsd-comp went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-camellia-generic went backwards which would break package =
feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e=
47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-cast5-generic went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-cast6-generic went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-cast-common went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ccm went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
ackwards which would break package feeds from (0:4.8-rc8+git0+d0937e67c3_8e=
dbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r0.1) [version-going-back=
wards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-cmtp went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-configfs went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-cordic went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-cpia2 went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-crc8 went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-crc-ccitt went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-cryptoloop went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ctr went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-cuse went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-deflate went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-dummy went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-802-3 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebtable-broute went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yoctom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a=
9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebtables went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-among went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-arpreply went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-arp went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-dnat went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-ip6 went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-ip went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-limit went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-log went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-mark-m went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-mark went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-nflog went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-pkttype went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128ackage kernel-module-ebt-stp went backwards =
which would break package feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-=
r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ebt-vlan went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-eeprom-93cx6 went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-efivarfs went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-efivars went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-esp4 went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-floppy went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-fuse went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gcm went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gf128mul went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ghash-generic went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gma500-gfx went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gre went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-benq went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-re kernel-module-gspca-etoms went backwards which would break pa=
ckage feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6=
128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-finepix went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-gl860 went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-jeilinj went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-jl2005bcd went backwards which would break package f=
eeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e4=
7c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-kinect went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-konica went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-m5602 went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-main went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-mars went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-mr97310a went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-nw80x went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-ov519 went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-ov534-9 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d093o 0:4.8+git0+6128a9e47c_67813e7efa-r0.1) [versi=
on-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-pac7311 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-se401 went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-sn9c2028 went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-sn9c20x went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-sonixb went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-sonixj went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-spca1528 went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-spca500 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-spca501 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-spca505 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-spca506 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-spca508 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-spca561 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUT7c_67813e7efa: Package version for package kernel-mod=
ule-gspca-stv0680 went backwards which would break package feeds from (0:4.=
8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r=
0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-stv06xx went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-sunplus went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-t613 went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-topro went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-tv8532 went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-vc032x went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-vicam went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-xirlink-cit went backwards which would break package=
 feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9=
e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-gspca-zc3xx went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-hidp went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-i2c-mux went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ip6table-filter went backwards which would break package f=
eeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e4=
7c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ip6table-mangle went backwards which would break p0bb6-r0.=
1 to 0:4.8+git0+6128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ip6t-hbh went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ip6t-ipv6header went backwards which would break package f=
eeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e4=
7c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ip6t-rt went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ip6-tunnel went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ip6-udp-tunnel went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ipcomp6 went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ipcomp went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ip-gre went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ipip went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-iptable-filter went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-iptable-mangle went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-iptable-raw went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ip-tables went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Pacpackage feeds from (0:=
4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa=
-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-iwl4965 went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-iwldvm went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-iwlegacy went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-iwlmvm went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-iwlwifi went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-kernelcapi went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-khazad went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-lcd went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-libcrc32c went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-llc went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-lp went backwards which would break package feeds from (0:=
4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa=
-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-mac80211 went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-md4 went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa+6128a9e47c_67813e7efa: Pac=
kage version for package kernel-module-nf-conntrack-broadcast went backward=
s which would break package feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb=
6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-ftp went backwards which would break package =
feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e=
47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-h323 went backwards which would break package=
 feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9=
e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-ipv4 went backwards which would break package=
 feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9=
e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-irc went backwards which would break package =
feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e=
47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-netbios-ns went backwards which would break p=
ackage feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+=
6128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-netlink went backwards which would break pack=
age feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+612=
8a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-pptp went backwards which would break package=
 feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9=
e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-proto-gre went backwards which would break pa=
ckage feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6=
128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-proto-sctp went backwards which would break p=
ackage feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+=
6128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-proto-udplite went backwards which would brea=
k package feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+gi=
t0+6128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-sane went backwards which would break package=
 feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9=
e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-conntrack-sip went backwards which would break package =
feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e=
47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+612AUTOINC+6128a9e47c_67813e7efa: Package versio=
n for package kernel-module-nf-nat-ftp went backwards which would break pac=
kage feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+61=
28a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-nat-h323 went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-nat-ipv4 went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-nat-irc went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-nat-pptp went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-nat-proto-gre went backwards which would break package =
feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e=
47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-nat-proto-sctp went backwards which would break package=
 feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9=
e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-nat-proto-udplite went backwards which would break pack=
age feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+612=
8a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-nat-sip went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-nat-tftp went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nf-nat went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nfnetlink-log went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nfnetlink-queue went backwards which would break package f=
eeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e4=
7c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nfnetlink went backwar+git0+6128a9e47c_67813e7efa-r0.1) [v=
ersion-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nhc-hop went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nhc-ipv6 went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nhc-mobility went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nhc-routing went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nhc-udp went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-ascii went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp1250 went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp1251 went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp1255 went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp737 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp775 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp850 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp852 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
gackage feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0=
+6128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp863 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp864 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp865 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp866 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp869 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp874 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp932 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp936 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp949 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-cp950 went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-euc-jp went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-iso8859-13 went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-iso8859-14 went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]nt backwards which would break =
package feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0=
+6128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-iso8859-6 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-iso8859-7 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-iso8859-9 went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-koi8-ru went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-koi8-r went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-koi8-u went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nls-utf8 went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-nvmem-core went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-p8022 went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-parport-pc went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-parport went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-pktgen went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ppp-async went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ppp-synctty went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-psnap went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-pwc went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-r8169 went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-rfcomm went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-romfs went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-rpcsec-gss-krb5 went backwards which would break package f=
eeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e4=
7c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-rt2800lib went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-rt2800mmio went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-rt2800pci went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-rt2x00lib went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-rt2x00mmio went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-rt2x00pci went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa:ards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sch-gred went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sch-hfsc went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sch-htb went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sch-ingress went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sch-netem went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sch-prio went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sch-red went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sch-sfq went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sch-tbf went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sch-teql went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sctp-diag went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-sctp went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-seqiv went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-serpent-generic went backwards which would break package f=
eee-snd-ac97-codec went backwards which would break package feeds from (0:4=
=2E8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-ens1370 went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-analog went backwards which would break pack=
age feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+612=
8a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-ca0110 went backwards which would break pack=
age feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+612=
8a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-ca0132 went backwards which would break pack=
age feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+612=
8a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-cirrus went backwards which would break pack=
age feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+612=
8a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-cmedia went backwards which would break pack=
age feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+612=
8a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-conexant went backwards which would break pa=
ckage feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6=
128a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-generic went backwards which would break pac=
kage feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+61=
28a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-hdmi went backwards which would break packag=
e feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a=
9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-idt went backwards which would break package=
 feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9=
e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-realtek went backwards which would break pac=
kage feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+61=
28a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-codec-si3054 went backwards which would break pack=
age feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+612=
8a9e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-hda-coards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-intel8x0 went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-rawmidi went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-seq-midi went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-usb-audio went backwards which would break package fee=
ds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c=
_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-snd-usbmidi-lib went backwards which would break package f=
eeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e4=
7c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-softdog went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-stkwebcam went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-stp went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-modules went backwards which would break package feeds from (0:4.=
8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r=
0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-tcrypt went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-tea went backwards which would break package feeds from (0=
:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7ef=
a-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-tipc went backwards which would break package feeds from (=
0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7e=
fa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ts-bm went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-ts-fsm went backwards which would break package feeds from=
un went backwards which would break package feeds from (0:4.8-rc8+git0+d093=
7e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r0.1) [version-g=
oing-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-twofish-common went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-twofish-generic went backwards which would break package f=
eeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e4=
7c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-udp-tunnel went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-usbtouchscreen went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-uvcvideo went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-uvesafb went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-v4l2-common went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-v4l2-dv-timings went backwards which would break package f=
eeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e4=
7c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-videobuf2-core went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-videobuf2-memops went backwards which would break package =
feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e=
47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-videobuf2-v4l2 went backwards which would break package fe=
eds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47=
c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-videobuf2-vmalloc went backwards which would break package=
 feeds from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9=
e47c_67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-videodev went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-d break package feeds from (0:4.8-=
rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r0.=
1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xfrm4-tunnel went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xfrm6-tunnel went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xfrm-ipcomp went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xfrm-user went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-x-tables went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-classify went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-comment went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-connbytes went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-connlimit went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-connmark went backwards which would break package feeds=
 from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6=
7813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-conntrack went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-ct went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-dccp went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-goi+6128a9e47c_67813e7efa-r0.1) [version-going-backwar=
ds]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-hl went backwards which would break package feeds from =
(0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7=
efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-length went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-limit went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-mac went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-mark went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-multiport went backwards which would break package feed=
s from (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-nflog went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-nfqueue went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-pkttype went backwards which would break package feeds =
=66rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_=
67813e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-policy went backwards which would break package feeds f=
rom (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_678=
13e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-quota went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-realm went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-sctp went backwards which would break package feeds fro=
m (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813=
e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xtwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-trace went backwards which would break package feeds fr=
om (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_6781=
3e7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-module-xt-u32 went backwards which would break package feeds from=
 (0:4.8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e=
7efa-r0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel-vmlinux went backwards which would break package feeds from (0:4.=
8-rc8+git0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r=
0.1) [version-going-backwards]
linux-yocto-4.8+gitAUTOINC+6128a9e47c_67813e7efa: Package version for packa=
ge kernel went backwards which would break package feeds from (0:4.8-rc8+gi=
t0+d0937e67c3_8edbf10bb6-r0.1 to 0:4.8+git0+6128a9e47c_67813e7efa-r0.1) [ve=
rsion-going-backwards]


count: 1	issue: host-user-contaminated
opensaf-5.0.0: opensaf: /opensaf/etc/init.d/opensafd is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
80f377e toaster: Update tests to reflect front end changes
not included in master yet:=20
a284b3c world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
97e526c scripts: Rename 'native' to 'oe-run-native'
not included in master yet:=20
161bc19 qemux86: Add identical qemux86copy variant for tests
c627f4f sstate-sysroot-cruft.sh: Extend the whitelist
b544568 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
da1099b buildhistory.bbclass: metadata-revs show repo parent
8538bda metadata-revs: provide more information
ab8906d report-error: Allow to upload reports automatically
b639687 test-dependencies.sh: Strip also '\.bb: .*' before adding failed re=
cipe to list of failed

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
f604ee6 mariadb: update to version 5.5.52
not included in master yet:=20
3b9f19e lksctp-tools: 1.0.16 -> 1.0.17
2f3a7b1 drbd-utils: 8.9.3 -> 8.9.6
9798a6e mbedtls: upgrade to 1.3.17
7b40a24 samba: un-blacklist
9fd23ce samba: replace pam packageconfig by hard dependency
1f0f39e libtalloc: fix for LIC_FILES_CHKSUM
9ed3343 libtevent: fix for LIC_FILES_CHKSUM
fc2498c libtdb: fix for LIC_FILES_CHKSUM
7ebfaf7 libldb: fix for LIC_FILES_CHKSUM
c4b2303 libtalloc: fixes for deterministic builds
df9fc94 libtevent: fixes for deterministic builds
29dbea9 libldb: fixes for deterministic builds
5c05f85 libtdb: fixes for deterministic builds
53b3d28 squid: specify sysconfdir and logdir
fe374be squid: fix ptest failure
ef91ed9 iscsitarget: resolve build error with linux kernel 4.8
f521308 arptables: add arptables systemd service file
b7dbe2b geoip-perl: upgrade to 1.50
3a617a7 atftp: fixes musl libc build
c9d0c9e ntp : Add openssl to default PACKAGECONFIG options
5a63db7 libnetfilter-acct: added new recipe for libnetfilter-acct 1.0.3
2c57f9e nfacct: added nfacct recipe to meta-networking
1c8a708 phytool: Add recipe
14c8df5 leptonica: add PACKAGECONFIG for giflib
f406931 tesseract: upgrade to 3.04

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
9aa870e qtbase: avoid qmake errors due to missing oe-device-extra.pri
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
ec4459a Merge pull request #14 from raymanfx/master
not included in master yet:=20
ad9b1ce firefox: Fix build using gcc 6
338b100 chromium: install all pak files plus resources and blob.bin files.
f36a731 chromium-wayland: include 0006-Remove-GBM-support-from-wayland.gyp.=
patch only with CHROMIUM_ENABLE_WAYLAND

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
b02f14a mesa: add LIC_FILES_CHKSUM for 10.3.8
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
8e828d1 linux-hp-tenderloin: Fix incorrect checksums
not included in master yet:=20

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf6D9IACgkQN1Ujt2V2gBxFcQCfXlPmuOvqCk5R4bKbBwstSu4z
5AgAmQEAqxUg4UK14gHU68TZliKr3H45
=mU3d
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
