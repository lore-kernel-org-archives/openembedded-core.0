Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1837D7562E;
	Thu, 28 May 2015 08:45:15 +0000 (UTC)
Received: by wgez8 with SMTP id z8so30071118wge.0;
	Thu, 28 May 2015 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=0czrdmyuIFmMo6gBM+TC9Im5RgpXopWKzE9p2TfRHhg=;
	b=IKRoba+Y+VGttOwwsc3QG38NQ3Movbdo8o60+b34UPWed+5QEgQXlzbxplRghwiGG8
	E9m6+m8oU0sWTWZ+kU5Yw4kteSXPd60aUoRific6Rr1sYAPCcsCvkE5aJ4InjA22+Qcn
	QTHDycdcz//aPYyj+kI5Dm5F/umraC/bsWfHNxhDAhvLLVIgFNPN5FtWUAi98tpZCpu3
	BCLKnb6hiKF3fR3yC+qgKkFpyMuiZ5SZrkuR6BFBg6MW87nMhIL3NTemmk63Zjha+3J4
	XwYbP9y5nLbidzm8S6UC3rfIhnIZhtt6+TXhDzG3xC0j55q5XUyYb8Rdz0DLcAU8W0p0
	t+3g==
X-Received: by 10.194.60.106 with SMTP id g10mr3259880wjr.121.1432802715824;
	Thu, 28 May 2015 01:45:15 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id um5sm2263556wjc.1.2015.05.28.01.45.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 01:45:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 May 2015 10:45:36 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150528084536.GB2383@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-05-27
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
X-List-Received-Date: Thu, 28 May 2015 08:45:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This time without sstate-cache, so the list of QA issues should be
almost complete (except recipes which fail to build or their
dependencies failed to build)

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2015-05-27 ==

INFO: jenkins-job.sh-1.3.1 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150528_084227.log

=== common (4) ===
    * /meta-openembedded/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb, do_unpack
    * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb, do_unpack
    * /meta-openembedded/meta-oe/recipes-support/vim/vim_7.4.481.bb, do_unpack

=== common-x86 (1) ===
    * /openembedded-core/meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb, do_compile

=== qemuarm (1) ===
    * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb, do_compile

=== qemux86 (1) ===
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_package_qa

=== qemux86_64 (1) ===
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure

=== Number of failed tasks (17) ===
{| class=wikitable
|-
|| qemuarm 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150525_135429.log// || http://errors.yoctoproject.org:80/Errors/Build/6178/
|-
|| qemux86 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150526_121631.log// || http://errors.yoctoproject.org:80/Errors/Build/6190/
|-
|| qemux86_64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150527_092436.log// || http://errors.yoctoproject.org:80/Errors/Build/6193/
|}

=== PNBLACKLISTs (68) ===

=== QA issues (111) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||version-going-backwards
|-
||1	||libdir
|-
||18	||file-rdeps
|-
||29	||build-deps
|-
||3	||already-stripped
|-
||60	||textrel
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. invalid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: 'defaault'. "default" state must always be first."
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with more strict ejde_cc from efl-1.13"
meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse] ?= "depends on blacklisted libimobiledevice"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?= "CONFLICT: 4 files conflict with gnome-keyring"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gnome-menus3] ?= "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb:PNBLACKLIST[snort] ?= "BROKEN: autotools processing causes OOM condition on configure"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACKLIST[lksctp-tools] ?= "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] ?= "BROKEN: fails to build for qemuarm."
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNBLACKLIST[libimobiledevice] ?= "cannot run test program while cross compiling"
meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?= "Not comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb:PNBLACKLIST[nodejs4] ?= "Used only by currently blacklisted cloud9 and fails to build for qemuarm with thumb: error: #error For thumb inter-working we require an architecture which supports blx"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?= "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends on blacklisted kernel-module-ktapvm"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-framework] ?= "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plugins] ?= "BROKEN: depends on broken maliit-framework"
meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb:PNBLACKLIST[start-stop-daemon] ?= "BROKEN: fails because of gettext, partial fix is available here http://patchwork.openembedded.org/patch/89867/"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-vala] ?= "Fails to build since vala upgrade to 0.26.1"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?= "broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] = "rdepends on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-webos-ports:
conf/world_fixes.inc:PNBLACKLIST[mplayer2] = ""
conf/world_fixes.inc:PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
conf/world_mask.inc:PNBLACKLIST[evince] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[epiphany] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] = "fails to build"
conf/world_mask.inc:PNBLACKLIST[media-ctl] = "fails to build"
QA issues by type:
count: 3	issue: already-stripped
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' from qwt was already stripped, this will prevent future debugging! [already-stripped]


count: 1	issue: libdir
cef3: found library in wrong location: /usr/bin/lib/.debug/libcef.so [libdir]


count: 60	issue: textrel
cef3-280796: ELF binary '/tmp/work/i586-oe-linux/cef3/280796-r0/packages-split/cef3-codecs-ffmpeg/usr/lib/cef3/libffmpegsumo.so' has relocations in .text [textrel]
chromium-40.0.2214.91: ELF binary '/tmp/work/i586-oe-linux/chromium/40.0.2214.91-r0/packages-split/chromium-codecs-ffmpeg/usr/lib/chromium/libffmpegsumo.so' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-audio/usr/lib/python3.4/lib-dynload/ossaudiodev.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-codecs/usr/lib/python3.4/lib-dynload/_codecs_tw.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-core/usr/lib/python3.4/lib-dynload/binascii.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-crypt/usr/lib/python3.4/lib-dynload/_sha256.cpython-34m.so' has relocations in .text [tions in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-json/usr/lib/python3.4/lib-dynload/_json.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-lang/usr/lib/python3.4/lib-dynload/_bisect.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-math/usr/lib/python3.4/lib-dynload/cmath.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-misc/usr/lib/python3.4/lib-dynload/_opcode.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-mmap/usr/lib/python3.4/lib-dynload/mmap.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.4/lib-dynload/_multiprocessing.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-profile/usr/lib/python3.4/lib-dynload/_lsprof.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-resource/usr/lib/python3.4/lib-dynload/resource.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-syslog/usr/lib/python3.4/lib-dynload/syslog.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-textutils/usr/lib/python3.4/lib-dynload/_csv.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-unixadmin/usr/lib/python3.4/lib-dynload/grp.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3-r1.0/packages-split/python3-xml/usr/lib/python3.4/lib-dynload/pyexpat.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-audio/usr/lib/python3.4/lib-dynload/ossaudiodev.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-codecs/usr/lib/python3.4/lib-dynload/_codecs_iso2022.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-core/usr/lib/python3.4/lib-dynload/binascii.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-crypt/usr/lib/python3.4/lib-dynload/_sha256.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-ctypes/usr/lib/python3.4/lib-dynload/_ctypes.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-curses/usr/lib/python3.4/lib-dynload/_curses.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-elementtree/usr/lib/python3.4/lib-dynload/_elementtree.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-fcntl/usr/lib/python3.4/lib-dynload/fcntl.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-io/usr/lib/python3.4/lib-dynload/_socket.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-json/usr/lib/python3.4/lib-dynload/_json.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-lang/usr/lib/python3.4/lib-dynload/_bisect.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-math/usr/lib/python3.4/lib-dynload/cmath.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-misc/usr/lib/python3.4/lib-dynload/xxlimited.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-mmap/usr/lib/python3.4/lib-dynload/mmap.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.4/lib-dynload/_multiprocessing.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-profile/usr/lib/python3.4/lib-dynload/_lsprof.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-resource/usr/lib/python3.4/lib-dynload/resource.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-syslog/usr/lib/python3.4/lib-dynload/syslog.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-textutils/usr/lib/python3.4/lib-dynload/_csv.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-unixadmin/usr/lib/python3.4/lib-dynload/grp.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packages-split/python3-xml/usr/lib/python3.4/lib-dynload/pyexpat.cpython-34m.so' has relocations in .text [textrel]
qtwebengine-5.4.1: ELF binary '/tmp/work/i586-oe-linux/qtwebengine/5.4.1-r0/packages-split/qtwebengine-plugins/usr/lib/qt5/plugins/qtwebengine/libffmpegsumo.so' has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]
webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text [textrel]


count: 29	issue: build-deps
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependency? [build-deps]
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build dependency? [build-deps]
netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
pinpoint-0.1.4+gitrAUTOINC+80a056c57e: pinpoint rdepends on librsvg, but it isn't a build dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstapp-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstvideo-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it isn't a build dependency? [bubkit4 rdepends on libgstinterfaces-0.10, but it isn't a build dependency? [build-deps]
qt4-embedded-4.8.6: libqt-embeddedwebkit4 rdepends on libgstpbutils-0.10, but it isn't a build dependency? [build-deps]
qt4-embedded-4.8.6: libqt-embeddedwebkit4 rdepends on libgstvideo-0.10, but it isn't a build dependency? [build-deps]
qt4-x11-free-4.8.6: libqtwebkit4 rdepends on gstreamer, but it isn't a build dependency? [build-deps]
qt4-x11-free-4.8.6: libqtwebkit4 rdepends on libgstapp-0.10, but it isn't a build dependency? [build-deps]
qt4-x11-free-4.8.6: libqtwebkit4 rdepends on libgstinterfaces-0.10, but it isn't a build dependency? [build-deps]
qt4-x11-free-4.8.6: libqtwebkit4 rdepends on libgstpbutils-0.10, but it isn't a build dependency? [build-deps]
qt4-x11-free-4.8.6: libqtwebkit4 rdepends on libgstvideo-0.10, but it isn't a build dependency? [build-deps]
qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn't a build dependency? [build-deps]
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [build-deps]
squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency? [build-deps]
sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
watchdog-5.14: watchdog rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]


count: 18	issue: file-rdeps
apache2-2.4.12: /usr/bin/apxs_apache2-dev contained in package apache2-dev requires /usr/bin/perl, but no providers found in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in package gnome-desktop requires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]
gnome-panel-2.32.1: /usr/lib/gnome-panel/gnome-panel-add_gnome-panel contained in package gnome-panel requires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]
gupnp-0.20.12: /usr/bin/gupnp-binding-tool_gupnp-dev contained in package gupnp-dev requires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]
libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package libbonobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file-rdeps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.so_libnewt-python contained in package libnewt-python requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.so_libnewt-python contained in package libnewt-python requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphysics contained in package numptyphysics requires /usr/bin/perl, but no providers found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /ustension requires libnautilus-extension.so.1, but no providers found in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils contained in package ubx-utils requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
unionfs-fuse-0.26: /usr/sbin/mount.unionfs_unionfs-fuse contained in package unionfs-fuse requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]


count: 0	issue: version-going-backwards

