Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 15C1965CBA;
	Fri, 27 May 2016 12:56:58 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e3so14653525wme.2;
	Fri, 27 May 2016 05:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=n6Z678zqk+E5iLzpVnRAQp6X163JHMeg6ccQfgrct/A=;
	b=eSdngN4pIivxGk+LjDa+Hx43L6P3FZ8vztwfz/l1zWGIaxsjybHEdN2qv+d6WoesiM
	Jd1q/QzxPrmrkNmYa0EetSZSPrTf7z8OUTk4JM2e0fln/0Wz6xPeyNGynSE6olcH5NhH
	wHspjkTlqNr7vvf1WJqucCwxjuFZm4LpGiLhKFlwBbBtzaENn+WJEkRaETem2iQXOuaG
	Co5wDzqwVqI5UsLLS5JnZCoKze5cZZGLNYeF+vpfXfmQ5LwKUNDNswrnDZVrti/skRr7
	QkHZ5VVMtsHS/CX6anJLSG8Uv7W+Aw+c5AXMpJkkvzoGHSuiIteoBYhDyOc04ikXKt9C
	Xgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=n6Z678zqk+E5iLzpVnRAQp6X163JHMeg6ccQfgrct/A=;
	b=BLlZ8k1p8VNp9Bv1soonPuSs61gRkUlGjvLZtjbcnRNQE+3JRhxYVhxJg5F3I2HzPB
	weLPIqYL+5Msq/2nYbYQbYY2rN0LJcQKugh1loCem3FdLY4kFzdq/EXtrrQ66Q6Sp2yV
	U6sCMXdijj8kRQd7mVzOuOSKMXEHsVO9fAlRuX8trJCBnbSRAQAWULm/Jq81ig+QrLs6
	KydKkc5mSNJ+CLRd2Em8trQIoUsZBc5cVn2WcaeNV+JxDDAd673q7Jn6AbLWizA8TNmv
	bwq3V/85dsaJ3M1pYm6oTSa/wKlC5fJE3EjE4UCGd0G8KNWMH0sfvFXxK+/2LS6kduGl
	aXYw==
X-Gm-Message-State: ALyK8tIv/Qr+H6LiWryg3HYHwIyX1cRgj1lHfrIJEw9WxB4PS7WPvVqxitYc6B0XqS8vvQ==
X-Received: by 10.194.191.133 with SMTP id gy5mr15623398wjc.136.1464353817903; 
	Fri, 27 May 2016 05:56:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	g129sm8588781wme.1.2016.05.27.05.56.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 May 2016 05:56:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 May 2016 14:57:24 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160527125724.GC2570@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: State of bitbake world 2016-05-24
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
X-List-Received-Date: Fri, 27 May 2016 12:57:00 -0000
X-Groupsio-MsgNum: 82788
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline

--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Most issues were reported last week as well, there are few new ones and
the QA warning output seems to be a bit broken, but probably nobody
reads that far.

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
||2016-05-24	||10	||10	||10	||36	||14	||14	||28	||10	||10	||0	||0		||0		||2=
		||3		||3		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-05-24 =3D=3D

INFO: jenkins-job.sh-1.8.4 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160527_025047.log

=3D=3D=3D common (8) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-r=
sh_0.17.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/geany/geany-plugins_1.27.=
bb, do_configure
    * /meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.5.0.b=
b, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb, do_=
compile
    * /meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.=
5.bb, do_configure
    * /meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/libfr=
ameworkd-glib_git.bb, do_compile
    * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, =
do_compile
    * /openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb, do=
_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb, d=
o_compile
    * /meta-smartphone/meta-shr/recipes-shr/shr/phonefsod_git.bb, do_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb, do_=
compile
    * /meta-smartphone/meta-shr/recipes-shr/shr/libshr-glib_git.bb, do_inst=
all

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/chromium_48.0.2548.0.bb, do_co=
mpile

=3D=3D=3D Number of failed tasks (30) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.qemuarm.20160523_030221.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/16661/
|-
|| qemux86 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.qemux86.20160523_030104.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/16688/
|-
|| qemux86_64 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.qemux86-64.20160524_055314.log// || http://errors.yoctoproject.org:=
80/Errors/Build/16736/
|}

=3D=3D=3D PNBLACKLISTs (90) =3D=3D=3D

=3D=3D=3D QA issues (3) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
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
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||2	||textrel
|-
||3	||build-deps
|-
||3	||file-rdeps
|}



=3D=3D=3D Failed dependencies for qemuarm (36) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160524_022735.log/
Found differences:=20
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependen=
cy?
WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build =
dependency?
WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build depende=
ncy?
WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build depen=
dency?
WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependenc=
y?
WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependenc=
y?
Found errors:=20
ERROR: 36 issues were found in these recipes: chkconfig-alternatives-native=
 collectd enchant geany-plugins gtkmathview jasper libdrm libframeworkd-gli=
b libsdl2 luajit luna-next meta-world-pkgdata netkit-rsh netmap phonefsod p=
ostgresql proxy-libintl samba tcsh

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (14) =3D=3D=
=3D
chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/log.dependencies.qemuarm.20160524_022735.log//2_max/failed/chkconfig-a=
lternatives-native.log
collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies=
=2Eqemuarm.20160524_022735.log//2_max/failed/collectd.log
geany-plugins -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160524_022735.log//2_max/failed/geany-plugins.log
libframeworkd-glib -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160524_022735.log//2_max/failed/libframeworkd-glib.log
libsdl2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.=
qemuarm.20160524_022735.log//2_max/failed/libsdl2.log
luajit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160524_022735.log//2_max/failed/luajit.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160524_022735.log//2_max/failed/luna-next.log
meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160524_022735.log//2_max/failed/meta-world-pkgdata.log
netkit-rsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160524_022735.log//2_max/failed/netkit-rsh.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160524_022735.log//2_max/failed/netmap.log
phonefsod -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160524_022735.log//2_max/failed/phonefsod.log
postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160524_022735.log//2_max/failed/postgresql.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160524_022735.log//2_max/failed/proxy-libintl.log
tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
uarm.20160524_022735.log//2_max/failed/tcsh.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (14) =3D=3D=
=3D
collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies=
=2Eqemuarm.20160524_022735.log//3_min/failed/collectd.log
geany-plugins -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160524_022735.log//3_min/failed/geany-plugins.log
gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160524_022735.log//3_min/failed/gtkmathview.log
libframeworkd-glib -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160524_022735.log//3_min/failed/libframeworkd-glib.log
libsdl2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.=
qemuarm.20160524_022735.log//3_min/failed/libsdl2.log
luajit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160524_022735.log//3_min/failed/luajit.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160524_022735.log//3_min/failed/luna-next.log
meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160524_022735.log//3_min/failed/meta-world-pkgdata.log
netkit-rsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160524_022735.log//3_min/failed/netkit-rsh.log
netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.q=
emuarm.20160524_022735.log//3_min/failed/netmap.log
phonefsod -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemuarm.20160524_022735.log//3_min/failed/phonefsod.log
postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160524_022735.log//3_min/failed/postgresql.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20160524_022735.log//3_min/failed/proxy-libintl.log
tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
uarm.20160524_022735.log//3_min/failed/tcsh.log

=3D=3D=3D Failed dependencies for qemux86 (28) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160525_053417.log/
Found differences:=20
WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build depende=
ncy?
WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build depen=
dency?
WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependenc=
y?
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependen=
cy?
WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build =
dependency?
WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependenc=
y?
Found errors:=20
ERROR: 28 issues were found in these recipes: chkconfig-alternatives-native=
 collectd enchant geany-plugins gtkmathview jasper libdrm libframeworkd-gli=
b libsdl2 luna-next meta-ide-support netmap-modules perf postgresql proxy-l=
ibintl samba tcsh

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (10) =3D=3D=
=3D
chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/log.dependencies.qemux86.20160525_053417.log//2_max/failed/chkconfig-a=
lternatives-native.log
collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies=
=2Eqemux86.20160525_053417.log//2_max/failed/collectd.log
geany-plugins -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160525_053417.log//2_max/failed/geany-plugins.log
libframeworkd-glib -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemux86.20160525_053417.log//2_max/failed/libframeworkd-glib.log
libsdl2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.=
qemux86.20160525_053417.log//2_max/failed/libsdl2.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160525_053417.log//2_max/failed/luna-next.log
netmap-modules -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160525_053417.log//2_max/failed/netmap-modules.log
postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160525_053417.log//2_max/failed/postgresql.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160525_053417.log//2_max/failed/proxy-libintl.log
tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
ux86.20160525_053417.log//2_max/failed/tcsh.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (10) =3D=3D=
=3D
collectd -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies=
=2Eqemux86.20160525_053417.log//3_min/failed/collectd.log
geany-plugins -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160525_053417.log//3_min/failed/geany-plugins.log
gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemux86.20160525_053417.log//3_min/failed/gtkmathview.log
libframeworkd-glib -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemux86.20160525_053417.log//3_min/failed/libframeworkd-glib.log
libsdl2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.=
qemux86.20160525_053417.log//3_min/failed/libsdl2.log
luna-next -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencie=
s.qemux86.20160525_053417.log//3_min/failed/luna-next.log
perf -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
ux86.20160525_053417.log//3_min/failed/perf.log
postgresql -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160525_053417.log//3_min/failed/postgresql.log
proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20160525_053417.log//3_min/failed/proxy-libintl.log
tcsh -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qem=
ux86.20160525_053417.log//3_min/failed/tcsh.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160524_094508.log/

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
metDISTRO_FEATURES', '', d)}"
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
packagegroup-tools-bluetooth: Check if the license information has changed =
in /home/jenkins/oe/world/shr-core/openembedded-core/LICENSE to verify that=
 the LICENSE value "MIT" remains valid [license-checksum]cef3-280796: cef3:=
 Recipe file fetches files and does not have license file information (LIC_=
FILES_CHKSUM) [license-checksum]cef3-280796: ELF binary '/tmp/work/i586-oe-=
linux/cef3/280796-r0/packages-split/cef3-codecs-ffmpeg/usr/lib/cef3/libffmp=
egsumo.so' has relocations in .text [textrel]ubx-utils-0.0.0+gitrAUTOINC+b6=
3c0932dd: /usr/bin/memory-map.sh contained in package ubx-utils requires /b=
in/bash, but no providers found in RDEPENDS_ubx-utils? [file-rdeps]libnewt-=
0.52.18: /usr/bin/whiptail contained in package whiptail requires libnewt.s=
o()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdeps]qtwayl=
and-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends on =
libxcomposite, but it isn't a build dependency, missing libxcomposite in DE=
PENDS or PACKAGECONFIG? [build-deps]gnome-menus-2.30.5: /usr/bin/gmenu-simp=
le-editor contained in package gnome-menus requires /tmp/sysroots/x86_64-li=
nux/usr/bin/python-native/python, but no providers founds requires libxfs.s=
o.0()(64bit), but no providers found in RDEPENDS_xfsprogs-mkfs? [file-rdeps=
]corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/=
packages-split/corosync/usr/sbin/corosync' has relocations in .text [textre=
l]chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig require=
s libnewt.so()(64bit), but no providers found in RDEPENDS_chkconfig? [file-=
rdeps]numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh co=
ntained in package numptyphysics requires /bin/bash, but no providers found=
 in RDEPENDS_numptyphysics? [file-rdeps]qtcharts-5.6.99+5.7.0-beta+gitAUTOI=
NC+8a78184181: qtcharts-examples rdepends on qtmultimedia, but it isn't a b=
uild dependency, missing qtmultimedia in DEPENDS or PACKAGECONFIG? [build-d=
eps]libmodule-build-perl-0.31: /usr/bin/config_data contained in package li=
bmodule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/=
perl.real, but no providers found in RDEPENDS_libmodule-build-perl? [file-r=
deps]dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires=
 libucsi.so()(64bit), but no providers found in RDEPENDS_dvbdate? [file-rde=
ps]dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic requ=
ires libdvbapi.so()(64bit), but no providers found in RDEPENDS_dvbtraffic? =
[file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan =
requires libdvbsec.so()(64bit), but no providers found in RDEPENDS_dvb-scan=
? [file-rdeps]dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps =
requires libdvbsec.so()(64bit), but no providers found in RDEPENDS_dvb-apps=
? [file-rdeps]dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon=
 requires libdvbapi.so()(64bit), but no providers found in RDEPENDS_dvb-fem=
on? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet=
 requires libdvbapi.so()(64bit), but no providers found in RDEPENDS_dvbnet?=
 [file-rdeps]libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snac=
k.so contained in package libnewt-python requires libnewt.so()(64bit), but =
no providers found in RDEPENDS_libnewt-python? [file-rdeps]cef3-280796: cef=
3: Recipe file fetches files and does not have license file information (LI=
C_FILES_CHKSUM) [license-checksum]ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /=
usr/bin/memory-map.sh contained in package ubx-utils requires /bin/bash, bu=
t no providers found in RDEPENDS_ubx-utils? [file-rdeps]
packagegroup-tools-bluetooth: Check if the license information has changed =
in /home/jenkins/oe/world/shr-core/openembedded-core/LICENSE to verify that=
 the LICENSE value "MIT" remains valid [license-checksum]ubx-utils-0.0.0+gi=
trAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in package ubx-utils=
 requires /bin/bash, but no providers found in RDEPENDS_ubx-utils? [file-rd=
eps]libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requir=
es libnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]qtw=
ayland-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends =
on libxcomposite, but it isn't a build dependency, missing libxcomposite in=
 DEPENDS or PACKAGECONFIG? [build-deps]gnome-menus-2.30.5: /usr/bin/gmenu-s=
imple-editor contained in package gnome-menus requires /tmp/sysroots/x86_64=
-linux/usr/bin/python-native/python, but no providers found in RDEPENDS_gno=
me-menus? [file-rdeps]networkmanager-1.0.10: /usr/bin/nmtui-connect contain=
ed in package networkmanager-nmtui requires libnewt.so, but no providers fo=
und in RDEPENDS_networkmanager-nmtui? [file-rdeps]samba-4.4.2: samba rdepen=
ds on libpam, but it isn't a build dependency, missing libsbin/ntsysv conta=
ined in package chkconfig requires libnewt.so, but no providers found in RD=
EPENDS_chkconfig? [file-rdeps]numptyphysics-0.2+svnr109: /usr/share/numptyp=
hysics/convert.pl contained in package numptyphysics requires /usr/bin/perl=
, but no providers found in RDEPENDS_numptyphysics? [file-rdeps]qtcharts-5.=
6.99+5.7.0-beta+gitAUTOINC+8a78184181: qtcharts-examples rdepends on qtmult=
imedia, but it isn't a build dependency, missing qtmultimedia in DEPENDS or=
 PACKAGECONFIG? [build-deps]libmodule-build-perl-0.31: /usr/bin/config_data=
 contained in package libmodule-build-perl requires /tmp/sysroots/x86_64-li=
nux/usr/bin/perl-native/perl.real, but no providers found in RDEPENDS_libmo=
dule-build-perl? [file-rdeps]chromium-48.0.2548.0: ELF binary '/tmp/work/i5=
86-oe-linux/chromium/48.0.2548.0-r0/packages-split/chromium/usr/bin/chromiu=
m/chrome' has relocations in .text [textrel]dvb-apps-1.1.1: /usr/bin/dvbdat=
e contained in package dvbdate requires libucsi.so, but no providers found =
in RDEPENDS_dvbdate? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbtraffic contai=
ned in package dvbtraffic requires libdvbapi.so, but no providers found in =
RDEPENDS_dvbtraffic? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbscan contained=
 in package dvb-scan requires libdvbapi.so, but no providers found in RDEPE=
NDS_dvb-scan? [file-rdeps]dvb-apps-1.1.1: /usr/bin/gotox contained in packa=
ge dvb-apps requires libdvbapi.so, but no providers found in RDEPENDS_dvb-a=
pps? [file-rdeps]dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-fe=
mon requires libdvbapi.so, but no providers found in RDEPENDS_dvb-femon? [f=
ile-rdeps]dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requi=
res libdvbapi.so, but no providers found in RDEPENDS_dvbnet? [file-rdeps]li=
bnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so contained =
in package libnewt-python requires libnewt.so, but no providers found in RD=
EPENDS_libnewt-python? [file-rdeps]packagegroup-tools-bluetooth-1.0: packag=
egroup-tools-bluetooth: The LIC_FILES_CHKSUM does not match for file:///hom=
e/jenkins/oe/world/shr-core/openembedded-core/LICENSE;md5=3D3f40d7994397109=
285ec7b81fdeb3b58


count: 3	issue: build-deps
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]qtwayla=
nd-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends on l=
ibxcomposite, but it isn't a build dependency, missing libxcomposite in DEP=
ENDS or PACKAGECONFIG? [build-deps]gnome-menus-2.30.5: /usr/bin/gmenu-simpl=
e-editor contained in package gnome-menus requires /tmp/sysroots/x86_64-lin=
ux/usr/bin/python-native/python, but no providers found in RDEPENDS_gnome-m=
enus? [file-rdeps]networkmanager-1.0.10: /usr/bin/nmtui-connect contained i=
n package networkmanager-nmtui requires libnewt.so, but no providers found =
in RDEPENDS_networkmanager-nmtui? [file-rdeps]samba-4.4.2: samba rdepends o=
n libpam, but it isn't a build dependency, missing libpam in DEPENDS or PAC=
KAGECONFIG? [build-deps]xfsprogs-3.2.3: /usr/sbin/xfs_db contained in packa=
ge xfsprogs requires libxfs.so.0, but no providers found in RDEPENDS_xfspro=
gs? [file-rdeps]xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprog=
s-mkfs requires libxfs.so.0, but no providers found in RDEPENDS_xfsprogs-mk=
fs? [file-rdeps]chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chk=
config requires libnewt.so, but no providers found in RDEPENDS_chkconfig? [=
file-rdeps]numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.=
sh contained in package numptyphysics requires /bin/bash, but no provide-1.=
1.1: /usr/bin/dvbdate contained in package dvbdate requires libucsi.so, but=
 no providers found in RDEPENDS_dvbdate? [file-rdeps]dvb-apps-1.1.1: /usr/b=
in/dvbtraffic contained in package dvbtraffic requires libdvbapi.so, but no=
 providers found in RDEPENDS_dvbtraffic? [file-rdeps]dvb-apps-1.1.1: /usr/b=
in/dvbscan contained in package dvb-scan requires libdvbapi.so, but no prov=
iders found in RDEPENDS_dvb-scan? [file-rdeps]dvb-apps-1.1.1: /usr/bin/goto=
x contained in package dvb-apps requires libdvbapi.so, but no providers fou=
nd in RDEPENDS_dvb-apps? [file-rdeps]dvb-apps-1.1.1: /usr/bin/femon contain=
ed in package dvb-femon requires libdvbapi.so, but no providers found in RD=
EPENDS_dvb-femon? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbnet contained in =
package dvbnet requires libdvbapi.so, but no providers found in RDEPENDS_dv=
bnet? [file-rdeps]libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/=
_snack.so contained in package libnewt-python requires libnewt.so, but no p=
roviders found in RDEPENDS_libnewt-python? [file-rdeps]packagegroup-tools-b=
luetooth-1.0: packagegroup-tools-bluetooth: The LIC_FILES_CHKSUM does not m=
atch for file:///home/jenkins/oe/world/shr-core/openembedded-core/LICENSE;m=
d5=3D3f40d7994397109285ec7b81fdeb3b58
packagegroup-tools-bluetooth: Check if the license information has changed =
in /home/jenkins/oe/world/shr-core/openembedded-core/LICENSE to verify that=
 the LICENSE value "MIT" remains valid [license-checksum]cef3-280796: cef3:=
 Recipe file fetches files and does not have license file information (LIC_=
FILES_CHKSUM) [license-checksum]cef3-280796: ELF binary '/tmp/work/i586-oe-=
linux/cef3/280796-r0/packages-split/cef3-codecs-ffmpeg/usr/lib/cef3/libffmp=
egsumo.so' has relocations in .text [textrel]ubx-utils-0.0.0+gitrAUTOINC+b6=
3c0932dd: /usr/bin/memory-map.sh contained in package ubx-utils requires /b=
in/bash, but no providers found in RDEPENDS_ubx-utils? [file-rdeps]libnewt-=
0.52.18: /usr/bin/whiptail contained in package whiptail requires libnewt.s=
o()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdeps]qtwayl=
and-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends on =
libxcomposite, but it isn't a build dependency, missing libxcomposite in DE=
PENDS or PACKAGECONFIG? [build-deps]gnome-menus-2.30.5: /usr/bin/gmenu-simp=
le-editor contained in package gnome-menus requires /tmp/sysroots/x86_64-li=
nux/usr/bin/python-native/python, but no providers found in RDEPENDS_gnome-=
menus? [file-rdeps]networkmanager-1.0.10: /usr/bin/nmtui-connect contained =
in package networkmanager-nmtui requires libnewt.so()(64bit), but no provid=
ers found in RDEPENDS_networkmanager-nmtui? [file-rdeps]samba-4.4.2: samba =
rdepends on libpam, but it isn't a build dependency, missing libpam in DEPE=
NDS or PACKAGECONFIG? [build-deps]xfsprogs-3.2.3: /usr/sbin/xfs_db containe=
d in package xfsprogs requires libxfs.so.0()(64bit), but no providers found=
 in RDEPENDS_xfsprogs? [file-rdeps]xfsprogs-3.2.3: /sbin/mkfs.xfs contained=
 in package xfsprogs-mkfs requires libxfs.so.0()(64bit), but no providers f=
ound in RDEPENDS_xfsprogs-mkfs? [file-rdeps]corosync-2.3.5: ELF binary '/tm=
p/work/core2-64-oe-linux/corosync/2.3.5-r0/packages-split/corosync/usr/sbin=
/corosync' has relocations in .text [textrel]chkconfig-1.3.58: /usr/sbin/nt=
sysv contained in package chkconfig requires libnewt.so()(64bit), but no pr=
oviders found in RDEPENDS_chkconfig? [file-rdeps]numptyphysics-0.2+svnr109:=
 /usr/share/numptyphysics/convert_all.sh contained in package numptyphysics=
 requires /bin/bash, but no providers found in RDEPENDS_numptyphysics? [fil=
e-rdeps]qtcharts-5.6e-rdeps]dvb-apps-1.1.1: /usr/bin/dvbdate contained in p=
ackage dvbdate requires libucsi.so()(64bit), but no providers found in RDEP=
ENDS_dvbdate? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in =
package dvbtraffic requires libdvbapi.so()(64bit), but no providers found i=
n RDEPENDS_dvbtraffic? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbscan contain=
ed in package dvb-scan requires libdvbsec.so()(64bit), but no providers fou=
nd in RDEPENDS_dvb-scan? [file-rdeps]dvb-apps-1.1.1: /usr/bin/gotox contain=
ed in package dvb-apps requires libdvbsec.so()(64bit), but no providers fou=
nd in RDEPENDS_dvb-apps? [file-rdeps]dvb-apps-1.1.1: /usr/bin/femon contain=
ed in package dvb-femon requires libdvbapi.so()(64bit), but no providers fo=
und in RDEPENDS_dvb-femon? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbnet cont=
ained in package dvbnet requires libdvbapi.so()(64bit), but no providers fo=
und in RDEPENDS_dvbnet? [file-rdeps]libnewt-python-0.52.18: /usr/lib/python=
2.7/site-packages/_snack.so contained in package libnewt-python requires li=
bnewt.so()(64bit), but no providers found in RDEPENDS_libnewt-python? [file=
-rdeps]cef3-280796: cef3: Recipe file fetches files and does not have licen=
se file information (LIC_FILES_CHKSUM) [license-checksum]ubx-utils-0.0.0+gi=
trAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in package ubx-utils=
 requires /bin/bash, but no providers found in RDEPENDS_ubx-utils? [file-rd=
eps]
packagegroup-tools-bluetooth: Check if the license information has changed =
in /home/jenkins/oe/world/shr-core/openembedded-core/LICENSE to verify that=
 the LICENSE value "MIT" remains valid [license-checksum]ubx-utils-0.0.0+gi=
trAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in package ubx-utils=
 requires /bin/bash, but no providers found in RDEPENDS_ubx-utils? [file-rd=
eps]libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requir=
es libnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]qtw=
ayland-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends =
on libxcomposite, but it isn't a build dependency, missing libxcomposite in=
 DEPENDS or PACKAGECONFIG? [build-deps]gnome-menus-2.30.5: /usr/bin/gmenu-s=
imple-editor contained in package gnome-menus requires /tmp/sysroots/x86_64=
-linux/usr/bin/python-native/python, but no providers found in RDEPENDS_gno=
me-menus? [file-rdeps]networkmanager-1.0.10: /usr/bin/nmtui-connect contain=
ed in package networkmanager-nmtui requires libnewt.so, but no providers fo=
und in RDEPENDS_networkmanager-nmtui? [file-rdeps]samba-4.4.2: samba rdepen=
ds on libpam, but it isn't a build dependency, missing libpam in DEPENDS or=
 PACKAGECONFIG? [build-deps]xfsprogs-3.2.3: /usr/sbin/xfs_db contained in p=
ackage xfsprogs requires libxfs.so.0, but no providers found in RDEPENDS_xf=
sprogs? [file-rdeps]xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfs=
progs-mkfs requires libxfs.so.0, but no providers found in RDEPENDS_xfsprog=
s-mkfs? [file-rdeps]chkconfig-1.3.58: /usr/sbin/ntsysv contained in package=
 chkconfig requires libnewt.so, but no providers found in RDEPENDS_chkconfi=
g? [file-rdeps]numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.=
pl contained in package numptyphysics requires /usr/bin/perl, but no provid=
ers found in RDEPENDS_numptyphysics? [file-rdeps]qtcharts-5.6.99+5.7.0-beta=
+gitAUTOINC+8a78184181: qtcharts-examples rdepends on qtmultimedia, but it =
isn't a build dependency, missing qtmultimedia in DEPENDS or PACKAGECONFIG?=
 [build-deps]libmodule-build-perl-0.31: /usr/bin/config_data contained in p=
ackage libmodule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/pe =
package dvb-femon requires libdvbapi.so, but no providers found in RDEPENDS=
_dvb-femon? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbnet contained in packag=
e dvbnet requires libdvbapi.so, but no providers found in RDEPENDS_dvbnet? =
[file-rdeps]libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack=
=2Eso contained in package libnewt-python requires libnewt.so, but no provi=
ders found in RDEPENDS_libnewt-python? [file-rdeps]packagegroup-tools-bluet=
ooth-1.0: packagegroup-tools-bluetooth: The LIC_FILES_CHKSUM does not match=
 for file:///home/jenkins/oe/world/shr-core/openembedded-core/LICENSE;md5=
=3D3f40d7994397109285ec7b81fdeb3b58


count: 3	issue: file-rdeps
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]qtwayla=
nd-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends on l=
ibxcomposite, but it isn't a build dependency, missing libxcomposite in DEP=
ENDS or PACKAGECONFIG? [build-deps]gnome-menus-2.30.5: /usr/bin/gmenu-simpl=
e-editor contained in package gnome-menus requires /tmp/sysroots/x86_64-lin=
ux/usr/bin/python-native/python, but no providers found in RDEPENDS_gnome-m=
enus? [file-rdeps]networkmanager-1.0.10: /usr/bin/nmtui-connect contained i=
n package networkmanager-nmtui requires libnewt.so, but no providers found =
in RDEPENDS_networkmanager-nmtui? [file-rdeps]samba-4.4.2: samba rdepends o=
n libpam, but it isn't a build dependency, missing libpam in DEPENDS or PAC=
KAGECONFIG? [build-deps]xfsprogs-3.2.3: /usr/sbin/xfs_db contained in packa=
ge xfsprogs requires libxfs.so.0, but no providers found in RDEPENDS_xfspro=
gs? [file-rdeps]xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprog=
s-mkfs requires libxfs.so.0, but no providers found in RDEPENDS_xfsprogs-mk=
fs? [file-rdeps]chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chk=
config requires libnewt.so, but no providers found in RDEPENDS_chkconfig? [=
file-rdeps]numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.=
sh contained in package numptyphysics requires /bin/bash, but no providers =
found in RDEPENDS_numptyphysics? [file-rdeps]qtcharts-5.6.99+5.7.0-beta+git=
AUTOINC+8a78184181: qtcharts-examples rdepends on qtmultimedia, but it isn'=
t a build dependency, missing qtmultimedia in DEPENDS or PACKAGECONFIG? [bu=
ild-deps]libmodule-build-perl-0.31: /usr/bin/config_data contained in packa=
ge libmodule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-na=
tive/perl.real, but no providers found in RDEPENDS_libmodule-build-perl? [f=
ile-rdeps]dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate req=
uires libucsi.so, but no providers found in RDEPENDS_dvbdate? [file-rdeps]d=
vb-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic requires=
 libdvbapi.so, but no providers found in RDEPENDS_dvbtraffic? [file-rdeps]d=
vb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan requires libd=
vbapi.so, but no providers found in RDEPENDS_dvb-scan? [file-rdeps]dvb-apps=
-1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdvbapi.so,=
 but no providers found in RDEPENDS_dvb-apps? [file-rdeps]dvb-apps-1.1.1: /=
usr/bin/femon contained in package dvb-femon requires libdvbapi.so, but no =
providers found in RDEPENDS_dvb-femon? [file-rdeps]dvb-apps-1.1.1: /usr/bin=
/dvbnet contained in package dvbnet requires libdvbapi.so, but no providers=
 found in RDEPENDS_dvbnet? [file-rdeps]libnewt-python-0.52.18: /usr/lib/pyt=
hon2.7/site-packages/_snack.so contained in package libnewt-python requires=
 libnewt.so, but no providers found in RDEPENDS_libnewt-python? [file-rdepC=
_FILES_CHKSUM does not match for file:///home/jenkins/oe/world/shr-core/ope=
nembedded-core/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58
packagegroup-tools-bluetooth: Check if the license information has changed =
in /home/jenkins/oe/world/shr-core/openembedded-core/LICENSE to verify that=
 the LICENSE value "MIT" remains valid [license-checksum]cef3-280796: cef3:=
 Recipe file fetches files and does not have license file information (LIC_=
FILES_CHKSUM) [license-checksum]cef3-280796: ELF binary '/tmp/work/i586-oe-=
linux/cef3/280796-r0/packages-split/cef3-codecs-ffmpeg/usr/lib/cef3/libffmp=
egsumo.so' has relocations in .text [textrel]ubx-utils-0.0.0+gitrAUTOINC+b6=
3c0932dd: /usr/bin/memory-map.sh contained in package ubx-utils requires /b=
in/bash, but no providers found in RDEPENDS_ubx-utils? [file-rdeps]libnewt-=
0.52.18: /usr/bin/whiptail contained in package whiptail requires libnewt.s=
o()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdeps]qtwayl=
and-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends on =
libxcomposite, but it isn't a build dependency, missing libxcomposite in DE=
PENDS or PACKAGECONFIG? [build-deps]gnome-menus-2.30.5: /usr/bin/gmenu-simp=
le-editor contained in package gnome-menus requires /tmp/sysroots/x86_64-li=
nux/usr/bin/python-native/python, but no providers found in RDEPENDS_gnome-=
menus? [file-rdeps]networkmanager-1.0.10: /usr/bin/nmtui-connect contained =
in package networkmanager-nmtui requires libnewt.so()(64bit), but no provid=
ers found in RDEPENDS_networkmanager-nmtui? [file-rdeps]samba-4.4.2: samba =
rdepends on libpam, but it isn't a build dependency, missing libpam in DEPE=
NDS or PACKAGECONFIG? [build-deps]xfsprogs-3.2.3: /usr/sbin/xfs_db containe=
d in package xfsprogs requires libxfs.so.0()(64bit), but no providers found=
 in RDEPENDS_xfsprogs? [file-rdeps]xfsprogs-3.2.3: /sbin/mkfs.xfs contained=
 in package xfsprogs-mkfs requires libxfs.so.0()(64bit), but no providers f=
ound in RDEPENDS_xfsprogs-mkfs? [file-rdeps]corosync-2.3.5: ELF binary '/tm=
p/work/core2-64-oe-linux/corosync/2.3.5-r0/packages-split/corosync/usr/sbin=
/corosync' has relocations in .text [textrel]chkconfig-1.3.58: /usr/sbin/nt=
sysv contained in package chkconfig requires libnewt.so()(64bit), but no pr=
oviders found in RDEPENDS_chkconfig? [file-rdeps]numptyphysics-0.2+svnr109:=
 /usr/share/numptyphysics/convert_all.sh contained in package numptyphysics=
 requires /bin/bash, but no providers found in RDEPENDS_numptyphysics? [fil=
e-rdeps]qtcharts-5.6.99+5.7.0-beta+gitAUTOINC+8a78184181: qtcharts-examples=
 rdepends on qtmultimedia, but it isn't a build dependency, missing qtmulti=
media in DEPENDS or PACKAGECONFIG? [build-deps]libmodule-build-perl-0.31: /=
usr/bin/config_data contained in package libmodule-build-perl requires /tmp=
/sysroots/x86_64-linux/usr/bin/perl-native/perl.real, but no providers foun=
d in RDEPENDS_libmodule-build-perl? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dv=
bdate contained in package dvbdate requires libucsi.so()(64bit), but no pro=
viders found in RDEPENDS_dvbdate? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbt=
raffic contained in package dvbtraffic requires libdvbapi.so()(64bit), but =
no providers found in RDEPENDS_dvbtraffic? [file-rdeps]dvb-apps-1.1.1: /usr=
/bin/dvbscan contained in package dvb-scan requires libdvbsec.so()(64bit), =
but no providers found in RDEPENDS_dvb-scan? [file-rdeps]dvb-apps-1.1.1: /u=
sr/bin/gotox contained in package dvb-apps requires libdvbsec.so()(64bit), =
but no providers found in RDEPENDS_dvb-apps? [file-rdeps]dvb-apps-1.1.1: /u=
sr/bin/femon contained in package dvb-femon requires libdvbapi.so()(64bit f=
etches files and does not have license file information (LIC_FILES_CHKSUM) =
[license-checksum]ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-m=
ap.sh contained in package ubx-utils requires /bin/bash, but no providers f=
ound in RDEPENDS_ubx-utils? [file-rdeps]
packagegroup-tools-bluetooth: Check if the license information has changed =
in /home/jenkins/oe/world/shr-core/openembedded-core/LICENSE to verify that=
 the LICENSE value "MIT" remains valid [license-checksum]ubx-utils-0.0.0+gi=
trAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in package ubx-utils=
 requires /bin/bash, but no providers found in RDEPENDS_ubx-utils? [file-rd=
eps]libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requir=
es libnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]qtw=
ayland-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends =
on libxcomposite, but it isn't a build dependency, missing libxcomposite in=
 DEPENDS or PACKAGECONFIG? [build-deps]gnome-menus-2.30.5: /usr/bin/gmenu-s=
imple-editor contained in package gnome-menus requires /tmp/sysroots/x86_64=
-linux/usr/bin/python-native/python, but no providers found in RDEPENDS_gno=
me-menus? [file-rdeps]networkmanager-1.0.10: /usr/bin/nmtui-connect contain=
ed in package networkmanager-nmtui requires libnewt.so, but no providers fo=
und in RDEPENDS_networkmanager-nmtui? [file-rdeps]samba-4.4.2: samba rdepen=
ds on libpam, but it isn't a build dependency, missing libpam in DEPENDS or=
 PACKAGECONFIG? [build-deps]xfsprogs-3.2.3: /usr/sbin/xfs_db contained in p=
ackage xfsprogs requires libxfs.so.0, but no providers found in RDEPENDS_xf=
sprogs? [file-rdeps]xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfs=
progs-mkfs requires libxfs.so.0, but no providers found in RDEPENDS_xfsprog=
s-mkfs? [file-rdeps]chkconfig-1.3.58: /usr/sbin/ntsysv contained in package=
 chkconfig requires libnewt.so, but no providers found in RDEPENDS_chkconfi=
g? [file-rdeps]numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.=
pl contained in package numptyphysics requires /usr/bin/perl, but no provid=
ers found in RDEPENDS_numptyphysics? [file-rdeps]qtcharts-5.6.99+5.7.0-beta=
+gitAUTOINC+8a78184181: qtcharts-examples rdepends on qtmultimedia, but it =
isn't a build dependency, missing qtmultimedia in DEPENDS or PACKAGECONFIG?=
 [build-deps]libmodule-build-perl-0.31: /usr/bin/config_data contained in p=
ackage libmodule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/per=
l-native/perl.real, but no providers found in RDEPENDS_libmodule-build-perl=
? [file-rdeps]chromium-48.0.2548.0: ELF binary '/tmp/work/i586-oe-linux/chr=
omium/48.0.2548.0-r0/packages-split/chromium/usr/bin/chromium/chrome' has r=
elocations in .text [textrel]dvb-apps-1.1.1: /usr/bin/dvbdate contained in =
package dvbdate requires libucsi.so, but no providers found in RDEPENDS_dvb=
date? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in package =
dvbtraffic requires libdvbapi.so, but no providers found in RDEPENDS_dvbtra=
ffic? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb=
-scan requires libdvbapi.so, but no providers found in RDEPENDS_dvb-scan? [=
file-rdeps]dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps req=
uires libdvbapi.so, but no providers found in RDEPENDS_dvb-apps? [file-rdep=
s]dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires li=
bdvbapi.so, but no providers found in RDEPENDS_dvb-femon? [file-rdeps]dvb-a=
pps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requires libdvbapi.s=
o, but no providers found in RDEPENDS_dvbnet? [file-rdeps]libnewt-python-0.=
52.18: /usr/lib/43144d world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
d8b4dfa metadata-revs: provide more information
79685fa buildhistory.bbclass: metadata-revs show repo parent
6476c35 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
a51f426 sstate-sysroot-cruft.sh: Extend the whitelist
1c0c3ec qemux86: Add identical qemux86copy variant for tests
0a99136 report-error: Allow to upload reports automatically
474d3aa linux-yocto-rt, core-image-rt*: Explicitly skip when PREFERRED_PROV=
IDER_virtual/kernel isn't set to linux-yocto-rt

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
0486e44 openct: Fix rootfs creation errors
ad59852 iptraf: Fix rootfs creation errors
b6d7431 fontforge: add back gnulib to DEPENDS
6b928f3 sthttpd: update to 2.27.0
c0166ac ntp: avoid floating dependency on mdns (aka mDNSResponder)
4847362 freeglut: Add a recipe freeglut to replace mesa-glut
00e9961 mesa-glut: Remove the recipe
4d88df0 assimp: Add recipe for Open Asset Import Library
095d71b initramfs-kexecboot-klibc-image: Skip for nios2
e760847 x11vnc: remove old libtool macros from acinclude.m4
3d6e8c7 networkmanager: add missing dep on dbus-glib-native
eadb658 networkmanager: add missing dep on intltool-native
841588a openlmi-networking: add missing dep on konkretcmpi-native
1634e51 luajit: fix build issues, obey more vars
1343c2d mg: stop relying on make -e
3d7ba03 llvm: make llvm-config wrapper error message more understandable
df32b5d openconnect: fix do_compile failure
24eeac8 openconnect: add dependency to fix Makefile.am
078bc0d android-tools: Fix, enhance and move from meta-shr

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
27617dd qtchooser: add new recipe
ee697dd qtvirtualkeyboard: add recipe
f91d2c5 qtdeclarative-render2d: add recipe
9da1ed9 qtdatavis3d: add recipe
78c0b63 qtcharts: add recipe
09c0d9a licenses: update technology preview license to match upstream
0717c65 cmake_qt5: prepend the Qt5 specific CMake variables to EXTRA_OECMAKE
0510382 qtbase: add patch to make Qt5Config modules behave better with cmak=
e builds
cbd9331 qt5: Allow disabling SHA validation for branch
05e05db qtbase: Reorder EGL libraries from pkgconfig and defaults:

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D

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

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldIQ78ACgkQN1Ujt2V2gBwfsQCbBLf3MaPQXPZRnApvlcrWzuaR
UwEAn24/72SDUiWdl1u/DxGG+sanpiIS
=yrnv
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
