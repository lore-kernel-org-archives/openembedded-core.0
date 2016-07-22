Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4438765CBF;
	Fri, 22 Jul 2016 19:28:11 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so7372115wmg.2;
	Fri, 22 Jul 2016 12:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=Hu4d/+eEnCUKn0+WLb/4CYIHeYino84tcRTy6Xfaj8g=;
	b=v2nS3cn5el2LsvVXp9vOiU9zlNPzxJVu5gkBoipU9QLZJHIn8BZxmcrTKWvD5gyGRd
	d0KiRhGEj+zkyIY1JuLi1wov9ZaBFWyAfhcVQCD0U2u4Q41GOdYtc+zauwM9Cz8Of0fi
	kvhy/u0XnFGlpajHvm1Td18W5otOGqKJ9mMLpmjhljx8AkkQ6SSnJcaVm/16XrwcyoxM
	a7WFm/BMHMTZTkadnZuFSlYasRgEVWc8NZcwWxXnjTGdXS+GPeDhcjS2PR2agtn+uiX6
	BrHEUwDS5Ox43KxmAQU5aBqqqxH6vTNRV5gjkcCK6dNEYCM6zLMRfO8t8fpYOnoYtcYG
	dCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=Hu4d/+eEnCUKn0+WLb/4CYIHeYino84tcRTy6Xfaj8g=;
	b=LUZ3NOZHlOZmjEjDMrZWsO+OvcXxhGEnytVR16FEdRk6yah/ZjoC3BcBpXi8rGfAKu
	P7sHDgtOo3VaooP7EFrYKsIjZeNc0l9xsM0xUhoqSTy0Ao7amdZgPkffZcMF036o0A+b
	5wRDATCDFi/iBcg44g7ZfhFqMDpHR617KoWVm/ZU7EtuIU6N/PJ7fx3/wWvdR0UZlBbM
	lIdoQDoHTr/EgAnNsFQaocHAaZr1YLBymV8SVIuYPvNYK+uFtAtWoGs3dNfW1MGEt4eS
	Edb1eNyPcmSaUDiFhRFrGAqq5hB8cwKkofTKKa4dT1qN1T/kg9u59AFAT1tPCg1aKYyY
	AUBw==
X-Gm-Message-State: AEkoouvbYEorszGFkJ3tP8LPN+tabF0XATSH9tmb5yr89yXWJ+6cwDm6twhYXocBZI1Wyw==
X-Received: by 10.194.41.194 with SMTP id h2mr2721744wjl.2.1469215691094;
	Fri, 22 Jul 2016 12:28:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id n2sm2309403wjd.1.2016.07.22.12.28.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Jul 2016 12:28:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 22 Jul 2016 21:28:20 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160722192820.5fnsid6klkztcbrz@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: State of bitbake world 2016-07-20
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
X-List-Received-Date: Fri, 22 Jul 2016 19:28:12 -0000
X-Groupsio-MsgNum: 84816
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5ybcc2xkda2qtlkc"
Content-Disposition: inline

--5ybcc2xkda2qtlkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Bunch of new failures since last report

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
||2016-07-20	||8	||9	||10	||28	||11	||9	||24	||8	||8	||0	||0		||0		||1		||5=
		||17		||0		||1		||1		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-07-20 =3D=3D

INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20160722_065928.log

=3D=3D=3D common (6) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.=
30.5.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.b=
b:do_unpack
    * meta-openembedded/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb:do=
_patch
    * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.b=
b:do_configure
    * openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_compi=
le
    * openembedded-core/meta/recipes-rt/rt-tests/rt-tests_2.0.bb:do_compile

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/c-ares/c-ares_1.11.=
0.bb:do_configure
    * meta-openembedded/meta-webserver/recipes-httpd/nginx/nginx_1.10.1.bb:=
do_install
    * meta-openembedded/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.=
5.bb:do_install

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-python/recipes-connectivity/gateone/gateone_gi=
t.bb:do_install
    * openembedded-core/meta/recipes-core/meta/meta-ide-support.bb:do_packa=
ge_write_ipk

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0=
=2Ebb:do_install

=3D=3D=3D Number of failed tasks (27) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemuarm.20160721_120751.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/18686/
|-
|| qemux86 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemux86.20160719_075107.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/18556/
|-
|| qemux86_64 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log=
=2Eworld.qemux86-64.20160720_043212.log/ || http://errors.yoctoproject.org/=
Errors/Build/18605/
|}

=3D=3D=3D PNBLACKLISTs (125) =3D=3D=3D

=3D=3D=3D QA issues (25) =3D=3D=3D
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
||17	||file-rdeps
|-
||1	||host-user-contaminated
|-
||1	||installed-vs-shipped
|-
||1	||textrel
|-
||5	||build-deps
|}



=3D=3D=3D Failed dependencies for qemuarm (28) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160720_035240.log/
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
    * ERROR: 28 issues were found in these recipes: c-ares enchant gnome-me=
nus jasper libdrm libebml nginx nostromo piglit rt-tests samba sthttpd uim =
x11vnc xfce4-vala

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (11) =3D=3D=
=3D
    * c-ares -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160720_035240.log//2_max/failed/c-ares.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160720_035240.log//2_max/failed/gnome-menus.log
    * libebml -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160720_035240.log//2_max/failed/libebml.log
    * nginx -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160720_035240.log//2_max/failed/nginx.log
    * nostromo -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160720_035240.log//2_max/failed/nostromo.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160720_035240.log//2_max/failed/piglit.log
    * rt-tests -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160720_035240.log//2_max/failed/rt-tests.log
    * sthttpd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160720_035240.log//2_max/failed/sthttpd.log
    * uim -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160720_035240.log//2_max/failed/uim.log
    * x11vnc -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160720_035240.log//2_max/failed/x11vnc.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160720_035240.log//2_max/failed/xfce4-vala.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (9) =3D=3D=
=3D
    * c-ares -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160720_035240.log//3_min/failed/c-ares.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160720_035240.log//3_min/failed/gnome-menus.log
    * libebml -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160720_035240.log//3_min/failed/libebml.log
    * nostromo -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160720_035240.log//3_min/failed/nostromo.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160720_035240.log//3_min/failed/piglit.log
    * rt-tests -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160720_035240.log//3_min/failed/rt-tests.log
    * sthttpd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160720_035240.log//3_min/failed/sthttpd.log
    * x11vnc -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160720_035240.log//3_min/failed/x11vnc.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160720_035240.log//3_min/failed/xfce4-vala.log

=3D=3D=3D Failed dependencies for qemux86 (24) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160721_032121.log/
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
    * ERROR: 24 issues were found in these recipes: c-ares enchant gateone =
gnome-menus jasper libdrm libebml piglit rt-tests samba x11vnc xfce4-vala

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (8) =3D=3D=
=3D
    * c-ares -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160721_032121.log//2_max/failed/c-ares.log
    * gateone -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160721_032121.log//2_max/failed/gateone.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160721_032121.log//2_max/failed/gnome-menus.log
    * libebml -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160721_032121.log//2_max/failed/libebml.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160721_032121.log//2_max/failed/piglit.log
    * rt-tests -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160721_032121.log//2_max/failed/rt-tests.log
    * x11vnc -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160721_032121.log//2_max/failed/x11vnc.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20160721_032121.log//2_max/failed/xfce4-vala.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (8) =3D=3D=
=3D
    * c-ares -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160721_032121.log//3_min/failed/c-ares.log
    * gateone -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160721_032121.log//3_min/failed/gateone.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160721_032121.log//3_min/failed/gnome-menus.log
    * libebml -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160721_032121.log//3_min/failed/libebml.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160721_032121.log//3_min/failed/piglit.log
    * rt-tests -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160721_032121.log//3_min/failed/rt-tests.log
    * x11vnc -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160721_032121.log//3_min/failed/x11vnc.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20160721_032121.log//3_min/failed/xfce4-vala.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160721_043808.log/


    * ERROR: Nothing RPROVIDES 'python-io-native' (but virtual:native:/home=
/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/p=
ython/python-cffi_1.7.0.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /ho=
me/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'python3-zlib' (but /home/jenkins/oe/world/s=
hr-core/meta-openembedded/meta-python/recipes-devtools/python/python3-werkz=
eug_0.11.10.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'python-io-native' (but virtual:native:/home=
/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/p=
ython/python-cffi_1.7.0.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps


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
ql] ?=3D "Depends on broken tcl"
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
geany-plugins-1.27: geany-plugins-multiterm rdepends on libvte9, but it isn=
't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-dep=
s]
geany-plugins-1.27: geany-plugins-scope rdepends on libvte9, but it isn't a=
 build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
samba-4.4.2: samba rdepends on libpam, but it isn't a build dependency, mis=
sing libpam in DEPENDS or PACKAGECONFIG? [build-deps]
sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof rdepends on polkit, but it is=
n't a build dependency, missing polkit in DEPENDS or PACKAGECONFIG? [build-=
deps]


count: 17	issue: file-rdeps
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
networkmanager-1.0.10: /usr/bin/nmtui-edit contained in package networkmana=
ger-nmtui requires libnewt.so()(64bit), but no providers found in RDEPENDS_=
networkmanager-nmtui? [file-rdeps]
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
xfsprogs-3.2.3: /usr/sbin/xfs_logprint contained in package xfsprogs requir=
es libxfs.so.0, but no providers found in RDEPENDS_xfsprogs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_logprint contained in package xfsprogs requir=
es libxlog.so.0, but no providers found in RDEPENDS_xfsprogs? [file-rdeps]


count: 0	issue: version-going-backwards


count: 1	issue: host-user-contaminated
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-es-uy/usr/lib/loc=
ale/es_UY/LC_PAPER is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
sysprof: 9 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
5fa0b3a bitbake: implement idle timeout for xmlrpc server
not included in master yet:=20
51b88e6 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
0a2df61 boost: fix CVE-2012-2677
not included in master yet:=20
b4b235f qemux86: Add identical qemux86copy variant for tests
fbf7b7a sstate-sysroot-cruft.sh: Extend the whitelist
95fe3fa recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
e237cf3 buildhistory.bbclass: metadata-revs show repo parent
97a7000 metadata-revs: provide more information
70d7606 report-error: Allow to upload reports automatically
364d719 icecc.bbclass: replace os.popen with subprocess.check_output
3b2f309 test-dependencies.sh: Strip also '\.bb: .*' before adding failed re=
cipe to list of failed
ac79466 piglit: Add build fix patch

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
4fbb4d2 net-snmp: initscripts are located in net-snmp-server-snmp package
not included in master yet:=20
e6131b1 openconnect: fix do_compile failure
3b94639 mpg123: remove the recipe
7dfc19d libmad: add the recipe
0112d34 cpuset: add new python package
b83a30b libxfce4ui: Use native intltool for building the lib
145c57d x11vnc: remove redundant RPATH to fix QA issue
4068497 libtevent: Add back the dependency on libcap
31eca9b nodejs: update to 4.4.7
e1a3da8 sshfs-fuse: update to 2.8
9aaabc3 python-pbr: Add python-pbr bb
b5e647f python-mock: Add python-pbr-native dependency
e3c159f python-mccabe: Add python-pytest-runner dependency
254dae6 python-pytest-runner: Add python-pytest-runner bb
899bd6c python-setuptools-scm: Add python-setuptools-scm bb
6b50d9c directfb: move recipe to meta-oe
19cf3cc Mpd: use libsystemd
c9c94cc gtksourceview2: fix build with gcc6
162b4b6 mousepad: remove blacklist caused by gtksourceview2
848f8d0 plymouth: remove virtual prefix for RPROVIDES
779957a python-imaging: Add patch to fix host sysroot fails
23a9939 meta-python: Add Derek Straka as a maintainer
b9c3f92 nginx: update to version 1.11.2
a10261c python-xlrd: update to version 1.0.0
bb38210 python-xlrd: add RDEPENDS to allow module import with a minimal pyt=
hon install
a5ee30b python-tornado: remove deprecated version 2.2.1
87cc7ca python-zopeinterface: update to version 4.1.1
9196366 python-yappi: correct RDEPENDS to work on a minimal python install
96146ee python-wtforms: update to version 2.1
805c123 python-wtforms: add RDEPENDS to work correctly in minimal python en=
vironment
6338f3a python-werkzeug: update to version 0.11.10
a373093 python-vobject: update to version 0.9.2
7c351f8 python-vobject: add RDEPENDS for the package
401cb09 python-visitor: update to version 0.1.3
d139564 python-vcversioner: update to version 2.16.0.0
db804cd python-vcversioner: add RDEPENDS for the package
9f837f1 python-urllib3: update to version 1.16
bf475f9 python-urllib3: correct RDEPENDS to work on a minimal python instan=
ce
bde426c python-ujson: correct RDEPENDS to pull in needed python packages
344ab8f freeglut: add opengl to REQUIRED_DISTRO_FEATURES
3029525 python-pyephem: add RDEPENDS to package
a0edfe1 pyrtm: update to version 0.4.2
5f0e984 pyrtm: Add RDEPENDS to the package
97ef260 python-werkzeug: update RDEPENDS to work for minimal python2.7 and =
python3
696f519 python-six: update RDEPENDS to work on both python2.7 and python3
480e99c atftp: do not create user nobody
4a5581d python-bcrypt: update to version 3.1.0
e2ecc2e python-backports-ssl: add package RDEPENDS
31e72a4 python-decorator: add package RDEPENDS
03b383d python-cffi: update to version 1.7.0
7f2c663 apache2: update to version 2.4.23
1d7f591 zeromq: Update to version 4.1.5.
418b16b libsodium: Update to 1.0.10.
25fbe80 CANopenNode: recipe for building the CANopenSocket tools
04bc610 lirc: inherit python3native instead of pythonnative
5eccd7a augeas: Move from oe-core
3070932 uw-imap: use cross-tools to create static library
8354c0c klibc: fix install destination in 64bit env
d5459d8 contrib: add MIPS_INSTRUCTION_SET
6def38e poco: update to 1.7.3
1cb493d python-cryptography: update to version 1.4 and remove patches now a=
vailable with the latest release
5e2ea37 python-cmd2: update RDEPENDS to pull in required packages
712976a python-dbusmock: update to version 0.16.6 and update required RDEPE=
NDS
45c881c python-django: update to version 1.9.7 and add the required RDEPENDS
06e0690 python-django-south: add package RDEPENDS
4fcd146 python-flufl-enum: remove deprecated package
57fcfb3 python-dominate: update to version 2.2.1 and fix RDEPENDS
054478a python-epydoc: add package RDEPENDS
80e947a python-feedparser: add package RDEPENDS
644ce17 python-evdev: update to version 0.6.1 and add package RDEPENDS
c15a77b python-feedformatter: add package RDEPENDS
b8cf0a6 python-click: add recipe for the python click package required by t=
he new version of flask
f17f642 python-flask: update RDEPENDS to include python-click
ba22177 python-flask-bcrypt: update package RDEPENDS
583c252 python-flask-navigation: update package RDEPENDS
4f71b77 python-flask-bootstrap: update to version 3.3.6.0 and fix RDEPENDS
9e0b751 tokyocabinet: add recipe
d93f184 cfengine: add recipe and base policy
1335c68 liberation-sans-narrow: add a ttf font
1669602 ttf-vlgothic: add a ttf font
415e642 c-ares: use our compilation flags
70eeb2a meta-networking: override SECURITY_CFLAGS for c-ares
8888214 juce: Added support for JUCE framework
616a3fa grubby: add grubby 8.40-1
266cbd9 wireshark: inherit perlnative
568b08c squid: upgrade to 3.5.20
ac5c449 curlpp: fix QA issue for cav-octeon3
f46f267 snort: fix to remove from blacklist
1fa862d php: update to 5.5.37 and 5.6.23
5853a6c Pointing the LIC_FILES_CHKSUM to a valid file.
1cea066 grubby: drop dracut rdepends
e3ca245 meta_networking_security_flags.inc: add weak assignment for lcl_may=
be_fortify

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
15a4f86 qtwayland: add dependency on libxcomposite
not included in master yet:=20
9b98004 qtbase: add PACKAGECONFIG for journald logging
21a056c qtserialbus: add recipe

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

--5ybcc2xkda2qtlkc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleSczQACgkQN1Ujt2V2gBzXjACfUzEZdruc5qdFw1Y0OPRin7Di
CisAn1FecY5oNKofyINWZj7d+9LbwB8D
=3zXP
-----END PGP SIGNATURE-----

--5ybcc2xkda2qtlkc--
