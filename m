Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 324CB60034;
	Sat, 21 Mar 2015 15:25:40 +0000 (UTC)
Received: by wibg7 with SMTP id g7so11637983wib.1;
	Sat, 21 Mar 2015 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=553s/vn3EgHRC2iDEurFFqYctbntGq5ZyY/GtRFL4Qw=;
	b=TlhFN2z7I/0/JUpkQDaqM+ivH76tS4ulHML3d01swRiwuSt+3gK4+X+cIfOVEPFwNh
	PxIDEA9mjCu5wds0F4reE5Uq+VNEv8Fz6UY2/xLI49zkIiPZGGZFptug/ZO6XKLbVALc
	j7Lrfs58Xh8LBsoVf4lUvXKJw8QhnZaT5SM0Uw6mdWz8v/rgvi1tMllfeTIPwEfUKQHW
	vxsjqyzXbirXCOn8d0ptKq3LcnT7Re/iqxO4C2sVxVbnwtWvS8PX8h7Rg/R7Wh7crq0V
	BiteW0F+JpWPdtqULT2RtKXPIkzNGViOCxDGmIPlz5qMKQi232FN7bUUF3WmNqv3yLzl
	0S0A==
X-Received: by 10.194.193.99 with SMTP id hn3mr171323503wjc.148.1426951541329; 
	Sat, 21 Mar 2015 08:25:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s19sm2811087wik.18.2015.03.21.08.25.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Mar 2015 08:25:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Mar 2015 16:25:49 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150321152549.GH4738@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-03-20
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
X-List-Received-Date: Sat, 21 Mar 2015 15:25:43 -0000
X-Groupsio-MsgNum: 63592
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RwGu8mu1E+uYXPWP"
Content-Disposition: inline

--RwGu8mu1E+uYXPWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This time we have complete QA issues list (I've deleted sstate before
triggering the build). Ignore version-going-backwards issues, because
this time I've also dropped PR server database which was growing too
big.

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2015-03-20 ==

INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150321_143658.log

=== common (2) ===
    * /meta-openembedded/meta-networking/recipes-support/geoip/geoip_1.6.0.bb, do_fetch
    * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, do_compile

=== common-x86 (0) ===

=== qemuarm (1) ===
    * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb, do_compile

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (7) ===
{| class=wikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150319_125730.log// || http://errors.yoctoproject.org:80/Errors/Build/5086/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150320_042650.log// || http://errors.yoctoproject.org:80/Errors/Build/5092/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150320_203548.log// || http://errors.yoctoproject.org:80/Errors/Build/5094/
|}

=== PNBLACKLISTs (60) ===
=== QA issues (74339) ===
{| class=wikitable
!| Count		||Issue
|-
||1	||libdir
|-
||23	||build-deps
|-
||3	||already-stripped
|-
||48	||file-rdeps
|-
||63	||textrel
|-
||74201	||version-going-backwards
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


count: 1	issue: libdir
chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libffmpegsumo.so [libdir]


count: 63	issue: textrel
chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/chromium/38.0.2125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so' has relocations in .text [textrel]
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


count: 23	issue: build-deps
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
fio-2.2.6: fio rdepends on numactl, but it isn't a build dependency? [build-deps]
fio-2.2.6: fio rdepends on zlib, but it isn't a build dependency? [build-deps]
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
mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependency? [build-deps]
netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a build dependency? [build-deps]
pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn't a build dependency? [build-deps]
qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn't a build dependency? [build-deps]
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [build-deps]
squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency? [build-deps]
sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
vlc-2.1.4: vlc rdepends on libsamplerate0, but it isn't a build dependency? [build-deps]
ypbind-mt-1.38: ypbind-mt rdepends on libsystemd, but it isn't a build dependency? [build-deps]


count: 48	issue: file-rdeps
apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit), libdvbapi.so()(64bit), libdvbcfg.so()(64bit), libdvben50221.so()(64bit), libdvbsec.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
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
fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
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
pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
perf-1.0: perf requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1, but no providers in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]


count: 74201	issue: version-going-backwards

--RwGu8mu1E+uYXPWP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUNjX0ACgkQN1Ujt2V2gBxDWQCfW7AZz4z7AVBAlhb3ddX4NZIB
vz0AniXJHD1Y6k+J8Y+RslAgvfHl7Yd9
=Zo5D
-----END PGP SIGNATURE-----

--RwGu8mu1E+uYXPWP--
