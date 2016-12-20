Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D69071D97;
	Tue, 20 Dec 2016 12:28:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so24022757wmu.0;
	Tue, 20 Dec 2016 04:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=oBYmOnnJVacrTfEPD03Id+q4E/wSeMMWAPGPcqJdvbc=;
	b=H3f1jbcoVAJVXBmBaTvrX6drawc0ODQrCAyTd5/X4OGSTCY1J61KoEBDA+XsHSBczF
	5CrpPqAaFro2n5PO0dm7k6b2Lxt5dCFJaLzg+RJ8VUBAGzt2RPKNuDyNQK+9g2SfRp0+
	lNAZIbK9fC9GUUtLFxliSkJpOEEeivTwuTQ7i6RDtysEX57DJJvnP1dYMtp27RLZ9WCJ
	L7P2D2tQGoXosOCHDYyFSL4NRL0caZcR3I1cYZ3ixKi0suvzui9YayYIJykMLAM+ggTD
	fZ/F+WAnGowi1QYkdgjFptyVo2Q5XXJkQYvanY1OI9N7h5S9gTnSMSbAP/86dJq9QJNo
	n93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=oBYmOnnJVacrTfEPD03Id+q4E/wSeMMWAPGPcqJdvbc=;
	b=RrlNTTcZtb3BMbLMiuC4RA+2hdC7VR42NmSeTdJ0Ie9xUNFxO54bs6OtLCUV+lStgA
	5wkqMx2VdaGNOVEFIGO1dQi1+pY299wC7+Sgv4LwenDisnkr/4Dkh0pLQMyCkOLSPrLf
	BvlCk3mPKr2U5wQKRVci9BOwlbvEOXM5lJW+4fJTkNvQIrT9N+SDfDc6F8WFSIO9/Jk3
	M4GmtjDoX7ViqXR/JEho5GmuE8us67o1aPU2I/9xAGLjXrZotAKWYVHtO4bodicy2+Kg
	w+kgoMCWZXfWn6TaoZqu/x5Nt0xHxEDEwX613juORRzkBkrtrGlHyQRBRbcrc/MN35LT
	XsHg==
X-Gm-Message-State: AIkVDXI2mS/79eGdhhkaNhXrhHMwXSPOiHkkzP4U0aplrKVEvHHnV2HFkFtVviCZ06abtg==
X-Received: by 10.28.55.203 with SMTP id e194mr1670790wma.6.1482236932217;
	Tue, 20 Dec 2016 04:28:52 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	ke6sm25302127wjb.21.2016.12.20.04.28.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Dec 2016 04:28:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Dec 2016 13:28:51 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20161220122851.GA3275@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2016-12-15
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
X-List-Received-Date: Tue, 20 Dec 2016 12:28:53 -0000
X-Groupsio-MsgNum: 91038
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline

--pWyiEgJYm5f9v55/
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
||2016-12-15	||6	||9	||6	||13	||6	||6	||21	||10	||10	||0	||0		||0		||2		||7=
		||4		||0		||4		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-12-15 =3D=3D

INFO: jenkins-job.sh-1.8.12 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20161217_135043.log

=3D=3D=3D common (4) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb=
:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/php/php_7.0.1.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-gla=
mo_git.bb:do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati=
_7.6.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-nou=
veau_1.0.12.bb:do_compile

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb:=
do_packagedata
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb:do_com=
pile

=3D=3D=3D qemux86 (3) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_co=
mpile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (21) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20161214_234358.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/26552/
|-
|| qemux86 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20161214_233829.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/26553/
|-
|| qemux86_64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20161215_224537.log/ || http://errors.yoctoproject.or=
g/Errors/Build/26709/
|}

=3D=3D=3D PNBLACKLISTs (115) =3D=3D=3D

=3D=3D=3D QA issues (17) =3D=3D=3D
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
||2	||textrel
|-
||4	||file-rdeps
|-
||4	||host-user-contaminated
|-
||7	||build-deps
|}



=3D=3D=3D Failed dependencies for qemuarm (13) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161215_221357.log/
Found differences:=20
Found errors:=20
    * ERROR: 13 issues were found in these recipes: hplip kodi loop-aes php=
 webkitgtk xf86-video-glamo

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (6) =3D=3D=
=3D
    * hplip -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20161215_221357.log//2_max/failed/hplip.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161215_221357.log//2_max/failed/kodi.log
    * loop-aes -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20161215_221357.log//2_max/failed/loop-aes.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20161215_221357.log//2_max/failed/php.log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161215_221357.log//2_max/failed/webkitgtk.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20161215_221357.log//2_max/failed/xf86-video-gl=
amo.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (6) =3D=3D=
=3D
    * hplip -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemuarm.20161215_221357.log//3_min/failed/hplip.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161215_221357.log//3_min/failed/kodi.log
    * loop-aes -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemuarm.20161215_221357.log//3_min/failed/loop-aes.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemuarm.20161215_221357.log//3_min/failed/php.log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161215_221357.log//3_min/failed/webkitgtk.log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20161215_221357.log//3_min/failed/xf86-video-gl=
amo.log

=3D=3D=3D Failed dependencies for qemux86 (21) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161216_222721.log/
Found differences:=20
Found errors:=20
    * ERROR: 21 issues were found in these recipes: chromium hplip kodi php=
 qtwayland qtwebengine usrsctp xf86-video-ati xf86-video-glamo xf86-video-n=
ouveau

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (10) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161216_222721.log//2_max/failed/chromium.log
    * hplip -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemux86.20161216_222721.log//2_max/failed/hplip.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161216_222721.log//2_max/failed/kodi.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemux86.20161216_222721.log//2_max/failed/php.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161216_222721.log//2_max/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20161216_222721.log//2_max/failed/qtwebengine.log
    * usrsctp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161216_222721.log//2_max/failed/usrsctp.log
    * xf86-video-ati -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20161216_222721.log//2_max/failed/xf86-video-ati.=
log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20161216_222721.log//2_max/failed/xf86-video-gl=
amo.log
    * xf86-video-nouveau -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemux86.20161216_222721.log//2_max/failed/xf86-video-=
nouveau.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (10) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161216_222721.log//3_min/failed/chromium.log
    * hplip -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depe=
ndencies.qemux86.20161216_222721.log//3_min/failed/hplip.log
    * kodi -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161216_222721.log//3_min/failed/kodi.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depend=
encies.qemux86.20161216_222721.log//3_min/failed/php.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161216_222721.log//3_min/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20161216_222721.log//3_min/failed/qtwebengine.log
    * usrsctp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161216_222721.log//3_min/failed/usrsctp.log
    * xf86-video-ati -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.dependencies.qemux86.20161216_222721.log//3_min/failed/xf86-video-ati.=
log
    * xf86-video-glamo -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20161216_222721.log//3_min/failed/xf86-video-gl=
amo.log
    * xf86-video-nouveau -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
pyro/log.dependencies.qemux86.20161216_222721.log//3_min/failed/xf86-video-=
nouveau.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20161216_042447.log/

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
meta-shr/recipes-shr/3rdparty/openmoko-gpsecipes-shr/shr/shr-installer_git.=
bb:PNBLACKLIST[shr-installer] ?=3D "Depends on blacklisted packagekit"
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


count: 7	issue: build-deps
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
gst-plugins-bad-0.10.23: gst-plugins-bad-zbar rdepends on zbar, but it isn'=
t a build dependency, missing zbar in DEPENDS or PACKAGECONFIG? [build-deps]


count: 4	issue: file-rdeps
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


count: 4	issue: host-user-contaminated
glibcption


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
f1cd6fa lib/bb/build: enable access to logger within tasks
not included in master yet:=20
6f2b825 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
91f8564 oeqa/utils/commands.py: Fix get_bb_vars() when called without argum=
ents
not included in master yet:=20
82df8be qemux86: Add identical qemux86copy variant for tests
31962d9 sstate-sysroot-cruft.sh: Extend the whitelist
221fe88 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
d7bf593 buildhistory.bbclass: metadata-revs show repo parent
4203a2f metadata-revs: provide more information
153aad5 report-error: Allow to upload reports automatically
500ab0d Revert "libsdl2: update to 2.0.5"

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
e6c7a66 wireshark: 2.2.1 -> 2.2.2
not included in master yet:=20
1570683 lksctp-tools: 1.0.16 -> 1.0.17
4952f78 drbd-utils: 8.9.3 -> 8.9.6
d431e8b opensaf: fix QA Issue
3d92f36 ifenslave: make option '-h' work
b8e11c8 syslog-ng: don't use update-alternatives to manage init script
b2098e0 rsyslog: don't use update-alternatives to manage init script
aca32ef kodi: Add krypton/17.x Jarvis/16.x recipes
bbb3f24 kodi: Fix build with pic on x86_64
b9740c6 kodi-17: Add packageconfig for lcms support
363c65d kodi-17: Fix build with musl
751e7f0 kodi-17: Update to latest
70716f0 kodi-17: Fix build for qemuarm and update to latest
7ea2a12 makedumpfile: add ARM into COMPATIBLE_HOST
456b1b4 libupnp: Fix out-of-bound access in create_url_list() (CVE-2016-886=
3)
4bb1246 protobuf: switch from mips16 to mips32 due to in-line assembler
72bdcdc php: add 7.1.0
3b9534f opencv: Update repository location
9c02385 opencv: Metapkg should not rdepend on -staticdev
2e75821 opencv: Add missing depends
359cff3 opencv: Add support for OpenJDK
a36b929 opencv: Add support for python3
bc93379 opencv: Add missing DEPEND for opencl PKGCFG
c9b7a06 opencv: Add new PACKAGECONFIG dnn
3a1b458 opencv: Merge dbg packages and Fix QA Issues
7f290da tinymembench: fix QA warning for GNU_HASH
8a08d32 cifs-utils 6.4->6.6
7e172f9 inetutils: Disable rsh, rcp, rlogin on musl
a207aa5 libmng: Add recipe
e90d975 zbar: Add recipe
e9ae45d avro: Add recipe
7082105 liboop: Add recipe
7e257e5 gimp: Enable libmng plugins
a62a7b3 libtdb 1.3.10 -> 1.3.12
3d9093d libldb 1.1.27 -> 1.1.29
37f2e08 libtevent: 0.9.29 -> 0.9.31
28495ac loop-aes: Add recipe

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
81fb771 Update Qt5's git repositories to match new locations
not included in master yet:=20
2542e2c Upgrade to Qt 5.8
825231c qtwebengine: use QT_GIT_PROTOCOL variable
e5095fa qtwebkit: Always enable icu in QT_CONFIG
49290f1 qtbase: Remove comments about ICU and QtWebKit

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
c8774d1 Merge pull request #16 from geiseri/update_firefox_45esr
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
9b7b58b libqofono: use the recipe from meta-qt5
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
176f337  linux-hp-tenderloin: Update kernel
not included in master yet:=20
0ad046f meta-fso: replace deprecated bb.data.getVar('PV',d,1) with d.getVar=
('PV', True)

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFkkAgAKCRA3VSO3ZXaA
HAUcAJ44xOZ1NGRnkn3cn1M95BPg6ciDDgCfcUFnFbYTjlS5H2cnjv8J9SvY7hM=
=pkv7
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
