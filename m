Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id BCEDF7318E;
	Wed, 11 May 2016 09:24:33 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id a17so71272491wme.0;
	Wed, 11 May 2016 02:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=YV5bbMBhZUgkBQwnsu8yZYD3/3KQAaauUQk6uEoGckY=;
	b=YCy7VuKymccvIaIasAy19t0mo+mmxSxBzjn3+MOPio7pEUKLEA1BqVfPsVzyPAETsn
	ljmECmY4jbq0eBhlJenYUmxbd3nH1UeBi+h5fni3pwWIXr5RMfw7zzjgLZ76rpp84s/1
	sTG/Pan6jQ2nGojthXj8AlIZYabM/he2kkoT2cUPIK7m79BrYLOPOuODQC98lhuraunU
	SVoIrfm//vVK75DbXZ6jVVpQYUSujWmXKfxflyenoqvqg5ZZqdhcqiZq+6wUKu3lxPRC
	NIB2KoYDJQqZX5BywBHcq4r46mrywO9i7QyRBLoJ2GuKYESZOv9wocrGR5s9Kef7bO7w
	SIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=YV5bbMBhZUgkBQwnsu8yZYD3/3KQAaauUQk6uEoGckY=;
	b=ls38y+N4G0q8Kut7sH6fey5cZoxOfoRHbnJ7xFTuw0QsDZ2hXlPrReG5K1r/5J79ck
	la9PF/13gs7w1r5oXHSqcczTAAgAT2p8zxMLnGFj/QxSD9eh0FwYnn93Ex3XUMePitZ0
	+lE3IiW5YcGGGMjpekqjIavzncuuyhf0XVMidaQ99vprHjR/vl6Rcqh48lE+jakJEQRx
	EGWj6oNYWw1v3rwaCWE8Dbpq1HBWiW93JZXmneXewyE2nPnNVH+gn4W64mEVPW83F3zn
	BXGFFT9rinUn/i/vrNooEupw1NAJ4JrgByH658aUE1uh3pCDcvJcAzkJ3R1JmeR7PAUN
	3RXg==
X-Gm-Message-State: AOPr4FUlfSZN8Ui8BKL7lirvJJR6m8yUiUckK1VER5cvYDvzKq4Udcs/Xq1l5sug4pN1FA==
X-Received: by 10.194.166.3 with SMTP id zc3mr2569673wjb.104.1462958673482;
	Wed, 11 May 2016 02:24:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a75sm7445047wme.18.2016.05.11.02.24.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 11 May 2016 02:24:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 May 2016 11:25:01 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160511092501.GA2798@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: State of bitbake world 2016-05-10
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
X-List-Received-Date: Wed, 11 May 2016 09:24:34 -0000
X-Groupsio-MsgNum: 81846
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There weren't any updates for long time. The builds were still running I
just had second server running some of the builds and didn't have time
to update the script which generates this report after fetching the logs
=66rom other server as well.

I've also included the logs from test dependencies and signatures so
that I can send all in one e-mail instead of separate reports.

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !|Signatures		  !!colspan=3D'12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	|| 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||ver=
sion-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unkn=
own-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||=
=09
|-
||2016-05-10	||3	||3	||2	||17 these recipes: chkconfig-alternatives-native =
efivar enchant gtkmathview libdrm luna-next meta-world-pkgdata netmap proxy=
-libintl samba	||6	||6	||19 these recipes: chkconfig-alternatives-native ef=
ivar enchant gtkmathview jasper libdrm luna-next netmap perf proxy-libintl =
samba	||5	||6	||	||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0=
		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-05-10 =3D=3D

INFO: jenkins-job.sh-1.8.4 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160510_231309.log

=3D=3D=3D common (2) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.23.bb, do=
_compile
    * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, =
do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap_git.b=
b, do_configure

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (8) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.qemuarm.20160510_053348.log// || http://errors.yoctoproject.org:80/Erro=
rs/Build/15603/
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.qemux86.20160510_053238.log// || http://errors.yoctoproject.org:80/Erro=
rs/Build/15602/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.qemux86-64.20160510_072418.log// || http://errors.yoctoproject.org=
:80/Errors/Build/15607/
|}

=3D=3D=3D PNBLACKLISTs (92) =3D=3D=3D

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



=3D=3D=3D Failed dependencies for qemuarm (17) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160510_072808.log/
Found differences:=20
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependen=
cy?
WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build =
dependency?
WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependenc=
y?
Found errors:=20
ERROR: 17 issues were found in these recipes: chkconfig-alternatives-native=
 efivar enchant gtkmathview libdrm luna-next meta-world-pkgdata netmap prox=
y-libintl samba

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (6) =3D=3D=
=3D
chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/log.dependencies.qemuarm.20160510_072808.log//2_max/failed/chkconfig-a=
lternatives-native.log
efivar -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160510_072808.log//2_max/failed/efivar.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160510_072808.log//2_max/failed/luna-next.log
meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160510_072808.log//2_max/failed/meta-world-pkgdata.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160510_072808.log//2_max/failed/netmap.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160510_072808.log//2_max/failed/proxy-libintl.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (6) =3D=3D=
=3D
efivar -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160510_072808.log//3_min/failed/efivar.log
gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160510_072808.log//3_min/failed/gtkmathview.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160510_072808.log//3_min/failed/luna-next.log
meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160510_072808.log//3_min/failed/meta-world-pkgdata.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160510_072808.log//3_min/failed/netmap.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160510_072808.log//3_min/failed/proxy-libintl.log

=3D=3D=3D Failed dependencies for qemux86 (19) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160510_091159.log/
Found differences:=20
WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build depen=
dency?
WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependenc=
y?
WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build depend=
ency?
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependen=
cy?
WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build =
dependency?
WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependenc=
y?
Found errors:=20
ERROR: 19 issues were found in these recipes: chkconfig-alternatives-native=
 efivar enchant gtkmathview jasper libdrm luna-next netmap perf proxy-libin=
tl samba

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (5) =3D=3D=
=3D
chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/log.dependencies.qemux86.20160510_091159.log//2_max/failed/chkconfig-a=
lternatives-native.log
efivar -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emux86.20160510_091159.log//2_max/failed/efivar.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160510_091159.log//2_max/failed/luna-next.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emux86.20160510_091159.log//2_max/failed/netmap.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160510_091159.log//2_max/failed/proxy-libintl.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (6) =3D=3D=
=3D
efivar -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emux86.20160510_091159.log//3_min/failed/efivar.log
gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160510_091159.log//3_min/failed/gtkmathview.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160510_091159.log//3_min/failed/luna-next.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emux86.20160510_091159.log//3_min/failed/netmap.log
perf -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
ux86.20160510_091159.log//3_min/failed/perf.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160510_091159.log//3_min/failed/proxy-libintl.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures () =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160510_132547.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
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
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size o=
f array '_GStaticAssertCompileTimeAssertion_2' is negative"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
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
meta-networking/recipes-irc/znc/znc_git.bb:PNBLACKLIST[znc] ?=3D "BROKEN: Q=
A Issue: znc.pc failed sanity test"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] ?=
=3D "BROKEN: fails to build for qemuarm."
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
meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp] ?=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
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
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-qt5:
meta-smartphone:
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
a95acbb world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
1d2cd60 core-image-{minimal,testmaster}-initramfs: set COMPATIBLE_HOST
2a03d58 linux-yocto-rt, core-image-rt*: Explicitly skip when PREFERRED_PROV=
IDER_virtual/kernel isn't set to linux-yocto-rt
a3b4556 metadata-revs: provide more information
362cadd buildhistory.bbclass: metadata-revs show repo parent
4de2d4f recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
3658b1b sstate-sysroot-cruft.sh: Extend the whitelist
2159913 qemux86: Add identical qemux86copy variant for tests
b1c3f0b report-error: Allow to upload reports automatically

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
f1db7ce nodejs: update to 4.4.4
3e56b0e upower: fix WARNING
6587d95 libwnck: fix WARNING
714d4bc netcf: fix mishandling of gnulib submodule causing build fail
f2c1638 autotools-bootstrap: make bootstrap package specific.
bd6ee53 graphviz: Add new package
5654984 python-dateutil: update to version 2.5.3
f007627 pypi: update the pypi class to support the updated URL scheme
c7a9aef wireshark: Fix new QA Error
17c81af acpitests: Fix license issue
d0663b4 efibootmgr: sync with upstream while efivar upgraded to 0.23
146c023 efivar: fix do_install failed
7447385 efibootmgr: update and unblacklist
648b21f efivar: update to 0.23
4f7b758 tracker: update run-time dependencies
18a9f5e tracker: add missing depends for intltool-native
36e307a tracker: add a patch to support giflib 5
8a3a889 libnice, farsight2: unblacklist as libnice's nice.pc issue fixed.
97f09a0 wvstreams: fixing segfault with new gcc optimizations
6e5d4fd llvm3.3: Disable auto -dbg packages
828274a packagegroup-tools-bluetooth: Selects the tools appropriate for the=
 version of bluez being used.
9c915e9 openconnect: add dependency to fix Makefile.am
069e5b9 libsoc: update to 0.8.1
f589aeb curlpp: fix recipe
be8aab2 lmbench: avoid gcc optimize-away multiplication
4d2af09 leptonica: add PACAKGECONFIG for openjpeg
31b6e72 leptonica: update to version 1.73
564aeb2 giflib: update to version 5.1.4
6010fcc android-tools: Fix, enhance and move from meta-shr

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
cbd9331 qt5: Allow disabling SHA validation for branch
05e05db qtbase:d with qt 5.7
91b7462 qtwebengine: temporary drop bbappend
d1e3843 luna-next: Make compatible with Qt 5.7
979e119 qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.7
dd31642 qtbase: enable fontconfig
56f446b README: update to depend on master branches
906e70d pidgin: simplify bbappend

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
62d8eb3 linux-gta04: include linux-dtb
2d312a0 shr: add wayland to DISTRO_FEATURES
56f69af linux-gta04: upgrade to 4.4
f68a25e om-gta04: drop u-boot from EXTRA_IMAGEDEPENDS
9086db3 defaulttunes.inc: switch to hf, because SGX SDK for SGX530 is avail=
able only for hf
46f572e linux-gta04: enable SGX530
81f156d linux-gta04: bump SRCREV to get fixes for build with gcc-5
9d5058a u-boot-mkimage: Backport fix from upstream to fix build with gcc-5


--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcy+LoACgkQN1Ujt2V2gBzXHACfYd4CHaCnf1a2/H4tUCR5+yn5
XOsAn2pOyNaIvjc3G0xJ0rb1cKu0XSXy
=VyMe
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
