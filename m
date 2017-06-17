Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 29BF17839C;
	Sat, 17 Jun 2017 19:56:46 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id e142so29899612ywa.1;
	Sat, 17 Jun 2017 12:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=geS4Eiwwngw2aSngKpNK8kK+dwW8qV0dTArLHeALEJA=;
	b=BnVKhstv0zOgsSeFsH+ncZKhOqc5Xbk7FqndwFXVhteYKAOwega7D6vAMqSTA4dqTj
	96XVERxYF90ro7anJjYZWhaTtQNAl41cBSBMd7dt3FFuMkFmme1CaqD6AoMOWOQ+dnH7
	Zy7xi3lmY5LKMa/oMdx4KfbExPVGgfMocHXmMfGSFzNt+OtrZNcDJBUrkTUtfla/S6oA
	5CJpLCiKv6dOiq4Xq+FAJvh5Xkt0ZcJiDVGSuqocmNpVjvs7g5TMK3pZj/7STescq6iy
	i8ggfe7++rYuSM22M3KKIx6VKXm2+fQ55hiEWx4FQmh3uPJ33rEPGxkQ8Uk2CyycJhTf
	3H6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=geS4Eiwwngw2aSngKpNK8kK+dwW8qV0dTArLHeALEJA=;
	b=P6axAnb/d97IaL/79Ol1YjYDXDdi3b9yZxUnGi8PfJKDZrngLctw/cE5hAinxb4kZF
	HW9I9DtfQj/AdUTzJ/pcSAQypHl0kVuXDcsmkTk8etkv4Fw1po5ezH9AOM/BjDI7rdRO
	XlbOLihbQ6UP56394ky/SOSIY7/d9RT8UmYQfxMOvzCWd9EbXeBMMWtDg9iG0mhMUu2p
	kPuoGasta96oQuNSXWizEeGFe6zRbjnbEZsbnB23tCwqpuOB0U6NO2LpzPWT6EwDje2a
	CrCHGELaF9ZDYpYJpMxezTBmr2uocqP09LnaI9HCBJ7IDtC3EcgzmF+f7vOKpEGwNplG
	cxNw==
X-Gm-Message-State: AKS2vOxctqnowxm9Mvq7PBd5D079KAd+FGZGZzp7CoELHmAPvSOmrQUy
	zWkAEXgC8fqUMrI97PGZGuUndaGZCTXX
X-Received: by 10.129.128.132 with SMTP id q126mr6390139ywf.259.1497729407673; 
	Sat, 17 Jun 2017 12:56:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Sat, 17 Jun 2017 12:56:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 17 Jun 2017 21:56:47 +0200
Message-ID: <CA+chaQcxqikQK2vexppsWQn4M+3=xq0D7QLOEXCwoMMntk+X2w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-06-16
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
X-List-Received-Date: Sat, 17 Jun 2017 19:56:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c034cb2506f0405522d4d31"

--94eb2c034cb2506f0405522d4d31
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

This time with gcc7 and with complete QA list, because sstate (and
prserv cache) were dropped for all the builds).

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!|Signatures		
!!colspan='14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||
|-

||2017-06-16	||6	||12	||9	||0	||0		||1		||4		||0		||0		||78498		||8		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-06-16 ==

INFO: jenkins-job.sh-1.8.23 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170617_093940.log

=== common (5) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.25.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/openocd/openocd_git.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/omhacks_git.bb:do_compile
    * virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb:do_compile

=== common-x86 (3) ===
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb:do_compile_ptest_base

=== qemuarm (1) ===
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb:do_compile

=== qemux86 (3) ===
    * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb:do_compile
    * meta-openembedded/meta-oe/recipes-test/fwts/fwts_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (27) ===
{| class=wikitable
|-
|| qemuarm 	|| 6	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170615_054509.log/
|| http://errors.yoctoproject.org/Errors/Build/39688/
|-
|| qemux86 	|| 12	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170615_054504.log/
|| http://errors.yoctoproject.org/Errors/Build/39571/http://errors.yoctoproject.org/Errors/Build/39572/http://errors.yoctoproject.org/Errors/Build/39689/
|-
|| qemux86_64 	|| 9	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170616_070355.log/
|| http://errors.yoctoproject.org/Errors/Build/39701/http://errors.yoctoproject.org/Errors/Build/39719/
|}

=== PNBLACKLISTs (15) ===

=== QA issues (78511) ===
{| class=wikitable
!| Count		||Issue

|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||1	||libdir
|-
||4	||textrel
|-
||78498	||version-going-backwards
|-
||8	||host-user-contaminated
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170616_063547.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?= "BROKEN:
fails to build with gcc-6"
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130644/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode]
?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon]
?= "BROKEN: not compatible with newer vala,
http://errors.yoctoproject.org/Errors/Details/143058/"
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACKLIST[luna-webappmanager]
?= "BROKEN: needs to be adapted to new qt-5.7"
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]
?= "BROKEN: needs to be adapted to new qtwayland-5.7"
PNBLACKLIST[android-system] = "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"
PNBLACKLIST[linux-yocto-tiny-kexecboot] = "does weird sh!t breaking
other kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other
kernels and modules - broken for years"


QA issues by type:

count: 0	issue: already-stripped

count: 1	issue: libdir

qwt-qt5-dbg: found library in wrong location:
/usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]



count: 4	issue: textrel

chromium-54.0.2810.2: ELF binary
'/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
has relocations in .text [textrel]
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]
mpeg2dec-0.5.1: ELF binary
'/tmp/work/armv5te-oe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]



count: 0	issue: build-deps

count: 0	issue: file-rdeps

count: 78498	issue: version-going-backwards

.....

count: 8	issue: host-user-contaminated
glibc-locale-2.25: glibc-locale:
/glibc-binary-localedata-aa-dj.iso-8859-1/usr/lib/locale/aa_DJ.ISO-8859-1/LC_MEASUREMENT
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
libqofono-0.87+gitrAUTOINC+54435de3be: libqofono:
/libqofono-tests/usr/lib/libqofono-qt5/tests/tst_qofonoconnmancontext
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qt3d-5.9.0+gitAUTOINC+f39d0a0c32: qt3d:
/qt3d-mkspecs/usr/lib/qt5/mkspecs/modules/qt_lib_3dinput.pri is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]
qtmultimedia-5.9.0+gitAUTOINC+559c305ded: qtmultimedia:
/qtmultimedia-examples/usr/share/qt5/examples/multimedia/declarative-camera/PhotoPreview.qml
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtquick1-5.9.0+gitAUTOINC+695460401d: qtquick1:
/qtquick1-examples/usr/share/qt5/examples/declarative/imageelements/image/image
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtserialport-5.9.0+gitAUTOINC+687f5a9bd4: qtserialport:
/qtserialport-examples/usr/share/qt5/examples/serialport/slave/slave.pro
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtsystems-5.9.0+gitAUTOINC+434af789f0: qtsystems:
/qtsystems-examples/usr/share/qt5/examples/systeminfo/qml-battery/qml-battery.qml
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtwebkit-examples-5.9.0+gitAUTOINC+822426abc7: qtwebkit-examples:
/qtwebkit-examples-examples/usr/share/qt5/examples/webkitqml/flickrview/flickrview.qml
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot

count: 0	issue: invalid-pkgconfig

count: 0	issue: pkgname

count: 0	issue: ldflags

count: 0	issue: compile-host-path


== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
5639faa cooker: ensure graceful exit after exception during
BuildCompleted handler
not included in master yet:
b65315d world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
0598466 mtools-native: fix Upstream-Status
not included in master yet:
6b99ffb v86d,qemuboot-x86.inc: use
KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PROBECONF for uvesafb instead of
fbsetup init script
f7ee7fa sstate-sysroot-cruft.sh: Extend the whitelist
1c4954c report-error: Allow to upload reports automatically
5c806cc buildhistory.bbclass: metadata-revs show repo parent
8753fa6 metadata-revs: provide more information
94ed983 qemux86: Add identical qemux86copy variant for tests

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
d3dd8bc fuse: fix fetcher error.
not included in master yet:
a98cf68 dnsmasq: disable the service by default
3191acb freeradius: add new recipe
bd90ccc keepalived: add new recipe
171dca1 vblade: update to version 22
07eccbf geoipupdate: 2.2.2 -> 2.3.1
abf6ee3 ifenslave: 2.7 -> 2.9
a743af5 drbd-utils: remove /var/lock to avoid conflict
7e5f536 wireguard: bump version to latest snapshot 0.0.20170517
9ecb0d6 opensaf: Add -latomic to LDFLAGS
12a4da1 open-isns: fix QA issue
431bad1 dante: fix unknown-configure-option QA issue
0b1195e snort: enable static daq
c8257b2 net-snmp: supported cross compile for the perl embedded and perl modules
4962077 traceroute: Move manual pages from mandir to man8 under it
e90e1d0 nopoll: Disable doc generation
a319386 cifs-utils 6.6 -> 6.7
00b9dd8 openvpn: Upgrade 2.3.9 -> 2.4.2
e68ed29 proftpd: Update to 1.3.6 release
0486de7 samba: Fix build with musl
b4ae520 wireshark: Upgrade to 2.2.7
8ca9eb3 ippool: add new recipe
d928074 libdevmapper: sync with lvm2 2.02.171
3e6defe samba: upgrade to 4.6.5
522ea88 recipes: remove blacklisted recipes

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
6605c48 python-pyqt5: Add recipe.
not included in master yet:
1c80edb Upgrade to Qt 5.9.0
8be83b0 qtbase: respect "ld-is-gold" DISTRO_FEATURES

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
880a7bd Revert "firefox: Use system-wide cairo instead of built-in one"
not included in master yet:
05e7482 gnome-settings-daemon: remove the bbappend for removed recipe
a7b0b40 firefox-l10n.inc: mangle download filename instead of DL_DIR

== Tested changes (not included in master yet) - meta-webos-ports ==
latest upstream commit:
47091c6 ofono: Use Mer's 1.19 and include fix
not included in master yet:
d23aeb0 mesa: remove --with-llvm-prefix in meta-luneui instead of meta-luneos
47ebb4f README: update to depend on master branches
29413ad qtbase: enable fontconfig
a457d20 qtwayland, qtwebengine: use webOS-ports/master-next branch
compatible with 5.7
e1f0c7e luna-next: Make compatible with Qt 5.7
f557d2e qtwayland, qtwebengine: temporary drop bbappend
013635d luna-sysservice: Fix build with qt 5.7
426a038 luna-next, luna-webappmanager: temporary drop from image
0fe78d3 packagegroup-luneos-development: drop qt5-opengles2-test
4d68be8 libconnman-qt: replace with libconnman-qt5 from meta-qt5
261c358 libqofono: use the recipe from meta-qt5
bddfec2 qtlocation: drop invalid and unused OE_LUNEOS_ENABLED option
3aba05c phonesim: fix build with Qt 5.8
7f330a0 qtbase: enable xkbcommon-evdev for qtwayland
8e72c39 qt5-qpa-hwcomposer-plugi: Fix build with Qt 5.8
178db00 packagegroup-luneos-extended: drop qtscenegraph-adaptation

== Tested changes (not included in master yet) - meta-smartphone ==
latest upstream commit:
be8374b libsensmon: blacklist due to newer vala incompatibility
not included in master yet:
a41a338 meta-shr, meta-fso: remove blacklisted recipes

--94eb2c034cb2506f0405522d4d31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre id=3D"gmail-out" class=3D"gmail-console-output" style=
=3D"box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom=
:0px"><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x"><a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/www.openembedded.org/wiki/Bitbake_World_Status</a>
<br></pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-=
wrap;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-botto=
m:0px">This time with gcc7 and with complete QA list, because sstate (and p=
rserv cache) were dropped for all the builds).</pre><pre style=3D"color:rgb=
(51,51,51);font-size:14px;white-space:pre-wrap;box-sizing:border-box;word-w=
rap:break-word;margin-top:0px;margin-bottom:0px">=3D=3D Number of issues - =
stats =3D=3D
{| class=3D&#39;wikitable&#39;
!|Date		     !!colspan=3D&#39;3&#39;|Failed tasks			    !!|Signatures		  !!=
colspan=3D&#39;14&#39;|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||=09
|-
</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x">||2017-06-16	||6	||12	||9	||0	||0		||1		||4		||0		||0		||78498		||8		||0=
		||0		||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-06-16 =3D=3D

INFO: jenkins-job.sh-1.8.23 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170617_093940.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170617_093=
940.log</a>

=3D=3D=3D common (5) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.25.=
bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/openocd/openocd_git.bb:do_=
compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/omhacks_git.bb:do_compi=
le
    * virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/=
kexecboot_0.6.bb:do_compile

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.=
bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb:d=
o_compile_ptest_base

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb=
:do_compile

=3D=3D=3D qemux86 (3) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:do_comp=
ile
    * meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-uti=
ls/iscsi-initiator-utils_2.0.874.bb:do_compile
    * meta-openembedded/meta-oe/recipes-test/fwts/fwts_git.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (27) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 6	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170615_054509.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170615_054509.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/39688/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/39688/</a>
|-
|| qemux86 	|| 12	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/rocko/log.world.qemux86.20170615_054504.log/" style=3D"box-sizing:bord=
er-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.o=
rg/buildlogs/oe/world/rocko/log.world.qemux86.20170615_054504.log/</a> || <=
a href=3D"http://errors.yoctoproject.org/Errors/Build/39571/" style=3D"box-=
sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.=
yoctoproject.org/Errors/Build/39571/</a>
<a href=3D"http://errors.yoctoproject.org/Errors/Build/39572/" style=3D"box=
-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors=
.yoctoproject.org/Errors/Build/39572/</a>
<a href=3D"http://errors.yoctoproject.org/Errors/Build/39689/" style=3D"box=
-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors=
.yoctoproject.org/Errors/Build/39689/</a>
|-
|| qemux86_64 	|| 9	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170616_070355.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170616_070355.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/39701/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/39701/</a>
<a href=3D"http://errors.yoctoproject.org/Errors/Build/39719/" style=3D"box=
-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors=
.yoctoproject.org/Errors/Build/39719/</a>
|}
</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x">=3D=3D=3D PNBLACKLISTs (15) =3D=3D=3D
</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x">=3D=3D=3D QA issues (78511) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x">|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||1	||libdir
|-
||4	||textrel
|-
||78498	||version-going-backwards
|-
||8	||host-user-contaminated
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170616_063547.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170616_063547.log/</a>

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D &quot;BROKEN=
: fails to build with gcc-6&quot;
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blu=
ez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTR=
O_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#=
39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#=
39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is s=
elected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130644/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13064=
4/</a> - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130607/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13060=
7/</a> - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D &quot;BROKEN, fails to build - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blue=
z5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO=
_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D &quot;${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5=
 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39=
;&#39;, d)}&quot;
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D &quot;${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5=
 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39=
;&#39;, d)}&quot;
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;=
, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATUR=
ES&#39;, &#39;&#39;, d)}&quot;
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon] ?=
=3D &quot;BROKEN: not compatible with newer vala, <a href=3D"http://errors.=
yoctoproject.org/Errors/Details/143058/" style=3D"box-sizing:border-box;wor=
d-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Erro=
rs/Details/143058/</a>&quot;
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACK=
LIST[luna-webappmanager] ?=3D &quot;BROKEN: needs to be adapted to new qt-5=
.7&quot;
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
=3D &quot;BROKEN: needs to be adapted to new qtwayland-5.7&quot;
PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtualiazat=
ion which isn&#39;t included in my world builds&quot;
PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[tearsofsteel-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[build-appliance-image] =3D &quot;tries to include whole downloa=
ds directory in /home/builder/poky :/&quot;
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D &quot;does weird sh!t breaking =
other kernels and modules - broken for years&quot;
PNBLACKLIST[linux-yocto-tiny] =3D &quot;does weird sh!t breaking other kern=
els and modules - broken for years&quot;


QA issues by type:
</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x">count: 0	issue: already-stripped
</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x"></pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-w=
rap;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom=
:0px">count: 1	issue: libdir
</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x">qwt-qt5-dbg: found library in wrong location: /usr/plugins/designer/.deb=
ug/libqwt_designer_plugin.so [libdir]


</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x">count: 4	issue: textrel
</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x">chromium-54.0.2810.2: ELF binary &#39;/tmp/work/i586-oe-linux/chromium/5=
4.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome&#39; has relo=
cations in .text [textrel]
corosync-2.4.2: ELF binary &#39;/tmp/work/core2-64-oe-linux/corosync/2.4.2-=
r0/packages-split/corosync/usr/sbin/corosync&#39; has relocations in .text =
[textrel]
mpeg2dec-0.5.1: ELF binary &#39;/tmp/work/armv5te-oe-linux-gnueabi/mpeg2dec=
/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0&#39; has reloca=
tions in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-linux/x=
264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.1=
48&#39; has relocations in .text [textrel]


</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x">count: 0	issue: build-deps
</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x"></pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-w=
rap;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom=
:0px">count: 0	issue: file-rdeps
</pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-wrap=
;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0p=
x"></pre><pre style=3D"color:rgb(51,51,51);font-size:14px;white-space:pre-w=
rap;box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom=
:0px">count: 78498	issue: version-going-backwards</pre><pre style=3D"color:=
rgb(51,51,51);font-size:14px;white-space:pre-wrap;box-sizing:border-box;wor=
d-wrap:break-word;margin-top:0px;margin-bottom:0px">.....</pre><pre style=
=3D"box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom=
:0px"><font color=3D"#333333"><span style=3D"font-size:14px;white-space:pre=
-wrap">count: 8	issue: host-user-contaminated
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-aa-dj.iso-8859-1/=
usr/lib/locale/aa_DJ.ISO-8859-1/LC_MEASUREMENT is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]
libqofono-0.87+gitrAUTOINC+54435de3be: libqofono: /libqofono-tests/usr/lib/=
libqofono-qt5/tests/tst_qofonoconnmancontext is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
qt3d-5.9.0+gitAUTOINC+f39d0a0c32: qt3d: /qt3d-mkspecs/usr/lib/qt5/mkspecs/m=
odules/qt_lib_3dinput.pri is owned by uid 3004, which is the same as the us=
er running bitbake. This may be due to host contamination [host-user-contam=
inated]
qtmultimedia-5.9.0+gitAUTOINC+559c305ded: qtmultimedia: /qtmultimedia-examp=
les/usr/share/qt5/examples/multimedia/declarative-camera/PhotoPreview.qml i=
s owned by uid 3004, which is the same as the user running bitbake. This ma=
y be due to host contamination [host-user-contaminated]
qtquick1-5.9.0+gitAUTOINC+695460401d: qtquick1: /qtquick1-examples/usr/shar=
e/qt5/examples/declarative/imageelements/image/image is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]
qtserialport-5.9.0+gitAUTOINC+687f5a9bd4: qtserialport: /qtserialport-examp=
les/usr/share/qt5/examples/serialport/slave/<a href=3D"http://slave.pro">sl=
ave.pro</a> is owned by uid 3004, which is the same as the user running bit=
bake. This may be due to host contamination [host-user-contaminated]
qtsystems-5.9.0+gitAUTOINC+434af789f0: qtsystems: /qtsystems-examples/usr/s=
hare/qt5/examples/systeminfo/qml-battery/qml-battery.qml is owned by uid 30=
04, which is the same as the user running bitbake. This may be due to host =
contamination [host-user-contaminated]
qtwebkit-examples-5.9.0+gitAUTOINC+822426abc7: qtwebkit-examples: /qtwebkit=
-examples-examples/usr/share/qt5/examples/webkitqml/flickrview/flickrview.q=
ml is owned by uid 3004, which is the same as the user running bitbake. Thi=
s may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot

count: 0	issue: invalid-pkgconfig

count: 0	issue: pkgname

count: 0	issue: ldflags

count: 0	issue: compile-host-path


=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
5639faa cooker: ensure graceful exit after exception during BuildCompleted =
handler
not included in master yet:=20
b65315d world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
0598466 mtools-native: fix Upstream-Status
not included in master yet:=20
6b99ffb v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script
f7ee7fa sstate-sysroot-cruft.sh: Extend the whitelist
1c4954c report-error: Allow to upload reports automatically
5c806cc buildhistory.bbclass: metadata-revs show repo parent
8753fa6 metadata-revs: provide more information
94ed983 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
d3dd8bc fuse: fix fetcher error.
not included in master yet:=20
a98cf68 dnsmasq: disable the service by default
3191acb freeradius: add new recipe
bd90ccc keepalived: add new recipe
171dca1 vblade: update to version 22
07eccbf geoipupdate: 2.2.2 -&gt; 2.3.1
abf6ee3 ifenslave: 2.7 -&gt; 2.9
a743af5 drbd-utils: remove /var/lock to avoid conflict
7e5f536 wireguard: bump version to latest snapshot 0.0.20170517
9ecb0d6 opensaf: Add -latomic to LDFLAGS
12a4da1 open-isns: fix QA issue
431bad1 dante: fix unknown-configure-option QA issue
0b1195e snort: enable static daq
c8257b2 net-snmp: supported cross compile for the perl embedded and perl mo=
dules
4962077 traceroute: Move manual pages from mandir to man8 under it
e90e1d0 nopoll: Disable doc generation
a319386 cifs-utils 6.6 -&gt; 6.7
00b9dd8 openvpn: Upgrade 2.3.9 -&gt; 2.4.2
e68ed29 proftpd: Update to 1.3.6 release
0486de7 samba: Fix build with musl
b4ae520 wireshark: Upgrade to 2.2.7
8ca9eb3 ippool: add new recipe
d928074 libdevmapper: sync with lvm2 2.02.171
3e6defe samba: upgrade to 4.6.5
522ea88 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
6605c48 python-pyqt5: Add recipe.
not included in master yet:=20
1c80edb Upgrade to Qt 5.9.0
8be83b0 qtbase: respect &quot;ld-is-gold&quot; DISTRO_FEATURES

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
880a7bd Revert &quot;firefox: Use system-wide cairo instead of built-in one=
&quot;
not included in master yet:=20
05e7482 gnome-settings-daemon: remove the bbappend for removed recipe
a7b0b40 firefox-l10n.inc: mangle download filename instead of DL_DIR

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
latest upstream commit:=20
47091c6 ofono: Use Mer&#39;s 1.19 and include fix
not included in master yet:=20
d23aeb0 mesa: remove --with-llvm-prefix in meta-luneui instead of meta-lune=
os
47ebb4f README: update to depend on master branches
29413ad qtbase: enable fontconfig
a457d20 qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.7
e1f0c7e luna-next: Make compatible with Qt 5.7
f557d2e qtwayland, qtwebengine: temporary drop bbappend
013635d luna-sysservice: Fix build with qt 5.7
426a038 luna-next, luna-webappmanager: temporary drop from image
0fe78d3 packagegroup-luneos-development: drop qt5-opengles2-test
4d68be8 libconnman-qt: replace with libconnman-qt5 from meta-qt5
261c358 libqofono: use the recipe from meta-qt5
bddfec2 qtlocation: drop invalid and unused OE_LUNEOS_ENABLED option
3aba05c phonesim: fix build with Qt 5.8
7f330a0 qtbase: enable xkbcommon-evdev for qtwayland
8e72c39 qt5-qpa-hwcomposer-plugi: Fix build with Qt 5.8
178db00 packagegroup-luneos-extended: drop qtscenegraph-adaptation

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
be8374b libsensmon: blacklist due to newer vala incompatibility
not included in master yet:=20
a41a338 meta-shr, meta-fso: remove blacklisted recipes<br></span></font></p=
re></pre></div>

--94eb2c034cb2506f0405522d4d31--
