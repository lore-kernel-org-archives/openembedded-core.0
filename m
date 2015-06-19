Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 553EC73772;
	Fri, 19 Jun 2015 16:52:18 +0000 (UTC)
Received: by wicgi11 with SMTP id gi11so24047470wic.0;
	Fri, 19 Jun 2015 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=GnL71qRq6tmZ9M+b6USrYXtOZXS2CftBVQEhrUoEBCU=;
	b=zqilaSkHOkfjZycBi0u3v5rI9yf1j3ayn97EKtKbIXxs7Gqb8aOT8LmoW1Mm/WFpio
	gzj3F8cLHG6CrNaP6NkqTS+K2/e+9hteJ0rnPaWpPUH5GPGhCBAlqD8b7qTDEosNYOHy
	G0kcpb1Iaw8rzOvfj4njo3To37qFhLGIT3dZoZ4lnPMHLSEuPI0IZ5EvxI9Ery6yGHq7
	Dfn2Szf2tXqo3C6JLLNAQsJNk1dcndbDWOvdRUWImhbjfKR/cRqFz8imEkBF/1cpCN9H
	Tjh85NGQ67k7T4YR7Q4DrbjtyED8bEukGfk2vSH0LnnhwOXvHA25UT+C/3qLmKFkWCmO
	/cyQ==
X-Received: by 10.180.9.225 with SMTP id d1mr8210322wib.73.1434732739796;
	Fri, 19 Jun 2015 09:52:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id gz3sm9626124wib.0.2015.06.19.09.52.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jun 2015 09:52:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 19 Jun 2015 18:52:45 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150619165245.GB2398@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-06-19
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
X-List-Received-Date: Fri, 19 Jun 2015 16:52:19 -0000
X-Groupsio-MsgNum: 66983
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline

--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

== Failed tasks 2015-06-19 ==

INFO: jenkins-job.sh-1.3.1 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150619_155821.log

=== common (3) ===
    * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb, do_compile
    * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, do_compile

=== common-x86 (0) ===

=== qemuarm (2) ===
    * /meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb, do_compile

=== qemux86 (1) ===
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb, do_compile

=== qemux86_64 (3) ===
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_package
    * /meta-openembedded/meta-oe/recipes-support/libldb/libldb_1.1.17.bb, do_configure

=== Number of failed tasks (16) ===
{| class=wikitable
|-
|| qemuarm 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150618_131052.log// || http://errors.yoctoproject.org:80/Errors/Build/6630/
|-
|| qemux86 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150618_153134.log// || http://errors.yoctoproject.org:80/Errors/Build/6675/
|-
|| qemux86_64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150619_041441.log// || http://errors.yoctoproject.org:80/Errors/Build/6679/
|}

=== PNBLACKLISTs (68) ===

=== QA issues (143) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||libdir
|-
||16	||textrel
|-
||3	||already-stripped
|-
||30	||file-rdeps
|-
||34	||build-deps
|-
||60	||version-going-backwards
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


count: 0	issue: libdir


count: 16	issue: textrel
cef3-280796: ELF binary '/tmp/work/i586-oe-linux/cef3/280796-r0/packages-split/cef3-codecs-ffmpeg/usr/lib/cef3/libffmpegsumo.so' has relocations in .text [textrel]
chromium-40.0.2214.91: ELF binary '/tmp/work/i586-oe-linux/chromium/40.0.2214.91-r0/packages-split/chromium-codecs-ffmpeg/usr/lib/chromium/libffmpegsumo.so' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [textrel]
qtwebengine-5.4.2+gitAUTOINC+qtwebengine: ELF binary '/tmp/work/i586-oe-linux/qtwebengine/5.4.2+gitAUTOINC+qtwebengine-r0/packages-split/qtwebengine-plugins/usr/lib/qt5/plugins/qtwebengine/libffmpegsumo.so' has relocations in .text [textrel]
qtwebkit-5.4.2+gitAUTOINC+882e9b5f2c: ELF binary '/tmp/work/i586-oe-linux/qtwebkit/5.4.2+gitAUTOINC+882e9b5f2c-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.2' has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]
webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text [textrel]


count: 34	issue: build-deps
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependency? [build-deps]
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
libldb-1.1.17: libldb rdepends on openldap, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build dependency? [build-deps]
mpd-0.19.1: mpd rdepends on libupnp, but it isn't a build dependency? [build-deps]
netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
pinpoint-0.1.4+gitrAUTOINC+80a056c57e: pinpoint rdepends on librsvg, but it isn't a build dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstapp-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstvideo-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstinterfaces-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstvideo-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libxv, but it isn't a build dependency? [build-deps]
qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on cups-lib, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on cyrus-sasl, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libaio, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libavahi-client, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libavahi-common, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libbsd, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on openldap, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba-python rdepends on libbsd, but it isn't a build dependency? [build-deps]
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [build-deps]
squid-3.5.5: squid rdepends on libpam, but it isn't a build dependency? [build-deps]
sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
vlc-2.1.4: vlc rdepends on libsamplerate0, but it isn't a build dependency? [build-deps]
vlc-2.1.4: vlc rdepends on libssh2, but it isn't a build dependency? [build-deps]
vlc-2.1.4: vlc rdepends on libupnp, but it isn't a build dependency? [build-deps]
watchdog-5.14: watchdog rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
znc-1.6.0+git: znc rdepends on libicuuc, but it isn't a build dependency? [build-deps]


count: 30	issue: file-rdeps
apache2-2.4.12: /usr/bin/apxs_apache2-dev contained in package apache2-dev requires /usr/bin/perl, but no providers found in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requires libucsi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requires libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan requires libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraffic requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraffic requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requires libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
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
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.sh_numptyphysics contained in package numptyphysics requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.so_tracker-nautilus-extension contained in package tracker-nautilus-extension requires libnautilus-extension.so.1, but no providers found in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils contained in package ubx-utils requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
unionfs-fuse-0.26: /usr/sbin/mount.unionfs_unionfs-fuse contained in package unionfs-fuse requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]


count: 60	issue: version-going-backwards
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.65 to 0:2.0.1-2+git0+3a3169ca28-r0.63) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub-dbg went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.65 to 0:2.0.1-2+git0+3a3169ca28-r0.63) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub-dev went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.65 to 0:2.0.1-2+git0+3a3169ca28-r0.63) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub-doc went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.65 to 0:2.0.1-2+git0+3a3169ca28-r0.63) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub-locale went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.65 to 0:2.0.1-2+git0+3a3169ca28-r0.63) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub-staticdev went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.65 to 0:2.0.1-2+git0+3a3169ca28-r0.63) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl went backwards which would break package feeds from (0:2.16-r0.57 to 0:2.16-r0.56) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-dbg went backwards which would break package feeds from (0:2.16-r0.57 to 0:2.16-r0.56) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-dev went backwards which would [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-doc went backwards which would break package feeds from (0:1.03-r0.59 to 0:1.03-r0.58) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-locale went backwards which would break package feeds from (0:1.03-r0.59 to 0:1.03-r0.58) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-staticdev went backwards which would break package feeds from (0:1.03-r0.59 to 0:1.03-r0.58) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl went backwards which would break package feeds from (0:1.997-r0.56 to 0:1.997-r0.55) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-dbg went backwards which would break package feeds from (0:1.997-r0.56 to 0:1.997-r0.55) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-dev went backwards which would break package feeds from (0:1.997-r0.56 to 0:1.997-r0.55) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-doc went backwards which would break package feeds from (0:1.997-r0.56 to 0:1.997-r0.55) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-locale went backwards which would break package feeds from (0:1.997-r0.56 to 0:1.997-r0.55) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-staticdev went backwards which would break package feeds from (0:1.997-r0.56 to 0:1.997-r0.55) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.67 to 0:2.0.0-1+git0+79155bd3f1-r0.65) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-dbg went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.67 to 0:2.0.0-1+git0+79155bd3f1-r0.65) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-dev went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.67 to 0:2.0.0-1+git0+79155bd3f1-r0.65) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-doc went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.67 to 0:2.0.0-1+git0+79155bd3f1-r0.65) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-locale went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.67 to 0:2.0.0-1+git0+79155bd3f1-r0.65) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-staticdev went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.67 to 0:2.0.0-1+git0+79155bd3f1-r0.65) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package luna-webkit-api went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.66 to 0:2.0.0-1+git0+d0b393ac0c-r0.64) [version-going-backwards]
luna-webkit-apiC+d0b393ac0c: Package version for package luna-webkit-api-dev went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.66 to 0:2.0.0-1+git0+d0b393ac0c-r0.64) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package luna-webkit-api-doc went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.66 to 0:2.0.0-1+git0+d0b393ac0c-r0.64) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package luna-webkit-api-locale went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.66 to 0:2.0.0-1+git0+d0b393ac0c-r0.64) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package luna-webkit-api-staticdev went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.66 to 0:2.0.0-1+git0+d0b393ac0c-r0.64) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-dbg went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-dev went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-doc went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-locale went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-staticdev went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-dbg went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-dev went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-doc went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-locale went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-staticdev went backwards which would break package feeds from (0:1.0-r0.66 to 0:1.0-r0.64) [version-going-backwards]
rdx-utils-stub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package rdx-utils-stub went backwards which would break package feeds from (0:2.0.0-1+git0+51341059f7-r0.65 to 0:2.0.0-1+git0+51341059f7-r0.63) [version-going-backwards]
rdx-utils-stub-2.0.0-1+gitAUTO9f7-r0.65 to 0:2.0.0-1+git0+51341059f7-r0.63) [version-going-backwards]
rdx-utils-stub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package rdx-utils-stub-locale went backwards which would break package feeds from (0:2.0.0-1+git0+51341059f7-r0.65 to 0:2.0.0-1+git0+51341059f7-r0.63) [version-going-backwards]
rdx-utils-stub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package rdx-utils-stub-staticdev went backwards which would break package feeds from (0:2.0.0-1+git0+51341059f7-r0.65 to 0:2.0.0-1+git0+51341059f7-r0.63) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common went backwards which would break package feeds from (0:1.34-r8.65 to 0:1.34-r8.63) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dbg went backwards which would break package feeds from (0:1.34-r8.65 to 0:1.34-r8.63) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dev went backwards which would break package feeds from (0:1.34-r8.65 to 0:1.34-r8.63) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-doc went backwards which would break package feeds from (0:1.34-r8.65 to 0:1.34-r8.63) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went backwards which would break package feeds from (0:1.34-r8.65 to 0:1.34-r8.63) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev went backwards which would break package feeds from (0:1.34-r8.65 to 0:1.34-r8.63) [version-going-backwards]

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWESN0ACgkQN1Ujt2V2gBx3BQCgiL6yTInk9sjZzjc2iFIDi0bG
0e8AnjMhyIbbCpBc6yrCCZvj2DR0L2HF
=WM7X
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
