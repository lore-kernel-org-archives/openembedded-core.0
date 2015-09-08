Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE3165C8A;
	Tue,  8 Sep 2015 14:52:13 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so118631224wic.1;
	Tue, 08 Sep 2015 07:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=gsjUuCn6fUdO/aHsv3tjPPKTEQX7mPnsLs5dKQvm8ZA=;
	b=xVVTiuihzmFDOlThmojB0gAYzvbuMI1mGv1mrxRiZ/YHLp4otMm5jJfZWjyJx0gFxC
	yFIN0mzyWEgZi8Rxt6tivKa1jkp/kkUy3ciUZUggXqMQCEC8ECof9B5DrkLo4PvqngUT
	HcHimwmFPgMi7AytNuD1eqUHmOpDASMEzmCcLFH8/YziC3hSw1irj9eAfwbPaLyW2vYx
	p41AC8qm/kzzo4o+9NQCA7n9Fry0t61cDpUqVu7shWNALr+nd+SWSXZDDiDdqy22LRDb
	9hmIp3JCHWn0F2Mvga1yMIF7s9lffbSdg/rA8xYMbgjtIGM1cn+f1sOWkOhDFC1b5kPX
	qt3g==
X-Received: by 10.180.10.8 with SMTP id e8mr44247100wib.22.1441723932609;
	Tue, 08 Sep 2015 07:52:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id f7sm5261858wij.17.2015.09.08.07.52.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 07:52:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Sep 2015 16:52:59 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150908145259.GA2381@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2015-09-07
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
X-List-Received-Date: Tue, 08 Sep 2015 14:52:17 -0000
X-Groupsio-MsgNum: 70822
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is last build with gcc-4.9, next one will contain more failures,
because the default gcc is 5.2 now.

OE @ ~/openembedded-core $ git log --oneline origin/master..jansa/master
5355c3b initramfs-framework: Drop allarch
12b9e2d linux-firmware: Drop allarch
30ce672 ppp-dialin: Drop allarch
6a9fd12 resolvconf: Drop allarch
ee5200c usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
4fd8d3b Fix recursive mode -st on BUILDDIR setup
55f6fe5 fontcache: allow to pass extra parameters and environment to fc-cache
a7ca2df postinst_intercept: allow to pass variables with spaces
baa5e0b rootfs.py: show intercept script output in log.do_rootfs
b9a485c rootfs.py: Allow to override postinst-intercepts location
2cec7eb guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind:
disable thumb where it fails for qemuarm
d4fef86 icu: force arm mode
124020b gdb: force arm mode
958c7e8 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
d548848 libsdl: Add support for libsdl-native
643b312 WIP: Add KERNEL_EXTRA_ARGS?
72ebe94 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
251dea7 report-error: Allow to upload reports automatically
91394fd qemux86: Add identical qemux86copy variant for tests

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2015-09-07 ==

INFO: jenkins-job.sh-1.3.1 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150908_140743.log

=== common (8) ===
    * /meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_fetch
    * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb, do_compile
    * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb, do_patch
    * /meta-openembedded/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb, do_fetch
    * /meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/gd/gd_2.1.1.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb, do_compile
    * /meta-openembedded/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb, do_install

=== common-x86 (1) ===
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb, do_compile

=== qemuarm (8) ===
    * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb, do_configure
    * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb, do_compile
    * /openembedded-core/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb, do_compile
    * /openembedded-core/meta/recipes-support/libunwind/libunwind_1.1.bb, do_compile

=== qemux86 (2) ===
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb, do_compile
    * /openembedded-core/meta/recipes-graphics/mesa/mesa_10.6.3.bb, do_compile

=== qemux86_64 (2) ===
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure
    * /meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb, do_compile

=== Number of failed tasks (44) ===
{| class=wikitable
|-
|| qemuarm 	|| 16	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150905_133750.log// || http://errors.yoctoproject.org:80/Errors/Build/8592/
|-
|| qemux86 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150906_143529.log// || http://errors.yoctoproject.org:80/Errors/Build/8597/
|-
|| qemux86_64 	|| 17	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150907_074215.log// || http://errors.yoctoproject.org:80/Errors/Build/8611/
|}

=== PNBLACKLISTs (66) ===

=== QA issues (56) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||libdir
|-
||0	||version-going-backwards
|-
||21	||file-rdeps
|-
||23	||build-deps
|-
||3	||already-stripped
|-
||9	||textrel
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. invalid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: 'defaault'. "default" state must always be first."
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with more strict ejde_cc from efl-1.13"
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


count: 9	issue: textrel
directfb-1.7.7: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/directfb/1.7.7-r0/packages-split/directfb/usr/bin/mkdfiff' has relocations in .text [textrel]
efl-1.15.1: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/efl/2_1.15.1-r0/packages-split/evas/usr/lib/evas/cserve2/bin/v-1.15/evas_cserve2_slave' has relocations in .text [textrel]
gimp-2.8.14: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/gimp/2.8.14-r0/packages-split/gimp/usr/lib/gimp/2.0/plug-ins/file-ico' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.18-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
matchbox-keyboard-0.0+gitAUTOINC+217f1bfe14: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/matchbox-keyboard/0.0+gitAUTOINC+217f1bfe14-r4/packages-split/matchbox-keyboard/usr/bin/matchbox-keyboard' has relocations in .text [textrel]
mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [textrel]


count: 23	issue: build-deps
cifs-utils-6.4: cifs-utils rdepends on samba, but it isn't a build dependency? [build-deps]
collectd-5.5.0: collectd rdepends on openldap, but it isn't a build dependency? [build-deps]
dovecot-2.2.18: dovecot rdepends on lz4, but it isn't a build dependency? [build-deps]
dovecot-2.2.18: dovecot-dev rdepends on lz4, but it isn't a build dependency? [build-deps]
imsettings-1.6.8: imsettings rdepends on xfconf, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build dependency? [build-deps]
pinpoint-0.1.4+gitrAUTOINC+80a056c57e: pinpoint rdepends on librsvg, but it isn't a build dependency? [build-deps]
pure-ftpd-1.0.42: pure-ftpd rdepends on libsodium, but it isn't a build dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstapp-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstvideo-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstinterfaces-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstvideo-0.10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libxv, but it isn't a build dependency? [build-deps]
qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn't a build dependency? [build-deps]
qtwebengine-5.5.0+gitAUTOINC+qtwebengine: qtwebengine rdepends on qtlocation, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libavahi-client, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libavahi-common, but it isn't a build dependency? [build-deps]
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [build-deps]
uim-1.8.6: uim rdepends on gtk+3, but it isn't a build dependency? [build-deps]
webmin-1.750: webmin rdepends on perl-module-sdbm, but it isn't a build dependency? [build-deps]
xfce4-pulseaudio-plugin-0.2.3: xfce4-pulseaudio-plugin rdepends on libnotify, but it isn't a build dependency? [build-deps]


count: 21	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
collectd-5.5.0: /usr/lib/collectd/java.so_collectd contained in package collectd requires libjvm.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requires libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraffic requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in package gnome-desktop requires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]
gupnp-0.20.12: /usr/bin/gupnp-binding-tool_gupnp-dev contained in package gupnp-dev requires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]
libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package libbonobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file-rdeps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.so_libnewt-python contained in package libnewt-python requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
networkmanager-1.0.4: /usr/bin/nmtui-connect_networkmanager contained in package networkmanager requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.sh_numptyphysics contained in package numptyphysics requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
rrdtool-1.5.4: /usr/share/rrdtool/examples/stripes.py_rrdtool-perl contained in package rrdtool-perl requires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.so_tracker-nautilus-extension contained in package tracker-nautilus-extension requires libnautilus-extension.so.1()(64bit), but no providers found in its RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.so_tracker-nautilus-extension contained in package tracker-nautilus-extension requires libnautilus-extension.so.1, but no providers found in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils contained in package ubx-utils requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXu9koACgkQN1Ujt2V2gBxm9ACgnqUXBg2DoUYw4ERk+qEt9e9q
0ggAnjj9CUesy0RqFrlErPV2+uuNRSRm
=DL+E
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
