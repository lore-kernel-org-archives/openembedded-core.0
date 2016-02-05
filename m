Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id DCF8A77307;
	Fri,  5 Feb 2016 13:56:48 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id g62so49159116wme.0;
	Fri, 05 Feb 2016 05:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=h7WjfO/wNkpiJsShIztQLXMT8FRutBdHH2CIpB+Fv08=;
	b=EDqUo+hBrpLCRoAryYwB7YlhIzvGJ/VMdUx9mBqmZV5ypycP2E8aAwK/VW4lHMsxPB
	t8cTj/BX1FepLTTXz0FBfTgzJWBSHm1kLovBiUZxGo+IBoFzvMVuDwSxeuNXImA8YepV
	R4ywKS1KgfkiX2WDnayu7C6OH4CjA1IG1TlGtDahc9DQKm9Ba7f0Ozyc0uma1WP/Wg35
	wZNweGRDRrhoybCKe/98K6QSgi+snituz9kvcPD8BtoSXzVBCjjoJUfPOoAANCj97SSB
	tGCR4IgBT5pFQ2qyKx8kIXc9IShtawjw1/HMdUOPr6YQaocEYsSF/vcSjMZLX5bfLF1P
	sPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=h7WjfO/wNkpiJsShIztQLXMT8FRutBdHH2CIpB+Fv08=;
	b=Zp94TSIkzxiipT6k7w/hdCIT05ZuBnEz3xS6LJ6jbaMEofCzyojc7ZmhhBMY5vojU3
	sIzt/gkk5wLGVKzEmNoWgZ/R1eW6blE72H4rI1JsKxUTPoJwcLPbPB8ibsWf2NsdDhCW
	4CJKM4XZSat4MbzgeX7G0zSAuHOEKSkf/WaXwHusc9XAvfX03N60cMEmWov16IObKD7u
	4tuC64T0WCuhEDwRiZ0pWH6BdZ6jF76P//4TEMLqI6o29p/8F6MQnJdZhH3Rg/AtAbPo
	i6Abd7RXQIaKbi9h+kyeeZ+/4z//VBigdAs8NzJLrEZA4G5+K6WKFoqHmscFAuNO/9s+
	dhhQ==
X-Gm-Message-State: AG10YOT/h0hnjUdxQxf5n5RD0gzrV8u1IPf3l6JerJX0VaKa4Ec7XzFwhOYQjcbw5CA16A==
X-Received: by 10.28.210.73 with SMTP id j70mr15797439wmg.8.1454680608644;
	Fri, 05 Feb 2016 05:56:48 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h8sm16090693wjw.6.2016.02.05.05.56.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Feb 2016 05:56:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Feb 2016 15:00:18 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20160205140018.GC2575@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2016-02-04
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
X-List-Received-Date: Fri, 05 Feb 2016 13:56:51 -0000
X-Groupsio-MsgNum: 77609
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline

--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

qemux86-64 looks a lot worse, because it's using slightly newer oe-core
revision than qemuarm and qemux86 builds did and not only kernel is failing
there, there is new/fixed QA check reporting many issues in package_qa.

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
c1ac873 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
46932cf gcc-5.3: backport fix for PR-target-65358
fa8d239 sstate-sysroot-cruft.sh: Extend the whitelist
2376aec arch-armv7ve.inc: respect armv7a override as well
3924da8 qemux86: Add identical qemux86copy variant for tests
281237a report-error: Allow to upload reports automatically

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
e978550 webkit-efl: fix build with newer CMake 3.4 from oe-core
d43400b hwdata: add new recipe
07ce18a thrift: Add recipe for Apache Thrift.
0207d11 mongodb: 2.6.0 -> 3.3.0 and remove from pnblacklist
1484eaf rygel: Update to 0.28.2
0591c89 gupnp: Update to 0.20.14
1d1e90e ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
574482a netkit-telnet: Add to generate telnetlogin.
59d6ecb netkit-rsh: add two patches and some fixes.
dc64ae5 net-snmp: fix cross-compile breakage, add libnl pkgconfig option
e27aaa9 efivar: fix zero initializer compiler error
3b910cc fix missing packageconfig for samba with sysvinit
73c8893 waf-samba.bbclass: add cross-answers option and files
c55abbb samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
ab7fd53 lowpan-tools: add missing flex/bison deps
51eb499 postfix: fix clean broken issue
929c2a0 ncftp: fix build failures with ccdv
47a16d2 iscsitarget: skip the arch test for kernel modules
258b8ff iscsitarget: split the kernel module into separate package
3c61736 netkit-ftp: fixed invalid symlink
4736903 ctdb: add PACKAGECONFIG for libtdb
7a5b7cc cim-schema-exper: fix host-user-contaminated
ebb48c8 nbd: use BPN in Files
e926705 wireshark: update SRC_URI link to sources
8080c35 postfix: premission of /var/spool/mail seems incorrect

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
d6aeedb qtbase: Fix installation of fonts and libraries

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
||2016-02-04	||10	||16	||35	||0		||6		||8		||5		||33		||0		||12		||2		||0		=
||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-02-04 =3D=3D

INFO: jenkins-job.sh-1.7.1 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160205_115543.log

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
    * /meta-openembedded/meta-oe/recipes-support/libtinyxml2/libtinyxml2_gi=
t.bb, do_compile
    * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.=
bb, do_configure

=3D=3D=3D common-x86 (6) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_c=
ompile
    * /meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-0.10/=
gst-ffmpeg_0.10.13.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrenc=
ykit_git.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=
, do_configure
    * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_compile
    * /openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb, do=
_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static=
-utils_2.0.4.bb, do_compile
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.=
bb, do_compile

=3D=3D=3D qemux86_64 (21) =3D=3D=3D
    * /meta-browser/recipes-mozilla/firefox/firefox_38.4.0esr.bb, do_packag=
e_qa
    * /meta-openembedded/meta-gnome/recipes-support/tracker/tracker_0.14.2.=
bb, do_package_qa
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.=
bb, do_package_qa
    * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-ti=
ny-kexecboot_4.1.bb, do_compile
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_make_scripts
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_configure
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_make_scripts
    * /meta-openembedded/meta-networking/recipes-support/dovecot/dovecot_2.=
2.21.bb, do_package_qa
    * /meta-openembedded/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb, =
do_package_qa
    * /meta-openembedded/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb, do_packa=
ge_qa
    * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do_c=
ompile
    * /meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguest=
drivers_4.3.30.bb, do_make_scripts
    * /meta-openembedded/meta-python/recipes-devtools/python/python-matplot=
lib_1.1.0.bb, do_compile
    * /meta-qt5/recipes-qt/qt5/qtbase_git.bb, do_package_qa
    * /meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb, do_package_qa
    * /meta-qt5/recipes-qt/qt5/qtquick1_git.bb, do_package_qa
    * /meta-qt5/recipes-qt/qt5/qtsensors_git.bb, do_package_qa
    * /meta-smartphone/meta-android/recipes-support/invensense/invensense_g=
it.bb, do_package_qa
    * /openembedded-core/meta/recipes-kernel/cryptodev/cryptodev-module_1.8=
=2Ebb, do_make_scripts
    * /openembedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do=
_make_scripts
    * /openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb, do=
_package_qa

=3D=3D=3D Number of failed tasks (61) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20160202_133203.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/12200/
|-
|| qemux86 	|| 16	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20160203_120422.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/12225/
|-
|| qemux86_64 	|| 35	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20160204_111004.log// || http://errors.yoctoproject.org:80/Errors/B=
uild/12278/
|}

=3D=3D=3D PNBLACKLISTs (89) =3D=3D=3D

=3D=3D=3D QA issues (66) =3D=3D=3D
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
||0	||version-going-backwards
|-
||12	||host-user-contaminated
|-
||2	||installed-vs-shipped
|-
||33	||file-rdeps
|-
||5	||build-deps
|-
||6	||libdir
|-
||8	||textrel
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


count: 8	issue: textrel
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
ffmpeg-2.8.5: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.5-r0/packages-=
split/libavcodec/usr/lib/libavcodec.so.56.60.100' has relocations in .text =
[textrel]
ffmpeg-2.8.5: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.5-r0/packages-=
split/libavfilter/usr/lib/libavfilter.so.5.40.101' has relocations in .text=
 [textrel]
ffmpeg-2.8.5: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.5-r0/packages-=
split/libpostproc/usr/lib/libpostproc.so.53.3.100' has relocations in .text=
 [textrel]
ffmpeg-2.8.5: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.5-r0/packages-=
split/libswresample/usr/lib/libswresample.so.1.2.101' has relocations in .t=
ext [textrel]
ffmpeg-2.8.5: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.5-r0/packages-=
split/libswscale/usr/lib/libswscale.so.3.1.101' has relocations in .text [t=
extrel]
gstreamer1.0-libav-1.6.3: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-=
libav/1.6.3-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libg=
stlibav.so' has relocations in .text [textrel]
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


count: 33	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvtained in package dvbnet requires libdvb=
api.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraf=
fic requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS =
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraf=
fic requires libdvbapi.so, but no providers found in its RDEPENDS [file-rde=
ps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon req=
uires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
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
s contained in package numpt-extension.so.1()(64bit), but no providers foun=
d in its RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension contained in package tracker-nautilus-extensio=
n requires libnautilus-extension.so.1, but no providers found in its RDEPEN=
DS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils co=
ntained in package ubx-utils requires /bin/bash, but no providers found in =
its RDEPENDS [file-rdeps]


count: 0	issue: version-going-backwards


count: 12	issue: host-user-contaminated
babiloo-efl: /babiloo-efl/usr/share/babiloo/core/test/test_dictionary.py is=
 owned by uid 3004, which is the same as the user running bitbake. This may=
 be due to host contamination [host-user-contaminated]
cinematicexperience: /cinematicexperience/usr/share/cinematicexperience-1.0=
/content/images/qt_logo.png is owned by uid 3004, which is the same as the =
user running bitbake. This may be due to host contamination [host-user-cont=
aminated]
firefox-addon-webconverger: /firefox-addon-webconverger/usr/lib/firefox/ext=
ensions/{ee11fa88-036b-4661-bb04-d436f86bc06a}/content/wc.js is owned by ui=
d 3004, which is the same as the user running bitbake. This may be due to h=
ost contamination [host-user-contaminated]
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

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla0qvEACgkQN1Ujt2V2gBz5GwCfVb6vsbMW0b2FGslSsYHe5rvB
NVcAn2Pi+6H5dI75eUjFPy52ecU//FAC
=qHqC
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
