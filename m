Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id C201D6014F;
	Fri, 13 May 2016 20:30:19 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n129so35785168wmn.1;
	Fri, 13 May 2016 13:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=WDc1zf4rtyEIkNJnjCvNSc9hp4DaEneR6VbykMo/u4k=;
	b=mkx384QFs8/RWjoBaiCkAWBo0dfXyHf7/0mQXZHXsULk2Io77Y3bonFuHgwUNfGMYn
	c58VyzlJqMsNZ243n0Ia1Ve57yioT8QCsQU/b/tI37owJW77i3YaYsPto4x3XuUxNk07
	wYYAeoIdpozA5frFoRpu7Q0aHJM20Ck0CHvKjM4T526sY9ZvRsUD9JJHt3O2SXxO6cGN
	KcQknzb5Iisoge77rQcVlgEMLq94Auv0ohru2AovDPpoCzaw8iKSq6L1ReWE1sGEVvsd
	IJCpqmnRBNgZF33Oo0JFsdKvhpA+6kJvEG5Y8/F3sDtb/EtjAuOMwtA3vz4uppoqXsR1
	K0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=WDc1zf4rtyEIkNJnjCvNSc9hp4DaEneR6VbykMo/u4k=;
	b=WA9eik296cV+a9NqGrULfjL6GB4+2RG1mXKwpanKZ7H7tQGsZqQr7JE5RWRiJfuA1J
	bZYp9v4C0fd1VRn/R4Hj+RDCYcm8oAn3yjEr1gZ7KuY8y0SWnLmB6xm9t6F5a6VMGaEJ
	1370zwertfNSWzLEe9PpBmMeQkRk5vdBqKnR0o7woElU6Je3pgYXe6DzO3PX/L5Tdq+t
	esRsm6sRft1NnsZ9y3Tcu7V/q5drkwVeFQ5MEVPYnZLkuAXTmSPlb3OqoHOuMsrQOlIj
	Hiz0TKAuP7lM+wprbIbT1mWEkd4sXwCd073q1f0wpUGjGbtBUJZx9uS3rJAhXm49NmZX
	HYVw==
X-Gm-Message-State: AOPr4FV2CGxFne9AbCDx0ghunjngenXw3FnPrBW13R579ImO4gksyB/CFp+7kC4RFAJnTQ==
X-Received: by 10.194.77.229 with SMTP id v5mr17463416wjw.107.1463171419660;
	Fri, 13 May 2016 13:30:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r5sm20204137wjy.37.2016.05.13.13.30.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 13 May 2016 13:30:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 May 2016 22:31:08 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160513203108.GC2565@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: State of bitbake world 2016-05-12
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
X-List-Received-Date: Fri, 13 May 2016 20:30:20 -0000
X-Groupsio-MsgNum: 82094
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline

--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This time complete QA issues list

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
||2016-05-12	||2	||3	||3	||17	||6	||6	||19	||5	||6	||0	||0		||0		||3		||2		=
||29		||24		||1		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-05-12 =3D=3D

INFO: jenkins-job.sh-1.8.4 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160513_101447.log

=3D=3D=3D common (2) =3D=3D=3D
    * /meta-openembedded/meta-python/recipes-devtools/python/python-cryptog=
raphy_1.1.bb, do_compile
    * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, =
do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-connectivity/lftp/lftp_4.6=
=2E3a.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /openembedded-core/meta/recipes-core/meta/meta-ide-support.bb, do_pac=
kage_write_ipk

=3D=3D=3D Number of failed tasks (8) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.qemuarm.20160511_004639.log// || http://errors.yoctoproject.org:80/Erro=
rs/Build/15676/
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.qemux86.20160511_004537.log// || http://errors.yoctoproject.org:80/Erro=
rs/Build/15687/
|-
|| qemux86_64 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.qemux86-64.20160512_040242.log// || http://errors.yoctoproject.org=
:80/Errors/Build/15732/
|}

=3D=3D=3D PNBLACKLISTs (91) =3D=3D=3D

=3D=3D=3D QA issues (59) =3D=3D=3D
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
||24	||version-going-backwards
|-
||29	||file-rdeps
|-
||2	||build-deps
|-
||3	||textrel
|}



=3D=3D=3D Failed dependencies for qemuarm (17) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160512_002359.log/
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
 enchant gtkmathview libdrm luna-next meta-world-pkgdata netmap proxy-libin=
tl python-cryptography samba

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (6) =3D=3D=
=3D
chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/log.dependencies.qemuarm.20160512_002359.log//2_max/failed/chkconfig-a=
lternatives-native.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160512_002359.log//2_max/failed/luna-next.log
meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160512_002359.log//2_max/failed/meta-world-pkgdata.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160512_002359.log//2_max/failed/netmap.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160512_002359.log//2_max/failed/proxy-libintl.log
python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160512_002359.log//2_max/failed/python-cryptography.l=
og

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (6) =3D=3D=
=3D
gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160512_002359.log//3_min/failed/gtkmathview.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160512_002359.log//3_min/failed/luna-next.log
meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160512_002359.log//3_min/failed/meta-world-pkgdata.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160512_002359.log//3_min/failed/netmap.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160512_002359.log//3_min/failed/proxy-libintl.log
python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160512_002359.log//3_min/failed/python-cryptography.l=
og

=3D=3D=3D Failed dependencies for qemux86 (19) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160513_041548.log/
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
 enchant gtkmathview jasper libdrm luna-next netmap perf proxy-libintl pyth=
on-cryptography samba

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (5) =3D=3D=
=3D
chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/log.dependencies.qemux86.20160513_041548.log//2_max/failed/chkconfig-a=
lternatives-native.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160513_041548.log//2_max/failed/luna-next.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emux86.20160513_041548.log//2_max/failed/netmap.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160513_041548.log//2_max/failed/proxy-libintl.log
python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160513_041548.log//2_max/failed/python-cryptography.l=
og

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (6) =3D=3D=
=3D
gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160513_041548.log//3_min/failed/gtkmathview.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160513_041548.log//3_min/failed/luna-next.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emux86.20160513_041548.log//3_min/failed/netmap.log
perf -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
ux86.20160513_041548.log//3_min/failed/perf.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160513_041548.log//3_min/failed/proxy-libintl.log
python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160513_041548.log//3_min/failed/python-cryptography.l=
og

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160512_062345.log/

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


count: 3	issue: textrel
cef3-280796: ELF binary '/tmp/work/i586-oe-linux/cef3/280796-r0/packages-sp=
lit/cef3-codecs-ffmpeg/usr/lib/cef3/libffmpegsumo.so' has relocations in .t=
ext [textrel]
chromium-48.0.2548.0: ELF binary '/tmp/work/i586-oe-linux/chromium/48.0.254=
8.0-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 2	issue: build-deps
qtwayland-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepen=
ds on libxcomposite, but it isn't a build dependency, missing libxcomposite=
 in DEPENDS or PACKAGECONFIG? [build-deps]
samba-4.4.2: samba rdepends on libpam, but it isn't a build dependency, mis=
sing libpam in DEPENDS or PACKAGECONFIG? [build-deps]


count: 29	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires =
libnewt.so()(64bit), but no providers found in RDEPENDS_chkconfig? [file-rd=
eps]
chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires =
libnewt.so, but no providers found in RDEPENDS_chkconfig? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires libu=
csi.so()(64bit), but no providers found in RDEPENDS_dvbdate? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires libu=
csi.so, but no providers found in RDEPENDS_dvbdate? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requires libdvb=
api.soraffic contained in package dvbtraffic requires libdvbapi.so, but no =
providers found in RDEPENDS_dvbtraffic? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires libd=
vbapi.so()(64bit), but no providers found in RDEPENDS_dvb-femon? [file-rdep=
s]
dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires libd=
vbapi.so, but no providers found in RDEPENDS_dvb-femon? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdv=
bapi.so, but no providers found in RDEPENDS_dvb-apps? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdv=
bsec.so()(64bit), but no providers found in RDEPENDS_dvb-apps? [file-rdeps]
gnome-menus-2.30.5: /usr/bin/gmenu-simple-editor contained in package gnome=
-menus requires /tmp/sysroots/x86_64-linux/usr/bin/python-native/python, bu=
t no providers found in RDEPENDS_gnome-menus? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdep=
s]
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so()(64bit), but no providers =
found in RDEPENDS_libnewt-python? [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so, but no providers found in =
RDEPENDS_libnewt-python? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so()(64bit), but no providers found in RDEPEN=
DS_networkmanager-nmtui? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so, but no providers found in RDEPENDS_networ=
kmanager-nmtui? [file-rdeps]
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
xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs requires lib=
xfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs requires lib=
xfs.so.0, but no providers found in RDEPENDS_xfsprogs? [file-rdeps]


count: 24	issue: version-going-backwards
efibootmgr-0.12: Package version for package efibootmgr-dbg went backwards =
which would break package feeds from (0:0.12-r0.1 to 0:0.12-r0.0) [version-=
going-backwards]
efibootmgr-0.12: Package ver-r0.0) [version-going-backwards]
efibootmgr-0.12: Package version for package efibootmgr went backwards whic=
h would break package feeds from (0:0.12-r0.1 to 0:0.12-r0.0) [version-goin=
g-backwards]
efibootmgr-0.12: Package version for package efibootmgr went backwards whic=
h would break package feeds from (0:0.12-r0.4 to 0:0.12-r0.0) [version-goin=
g-backwards]
znc-1.6.0: Package version for package znc-dbg went backwards which would b=
reak package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-back=
wards]
znc-1.6.0: Package version for package znc-dbg went backwards which would b=
reak package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-backw=
ards]
znc-1.6.0: Package version for package znc-dev went backwards which would b=
reak package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-back=
wards]
znc-1.6.0: Package version for package znc-dev went backwards which would b=
reak package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-backw=
ards]
znc-1.6.0: Package version for package znc-doc went backwards which would b=
reak package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-back=
wards]
znc-1.6.0: Package version for package znc-doc went backwards which would b=
reak package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-backw=
ards]
znc-1.6.0: Package version for package znc-locale went backwards which woul=
d break package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-b=
ackwards]
znc-1.6.0: Package version for package znc-locale went backwards which woul=
d break package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-ba=
ckwards]
znc-1.6.0: Package version for package znc-staticdev went backwards which w=
ould break package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-goin=
g-backwards]
znc-1.6.0: Package version for package znc-staticdev went backwards which w=
ould break package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going=
-backwards]
znc-1.6.0: Package version for package znc went backwards which would break=
 package feeds from (0:1.6.0-r0.11 to 0:1.6.0-r0.1) [version-going-backward=
s]
znc-1.6.0: Package version for package znc went backwards which would break=
 package feeds from (0:1.6.0-r0.9 to 0:1.6.0-r0.0) [version-going-backwards]


count: 1	issue: host-user-contaminated
glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-ar-eg/usr/lib/loc=
ale/ar_EG/LC_COLLATE is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
1ee841e world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
e2b08f9 core-image-{minimal,testmaster}-initramfs: set COMPATIBLE_HOST
ab40501 linux-yocto-rt, core-image-rt*: Explicitly skip when PREFERRED_PROV=
IDER_virtual/kernel isn't set to linux-yocto-rt
0cdd9b2 metadata-revs: provide more information
5634928 buildhistory.bbclass: metadata-revs show repo parent
5c40c8b recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
658166d sstate-sysroot-cruft.sh: Extend the whitelist
4ae7434 qemux86: Add identical qemux86copy variant for tests
81be3b0 report-error: Allow to upload reports automatically

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
368b622 nbd: fix LIC_FILES_CHKSUM
9bcd6c7 libhugetlbfs: enable build for x86-32
asted changes (not included in master yet) - meta-smartphone =3D=3D
62d8eb3 linux-gta04: include linux-dtb
2d312a0 shr: add wayland to DISTRO_FEATURES
56f69af linux-gta04: upgrade to 4.4
f68a25e om-gta04: drop u-boot from EXTRA_IMAGEDEPENDS
9086db3 defaulttunes.inc: switch to hf, because SGX SDK for SGX530 is avail=
able only for hf
46f572e linux-gta04: enable SGX530
81f156d linux-gta04: bump SRCREV to get fixes for build with gcc-5
9d5058a u-boot-mkimage: Backport fix from upstream to fix build with gcc-5

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc2OHoACgkQN1Ujt2V2gBwM8gCfRrR4ApmTnMxXt9idnJxvatE0
OmQAoJRt+WsCMRY9IazZ6YZOSSD7m4RR
=+rmk
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
