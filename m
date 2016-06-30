Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 08BE0601B8;
	Thu, 30 Jun 2016 07:06:14 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id v199so208072877wmv.0;
	Thu, 30 Jun 2016 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=VIzlm4ot2w5V67eCAvTX0877wEIR1ZKOiFW5M4zLtyY=;
	b=Q5zUJzCvBusDvyW2/ROhoEvsXAl13vNjvEyA9dM4vnW9DeGN39A0HlnxpCKv4If6To
	iFSXhSvyE+oQjs1vxySclbZeqWVK6kYesM+m16eNgWkEhDNzEiVu6FP1ZKV/TpcIGmpd
	XenCWh0R3g0ghnOwfR0gogMMDaOI1ni2QnyehnTWZvfUP6ErUSi1F2u4KTvaxU/ohR86
	eTbuyPbpgrBT6o+bjaxCZiNewOnWZfsUOkQBW6whUMJ5KpuF1wFL6T8uU6YhnzKY2Pca
	WWHEQ8jCe1vpCIjrDfHHn7aPQkceauTJR7tweB7Am1qOmgW97wFMsKxRtLVeNG7GznNw
	SxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=VIzlm4ot2w5V67eCAvTX0877wEIR1ZKOiFW5M4zLtyY=;
	b=XrHU2ReYjyUiKK/nfVu8LIs8CRDdOWy476WyaKmqt4hCZo9haPVPBt44aS75wRXedq
	m9KbEp0RQ+vfvIHphM0/3sMNHCmsucfzKKuee7o7VTlWmim0G0J20Pk+VQakp9neRMNB
	RuAQ1tgZBfqWYRU46JLhIB+BK8UI7RzHo3X2+0Ig0BWZra3gj1k3dkepumDN3wuC4b/g
	tyGy1Hy5Zm5qs9mEwQzrWMSwLPfnPdk8N86SU/qKCSDkVOkZhHT/7fBu6OSc/f/BiEdT
	Ohr1gEy8w6zm/zx7Yjg7O8Qeiyh9qAuzUCz4F2QkWi9bnV3z2Ew0c+BK7EUL6qkL4To/
	LTYw==
X-Gm-Message-State: ALyK8tIMmZhLCYjYuXSpdVOGKC4EyaPGVeVY3Br/M69PsOS1fdyf0EnloTpiLTVILprvMw==
X-Received: by 10.194.114.42 with SMTP id jd10mr11640071wjb.88.1467270374133; 
	Thu, 30 Jun 2016 00:06:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id q69sm3906568wmd.4.2016.06.30.00.06.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Jun 2016 00:06:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jun 2016 09:07:25 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160630070725.GA2564@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: State of bitbake world 2016-06-29
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
X-List-Received-Date: Thu, 30 Jun 2016 07:06:21 -0000
X-Groupsio-MsgNum: 83982
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

python-setuptools-scm will be dropped from meta-oe/master-next,
piglit and libdrm issues were reported in bugzilla

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
||2016-06-29	||1	||2	||2	||10	||1	||1	||12	||2	||2	||0	||0		||0		||0		||0		=
||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-06-29 =3D=3D

INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/log.report.20160629_204437.log

=3D=3D=3D common (1) =3D=3D=3D
    * meta-openembedded/meta-python/recipes-devtools/python/python-setuptoo=
ls-scm_1.11.1.bb:do_fetch

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * openembedded-core/meta/recipes-graphics/piglit/piglit_git.bb:do_compi=
le

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (5) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemuarm.20160629_064042.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/17873/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.wor=
ld.qemux86.20160629_064132.log/ || http://errors.yoctoproject.org/Errors/Bu=
ild/17874/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/log.=
world.qemux86-64.20160629_085942.log/ || http://errors.yoctoproject.org/Err=
ors/Build/17877/
|}

=3D=3D=3D PNBLACKLISTs (130) =3D=3D=3D

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



=3D=3D=3D Failed dependencies for qemuarm (10) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemuarm.20160629_085627.log/
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
    * ERROR: 10 issues were found in these recipes: enchant jasper libdrm p=
ython-setuptools-scm samba

=3D=3D=3D Recipes failing with maximal dependencies for qemuarm (1) =3D=3D=
=3D
    * python-setuptools-scm -- http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/log.dependencies.qemuarm.20160629_085627.log//2_max/failed/python-setupt=
ools-scm.log

=3D=3D=3D Recipes failing with minimal dependencies for qemuarm (1) =3D=3D=
=3D
    * python-setuptools-scm -- http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/log.dependencies.qemuarm.20160629_085627.log//3_min/failed/python-setupt=
ools-scm.log

=3D=3D=3D Failed dependencies for qemux86 (12) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependenci=
es.qemux86.20160629_112344.log/
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
    * ERROR: 12 issues were found in these recipes: enchant jasper libdrm p=
iglit python-setuptools-scm samba

=3D=3D=3D Recipes failing with maximal dependencies for qemux86 (2) =3D=3D=
=3D
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160629_112344.log//2_max/failed/piglit.log
    * python-setuptools-scm -- http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/log.dependencies.qemux86.20160629_112344.log//2_max/failed/python-setupt=
ools-scm.log

=3D=3D=3D Recipes failing with minimal dependencies for qemux86 (2) =3D=3D=
=3D
    * piglit -- http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemux86.20160629_112344.log//3_min/failed/piglit.log
    * python-setuptools-scm -- http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/log.dependencies.qemux86.20160629_112344.log//3_min/failed/python-setupt=
ools-scm.log

=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures=
=2E20160629_132318.log/

No issues detected


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
meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb:PNBLACKLIST[sno=
rt] ?=3D "BROKEN: QA Issue: snort_preproc.pc, snort_output.pc, snort.pc"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-daemons/squid/squid_3.5.7.bb:PNBLACKLIST[squid] ?=
=3D "BROKEN: sysroots/qemuarm/usr/include/linux/in.h:28:16: error: redeclar=
ation of 'IPPROTO_IP'"
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
meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb:PNBLACKLIST[mousepad] ?=
=3D "Depends on broken gtksourceview2"
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
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesnroken for years"
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
779d736 lib/bb/build.py: remove task flag in deltask()
not included in master yet:=20
161af1b world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
646c366 gst-player: upgrade to latest HEAD
not included in master yet:=20
e4afe34 qemux86: Add identical qemux86copy variant for tests
1568fc5 sstate-sysroot-cruft.sh: Extend the whitelist
2ae846b recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
fd14160 buildhistory.bbclass: metadata-revs show repo parent
eb13003 metadata-revs: provide more information
fed8fd8 report-error: Allow to upload reports automatically
64c6c2b icecc.bbclass: replace os.popen with subprocess.check_output
5e65e63 test-dependencies.sh: Strip also '\.bb;.*' before adding failed rec=
ipe to list of failed

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
1cb7275 gnome-terminal, toscoterm, vala-terminal, xfce4-terminal: use vte9
not included in master yet:=20
7f66d35 openconnect: add dependency to fix Makefile.am
cb66d6d openconnect: fix do_compile failure
c28f9f4 mpg123: remove the recipe
5b908d0 libmad: add the recipe
6885211 crda: fix errors about unused variables and remove from the blackli=
st
b08d3ff lftp: fix issues with multiple signbit definitions and remove from =
the blacklist
044b51c Samba: use only libsystemd
4576e37 pypi: update the base pypi url to use the package info without requ=
iring the hash
5cefdbd python-pyro4: update recipe to use the pypi class
3bea8bf python-m2crypto: update recipe to use the pypi class
70bc59d python-pyephem: update recipe to use the pypi class
284e2b5 python-yappi: add a recipe for a python profiler
6e7149e python-decorator: update to version 4.0.10
91ec7b4 python-flask: upgrade to version 0.11.1
f533212 python-pymisp: update to version 2.4.48.1
3b4ab8b python-pyserial: update to version 3.1.1
42bd37f python-pbr: Add python-pbr bb
5125a6f python-mock: Add python-pbr-native dependency
2934621 python-mccabe: Add python-pytest-runner dependency
3f6ed79 python-pytest-runner: Add python-pytest-runner bb
d95b080 python-setuptools-scm: Add python-setuptools-scm bb
54fd538 cpuset: add new python package
b6a4bdc libxfce4ui: Use native intltool for building the lib
cd427d4 x11vnc: remove redundant RPATH to fix QA issue
b406a53 netmap: blacklist

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
4417aad org.webosportsfrom Fido"
680e783 glib: rename bbappend to match new version from oe-core
dbff529 opkg: rename bbappend to match new version from oe-core
fe8af27 alsa-lib: rename bbappend to match new version from oe-core
bce331c glib: rename bbappend to match new version from oe-core
48a0e73 packagegroup-luneos-extended: Temporary remove imaccountvalidator, =
imlibpurpleservice
b50ca7a nodejs-module-webos-dynaload: Fix build with newer nodejs
b9829f9 pulseaudio: rename bbappend to apply for new version from oe-core
1667043 alsa-utils: rename bbappend to apply for new version from oe-core
2085708 pulseaudio: install few more headers needed by pulseaudio-modules-d=
roid
f425714 geoclue: explicitly disable introspection
78d59a7 wayland: Remove backported 1.9.0
4d97d7d luneos-{package,emulator-appliance}: exclude DATETIME from signatur=
es
282655f meta-luneos: Remove PACKAGECONFIG_CONFARGS work around
001f715 systemd: Disable fdinfo stat
ddee1e2 pulseaudio-modules-droid: Fix PA8 on Krogoth
1e89594 pulseaudio-modules-droid: Switch back to own fork with Mako specifi=
c patches
cc159fb pulseaudio-modules-droid: Bump SRCREV
612ecfa pulseaudio-modules-droid: Switch back to upstream for now
16d63fe pulseaudio-modules-droid: Add patches for detection of external con=
nection changes & mako fix
e87cb52 nodejs-module-webos: Move to own forks & drop patches
2bd3334 nodejs-module-webos: Use webos_ports_fork_repo instead
cf5d284 qtwebengine: Force PulseAudio & fix proprietary codecs
fcb40d1 luna-next-cardshell: Bump SRCREV
af83016 mmsd: Update mmd.service with correct location
70011f7 pidgin: Update to 2.10.12
172f93f packagegroup-luneos-extended: Bring back imaccountvalidator & imlib=
purpleservice
06bd43c keymanager: Disable node-sqlite3 for now
528da06 packagegroup-luneos-extended: Enable keymanager again
76e07cf org.webosports.service.downloadmgr: initial recipe
e4db9df Merge pull request #180 from Garfonso/patch-29
d7a8b1e packagegroup-luneos-extended: Add downloadmanager
89f3cf3 org.webosports.cdav: Bump SRCREV
b7c96c6 keymanager: Bump SRCREV
1327a03 connman: Drop our recipe and use oe-core one
f087e19 mesa-10.3.7: Remove unsupported --with-sha options
b6ccaab libqofono: Fix QA warning
837c951 luna-sysmgr: Fix do_install
b97746d imaccountvalidator: Fix QA issues
9d1304c imlibpurpleservice: Fix QA issues
67e9378 recipes: replace base_contains with bb.utils.contains
0ef7cbc packagegroup-luneos-extended: install kernel-module-snd-intel8x0 fo=
r QEMU
a9c7130 pulseaudio-distro-conf: update webos-system.pa from latest pulseaud=
io
d7c51a6 qtwebengine: Bump SCREV for chromium
1b69941 phonesim: fix random build failure
5c18ec2 phonesim: Fix build with Qt 5.7
eab6618 FingerTerm: Use upstream directly
fbdf4ff Revert "pulseaudio-distro-conf: update webos-system.pa from latest =
pulseaudio"
bfcd7ad distro: luneos: switch release name to tobio
4362265 luna-next-cardshell: Bump SRCREV
7cf3b5b qtwebengine: Bump SRCREV
91e0516 luneos-default-wallpapers: use cp -R --no-dereference --preserve=3D=
mode,links -v to fix QA warnings:
2f3ef79 connman-conf: install wired-setup to datadir
10b92b4 hunspell: move ispellaff2myspell to separate package
cbb6057 presage: add dependency on ncurses
9f9fa81 luna-webappmanager: Bump SRCREV
d2d90da android-property-service: Add DEPENDS on luna-prefs
6b478b7 org.webosports.service.update: Add RDEPENDS for bash
7a850f8 core-apps: Add RDEPENDS on bash
1f92761 loadable-frameworks: Add RDEPENDS on bash
bda6013 lxc: Add bash to RDEPENDS
1b2b4d0 org.webosports.app.calendar: Move recipe to unused
a552da7 org.webosinternals.tweaks: Bump SRCREV
462d3c0 webos-cd8b169 org.webosinternals.tweaks: Change enjo-app into enyo-=
app
f4fbc4f Initial work to support Enyo 2.7 applications using enyo-dev
2b1ba13 presage: Fix QA issues
8572199 luneos.inc: Add Ubuntu 15.10 and 16.04 to sanity tested distros
346c70f geoclue: Add avahi to DEPENDS
91f622b sensorfw: Add bash to RDEPENDS
856f4bf ofono: Add patches to revert Python 3
47f0fc6 ofono: Fix missing \
8c55fd7 presage: Version independent approach to Python
b31fb8c webos-telephonyd: Bump SRCREV
cb3feb4 Add https-everywhere recipe for providing https rulesets for Browse=
r app
22111b8 https-everywhere: Use SQLite db instead
ed46ebf pidgin: simplify bbappend
b1f219d qtscenegraph-adaptations: Drop patches & follow upstream directly
772a5f1 LXC 2.0 Upgrade
80c56dc qtwebengine: bump SRCREV
b8839cf lxc: Update patches & recipes
1fe40df Merge pull request #181 from webOS-ports/herrie/lxc
7393c3c qtwebengine: Bump SRCREV
71d656f mediaindexer: Bump SRCREV
f6d3bc4 Working Enyo 2.7 recipes
14d38e5 Merge pull request #182 from Andolamin/herrie/enyodev
b50d254 Merge pull request #184 from webOS-ports/herrie/enyodev
670549e org.webosports.app.contacts: Bump SRCREV
b8ce88e app-services, foundation-frameworks, mojoloader, mojoservicelaunche=
r, nodejs-module-webos-dynaload: Cleanup and switch to own fork
59b9beb foundation-frameworks, mojoservicelauncher: Bump SRCREV
8da18db app-services: Bump SRCREV
fd8f80f imaccountvalidator: Bump SRCREV
ad5a52f imlibpurpleservice: Bump SRCREV
773780b imlibpurpleservice: Bump SRCREV
e8d95f2 luna-next-cardshell: Bump SRCREV
1ebbc84 luna-service2: Bump SRCREV
090b244 org.webosports.app.settings: Bump SRCREV
bac08ba core-apps: Bump SRCREV and cleanup
dd71dca webos-telephonyd: Bump SRCREV
b69e02a Add recipe for org.webosports.app.tasks
75f4492 packagegroup-luneos-extended: Add org.webosports.app.tasks and mess=
aging-accounts
090d5a8 messaging-accounts: Initial recipe
8dd1656 mediaindexer: Bump SRCREV
91db79e org.webosports.app.contacts: Bump SRCREV
026fca2 luna-appmanager: Bump SRCREV
c32c88f org.webosports.app.contacts: Bump SRCREV
085d4e7 pulseaudio-distro-conf: update webos-system.pa from latest pulseaud=
io
098a35a README: update to depend on master branches
46ba83a qtbase: enable fontconfig
99f72ec qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.7
4a01591 luna-next: Make compatible with Qt 5.7
37586fe qtwebengine: temporary drop bbappend
1bab4c4 luna-sysservice: Fix build with qt 5.7
e7f5372 glib-2.0: rename .bbappend to match new version from oe-core
94f34c5 connman: rename .bbappend to match new version from oe-core
175accd openssl,pmcertificatemgr: use openssl files from /etc
a662a53 libsdl2: upgrade to 2.0.4 included in oe-core
1dfe4be luna-next, luna-webappmanager: temporary drop from image
b6d9b20 alsa-lib,alsa-utils: rename bbappend to match new version from oe-c=
ore
ebb8ac5 librolegen: Fix build with newer toolchain
91d88c3 activitymanager: Fix build with newer toolchain
e907566 mojomail: Fix build with gcc-6
2232281 presage: Fix build with newer toolchain
dc07b66 mmsd, packagegroup-webos-test: drop python-pygobject

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
d6d9f42 tenderloin-bluetooth-utilities: Bump SRCREV
not included in master yet:=20
cd39921 zhone: blacklist because of python-pycairo runtime dependency
35029f2 libframeworkd-glib: blacklist, fails with gcc-6
b1ee9cc packagegroup-shr-feed: Remove firefox and fbreader
c560043 frameworkd, mdbus, gta04-gps-handler, pisi: Remove runtime dependen=
cy on broken python-pygobject
bea9494 packagt from EXTRA_IMAGEDEPENDS
9cfbb34 linux-gta04: upgrade to 4.4
f412709 shr: add wayland to DISTRO_FEATURES
2d86ad1 linux-gta04: include linux-dtb
823d562 packagegroup-shr-feed: drop leafpad


--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAld0xSwACgkQN1Ujt2V2gBzzUQCeKv+6BVAwabk5pTdRcwzu/UZm
vbgAoKGIl2hiC6LxksWWSD6ElZlorsI5
=ZD21
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
