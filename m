Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AA8E2731D3;
	Mon, 12 Sep 2016 20:30:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id z194so2947188wmd.3;
	Mon, 12 Sep 2016 13:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=hzP48GIdy7iK+wFaQd+uyTHDF2Hp0MLDsNKRPWE9Exo=;
	b=t7TBLph5uLzg+8LsgqDTDeNKpW60Qhob8W89t4ym/RdVUt9mN+phcX832t35DpfRJJ
	cHUz1JCbgY076/P0CeD399FpePBlrxRXwrSjh9mammDEa1p0Dm5EjwBPacKVR+m1nqVl
	pM6DKqQgRzVaXCjThNFUX103C2j1FQz3hVrGN6IALUHTT5kin6zbqW9TvigGJ1eM3S6D
	pyAbWl7BQkyAvQ+UXwU/iXD1qlsSMiY34Zitp3tKZcueVMvUlIXEzyuqUd09NJic9OWJ
	bNH+kho5Hs9xsxURFVlVSbgTg+x8iJlYQgZ7Mgmvl3Y5FUKnKj5H+sO8dO//vZkS5bn0
	HiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=hzP48GIdy7iK+wFaQd+uyTHDF2Hp0MLDsNKRPWE9Exo=;
	b=FXDZFsvpHonF5LwXx+Mj6hG+wvqcEPbkuqudhdVFtviKLCbELrwb6sn40kYWABtXVl
	U4cJeIl+Qua2qB1in/h//lZMYK8RPQyHprg/HUi0lPwJbc5/qnW/EJkWerfZVNZ3vDP6
	HnJgpgo0GvPil3dzEniaTktjO24kRSex0k+2bNtkInumG3ZG2+kNMmQpxejcOuXbRVUu
	n3N7MG4zcad2QGahSj42No0XWxZ8G5ImzZ+pPSh4yyOEuR20cuoCtCAsLugZOVtnUXSm
	7qvq9SemVniMTJLiEIyybX4aAZ9gQbJzv1seDiZUF9UFIKu4vic7gUFrSF7bA/ohqXRR
	7YTg==
X-Gm-Message-State: AE9vXwM7O6bzzSWkX/ezzK9E5Gaol4mAlJOc7LM4JiFWAu/BuGq5ov4YjZb8esfGjp7WzA==
X-Received: by 10.194.20.65 with SMTP id l1mr19621148wje.71.1473712229281;
	Mon, 12 Sep 2016 13:30:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	w71sm19400526wmw.17.2016.09.12.13.30.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Sep 2016 13:30:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 12 Sep 2016 22:30:31 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160912203031.GD2653@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: State of bitbake world 2016-09-11
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
X-List-Received-Date: Mon, 12 Sep 2016 20:30:30 -0000
X-Groupsio-MsgNum: 87041
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Content-Disposition: inline

--cHMo6Wbp1wrKhbfi
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
||2016-09-11	||6	||8	||7	||19	||6	||4	||22	||8	||6	||0	||0		||0		||1		||8		=
||3		||12		||0		||1		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-09-11 =3D=3D

INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20160912_102042.log

=3D=3D=3D common (5) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsit=
arget_1.4.20.3+svn502.bb:do_compile
    * meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-module=
s_git.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-unidiff_=
0.5.2.bb:do_populate_sysroot
    * meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile
    * openembedded-core/meta/recipes-support/libunwind/libunwind_git.bb:do_=
compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb=
:do_patch
    * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestd=
rivers_5.1.4.bb:do_install

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_=
6.11.3.bb:do_fetch

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (21) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemuarm.20160910_213946.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/21399/
|-
|| qemux86 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemux86.20160910_213952.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/21400/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
world.qemux86-64.20160911_094330.log/ || http://errors.yoctoproject.org/Err=
ors/Build/21410/
|}

=3D=3D=3D PNBLACKLISTs (118) =3D=3D=3D

=3D=3D=3D QA issues (25) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
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
||0	||unknown-configure-option
|-
||12	||version-going-backwards
|-
||1	||installed-vs-shipped
|-
||1	||textrel
|-
||3	||file-rdeps
|-
||8	||build-deps
|}



=3D=3D=3D Failed dependencies for qemuarm (19) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160911_090900.log/
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
    * ERROR: 19 issues were found in these recipes: enchant iscsitarget jas=
per libdrm libunwind netmap-modules python-unidiff qtwebkit samba

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (6) =3D=3D=
=3D
    * iscsitarget -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160911_090900.log//2_max/failed/iscsitarget.log
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160911_090900.log//2_max/failed/libunwind.log
    * netmap-modules -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemuarm.20160911_090900.log//2_max/failed/netmap-modules.log
    * python-unidiff -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemuarm.20160911_090900.log//2_max/failed/python-unidiff.log
    * qtwebkit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemuarm.20160911_090900.log//2_max/failed/qtwebkit.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160911_090900.log//2_max/failed/samba.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (4) =3D=3D=
=3D
    * iscsitarget -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemuarm.20160911_090900.log//3_min/failed/iscsitarget.log
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20160911_090900.log//3_min/failed/libunwind.log
    * netmap-modules -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemuarm.20160911_090900.log//3_min/failed/netmap-modules.log
    * samba -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenc=
ies.qemuarm.20160911_090900.log//3_min/failed/samba.log

=3D=3D=3D Failed dependencies for qemux86 (22) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160911_215837.log/
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
    * ERROR: 22 issues were found in these recipes: chromium chromium-wayla=
nd enchant iscsitarget jasper libdrm libunwind netmap-modules python-unidif=
f qtwebkit samba vboxguestdrivers

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (8) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160911_215837.log//2_max/failed/chromium.log
    * chromium-wayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/lo=
g.dependencies.qemux86.20160911_215837.log//2_max/failed/chromium-wayland.l=
og
    * iscsitarget -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160911_215837.log//2_max/failed/iscsitarget.log
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160911_215837.log//2_max/failed/libunwind.log
    * netmap-modules -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemux86.20160911_215837.log//2_max/failed/netmap-modules.log
    * python-unidiff -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemux86.20160911_215837.log//2_max/failed/python-unidiff.log
    * qtwebkit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160911_215837.log//2_max/failed/qtwebkit.log
    * vboxguestdrivers -- http://logs.nslu2-linux.org/buildlogs/oe/world/lo=
g.dependencies.qemux86.20160911_215837.log//2_max/failed/vboxguestdrivers.l=
og

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (6) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20160911_215837.log//3_min/failed/chromium.log
    * chromium-wayland -- http://logs.nslu2-linux.org/buildlogs/oe/world/lo=
g.dependencies.qemux86.20160911_215837.log//3_min/failed/chromium-wayland.l=
og
    * iscsitarget -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dep=
endencies.qemux86.20160911_215837.log//3_min/failed/iscsitarget.log
    * libunwind -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemux86.20160911_215837.log//3_min/failed/libunwind.log
    * netmap-modules -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
dependencies.qemux86.20160911_215837.log//3_min/failed/netmap-modules.log
    * vboxguestdrivers -- http://logs.nslu2-linux.org/buildlogs/oe/world/lo=
g.dependencies.qemux86.20160911_215837.log//3_min/failed/vboxguestdrivers.l=
og

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160911_145601.log/


    * ERROR: Nothing PROVIDES 'xfsprogs' (but /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.b=
b, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-filesystems/recip=
es-utils/dmapi/dmapi_2.2.12.bb DEPENDS on or otherwise requires it)
    * ERROR: xfsprogs was skipped: Recipe is blacklisted: BROKEN: Needs upg=
rade to 4.5.0 version to be compatible with Kernel uapi changes from 4.5
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /ho=
me/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing PROVIDES 'xfsprogs' (but /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb, =
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-filesystems/recipes-=
utils/xfsdump/xfsdump_3.1.4.bb DEPENDS on or otherwise requires it)
    * ERROR: xfsprogs was skipped: Recipe is blacklisted: BROKEN: Needs upg=
rade to 4.5.0 version to be compatible with Kernel uapi changes from 4.5
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing PROVIDES 'xfsprogs' (but /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb, =
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-filesystems/recipes-=
utils/xfsdump/xfsdump_3.1.4.bb DEPENDS on or otherwise requires it)
    * ERROR: xfsprogs was skipped: Recipe is blacklisted: BROKEN: Needs upg=
rade to 4.5.0 version to be compatible with Kernel uapi changes from 4.5
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
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[s=
mbnetfs] ?=3D "Depends on broken samba"
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
meta-networking/recipes-connectivity/samba/samba_4.4.5.bb:PNBLACKLIST[samba=
] ?=3D "${BLACKLIST_REASON}"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap] ?=
=3D "BROKEN: Tries to build kernel module and fails, either it should be di=
sabled or there should be dependency on kernel like in netmap-modules"
meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[ac=
cel-ppp] ?=3D "BROKEN: fails to build with new binutils-2.27"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
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
{@bb.utils.contains('DISTRO_FEATUREy/jefliks_git.bb:PNBLACKLIST[jefliks] ?=
=3D "depends on blacklisted iksemel"
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


count: 1	issue: textrel
gnutls-3.5.3: ELF binary '/tmp/work/i586-oe-linux/gnutls/3.5.3-r0/packages-=
split/gnutls/usr/lib/libgnutls.so.30.9.0' has relocations in .text [textrel]


count: 8	issue: build-deps
enchant-1.6.0: enchant rdepends on hunspell, but it isn't a build dependenc=
y, missing hunspell in DEPENDS or PACKAGECONFIG? [build-deps]
gammu-1.32.0: libgsmsd rdepends on unixodbc, but it isn't a build dependenc=
y, missing unixodbc in DEPENDS or PACKAGECONFIG? [build-deps]
libdrm-2.4.70: libdrm-tests rdepends on cunit, but it isn't a build depende=
ncy, missing cunit in DEPENDS or PACKAGECONFIG? [build-deps]
libgit2-0.24.1: libgit2 rdepends on libssh2, but it isn't a build dependenc=
y, missing libssh2 in DEPENDS or PACKAGECONFIG? [build-deps]
mpv-0.15.0: mpv rdepends on libjack, but it isn't a build dependency, missi=
ng jack in DEPENDS or PACKAGECONFIG? [build-deps]
qt3d-5.7.0+gitAUTOINC+c3fdb888fb: qt3d-plugins rdepends on assimp, but it i=
sn't a build dependency, missing assimp in DEPENDS or PACKAGECONFIG? [build=
-deps]
samba-4.4.5: samba rdepends on libpam, but it isn't a build dependency, mis=
sing libpam in DEPENDS or PACKAGECONFIG? [build-deps]
wireshark-2.2.0: wireshark rdepends on libssh, but it isn't a build depende=
ncy, missing libssh in DEPENDS or PACKAGECONFIG? [build-deps]


count: 3	issue: filckage wireshark-dbg went backwards which would break pac=
kage feeds from (1:2.0.5-r0.5 to 0:2.2.0-r0.0) [version-going-backwards]
wireshark-2.2.0: Package version for package wireshark-dev went backwards w=
hich would break package feeds from (1:2.0.5-r0.4 to 0:2.2.0-r0.0) [version=
-going-backwards]
wireshark-2.2.0: Package version for package wireshark-dev went backwards w=
hich would break package feeds from (1:2.0.5-r0.5 to 0:2.2.0-r0.0) [version=
-going-backwards]
wireshark-2.2.0: Package version for package wireshark-doc went backwards w=
hich would break package feeds from (1:2.0.5-r0.4 to 0:2.2.0-r0.0) [version=
-going-backwards]
wireshark-2.2.0: Package version for package wireshark-doc went backwards w=
hich would break package feeds from (1:2.0.5-r0.5 to 0:2.2.0-r0.0) [version=
-going-backwards]
wireshark-2.2.0: Package version for package wireshark-locale went backward=
s which would break package feeds from (1:2.0.5-r0.4 to 0:2.2.0-r0.0) [vers=
ion-going-backwards]
wireshark-2.2.0: Package version for package wireshark-locale went backward=
s which would break package feeds from (1:2.0.5-r0.5 to 0:2.2.0-r0.0) [vers=
ion-going-backwards]
wireshark-2.2.0: Package version for package wireshark-staticdev went backw=
ards which would break package feeds from (1:2.0.5-r0.4 to 0:2.2.0-r0.0) [v=
ersion-going-backwards]
wireshark-2.2.0: Package version for package wireshark-staticdev went backw=
ards which would break package feeds from (1:2.0.5-r0.5 to 0:2.2.0-r0.0) [v=
ersion-going-backwards]
wireshark-2.2.0: Package version for package wireshark went backwards which=
 would break package feeds from (1:2.0.5-r0.4 to 0:2.2.0-r0.0) [version-goi=
ng-backwards]
wireshark-2.2.0: Package version for package wireshark went backwards which=
 would break package feeds from (1:2.0.5-r0.5 to 0:2.2.0-r0.0) [version-goi=
ng-backwards]


count: 0	issue: host-user-contaminated


count: 1	issue: installed-vs-shipped
geoclue: 12 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
57912de cooker: record events on cooker exit
not included in master yet:=20
56a0fe1 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
4d268ab oeqa.runtime.smart: work around smart race issues
not included in master yet:=20
396e3a4 qemux86: Add identical qemux86copy variant for tests
f590d92 sstate-sysroot-cruft.sh: Extend the whitelist
d3b9bd6 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
7caae42 buildhistory.bbclass: metadata-revs show repo parent
08982d6 metadata-revs: provide more information
ffb5966 report-error: Allow to upload reports automatically
21ff92f icecc.bbclass: replace os.popen with subprocess.check_output
99d1490 test-dependencies.sh: Strip also '\.bb: .*' before adding failed re=
cipe to list of failed

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
dd1ddae lvm2: add PACKAGECONFIG for lvm thin provisioning
not included in master yet:=20
d41397d openconnect: fix do_compile failure
1394a22 libtevent: Add back the dependency on libcap
1ec0d58 snort: Add lzma to PACKAGECONFIG
c81654f samba: fix to package pidl in samba-pidl
0f45300 strongswan: 5.3.2 -> 5.5.0
91bead9 samba: fix build by linking with bfd instead of gold
1db16cd stunnel: 5.28 -> 5.35
4b830ae smbnetfs: blacklist, depends on broken samba
45db382tgps: blacklist, fails to build with new binutils-2.27"
8050b97 python-unidiff: python module for parsing diff data
3865b0f python-pylint: python source code analyzer
bc879ea zile: uprev from 2.4.9 to 2.4.11 and add acl support
3846d04 proftpd: remove the script ftpmail
8b91117 vsftpd: allow sysinfo() in the seccomp sandbox
3c1b38f geany: update to 1.28
84be4e5 geany-plugins: unblacklist / fix known bugs / update to 1.28
5029e9a abiword: unblacklist and fix
5a87ee7 dhcpcd: update to 6.11.3
34e1995 traceroute: update to 2.1.0
518da90 wireshark: update to 2.2
5b1501d waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS
968a5f5 samba: restrict the blacklist to ARM only
477bd75 tcpreplay: upgrade to 4.1.1
7ca48d6 thrift: fix build on gcc-6
112fb62 xf86-input-tslib: remove
8e1ec2d efl: remove dependency on tslib
eb181e1 pidgin-sipe purple-skypeweb whatsapp-purple freeimage: add more pid=
gin plugins
d2453b8 Revert "pidgin-sipe purple-skypeweb whatsapp-purple freeimage: add =
more pidgin plugins"
61d5082 xfsprogs: blacklist, needs upgrade to stay compatible with default =
kernel

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
4656ab3 qt5-opengles2-test: Add recipe
not included in master yet:=20
9aa870e qtbase: avoid qmake errors due to missing oe-device-extra.pri

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
ec4459a Merge pull request #14 from raymanfx/master
not included in master yet:=20
ad9b1ce firefox: Fix build using gcc 6
338b100 chromium: install all pak files plus resources and blob.bin files.

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
b0ca23f freeimage: bump SRCREV to fix build with gcc6
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
de70026 packagegroup-shr-feed: remove dependency on samba
not included in master yet:=20
2c3b372 linux-hp-tenderloin: Update kernel

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfXEGcACgkQN1Ujt2V2gBy2xgCdH546H5gRC7ISK9a8UJw6Gftv
Ce4AnRt6zDDa/cz62rmqjKVzKhOFb/RF
=YwzG
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
