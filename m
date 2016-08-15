Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 64B997680A;
	Mon, 15 Aug 2016 10:18:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i138so10282659wmf.3;
	Mon, 15 Aug 2016 03:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=CcQc1XZBnxk+2f29WkZY988sCbiJ3cPUCaZPsYRBNnw=;
	b=pSPfadgIVlgOvkCQ/k+TOXToQ1l+9QSbnWm1Z4WeN5k2WbIj5F1OdgJyNA+C97aM6j
	0ps5TUU5LJHSU8GOE+3BgtaaEVJM0PVn1WTDzoaKIlYTc/vNXvJq32eGdRC0VKyuJ8Ou
	daoSRKtmd+I26jch9l/DYCCb32O92zm+xjMHdPhcflJDh4W8VzeMkoabPkDktbfoukeN
	+YdghScRoojC7ataQPUyJ6a9WcVGldxGNqitYPl6gNw614CFwzO4eG51H1waNFAWNiHI
	tcDXZw31PARK2VN1znZj/gPGNdfdD4Taf+zNCp1nfj0D8j/DhU+SiGvkVFWxcNit4iN5
	hrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=CcQc1XZBnxk+2f29WkZY988sCbiJ3cPUCaZPsYRBNnw=;
	b=CyoV43WsHcjG8IzTOn7sv0GigrTfQ7tCijiseIdoOE4FAvz847+7Q2cqScNqmdJMS1
	9RvtrXXH6Qi8Rd7d687DKdvew5M1kYGIKYquWtsL9v8lvE93wZIH0AWIQZu3AYQF7US0
	CmLP+LV2etO2q6/ToBFib+cEruWNxtREDYa/Bzq4ov92DmdhEXomtKr1KMrrlB3382PO
	ImvUZIpxMSaykrWbwo7OdVYGpkzkDsWUBUOLz5fOCRegmZNUAnBDyrEYrfistGq+0Z7D
	yIi6k2HlKsIAZ2MngO0sAZkweptDzgGpN4inobnnbxfwsY7oUrzK9HpkhlKUtqXvcCDC
	LjMA==
X-Gm-Message-State: AEkoouu7+cgn9rYacU5d4VpQK7S/A69ZT1glp4BuJHfXMmGTinDtABufhAPhWVILGv+Hlw==
X-Received: by 10.28.55.21 with SMTP id e21mr14453894wma.80.1471256335046;
	Mon, 15 Aug 2016 03:18:55 -0700 (PDT)
Received: from localhost ([89.176.104.169])
	by smtp.gmail.com with ESMTPSA id 3sm15827060wms.1.2016.08.15.03.18.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Aug 2016 03:18:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Aug 2016 12:18:54 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160815101854.esgyjd3kgkskwyhd@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: State of bitbake world 2016-08-13
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
X-List-Received-Date: Mon, 15 Aug 2016 10:18:58 -0000
X-Groupsio-MsgNum: 85740
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2j2iywib2jpopt7s"
Content-Disposition: inline

--2j2iywib2jpopt7s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

With intltool-native caused issues fixed, the remaining failures are
mostly from binutils upgrade.

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
||2016-08-13	||11	||11	||11	||31	||12	||12	||31	||12	||12	||0	||0		||0		||0=
		||0		||0		||0		||0		||1		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-08-13 =3D=3D

INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20160813_221206.log

=3D=3D=3D common (11) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.=
30.5.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-support/tracker/tracker_0.14.2.b=
b:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.=
4.2.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/accel-ppp/accel-p=
pp_git.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/dnsmasq/dnsmasq_2.7=
6.bb:do_install
    * meta-openembedded/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb:do=
_compile
    * meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb:do_com=
pile
    * meta-openembedded/meta-oe/recipes-support/libp11/libp11_0.4.0.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/utouch/utouch-frame_git.bb:=
do_compile
    * meta-smartphone/meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:do_co=
mpile
    * openembedded-core/meta/recipes-support/libunwind/libunwind_git.bb:do_=
compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (33) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wo=
rld.qemuarm.20160813_005304.log/ || http://errors.yoctoproject.org/Errors/B=
uild/19528/
|-
|| qemux86 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wo=
rld.qemux86.20160813_055900.log/ || http://errors.yoctoproject.org/Errors/B=
uild/19558/
|-
|| qemux86_64 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log=
=2Eworld.qemux86-64.20160813_073902.log/ || http://errors.yoctoproject.org/=
Errors/Build/19565/
|}

=3D=3D=3D PNBLACKLISTs (116) =3D=3D=3D

=3D=3D=3D QA issues (1) =3D=3D=3D
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
|-
||1	||installed-vs-shipped
|}



=3D=3D=3D Failed dependencies for qemuarm (31) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160813_023250.log/
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
    * ERROR: 31 issues were found in these recipes: accel-ppp aceofpenguins=
 dnsmasq enchant glmark2 gnome-menus gpsd jasper libdrm libp11 libunwind ph=
p samba tracker utouch-frame

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (12) =3D=3D=
=3D
    * accel-ppp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160813_023250.log//2_max/failed/accel-ppp.log
    * aceofpenguins -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160813_023250.log//2_max/failed/aceofpenguins.log
    * dnsmasq -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160813_023250.log//2_max/failed/dnsmasq.log
    * glmark2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160813_023250.log//2_max/failed/glmark2.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160813_023250.log//2_max/failed/gnome-menus.log
    * gpsd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160813_023250.log//2_max/failed/gpsd.log
    * libp11 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160813_023250.log//2_max/failed/libp11.log
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160813_023250.log//2_max/failed/libunwind.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160813_023250.log//2_max/failed/php.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160813_023250.log//2_max/failed/samba.log
    * tracker -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160813_023250.log//2_max/failed/tracker.log
    * utouch-frame -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160813_023250.log//2_max/failed/utouch-frame.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (12) =3D=3D=
=3D
    * accel-ppp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160813_023250.log//3_min/failed/accel-ppp.log
    * aceofpenguins -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160813_023250.log//3_min/failed/aceofpenguins.log
    * dnsmasq -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160813_023250.log//3_min/failed/dnsmasq.log
    * glmark2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160813_023250.log//3_min/failed/glmark2.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160813_023250.log//3_min/failed/gnome-menus.log
    * gpsd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160813_023250.log//3_min/failed/gpsd.log
    * libp11 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160813_023250.log//3_min/failed/libp11.log
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160813_023250.log//3_min/failed/libunwind.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160813_023250.log//3_min/failed/php.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160813_023250.log//3_min/failed/samba.log
    * tracker -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160813_023250.log//3_min/failed/tracker.log
    * utouch-frame -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160813_023250.log//3_min/failed/utouch-frame.log

=3D=3D=3D Failed dependencies for qemux86 (31) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160813_101134.log/
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
    * ERROR: 31 issues were found in these recipes: accel-ppp aceofpenguins=
 dnsmasq enchant glmark2 gnome-menus gpsd jasper libdrm libp11 libunwind ph=
p samba tracker utouch-frame

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (12) =3D=3D=
=3D
    * accel-ppp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160813_101134.log//2_max/failed/accel-ppp.log
    * aceofpenguins -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160813_101134.log//2_max/failed/aceofpenguins.log
    * dnsmasq -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160813_101134.log//2_max/failed/dnsmasq.log
    * glmark2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160813_101134.log//2_max/failed/glmark2.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160813_101134.log//2_max/failed/gnome-menus.log
    * gpsd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160813_101134.log//2_max/failed/gpsd.log
    * libp11 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160813_101134.log//2_max/failed/libp11.log
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160813_101134.log//2_max/failed/libunwind.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160813_101134.log//2_max/failed/php.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160813_101134.log//2_max/failed/samba.log
    * tracker -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160813_101134.log//2_max/failed/tracker.log
    * utouch-frame -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemux86.20160813_101134.log//2_max/failed/utouch-frame.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (12) =3D=3D=
=3D
    * accel-ppp -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160813_101134.log//3_min/failed/accel-ppp.log
    * aceofpenguins -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160813_101134.log//3_min/failed/aceofpenguins.log
    * dnsmasq -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160813_101134.log//3_min/failed/dnsmasq.log
    * glmark2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160813_101134.log//3_min/failed/glmark2.log
    * gnome-menus -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160813_101134.log//3_min/failed/gnome-menus.log
    * gpsd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160813_101134.log//3_min/failed/gpsd.log
    * libp11 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160813_101134.log//3_min/failed/libp11.log
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160813_101134.log//3_min/failed/libunwind.log
    * php -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160813_101134.log//3_min/failed/php.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160813_101134.log//3_min/failed/samba.log
    * tracker -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160813_101134.log//3_min/failed/tracker.log
    * utouch-frame -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemux86.20160813_101134.log//3_min/failed/utouch-frame.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160813_084455.log/

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
?=3D "${@bb.utils.contains('DISTRO_FEATURESor directory"
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


count: 0	issue: textrel


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 1	issue: installed-vs-shipped
imagemagick: 7 installed and not shipped files. [installed-vs-shipped]


count: 0	issueta-revs: provide more information
1dacdff report-error: Allow to upload reports automatically
0b05e91 icecc.bbclass: replace os.popen with subprocess.check_output
2436859 test-dependencies.sh: Strip also '\.bb: .*' before adding failed re=
cipe to list of failed

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
e231b02 libgit2: add a recipe for libgit2 version 0.24.1
not included in master yet:=20
5d4bc78 openconnect: fix do_compile failure
9c1d166 libtevent: Add back the dependency on libcap
76304cc opencv: Fix build with gcc 6.0
7e29f29 squid: fix configure host contamination
d8ce462 libmodbus: update to upstream develop version 3.1.4
3d951f7 glmark2: Fix gcc 6 configure error
0ffada9 glmark2: Fix gcc 6 deprecated declaration error
e4d65c8 imagemagick: upgrade from 6.9.2 to 7.0.2
bda6543 ttf-abyssinica: add version 1.500 to support Amharic language
eecdc63 fontforge-native: support python module
4baecf6 ttf-lohit: add version 2 to support Indian languages
26803bb ttf-lklug: add version 0.6-14.20090803cvs.fc24 to support Sinhala l=
anguage
edc3057 libmicrohttpd: update 0.9.49 -> 0.9.50
b388fbf libp11: fix fetch error.
c718dd0 engine-pkcs11: fix fetch error
55a37a3 openwsman: fix fetch error.
3441845 concurrencykit: fix fetch errors.
7707387 mongodb: failes to build on ppc
31bcb6c breakpad: disable ppc from being built.
ca44c76 cryptsetup: update to version 1.7.2
1840581 daemonize: update to version 1.7.7
761bc19 devicekit-power: remove obsolete package that was migrated to upowe=
r in 2010
903a917 upower: update to version 0.99.4
658889f libmbim: update to 1.14.0
ebe22f9 dstat: update to version 0.7.3
0eb6bf6 engine-pkcs11: update to version 0.2.2
31377ac libp11: update to version 0.4.0
5cd187a opensc: update to version 0.16.0
2dd5b98 epeg: update to the latest version
fea8ccc nginx: add the LDFLAGS to the link arguments
8302518 nginx: update to version 1.11.3
0283611 snort: Add lzma to PACKAGECONFIG
011de67 efivar: 0.23 -> 0.24
c97e487 imagemagick: Add missing dependency
2d1be71 pidgin: upgrade to 2.11.0
8f64f2d espeak: fix package for gcc6
e08f874 evtest: update to version 1.33
2b63593 hiawatha-init: create log directory during init
95a1848 hiawatha: update to version 10.3
4278d5c python-pygobject: update to version 3.20.1
682c2d4 gflags: New recipe
bcac9ee glog: Update to version 0.3.4
fc71e1e utouch-frame: fix build errors associated with xmllint
a93d1f2 gateone: remove custom prefix for /var
b5653e4 dnsmasq: update to version 2.76
016fbef xf86-video-ati: Set RRECOMMENDS to linux-firmware-radeon
1add6ce ninja: update to version 1.7.1
f5a2250 proftpd: fix system account login failure
9064d6f crda: split wireless-regdb out into own recipe
7e246bd wireless-regdb: update 2014.11.18 -> 2016.06.10
7b1d4f2 gnokii: add missing intltool-native dependency
1418eda geoclue: add missing intltool-native dependency
8d085f0 gtksourceview2: add intltool-native dependency
7fbc7fa gegl: add intltool-native dependency
591d397 gupnp-tools: add intltool-native dependency
8262b01 dconf: add intltool-native dependency
96b11ee gnome-bluetooth: add intltool-native dependency
2674f15 networkmanager-openvpn: add intltool-native dependency
8ec261b libgxim: add intltool-native dependency
db8d0ec gparted: add intltool-native dependency
b2601c2 rygel: add intltool-native dependency
088aa45 pidgin-sipe purple-skypeweb whatsapp-purple freeimage: add more pid=
gin plugins
6a7dd28 Revert "pidgin-sipe purple-skypeweb whatsapp-purple freeimage: add =
more pidgin plugins"
e56ee17 Revert "imagemagick: Add missing dependet) - meta-webos-ports =3D=3D
latest upstream commit:=20
b0ca23f freeimage: bump SRCREV to fix build with gcc6
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
e6f2ad9 meta-android: android-tools-conf: enable mtp
not included in master yet:=20
2613aa6 u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
46cfefb linux-gta04: bump SRCREV to get fixes for build with gcc-5


--2j2iywib2jpopt7s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlexlqUACgkQN1Ujt2V2gBxqCgCbB/E3/TNDEy9FnVDegIpgjb9A
zpsAniexEDjdLZ9EvRXvbgVNQsgaRZsg
=6k0D
-----END PGP SIGNATURE-----

--2j2iywib2jpopt7s--
