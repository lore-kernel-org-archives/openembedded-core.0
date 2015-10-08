Return-Path: <akuster808@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7E92760232
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 08:49:02 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so15329684wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ykW5oKkxhTdiLjZCYL6+12bbty0fgTjyliPOyZHWd70=;
	b=q2g1z7Px+WLV4UuMvjJiGIUFbB3sPFEhSCFcSJoWIdrO1dWFwvLzWRhc9vSLhsa86Y
	wSBeTZp0RKKKrp1zwXDmYJJ+/l7Utp3ioQyy8fQUO3J6uic3ODpl+hbuA8+KdXWON10n
	u57vdyMUXB3JFDpTJWan7U8GiNQriKt3FxMwHXyRhBj41fHDxUtH1RtHY8/UAM7GyP15
	ab7l0+qFDlpOsbsAelsHpeWwhvQPpWpyOTX4JTjmTEj51cG7hUqLsCE8VS/NC6TK2HbY
	63ahDOKzRUdB1S+9Fk/nijdn3ypk3yH7rk6PQFctxAl5113xLmBpSpH+xqLZ34PRj2HI
	Gh/w==
X-Received: by 10.180.86.231 with SMTP id s7mr2449682wiz.15.1444294142305;
	Thu, 08 Oct 2015 01:49:02 -0700 (PDT)
Received: from [10.200.207.200] ([89.101.192.72])
	by smtp.googlemail.com with ESMTPSA id
	xt1sm44632798wjb.32.2015.10.08.01.49.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 01:49:00 -0700 (PDT)
Message-ID: <56162DF4.2040609@gmail.com>
Date: Thu, 08 Oct 2015 01:48:52 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20151006220431.GB2383@jama>
In-Reply-To: <20151006220431.GB2383@jama>
Subject: Re: State of bitbake world, Failed tasks 2015-10-05
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
X-List-Received-Date: Thu, 08 Oct 2015 08:49:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 10/06/2015 03:04 PM, Martin Jansa wrote:
> On Sat, Oct 03, 2015 at 03:33:43PM +0200, Martin Jansa wrote:
>> On Fri, Sep 18, 2015 at 01:54:58PM +0200, Martin Jansa wrote:
>>> On Wed, Aug 26, 2015 at 03:56:04PM +0200, Martin Jansa wrote:
>>>> Time for even more PNBLACKLISTs..
>>>
>>> And it got even worse.
>>
>> PNBLACKLISTs sent to ML, they will be included in next report.
> 
> And we'll need a bit more of them, status isn't good for release.
> 
> == Tested changes (not included in master yet) - bitbake ==
> b4175ee world-image: add extra target
> 
> == Tested changes (not included in master yet) - openembedded-core ==
> 14245a4 directfb: add fPIC to CFLAGS
> b34f989 guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable thumb where it fails for qemuarm
> f10333c icu: force arm mode
> e890757 gdb: force arm mode
> f8d8210 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
> 8fd5772 libsdl: Add support for libsdl-native
> 083ab12 WIP: Add KERNEL_EXTRA_ARGS?
> 86627e0 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
> 1814907 report-error: Allow to upload reports automatically
> 74ea599 qemux86: Add identical qemux86copy variant for tests
> 
> == Tested changes (not included in master yet) - meta-openembedded ==
> b01f509 gnome-panel*: Use GFDL-1.1 instead of GFDLv1.1
> e2b99e5 meta-oe: recipes-devtools: add libubox recipe
> b050b34 meta-networking: recipes-connectivity: add relayd recipe
> ed8e330 mongodb: receipe fixed, removed from blacklist and now cross compiles to arm.
> fbf5a74 meta-oe: recipes-devtools: add debootstrap recipe
> 8b82346 meta-oe: recipes-graphics: add libvncserver recipe
> 41b32ab efibootmgr: 0.6.0 -> 0.12
> 34a1fee efivar: 0.7 -> 0.21
> 9e0ac17 apache2: cleanup buildpaths for target stuffs
> f52c392 tornado: upgrade to 4.2.1
> 7010d31 tsocks: Add tsocks to meta-network/recipes-protocols
> ef8b461 networkmanager: fix installed-vs-shipped warning
> 1d3abd5 polkit: fix relocation of polkit binaries
> 8706b1e mariadb: Easy linkage of code using libmysqlclient_r
> 7079951 lvm2: add --with-systemdsystemunitdir in configuration
> 9d0c38a gd: cleanup buildpaths from gdlib.pc
> ce74f9e squid: disable atomic operations for powerpc/mips
> 7a0b814 inotify-tools: Add
> 62b585f kexecboot_0.6: fix build with gcc 5
> 1990110 opencore-amr: add new recipe
> fb35732 libiec61883: add new recipe
> 28d09a9 libavc1394: add new recipe
> f1f5389 aalib: add new recipe
> 6a02bff cdparanoia: add new recipe
> eca22d4 libgudev: skip recipe for distros not using systemd as init
> 1e9fcd2 llvm.inc: fix PACKAGES_DYNAMIC
> 7994156 webkit-efl: fix build with cmake-3*
> 3c7c278 sblim-sfcCommon: rename to sblim-sfc-common
> 5cdede5 libdbi-drivers: Blacklist, fails to build with gcc-5
> e459e1f libuio: Blacklist, fails to build with gcc-5
> d71e3dd mplayer2: Blacklist, fails to build with gcc-5
> 0fc22b1 mkvtoolnix: Blacklist, fails to build with gcc-5
> dbdb17c gtkextra: blacklist, fails to build with gcc-5
> cab667f gdal: blacklist, fails to build with gcc-5
> db887eb elmdentica, azy: blacklist because they are old and fail to build with gcc-5
> 5a5ea63 qt-creator: blacklist because fails to build and conflicts with qt5-creator
> 35b9a08 gnome-power-manager: Blacklist not compatible with current libnotify
> 80a024b epdf: Blacklist, old and not compatible with current poppler
> 5833e5f sessreg: Blacklist, fails to build man pages
> 9c7625c libnet-dns-perl: blacklist, fails to build with current perl
> 1505bb0 packagekit: blacklist, depends on disabled libopkg API
> ede1f58 nautilus3: Fix build with B != S
> f126b0b wayland-fits: Add recipe
> 908ebb3 efl: support wayland, egl
> 2b93c87 pyroute2: update to 0.3.14, fix depends, fix license
> 8aa5510 modemmanager: depend on libgudev not on udev
> 4bd1745 networkmanager: depend on libgudev not on udev
> 94411dc libgudev: exclude use with systemd <=220
> ea3e661 xfce4-screenshooter: ensure output directory is created
> 1ea1b9c plymouth: building documatation sometimes fails to download so disable it
> 5a3ce32 sshfs-fuse: correct definition of S
> 7371f20 lldpd: Add recipe
> f6451da opencv: backport commit to compile with ppc
> 779eb5e xl2tpd: 1.3.0 -> 1.3.6
> 4165253 net-snmp: Fix build with gcc5
> 1c31bfa inetutils: fix rcp to work with large file
> 
> == Tested changes (not included in master yet) - meta-qt5 ==
> 51b4620 maliit-framework-qt5: fixed paths and enabled qt5-inputcontext
> d8a4d97 qtwebengine: enable cmake
> 394345c qmake5_paths, qtbase: add OE_QMAKE_PATH_QT_FONTS
> 8f765ed qt5: upgrade to latest revision in 5.5 branches
> 
> == Tested changes (not included in master yet) - meta-browser ==
> 
> == Tested changes (not included in master yet) - meta-webos-ports ==
> 2916688 mesa: backport patch to fix build with gcc-5
> f813a09 Revert "lxc: Drop imported recipes from meta-virtualization"
> b56902f lxc: Drop imported recipes from meta-virtualization
> d9f8ffd mesa: re-enabled fbdef, gallium-egl, gallium-gbm in 10.3.7 version
> 1ede816 mesa: temporary disable fbdev EGL platform
> 162ab4b mesa: remove unsupported PACKAGECONFIGs
> 
> == Tested changes (not included in master yet) - meta-smartphone ==
> f3eb29a linux-nokia900-meego: defconfig cleanup
> 945977f linux-nokia900-meego: nokia900-defconfig-min
> 854d837 linux-nokia900-meego: nokia900-defconfig-complete
> 0f3b811 linux-nokia900-meego: nokia900-defconfig-min
> 0c547b4 linux-nokia900-meego: upgrade to 3.13 from Arch linux
> 0cacc0b image_types_fastboot: add skeleton for fastboot image_type
> 
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date		     !!colspan='3'|Failed tasks			    !!colspan='12'|QA !!Comment
> |-
> ||		||qemuarm	||qemux86	||qemux86_64	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||	
> |-
> ||2015-10-05	||12	||14	||12	||3		||0		||20		||35		||31		||0		||36		||1		||1		||1		||3		||0		||	
> |}
> 
> http://www.openembedded.org/wiki/Bitbake_World_Status
> 
> == Failed tasks 2015-10-05 ==
> 
> INFO: jenkins-job.sh-1.4.5 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20151006_212926.log
> 
> === common (8) ===
>     * /meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb, do_populate_sysroot
>     * /meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb, do_fetch
>     * /meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_compile
>     * /meta-smartphone/meta-shr/recipes-shr/games/mokomaze_0.5.5.bb, do_configure
> 
> === common-x86 (2) ===
>     * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_compile
>     * /openembedded-core/meta/recipes-gnome/gcr/gcr_3.16.0.bb, do_populate_sysroot
> 
> === qemuarm (4) ===
>     * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb, do_compile

I will take a look into this one.

>     * /openembedded-core/meta/recipes-gnome/gcr/gcr_3.16.0.bb, do_compile
>     * /openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb, do_compile
>     * /openembedded-core/meta/recipes-support/libunwind/libunwind_1.1.bb, do_compile
> 
> === qemux86 (4) ===
>     * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
>     * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb, do_compile
>     * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb, do_compile

I thought the last update fixed this?? will double check.


- armin
>     * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb, do_compile
> 
> === qemux86_64 (2) ===
>     * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure
>     * /meta-openembedded/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb, do_compile
> 
> === Number of failed tasks (38) ===
> {| class=wikitable
> |-
> || qemuarm 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20151003_133632.log// || http://errors.yoctoproject.org:80/Errors/Build/9033/
> |-
> || qemux86 	|| 14	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20151004_155627.log// || http://errors.yoctoproject.org:80/Errors/Build/9050/
> |-
> || qemux86_64 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.20151005_182545.log// || http://errors.yoctoproject.org:80/Errors/Build/9059/
> |}
> 
> === PNBLACKLISTs (78) ===
> 
> === QA issues (131) ===
> {| class=wikitable
> !| Count		||Issue
> |-
> ||0	||libdir
> |-
> ||0	||pkgname
> |-
> ||0	||version-going-backwards
> |-
> ||1	||installed-vs-shipped
> |-
> ||1	||symlink-to-sysroot
> |-
> ||1	||unknown-configure-option
> |-
> ||20	||textrel
> |-
> ||3	||already-stripped
> |-
> ||3	||invalid-pkgconfig
> |-
> ||31	||file-rdeps
> |-
> ||35	||build-deps
> |-
> ||36	||host-user-contaminated
> |}
> 
> 
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. invalid state name: 'off'. "default" state must always be first."
> meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy"
> meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5"
> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: 'defaault'. "default" state must always be first."
> meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?= "BROKEN: fails to build with newer poppler"
> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with more strict ejde_cc from efl-1.13"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gnome-menus3] ?= "CONFLICT: 24 files are conflicting with gnome-menus"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
> meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:PNBLACKLIST[gnome-power-manager] ?= "BROKEN: not compatible with current libnotify"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S"
> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
> meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoolnix] ?= "BROKEN: Failx to build with gcc-5"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb:PNBLACKLIST[snort] ?= "BROKEN: autotools processing causes OOM condition on configure"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACKLIST[lksctp-tools] ?= "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] ?= "BROKEN: fails to build for qemuarm."
> meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?= "Not comatible with current nodejs 0.12, but upstream is working on it for v3"
> meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb:PNBLACKLIST[nodejs4] ?= "Used only by currently blacklisted cloud9 and fails to build for qemuarm with thumb: error: #error For thumb inter-working we require an architecture which supports blx"
> meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[packagekit] ?= "BROKEN: depends on old deprecated libopkg which is currently disabled and will be removed soon"
> meta-oe/recipes-extended/libuio/libuio_0.2.1.bb:PNBLACKLIST[libui0] ?= "BROKEN, fails to build with gcc-5"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?= "BROKEN: Fails to build with gcc-5"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb:PNBLACKLIST[sessreg] ?= "BROKEN: fails to generate man pages"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
> meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?= "Not compatible with 3.19 kernel"
> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends on blacklisted kernel-module-ktapvm"
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?= "BROKEN, fails to build with gcc-5"
> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?= "BROKEN: fails to build with gcc-5"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
> meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?= "BROKEN: doesn't work with B!=S, ls: cannot access *.pro: No such file or directory"
> meta-oe/recipes-qt/qt-creator/qt-creT[start-stop-daemon] ?= "BROKEN: fails because of gettext, partial fix is available here http://patchwork.openembedded.org/patch/89867/"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
> meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb:PNBLACKLIST[libnet-dns-perl] ?= "BROKEN: Fails to build since some changes in perl recipe"
> meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-vala] ?= "Fails to build since vala upgrade to 0.26.1"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?= "broken: depends on blacklisted fltk"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] = "rdepends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-webos-ports:
> conf/world_fixes.inc:PNBLACKLIST[mplayer2] = ""
> conf/world_fixes.inc:PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
> conf/world_mask.inc:PNBLACKLIST[evince] = "fails to build"
> conf/world_mask.inc:PNBLACKLIST[epiphany] = "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] = "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] = "fails to build"
> conf/world_mask.inc:PNBLACKLIST[media-ctl] = "fails to build"
> QA issues by type:
> count: 3	issue: already-stripped
> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' from qwt was already stripped, this will prevent future debugging! [already-stripped]
> 
> 
> count: 0	issue: libdir
> 
> 
> count: 20	issue: textrel
> aalib-1.4rc4: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/aalib/1.4rc4-r0/packages-split/aalib/usr/lib/libaa.so.1.0.4' has relocations in .text [textrel]
> aalib-1.4rc4: ELF binary '/tmp/work/i586-oe-linux/aalib/1.4rc4-r0/packages-split/aalib/usr/lib/libaa.so.1.0.4' has relocations in .text [textrel]
> corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/packages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
> efl-1.15.1: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/efl/2_1.15.1-r0/packages-split/evas/usr/lib/evas/cserve2/bin/v-1.15/evas_cserve2_slave' has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.18-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> matchbox-keyboard-0.0+gitAUTOINC+217f1bfe14: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/matchbox-keyboard/0.0+gitAUTOINC+217f1bfe14-r4/packages-split/matchbox-keyboard/usr/bin/matchbox-keyboard' has relocations in .text [textrel]
> mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [textrel]
> qtwebengine-5.5.0+gitAUTOINC+qtwebengine: ELF binary '/tmp/work/i586-oe-linux/qtwebengine/5.5.0+gitAUTOINC+qtwebengine-r0/packages-split/qtwebengine-plugins/usr/lib/qt5/plugins/qtwebengine/libffmpegsumo.so' has relocations in .text [textrel]
> webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]
> 
> 
> count: 35	issue: build-deps
> aalib-1.4rc4: aalib rdepends on libx11, but it isn't a build dependency? [build-deps]
> aalib-1.4rc4: aalib rdepends on libxau, but it isn't a build dependency? [build-deps]
> aalib-1.4rc4: aalib rdepends on libxcb, but it isn't a build dependency? [build-deps]
> aalib-1.4rc4: aalib rdepends on libxdmcp, but it isn't a build dependency? [build-deps]
> cheese-2.30.1: cheese rdepends on libgudev, but it isn't a build dependency? [build-deps]
> cifs-utils-6.4: cifs-utils rdepends on samba, but it isn't a build dependency? [build-deps]
> clutter-gst-3.0-3.0.8: clutter-gst-3.0 rdepends on libgudev, but it isn't a build dependency? [build-deps]
> devicekit-power-014: devicekit-power rdepends on libgudev, but it isn't a build dependency? [build-deps]
> dovecot-2.2.18: dovecot rdepends on lz4, but it isn't a build dependency? [build-deps]
> dovecot-2.2.18: dovecot-dev rdepends on lz4, but it isn't a build dependency? [build-deps]
> gammu-1.32.0: gammu rdepends on libgudev, but it isn't a build dependency? [build-deps]
> gimp-2.8.14: gimp rdepends on aalib, but it isn't a build dependency? [build-deps]
> gphoto2-2.5.8: gpho't a build dependency? [build-deps]
> pure-ftpd-1.0.42: pure-ftpd rdepends on libsodium, but it isn't a build dependency? [build-deps]
> qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstapp-0.10, but it isn't a build dependency? [build-deps]
> qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstvideo-0.10, but it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstinterfaces-0.10, but it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstvideo-0.10, but it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libxv, but it isn't a build dependency? [build-deps]
> qtwebengine-5.5.0+gitAUTOINC+qtwebengine: qtwebengine rdepends on qtlocation, but it isn't a build dependency? [build-deps]
> samba-4.1.12: samba rdepends on libavahi-client, but it isn't a build dependency? [build-deps]
> samba-4.1.12: samba rdepends on libavahi-common, but it isn't a build dependency? [build-deps]
> sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [build-deps]
> sox-14.4.0: sox rdepends on opencore-amr, but it isn't a build dependency? [build-deps]
> tcpdump-4.7.4: tcpdump rdepends on libcap-ng, but it isn't a build dependency? [build-deps]
> vlc-2.2.1: vlc rdepends on libavc1394, but it isn't a build dependency? [build-deps]
> webmin-1.750: webmin rdepends on perl-module-sdbm, but it isn't a build dependency? [build-deps]
> 
> 
> count: 31	issue: file-rdeps
> chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requires libucsi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requires libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan requires libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraffic requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraffic requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon requires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.ned in package gupnp-dev requires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]
> libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package libbonobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file-rdeps]
> libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.so_libnewt-python contained in package libnewt-python requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.so_libnewt-python contained in package libnewt-python requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> networkmanager-1.0.4: /usr/bin/nmtui-connect_networkmanager contained in package networkmanager requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> networkmanager-1.0.4: /usr/bin/nmtui-connect_networkmanager contained in package networkmanager requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphysics contained in package numptyphysics requires /usr/bin/perl, but no providers found in its RDEPENDS [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.sh_numptyphysics contained in package numptyphysics requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
> rrdtool-1.5.4: /usr/share/rrdtool/examples/stripes.py_rrdtool-perl contained in package rrdtool-perl requires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]
> tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.so_tracker-nautilus-extension contained in package tracker-nautilus-extension requires libnautilus-extension.so.1()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.so_tracker-nautilus-extension contained in package tracker-nautilus-extension requires libnautilus-extension.so.1, but no providers found in its RDEPENDS [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils contained in package ubx-utils requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
> 
> 
> count: 0	issue: version-going-backwards
> 
> 
> count: 36	issue: host-user-contaminated
> apache2-2.4.16: apache2: /apache2-dev/usr/share/apache2/icons/small/uu.png is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> apache2-2.4.16: apache2: /apache2-scripts/usr/bin/dbmmanage is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> apache2-2.4.16: apache2: /apache2/usr/share/apache2/cgi-bin/printenv is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> babiloo-efl-2.0.9-10: babiloo-efl: /babiloo-efl/usr/share/babiloo/core/test/test_dictionary.py is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> cim-schema-exper-2.39.0: cim-schema-exper: /cim-schema-exper/usr/share/mof/cimv2.39.0/Application/CIM_AGPSoftwareFeature.mof is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> cim-schema-final-2.40.0: cim-schema-final: /cim-schema-final/usr/share/mof/cimv2.40.0/Application/CIM_AGPSoftwareFeature.mof is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> cinematicexperience-1.0: cinematicexperience: /cinematicexperience/usr/share/cinematicexperience-1.0/content/images/qt_logo.png is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> debootstrap-1.0.67: debootstrap: /debootstrap/usr/share/debootstrap/scripts/breezy is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> dracut-043+giteab03540cd695d940062af5b55c02e8829aaa526: dracut: /dracut/usr/lib/dracut/modules.d/99uefi-lib/uefi-lib.sh is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> espeak-1.37: espeak: /espeak/usr/share/espeak-data/mbrola_ph/es4_phtrans is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> firefox-10.0.12esr: firefox: /firefox-dev/usr/share/idl/firefox-10.0/nsIBrowserHandler.idl is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> firefox-10.0.12esr: firefox: /firefox-staticdev/usr/lib/firefox-devel-10.0/sdk/lib/libnssutil.a is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> firefox-addon-webconverger-20120228: firefox-addon-webconverger: /firefox-addon-webconverger/usr/lib/firefox/extensions/{ee11fa88-036b-4661-bb04-d436f86bc06a}/content/wc.js is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> glibc-locale-2.22: glibc-locale: /glibc-binary-localedata-en-sg.iso-8859-1/usr/lib/locale/en_SG.ISO-8859-1/LC_PAPER is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> libvpx-1.4.0: libvpx: /libvpx-dev/usr/lib/pkgconfig/vpx.pc is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> libvpx-1.4.0: libvpx: /libvpx/usr/bin/vpxdec is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> libvpx-1.4.0: libvpx: /libvpx/usr/bin/vpxenc is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> logwatch-7.4.1: logwatch: /logwatch/usr/share/logwatch/default.conf/logfiles/mysql-mmm.conf is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> monav-0.3: monav: /monav/usr/share/monav/images/directions/left.svg is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> numptyphysics-0.2+svnr109: numptyphysics: /numptyphysics/usr/share/numptyphysics/org_level/L50_nautilus.nph is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> orrery-2.7: orrery: /orrery/usr/share/orrery/constellations/Andromeda is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> phpmyadmin-4.4.9: phpmyadmin: /phpmyadmin/usr/share/phpmyadmin/doc/_ext/configext.py is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> qt5everywheredemo-1.0: qt5everywheredemo: /qt5everywheredemo/usr/share/qt5everywheredemo-1.0/qml/QtDemo/images/tv.png is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> qt5ledscreen-1.0: qt5ledscreen: /qt5ledscreen/usr/share/qt5ledscreen-1.0/images/logo1.png is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> qt5nmapcarousedemo-1.0: qt5nmapcarousedemo: /qt5nmapcarousedemo/usr/share/qt5nmapcarousedemo-1.0/content/images/arrow-right.png is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> qt5nmapper-1.0: qt5nmapper: /qt5nmapper/usr/share/qt5nmapper-1.0/content/images/switch_thumb.png is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> qtbase-5.5.0+gitAUTOINC+c619d2daac: qtbase: /qtbase-dev/usr/lib/libqtpcre.prl is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> qtbase-5.5.0+gitAUTOINC+c619d2daac: qtbase: /qtbase-staticdev/usr/lib/libqtpcre.a is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> qtsmarthome-1.0: qtsmarthome: /qtsmarthome/usr/share/qtsmarthome-1.0/qml/smarthome/components/tabwidget/VTabBar.qml is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> quitbattery-1.0.0: quitbattery: /quitbattery/usr/share/quitbattery-1.0.0/qml/QUItBattery/images/glass.png is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> quitindicators-1.0.1: quitindicators: /quitindicators/usr/share/quitindicators-1.0.1/qml/QUItIndicators/images/dots_512.png is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> qwt-6.0.1: qwt: /qwt-examples/usr/bin/friedberg is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> qwt-6.0.1: qwt: /qwt-examples/usr/bin/plotmatrix is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> qwt-6.0.1: qwt: /qwt-examples/usr/bin/realtime is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> thone-0.7: thone: /thone/usr/bin/thone-toggle is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> tipcutils-2.0.6: tipcutils: /tipcutils/etc/init.d/tipcutils is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> 
> 
> count: 1	issue: installed-vs-shipped
> rrdtool: 5 installed and not shipped files. [installed-vs-shipped]
> 
> 
> count: 1	issue: unknown-configure-option
> polkit-gnome-0.105: polkit-gnome: configure was passed unrecognised options: --disable-examples --disable-introspection [unknown-configure-option]
> 
> 
> count: 1	issue: symlink-to-sysroot
> netkit-ftp-0.17: Symlink /usr/bin/pftp in netkit-ftp points to TMPDIR [symlink-to-sysroot]
> 
> 
> count: 3	issue: invalid-pkgconfig
> gpsd-3.14: gpsd: invalid PACKAGECONFIG: bluez5 [invalid-pkgconfig]
> qt-mobility-embedded-1.2.0: qt-mobility-embedded: invalid PACKAGECONFIG: bluez5 [invalid-pkgconfig]
> qt-mobility-x11-1.2.0: qt-mobility-x11: invalid PACKAGECONFIG: bluez5 [invalid-pkgconfig]
> 
> 
> count: 0	issue: pkgname
> 
> 
> 

