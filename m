Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E21A56FEE0;
	Tue,  8 Nov 2016 12:24:08 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p190so22288134wmp.1;
	Tue, 08 Nov 2016 04:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=ePWheJjDiFbu9rmIfv6Sn4JMOSA6TvDFZZLu6RWmQB0=;
	b=hR+6fvcGcMtZ/UL6X59QEM608BJ4f1v+Tk1wUcDniEU151n3165QP/5yLOZpv+PNU+
	El5NxzOkZ5/uDoqPouGrcl/KU5qxcEsKPqlStqA4WnFQw6j3EfWp6rqyFNQbIMZ2W4DM
	O49hxF+vUBHfmdBQnc7Sn+lJW7d3P+kupcLEasMWpfigWMrKyuMHigF07w32z2W9hEhs
	7jNKUqvjEg+qe00aXHaK0rpBbEF1ViLBImimKpHNnV8lSV+M04UXAmDbpMZmE9Gp8WR6
	imCa4FMCNeqVC5IupFZcNUJ7Q/ACJyqws+eS//I98oXVCVGhRSb2pIiutBFM6TX0RSf4
	FjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ePWheJjDiFbu9rmIfv6Sn4JMOSA6TvDFZZLu6RWmQB0=;
	b=UlrX4FB8htBoEHecrBTwYBYCPDrZP5h6ivJcUv9RSOy9UXrUwkVmMPWYICwYN51uuB
	ez2Zw0B4AfLfDe9kehG/ohhPq644vJpLlSALPpohhKa5r29qFtYHvtT7HNy15nZ132lw
	+C96OGlTozOuGx3BFDxtjx1JtIppxL93c4edTNWSLeYA544V0ONOJbuMp0/XPVzpNZ6+
	DOMMvmRvRNDm28uHgk7ekAphVcukrlWvtjX+FBxfmKAW7m3yfbNmurYV0BO0Ocj+1mrv
	OpoNrDt4MX60hf+ioOtdxO7Vp9gPTyefXsJhKHwUeASEi0NEX06ld0EIALuTcLG8TZqd
	tzwQ==
X-Gm-Message-State: ABUngvff9ZoN+Fdj21GVbFhWprdfenGawoCZVctpKLdJpnww6lm6KgbVf9ztiQFhYnVeQw==
X-Received: by 10.28.167.77 with SMTP id q74mr12031963wme.21.1478607848143;
	Tue, 08 Nov 2016 04:24:08 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k74sm19341605wmd.18.2016.11.08.04.24.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 Nov 2016 04:24:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Nov 2016 13:24:06 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20161108122406.GA2916@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: State of bitbake world 2016-11-03
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
X-List-Received-Date: Tue, 08 Nov 2016 12:24:09 -0000
X-Groupsio-MsgNum: 89125
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please note that the logs aren't available online, because the server with =
logs
was moved to other HW and the files weren't rsynced (yet - at least not to =
correct
location visible as http://logs.nslu2-linux.org/buildlogs/oe).

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
||2016-11-03	||3	||3	||2	||6	||3	||2	||6	||3	||2	||0	||0		||0		||1		||1		||=
4		||226		||1		||1		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-11-03 =3D=3D

INFO: jenkins-job.sh-1.8.11 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20161108_021000.log

=3D=3D=3D common (2) =3D=3D=3D
    * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.b=
b:do_configure
    * openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb:do_c=
ompile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb:do_com=
pile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile
=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (8) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemuarm.20161102_062737.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/23897/
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemux86.20161102_062742.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/23898/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
world.qemux86-64.20161103_051017.log/ || http://errors.yoctoproject.org/Err=
ors/Build/23972/
|}

=3D=3D=3D PNBLACKLISTs (116) =3D=3D=3D

=3D=3D=3D QA issues (234) =3D=3D=3D
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
||1	||build-deps
|-
||1	||host-user-contaminated
|-
||1	||installed-vs-shipped
|-
||1	||textrel
|-
||226	||version-going-backwards
|-
||4	||file-rdeps
|}


=3D=3D=3D Failed dependencies for qemuarm (6) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20161103_033500.log/
Found differences:=20
Found errors:=20
    * ERROR: 6 issues were found in these recipes: libsdl2 webkitgtk xfce4-=
vala

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (3) =3D=3D=
=3D
    * libsdl2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemuarm.20161103_033500.log//2_max/failed/libsdl2.log
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20161103_033500.log//2_max/failed/webkitgtk.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20161103_033500.log//2_max/failed/xfce4-vala.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (2) =3D=3D=
=3D
    * webkitgtk -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depen=
dencies.qemuarm.20161103_033500.log//3_min/failed/webkitgtk.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemuarm.20161103_033500.log//3_min/failed/xfce4-vala.log

=3D=3D=3D Failed dependencies for qemux86 (6) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20161104_030721.log/
Found differences:=20
Found errors:=20
    * ERROR: 6 issues were found in these recipes: chromium libsdl2 xfce4-v=
ala

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (3) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20161104_030721.log//2_max/failed/chromium.log
    * libsdl2 -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depende=
ncies.qemux86.20161104_030721.log//2_max/failed/libsdl2.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20161104_030721.log//2_max/failed/xfce4-vala.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (2) =3D=3D=
=3D
    * chromium -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depend=
encies.qemux86.20161104_030721.log//3_min/failed/chromium.log
    * xfce4-vala -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.depe=
ndencies.qemux86.20161104_030721.log//3_min/failed/xfce4-vala.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20161103_084806.log/


    * ERROR: Nothing PROVIDES 'netmap-modules' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-networking/recipes-kernel/netmap/netmap_git=
=2Ebb DEPENDS on or otherwise requires it)
    * ERROR: netmap-modules was skipped: Recipe is blacklisted: BROKEN: not=
 compatible with default kernel version 4.8
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /ho=
me/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing PROVIDES 'netmap-modules' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-networking/recipes-kernel/netmap/netmap_git=
=2Ebb DEPENDS on or otherwise requires it)
    * ERROR: netmap-modules was skipped: Recipe is blacklisted: BROKEN: not=
 compatible with default kernel version 4.8
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing PROVIDES 'netmap-modules' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-networking/recipes-kernel/netmap/netmap_git=
=2Ebb DEPENDS on or otherwise requires it)
    * ERROR: netmap-modules was skipped: Recipe is blacklisted: BROKEN: not=
 compatible with default kernel version 4.8
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
corosync-2.4.0: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.0-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 1	issue: build-deps
wireshark-2.2.1: wireshark rdepends on sbc, but it isn't a build dependency=
, missing sbc in DEPENDS or PACKAGECONFIG? [build-deps]


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


count: 226	issue: version-going-backwards
gnome-menus3-3.10.1: Package version for package gnome-menus3-dbg went back=
wards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.1-r0.0=
) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-dbg went back=
wards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.1-r0.0=
) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-dev went back=
wards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.1-r0.0=
) [version-going-backwards]
gich would break package feeds from (0:3.10.1-r0.18 to 0:3.10.1-r0.0) [vers=
ion-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-af wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-af wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-an wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-an wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ar wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ar wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ast we=
nt backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ast we=
nt backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-as wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-as wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-be+lat=
in went backwards which would break package feeds from (0:3.10.1-r0.14 to 0=
:3.10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-be+lat=
in went backwards which would break package feeds from (0:3.10.1-r0.18 to 0=
:3.10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-be wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-be wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-bg wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-bg wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-bn-in =
went backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-bn-in =
went backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-bn wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) feeds from (0:3.10.1-r0.18 to 0:3.10.1-r0.0) [version-going-backwar=
ds]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ca+val=
encia went backwards which would break package feeds from (0:3.10.1-r0.14 t=
o 0:3.10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ca+val=
encia went backwards which would break package feeds from (0:3.10.1-r0.18 t=
o 0:3.10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ca wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ca wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-crh we=
nt backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-crh we=
nt backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-csb we=
nt backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-csb we=
nt backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-cs wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-cs wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-cy wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-cy wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-da wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-da wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-de wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-de wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-dv wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-dv wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-dz wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwds]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-el wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-en-ca =
went backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-en-ca =
went backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-en-gb =
went backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-en-gb =
went backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-en+sha=
w went backwards which would break package feeds from (0:3.10.1-r0.14 to 0:=
3.10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-en+sha=
w went backwards which would break package feeds from (0:3.10.1-r0.18 to 0:=
3.10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-eo wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-eo wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-es wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-es wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-et wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-et wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-eu wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-eu wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-fa wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-fa wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-fi wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-fi wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3--backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-fur we=
nt backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-fur we=
nt backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-fy wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-fy wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ga wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ga wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-gl wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-gl wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-gn wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-gn wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-gu wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-gu wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-gv wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-gv wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ha wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ha wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-he wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-he wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-hi wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-hi wea=
ckage feeds from (0:3.10.1-r0.14 to 0:3.10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-hu wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-hy wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-hy wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ia wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ia wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-id wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-id wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ig wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ig wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-io wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-io wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-is wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-is wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-it wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-it wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ja wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ja wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ka wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ka wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menu.1: Package version for package gnome-menus3-locale-km went backw=
ards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.1-r0.0)=
 [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-km wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-kn wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-kn wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ko wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ko wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ku wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ku wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ky wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ky wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-lo wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-lo wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-lt wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-lt wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-lv wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-lv wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-mai we=
nt backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-mai we=
nt backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-mg wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-mg wen=
t backwards which would brea[version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ml wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-mn wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-mn wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-mr wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-mr wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ms wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ms wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-nb wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-nb wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-nds we=
nt backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-nds we=
nt backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ne wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ne wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-nl wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-nl wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-nn wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-nn wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-oc wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-oc wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menusards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-pl wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-pl wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ps wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ps wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-pt-br =
went backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-pt-br =
went backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-pt wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-pt wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ro wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ro wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ru wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ru wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-rw wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-rw wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-si wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-si wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-sk wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-sk wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-sl wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-sl wen=
t-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-sr wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-sr wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-sv wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-sv wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-szl we=
nt backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-szl we=
nt backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10=
=2E1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ta wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ta wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-te wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-te wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-tg wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-tg wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-th wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-th wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-tr wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-tr wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ug wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-ug wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-uk wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale0.1-r0.=
18 to 0:3.10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-xh wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-xh wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-yo wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-yo wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-zh-cn =
went backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-zh-cn =
went backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-zh-hk =
went backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-zh-hk =
went backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-zh-tw =
went backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-zh-tw =
went backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.=
10.1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-zu wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-locale-zu wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-staticdev wen=
t backwards which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3-staticdev wen=
t backwards which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.=
1-r0.0) [version-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3 went backward=
s which would break package feeds from (0:3.10.1-r0.14 to 0:3.10.1-r0.0) [v=
ersion-going-backwards]
gnome-menus3-3.10.1: Package version for package gnome-menus3 went backward=
s which would break package feeds from (0:3.10.1-r0.18 to 0:3.10.1-r0.0) [v=
ersion-going-backwards]


count: 1	issue: host-user-contaminated
opensaf-5.0.0: opensaf: /opensaf/etc/init.d/opensafd is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
wireshark: 45 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
00f7909 toaster: Updatele error
0bb81e7 lowpan-tools: Fix errors found with clang
da9cb5c openl2tp: Fix build with clang
8238492 libmnl, nftables: Update versions
21520f8 c-ares: update 1.11.0 -> 1.12.0
ca8453e c-ares: fix metadata
d667407 lksctp-tools: 1.0.16 -> 1.0.17
5a4d206 drbd-utils: 8.9.3 -> 8.9.6
5c9951d fftw: Remove the fftw-dev package dependency on non-existent fftw p=
ackage.
dde1c01 libxklavier: upgrade 5.4
66d7015 nginx: update to version 1.10.2
baaf097 sdparm: 1.09 -> 1.10
e9da4e0 netmap: Rename the _count to _recount for kernel v4.8
3714bc0 apache2: cve-2016-5387
6175953 lftp: fix PACKAGECONFIG[readline]
b7e7678 libtinyxml2: Upgrade 3.0.0 -> 4.0.1
abfa9d2 libmicrohttpd: update to version 0.9.52
43c93fa python-webencodings: add recipe for version 0.5
dcb042b python-html5lib: update to version 0.999999999
627d61b python-ipaddress: update to version 1.0.17
90a70b9 python-msgpack: update to version 0.4.8
9e1fbca exo: unbreak Thunar's detailed file view
d83d6bc iscsi-initiator-utils: fix postinstall and systemd service file
d54d0d7 wireshark: install missing header files
558dcd7 xterm: package /usr/lib/X11 to avoid installed-vs-shipped error on =
ppc64
56aefee python-distutils-extra: initial add 2.39
adb36a8 python3-psutil: add python3 version of psutil
f9f6144 gnome-menus3: unblacklist and cleanup
e25c247 menulibre: initial add 2.1.3
a1c1c6f xfce4-whiskermenu-plugin: update to 2.0.2
3b20f4e xfce4-whiskermenu-plugin: add menulibre to RRECOMMENDS
a1377d8 ristretto: update to 0.8.1
5977a2b xfconf: update to 4.12.1
b8856d1 xfce4-notifyd: update to 0.3.3
bf12f01 poppler: update to 0.48.0
8cca4da xfce4-terminal: update to 0.8.1
9dd2967 xfce4-panel: do not display desktop icon when no window is opened
3d62702 xfce4-panel: update to 4.12.1
dc42f92 aoetools: fix QA warning for GNU_HASH
1ade510 nuttcp: fix QA warning for GNU_HASH
fffaf77 zeroconf: fix QA warning for GNU_HASH
ad20e7b tsocks: fix QA warning for GNU_HASH
2c52928 vblade: fix QA warning for GNU_HASH
7cf41dc tunctl: fix QA warning for GNU_HASH
1067e8e libwnck3: add a recipe

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
9aa870e qtbase: avoid qmake errors due to missing oe-device-extra.pri
not included in master yet:=20
7a58995 layer.conf: add LAYERVERSION and LAYERDEPENDS
3a86794 qtmultimedia: fix conflicting declaration error
047ebac qtwebengine: Add gperf-native to DEPENDS
6255c3b qtwayland: Fix building of QWaylandIntegration if some Qt5 features=
 are disabled.
df324eb qt5: Use existing variables for paths of host tools
81fb771 Update Qt5's git repositories to match new locations

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
eb87e6d linux-lg-mako: bump SRCREV to fix build with gcc6
not included in master yet:=20

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlghw9wACgkQN1Ujt2V2gByaawCdH+k5pcGLOAqzNHyyZKMS5QAi
ifMAoJwlIctItz2o3Fb8Um17xfWiKteY
=Vg2a
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
