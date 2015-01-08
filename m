Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 855D2706D9;
	Thu,  8 Jan 2015 11:57:23 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l2so2169165wgh.7;
	Thu, 08 Jan 2015 03:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=CiG1Z6Ed053QZCNmIAlVB0mX3YRU2XUoqzwPvA/RRgo=;
	b=wOmty9O7M7p8fWEzSUdjPHpN87csm/qT9rbuxk89en0amrwXTL6Bzn2SvQDquXuojq
	JGj5hxvU+n2iwejvw8F/Q37lfwuflEz/A8Cq9IR6NF0BfM3HVxqt+7scKCUpc4iaX671
	WkLHdoN2opTM9CpUhBIZ2B8fJ7WzDKekeX6Y0uXw9jr3rnZFHq1mdTS8PfqMceRghuAt
	TCV2VrhUl8i4KfaQWJK7GXlSvzvxyVy7j193Ag6y3b6DE4wipRrLCRjBHXfJnk/TDcWN
	5L5vrYMxQvlMl8JpDT3BqlwQO73uY9CyDei7Nt5020B2qzupJWbdHK4Xgm897zyAkz18
	HhoQ==
X-Received: by 10.180.83.42 with SMTP id n10mr19093618wiy.54.1420718238809;
	Thu, 08 Jan 2015 03:57:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i3sm6256759wie.23.2015.01.08.03.57.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 03:57:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Jan 2015 12:57:22 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150108115722.GG3972@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-01-08
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
X-List-Received-Date: Thu, 08 Jan 2015 11:57:29 -0000
X-Groupsio-MsgNum: 61168
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t4apE7yKrX2dGgJC"
Content-Disposition: inline

--t4apE7yKrX2dGgJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've reverted font-util change from oe-core to resolve all font-* recipes failing, see
http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100461.html

Just as reminder this is using openembedded-core-contrib/jansa/master with these changes
which weren't merged to master yet:
pick 9fadeaf qemux86: Add identical qemux86copy variant for tests
pick 7d2d6ce WIP: Add KERNEL_EXTRA_ARGS?
pick 57be53f libsdl: Add support for libsdl-native
pick c283292 report-error: Allow to upload reports automatically
pick 655252d DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
pick c7db4d0 gdb: force arm mode
pick a683970 icu: force arm mode
pick 66870ff gst-ffmpeg: add dependency on libpostproc
pick 131dd6d libav: drop unused FFMPEG_LIBS and move libpostproc only to 0.8.11
pick ac92b08 xorg-app: add x11 to required DISTRO_FEATURES and cleanup dependencies
pick 78b33cc recipes: add x11 to required DISTRO_FEATURES
pick 890a3dc xorg-driver: add x11 to required DISTRO_FEATURES
pick 9bf0e73 recipes-qt: add x11 to required DISTRO_FEATURES
pick 4d7299c resolvconf: Drop allarch
pick 6db992d usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
pick d41ccc2 ppp-dialin: Drop allarch
pick 2e00590 linux-firmware: Drop allarch
pick f273cb7 initramfs-framework: Drop allarch
pick 347487f libav: drop older 0.8.* and use libav-9 by default
pick 0dc2e98 libpostproc: import from meta-oe
pick a17e622 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
pick 7818a65 Revert "font-util: Fix incorrect PKG_CONFIG_PATH"

I'm going to exclude qt5-opengles2-test from world, because it requires gles2
to be enabled.
I'll blacklist xfce4-vala, because it's broken for long time.
I'll drop pending change for openwsman.
There is pending patch for libutempter (needs few more changes)
perf is failing since last kernel changes, I've pinged Bruce to look.

So hopefully next time we'll get better status.

http://www.openembedded.org/wiki/Bitbake_World_Status

== Failed tasks 2015-01-07 ==

INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150108_115117.log

=== common (4) ===
    * /meta-openembedded/meta-networking/recipes-protocols/openwsman/openwsman_2.4.12.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb, do_compile
    * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb, do_configure
    * /meta-qt5/recipes-qt/examples/qt5-opengles2-test_git.bb, do_compile

=== common-x86 (0) ===

=== qemuarm (0) ===

=== qemux86 (0) ===

=== qemux86_64 (1) ===
    * /openembedded-core/meta/recipes-kernel/perf/perf.bb, do_compile

=== Number of failed tasks (13) ===
{| class=wikitable
|-
|| qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150107_141406.log// || http://errors.yoctoproject.org:80/Errors/Search/1/3939/
|-
|| qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150107_152738.log// || http://errors.yoctoproject.org:80/Errors/Search/1/3944/
|-
|| qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20150107_164049.log// || http://errors.yoctoproject.org:80/Errors/Search/1/3947/
|}

=== PNBLACKLISTs (50) ===

=== QA issues (48) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
|-
||0	||libdir
|-
||0	||textrel
|-
||48	||version-going-backwards
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse] ?= "depends on blacklisted libimobiledevice"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb:PNBLACKLIST[network-manager-applet] ?= "Depends on broken polkit-gnome"
meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?= "CONFLICT: 4 files conflict with gnome-keyring"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?= "Depends on broken polkit-gnome"
meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb:PNBLACKLIST[gnome-bluetooth] ?= "dbus-binding-tool fails with: Unable to load gnome-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a valid D-Bus interface name"
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
meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-gnome] ?= "Fails to build, m4:configure.ac:125: recursion limit of 1024 exceeded, use -L<N> to change it"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?= "Requires newer libav which has negative D_P"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?= "BROKEN: Doesn't work with B!=S"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-framework] ?= "BROKEN: Wasn't updated to work with B!=S, maybe incorrectly inherits autotools"
meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plugins] ?= "BROKEN: depends on broken maliit-framework"
meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
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


count: 0	issue: libdir


count: 0	issue: textrel


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 48	issue: version-going-backwards
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.18) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-dbg went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-dbg went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.18) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-dev went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-dev went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.18) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-doc went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-doc went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.18) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-locale went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-locale went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.18) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-staticdev went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.17) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for package luna-sysmgr-ipc-messages-staticdev went backwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.19 to 0:2.0.0-1+git0+79155bd3f1-r0.18) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-dbg went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-dbg went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-dev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-dev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-doc went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-doc went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-locale went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-locale went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-staticdev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-rule-datetime-staticdev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-dbg went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-dbg went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-dev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-dev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-doc went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-doc went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-locale went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-locale went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-staticdev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.123) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rule-network-staticdev went backwards which would break package feeds from (0:1.0-r0.125 to 0:1.0-r0.124) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.105) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dbg went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dbg went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.105) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dev went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dev went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.105) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-doc went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-doc went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.105) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.105) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.104) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev went backwards which would break package feeds from (0:1.34-r8.106 to 0:1.34-r8.105) [version-going-backwards]

--t4apE7yKrX2dGgJC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSucKIACgkQN1Ujt2V2gBzLVQCfRuG2Pwrw7XLc8+Fa9nzF6JQb
IMoAnRDwmW7TiPO7Vj3+81RLvNAwX4pM
=lnw5
-----END PGP SIGNATURE-----

--t4apE7yKrX2dGgJC--
