Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E3C1E73D3B;
	Mon, 13 Apr 2015 13:43:57 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so81378936wgy.2;
	Mon, 13 Apr 2015 06:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=+bi0t+PwhZyy6s5VjAYG9c4T3twwT/ZzGd5KGtwSJiM=;
	b=x3F//ZLrs77EdUD/PJFnDofhnCzXUYF0OkNBzwKg/HZkWr2k2aqABazYlxB9yPQOrp
	IuIujthdOa0EY8UIfBkNtjvpuIsjV2CKnUrN72oqDDqL1XNl+pXCpoHF66ajY/qpetL1
	Yi+9V5SQyGUMvux4UiZSD8oooSuzdp/tSgQ5NrOWBK2kqFRZKLWRW2wlpMXfod5jmbOy
	pUVBlEsreIev0ofnQMR/Xa+e8bfEZJQx4Z8JspYq9mR1kS3PIWkL0+K5L/8YQo8AoeL9
	l82Odzn4NV/rJR9BYq2yvfVnhikE9HJ8/yY06IC1hRYTagGZLdgyuFB+oEthZWBR9/TK
	Oszg==
X-Received: by 10.180.92.161 with SMTP id cn1mr21378554wib.91.1428932637349;
	Mon, 13 Apr 2015 06:43:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id w5sm11583332wiz.11.2015.04.13.06.43.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 06:43:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Apr 2015 15:44:00 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150413134400.GF2330@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-04-12
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
X-List-Received-Date: Mon, 13 Apr 2015 13:43:59 -0000
X-Groupsio-MsgNum: 64302
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline

--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2015-04-12 ==

INFO: jenkins-job.sh-1.2.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150413_120812.log

=== common (4) ===
    * /meta-openembedded/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb, do_compile
    * /meta-qt5/recipes-qt/qt5/qtwebkit_5.4.1.bb, do_compile
    * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, do_compile

=== common-x86 (1) ===
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_compile

=== qemuarm (2) ===
    * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb, do_compile

=== qemux86 (1) ===
    * /meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb, do_compile

=== qemux86_64 (1) ===
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure

=== Number of failed tasks (18) ===
{| class=wikitable
|-
|| qemuarm 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150410_200250.log// || http://errors.yoctoproject.org:80/Errors/Build/5292/
|-
|| qemux86 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150411_103819.log// || http://errors.yoctoproject.org:80/Errors/Build/5293/
|-
|| qemux86_64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150412_024005.log// || http://errors.yoctoproject.org:80/Errors/Build/5295/
|}

=== PNBLACKLISTs (60) ===

=== QA issues (134) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||libdir
|-
||0	||version-going-backwards
|-
||22	||build-deps
|-
||3	||already-stripped
|-
||46	||file-rdeps
|-
||63	||textrel
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
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?= "Depends on broken polkit-gnome"
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
meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNBLACKLIST[libimobiledevice] ?= "cannot run test program while cross compiling"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?= "Not comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb:PNBLACKLIST[nodejs4] ?= "Used only by currently blacklisted cloud9 and fails to build for qemuarm with thumb: error: #error For thumb inter-working we require an architecture which supports blx"
meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?= "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends on blacklisted kernel-module-ktapvm"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?= "BROKEN: Doesn't work with B!=S"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-framework] ?= "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plugins] ?= "BROKEN: depends on broken maliit-framework"
meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb:PNBLACKLIST[start-stop-daemon] ?= "BROKEN: fails because of gettext, partial fix is available here http://patchwork.openembedded.org/patch/89867/"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-vala] ?= "Fails to build since vala upgrade to 0.26.1"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?= "broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] = "rdepends on blacklisted mplayer2"
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


count: 63	issue: textrel
cef3-280796: ELF binary '/tmp/work/i586-oe-linux/cef3/280796-r0/packages-split/cef3/usr/lib/libffmpegsumo.so.0.0.1' has relocations in .text [textrel]
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
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudiodev.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_tw.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_test.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_elementtree.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-misc/usr/lib/python3.3/lib-dynload/_posixsubprocess.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload/_multiprocessing.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-readline/usr/lib/python3.3/lib-dynload/readline.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-resource/usr/lib/python3.3/lib-dynload/resource.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudiodev.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_cn.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_test.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_elementtree.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-misc/usr/lib/python3.3/lib-dynload/_md5.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload/_multiprocessing.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-readline/usr/lib/python3.3/lib-dynload/readline.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-resource/usr/lib/python3.3/lib-dynload/resource.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpython-33m.so' has relocations in .text [textrel]
qtwebengine-5.4.1: ELF binary '/tmp/work/i586-oe-linux/qtwebengine/5.4.1-r0/packages-split/qtwebengine-plugins/usr/lib/qt5/plugins/qtwebengine/libffmpegsumo.so' has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]
webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text [textrel]


count: 22	issue: build-deps
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
fio-2.2.6: fio rdepends on numactl, but it isn't a build dependency? [build-deps]
fio-2.2.6: fio rdepends on zlib, but it isn't a build dependency? [build-deps]
geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependency? [build-deps]
glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build dependency? [build-deps]
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
grub-efi-2.00: grub-efi rdepends on fuse, but it isn't a build dependency? [build-deps]
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build dependency? [build-deps]
lirc-0.9.2: lirc rdepends on libx11, but it isn't a build dependency? [build-deps]
lirc-0.9.2: lirc-plugins rdepends on libjack, but it isn't a build dependency? [build-deps]
lirc-0.9.2: lirc-plugins rdepends on libusb-compat, but it isn't a build dependency? [build-deps]
lirc-0.9.2: lirc-plugins rdepends on portaudio-v19, but it isn't a build dependency? [build-deps]
netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a build dependency? [build-deps]
pkcs11-helper-1.1so()(64bit), but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so, libdvbsec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit), libdvbapi.so()(64bit), libdvbcfg.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit), libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
gateone-1.2: gateone requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [file-rdeps]
gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
ipvsadm-1.26: ipvsadm requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
lirc-0.9.2: lirc requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no providers in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in its RDEPEN.1, but no providers in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]


count: 0	issue: version-going-backwards

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUryCAACgkQN1Ujt2V2gBxfswCaAmiHFTFO7/X/D2QnhafSx5Ix
Cq0AniPz/NR7+47krvZDt6RYLBmiFGbk
=OpHc
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--
