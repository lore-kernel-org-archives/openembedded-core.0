Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8648877142;
	Mon, 22 Feb 2016 12:29:51 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b205so153323956wmb.1;
	Mon, 22 Feb 2016 04:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=ePbyHZbBRzuQv4nJOC3RET9OiSvnnxxuuwyGMK7/m3U=;
	b=gdYFPj5zCxId2lgMQrMUZc7wTE0xni3sQgb1L9VhIxIdpUMSgIeKATmM3ozO8uWU5f
	TLbJ1nSUG61n3v459T8DcaK/vRRts6lY+nzWRUv5UYJmUjEH7ISQElhIjJssv8kZd0+J
	TEj6Bq+rn37VWnEZKdwA/JWcQ4ZInjjNZudiRqR7okQSA+6A3GLP7cSggVw5Trg6pTLp
	rqyk8sBytzYmM9fbIc+tXZcbvhlONf+8kbhCz9Qtz0nQhkbgkbV0B2nSR/z5LuJnD86k
	FvQ2z0S8BsFpKmnZ2I+6PNJD9UAs5yVXEiSntNVpPSXBJLb0kJKjWoBKjSk41+moubhZ
	pPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ePbyHZbBRzuQv4nJOC3RET9OiSvnnxxuuwyGMK7/m3U=;
	b=MVrqwFYKzwyN2MSnFi6VYk48pplrLFk4MwJqTKG1FETYybk48WXix2UAhDAo6iFysv
	e8XJvyctB52Kc7cZoyrIYJLsicFU/Gsk8c7zLSjQ6Ka17p2LZg/n0hWDhwBlkIQntqs2
	IFF0OPGwpnn0XCPCIv3exZD3d5uVyTIx7PpBwKhClAuFrBcMxTsm/qBWr9weAOMaqYsG
	ESX1rbGQGS+hSAil0UOy1rMlUl3h06e3afZ+L0VvRAHCAeYmIUO9aIA9TV+J3gxH8dIL
	+lgTaDmFzPgyNcofx+ZeKFHtQH1LaoU+4YCWaaAviHuXq1HU7W4RKn6s48g3RKwpa6WA
	MUwA==
X-Gm-Message-State: AG10YOSL4Lm/5BzYtr7mweZPkj2WYA/vFZ5D7bmUo1NfV6qjvXHiQsN+u2Hh/LhMnSN9EQ==
X-Received: by 10.28.153.14 with SMTP id b14mr13061170wme.93.1456144191730;
	Mon, 22 Feb 2016 04:29:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gg7sm24500394wjd.10.2016.02.22.04.29.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 04:29:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Feb 2016 13:30:42 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160222123042.GA2553@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2016-02-21
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
X-List-Received-Date: Mon, 22 Feb 2016 12:29:54 -0000
X-Groupsio-MsgNum: 78461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
88fded1 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
b399339 sstate-sysroot-cruft.sh: Extend the whitelist
2ad9ddf qemux86: Add identical qemux86copy variant for tests
3fca5dc report-error: Allow to upload reports automatically
f9e549a arch-armv7ve.inc: respect armv7a override as well

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
4640fe7 webmin: adjust mysql module default config
2d48ba3 minidlna: 1.1.4 -> 1.1.5
cf16b27 fio: Remove --disable-static from EXTRA_OECONF
26194c0 xfce4-xkb-plugin: update to 0.7.1
5908b3a xfce4-panel: make date/time plugins handle timezone changes properly
18920ef lssci: Add package
aea0a83 libsdl2-mixer: initial add 2.0.1
4e5c486 libsdl2-ttf: update to 2.0.14
0ba08bc libsdl-ttf: update to 2.0.11
3959c37 libsdl2-image: update to 2.0.1
3e743a9 nginx: update to 1.9.11
762a49b testfloat: Add recipe for version 3a
1a0cfa5 dt: Add 18.32 recipe
2d23d33 Update python recipes to use the common pypi package
0a4a4d1 Update python recipes to use the updated pypi class
a3b9562 Update python3 recipes to use the updated pypi class
9ad0652 Update pypi classes to avoid setuptools inherit to be more flexible
ee848e2 Convert the DESCRIPTION tag to a SUMMARY tag for short summaries.
34167aa lua: update Libs in lua.pc
2e6cce4 lua: use PV for generating Version in lua.pc
491c289 linux-yocto-tiny-kexecboot: disable do_shared_workdir task
a77f278 klibc: fix sh deps ver (PR is needed after PV)
5385d25 source-han-sans-tw-fonts: initial add 1.004
c887327 source-han-sans-kr-fonts: initial add 1.004
ad16b91 source-han-sans-jp-fonts: initial add 1.004
1238d38 source-han-sans-cn-fonts: initial add 1.004
842a068 klibc_2.0.4: Silence Warning about klibc-xxx-so already stripped
90b0c70 klibc_2.0.4: Silence QA Error about non-symlink so [dev-elf]
3f4f556 klibc_2.0.4: update to 4d1997d - Fix build for qemux86
f58a3ed xfce4-whiskermenu-plugin: update to 1.5.2
5734a63 vlc: make sdl optional (enabled by default)
87437f5 vlc: make x11 DISTRO_FEATURE optional (enabled by default)
faef12b lxdm: update to 0.5.3
83180d5 xdelta3: Package update to 3.0.11
dfdcfab krb5: Fix build warning
bd1bf1b wmiconfig: Explicitly set EXTRA_OEMAKE as required
160010b system-setup-keyboard: Explicitly set EXTRA_OEMAKE as required
700c225 libmatroska: Explicitly set EXTRA_OEMAKE as required
9bc1366 libsodium: Update to version 1.0.8.
a8a1f06 linux-yocto-tiny-kexecboot: upgrade to 4.4
86a556e libopus: upgrade to version 1.1.2
ae79b55 llvm: move BugpointPasses.so and LLVMHello.so to separate packages
f208b72 libmms: upgrade to 0.6.4
dd1e08d ntp: remove empty libexecdir to prevent potential QA issues
1776219 toybox: upgrade to 0.7.0
fbaa9f5 efivar: nvme header was renamed in linux 4.4
ff2169b lldpd: Update to version 0.9.0
003d7f7 lldpd: use bash-completion.bbclass
26af79c vpnc: Explicitly set EXTRA_OEMAKE as required
292b9c0 pimd: Explicitly set EXTRA_OEMAKE as required
551ff0c pptp-linux: Explicitly set EXTRA_OEMAKE as required
de52436 vsftpd: Explicitly set EXTRA_OEMAKE as required
04ef855 vlan: Explicitly set EXTRA_OEMAKE as required
6fe61a5 thrift: Add recipe for Apache Thrift.
904ce71 samba: update systemd service files
7f78f41 ntp: update 4.2.8p6
62adfd6 ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
f829392 netkit-telnet: Add to generate telnetlogin.
3f84064 netkit-rsh: add two patches and some fixes.
4f9695b net-snmp: fix cross-compile breakage, add libnl pkgconfig option
cac8c53 efivar: fix zero initializer compiler error
7bf5bf7 fix missing packageconfig for samba with sysvinit
b6633de waf-samba.bbclass: add cross-answers option and files
b892d65 samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
005d369 lowpan-tools: add missing flex/bison deps
7130615 postfix: fix clean broken issue
a197ed1 ncftp: fix build failures with ccdv
e7f7fc6 iscsitarget: skip the arch test for kernel modules
314a64e iscsitarget: split the kernel module into separate package
b8fbb9a netkit-ftp: fixed invalid symlink
20a8aa4 ctdb: add PACKAGECONFIG for libtdb
f3019c1 cim-schema-exper: fix host-user-contaminated
29ccc2a nbd: use BPN in Files
a4c2c29 wireshark: update SRC_URI link to sources
41f1638 postfix: premission of /var/spool/mail seems incorrect

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
4f77855 qt5: skip libdir for ${PN}-dbg and dev-elf for ${PN}-examples-dev
0294b0d qtbase: upgrade SRCREVs a bit more
8475755 nativesdk-qtbase: use runtime linked dbus

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'12'|QA !!Comme=
nt
|-
||		||qemuarm	||qemux86	||qemux86_64	||already-stripped	||libdir	||textrel	=
||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminate=
d	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||=
invalid-pkgconfig	||pkgname	||=09
|-
||2016-02-21	||29	||35	||45	||0		||0		||7		||6		||37		||0		||4		||3		||0		|=
|0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-02-21 =3D=3D

INFO: jenkins-job.sh-1.7.1 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160222_110500.log

=3D=3D=3D common (25) =3D=3D=3D
    * /meta-browser/recipes-mozilla/firefox/firefox_38.4.0esr.bb, do_install
    * /meta-openembedded/meta-filesystems/recipes-filesystems/yaffs2/yaffs2=
-utils_git.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-extended/gtk-theme-torturer/gtk=
-theme-torturer_git.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.=
1.bb, do_install
    * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/ine=
tutils_1.9.4.bb, do_install
    * /meta-openembedded/meta-networking/recipes-connectivity/snort/snort_2=
=2E9.7.5.bb, do_populate_sysroot
    * /meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.7.=
bb, do_compile
    * /meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb, do_pop=
ulate_sysroot
    * /meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7.=
3.bb, do_populate_sysroot
    * /meta-openembedded/meta-networking/recipes-support/dovecot/dovecot_2.=
2.21.bb, do_package_qa
    * /meta-openembedded/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.b=
b, do_compile
    * /meta-openembedded/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb, =
do_package_qa
    * /meta-openembedded/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb, do_=
populate_sysroot
    * /meta-openembedded/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb, do_=
populate_sysroot
    * /meta-openembedded/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.b=
b, do_populate_sysroot
    * /meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.21.bb, do=
_compile
    * /meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.=
8.0.bb, do_populate_sysroot
    * /meta-openembedded/meta-oe/recipes-graphics/tesseract/tesseract_3.02.=
02.bb, do_populate_sysroot
    * /meta-openembedded/meta-oe/recipes-graphics/wayland/wayland-fits_git.=
bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/farsight/libnice_0.0.13.bb=
, do_populate_sysroot
    * /meta-openembedded/meta-oe/recipes-support/libtinyxml2/libtinyxml2_gi=
t.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb, =
do_populate_sysroot
    * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.=
bb, do_configure
    * /meta-smartphone/meta-android/recipes-support/invensense/invensense_g=
it.bb, do_package_qa
    * /meta-smartphone/meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb, =
do_compile

=3D=3D=3D common-x86 (6) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_c=
ompile
    * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-ti=
ny-kexecboot_4.4.bb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-0.10/=
gst-ffmpeg_0.10.13.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrenc=
ykit_git.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=
, do_configure

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.=
0.bb, do_compile
    * /meta-qt5/recipes-qt/qt5/qtbase_git.bb, do_patch
    * /openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb, do=
_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.b=
b, do_package_qa
    * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb=
, do_compile

=3D=3D=3D qemux86_64 (14) =3D=3D=3D
    * /meta-openembedded/meta-gnome/recipes-support/tracker/tracker_0.14.2.=
bb, do_package_qa
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_make_scripts
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_configure
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_make_scripts
    * /meta-openembedded/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.b=
b, do_configure
    * /meta-openembedded/meta-oe/recipes-devtools/dt/dt_18.32.bb, do_patch
    * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do_c=
ompile
    * /meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguest=
drivers_4.3.36.bb, do_make_scripts
    * /meta-openembedded/meta-python/recipes-devtools/python/python-matplot=
lib_1.1.0.bb, do_compile
    * /meta-qt5/recipes-qt/libconnman-qt/libconnman-qt5_git.bb, do_populate=
_sysroot
    * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_populate_sysroot
    * /openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb, do=
_patch
    * /openembedded-core/meta/recipes-kernel/cryptodev/cryptodev-module_1.8=
=2Ebb, do_make_scripts
    * /openembedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do=
_make_scripts

=3D=3D=3D Number of failed tasks (109) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 29	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20160219_162519.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/12683/
|-
|| qemux86 	|| 35	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20160220_133017.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/12690/
|-
|| qemux86_64 	|| 45	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20160221_085839.log// || http://errors.yoctoproject.org:80/Errors/B=
uild/12695/
|}

=3D=3D=3D PNBLACKLISTs (87) =3D=3D=3D

=3D=3D=3D QA issues (57) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||3	||installed-vs-shipped
|-
||37	||file-rdeps
|-
||4	||host-user-contaminated
|-
||6	||build-deps
|-
||7	||textrel
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "OL=
D and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you w=
ant to use these modules with E18, then you need to update it to git recipe=
 fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from http://git.enlightenment.org/enlightenment/modules/n=
ews.git/"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from  http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "de=
pends on blacklisted emprint"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn't =
build with gcc-5"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=3D=
 "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoo=
lnix] ?=3D "BROKEN: Failx to build with gcc-5"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config w=
as removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S})"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', =
"BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] ?=
=3D "BROKEN: fails to build for qemuarm."
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D "BROKEN: Depends on broken yp-tools"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 con=
flicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'blue=
z5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURE=
S', '', d)}"
meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp] ?=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]=
 ?=3D "depends on blacklisted libetpan"
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLAC=
KLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[c=
laws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claw=
s-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb:PNBLACKLIST[pidgin] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D "$=
{@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with blu=
ez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
"broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn't =
build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdepen=
ds on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D "dep=
ends on blacklisted iksemel"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
meta-webos-ports:
conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc from m=
eta-virtualiazation which isn't included in my world builds"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't r=
eally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't r=
eally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[build-appliance-image] =3D "tries to inclu=
de whole downloads directory in /home/builder/poky :/"
conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 7	issue: textrel
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
ffmpeg-2.8.6: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.6-r0/packages-=
split/libavcodec/usr/lib/libavcodec.so.56.60.100' has relocations in .text =
[textrel]
ffmpeg-2.8.6: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.6-r0/packages-=
split/libavfilter/usr/lib/libavfilter.so.5.40.101' has relocations in .text=
 [textrel]
ffmpeg-2.8.6: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.6-r0/packages-=
split/libpostproc/usr/lib/libpostproc.so.53.3.100' has relocations in .text=
 [textrel]
ffmpeg-2.8.6: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.6-r0/packages-=
split/libswresample/usr/lib/libswresample.so.1.2.101' has relocations in .t=
ext [textrel]
ffmpeg-2.8.6: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.6-r0/packages-=
split/libswscale/usr/lib/libswscale.so.3.1.101' has relocations in .text [t=
extrel]
gstreamer1.0-libav-1.6.3: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-=
libav/1.6.3-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libg=
stlibav.so' has relocations in .text [textrel]


count: 6	issue: build-deps
samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency, mi=
ssing libpam in DEPENDS or PACKAGECONFIG? [build-deps]
samba-4.1.12: samba rdkconfig? [file-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires libu=
csi.so()(64bit), but no providers found in RDEPENDS_dvbdate? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requires libdvb=
api.so()(64bit), but no providers found in RDEPENDS_dvbnet? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires=
 libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan requires lib=
dvbsec.so()(64bit), but no providers found in RDEPENDS_dvb-scan? [file-rdep=
s]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic require=
s libdvbapi.so()(64bit), but no providers found in RDEPENDS_dvbtraffic? [fi=
le-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraf=
fic requires libdvbapi.so, but no providers found in its RDEPENDS [file-rde=
ps]
dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires libd=
vbapi.so()(64bit), but no providers found in RDEPENDS_dvb-femon? [file-rdep=
s]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdv=
bsec.so()(64bit), but no providers found in RDEPENDS_dvb-apps? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requi=
res libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
fakeroot-1.18.4: /usr/bin/fakeroot contained in package fakeroot requires /=
bin/bash, but no providers found in RDEPENDS_fakeroot? [file-rdeps]
fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot r=
equires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
gnome-desktop-2.32.1: /usr/bin/gnome-about contained in package gnome-deskt=
op requires /usr/bin/python, but no providers found in RDEPENDS_gnome-deskt=
op? [file-rdeps]
gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in packa=
ge gnome-desktop requires /usr/bin/python, but no providers found in its RD=
EPENDS [file-rdeps]
libbonobo-2.32.1: /usr/bin/bonobo-slay contained in package libbonobo requi=
res /usr/bin/perl, but no providers found in RDEPENDS_libbonobo? [file-rdep=
s]
libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package libbo=
nobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file-r=
deps]
libmodule-build-perl-0.31: /usr/bin/config@underscore@data_libmodule-build-=
perl contained in package libmodule-build-perl requires /tmp/sysroots/x86_6=
4-linux/usr/bin/perl-native/perl.real, but no providers found in its RDEPEN=
DS [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdep=
s]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail r=
equires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.=
so_libnewt-python contained in package libnewt-python requires libnewt.so, =
but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so()(64bit), but no providers =
found in RDEPENDS_libnewt-python? [file-rdeps]
msr-tools-1.3: /usr/sbin/wrmsr_ackage msr-tools requires libc.so.6(GLIBC_2.=
3)(64bit), but no providers found in its RDEPENDS [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so()(64bit), but no providers found in RDEPEN=
DS_networkmanager-nmtui? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect_networkmanager-nmtui containe=
d in package networkmanager-nmtui requires libnewt.so, but no providers fou=
nd in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphysic=
s contained in package numptyphysics requires /usr/bin/perl, but no provide=
rs found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.=
sh_numptyphysics contained in package numptyphysics requires /bin/bash, but=
 no providers found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
perf-1.0: /usr/libexec/perf-core/scripts/python/call-graph-from-postgresql.=
py contained in package perf requires /usr/bin/python2, but no providers fo=
und in RDEPENDS_perf? [file-rdeps]
perf-1.0: /usr/libexec/perf-core/scripts/python/call-graph-from-postgresql.=
py_perf contained in package perf requires /usr/bin/python2, but no provide=
rs found in its RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o contained in package tracker-nautilus-extension requires libnautilus-exte=
nsion.so.1()(64bit), but no providers found in RDEPENDS_tracker-nautilus-ex=
tension? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils co=
ntained in package ubx-utils requires /bin/bash, but no providers found in =
its RDEPENDS [file-rdeps]


count: 0	issue: version-going-backwards


count: 4	issue: host-user-contaminated
babiloo-efl: /babiloo-efl/usr/share/babiloo/core/test/test_dictionary.py is=
 owned by uid 3004, which is the same as the user running bitbake. This may=
 be due to host contamination [host-user-contaminated]
firefox-addon-webconverger: /firefox-addon-webconverger/usr/lib/firefox/ext=
ensions/{ee11fa88-036b-4661-bb04-d436f86bc06a}/content/wc.js is owned by ui=
d 3004, which is the same as the user running bitbake. This may be due to h=
ost contamination [host-user-contaminated]
numptyphysics: /numptyphysics/usr/share/numptyphysics/org_level/L50_nautilu=
s.nph is owned by uid 3004, which is the same as the user running bitbake. =
This may be due to host contamination [host-user-contaminated]
thone: /thone/usr/bin/thone-toggle is owned by uid 3004, which is the same =
as the user running bitbake. This may be due to host contamination [host-us=
er-contaminated]


count: 3	issue: installed-vs-shipped
poppler-data: 261 installed and not shipped files. [installed-vs-shipped]
uim: 5 installed and not shipped files. [installed-vs-shipped]
zsh: 1 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbK/3EACgkQN1Ujt2V2gBz9dgCgpQJQV9pQ44DDoX8LlAiSkFa5
9x8AnA7DZHeYoF3ylv9SPGquKipNu3Nx
=n1zx
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
