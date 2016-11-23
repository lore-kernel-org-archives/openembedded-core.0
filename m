Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CA96871A6E;
	Wed, 23 Nov 2016 15:12:34 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so2281976wmu.0;
	Wed, 23 Nov 2016 07:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=ivSSovXAATxy6qupKhN0KjBDSQeALsVbbcgP+hf5nC0=;
	b=cDLkDVXEv8JHhNYJzkv+WN24PS627BKkSR9fKRRZDEgbWIRHAG8kd0wDaNH+XH51UR
	/736DoqjGPcL/zYYDKeBrGQO/1DvSD6yqfJG6M2GPg90FLuAWOa73q0biu1dL/rwO9iS
	KfXjWNU+8cruyyUjJc1V+wQdbU9/j+OS+t1tPMMTX/uqje3hvG/886jUl1tWByYw/7hT
	hGd4ZCKACFjhoRQFpswnViGqTEAPzFeMGxWH8TslEIAky4gwzeu99IaxQN+YsE9AYFLR
	btETDKK9RpUguLpOcrv5OQgrmwA1YZbZum19YF2ggr5TBP+0J5CK6q13UYvcjmC+s1Tx
	c1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ivSSovXAATxy6qupKhN0KjBDSQeALsVbbcgP+hf5nC0=;
	b=fe/PF3Sj+dXpOVNyLOZyOE7Hg9nNSo1lFF8jxPiiJyfKlAvwqxrq8hHyDaUdutQT3T
	/xa1vvj+mi9T0ImuPgZCZHXcnCGFPAiaHIgwn3dOSqUTYXXQcUX5AAOngjxC30qNYurS
	Ite0XmYauVdR1luAXrT+i/U+zrmxVVarS23glXajcC810Kdj663R3yBG/6hXdzVo7eBc
	HpkJeA3i7psUJmHb0P0OwOfj5viI/DgLrXBgljy82inXCxainDxrZ2bq4w8itfbnXttj
	Z/xiYyE/o2umd1fZJvCXvWzcEJ2bIqzgXvwYXmvFltvJeLQwUneFc1Nh4m89zJgJeOnt
	0FYQ==
X-Gm-Message-State: AKaTC03pPQ3vSKMqcAampAbS8B2gk8y7r8CODlrENLgQX+uNEA/rQ82DcNpDBms9oKxO7g==
X-Received: by 10.28.62.77 with SMTP id l74mr7544672wma.37.1479913954938;
	Wed, 23 Nov 2016 07:12:34 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	kq7sm36789267wjb.30.2016.11.23.07.12.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Nov 2016 07:12:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Nov 2016 16:12:35 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20161123151235.GB3265@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: State of bitbake world 2016-11-22
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
X-List-Received-Date: Wed, 23 Nov 2016 15:12:35 -0000
X-Groupsio-MsgNum: 89762
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline

--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D Number of issues - stats =3D=3D
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
||2016-11-22	||7	||8	||7	||15	||7	||7	||17	||8	||8	||0	||0		||0		||0		||0		=
||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-11-22 =3D=3D

INFO: jenkins-job.sh-1.8.12 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20161123_045755.log

=3D=3D=3D common (6) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/wireshark/wireshark=
_2.2.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/obex/obex-data-server_=
0.4.6.bb:do_compile
    * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.b=
b:do_configure
    * meta-qt5/recipes-qt/qt5/qtenginio_git.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb:do_com=
pile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb:do_c=
ompile

=3D=3D=3D Number of failed tasks (22) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20161122_192238.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/24774/
|-
|| qemux86 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20161122_210950.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/24775/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20161122_225152.log/ || http://errors.yoctoproject.or=
g/Errors/Build/24781/
|}

=3D=3D=3D PNBLACKLISTs (117) =3D=3D=3D

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



=3D=3D=3D Failed dependencies for qemuarm (15) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemuarm.20161122_214852.log/
Found differences:=20
Found errors:=20
    * ERROR: 15 issues were found in these recipes: obex-data-server obexft=
p qtenginio qtwayland webkitgtk wireshark xfce4-vala

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (7) =3D=3D=
=3D
    * obex-data-server -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20161122_214852.log//2_max/failed/obex-data-ser=
ver.log
    * obexftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161122_214852.log//2_max/failed/obexftp.log
    * qtenginio -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161122_214852.log//2_max/failed/qtenginio.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161122_214852.log//2_max/failed/qtwayland.log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161122_214852.log//2_max/failed/webkitgtk.log
    * wireshark -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161122_214852.log//2_max/failed/wireshark.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20161122_214852.log//2_max/failed/xfce4-vala.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (7) =3D=3D=
=3D
    * obex-data-server -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemuarm.20161122_214852.log//3_min/failed/obex-data-ser=
ver.log
    * obexftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemuarm.20161122_214852.log//3_min/failed/obexftp.log
    * qtenginio -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161122_214852.log//3_min/failed/qtenginio.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161122_214852.log//3_min/failed/qtwayland.log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161122_214852.log//3_min/failed/webkitgtk.log
    * wireshark -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemuarm.20161122_214852.log//3_min/failed/wireshark.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemuarm.20161122_214852.log//3_min/failed/xfce4-vala.log

=3D=3D=3D Failed dependencies for qemux86 (17) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.depen=
dencies.qemux86.20161123_003406.log/
Found differences:=20
Found errors:=20
    * ERROR: 17 issues were found in these recipes: chromium obex-data-serv=
er obexftp qtenginio qtwayland qtwebengine wireshark xfce4-vala

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (8) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161123_003406.log//2_max/failed/chromium.log
    * obex-data-server -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20161123_003406.log//2_max/failed/obex-data-ser=
ver.log
    * obexftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161123_003406.log//2_max/failed/obexftp.log
    * qtenginio -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161123_003406.log//2_max/failed/qtenginio.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161123_003406.log//2_max/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20161123_003406.log//2_max/failed/qtwebengine.log
    * wireshark -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161123_003406.log//2_max/failed/wireshark.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemux86.20161123_003406.log//2_max/failed/xfce4-vala.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (8) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.d=
ependencies.qemux86.20161123_003406.log//3_min/failed/chromium.log
    * obex-data-server -- http://logs.nslu2-linux.org/buildlogs/oe/world/py=
ro/log.dependencies.qemux86.20161123_003406.log//3_min/failed/obex-data-ser=
ver.log
    * obexftp -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.de=
pendencies.qemux86.20161123_003406.log//3_min/failed/obexftp.log
    * qtenginio -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161123_003406.log//3_min/failed/qtenginio.log
    * qtwayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161123_003406.log//3_min/failed/qtwayland.log
    * qtwebengine -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.dependencies.qemux86.20161123_003406.log//3_min/failed/qtwebengine.log
    * wireshark -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.=
dependencies.qemux86.20161123_003406.log//3_min/failed/wireshark.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log=
=2Edependencies.qemux86.20161123_003406.log//3_min/failed/xfce4-vala.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20161123_035024.log/


    * ERROR: Nothing RPROVIDES 'python-subprocess-native' (but virtual:nati=
ve:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-de=
vtools/python/python-pycparser_2.17.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /ho=
me/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'python-subprocess-native' (but virtual:nati=
ve:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-de=
vtools/python/python-pycparser_2.17.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'python-subprocess-native' (but virtual:nati=
ve:/home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-de=
vtools/python/python-pycparser_2.17.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps


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
mns('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 i=
s selected in DISTRO_FEATURES', '', d)}"
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
91c3b34 lib/bb/cooker.py: fix for BBFILE_PATTERN =3D ""
not included in master yet:=20
4f95c8d world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
a675b2c sanity.bbclass: fix logging of an error
not included in ma download URL
84100ea edac-utils: fix systemd service
f9ddaa5 python-cassandra-driver: add recipe for version 3.7.1
1ffc684 python-spidev: add recipe for version 3.2
66776d5 augeas: fix QA warning
edcd9f8 fwknop: Initial add 2.6.9
155cf80 libplist: Remove rpaths surgically
27eb69c python-pyserial: remove serialjava.py
001be5f samba: Fix build with musl
e1b0fc1 lockdev: Pretend GNU libc on musl
7ebe5a9 gnuplot: upgrade to 5.0.5
67fc350 pyyaml: Enable nativesdk bake
7c949f8 iozone3: 434 -> 465
ff31cba libhugetlbfs: 1.19 -> 1.20
77e3b4a phoronix-test-suite: 6.0.1 -> 6.6.1
a0153d7 asio: DEPENDS on openssl
970460a asio: fix a musl compilation warning
600acf9 apache2: include .load files in modules.d
92d1d26 openjpeg: rename the download file
38da3c9 python-humanize, python3-humanize: Add recipe for version 0.5.1
a380b48 ifenslave: make option '-h' work
f2c73eb opencv: fix QA issue
1961f08 libeigen: set tarball name as ${BP}.tar.bz2
2761ac3 libowfat: add v0.31
cf6410b lvm2: 2.02.138 -> 2.02.166
dbaad94 opencv: checking existence of /usr/lib
7a943a5 gtkmm: add x11 to REQUIRED_DISTRO_FEATURES
b3c6c11 pavucontrol: add x11 to REQUIRED_DISTRO_FEATURES
b6df437 libunique: add x11 to REQUIRED_DISTRO_FEATURES
52f9235 dconf: add x11 to REQUIRED_DISTRO_FEATURES
5ea4fd3 evince: add x11 to REQUIRED_DISTRO_FEATURES
0fa89b7 gnome-disk-utility: add x11 to REQUIRED_DISTRO_FEATURES
9d80fa7 gtksourceview2: add x11 to REQUIRED_DISTRO_FEATURES
f933e39 libwnck: add x11 to REQUIRED_DISTRO_FEATURES
6f993b4 libxklavier: add x11 to REQUIRED_DISTRO_FEATURES
3536cbd packagegroup-xfce-base: add x11 to REQUIRED_DISTRO_FEATURES
62c5a23 xfce4-pulseaudio-plugin: add x11 to REQUIRED_DISTRO_FEATURES
3a62dbf thunar-plugin.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
bad19d5 xfce-panel-plugin.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
c896a90 xfce-app.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
592d0ea exo: add x11 to REQUIRED_DISTRO_FEATURES
ad99e50 garcon: add x11 to REQUIRED_DISTRO_FEATURES
030de03 gtk-xfce-engine: add x11 to REQUIRED_DISTRO_FEATURES
778b2b0 libxfce4ui: add x11 to REQUIRED_DISTRO_FEATURES
2e315c6 thunar: add x11 to REQUIRED_DISTRO_FEATURES
41bc8ec thunar-volman: add x11 to REQUIRED_DISTRO_FEATURES
a0e3239 xfce4-appfinder: add x11 to REQUIRED_DISTRO_FEATURES
ba002fe xfce4-panel: add x11 to REQUIRED_DISTRO_FEATURES
30ee7f4 xfce4-power-manager: add x11 to REQUIRED_DISTRO_FEATURES
9005050 xfce4-session: add x11 to REQUIRED_DISTRO_FEATURES
12b302d xfce4-settings: add x11 to REQUIRED_DISTRO_FEATURES
e9c2a99 xfdesktop: add x11 to REQUIRED_DISTRO_FEATURES
f36e38d xfwm4: add x11 to REQUIRED_DISTRO_FEATURES
72270ae python-zopeinterface: update to version 4.3.2
5f0d3e7 python-yappi: update to version 0.98
86dd8a9 openobex: upgrade to 1.7.2
6a1383f rsnapshot: fix host path in rsnapshot.conf.default
3d4c986 python-vobject: update to version 0.9.3
8d3db26 python-urllib3: update to version 1.19
ee7e27f python-setuptools-scm: update to version 1.15.0
f2abbd0 opencv: remove DEFAULT_PREFERENCE =3D "-1" for 3.1
e881354 python-requests: update to version 2.12.0
bd49cd8 samba: Fix qa issue and update ctdb-tests
371f412 samba: correct sub-package name for multilib
1aaab25 curlpp: fix qa issue of do_configure
74e5171 mcelog: Add Kabylake client support
a7282c8 python-pyserial: update to version 3.2.1
e27050e python-pycparser: update to version 2.17
3991dff python-pytz: update to version 2016.7
7ecdb9c ncp: add v1.2.4
006b197 android-tools: fix do_install
09931a3 libdbus-c++: added recipe for it
4523b4 syslog-ng: don't use update-alternatives to manage init script
2cb2dec rsyslog: don't use update-alternatives to manage init script
80179c1 dnsmasq: read the conf files found in dnsmasq.d
d31796d dnsmasq: allow for dnsmasq instances to reuse default dnsmasq.conf

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
81fb771 Update Qt5's git repositories to match new locations
not included in master yet:=20
14d55dc Upgrade to Qt 5.8

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
1edcce7 chromium-wayland: skip when CHROMIUM_ENABLE_WAYLAND isn't enabled
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
6d82a3f libqofono: use the recipe from meta-qt5
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
176f337  linux-hp-tenderloin: Update kernel
not included in master yet:=20

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDWx4wAKCRA3VSO3ZXaA
HCDYAJ9DZenXAJMjbJLfIQFgHqxQHv4zcwCgjJsIQPRvna+RpnCm2r0PjBHpXuM=
=lzw+
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
