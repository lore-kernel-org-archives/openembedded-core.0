Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD0D71637;
	Thu,  5 Mar 2015 14:22:52 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so3246298wiw.1;
	Thu, 05 Mar 2015 06:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=oDOkBZCYN+d1UF8eMBExp4lp4ubTh8UoEDk5ndbrprc=;
	b=t+LWuXW3m2bJXQmpQvxj6+/OuRTCkmK1ov6RlTuyJ5447zOAJfJZTTacSzsk47vEuF
	3YzE/69e0apzs3R4XIEf0xOJU2Gt1ylQXxClQieC/IUatRI4RdC4r9O3cjr5/3GpV+xQ
	ZXU8YJUwRCXV/lEqiYXvlPtH8oj2yt2YBDdaDYnGkk6VIrhx7eeV+Bxy7RStkd4KJbAh
	hgG1iY/AKzPLcV/JcAzxQEPMD8LxfRUtXIOrzgQbEbOSxDSlq5/A8lWpABCdC6/iyX6F
	hxHQqt6SszIc4DH2lSYltBerK2wPrO4BBC8o4IRb+UdNO4W/i3WInjlHWHsCF1mHcH4p
	Sffg==
X-Received: by 10.194.62.198 with SMTP id a6mr19460080wjs.90.1425565373208;
	Thu, 05 Mar 2015 06:22:53 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e18sm10733825wjz.27.2015.03.05.06.22.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 06:22:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 15:22:57 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150305142257.GT2337@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-03-05
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
X-List-Received-Date: Thu, 05 Mar 2015 14:22:56 -0000
X-Groupsio-MsgNum: 63001
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GMArzDD+OGn24EFp"
Content-Disposition: inline

--GMArzDD+OGn24EFp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

http://www.openembedded.org/wiki/Bitbake_World_Status

I had to build qemux86-64 kernel 5 times until it was successful, for qemux86 I wasn't so patient and I've left it failing.

== Failed tasks 2015-03-05 ==

INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150305_141528.log

=== common (4) ===
    * /meta-openembedded/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb, do_compile
    * /meta-smartphone/meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_0.12.0.bb, do_compile
    * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, do_compile

=== common-x86 (1) ===
    * /meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile

=== qemuarm (5) ===
    * /meta-openembedded/meta-networking/recipes-support/nis/yp-tools_3.3.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb, do_compile
    * /meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/android-audiosystem_bzr.bb, do_compile

=== qemux86 (1) ===
    * /openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.19.bb, do_kernel_configme

=== qemux86_64 (1) ===
    * /meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_configure

=== Number of failed tasks (22) ===
{| class=wikitable
|-
|| qemuarm 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150303_185117.log/ || http://errors.yoctoproject.org:80/Errors/Build/4958/
|-
|| qemux86 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150304_114123.log/ || http://errors.yoctoproject.org:80/Errors/Build/4961/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150305_125008.log/ || http://errors.yoctoproject.org:80/Errors/Build/4974/
|}

=== PNBLACKLISTs (51) ===

=== QA issues (67) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||1	||libdir
|-
||10	||build-deps
|-
||4	||file-rdeps
|-
||4	||textrel
|-
||48	||version-going-backwards
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. invalid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: 'defaault'. "default" state must always be first."
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
meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNBLACKLIST[libimobiledevice] ?= "cannot run test program while cross compiling"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?= "BROKEN: Doesn't work with B!=S"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-framework] ?= "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plugins] ?= "BROKEN: depends on broken maliit-framework"
meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
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
count: 0	issue: already-stripped


count: 1	issue: libdir
chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libffmpegsumo.so [libdir]


count: 4	issue: textrel
chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/chromium/38.0.2125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
qtwebengine-5.4.1: ELF binary '/tmp/work/i586-oe-linux/qtwebengine/5.4.1-r0/packages-split/qtwebengine-plugins/usr/lib/qt5/plugins/qtwebengine/libffmpegsumo.so' has relocations in .text [textrel]


count: 10	issue: build-deps
lirc-0.9.2: lirc rdepends on libx11, but it isn't a build dependency? [build-deps]
lirc-0.9.2: lirc-plugins rdepends on libjack, but it isn't a build dependency? [build-deps]
lirc-0.9.2: lirc-plugins rdepends on libusb-compat, but it isn't a build dependency? [build-deps]
lirc-0.9.2: lirc-plugins rdepends on portaudio-v19, but it isn't a build dependency? [build-deps]
mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependency? [build-deps]
opencv-2.4.9+gitAUTOINC+df8e28283f: libopencv-highgui rdepends on jasper, but it isn't a build dependency? [build-deps]
opencv-2.4.9+gitAUTOINC+df8e28283f: libopencv-highgui rdepends on libdc1394, but it isn't a build dependency? [build-deps]
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [build-deps]
vlc-2.1.4: vlc rdepends on libsamplerate0, but it isn't a build dependency? [build-deps]
vlc-2.1.4: vlc rdepends on libssh2, but it isn't a build dependency? [build-deps]


count: 4	issue: file-rdeps
lirc-0.9.2: lirc requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
nodejs-0.12.0: nodejs-npm requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
perf-1.0: perf requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1, but no providers in its RDEPENDS [file-rdeps]


count: 48	issue: version-going-backwards
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.34 to 0:2.0.1-2+git0+3a3169ca28-r0.33) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub-dbg went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.34 to 0:2.0.1-2+git0+3a3169ca28-r0.33) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub-dev went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.34 to 0:2.0.1-2+git0+3a3169ca28-r0.33) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub-doc went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.34 to 0:2.0.1-2+git0+3a3169ca28-r0.33) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub-locale went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.34 to 0:2.0.1-2+git0+3a3169ca28-r0.33) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for package cpushareholder-stub-staticdev went backwards which would break package feeds from (0:2.0.1-2+git0+3a3169ca28-r0.34 to 0:2.0.1-2+git0+3a3169ca28-r0.33) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl went backwards which would break package feeds from (0:2.16-r0.104 to 0:2.16-r0.103) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-dbg went backwards which would break package feeds from (0:2.16-r0.104 to 0:2.16-r0.103) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-dev went backwards which would break package feeds from (0:2.16-r0.104 to 0:2.16-r0.103) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-doc went backwards which would break package feeds from (0:2.16-r0.104 to 0:2.16-r0.103) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-locale went backwards which would break package feeds from (0:2.16-r0.104 to 0:2.16-r0.103) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-staticdev went backwards which would break package feeds from (0:2.16-r0.104 to 0:2.16-r0.103) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl went backwards which would break package feeds from (0:1.03-r0.103 to 0:1.03-r0.102) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-dbg went backwards which would break package feeds from (0:1.03-r0.103 to 0:1.03-r0.102) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-dev went backwards which would break package feeds from (0:1.03-r0.103 to 0:1.03-r0.102) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-doc went backwards which would break package feeds from (0:1.03-r0.103 to 0:1.03-r0.102) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-locale went backwards which would break package feeds from (0:1.03-r0.103 to 0:1.03-r0.102) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-staticdev went backwards which would break package feeds from (0:1.03-r0.103 to 0:1.03-r0.102) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl went backwards which would break package feeds from (0:1.997-r0.101 to 0:1.997-r0.100) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-dbg went backwards which would break package feeds from (0:1.997-r0.101 to 0:1.997-r0.100) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-dev went backwards which would break package feeds from (0:1.997-r0.101 to 0:1.997-r0.100) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-doc went backwards which would break package feeds from (0:1.997-r0.101 to 0:1.997-r0.100) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-locale went backwards which would break package feeds from (0:1.997-r0.101 to 0:1.997-r0.100) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-perl-staticdev went backwards which would break package feeds from (0:1.997-r0.101 to 0:1.997-r0.100) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.56 to 0:2.0.0-1+git0+79155bd3f1-r0.55) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-dbg went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.56 to 0:2.0.0-1+git0+79155bd3f1-r0.55) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-dev went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.56 to 0:2.0.0-1+git0+79155bd3f1-r0.55) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-doc went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.56 to 0:2.0.0-1+git0+79155bd3f1-r0.55) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-locale went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.56 to 0:2.0.0-1+git0+79155bd3f1-r0.55) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-staticdev went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.56 to 0:2.0.0-1+git0+79155bd3f1-r0.55) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package luna-webkit-api went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.34 to 0:2.0.0-1+git0+d0b393ac0c-r0.33) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package luna-webkit-api-dbg went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.34 to 0:2.0.0-1+git0+d0b393ac0c-r0.33) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package luna-webkit-api-dev went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.34 to 0:2.0.0-1+git0+d0b393ac0c-r0.33) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package luna-webkit-api-doc went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.34 to 0:2.0.0-1+git0+d0b393ac0c-r0.33) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package luna-webkit-api-locale went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.34 to 0:2.0.0-1+git0+d0b393ac0c-r0.33) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package luna-webkit-api-staticdev went backwards which would break package feeds from (0:2.0.0-1+git0+d0b393ac0c-r0.34 to 0:2.0.0-1+git0+d0b393ac0c-r0.33) [version-going-backwards]
rdx-utils-stub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package rdx-utils-stub went backwards which would break package feeds from (0:2.0.0-1+git0+51341059f7-r0.34 to 0:2.0.0-1+git0+51341059f7-r0.33) [version-going-backwards]
rdx-utils-stub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package rdx-utils-stub-dbg went backwards which would break package feeds from (0:2.0.0-1+git0+51341059f7-r0.34 to 0:2.0.0-1+git0+51341059f7-r0.33) [version-going-backwards]
rdx-utils-stub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package rdx-utils-stub-dev went backwards which would break package feeds from (0:2.0.0-1+git0+51341059f7-r0.34 to 0:2.0.0-1+git0+51341059f7-r0.33) [version-going-backwards]
rdx-utils-stub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package rdx-utils-stub-doc went backwards which would break package feeds from (0:2.0.0-1+git0+51341059f7-r0.34 to 0:2.0.0-1+git0+51341059f7-r0.33) [version-going-backwards]
rdx-utils-stub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package rdx-utils-stub-locale went backwards which would break package feeds from (0:2.0.0-1+git0+51341059f7-r0.34 to 0:2.0.0-1+git0+51341059f7-r0.33) [version-going-backwards]
rdx-utils-stub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package rdx-utils-stub-staticdev went backwards which would break package feeds from (0:2.0.0-1+git0+51341059f7-r0.34 to 0:2.0.0-1+git0+51341059f7-r0.33) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common went backwards which would break package feeds from (0:1.34-r8.145 to 0:1.34-r8.144) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dbg went backwards which would break package feeds from (0:1.34-r8.145 to 0:1.34-r8.144) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dev went backwards which would break package feeds from (0:1.34-r8.145 to 0:1.34-r8.144) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-doc went backwards which would break package feeds from (0:1.34-r8.145 to 0:1.34-r8.144) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went backwards which would break package feeds from (0:1.34-r8.145 to 0:1.34-r8.144) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev went backwards which would break package feeds from (0:1.34-r8.145 to 0:1.34-r8.144) [version-going-backwards]


--GMArzDD+OGn24EFp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4ZsEACgkQN1Ujt2V2gBxcmwCglo88n6ueW8wZCM5Org14xogV
izwAoJ6LZr2e24tv/Nv4/Bgw+tT9tbMJ
=neLS
-----END PGP SIGNATURE-----

--GMArzDD+OGn24EFp--
