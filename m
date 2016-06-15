Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF4C6014F;
	Wed, 15 Jun 2016 10:44:56 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a66so18165879wme.0;
	Wed, 15 Jun 2016 03:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=w31b6lm9oUClN+0Dxps1hXy8UjWPB5ElIM0XGFCmZgM=;
	b=afsSHbP7M8Nk5y3GUV55DoIreXH5IP+gSj4CyxqpZe6l4LZKqWuU/kRnZq67gpaW5L
	voHc2EvEFPzaJADOAQjrPjz5IkcH6JA9onrHalHN7dGtYwhc/m2LmTpPfjeKUh4dnjwG
	PjQTO6d1+25UwYZCv32ExbNyrmCxnSoSnmRk/cLleCWD5l4tr32g1+JuFssdTKd+Jsf9
	meGimoFub99GhhkD4C8LWtErgSjupczuj82YcE7TCOYUjpfLuG0Fs5+V5skP2zgeFuxp
	4TSR0xeue/qo/0OUWCqxIX4QzY8/Hv2EPEGNCaSAd6oWAEejkj3KFUZhgqsq6nEnQSQp
	99uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=w31b6lm9oUClN+0Dxps1hXy8UjWPB5ElIM0XGFCmZgM=;
	b=aeswUQ8LCoYivVU5tqqO31PMHN29mwYwPkeAFm8cA9oAtRKYqHU5pmkKQBjKWh8vbi
	XKQGL48Z7pCGHMhPqW8NcQacRygvuj1HN95gd1mq31yEcqAz850ch5yO0zO/niQjGkVu
	mWqGymJD3lbY9ie6J6esPhj1s2I4wdVmu2UKwwnq00EAppV/+V9YeV6mG6A2l2kioyOr
	NzAKr4o+FDstwVBaaR6GdLblgKAcpEu9XTn+xUkxQ9T0d0UssdGGYEAeSEKgpXEfcQIy
	xHLpGZAVu9Q3kMJwUDwwH3B5snKd/MraI/8F1tqmSC+R0Xun1lveBYPpwMTvLwBu5Q3T
	HEEA==
X-Gm-Message-State: ALyK8tL7s/c5rxZM+ueHp86NWBenv3KBH9ZnUPqPLOkxDIMUFirG147NgAo6I9RiEkXbYg==
X-Received: by 10.28.211.142 with SMTP id k136mr9417247wmg.29.1465987495988;
	Wed, 15 Jun 2016 03:44:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u71sm8947155wmu.13.2016.06.15.03.44.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Jun 2016 03:44:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Jun 2016 12:45:18 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160615104518.GC2569@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: State of bitbake world 2016-06-13
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
X-List-Received-Date: Wed, 15 Jun 2016 10:44:58 -0000
X-Groupsio-MsgNum: 83462
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline

--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 10:01:56PM +0200, Martin Jansa wrote:
> On Thu, Jun 09, 2016 at 09:03:45AM +0200, Martin Jansa wrote:
> > This report includes python3 changes, there are few more failures, but
> > it's hard to see what is new, so I've sent couple PNBLACKLISTs for
> > recipes reported in previous 2 reports which are still failing with
> > glibc-2.24 and gcc-6. Hopefully next report will show only "new" issues
> > caused by python3 switch.
>=20
> I've blacklisted most of issues caused by gcc-6 and older issues which
> were reported multiple times, now the list is a lot shorter for cost of
> much more PNBLACKLISTs.
>=20
> Thanks to Darek who sent couple fixes already. These will be tested in ne=
xt run.
>=20
> I've sent additional fix for bundler, blacklist for tasks and luna-next, =
so next
> report should be even shorter.

With massive PNBLACKLISTing we finally got report where I can spot at least=
 new issues.

libgphoto2, v4l-utils fail because recent upgrade of libjpeg-turbo in oe-co=
re (PNBLACKLIST sent)
libjs-jquery is caused by bitbake's fetch module not fully migrated to pyth=
on3 (patch sent)

I've hopefully fixed my modification report-error.bbclass for automatically=
 sending the reports
to work correctly with python3, so next report should contain links to erro=
rs.yoctoproject.org again.

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
||2016-06-13	||4	||4	||4	||29	||9	||8	||21	||6	||5	||0	||0		||0		||0		||5		=
||5		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-06-13 =3D=3D

INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20160615_000938.log

=3D=3D=3D common (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.b=
b, do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2=
=2Ebb, do_compile
    * meta-openembedded/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb=
, do_unpack

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb, do_comp=
ile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * openembedded-core/meta/recipes-bsp/systemd-boot/systemd-boot.bb, do_c=
ompile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (12) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemuarm.20160613_105420.log/ ||=20
|-
|| qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemux86.20160613_113803.log/ ||=20
|-
|| qemux86_64 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
world.qemux86-64.20160613_214933.log/ ||=20
|}

=3D=3D=3D PNBLACKLISTs (143) =3D=3D=3D

=3D=3D=3D QA issues (10) =3D=3D=3D
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
||0	||textrel
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||5	||build-deps
|-
||5	||file-rdeps
|}



=3D=3D=3D Failed dependencies for qemuarm (29) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160613_205240.log/
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
    * ERROR: 29 issues were found in these recipes: chkconfig-alternatives-=
native enchant gtkmathview jasper libdrm libgphoto2 libjs-jquery meta-world=
-pkgdata netmap proxy-libintl samba systemd-boot v4l-utils

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (9) =3D=3D=
=3D
    * chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlog=
s/oe/world/log.dependencies.qemuarm.20160613_205240.log//2_max/failed/chkco=
nfig-alternatives-native.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160613_205240.log//2_max/failed/gtkmathview.log
    * libgphoto2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160613_205240.log//2_max/failed/libgphoto2.log
    * libjs-jquery -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160613_205240.log//2_max/failed/libjs-jquery.log
    * meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
log.dependencies.qemuarm.20160613_205240.log//2_max/failed/meta-world-pkgda=
ta.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160613_205240.log//2_max/failed/netmap.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160613_205240.log//2_max/failed/proxy-libintl.log
    * systemd-boot -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160613_205240.log//2_max/failed/systemd-boot.log
    * v4l-utils -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160613_205240.log//2_max/failed/v4l-utils.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (8) =3D=3D=
=3D
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160613_205240.log//3_min/failed/gtkmathview.log
    * libgphoto2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20160613_205240.log//3_min/failed/libgphoto2.log
    * libjs-jquery -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160613_205240.log//3_min/failed/libjs-jquery.log
    * meta-world-pkgdata -- http://logs.nslu2-linux.org/buildlogs/oe/world/=
log.dependencies.qemuarm.20160613_205240.log//3_min/failed/meta-world-pkgda=
ta.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160613_205240.log//3_min/failed/netmap.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemuarm.20160613_205240.log//3_min/failed/proxy-libintl.log
    * systemd-boot -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemuarm.20160613_205240.log//3_min/failed/systemd-boot.log
    * v4l-utils -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160613_205240.log//3_min/failed/v4l-utils.log

=3D=3D=3D Failed dependencies for qemux86 (21) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160614_074005.log/
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
    * ERROR: 21 issues were found in these recipes: chkconfig-alternatives-=
native enchant gtkmathview jasper libdrm libjs-jquery netmap piglit proxy-l=
ibintl samba

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (6) =3D=3D=
=3D
    * chkconfig-alternatives-native -- http://logs.nslu2-linux.org/buildlog=
s/oe/world/log.dependencies.qemux86.20160614_074005.log//2_max/failed/chkco=
nfig-alternatives-native.log
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160614_074005.log//2_max/failed/gtkmathview.log
    * libjs-jquery -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemux86.20160614_074005.log//2_max/failed/libjs-jquery.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160614_074005.log//2_max/failed/netmap.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160614_074005.log//2_max/failed/piglit.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160614_074005.log//2_max/failed/proxy-libintl.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (5) =3D=3D=
=3D
    * gtkmathview -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160614_074005.log//3_min/failed/gtkmathview.log
    * libjs-jquery -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.de=
pendencies.qemux86.20160614_074005.log//3_min/failed/libjs-jquery.log
    * netmap -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160614_074005.log//3_min/failed/netmap.log
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160614_074005.log//3_min/failed/piglit.log
    * proxy-libintl -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.d=
ependencies.qemux86.20160614_074005.log//3_min/failed/proxy-libintl.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160614_010259.log/


    * ERROR: Nothing RPROVIDES 'oh-puzzles' (but /home/jenkins/oe/world/shr=
-core/meta-smartphone/meta-shr/recipes-shr/packagegroups/packagegroup-shr-f=
eed.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /ho=
me/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'oh-puzzles' (but /home/jenkins/oe/world/shr=
-core/meta-smartphone/meta-shr/recipes-shr/packagegroups/packagegroup-shr-f=
eed.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'oh-puzzles' (but /home/jenkins/oe/world/shr=
-core/meta-smartphone/meta-shr/recipes-shr/packagegroups/packagegroup-shr-f=
eed.bb RDEPENDS on or otherwise requires it)
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
recipes-mozilla/firefox/firefox_38.7.1esr.bb:PNBLACKLIST[firefox] ?=3D "BRO=
KEN: fails to build with gcc-6"
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
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D "Depends on bro=
ken poppler"
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
meta-gnome/recipes-gnome/evince/evince_3.18.2.bb:PNBLACKLIST[evince] ?=3D "=
Depends on broken poppler"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken gnome-panel"
meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb:PNBLACKLIST[gedit] ?=3D "Dep=
ends on broken gtksourceview2"
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
meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb:PNBLACKLIST=
[gtksourceview2] ?=3D "BROKEN: fails to build with gcc-6"
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
meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker] ?=
=3D "Depends on broken poppler"
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
meta-multimedia/recipes-multimedia/faac/faac_1.28.bb:PNBLACKLIST[faac] ?=3D=
 "BROKEN: fails to build with gcc-6"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNB=
LACKLIST[gst-ffmpeg] ?=3D "Not compatible with currently used ffmpeg 3"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-connectivity/crda/crda_3.18.bb:PNBLACKLIST[crda] ?=
=3D "BROKEN: fails to build with gcc-6"
meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb:PNBLACKLIST[lftp] =
?=3D "BROKEN: fails to build with gcc-6"
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
meta-oe/recipes-benchmark/glmark2/glmark2_git.bb:PNBLACKLIST[glmark2] ?=3D =
"BROKEN: fails to build with gcc-6"
meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb:PNBLACKLIST[iperf] ?=3D "BRO=
KEN: fails to build with gcc-6"
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
meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb:PNBLACKLIST[libqmi] ?=
=3D "BROKEN: fails to build with gcc-6"
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
meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb:PNBLACKLIST[pyth=
on-pygobject] ?=3D "BROKEN: fails to build since it was moved to meta-oe"
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
meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb:PNBLACKLIST[gimp] ?=3D "Depend=
s on broken poppler"
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
meta-oe/recipes-kernel/crash/crash_7.1.3.bb:PNBLACKLIST[crash] ?=3D "BROKEN=
: fails to build with gcc-6"
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
meta-oe/recipes-support/poppler/poppler_0.43.0.bb:PNBLACKLIST[poppler] ?=3D=
 "BROKEN: fails to build with gcc-6"
meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb:PNBLACKLIST[postgres=
ql] ?=3D "Depends on broken tcl"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb:PNBLACKLIST[=
python-cloudeebus] ?=3D "Rdepends on broken python-pygobject"
meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb:PNBLACKLIST[p=
ython-dbusmock] ?=3D "Depends on broken python-pygobject"
meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb:PNBLACKLIST[mousepad] ?=
=3D "Depends on broken gtksourceview2"
meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb:PNBLACKLIST[tumbler] ?=3D =
"Depends on broken poppler"
meta-qt5:
meta-smartphone:
meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:PN=
BLACKLIST[libframeworkd-glib] ?=3D "BROKEN: many errors when building with =
gcc-6"
meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zho=
ne] ?=3D "rdepends on python-pycairo which was removed"
meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedca=
ching] ?=3Dbluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in=
 DISTRO_FEATURES', '', d)}"
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


count: 5	issue: build-deps
chrony-2.4: chrony rdepends on libedit, but it isn't a build dependency, mi=
ssing libedit in DEPENDS or PACKAGECONFIG? [build-deps]
chrony-2.4: chrony rdepends on nss, but it isn't a build dependency, missin=
g nss in DEPENDS or PACKAGECONFIG? [build-deps]
qt3d-5.6.99+5.7.0-beta+gitAUTOINC+be29a39ede: qt3d-plugins rdepends on assi=
mp, but it isn't a build dependency, missing assimp in DEPENDS or PACKAGECO=
NFIG? [build-deps]
qtvirtualkeyboard-5.6.99+5.7.0-beta+gitAUTOINC+42344a4b21: qtvirtualkeyboar=
d-plugins rdepends on hunspell, but it isn't a build dependency, missing hu=
nspell in DEPENDS or PACKAGECONFIG? [build-deps]
samba-4.4.2: samba rdepends on libpam, but it isn't a build dependency, mis=
sing libpam in DEPENDS or PACKAGECONFIG? [build-deps]


count: 5	issue: file-rdeps
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so, but no providers found in RDEPENDS_networ=
kmanager-nmtui? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui contained in package networkmanager-n=
mtui requires libnewt.so()(64bit), but no providers found in RDEPENDS_netwo=
rkmanager-nmtui? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-edit contained in package networkmana=
ger-nmtui requires libnewt.so, but no providers found in RDEPENDS_networkma=
nager-nmtui? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 0	issue: installeemux86copy variant for tests
694e0eb sstate-sysroot-cruft.sh: Extend the whitelist
80fa5d9 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
d3466df buildhistory.bbclass: metadata-revs show repo parent
057913b metadata-revs: provide more information
d7d7b04 report-error: Allow to upload reports automatically
7863ebe report-error.bbclass: use urllib2 instead of httplib, urllib
5fb1b8b icecc.bbclass: replace os.popen with subprocess.check_output

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
548effe ruby.bbclass: Fix usage with python3
not included in master yet:=20
bb885af openconnect: add dependency to fix Makefile.am
11bb223 openconnect: fix do_compile failure
f9ad605 crda, lftp, curlpp: blacklist, fails to build with gcc-6
b848af1 ntp: Security fixes via Upgrade to 4.2.8p8
b4963c9 wireshark: update to 2.0.4
6f79144 curlpp: fix build with gcc-6 and remove blacklist
8e881e9 chrony: Versatile implementation of NTP
e1074e9 gtk-engines: Move from oe-core
c569f05 redis: fix hiredis build so it's less failure-prone and links prope=
rly
a2b9db1 krb5: add systemd support
4700d54 libcgi-perl: add version 4.28 to provide perl-module-cgi
a543693 mpv: add DESCRIPTION
e361aea mpv: use waf.bbclass
2aa9141 libeigen: update to 3.2.8
8e81401 geos: use std::isnan to support gcc6
2128fcb tcsh: fix the wait definition to support gcc6
5ffbb77 fbreader: fix return code issue on gcc6
cbbbce0 tvheadend: add CFLAG to ignore misleading indentations
e177432 geis: add CFLAG to ignore misleading indentations
d293313 fwts: add CFLAG to ignore misleading indentations
5b1cdd1 grail: update to version 3.1.1

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
15a4f86 qtwayland: add dependency on libxcomposite
not included in master yet:=20
9b98004 qtbase: add PACKAGECONFIG for journald logging

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
825ea93 chromium: Add workarounds for compiler errors
not included in master yet:=20
93fb0a3 firefox, cef3, chromium: blacklist, fails to build with gcc-6

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
dc07b66 mmsd, packagegroup-webos-test: drop python-pygobject
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
d6d9f42 tenderloin-bluetooth-utilities: Bump SRCREV
not included in master yet:=20
9f56d52 u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
75e4fc6 linux-gta04: bump SRCREV to get fixes for build with gcc-5
fe7248c linux-gta04: enable SGX530
01541a8 defaulttunes.inc: switch to hf, because SGX SDK for SGX530 is avail=
able only for hf
3d77c6f om-gta04: drop u-boot from EXTRA_IMAGEDEPENDS
3350c38 linux-gta04: upgrade to 4.4
09be14f shr: add wayland to DISTRO_FEATURES
dffb11c linux-gta04: include linux-dtb
7abe635 zhone: blacklist because of python-pycairo runtime dependency
26e6ab1 libframeworkd-glib: blacklist, fails with gcc-6
203e8e2 packagegroup-shr-feed: Remove firefox and fbreader
1c12105 frameworkd, mdbus, gta04-gps-handler, pisi: Remove runtime dependen=
cy on broken python-pygobject


--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldhMb0ACgkQN1Ujt2V2gBxRpACgl5V0lcub/dZNX9qjFvUFG3Jy
bOEAoLXsxKKhC7yqgxybTO4lXDQe//Mr
=VeUE
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
