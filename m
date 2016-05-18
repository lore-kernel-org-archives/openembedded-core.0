Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id BC6AB6012C;
	Wed, 18 May 2016 20:38:25 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id r12so51907217wme.0;
	Wed, 18 May 2016 13:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=8GG8okcfGqWKJ9dTYGjSSs8273zKorAvRlm9MgJ2Wuw=;
	b=jo2kB6xgUi0o/L2x3Tz1Qpbkm+zZLS5DsV2gVR1T0dsN53QLWsgJANWuPTRc3Yq7rN
	pcPPBVhKI7kbuezcXgtTsjEOlpxJF+Lm+zM1lWBkNLPMXaQuod0OARYnWk9caOseh7oO
	hlvXK1Jwyn3pYxK1hmQ1don8HGK3VWptZMmSmoX+6P2f3icHu8EqypWAT0bcfbIjafUW
	JaG7BUj6Ks/q92ewdzH5VICw//OTB3TapcLYTpFyfdhmzKrtNwaG1Qnzxb8NqEJRwR8i
	rLJSBLhhqPhDq12FfTLjSwO5oNaHNdFWH4wzljXhKlsSkXBmUQMEpc5bf0+5iSIcGC+0
	OOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=8GG8okcfGqWKJ9dTYGjSSs8273zKorAvRlm9MgJ2Wuw=;
	b=M6P/p1xXdoC4BM+qAaj3LEzfSh8JcM6UV1DwpEw6V/ZkQkTCZdHpd/Md420k7ASzVt
	aTFPPWWzAw5UhJ5iMqWNne0eaLh+KVypDsK9ZXupwwd1c5nLnwiF3a332BJCP8AgaELD
	ftHNC0jP5HGhsMrTp7+agurGlQ8OMOgn8ZV+RCt30hSL8PUViVSMDs0tHGEExiFFdBXu
	N/EwTn93i7J/T9f4l6M8DeCACaH/+lG6nXRxds62llx9zx7HQmRTcD4NwXhT8spLc8ry
	nL+zvaxns12AYJGrIjJJ15XzcJ9tbNK4URC6KWAsaYoBHi8ftRi1TOLH/LkaMqzvoJ8g
	7wIQ==
X-Gm-Message-State: AOPr4FUfIO94j6MLjyC7whReLuqrEdJDTwOjedtZHEoTDaqOHd5P1EiWZas5g7kShYTEVA==
X-Received: by 10.194.205.134 with SMTP id lg6mr9309035wjc.153.1463603905117; 
	Wed, 18 May 2016 13:38:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jr8sm10548418wjb.15.2016.05.18.13.38.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 May 2016 13:38:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 May 2016 22:38:54 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160518203854.GG2579@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: State of bitbake world 2016-05-17
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
X-List-Received-Date: Wed, 18 May 2016 20:38:26 -0000
X-Groupsio-MsgNum: 82336
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m972NQjnE83KvVa/"
Content-Disposition: inline

--m972NQjnE83KvVa/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There are few new failures most likely caused by glibc upgrade.

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
||2016-05-17	||6	||7	||7	||25	||10	||10	||29	||10	||11	||0	||0		||0		||2		|=
|2		||29		||0		||3		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-05-17 =3D=3D

INFO: jenkins-job.sh-1.8.4 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160518_103410.log

=3D=3D=3D common (6) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-r=
sh_0.17.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.5.0.b=
b, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb, do_=
compile
    * /meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.=
5.bb, do_configure
    * /meta-openembedded/meta-python/recipes-devtools/python/python-cryptog=
raphy_1.1.bb, do_compile
    * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, =
do_compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/chromium_48.0.2548.0.bb, do_co=
mpile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (20) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.qemuarm.20160516_044240.log// || http://errors.yoctoproject.org:80/Erro=
rs/Build/16131/
|-
|| qemux86 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.qemux86.20160516_044131.log// || http://errors.yoctoproject.org:80/Erro=
rs/Build/16133/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.qemux86-64.20160517_060435.log// || http://errors.yoctoproject.org=
:80/Errors/Build/16276/
|}

=3D=3D=3D PNBLACKLISTs (91) =3D=3D=3D

=3D=3D=3D QA issues (36) =3D=3D=3D
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
||29	||file-rdeps
|-
||2	||build-deps
|-
||2	||textrel
|-
||3	||host-user-contaminated
|}



=3D=3D=3D Failed dependencies for qemuarm (25) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160517_041935.log/
Found differences:=20
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependen=
cy?
WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build =
dependency?
WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependenc=
y?
Found errors:=20
ERROR: 25 issues were found in these recipes: chkconfig-alternatives-native=
 collectd enchant gtkmathview libdrm luna-next meta-world-pkgdata netkit-rs=
h netmap postgresql proxy-libintl python-cryptography samba tcsh

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (10) =3D=3D=
=3D
chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/log.dependencies.qemuarm.20160517_041935.log//2_max/failed/chkconfig-a=
lternatives-native.log
collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies=
=2Eqemuarm.20160517_041935.log//2_max/failed/collectd.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160517_041935.log//2_max/failed/luna-next.log
meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160517_041935.log//2_max/failed/meta-world-pkgdata.log
netkit-rsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160517_041935.log//2_max/failed/netkit-rsh.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160517_041935.log//2_max/failed/netmap.log
postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160517_041935.log//2_max/failed/postgresql.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160517_041935.log//2_max/failed/proxy-libintl.log
python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160517_041935.log//2_max/failed/python-cryptography.l=
og
tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
uarm.20160517_041935.log//2_max/failed/tcsh.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (10) =3D=3D=
=3D
collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies=
=2Eqemuarm.20160517_041935.log//3_min/failed/collectd.log
gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160517_041935.log//3_min/failed/gtkmathview.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160517_041935.log//3_min/failed/luna-next.log
meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160517_041935.log//3_min/failed/meta-world-pkgdata.log
netkit-rsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160517_041935.log//3_min/failed/netkit-rsh.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160517_041935.log//3_min/failed/netmap.log
postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160517_041935.log//3_min/failed/postgresql.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160517_041935.log//3_min/failed/proxy-libintl.log
python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160517_041935.log//3_min/failed/python-cryptography.l=
og
tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
uarm.20160517_041935.log//3_min/failed/tcsh.log

=3D=3D=3D Failed dependencies for qemux86 (29) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160518_045347.log/
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
ERROR: 29 issues were found in these recipes: chkconfig-alternatives-native=
 chromium collectd enchant gtkmathview jasper libdrm luna-next netkit-rsh n=
etmap perf postgresql proxy-libintl python-cryptography samba tcsh

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (10) =3D=3D=
=3D
chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/log.dependencies.qemux86.20160518_045347.log//2_max/failed/chkconfig-a=
lternatives-native.log
chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies=
=2Eqemux86.20160518_045347.log//2_max/failed/chromium.log
collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies=
=2Eqemux86.20160518_045347.log//2_max/failed/collectd.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160518_045347.log//2_max/failed/luna-next.log
netkit-rsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160518_045347.log//2_max/failed/netkit-rsh.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emux86.20160518_045347.log//2_max/failed/netmap.log
postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160518_045347.log//2_max/failed/postgresql.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160518_045347.log//2_max/failed/proxy-libintl.log
python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160518_045347.log//2_max/failed/python-cryptography.l=
og
tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
ux86.20160518_045347.log//2_max/failed/tcsh.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (11) =3D=3D=
=3D
chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies=
=2Eqemux86.20160518_045347.log//3_min/failed/chromium.log
collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies=
=2Eqemux86.20160518_045347.log//3_min/failed/collectd.log
gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160518_045347.log//3_min/failed/gtkmathview.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160518_045347.log//3_min/failed/luna-next.log
netkit-rsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160518_045347.log//3_min/failed/netkit-rsh.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emux86.20160518_045347.log//3_min/failed/netmap.log
perf -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
ux86.20160518_045347.log//3_min/failed/perf.log
postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160518_045347.log//3_min/failed/postgresql.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160518_045347.log//3_min/failed/proxy-libintl.log
python-cryptography -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160518_045347.log//3_min/failed/python-cryptography.l=
og
tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
ux86.20160518_045347.log//3_min/failed/tcsh.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160517_105754.log/

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


count: 2	issue: textrel
cef3-280796: ELF binary '/tmp/work/i586-oe-linux/cef3/280796-r0/packages-sp=
lit/cef3-codecs-ffmpeg/usr/lib/cef3/libffmpegsumo.so' has relocations in .t=
ext [textrel]
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 2	issue: build-deps
qtwayland-5.6.99+5. found in RDEPENDS_dvb-femon? [file-rdeps]
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


count: 0	issue: version-going-backwards


count: 3	issue: host-user-contaminated
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-ar-om/usr/lib/loc=
ale/ar_OM/LC_PAPER is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-wa-be/usr/lib/loc=
ale/wa_BE/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]
glibc-locale-2.24: glibc-locale: /glibc-binary-localedata-zh-tw/usr/lib/lge=
s (not included in master yet) - meta-openembedded =3D=3D
368b622 nbd: fix LIC_FILES_CHKSUM
9bcd6c7 libhugetlbfs: enable build for x86-32
ad32a73 efivar: fix unknown option while gold linker used
b8cb1a1 efibootmgr: sync with upstream while efivar upgraded to 0.23
78d9701 efivar: fix do_install failed
53226d6 efibootmgr: update and unblacklist
2ab67c5 efivar: update to 0.23
d46d435 gnulib: bump git revision
7f5f874 znc: fix QA issue and remove from blacklist
ef66e0f libsoc: update to 0.8.1
6c4f471 libxkbui: Fix license WARNING
91639bc python-numeric: Add LLNL license
34da100 uim: Fix Warning
d50591d netcf: fix mishandling of gnulib submodule causing build fail
1772c4f autotools-bootstrap: make bootstrap package specific.
077024b wireshark: Fix new QA Error
efadf2f openconnect: add dependency to fix Makefile.am
df973db curlpp: fix recipe
8abfb1d android-tools: Fix, enhance and move from meta-shr

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
2f0b492 qtchooser: add new recipe
cbd9331 qt5: Allow disabling SHA validation for branch
05e05db qtbase: Reorder EGL libraries from pkgconfig and defaults:

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
4bbeade chromium: Upgrade to version 48.0.2548.0
3318ba6 chromium: Create chromium-browser.inc to simplify upgrades
c3e2993 chromium: Replace deprecated base_* wrapper calls

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
1dfab2a luna-sysservice: Fix build with qt 5.7
d2153f0 qtwebengine: temporary drop bbappend
47f5509 luna-next: Make compatible with Qt 5.7
8000ed9 qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.7
9357e34 qtbase: enable fontconfig
5da7654 README: update to depend on master branches
fb550f3 pulseaudio-distro-conf: update webos-system.pa from latest pulseaud=
io
26f2d92 pidgin: simplify bbappend

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

--m972NQjnE83KvVa/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc80mMACgkQN1Ujt2V2gByvowCgl6UaCb474V5RtseV5zQrzr3G
qNgAoJ4uOWLiECFyVOmoB4wwBVRcvEz2
=hiRQ
-----END PGP SIGNATURE-----

--m972NQjnE83KvVa/--
