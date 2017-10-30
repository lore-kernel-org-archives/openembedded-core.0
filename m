Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7409471A32;
	Mon, 30 Oct 2017 13:08:00 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id l8so12507883wre.12;
	Mon, 30 Oct 2017 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ir7pcj9WZjnqGeDWjhSIpj0lAFpkfDLRKdlWy/gJqao=;
	b=vQ5f04plrpjgWABDWvA5wdtuCYKJRhL6HYevwlYNdJuHD8g3CjUrtKnj5v/xwZQlAP
	OTr5H/8Uw+MaoxfWlUeSRygNfk1Wmg1eTj+y3VRItrDBR0I2CB90huwM2xUXDQPVHlB/
	WSWM35IJL64FXHh80ZUQZMJ6uXoWFNIhfxdbMf/8FNrcWrs/BXDbrSCxM0zweIxHQaKP
	loXP0MDeAFDUfs46QTZkcleRBRxLgIJwGyb0M2ZbpAF2OYhnVWxoiScmW0SJFtJdPwzP
	3ubTIHyL3jFJ5vX96MPpy8FK/C1PckIA79/fKeXwNCRndtKTtZnbMu/FcZNjiYi0qh6m
	xiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ir7pcj9WZjnqGeDWjhSIpj0lAFpkfDLRKdlWy/gJqao=;
	b=aAbEgOpZaPn2BQ9cHagLgqQ6Lp6Noah8mDPMozNORmqDNFU6HE0R6P0Z729VVQOSh2
	vkK0Vs74XpX+ZDCbAhhFqyoFnKTppYmUW/zOss13DshWj7y89i7KJ8Hw6zxItenLV3Ob
	MEmIoB2QNpsQ3bAQwWxXBnZfxDdYPxceTuGnaNdT6JasjAcCuPoWhwt6MvvH72078FCG
	SPApINHqiD5IvfN3+DhmSR/RWiHmeacXORCjzW8D3X8fY6YpOAgjBQxrvDSbqofHnZvT
	HGS0tV755WmPU4/MlT8MbkINRFowIuqdQr5/YIuZogx4+HvachOx1rgUxMTJ+83BUI3Q
	dLCA==
X-Gm-Message-State: AMCzsaVswSSrwu2yfnLzHLPYRrTJID5K1YzoU8MWUmC+BTOhdrNiYrhN
	MiNndA3jUObHvW4N8X4GNRmDfIL7Mv3oZPiGzmhD7A==
X-Google-Smtp-Source: ABhQp+TfHCUh7QadcZ+wD34MFftDW2PRvaZfKrUlCUMEgg5K4Uq9vTaKvxwLKrkMv9Lhmrt+JrLI8h4wMwkpA1oqur4=
X-Received: by 10.223.143.51 with SMTP id p48mr7113174wrb.104.1509368880574;
	Mon, 30 Oct 2017 06:08:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Mon, 30 Oct 2017 06:07:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 Oct 2017 14:07:59 +0100
Message-ID: <CA+chaQeOgdntXPDWL8B2690weRRAEne-g-6-RWFcS+x7Ap_amg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-10-29
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
X-List-Received-Date: Mon, 30 Oct 2017 13:08:01 -0000
Content-Type: multipart/alternative; boundary="f403045d5cfaf637c4055cc353ee"

--f403045d5cfaf637c4055cc353ee
Content-Type: text/plain; charset="UTF-8"

A lot more issues reported for qemux86 this time, because now it's using
musl TCLIBC in these world builds.

This list isn't even complete, there were many more ERRORs being shown for
components being skipped e.g. because systemd isn't compatible with musl
(and then skipping everything depending on that and so on).
Summary: There were 76 WARNING messages shown.
Summary: There were 1648 ERROR messages shown, returning a non-zero exit
code.

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date      !!colspan='4'|Failed tasks     !!|Signatures
!!colspan='15'|QA !!Comment
|-
|| ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all ||already-stripped
||libdir ||textrel ||build-deps ||file-rdeps ||version-going-backwards
||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option
||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
||compile-host-path ||qa_pseudo ||
|-
||2017-10-29 ||4 ||7 ||14 ||1 ||0 ||0 ||0 ||1 ||0 ||0 ||4 ||5 ||0 ||0 ||0
||0 ||0 ||0 ||0 ||2 ||
|}

== Failed tasks 2017-10-29 ==

INFO: jenkins-job.sh-1.8.39 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171030_030413.log

=== common (0) ===

=== common-x86 (0) ===

=== qemuarm (4) ===
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_package_qa
    * meta-qt5/recipes-qt/qt5/qtscript_git.bb:do_package_qa
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:
do_package_qa

=== qemuarm64 (6) ===
    * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:
do_compile
    *
meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:
do_compile
    *
meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:
do_install
    *
meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:
do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtquickcontrols2_git.bb:do_package_qa

=== qemux86 (14) ===
    *
meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:
do_package
    *
meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:
do_configure
    *
meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:
do_compile
    *
meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb:
do_compile
    *
openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb:
do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:
do_package_qa

=== qemux86_64 (1) ===
    *
meta-openembedded/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb:
do_package_qa

=== Number of failed tasks (26) ===
{| class=wikitable
|-
|| qemuarm || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171029_040929.log/
|| http://errors.yoctoproject.org/Errors/Build/47845/
|-
|| qemuarm64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm64.20171029_061855.log/
|| http://errors.yoctoproject.org/Errors/Build/47853/
|-
|| qemux86 || 14 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171029_040931.log/
|| http://errors.yoctoproject.org/Errors/Build/47855/
|-
|| qemux86_64 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171029_155849.log/
|| http://errors.yoctoproject.org/Errors/Build/47856/
|}

=== PNBLACKLISTs (1) ===

=== QA issues (12) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||build-deps
|-
||0 ||compile-host-path
|-
||0 ||file-rdeps
|-
||0 ||installed-vs-shipped
|-
||0 ||invalid-pkgconfig
|-
||0 ||ldflags
|-
||0 ||libdir
|-
||0 ||pkgname
|-
||0 ||symlink-to-sysroot
|-
||0 ||unknown-configure-option
|-
||1 ||textrel
|-
||2 ||qa_pseudo
|-
||4 ||version-going-backwards
|-
||5 ||host-user-contaminated
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20171029_113221.log/


    * ERROR: Nothing PROVIDES 'udev' (but
/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtbase_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/lvm2/
lvm2_2.02.171.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/alsa/
alsa-utils-scripts_1.1.4.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-connectivity/ofono/
ofono_1.20.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/lvm2/
libdevmapper_2.02.171.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/gstreamer/
gstreamer1.0-vaapi_1.12.2.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gammu/
gammu_1.32.0.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/wayland/
libinput_1.8.1.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/btrfs-tools/
btrfs-tools_4.12.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-benchmark/glmark2/
glmark2_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/wayland/
weston_2.0.0.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-sato/webkit/
webkitgtk_2.16.6.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xorg-driver/
xf86-video-intel_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/hidapi/
hidapi_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-xfce/thunar/
thunar_1.6.12.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libcec/
libcec_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/alsa/
alsa-utils_1.1.4.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libcyusbserial/
libcyusbserial_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectivity/usbmuxd/
usbmuxd_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-gnome/libgudev/
libgudev_231.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libatasmart/
libatasmart_0.19.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/hwloc/
hwloc_1.11.5.bb, /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
qtsystems_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/usbutils/
usbutils_008.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/
pulseaudio_10.0.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/dhcpcd/
dhcpcd_6.11.3.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-connectivity/bluez5/
bluez5_5.46.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/
v4l-utils_1.12.3.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/clutter/
clutter-1.0_1.26.2.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xorg-xserver/
xserver-xorg_1.19.3.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-filesystems/recipes-utils/udevil/
udevil_0.4.4.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/
gnome-bluetooth_3.18.2.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pcsc-lite/
pcsc-lite_1.8.22.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/pciutils/
pciutils_3.5.5.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-gnome/gnome-desktop/
gnome-desktop3_3.24.2.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/multipath-tools/
multipath-tools_0.7.1.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/pcmciautils/
pcmciautils_018.bb DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in
/home/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing PROVIDES 'udev' (but
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/usbutils/
usbutils_008.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectivity/usbmuxd/
usbmuxd_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/pciutils/
pciutils_3.5.5.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/clutter/
clutter-1.0_1.26.2.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/lvm2/
libdevmapper_2.02.171.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/hidapi/
hidapi_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/
gnome-bluetooth_3.18.2.bb,
/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtbase_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/btrfs-tools/
btrfs-tools_4.12.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-gnome/libgudev/
libgudev_231.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/pcmciautils/
pcmciautils_018.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/gstreamer/
gstreamer1.0-vaapi_1.12.2.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gammu/
gammu_1.32.0.bb, /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
qtsystems_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-gnome/gnome-desktop/
gnome-desktop3_3.24.2.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/wayland/
libinput_1.8.1.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/libcec/
libcec_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libatasmart/
libatasmart_0.19.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-sato/webkit/
webkitgtk_2.16.6.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-filesystems/recipes-utils/udevil/
udevil_0.4.4.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/
v4l-utils_1.12.3.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/
pulseaudio_10.0.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/alsa/
alsa-utils-scripts_1.1.4.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/alsa/
alsa-utils_1.1.4.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/pcsc-lite/
pcsc-lite_1.8.22.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xorg-driver/
xf86-video-intel_git.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/wayland/
weston_2.0.0.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-connectivity/dhcpcd/
dhcpcd_6.11.3.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-xfce/thunar/
thunar_1.6.12.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/multipath-tools/
multipath-tools_0.7.1.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/lvm2/
lvm2_2.02.171.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-connectivity/ofono/
ofono_1.20.bb,
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-connectivity/bluez5/
bluez5_5.46.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/hwloc/
hwloc_1.11.5.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-benchmark/glmark2/
glmark2_git.bb,
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libcyusbserial/
libcyusbserial_git.bb DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/shr-core/tmp-glibc/stamps


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
link against sctp_connectx symbol", '', d)}"
meta-qt5:
PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 1 issue: textrel
corosync-2.4.2: ELF binary
'/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 4 issue: version-going-backwards
packagegroup-core-standalone-sdk-target-1.0: Package version for package
packagegroup-core-standalone-sdk-target-dbg went backwards which would
break package feeds from (0:1.0-r8.14 to 0:1.0-r8.13)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for package
packagegroup-core-standalone-sdk-target-dev went backwards which would
break package feeds from (0:1.0-r8.14 to 0:1.0-r8.13)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for package
packagegroup-core-standalone-sdk-target-ptest went backwards which would
break package feeds from (0:1.0-r8.14 to 0:1.0-r8.13)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for package
packagegroup-core-standalone-sdk-target went backwards which would break
package feeds from (0:1.0-r8.14 to 0:1.0-r8.13) [version-going-backwards]


count: 5 issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ms-my/usr/lib/locale/ms_MY/LC_COLLATE is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-quz-pe/usr/lib/locale/quz_PE/LC_NAME is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: qtbase:
/qtbase-dev/usr/lib/cmake/Qt5Gui/Qt5Gui_QJpegPlugin.cmake is owned by uid
3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: qtquickcontrols2:
/qtquickcontrols2-qmlplugins/usr/lib/qt5/qml/QtQuick/Controls.2/Material/qmldir
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: qtscript:
/qtscript-mkspecs/usr/lib/qt5/mkspecs/modules/qt_lib_script.pri is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path


count: 2 issue: qa_pseudo
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/core2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
be393f2 toaster/highlight.pack.js: Fix corrupted file
not included in master yet:
3fba1ad world-image: add extra target
c7c01bf fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
3b413a8 README.qemu: qemuppc64 is not supported
not included in master yet:
3ff8d67 report-error: Allow to upload reports automatically
c7e8c96 buildhistory.bbclass: metadata-revs show repo parent
e2c9020 metadata-revs: provide more information
cd6556e qemux86: Add identical qemux86copy variant for tests
347a734 reproducible_build.bbclass: initial support for binary
reproducibility
625d2bc cpio: provide cpio-replacement-native
ce7ca36 image_types.bbclass: improve cpio image reproducibility
fea2911 rootfs-postcommands.bbclass: support binary reproducibility
981e97a sstate.bbclass: Do not cause build failures due to setscene errors
b53517c insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
f829dbd libsdl2: allow to build native and nativesdk
5c05822 libdrm: allow to build native and nativesdk
95faa5e nativesdk-mesa,mesa-native: add new recipe to build small part of
mesa
bd4c162 libepoxy: add support for native(sdk)
3092b61 libjpeg-turbo: provide nativesdk version
5471ea7 virglrenderer: add new recipe
8c4c3fc virglrenderer: fix target build
81e5bc3 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
c37486d insane.bbclass: use package_qa_handle_error for do_qa_pseudo

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
5d6d21e libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
not included in master yet:
ebcef48 bridge-utils: modify the AR to cross toolchain

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
not included in master yet:
197811b qtwebengine: make test suite succeed

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
26d5066 firefox: fix build failures
not included in master yet:
6773bf9 meta: drop ${COREBASE}/LICENSE references

--f403045d5cfaf637c4055cc353ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>A lot more issues reported for qemux86 this time, bec=
ause now it&#39;s using musl TCLIBC in these world builds.</div><div><br></=
div><div>This list isn&#39;t even complete, there were many more ERRORs bei=
ng shown for components being skipped e.g. because systemd isn&#39;t compat=
ible with musl (and then skipping everything depending on that and so on).<=
/div><div>Summary: There were 76 WARNING messages shown.<br></div><div>Summ=
ary: There were 1648 ERROR messages shown, returning a non-zero exit code.<=
br></div><div><br></div><div><a href=3D"http://www.openembedded.org/wiki/Bi=
tbake_World_Status">http://www.openembedded.org/wiki/Bitbake_World_Status</=
a></div><div><br></div><div>=3D=3D Number of issues - stats =3D=3D</div><di=
v>{| class=3D&#39;wikitable&#39;</div><div>!|Date<span style=3D"white-space=
:pre">		</span>=C2=A0 =C2=A0 =C2=A0!!colspan=3D&#39;4&#39;|Failed tasks<spa=
n style=3D"white-space:pre">			</span>=C2=A0 =C2=A0 !!|Signatures<span styl=
e=3D"white-space:pre">		</span>=C2=A0 !!colspan=3D&#39;15&#39;|QA !!Comment=
</div><div>|-</div><div>||<span style=3D"white-space:pre">		</span>||qemuar=
m<span style=3D"white-space:pre">	</span>||qemuarm64<span style=3D"white-sp=
ace:pre">	</span>||qemux86<span style=3D"white-space:pre">	</span>||qemux86=
_64<span style=3D"white-space:pre">	</span>||all <span style=3D"white-space=
:pre">	</span>||already-stripped<span style=3D"white-space:pre">	</span>||l=
ibdir<span style=3D"white-space:pre">	</span>||textrel<span style=3D"white-=
space:pre">	</span>||build-deps<span style=3D"white-space:pre">	</span>||fi=
le-rdeps<span style=3D"white-space:pre">	</span>||version-going-backwards<s=
pan style=3D"white-space:pre">	</span>||host-user-contaminated<span style=
=3D"white-space:pre">	</span>||installed-vs-shipped<span style=3D"white-spa=
ce:pre">	</span>||unknown-configure-option<span style=3D"white-space:pre">	=
</span>||symlink-to-sysroot<span style=3D"white-space:pre">	</span>||invali=
d-pkgconfig<span style=3D"white-space:pre">	</span>||pkgname<span style=3D"=
white-space:pre">	</span>||ldflags<span style=3D"white-space:pre">	</span>|=
|compile-host-path<span style=3D"white-space:pre">	</span>||qa_pseudo<span =
style=3D"white-space:pre">	</span>||<span style=3D"white-space:pre">	</span=
></div><div>|-</div><div>||2017-10-29<span style=3D"white-space:pre">	</spa=
n>||4<span style=3D"white-space:pre">	</span>||7<span style=3D"white-space:=
pre">	</span>||14<span style=3D"white-space:pre">	</span>||1<span style=3D"=
white-space:pre">	</span>||0<span style=3D"white-space:pre">	</span>||0<spa=
n style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		<=
/span>||1<span style=3D"white-space:pre">		</span>||0<span style=3D"white-s=
pace:pre">		</span>||0<span style=3D"white-space:pre">		</span>||4<span sty=
le=3D"white-space:pre">		</span>||5<span style=3D"white-space:pre">		</span=
>||0<span style=3D"white-space:pre">		</span>||0<span style=3D"white-space:=
pre">		</span>||0<span style=3D"white-space:pre">		</span>||0<span style=3D=
"white-space:pre">		</span>||0<span style=3D"white-space:pre">		</span>||0<=
span style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">=
		</span>||2<span style=3D"white-space:pre">		</span>||<span style=3D"white=
-space:pre">	</span></div><div>|}</div><div><br></div><div>=3D=3D Failed ta=
sks 2017-10-29 =3D=3D</div><div><br></div><div>INFO: jenkins-job.sh-1.8.39 =
Complete log available at <a href=3D"http://logs.nslu2-linux.org/buildlogs/=
oe/world/rocko/log.report.20171030_030413.log">http://logs.nslu2-linux.org/=
buildlogs/oe/world/rocko/log.report.20171030_030413.log</a></div><div><br><=
/div><div>=3D=3D=3D common (0) =3D=3D=3D</div><div><br></div><div>=3D=3D=3D=
 common-x86 (0) =3D=3D=3D</div><div><br></div><div>=3D=3D=3D qemuarm (4) =
=3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-devto=
ols/android-tools/android-tools_5.1.1.r37.bb:do_compile</div><div>=C2=A0 =
=C2=A0 * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_package_qa</div><div>=C2=
=A0 =C2=A0 * meta-qt5/recipes-qt/qt5/qtscript_git.bb:do_package_qa</div><di=
v>=C2=A0 =C2=A0 * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.=
26.bb:do_package_qa</div><div><br></div><div>=3D=3D=3D qemuarm64 (6) =3D=3D=
=3D</div><div>=C2=A0 =C2=A0 * meta-browser/recipes-browser/chromium/chromiu=
m_54.0.2810.2.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-browser/recipes-=
browser/chromium/chromium-wayland_53.0.2785.143.bb:do_compile</div><div>=C2=
=A0 =C2=A0 * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-util=
s-klibc_1.5.2.bb:do_install</div><div>=C2=A0 =C2=A0 * meta-openembedded/met=
a-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure</d=
iv><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-devtools/luajit/l=
uajit_2.0.5.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-qt5/recipes-qt/qt5=
/qtquickcontrols2_git.bb:do_package_qa</div><div><br></div><div>=3D=3D=3D q=
emux86 (14) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-netw=
orking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package</div><div>=C2=
=A0 =C2=A0 * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftp=
d_3.0.3.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-netw=
orking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile</div><div>=
=C2=A0 =C2=A0 * meta-openembedded/meta-networking/recipes-netkit/netkit-tel=
net/netkit-telnet_0.17.bb:do_configure</div><div>=C2=A0 =C2=A0 * meta-opene=
mbedded/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb:do_compile<=
/div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-networking/recipes-protoco=
ls/tsocks/tsocks_1.8beta5.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-open=
embedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_comp=
ile</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-devtools/pm=
-qa/pm-qa_git.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/met=
a-oe/recipes-extended/mraa/mraa_git.bb:do_compile</div><div>=C2=A0 =C2=A0 *=
 meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_compile=
</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-kernel/crash/c=
rash_7.1.9.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-o=
e/recipes-multimedia/alsa/alsa-oss_1.0.17.bb:do_compile</div><div>=C2=A0 =
=C2=A0 * openembedded-core/meta/recipes-graphics/virglrenderer/virglrendere=
r_git.bb:do_compile</div><div>=C2=A0 =C2=A0 * openembedded-core/meta/recipe=
s-multimedia/x264/x264_git.bb:do_package_qa</div><div><br></div><div>=3D=3D=
=3D qemux86_64 (1) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openembedded/me=
ta-networking/recipes-extended/corosync/corosync_2.4.2.bb:do_package_qa</di=
v><div><br></div><div>=3D=3D=3D Number of failed tasks (26) =3D=3D=3D</div>=
<div>{| class=3Dwikitable</div><div>|-</div><div>|| qemuarm <span style=3D"=
white-space:pre">	</span>|| 4<span style=3D"white-space:pre">	</span> || <a=
 href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qem=
uarm.20171029_040929.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/r=
ocko/log.world.qemuarm.20171029_040929.log/</a> || <a href=3D"http://errors=
.yoctoproject.org/Errors/Build/47845/">http://errors.yoctoproject.org/Error=
s/Build/47845/</a></div><div>|-</div><div>|| qemuarm64 <span style=3D"white=
-space:pre">	</span>|| 7<span style=3D"white-space:pre">	</span> || <a href=
=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm6=
4.20171029_061855.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemuarm64.20171029_061855.log/</a> || <a href=3D"http://errors.=
yoctoproject.org/Errors/Build/47853/">http://errors.yoctoproject.org/Errors=
/Build/47853/</a></div><div>|-</div><div>|| qemux86 <span style=3D"white-sp=
ace:pre">	</span>|| 14<span style=3D"white-space:pre">	</span> || <a href=
=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.=
20171029_040931.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/=
log.world.qemux86.20171029_040931.log/</a> || <a href=3D"http://errors.yoct=
oproject.org/Errors/Build/47855/">http://errors.yoctoproject.org/Errors/Bui=
ld/47855/</a></div><div>|-</div><div>|| qemux86_64 <span style=3D"white-spa=
ce:pre">	</span>|| 1<span style=3D"white-space:pre">	</span> || <a href=3D"=
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.2=
0171029_155849.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86-64.20171029_155849.log/</a> || <a href=3D"http://errors.yo=
ctoproject.org/Errors/Build/47856/">http://errors.yoctoproject.org/Errors/B=
uild/47856/</a></div><div>|}</div><div><br></div><div>=3D=3D=3D PNBLACKLIST=
s (1) =3D=3D=3D</div><div><br></div><div>=3D=3D=3D QA issues (12) =3D=3D=3D=
</div><div>{| class=3Dwikitable</div><div>!| Count<span style=3D"white-spac=
e:pre">		</span>||Issue</div><div>|-</div><div>||0<span style=3D"white-spac=
e:pre">	</span>||already-stripped</div><div>|-</div><div>||0<span style=3D"=
white-space:pre">	</span>||build-deps</div><div>|-</div><div>||0<span style=
=3D"white-space:pre">	</span>||compile-host-path</div><div>|-</div><div>||0=
<span style=3D"white-space:pre">	</span>||file-rdeps</div><div>|-</div><div=
>||0<span style=3D"white-space:pre">	</span>||installed-vs-shipped</div><di=
v>|-</div><div>||0<span style=3D"white-space:pre">	</span>||invalid-pkgconf=
ig</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||ldfl=
ags</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||lib=
dir</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||pkg=
name</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||sy=
mlink-to-sysroot</div><div>|-</div><div>||0<span style=3D"white-space:pre">=
	</span>||unknown-configure-option</div><div>|-</div><div>||1<span style=3D=
"white-space:pre">	</span>||textrel</div><div>|-</div><div>||2<span style=
=3D"white-space:pre">	</span>||qa_pseudo</div><div>|-</div><div>||4<span st=
yle=3D"white-space:pre">	</span>||version-going-backwards</div><div>|-</div=
><div>||5<span style=3D"white-space:pre">	</span>||host-user-contaminated</=
div><div>|}</div><div><br></div><div><br></div><div><br></div><div>=3D=3D=
=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D</div><div><br=
></div><div>Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/=
oe/world/rocko/log.signatures.20171029_113221.log/">http://logs.nslu2-linux=
.org/buildlogs/oe/world/rocko/log.signatures.20171029_113221.log/</a></div>=
<div><br></div><div><br></div><div>=C2=A0 =C2=A0 * ERROR: Nothing PROVIDES =
&#39;udev&#39; (but /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5=
/<a href=3D"http://qtbase_git.bb">qtbase_git.bb</a>, /home/jenkins/oe/world=
/shr-core/meta-openembedded/meta-oe/recipes-support/lvm2/<a href=3D"http://=
lvm2_2.02.171.bb">lvm2_2.02.171.bb</a>, /home/jenkins/oe/world/shr-core/ope=
nembedded-core/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils-sc=
ripts_1.1.4.bb">alsa-utils-scripts_1.1.4.bb</a>, /home/jenkins/oe/world/shr=
-core/openembedded-core/meta/recipes-connectivity/ofono/<a href=3D"http://o=
fono_1.20.bb">ofono_1.20.bb</a>, /home/jenkins/oe/world/shr-core/meta-opene=
mbedded/meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.02.17=
1.bb">libdevmapper_2.02.171.bb</a>, /home/jenkins/oe/world/shr-core/openemb=
edded-core/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-vaapi_1.12.2.bb">gstreamer1.0-vaapi_1.12.2.bb</a>, /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-connectivity/gammu/<a href=3D"ht=
tp://gammu_1.32.0.bb">gammu_1.32.0.bb</a>, /home/jenkins/oe/world/shr-core/=
openembedded-core/meta/recipes-graphics/wayland/<a href=3D"http://libinput_=
1.8.1.bb">libinput_1.8.1.bb</a>, /home/jenkins/oe/world/shr-core/openembedd=
ed-core/meta/recipes-devtools/btrfs-tools/<a href=3D"http://btrfs-tools_4.1=
2.bb">btrfs-tools_4.12.bb</a>, /home/jenkins/oe/world/shr-core/meta-openemb=
edded/meta-oe/recipes-benchmark/glmark2/<a href=3D"http://glmark2_git.bb">g=
lmark2_git.bb</a>, /home/jenkins/oe/world/shr-core/openembedded-core/meta/r=
ecipes-graphics/wayland/<a href=3D"http://weston_2.0.0.bb">weston_2.0.0.bb<=
/a>, /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-sato/we=
bkit/<a href=3D"http://webkitgtk_2.16.6.bb">webkitgtk_2.16.6.bb</a>, /home/=
jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xorg-driv=
er/<a href=3D"http://xf86-video-intel_git.bb">xf86-video-intel_git.bb</a>, =
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/h=
idapi/<a href=3D"http://hidapi_git.bb">hidapi_git.bb</a>, /home/jenkins/oe/=
world/shr-core/meta-openembedded/meta-xfce/recipes-xfce/thunar/<a href=3D"h=
ttp://thunar_1.6.12.bb">thunar_1.6.12.bb</a>, /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-oe/recipes-extended/libcec/<a href=3D"http://libc=
ec_git.bb">libcec_git.bb</a>, /home/jenkins/oe/world/shr-core/openembedded-=
core/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils_1.1.4.bb">al=
sa-utils_1.1.4.bb</a>, /home/jenkins/oe/world/shr-core/meta-openembedded/me=
ta-oe/recipes-support/libcyusbserial/<a href=3D"http://libcyusbserial_git.b=
b">libcyusbserial_git.bb</a>, /home/jenkins/oe/world/shr-core/meta-openembe=
dded/meta-oe/recipes-connectivity/usbmuxd/<a href=3D"http://usbmuxd_git.bb"=
>usbmuxd_git.bb</a>, /home/jenkins/oe/world/shr-core/openembedded-core/meta=
/recipes-gnome/libgudev/<a href=3D"http://libgudev_231.bb">libgudev_231.bb<=
/a>, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-supp=
ort/libatasmart/<a href=3D"http://libatasmart_0.19.bb">libatasmart_0.19.bb<=
/a>, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-exte=
nded/hwloc/<a href=3D"http://hwloc_1.11.5.bb">hwloc_1.11.5.bb</a>, /home/je=
nkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/<a href=3D"http://qtsystems=
_git.bb">qtsystems_git.bb</a>, /home/jenkins/oe/world/shr-core/openembedded=
-core/meta/recipes-bsp/usbutils/<a href=3D"http://usbutils_008.bb">usbutils=
_008.bb</a>, /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes=
-multimedia/pulseaudio/<a href=3D"http://pulseaudio_10.0.bb">pulseaudio_10.=
0.bb</a>, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking=
/recipes-connectivity/dhcpcd/<a href=3D"http://dhcpcd_6.11.3.bb">dhcpcd_6.1=
1.3.bb</a>, /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-=
connectivity/bluez5/<a href=3D"http://bluez5_5.46.bb">bluez5_5.46.bb</a>, /=
home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-multimedia=
/v4l2apps/<a href=3D"http://v4l-utils_1.12.3.bb">v4l-utils_1.12.3.bb</a>, /=
home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/clut=
ter/<a href=3D"http://clutter-1.0_1.26.2.bb">clutter-1.0_1.26.2.bb</a>, /ho=
me/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xorg-x=
server/<a href=3D"http://xserver-xorg_1.19.3.bb">xserver-xorg_1.19.3.bb</a>=
, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-filesystems/recipe=
s-utils/udevil/<a href=3D"http://udevil_0.4.4.bb">udevil_0.4.4.bb</a>, /hom=
e/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gnome/gnom=
e-bluetooth/<a href=3D"http://gnome-bluetooth_3.18.2.bb">gnome-bluetooth_3.=
18.2.bb</a>, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/reci=
pes-support/pcsc-lite/<a href=3D"http://pcsc-lite_1.8.22.bb">pcsc-lite_1.8.=
22.bb</a>, /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-b=
sp/pciutils/<a href=3D"http://pciutils_3.5.5.bb">pciutils_3.5.5.bb</a>, /ho=
me/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-gnome/gnome-des=
ktop/<a href=3D"http://gnome-desktop3_3.24.2.bb">gnome-desktop3_3.24.2.bb</=
a>, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-suppo=
rt/multipath-tools/<a href=3D"http://multipath-tools_0.7.1.bb">multipath-to=
ols_0.7.1.bb</a>, /home/jenkins/oe/world/shr-core/openembedded-core/meta/re=
cipes-bsp/pcmciautils/<a href=3D"http://pcmciautils_018.bb">pcmciautils_018=
.bb</a> DEPENDS on or otherwise requires it)</div><div>=C2=A0 =C2=A0 * ERRO=
R: Required build target &#39;meta-world-pkgdata&#39; has no buildable prov=
iders.</div><div>=C2=A0 =C2=A0 * ERROR: no sigdata files were generated for=
 MACHINE qemux86copy in /home/jenkins/oe/world/shr-core/tmp-glibc/stamps</d=
iv><div>=C2=A0 =C2=A0 * ERROR: Nothing PROVIDES &#39;udev&#39; (but /home/j=
enkins/oe/world/shr-core/openembedded-core/meta/recipes-bsp/usbutils/<a hre=
f=3D"http://usbutils_008.bb">usbutils_008.bb</a>, /home/jenkins/oe/world/sh=
r-core/meta-openembedded/meta-oe/recipes-connectivity/usbmuxd/<a href=3D"ht=
tp://usbmuxd_git.bb">usbmuxd_git.bb</a>, /home/jenkins/oe/world/shr-core/op=
enembedded-core/meta/recipes-bsp/pciutils/<a href=3D"http://pciutils_3.5.5.=
bb">pciutils_3.5.5.bb</a>, /home/jenkins/oe/world/shr-core/openembedded-cor=
e/meta/recipes-graphics/clutter/<a href=3D"http://clutter-1.0_1.26.2.bb">cl=
utter-1.0_1.26.2.bb</a>, /home/jenkins/oe/world/shr-core/meta-openembedded/=
meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.02.171.bb">li=
bdevmapper_2.02.171.bb</a>, /home/jenkins/oe/world/shr-core/meta-openembedd=
ed/meta-oe/recipes-support/hidapi/<a href=3D"http://hidapi_git.bb">hidapi_g=
it.bb</a>, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/rec=
ipes-gnome/gnome-bluetooth/<a href=3D"http://gnome-bluetooth_3.18.2.bb">gno=
me-bluetooth_3.18.2.bb</a>, /home/jenkins/oe/world/shr-core/meta-qt5/recipe=
s-qt/qt5/<a href=3D"http://qtbase_git.bb">qtbase_git.bb</a>, /home/jenkins/=
oe/world/shr-core/openembedded-core/meta/recipes-devtools/btrfs-tools/<a hr=
ef=3D"http://btrfs-tools_4.12.bb">btrfs-tools_4.12.bb</a>, /home/jenkins/oe=
/world/shr-core/openembedded-core/meta/recipes-gnome/libgudev/<a href=3D"ht=
tp://libgudev_231.bb">libgudev_231.bb</a>, /home/jenkins/oe/world/shr-core/=
openembedded-core/meta/recipes-bsp/pcmciautils/<a href=3D"http://pcmciautil=
s_018.bb">pcmciautils_018.bb</a>, /home/jenkins/oe/world/shr-core/openembed=
ded-core/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-v=
aapi_1.12.2.bb">gstreamer1.0-vaapi_1.12.2.bb</a>, /home/jenkins/oe/world/sh=
r-core/meta-openembedded/meta-oe/recipes-connectivity/gammu/<a href=3D"http=
://gammu_1.32.0.bb">gammu_1.32.0.bb</a>, /home/jenkins/oe/world/shr-core/me=
ta-qt5/recipes-qt/qt5/<a href=3D"http://qtsystems_git.bb">qtsystems_git.bb<=
/a>, /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-gnome/g=
nome-desktop/<a href=3D"http://gnome-desktop3_3.24.2.bb">gnome-desktop3_3.2=
4.2.bb</a>, /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-=
graphics/wayland/<a href=3D"http://libinput_1.8.1.bb">libinput_1.8.1.bb</a>=
, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extende=
d/libcec/<a href=3D"http://libcec_git.bb">libcec_git.bb</a>, /home/jenkins/=
oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/libatasmart/<a =
href=3D"http://libatasmart_0.19.bb">libatasmart_0.19.bb</a>, /home/jenkins/=
oe/world/shr-core/openembedded-core/meta/recipes-sato/webkit/<a href=3D"htt=
p://webkitgtk_2.16.6.bb">webkitgtk_2.16.6.bb</a>, /home/jenkins/oe/world/sh=
r-core/meta-openembedded/meta-filesystems/recipes-utils/udevil/<a href=3D"h=
ttp://udevil_0.4.4.bb">udevil_0.4.4.bb</a>, /home/jenkins/oe/world/shr-core=
/meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4=
l-utils_1.12.3.bb">v4l-utils_1.12.3.bb</a>, /home/jenkins/oe/world/shr-core=
/openembedded-core/meta/recipes-multimedia/pulseaudio/<a href=3D"http://pul=
seaudio_10.0.bb">pulseaudio_10.0.bb</a>, /home/jenkins/oe/world/shr-core/op=
enembedded-core/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils-s=
cripts_1.1.4.bb">alsa-utils-scripts_1.1.4.bb</a>, /home/jenkins/oe/world/sh=
r-core/openembedded-core/meta/recipes-multimedia/alsa/<a href=3D"http://als=
a-utils_1.1.4.bb">alsa-utils_1.1.4.bb</a>, /home/jenkins/oe/world/shr-core/=
meta-openembedded/meta-oe/recipes-support/pcsc-lite/<a href=3D"http://pcsc-=
lite_1.8.22.bb">pcsc-lite_1.8.22.bb</a>, /home/jenkins/oe/world/shr-core/op=
enembedded-core/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-vi=
deo-intel_git.bb">xf86-video-intel_git.bb</a>, /home/jenkins/oe/world/shr-c=
ore/openembedded-core/meta/recipes-graphics/wayland/<a href=3D"http://westo=
n_2.0.0.bb">weston_2.0.0.bb</a>, /home/jenkins/oe/world/shr-core/meta-opene=
mbedded/meta-networking/recipes-connectivity/dhcpcd/<a href=3D"http://dhcpc=
d_6.11.3.bb">dhcpcd_6.11.3.bb</a>, /home/jenkins/oe/world/shr-core/meta-ope=
nembedded/meta-xfce/recipes-xfce/thunar/<a href=3D"http://thunar_1.6.12.bb"=
>thunar_1.6.12.bb</a>, /home/jenkins/oe/world/shr-core/meta-openembedded/me=
ta-oe/recipes-support/multipath-tools/<a href=3D"http://multipath-tools_0.7=
.1.bb">multipath-tools_0.7.1.bb</a>, /home/jenkins/oe/world/shr-core/meta-o=
penembedded/meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.02.171.bb=
">lvm2_2.02.171.bb</a>, /home/jenkins/oe/world/shr-core/openembedded-core/m=
eta/recipes-connectivity/ofono/<a href=3D"http://ofono_1.20.bb">ofono_1.20.=
bb</a>, /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-conn=
ectivity/bluez5/<a href=3D"http://bluez5_5.46.bb">bluez5_5.46.bb</a>, /home=
/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/hwloc=
/<a href=3D"http://hwloc_1.11.5.bb">hwloc_1.11.5.bb</a>, /home/jenkins/oe/w=
orld/shr-core/meta-openembedded/meta-oe/recipes-benchmark/glmark2/<a href=
=3D"http://glmark2_git.bb">glmark2_git.bb</a>, /home/jenkins/oe/world/shr-c=
ore/meta-openembedded/meta-oe/recipes-support/libcyusbserial/<a href=3D"htt=
p://libcyusbserial_git.bb">libcyusbserial_git.bb</a> DEPENDS on or otherwis=
e requires it)</div><div>=C2=A0 =C2=A0 * ERROR: Required build target &#39;=
meta-world-pkgdata&#39; has no buildable providers.</div><div>=C2=A0 =C2=A0=
 * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/jenk=
ins/oe/world/shr-core/tmp-glibc/stamps</div><div><br></div><div><br></div><=
div>PNBLACKLISTs:</div><div>openembedded-core/:</div><div>meta-browser:</di=
v><div>meta-openembedded:</div><div>meta-networking/recipes-support/lksctp-=
tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools] ?=3D &quot;${@bb.uti=
ls.contains(&#39;DISTRO_FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;BROKEN: =
fails to link against sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;</di=
v><div>meta-qt5:</div><div>PNBLACKLIST[android-system] =3D &quot;depends on=
 lxc from meta-virtualiazation which isn&#39;t included in my world builds&=
quot;</div><div>PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and doesn&#39=
;t really need to be tested so much&quot;</div><div>PNBLACKLIST[bigbuckbunn=
y-480p] =3D &quot;big and doesn&#39;t really need to be tested so much&quot=
;</div><div>PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t re=
ally need to be tested so much&quot;</div><div>PNBLACKLIST[bigbuckbunny-720=
p] =3D &quot;big and doesn&#39;t really need to be tested so much&quot;</di=
v><div>PNBLACKLIST[tearsofsteel-1080p] =3D &quot;big and doesn&#39;t really=
 need to be tested so much&quot;</div><div>PNBLACKLIST[build-appliance-imag=
e] =3D &quot;tries to include whole downloads directory in /home/builder/po=
ky :/&quot;</div><div><br></div><div><br></div><div>QA issues by type:</div=
><div>count: 0<span style=3D"white-space:pre">	</span>issue: already-stripp=
ed</div><div><br></div><div><br></div><div>count: 0<span style=3D"white-spa=
ce:pre">	</span>issue: libdir</div><div><br></div><div><br></div><div>count=
: 1<span style=3D"white-space:pre">	</span>issue: textrel</div><div>corosyn=
c-2.4.2: ELF binary &#39;/work/core2-64-oe-linux/corosync/2.4.2-r0/packages=
-split/corosync/usr/sbin/corosync&#39; has relocations in .text [textrel]</=
div><div><br></div><div><br></div><div>count: 0<span style=3D"white-space:p=
re">	</span>issue: build-deps</div><div><br></div><div><br></div><div>count=
: 0<span style=3D"white-space:pre">	</span>issue: file-rdeps</div><div><br>=
</div><div><br></div><div>count: 4<span style=3D"white-space:pre">	</span>i=
ssue: version-going-backwards</div><div>packagegroup-core-standalone-sdk-ta=
rget-1.0: Package version for package packagegroup-core-standalone-sdk-targ=
et-dbg went backwards which would break package feeds from (0:1.0-r8.14 to =
0:1.0-r8.13) [version-going-backwards]</div><div>packagegroup-core-standalo=
ne-sdk-target-1.0: Package version for package packagegroup-core-standalone=
-sdk-target-dev went backwards which would break package feeds from (0:1.0-=
r8.14 to 0:1.0-r8.13) [version-going-backwards]</div><div>packagegroup-core=
-standalone-sdk-target-1.0: Package version for package packagegroup-core-s=
tandalone-sdk-target-ptest went backwards which would break package feeds f=
rom (0:1.0-r8.14 to 0:1.0-r8.13) [version-going-backwards]</div><div>packag=
egroup-core-standalone-sdk-target-1.0: Package version for package packageg=
roup-core-standalone-sdk-target went backwards which would break package fe=
eds from (0:1.0-r8.14 to 0:1.0-r8.13) [version-going-backwards]</div><div><=
br></div><div><br></div><div>count: 5<span style=3D"white-space:pre">	</spa=
n>issue: host-user-contaminated</div><div>glibc-locale-2.26: glibc-locale: =
/glibc-binary-localedata-ms-my/usr/lib/locale/ms_MY/LC_COLLATE is owned by =
uid 3004, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]</div><div>glibc-locale-2.26: g=
libc-locale: /glibc-binary-localedata-quz-pe/usr/lib/locale/quz_PE/LC_NAME =
is owned by uid 3004, which is the same as the user running bitbake. This m=
ay be due to host contamination [host-user-contaminated]</div><div>qtbase-5=
.9.2+gitAUTOINC+ec16ba393b: qtbase: /qtbase-dev/usr/lib/cmake/Qt5Gui/Qt5Gui=
_QJpegPlugin.cmake is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]=
</div><div>qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: qtquickcontrols2: =
/qtquickcontrols2-qmlplugins/usr/lib/qt5/qml/QtQuick/Controls.2/Material/qm=
ldir is owned by uid 3004, which is the same as the user running bitbake. T=
his may be due to host contamination [host-user-contaminated]</div><div>qts=
cript-5.9.2+gitAUTOINC+08b74f4f30: qtscript: /qtscript-mkspecs/usr/lib/qt5/=
mkspecs/modules/qt_lib_script.pri is owned by uid 3004, which is the same a=
s the user running bitbake. This may be due to host contamination [host-use=
r-contaminated]</div><div><br></div><div><br></div><div>count: 0<span style=
=3D"white-space:pre">	</span>issue: installed-vs-shipped</div><div><br></di=
v><div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>issue=
: unknown-configure-option</div><div><br></div><div><br></div><div>count: 0=
<span style=3D"white-space:pre">	</span>issue: symlink-to-sysroot</div><div=
><br></div><div><br></div><div>count: 0<span style=3D"white-space:pre">	</s=
pan>issue: invalid-pkgconfig</div><div><br></div><div><br></div><div>count:=
 0<span style=3D"white-space:pre">	</span>issue: pkgname</div><div><br></di=
v><div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>issue=
: ldflags</div><div><br></div><div><br></div><div>count: 0<span style=3D"wh=
ite-space:pre">	</span>issue: compile-host-path</div><div><br></div><div><b=
r></div><div>count: 2<span style=3D"white-space:pre">	</span>issue: qa_pseu=
do</div><div>qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work=
/core2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/ps=
eudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>qtwebview-5.9.2+g=
itAUTOINC+ec640efd1d: This /work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOI=
NC+ec640efd1d-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div=
><br></div><div><br></div><div><br></div><div>This git log matches with the=
 metadata as seen by qemuarm build.</div><div>In some cases qemux86 and qem=
ux86-64 builds are built with slightly</div><div>different metadata, you ca=
n see the exact version near the top of each</div><div>log.world.qemu* file=
s linked from the report</div><div><br></div><div>=3D=3D Tested changes (no=
t included in master yet) - bitbake =3D=3D</div><div>latest upstream commit=
:=C2=A0</div><div>be393f2 toaster/highlight.pack.js: Fix corrupted file</di=
v><div>not included in master yet:=C2=A0</div><div>3fba1ad world-image: add=
 extra target</div><div>c7c01bf fetch2: Allow Fetch.download() to warn inst=
ead of error</div><div><br></div><div>=3D=3D Tested changes (not included i=
n master yet) - openembedded-core =3D=3D</div><div>latest upstream commit:=
=C2=A0</div><div>3b413a8 README.qemu: qemuppc64 is not supported</div><div>=
not included in master yet:=C2=A0</div><div>3ff8d67 report-error: Allow to =
upload reports automatically</div><div>c7e8c96 buildhistory.bbclass: metada=
ta-revs show repo parent</div><div>e2c9020 metadata-revs: provide more info=
rmation</div><div>cd6556e qemux86: Add identical qemux86copy variant for te=
sts</div><div>347a734 reproducible_build.bbclass: initial support for binar=
y reproducibility</div><div>625d2bc cpio: provide cpio-replacement-native</=
div><div>ce7ca36 image_types.bbclass: improve cpio image reproducibility</d=
iv><div>fea2911 rootfs-postcommands.bbclass: support binary reproducibility=
</div><div>981e97a sstate.bbclass: Do not cause build failures due to setsc=
ene errors</div><div>b53517c insane.bbclass: Add do_qa_pseudo function to c=
heck for common errors listed in pseudo.log</div><div>f829dbd libsdl2: allo=
w to build native and nativesdk</div><div>5c05822 libdrm: allow to build na=
tive and nativesdk</div><div>95faa5e nativesdk-mesa,mesa-native: add new re=
cipe to build small part of mesa</div><div>bd4c162 libepoxy: add support fo=
r native(sdk)</div><div>3092b61 libjpeg-turbo: provide nativesdk version</d=
iv><div>5471ea7 virglrenderer: add new recipe</div><div>8c4c3fc virglrender=
er: fix target build</div><div>81e5bc3 qemu: add PACKAGECONFIG for virtglre=
nderer, sdl2 and spice</div><div>c37486d insane.bbclass: use package_qa_han=
dle_error for do_qa_pseudo</div><div><br></div><div>=3D=3D Tested changes (=
not included in master yet) - meta-openembedded =3D=3D</div><div>latest ups=
tream commit:=C2=A0</div><div>5d6d21e libreport: fix Nothing RPROVIDES &#39=
;lib32-python3-libreport&#39;</div><div>not included in master yet:=C2=A0</=
div><div>ebcef48 bridge-utils: modify the AR to cross toolchain</div><div><=
br></div><div>=3D=3D Tested changes (not included in master yet) - meta-qt5=
 =3D=3D</div><div>latest upstream commit:=C2=A0</div><div>d87335a qt5-ptest=
.inc: fix qtxmlpatterns:do_install_ptest out-of-order call</div><div>not in=
cluded in master yet:=C2=A0</div><div>197811b qtwebengine: make test suite =
succeed</div><div><br></div><div>=3D=3D Tested changes (not included in mas=
ter yet) - meta-browser =3D=3D</div><div>latest upstream commit:=C2=A0</div=
><div>26d5066 firefox: fix build failures</div><div>not included in master =
yet:=C2=A0</div><div>6773bf9 meta: drop ${COREBASE}/LICENSE references</div=
></div>

--f403045d5cfaf637c4055cc353ee--
