Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6D214724C9;
	Tue,  9 Dec 2014 10:03:38 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so1100719wiw.4
	for <multiple recipients>; Tue, 09 Dec 2014 02:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=L7sF9TxgA26Mos0ZF0nq7e3hdPtcNA8JC8GNR6laX3U=;
	b=a6J5+CTVSv5/LoyDR15AvIAuteTCCR7iAkYobv8ejsS/vh30CIpMI3FnGU5tRY0//Y
	pn3Wv7goHlTXqmhY/j8Th0GYdqg1tCdsSR1xtTfqRSq0dscjIrULvE09A3NNWxEvXTj4
	bQUn0oXNm/edh7Lnc7Ooe2jLO9udCMtCF33UxyCRKMueb1r94/r9NvRtkPEfDK8We3SR
	VyaWAj5FbXtgxMRMAYiGZSDvLF1S5OTgJVDYN4ZpMPz/Ec6X3I4Y1DzuSkMz9HfkoEpb
	oTi8Ao+DcVQJYv881cj/XTgU2Py7xYWjHiaAsdP7xJld8+IGc0mgEeU7aESU6HzGRcpu
	NamA==
X-Received: by 10.180.9.111 with SMTP id y15mr30050003wia.33.1418119418151;
	Tue, 09 Dec 2014 02:03:38 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex8sm1039642wjd.41.2014.12.09.02.03.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:03:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:03:38 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141209100338.GA2470@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-12-08
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
X-List-Received-Date: Tue, 09 Dec 2014 10:03:45 -0000
X-Groupsio-MsgNum: 60298
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2014-12-08 ==

INFO: jenkins-job.sh-1.0.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20141208_204850.log

=== common (11) ===
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb, do_compile
    * /meta-openembedded/meta-networking/recipes-daemons/netkit-telnet/netkit-telnet_0.17.bb, do_install
    * /meta-openembedded/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb, do_unpack
    * /meta-openembedded/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.3.4.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb, do_patch
    * /meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb, do_configure
    * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb, do_configure
    * /meta-qt5/recipes-qt/qt5/qtsystems_git.bb, do_configure

=== common-x86 (2) ===
    * /meta-openembedded/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb, do_compile
    * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=== qemuarm (1) ===
    * /meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/android-audiosystem_bzr.bb, do_compile

=== qemux86 (2) ===
    * /meta-openembedded/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb, do_compile

=== qemux86_64 (1) ===
    * /meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb, do_compile

=== Number of failed tasks (41) ===
{| class=wikitable
|-
||qemuarm	||12	||http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141206_215110.log//||http://errors.yoctoproject.org:80/Errors/Search/1/3475/
|-
||qemux86	||15	||http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141207_130042.log//||http://errors.yoctoproject.org:80/Errors/Search/1/3476/
|-
||qemux86_64	||14	||http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20141208_045337.log//||
|}

=== PNBLACKLISTs (51) ===

=== QA issues (93) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||version-going-backwards
|-
||1	||libdir
|-
||16	||build-deps
|-
||17	||textrel
|-
||3	||already-stripped
|-
||56	||file-rdeps
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
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
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACKLIST[lksctp-tools] ?= "BROKEN: fails to link against sctp_connectx symbol"
meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNBLACKLIST[libimobiledevice] ?= "cannot run test program while cross compiling"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
meta-oe/recipes-extended/acpica/acpitests_20140828.bb:PNBLACKLIST[acpitests] ?= "fails to find string.h since sysroot poisoning was added in internal toolchain"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-extended/zsh/zsh.inc:PNBLACKLIST[zsh] ?= "BROKEN: doesn't build with B!=S (gnu-configize executed in ${B})"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ??= "Requires newer libav which has negative D_P"
meta-oe/recipes-navigation/omgps/omgps_svn.bb:PNBLACKLIST[omgps] ?= "BROKEN: sound.c:61:35: error: 'saveptr' may be used uninitialized in this function [-Werror=maybe-uninitialized]"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?= "BROKEN: Doesn't work with B!=S"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/libftdi/libftdi_0.19.bb:PNBLACKLIST[libftdi] ?= "BROKEN: needs to be updated to detect libusb with pkg-config instead of libusb-config"
meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-framework] ?= "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plugins] ?= "BROKEN: depends on broken maliit-framework"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
meta-webserver/recipes-php/modphp/modphp5.inc:PNBLACKLIST[modphp] ?= "CONFLICT: 466 header files conflict with php"
meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb:PNBLACKLIST[xdebug] ?= "CONFLICT: depends on blocked modphp"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] = "rdepends on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
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


count: 17	issue: textrel
chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/chromium/38.0.2125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.1: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.1: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
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
qtwebkit-5.3.99+5.4.0-rc1+gitAUTOINC+18cb1a3ae9: ELF binary '/tmp/work/i586-oe-linux/qtwebkit/5.3.99+5.4.0-rc1+gitAUTOINC+18cb1a3ae9-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]
webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text [textrel]


count: 16	issue: build-deps
collectd-5.4.1: collectd rdepends on libesmtp, but it isn't a build dependency? [build-deps]
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build dependency? [build-deps]
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
libssh-0.6.3: libssh rdepends on krb5, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build dependency? [build-deps]
log4c-1.2.4: log4c rdepends on expat, but it isn't a build dependency? [build-deps]
mpd-0.19.3: mpd rdepends on libsmbclient, but it isn't a build dependency? [build-deps]
netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
proftpd-1.3.4b: proftpd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency? [build-deps]
stunnel-5.07: stunnel rdepends on liblzma, but it isn't a build dependency? [build-deps]
stunnel-5.07: stunnel rdepends on libsystemd, but it isn't a build dependency? [build-deps]
sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]


count: 56	issue: file-rdeps
chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
dpkg-1.17.4: dpkg requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
drbd-8.4.4: drbd requires /bin/bash, /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
drbd-8.4.4: drbd requires /usr/bin/perl, /bin/bash, but no providers in its RDEPENDS [file-rdeps]
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
giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [file-rdeps]
gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no providers in its RDEPENDS [file-rdeps]
lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no providers in its RDEPENDS [file-rdeps]
logcheck-1.3.17: logcheck requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
logwatch-7.4.1: logwatch requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in its RDEPENDS [file-rdeps]
php-5.4.33: php requires /tmp/work/armv5te-oe-linux-gnueabi/php/5.4.33-r0/image/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]
php-5.4.33: php requires /tmp/work/core2-64-oe-linux/php/5.4.33-r0/image/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]
php-5.4.33: php requires /tmp/work/i586-oe-linux/php/5.4.33-r0/image/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]
pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
stunnel-5.07: stunnel requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.so.1, but no providers in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]


count: 0	issue: version-going-backwards

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSGyPoACgkQN1Ujt2V2gBxZ/QCcCONQxQsxBUSIt9bmezLlzMOK
MfMAoIjn1v7GSJlVM+HwRd7D8zero6Fm
=wNNs
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
