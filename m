Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A141D7724E;
	Mon,  1 Feb 2016 14:36:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 128so9421114wmz.3;
	Mon, 01 Feb 2016 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=jKJYLHUAdXUSUMfHAYh2YlOA2bvgxJ6tLx92Ymg3+sE=;
	b=RjGmTw/l+S4Q5bU28QVAoP8mKiRBTxR5Os9yt+8qmbiA0Rgjee/1SFVozi6IbVgSVb
	yI2vx2HKtrcLF/a3HnRmxT4riJ/So5mX2CWE7QIQc8UZba9zoCJgqJLFwDLj8e+8nT//
	iMLXqgiYus/GzLMFDTC7zpnpnRjQkfwrFuiTL4xWJiBDMBE1VfEVL7zGjw1ivOyuvPae
	5Ws4/RAdZdakFqxsraspohB7rNXIDBPVOreSEd4Qg1q6xxJLRf0WaeMZH5qwuUsh5Rzc
	SOtMywiZRMAuUje8RsCR7whxQGSjCnneeHlsYaKIG5yXlw3FDqAjJYRfKdfTXnCfsuov
	Heyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=jKJYLHUAdXUSUMfHAYh2YlOA2bvgxJ6tLx92Ymg3+sE=;
	b=OcqpFeCKSYBhx4p8tY5bxQX2ki9UuOJNFpvJuz17UuL2yHL76VwJw45Cq2YRFf7DSa
	s0kupVf2vs4C8ll4dOmt24dl0lD0G0r4XFNpqcUegdquW+4XRTQfX7CkYXbGBq6YxDiW
	f+zDTYdSVZeqMifPgSkrP/Dh/+N4wpsfSLIL6WWwT3u3Hvk3iMj2n80OBi440W5XghEP
	2F6cIkSMs9aHJvEeTfkfjOhgLgbGucF6FLoSVPaadP4SH/ReD9/z0KWHqxlyCHiw7DNp
	GWjmWqxivqPNYTCvv3JPQCuI2CSGrwkfhEr5meJrvA79Q4gO3MkG4CN+A8T+1Y+0uLI0
	s7bw==
X-Gm-Message-State: AG10YOTKJxV6LvkJuYgHtZCOOUv1YNulp5cmgp0a5n22hTzEs1vrDiXXj8PkN0dlIBgrFQ==
X-Received: by 10.28.173.71 with SMTP id w68mr12969271wme.88.1454337417928;
	Mon, 01 Feb 2016 06:36:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jc7sm14936855wjb.33.2016.02.01.06.36.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 06:36:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Feb 2016 15:39:44 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20160201143944.GA2639@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2016-01-30
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
X-List-Received-Date: Mon, 01 Feb 2016 14:37:01 -0000
X-Groupsio-MsgNum: 77191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
450125e world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
69ddf84 gcc-5.3: backport fix for PR-target-65358
8672c24 sstate-sysroot-cruft.sh: Extend the whitelist
70fa785 arch-armv7ve.inc: respect armv7a override as well
98ca6ff qemux86: Add identical qemux86copy variant for tests
7d528e8 report-error: Allow to upload reports automatically

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
160300f webkit-efl: fix build with newer CMake 3.4 from oe-core
fd58baf netkit-telnet: Add to generate telnetlogin.
cbe45c4 netkit-rsh: add two patches and some fixes.
d74aff8 net-snmp: fix cross-compile breakage, add libnl pkgconfig option
30c60a5 geis: initial add 2.2.17
33132f8 grail: initial add 3.1.0
061ee30 frame: initial add 2.5.0
d1d5081 atop: add recipe
78b38b4 memtester: upgrade 4.1.3 -> 4.3.0
ea58369 php: update to 5.6.17 and 5.5.31
9d1ca09 php: check for existance of directory before 'rmdir' in do_install_=
append_class-target
5100f3b nginx: update to 1.9.9
30870d9 liboil: import liboil_0.3.17 recipe from oe-core
d0fb715 rygel: Update to 0.28.2
4c28da2 gupnp: Update to 0.20.14
71286d0 gst-plugins-base: drop obsolete dependency on liboil
73d477a various: delete leftovers from qt4 recipes
4dae236 networkmanager: add PACKAGECONFIG for qt4-x11-free
76928fa openldap: improve packaging of OpenLDAP modules
14344c8 phpmyadmin: CVE-2015-8669
4eaf380 gvfs: disable build of documentation to fix build in some envirionm=
ents
01ac9d7 ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
3f56ae3 libx86-1: port a patch to make it work
659bede polkit: Fix build with musl
a38974e fbset: Fix out of tree builds ( S !=3D B )
468b83e lvm2: Portable fixes for fixing compile with musl
bc6873c numactl: update to 2.0.11
4df9cab thrift: Add recipe for Apache Thrift.
0af4f4a efivar: fix zero initializer compiler error
d2f68cc wmiconfig: mark as having broken "make clean"
aea6bb1 s3c64xx-gpio: mark as having broken "make clean"
2ddbc2d s3c24xx-gpio: mark as having broken "make clean"
7a7f1b0 illume-keyboards-shr: mark as having broken "make clean"
efa1f63 fix missing packageconfig for samba with sysvinit
2a96cd3 hwdata: add new recipe
53189bd python(3)-flask-pymongo: add recipes
cea0c80 python(3)-flask-login: add recipes
9a08b69 python(3)-flask: add recipes
6f2a75d python(3)-whoosh: add recipes
6ecefbd python(3)-xlrd: add recipes
b02b387 python3-tornado: add recipe
c97a1cf python-certifi: 14.05.14 -> 2015.11.20.1 and add python3 recipe
cd27029 python(3)-pymongo: add recipes
19067cf python-jinja2: 2.7.3 -> 2.8 and add python3 recipe
a34b770 python(3)-pymisp: add recipes
a60f700 python(3)-werkzeug: add recipe
4bbc1d0 python(3)-redis: add recipes
61dad53 python-requests: 2.7.0 -> 2.9.1 and add python3 recipe
5a3d827 python(3)-passlib: add recipes
5ae5d5f python(3)-markupsafe: add recipes
6c251a5 python(3)-itsdangerous: add recipes
f065fc9 python-dateutil: 1.5 -> 2.4.2 and add python3 recipe
11097a3 python-six: 1.9.0 -> 1.10.0 and add python3-recipe
a1d888b add pypi3 bbclass to make python3 recipe creation easier as well
e5660e4 python(3)-feedformatter: add recipes
6aa4a19 python(3)-lxml: 3.4.4 -> 3.5.0
bc72cae waf-samba.bbclass: add cross-answers option and files
6f01ef8 samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
ab09609 lowpan-tools: add missing flex/bison deps
2321c0f postfix: fix clean broken issue
07f1ec2 ncftp: fix build failures with ccdv
b53115b iscsitarget: skip the arch test for kernel modules
9571949 iscsitarget: split the kernel module into separate package
c39fb17 netkit-ftp: fixed invalid symlink
15c5fbf ctdb: add PACKAGECONFIG for libtdb
9b8a390 cim-schema-exper: fix host-user-contaminated
998ff83 nbd: use BPN in Files
518cd81 wireshark: update SRC_URI link to sources
1b89bce postfix: premission of /var/spool/mail seems incorrect
fa50c24 mongodb: 2.6.0 -> 3.3.0 and remove from pnblacklist

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
76f8806 qtbase: use PACKAGECONFIG to ensure runtime dependency to libssl
877a503 Revert "qtbase: fix Tartget typo"
5a149f4 qtbase: fix Tartget typo
3bd2972 qtbase: re-enable replacing host paths in qconfig.pri
3e2058f qt5: allow overriding git protocol used with QT_GIT uri

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
ab3fcab i9300: don't use metadata checksums in ext4 image
1b34040 cornucopia: inherit from autotools-brokensep to fix Vala builds
fc317c6 linux-samsung-i9300: fix compilation with GCC 5
a31574e linux-samsung-i9300: quieten excessive kernel output
5774504 formfactor: Add machconfig for i9300
b4825ef shr-image: Start graphical environment by default
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
||2016-01-30	||9	||13	||14	||0		||5		||11		||5		||32		||10		||11		||2		||0	=
	||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-01-30 =3D=3D

INFO: jenkins-job.sh-1.7.1 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160131_163329.log

=3D=3D=3D common (8) =3D=3D=3D
    * /meta-openembedded/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.=
1.bb, do_install
    * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/ine=
tutils_1.9.4.bb, do_install
    * /meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.7.=
bb, do_compile
    * /meta-openembedded/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.b=
b, do_configure
    * /meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.21.bb, do=
_compile
    * /meta-openembedded/meta-oe/recipes-graphics/wayland/wayland-fits_git.=
bb, do_compile
    * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.=
bb, do_configure
    * /meta-smartphone/meta-shr/recipes-shr/games/openmoocow_git.bb, do_con=
figure

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_c=
ompile
    * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static=
-utils_2.0.4.bb, do_compile
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.=
bb, do_compile

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-ti=
ny-kexecboot_4.1.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do_c=
ompile
    * /meta-openembedded/meta-python/recipes-devtools/python/python-matplot=
lib_1.1.0.bb, do_compile

=3D=3D=3D Number of failed tasks (36) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20160129_153307.log// || http://errors.yoctoproject.org:80/Errors/Build=
/12018/
|-
|| qemux86 	|| 13	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20160129_173933.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/12031/
|-
|| qemux86_64 	|| 14	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20160130_171545.log// || http://errors.yoctoproject.org:80/Errors/B=
uild/12041/
|}

=3D=3D=3D PNBLACKLISTs (89) =3D=3D=3D

=3D=3D=3D QA issues (76) =3D=3D=3D
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
||10	||version-going-backwards
|-
||11	||host-user-contaminated
|-
||11	||textrel
|-
||2	||installed-vs-shipped
|-
||32	||file-rdeps
|-
||5	||build-deps
|-
||5	||libdir
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


count: 5	issue: libdir
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


count: 11	issue: textrel
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
gstreamer1.0-libav-1.6.3: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-=
libav/1.6.3-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libg=
stlibav.so' has relocations in .text [textrel]
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
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-lin=
ux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/u=
sr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-=
r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has r=
elocations in .text [textrel]


count: 5	issue: build-deps
mongodb-3.3.0+gitAUTOINC+aacd231be0: mongodb rdepends on libpcap, but it is=
n't a build dependency? [build-deps]
rygel-0.28.2: rygel rdepends on libunistring, but it isn't a build dependen=
cy? [build-deps]
rygel-0.28.2: rygel-plugin-media-export rdepends on libunistring, but it is=
n't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency? [b=
uild-deps]
snort-2.9.7.5: snort rdepends on liblzma, but it isn't a build dependency? =
[build-deps]


count: 32	issue: file-rdeps
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
 libdvbapi.so, but no providers found in its RDEPENDS [file-o providers fou=
nd in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
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
gupnp-0.20.14: /usr/bin/gupnp-binding-tool_gupnp-dev contained in package g=
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
perf-1.0: /usr/libexec/perf-core/tests/attr.py_perf contained in package pe=
rf requires /usr/bin/python, but no providers found in its RDEPENDS [file-r=
deps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension contained in package tracker-nautilus-extensio=
n requires libnautilus-extension.so.1()(64bit), but no providers found in i=
ts RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension contained in package tracker-nautil feeds from=
 (0:None-r9.2 to 0:4.1.15-r9.3) [version-going-backwards]
perf-1.0: Package version for package perf-tests went backwards which would=
 break package feeds from (0:None-r9.2 to 0:4.1.15-r9.3) [version-going-bac=
kwards]


count: 11	issue: host-user-contaminated
babiloo-efl: /babiloo-efl/usr/share/babiloo/core/test/test_dictionary.py is=
 owned by uid 3004, which is the same as the user running bitbake. This may=
 be due to host contamination [host-user-contaminated]
cinematicexperience: /cinematicexperience/usr/share/cinematicexperience-1.0=
/content/images/qt_logo.png is owned by uid 3004, which is the same as the =
user running bitbake. This may be due to host contamination [host-user-cont=
aminated]
numptyphysics: /numptyphysics/usr/share/numptyphysics/org_level/L50_nautilu=
s.nph is owned by uid 3004, which is the same as the user running bitbake. =
This may be due to host contamination [host-user-contaminated]
qt5everywheredemo: /qt5everywheredemo/usr/share/qt5everywheredemo-1.0/qml/Q=
tDemo/images/tv.png is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]
qt5ledscreen: /qt5ledscreen/usr/share/qt5ledscreen-1.0/images/logo1.png is =
owned by uid 3004, which is the same as the user running bitbake. This may =
be due to host contamination [host-user-contaminated]
qt5nmapcarousedemo: /qt5nmapcarousedemo/usr/share/qt5nmapcarousedemo-1.0/co=
ntent/images/arrow-right.png is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-con=
taminated]
qt5nmapper: /qt5nmapper/usr/share/qt5nmapper-1.0/content/images/switch_thum=
b.png is owned by uid 3004, which is the same as the user running bitbake. =
This may be due to host contamination [host-user-contaminated]
qtsmarthome: /qtsmarthome/usr/share/qtsmarthome-1.0/qml/smarthome/component=
s/tabwidget/VTabBar.qml is owned by uid 3004, which is the same as the user=
 running bitbake. This may be due to host contamination [host-user-contamin=
ated]
quitbattery: /quitbattery/usr/share/quitbattery-1.0.0/qml/QUItBattery/image=
s/glass.png is owned by uid 3004, which is the same as the user running bit=
bake. This may be due to host contamination [host-user-contaminated]
quitindicators: /quitindicators/usr/share/quitindicators-1.0.1/qml/QUItIndi=
cators/images/dots_512.png is owned by uid 3004, which is the same as the u=
ser running bitbake. This may be due to host contamination [host-user-conta=
minated]
thone: /thone/usr/bin/thone-toggle is owned by uid 3004, which is the same =
as the user running bitbake. This may be due to host contamination [host-us=
er-contaminated]


count: 2	issue: installed-vs-shipped
ntp: 1 installed and not shipped files. [installed-vs-shipped]
uim: 5 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlavbN8ACgkQN1Ujt2V2gBwkJwCfehWmZDi6Ic5BdaEEv5Nlun9k
YfIAn325D2Qz5pUC8LJjVg3TVHo/CDIf
=Cv9I
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
