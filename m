Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8105877157;
	Wed, 27 Jan 2016 14:08:02 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n5so29962736wmn.1;
	Wed, 27 Jan 2016 06:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=ermyNBHXcYbuWYoXv0TBapBHvpsbuVvwRfNgeLsz75k=;
	b=rErsWVRqYNgeRKK1Ffx5RR29mZgayWko7LeaCXCxSv9CtzLx/uyuZznXiQb1sBRINr
	ilcilFr6IlnLDiL8FqV65rk6KVkgVoxdJZtEKEpabumZ99niFtAtSfqt3JJotHz4R7CO
	IgyS4m9OJc/jmhxjWRFyFtUNVzxnjD2n4AqO/cgGeMCcsn67zWc0+1KTcJDe4ySr7FBk
	37Y7/c6sd5HRGVtTz+fahkf3xUSMRLn/CpKdK9ycmDL3i81Q6rrmRMNC01sdm61UnZ7C
	7OM+kDPCJsi9fG2SgPrVTo5PTRLLjAVqqeH19g74jtlghZWHBGTpQp14tGa11d8ikEp3
	J1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=ermyNBHXcYbuWYoXv0TBapBHvpsbuVvwRfNgeLsz75k=;
	b=F2FjDVshsMI3msHDzg6f7sjJG6scf8qpiHZqz7H3TIR8d1Tv0AuaQEho0Ai2O0gN1V
	8YEgctf9/TWULPRSWlx0MG74PmzajWv08rJPOecfmMIS/QBf9x8lry1YHZutRdssTUTB
	99/t5s436r2Yy8mLbDxdj8ynnwOkA9ACnshsnffagqJMHo6H3UTbbq5F/eDXubB7VSGo
	ih8UTXMrtQFhP++XuR1m4lo5bxCdQoJwsdtMh6la9uIvHIInaLJ3xvXPHEKLj+ErtUVr
	CiHRX0nwhPtQ7RHauhdYkrcUNst5efqVnObbRZL1vXOKdcUVfDJLXZwbTF2vOWt0BE76
	pBig==
X-Gm-Message-State: AG10YOSUbbrpEWtZS0Fw6myJfx1XwIB7UBNkE5s9YRIPO6rZW3whcLLZ0h4BAnLdtT43rA==
X-Received: by 10.28.107.81 with SMTP id g78mr29329633wmc.16.1453903682155;
	Wed, 27 Jan 2016 06:08:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t199sm7844919wmt.23.2016.01.27.06.08.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 06:08:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2016 15:10:13 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20160127141013.GE2574@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2016-01-25
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
X-List-Received-Date: Wed, 27 Jan 2016 14:08:03 -0000
X-Groupsio-MsgNum: 76980
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PGNNI9BzQDUtgA2J"
Content-Disposition: inline

--PGNNI9BzQDUtgA2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

qemux86_64 contains many more failures, because it was using slightly
newer oe-core which again breaks more stuff.

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
450125e world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
350c6c9 gcc-5.3: backport fix for PR-target-65358
df4cae6 sstate-sysroot-cruft.sh: Extend the whitelist
5ff1a11 arch-armv7ve.inc: respect armv7a override as well
16bcee4 qemux86: Add identical qemux86copy variant for tests
cfe84fc report-error: Allow to upload reports automatically

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
804741c telepathy-glib: update python-native-runtime dependency
4c8764a phoronix-test-suite: exclude bash, php, python dependency with SIGG=
EN_EXCLUDE_SAFE_RECIPE_DEPS
5a31e7d networkmanager-openvpn: Update to 1.0.8
8a4d046 networkmanager: 1.0.6 -> 1.0.10
b30db7f mplayer2: fix building with gcc 5.x
d6279bc mongodb: 2.6.0 -> 3.3.0 and remove from pnblacklist
888bbd2 logwatch: fix host-user-contaminated
9936839 orrery: fix host-user-contaminated
6e589bc espeak: fix host-user-contaminated
259c7d2 debootstrap: fix host-user-contaminated
7d3f00b dhcpcd: add recipe for dhcpcd
a33de6d ctdb: Fix rootfs creation errors
09c7be7 opensaf: 4.6.0 -> 4.7.0
e63c636 syslog-ng: 3.5.4.1 -> 3.6.4
a616fb0 jq: upgrade to 1.5
05c1599 geoip: add ptest functionality
a225fdc dracut: 043 -> 044
df2dd71 openvpn: 2.3.7 -> 2.3.8
78878e8 cryptsetup: 1.6.7 -> 1.7.0
fb4a55c python-jsonpointer: add recipe for 1.10
68d63e4 python-jsonpatch: add recipe for 1.12
a8fca4f recipes-connectivity/samba: Only rmdir directories that exist
33c23f0 dfu-util: use BP in SRC_URI
0afe538 thunar: remove udisks from RRECOMMENDS
5e39b00 xfce4-power-manager: remove udisks rdependency
ba3ab56 gvfs: update to 1.24.2 to make access to windows shares work again
9fae994 xl2tpd: modify recipes to avoid forced internet access
6a85ce1 dovecot: 2.2.18 -> 2.2.21
26e88cb gpsd: Add patch to fix broken ACTIVATE hook.
add22b1 nodejs: update from 4.2.3 to 4.2.4
4354e1a waf-samba.bbclass: add cross-answers option and files
fd5ec52 samba: backport patches for cross-compiling
7bb51d9 samba: fix the incorrect tmpfiles installed directory
7172195 libtalloc: upgrade to 2.1.3
c722be5 libtevent: upgrade to 0.9.25
2bd17e1 libldb: upgrade to 1.1.21
f519466 libtdb: upgrade to 1.3.7
b711a48 python-pip: 7.1.0 -> 7.1.2
e08c47f stunnel: 5.21 -> 5.28
3b511b5 postfix: 3.0.2 -> 3.0.3
6e5bf97 rp-pppoe: 3.11 -> 3.12
64e62de dnsmasq: Listen only on loopback and disable DHCP
d75040e python-six: Error fix for recipes depend on python-six
00b44a2 python-tornado: upgrade to 4.3
1af88e2 samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
dd5588e libjpeg-turbo: remove recipe
949e99b lowpan-tools: add missing flex/bison deps
964b131 postfix: fix clean broken issue
c047b8f ncftp: fix build failures with ccdv
2a892ca iscsitarget: skip the arch test for kernel modules
40b7e8a iscsitarget: split the kernel module into separate package
428b019 netkit-ftp: fixed invalid symlink
5266c32 ctdb: add PACKAGECONFIG for libtdb
97e2782 cim-schema-exper: fix host-user-contaminated
6536d09 nbd: use BPN in Files
ce4b362 wireshark: update SRC_URI link to sources
972be5a postfix: premission of /var/spool/mail seems incorrect
8895d8f tcpdump: add PACKAGECONFIG for libcap-ng
65e0545 terminus-font: update perl-native-runtime dependency

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
76f8806 qtbase: use PACKAGECONFIG to ensure runtime dependency to libssl
877a503 Revert "qtbase: fix Tartget typo"
5a149f4 qtbase: fix Tartget typo
3bd2972 qtbase: re-enable replacing host paths in qconfig.pri
3e2058f qt5: allow overriding git protocol used with QT_GIT uri

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
d3fd3e3 connman: rename bbappend to match new version from oe-core
def9eb0 alsa-lib: rename bbappend to match new version from oe-core
0d999b1 opkg: rename bbappend to match new version from oe-core
cac658d glib: rename bbappend to match new version from oe-core
b94c5d3 qtlocation: update patch to apply for 5.6
95e846f qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.6
302a775 qtwebkit: move to unused
5ea480a README: update to depend on master branches
f4cdc80 connman: upgrade to 1.30 from oe-core
bbd0909 directfb: add fPIC
496e298 mesa: re-enabled fbdef, gallium-egl, gallium-gbm in 10.3.7 version
de03478 mesa: temporary disable fbdev EGL platform
69e1b3b mesa: remove unsupported PACKAGECONFIGs
4cc19bc mesa: backport patch to fix build with gcc-5
da48b8c db8 mediaindexer imaccountvalidator imlibpurpleservice activitymana=
ger configurator filecache mojomail: add -fpermissive
fc0d662 luna-service2: add -fgnu89-inline to use old semantics for inline
944cf65 phonesim: Add -fPIC
d7f80d2 leveldb-tl: use latest revision from gcc-4.9 branch
d00a646 libpalmsocket: fix build with gcc-5
8255bab systemd: update persistent-storage-rule-mmc-partname.patch to apply=
 for v225
afb1d67 pmstatemachineengine: fix build with gcc-5
e125dfe opkg: rename bbappend to match new oe-core version
db2a281 packagegroup-luneos-extended: temporary drop keymanager, node-dbus,=
 node-sqlite3, node-taglib
bb50b39 activitymanager: Fix build with boost-1.58.0
3d579db vboxguestdrivers: use 4.3.30 version from meta-oe
df633b3 nodejs-module-webos-*: fix build for nodejs-0.12.2
9ee01d3 nodejs: remove recipe in order to use 0.12.2 from meta-oe
47836b1 packagegroup-webos-extended: drop sysvinit-pidof
225565c alsa-utils: rename .bbappend to match new version from oe-core
47ea1a5 alsa-lib: rename .bbappend to match new version from oe-core
2b2c793 glib-2.0: rename bbappend to match new version from oe-core
f72b59c luneos-features: keep using bluez4
44c4504 README: update to depend on jethro branches
b76e1fb enyo-submodules: Add bbclass with enyo submodules definitions

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
c69cf39 linux-lg-mako: bump SRCREV

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
||2016-01-25	||3	||5	||18	||0		||6		||14		||4		||33		||16		||23		||2		||0		=
||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-01-25 =3D=3D

INFO: jenkins-job.sh-1.7.1 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160127_140419.log

=3D=3D=3D common (1) =3D=3D=3D
    * /meta-smartphone/meta-fso/recipes-freesmartphone/cornucopia/fsogsmd_g=
it.bb, do_compile

=3D=3D=3D common-x86 (4) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_c=
ompile
    * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-ti=
ny-kexecboot_4.1.bb, do_compile
    * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb=
, do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (13) =3D=3D=3D
    * /meta-openembedded/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.=
1.bb, do_install
    * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/ine=
tutils_1.9.4.bb, do_install
    * /meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.7.=
bb, do_compile
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_make_scripts
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_configure
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_make_scripts
    * /meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.21.bb, do=
_compile
    * /meta-openembedded/meta-oe/recipes-graphics/wayland/wayland-fits_git.=
bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do_c=
ompile
    * /meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguest=
drivers_4.3.30.bb, do_make_scripts
    * /meta-openembedded/meta-python/recipes-devtools/python/python-matplot=
lib_1.1.0.bb, do_compile
    * /openembedded-core/meta/recipes-kernel/cryptodev/cryptodev-module_1.8=
=2Ebb, do_make_scripts
    * /openembedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do=
_make_scripts

=3D=3D=3D Number of failed tasks (26) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20160123_150510.log/ || http://errors.yoctoproject.org:80/Errors/Build/=
11918/
|-
|| qemux86 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20160124_130015.log/ || http://errors.yoctoproject.org:80/Errors/Build/=
11944/
|-
|| qemux86_64 	|| 18	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20160125_231249.log/ || http://errors.yoctoproject.org:80/Errors/Bu=
ild/11966/
|}
=3D=3D=3D PNBLACKLISTs (89) =3D=3D=3D

=3D=3D=3D QA issues (98) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||invalid-pkgconfig
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||14	||textrel
|-
||16	||version-going-backwards
|-
||2	||installed-vs-shipped
|-
||23	||host-user-contaminated
|-
||33	||file-rdeps
|-
||4	||build-deps
|-
||6	||libdir
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
meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb:PNBLACKLIST[rsyslog] ?=3D=
 "Not compatible with gnutls version 3.4 currently in oe-core"
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
meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb:PNB=
LACKLIST[start-stop-daemon] ?=3D "BROKEN: fails because of gettext, partial=
 fix is available here http://patchwork.openembedded.org/patch/89867/"
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


count: 6	issue: libdir
qtbase-dbg: found library in wrong location: /usr/share/qt5/examples/widget=
s/tools/echoplugin/plugin/.debug/libechoplugin.so [libdir]
qtdeclarative-dbg: found library in wrong location: /usr/share/qt5/examples=
/qml/qmlextensionplugins/imports/TimeExample/.debug/libqmlqtimeexampleplugi=
n.so [libdir]
qtmultimedia-5.5.99+5.6.0-alpha1+gitAUTOINC+ac1b772ec8: qtmultimedia-dbg: f=
ound library in wrong location: /usr/share/qt5/examples/multimedia/spectrum=
/.debug/libfftreal.so.1.0.0 [libdir]
qtquick1-dbg: found library in wrong location: /usr/share/qt5/examples/decl=
arative/cppextensions/imageprovider/ImageProviderCore/.debug/libqmlimagepro=
viderplugin.so [libdir]
qtsensors-dbg: found library in wrong location: /usr/share/qt5/examples/sen=
sors/grue/.debug/libgruesensor.so.1.0.0 [libdir]
qtsensors-dbg: found library in wrong location: /usr/share/qt5/examples/sen=
sors/sensor_explorer/Explorer/.debug/libdeclarative_explorer.so [libdir]


count: 14	issue: textrel
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
gstreamer1.0-libav-1.6.2: ELF binary '/tarmv5e-oe-linux-gnueabi/libav/9.18-=
r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations=
 in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textr=
el]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [text=
rel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textr=
el]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [tex=
trel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [t=
extrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-=
linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/li=
bpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-lin=
ux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/u=
sr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
matchbox-keyboard-0.0+gitAUTOINC+217f1bfe14: ELF binary '/tmp/work/armv5te-=
oe-linux-gnueabi/matchbox-keyboard/0.0+gitAUTOINC+217f1bfe14-r4/packages-sp=
lit/matchbox-keyboard/usr/bin/matchbox-keyboard' has relocations in .text [=
textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-=
r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has r=
elocations in .text [textrel]


count: 4	issue: build-deps
mongodb-3.3.0+gitAUTOINC+aacd231be0: mongodb rdepends on libpcap, but it is=
n't a build dependency? [build-deps]
rygel-0.26.1: rygel-plugin-media-export rdepends on libunistring, but it is=
n't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency? [b=
uild-deps]
snort-2.9.7.5: snort rdepends on liblzma, but it isn't a build dependency? =
[build-deps]


count: 33	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires=
 libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires=
 libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requi=
res libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requi=
res libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-rde=
ps]
fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot r=
equires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in packa=
ge gnome-desktop requires /usr/bin/python, but no providers found in its RD=
EPENDS [file-rdeps]
gst-plugins-base-0.10.36: /usr/bin/gst-visualise-0.10_gst-plugins-base-apps=
 contained in package gst-plugins-base-apps requires /usr/bin/perl, but no =
providers found in its RDEPENDS [file-rdeps]
gupnp-0.20.12: /usr/bin/gupnp-binding-tool_gupnp-dev contained in package g=
upnp-dev requires /usr/bin/python, but no providers found in its RDEPENDS [=
file-rdeps]
libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package libbo=
nobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file-r=
deps]
libmodule-build-perl-0.31: /usr/bin/config@underscore@data_libmodule-build-=
perl contained in package libmodule-build-perl requires /tmp/sysroots/x86_6=
4-linux/usr/bin/perl-native/perl.real, but no providers found in its RDEPEN=
DS [file-rdeps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail r=
equires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail r=
equires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.=
so_libnewt-python contained in package libnewt-python requires libnewt.so()=
(64bit), but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.=
so_libnewt-python contained in package libnewt-python requires libnewt.so, =
but no providers found in its RDEPENDS [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect_networkmanager-nmtui containe=
d in package networkmanager-nmtui requires libnewt.so()(64bit), but no prov=
iders found in its RDEPENDS [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect_networkmanager-nmtui containe=
d in package networkmanager-nmtui requires libnewt.so, but no providers fou=
nd in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphysic=
s contained in package numptyphysics requires /usr/bin/perl, but no provide=
rs found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.=
sh_numptyphysics contained in package numptyphysics requires /bin/bash, but=
 no providers found in its RDEPENDS [file-rdeps]
perf-1.0: /usr/lib/perf/perf-core/scripts/python/call-graph-from-postgresql=
=2Epy_perf-python contained in package perf-python requires /usr/bin/python=
2, but no providers found in its RDEPENDS [file-rdeps]
perf-1.0: /usr/libexec/perf-core/tests/attr.py_perf contained in package pe=
rf requires /usr/bin/python, but no providers found in its RDEPENDS [file-r=
deps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension contained in package tracker-nautilus-extensio=
n requires libnautilus-extension.so.1()(64bit), but no providers found in i=
ts RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension.0) [version-going-backwards]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: Package version for package mplayer2-d=
bg went backwards which would break package feeds from (0:2.0+gitr0+2c378c7=
1a4-r13.32 to 0:2.0+gitr0+2c378c71a4-r13.0) [version-going-backwards]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: Package version for package mplayer2-d=
ev went backwards which would break package feeds from (0:2.0+gitr0+2c378c7=
1a4-r13.32 to 0:2.0+gitr0+2c378c71a4-r13.0) [version-going-backwards]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: Package version for package mplayer2-d=
oc went backwards which would break package feeds from (0:2.0+gitr0+2c378c7=
1a4-r13.32 to 0:2.0+gitr0+2c378c71a4-r13.0) [version-going-backwards]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: Package version for package mplayer2-l=
ocale went backwards which would break package feeds from (0:2.0+gitr0+2c37=
8c71a4-r13.32 to 0:2.0+gitr0+2c378c71a4-r13.0) [version-going-backwards]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: Package version for package mplayer2-s=
taticdev went backwards which would break package feeds from (0:2.0+gitr0+2=
c378c71a4-r13.32 to 0:2.0+gitr0+2c378c71a4-r13.0) [version-going-backwards]
perf-1.0: Package version for package perf went backwards which would break=
 package feeds from (0:None-r9.4 to 0:4.1.15-r9.5) [version-going-backwards]
perf-1.0: Package version for package perf-archive went backwards which wou=
ld break package feeds from (0:None-r9.4 to 0:4.1.15-r9.5) [version-going-b=
ackwards]
perf-1.0: Package version for package perf-dbg went backwards which would b=
reak package feeds from (0:None-r9.4 to 0:4.1.15-r9.5) [version-going-backw=
ards]
perf-1.0: Package version for package perf-dev went backwards which would b=
reak package feeds from (0:None-r9.4 to 0:4.1.15-r9.5) [version-going-backw=
ards]
perf-1.0: Package version for package perf-doc went backwards which would b=
reak package feeds from (0:None-r9.4 to 0:4.1.15-r9.5) [version-going-backw=
ards]
perf-1.0: Package version for package perf-locale went backwards which woul=
d break package feeds from (0:None-r9.4 to 0:4.1.15-r9.5) [version-going-ba=
ckwards]
perf-1.0: Package version for package perf-perl went backwards which would =
break package feeds from (0:None-r9.4 to 0:4.1.15-r9.5) [version-going-back=
wards]
perf-1.0: Package version for package perf-python went backwards which woul=
d break package feeds from (0:None-r9.4 to 0:4.1.15-r9.5) [version-going-ba=
ckwards]
perf-1.0: Package version for package perf-staticdev went backwards which w=
ould break package feeds from (0:None-r9.4 to 0:4.1.15-r9.5) [version-going=
-backwards]
perf-1.0: Package version for package perf-tests went backwards which would=
 break package feeds from (0:None-r9.4 to 0:4.1.15-r9.5) [version-going-bac=
kwards]


count: 23	issue: host-user-contaminated
babiloo-efl-2.0.9-10: babiloo-efl: /babiloo-efl/usr/share/babiloo/core/test=
/test_dictionary.py is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]
babiloo-efl: /babiloo-efl/usr/share/babiloo/core/test/test_dictionary.py is=
 owned by uid 3004, which is the same as the user running bitbake. This may=
 be due to host contamination [host-user-contaminated]
cinematicexperience-1.0: cinematicexperience: /cinematicexperience/usr/shar=
e/cinematicexperience-1.0/content/images/qt_logo.png is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]
cinematicexperience: /cinematicexperience/usr/share/cinematicexperience-1.0=
/content/images/qt_logo.png is owned by uid 3004, which is thay be due to h=
ost contamination [host-user-contaminated]
numptyphysics: /numptyphysics/usr/share/numptyphysics/org_level/L50_nautilu=
s.nph is owned by uid 3004, which is the same as the user running bitbake. =
This may be due to host contamination [host-user-contaminated]
qt5everywheredemo-1.0: qt5everywheredemo: /qt5everywheredemo/usr/share/qt5e=
verywheredemo-1.0/qml/QtDemo/images/tv.png is owned by uid 3004, which is t=
he same as the user running bitbake. This may be due to host contamination =
[host-user-contaminated]
qt5everywheredemo: /qt5everywheredemo/usr/share/qt5everywheredemo-1.0/qml/Q=
tDemo/images/tv.png is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]
qt5ledscreen-1.0: qt5ledscreen: /qt5ledscreen/usr/share/qt5ledscreen-1.0/im=
ages/logo1.png is owned by uid 3004, which is the same as the user running =
bitbake. This may be due to host contamination [host-user-contaminated]
qt5ledscreen: /qt5ledscreen/usr/share/qt5ledscreen-1.0/images/logo1.png is =
owned by uid 3004, which is the same as the user running bitbake. This may =
be due to host contamination [host-user-contaminated]
qt5nmapcarousedemo-1.0: qt5nmapcarousedemo: /qt5nmapcarousedemo/usr/share/q=
t5nmapcarousedemo-1.0/content/images/arrow-right.png is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]
qt5nmapcarousedemo: /qt5nmapcarousedemo/usr/share/qt5nmapcarousedemo-1.0/co=
ntent/images/arrow-right.png is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-con=
taminated]
qt5nmapper-1.0: qt5nmapper: /qt5nmapper/usr/share/qt5nmapper-1.0/content/im=
ages/switch_thumb.png is owned by uid 3004, which is the same as the user r=
unning bitbake. This may be due to host contamination [host-user-contaminat=
ed]
qt5nmapper: /qt5nmapper/usr/share/qt5nmapper-1.0/content/images/switch_thum=
b.png is owned by uid 3004, which is the same as the user running bitbake. =
This may be due to host contamination [host-user-contaminated]
qtsmarthome-1.0: qtsmarthome: /qtsmarthome/usr/share/qtsmarthome-1.0/qml/sm=
arthome/components/tabwidget/VTabBar.qml is owned by uid 3004, which is the=
 same as the user running bitbake. This may be due to host contamination [h=
ost-user-contaminated]
qtsmarthome: /qtsmarthome/usr/share/qtsmarthome-1.0/qml/smarthome/component=
s/tabwidget/VTabBar.qml is owned by uid 3004, which is the same as the user=
 running bitbake. This may be due to host contamination [host-user-contamin=
ated]
quitbattery-1.0.0: quitbattery: /quitbattery/usr/share/quitbattery-1.0.0/qm=
l/QUItBattery/images/glass.png is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
quitbattery: /quitbattery/usr/share/quitbattery-1.0.0/qml/QUItBattery/image=
s/glass.png is owned by uid 3004, which is the same as the user running bit=
bake. This may be due to host contamination [host-user-contaminated]
quitindicators-1.0.1: quitindicators: /quitindicators/usr/share/quitindicat=
ors-1.0.1/qml/QUItIndicators/images/dots_512.png is owned by uid 3004, whic=
h is the same as the user running bitbake. This may be due to host contamin=
ation [host-user-contaminated]
quitindicators: /quitindicators/usr/share/quitindicators-1.0.1/qml/QUItIndi=
cators/images/dots_512.png is owned by uid 3004, which is the same as the u=
ser running bitbake. This may be due to host contamination [host-user-conta=
minated]
thone-0.7: thone: /thone/usr/bin/thone-toggle installed-vs-shipped
ntp: 1 installed and not shipped files. [installed-vs-shipped]
uim: 5 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

--PGNNI9BzQDUtgA2J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaoz8QACgkQN1Ujt2V2gBx3ogCaA730O9bgJPdxx5VGG35ZhE/e
8iIAn2wlyps0ZrzpLZXoq1PHd8RehqKp
=Z92t
-----END PGP SIGNATURE-----

--PGNNI9BzQDUtgA2J--
