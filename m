Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3CD75D4B;
	Mon,  8 Feb 2016 13:21:44 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id c200so15237690wme.0;
	Mon, 08 Feb 2016 05:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=+x4I9e5FC1Gek+N+R3Af1aEBD7ZXFGCj/+tw0Uds1rk=;
	b=OvSRTkADRwXPdUlQux3k8hSqmW6iN8vIqGjWGU4G7e53Vdr2teqw/EI44dVN5qXsMe
	Z8dmjdltHM0O3dcIsV075wiQwdZa/oUzlo59Hwf7rUUPH85I8TRLjqEnd10EPlFLoe6J
	Fz7cW6q2iL8cBSj7NjVV6uzbWIeareluDZjPD1Z2KuQ9PWzL4BQRLKH2aUIVc/CLe+GT
	WLC6ogWteHet3/4PKzql9sPH/IHmTpTmNs8n23eJ2EQBa3jRlcle6aJkZlAhUsFy3sSd
	6XqdF6SlLdjI4bz53JIbUgG6//kF8mm14tsWzZi6+TPeHdA/XAC04P4gsRGAkTZXrP/X
	sPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=+x4I9e5FC1Gek+N+R3Af1aEBD7ZXFGCj/+tw0Uds1rk=;
	b=cd1bbvGWkVL2+w+1TVKiw0JI9IJvDPzBUuoNQcYL2MDaVejs5+swgfiwXqnHGsKf9L
	lf9F2GszJkMSrmN4DxhgyAugULlAb8arGybDeJHlJ+0hU4+ii/rwdy1/nnhh35YW8ffT
	Kzg5B3LNoxIeYIGopuBieNF8z0/aEtj54Z1pRjYeXsow80KImVQjde5uZxkBDFJMSAgn
	XCM1A8wpTRWxXsCsHD3omjunm/yhTCMgGMbjKSZU/9D4MT10RQyZ2AvqOv5yoi/KVLby
	/0A7qEqzOwO0bdNYqxG4k1KaMMbuTw03DCDt57WD2vIhrZ4JePg2nPLyvu8gj1fyg1GL
	0uSg==
X-Gm-Message-State: AG10YOS1TMeuD0AriA56ifXTOjkX2utql0NHq7E9vFj5d8IBZfPVjAkVAYEolNJA6kA3Og==
X-Received: by 10.194.123.167 with SMTP id mb7mr32922692wjb.0.1454937705137;
	Mon, 08 Feb 2016 05:21:45 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s2sm28870856wjs.39.2016.02.08.05.21.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Feb 2016 05:21:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 8 Feb 2016 14:25:20 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20160208132520.GA2903@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2016-02-06
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
X-List-Received-Date: Mon, 08 Feb 2016 13:21:45 -0000
X-Groupsio-MsgNum: 77750
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Many failures are caused by change to default EXTRA_OEMAKE. Couple fixes
were already sent for oe-core an meta-oe layers, so hopefully next
report will be more useful.

The list of failures is probably much longer, a lot of them aren't shown
because the dependencies weren't built so only few recipes were actually
tested.

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
5e64049 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
12469e9 bitbake.conf: Remove unhelpful default value for EXTRA_OEMAKE
70f03df sstate-sysroot-cruft.sh: Extend the whitelist
534f09e qemux86: Add identical qemux86copy variant for tests
f822869 report-error: Allow to upload reports automatically
167476b arch-armv7ve.inc: respect armv7a override as well
28c5617 gcc-5.3: backport fix for PR-target-65358

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
||2016-02-06	||28	||31	||17	||4		||0		||0		||1		||22		||0		||2		||2		||0		|=
|0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-02-06 =3D=3D

INFO: jenkins-job.sh-1.7.1 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160206_140707.log

=3D=3D=3D common (14) =3D=3D=3D
    * /meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.=
bb, do_compile
    * /meta-openembedded/meta-networking/recipes-connectivity/vlan/vlan_1.9=
=2Ebb, do_compile
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_compile
    * /meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb, do_pop=
ulate_sysroot
    * /meta-openembedded/meta-networking/recipes-support/pimd/pimd_2.1.8.bb=
, do_compile
    * /meta-openembedded/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb, do_packa=
ge_qa
    * /meta-openembedded/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb, do_=
populate_sysroot
    * /meta-openembedded/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb, d=
o_compile
    * /meta-openembedded/meta-oe/recipes-support/ckermit/ckermit_302.bb, do=
_install
    * /meta-openembedded/meta-oe/recipes-support/libtinyxml2/libtinyxml2_gi=
t.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/mg/mg_20110905.bb, do_comp=
ile
    * /meta-openembedded/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb=
, do_compile
    * /meta-smartphone/meta-android/recipes-support/invensense/invensense_g=
it.bb, do_package_qa
    * /openembedded-core/meta/recipes-extended/pigz/pigz_2.3.3.bb, do_compi=
le

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrenc=
ykit_git.bb, do_configure

=3D=3D=3D qemuarm (14) =3D=3D=3D
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.=
bb, do_package_qa
    * /meta-openembedded/meta-networking/recipes-protocols/pptp-linux/pptp-=
linux_1.7.2.bb, do_package
    * /meta-openembedded/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_=
2.2.3.bb, do_package_qa
    * /meta-openembedded/meta-oe/recipes-devtools/serialcheck/serialcheck_1=
=2E0.0.bb, do_package
    * /meta-openembedded/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb, =
do_package
    * /meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb, =
do_package
    * /meta-openembedded/meta-oe/recipes-support/soci/soci_3.2.2.bb, do_con=
figure
    * /openembedded-core/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb, do_compile
    * /openembedded-core/meta/recipes-devtools/dmidecode/dmidecode_3.0.bb, =
do_package
    * /openembedded-core/meta/recipes-extended/ed/ed_1.9.bb, do_package
    * /openembedded-core/meta/recipes-extended/stat/stat_3.3.bb, do_package
    * /openembedded-core/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb, =
do_package_qa
    * /openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb, do_packa=
ge
    * /openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.0=
=2Ebb, do_package

=3D=3D=3D qemux86 (12) =3D=3D=3D
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static=
-utils_2.0.4.bb, do_compile
    * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.=
bb, do_compile
    * /meta-openembedded/meta-networking/recipes-protocols/pptp-linux/pptp-=
linux_1.7.2.bb, do_package_qa
    * /meta-openembedded/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.b=
b, do_package_qa
    * /meta-openembedded/meta-oe/recipes-devtools/serialcheck/serialcheck_1=
=2E0.0.bb, do_package_qa
    * /meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb, =
do_package_qa
    * /openembedded-core/meta/recipes-bsp/libacpi/libacpi_0.2.bb, do_packag=
e_qa
    * /openembedded-core/meta/recipes-devtools/dmidecode/dmidecode_3.0.bb, =
do_package_qa
    * /openembedded-core/meta/recipes-extended/ed/ed_1.9.bb, do_package_qa
    * /openembedded-core/meta/recipes-extended/stat/stat_3.3.bb, do_package=
_qa
    * /openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb, do_packa=
ge_qa
    * /openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.0=
=2Ebb, do_package_qa

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb=
, do_compile

=3D=3D=3D Number of failed tasks (76) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 28	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20160205_155840.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/12300/
|-
|| qemux86 	|| 31	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20160206_003910.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/12316/
|-
|| qemux86_64 	|| 17	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20160206_071825.log// || http://errors.yoctoproject.org:80/Errors/B=
uild/12328/
|}

=3D=3D=3D PNBLACKLISTs (89) =3D=3D=3D

=3D=3D=3D QA issues (31) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||textrel
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||1	||build-deps
|-
||2	||host-user-contaminated
|-
||2	||installed-vs-shipped
|-
||22	||file-rdeps
|-
||4	||already-stripped
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
count: 4	issue: already-stripped
hdparm-9.48: File '/sbin/hdparm.hdparm' from hdparm was already stripped, t=
his will prevent future debugging! [already-stripped]
nbench-byte-2.2.3: File '/usr/bin/nbench' from nbench-byte was already stri=
pped, this will prevent future debugging! [already-stripped]
sysklogd-1.5.1: File '/sbin/klogd.sysklogd' from sysklogd was already strip=
ped, this will prevent future debugging! [already-stripped]
sysklogd-1.5.1: File '/sbin/syslogd.sysklogd' from sysklogd was already str=
ipped, this will prevent future debugging! [already-stripped]


count: 0	issue: libdir


count: 0	issue: textrel


count: 1	issue: build-deps
mongodb-3.3.0+gitAUTOINC+aacd231be0: mongodb rdepends on libpcap, but it is=
n't a build dependency? [build-deps]


count: 22	issue: file-rdeps
dmidecode-3.0: /usr/sbin/biosdecode_dmidecode contained in package dmidecod=
e requires libc.so.6(GLIBC_2.3.4)(64bit), but no providers found in its RDE=
PENDS [file-rdeps]
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
libacpi-0.2: /usr/bin/test-libacpi_libacpi-bin contained in package libacpi=
-bin requires libc.so.6(GLIBC_2.3.4)(64bit), but no providers found in its =
RDEPENDS [file-rdeps]
msr-tools-1.3: /usr/sbin/wrmsr_msr-tools contained in package msr-tools req=
uires libc.so.6(GLIBC_2.3)(64bit), but no providers found in its RDEPENDS [=
file-rdeps]
pptp-linux-1.7.2: /usr/sbin/pptp_pptp-linux contained in package pptp-linux=
 requires libc.so.6(GLIBC_2.2.5)(64bit), but no providers found in its RDEP=
ENDS [file-rdeps]
ptest-runner-2.0+gitAUTOINC+8bfdf946e7: /usr/bin/ptest-runner_ptest-runner =
contained in package ptest-runner requires libc.so.6(GLIBC_2.9)(64bit), but=
 no providers found in its RDEPENDS [file-rdeps]
serialcheck-1.0.0: /usr/bin/serialcheck_serialcheck contained in package se=
rialcheck requires libc.so.6(GLIBC_2.7)(64bit), but no providers found in i=
ts RDEPENDS [file-rdeps]
stat-3.3: /bin/stat.stat_stat contained in package stat requires libc.so.6(=
GLIBC_2.3)(64bit), but no providers found in its RDEPENDS [file-rdeps]
sysklogd-1.5.1: /sbin/syslogd.sysklogd_sysklogd contained in package sysklo=
gd requires libc.so.6(GLIBC_2.7)(64bit), but no providers found in its RDEP=
ENDS [file-rdeps]
unzip-6.0: /usr/bin/zipinfo_unzip contained in package unzip requires libc.=
so.6(GLIBC_2.3.4)(64bit), but no providers found in its RDEPENDS [file-rdep=
s]
yavta-0.0: /usr/bin/yavta_yavta contained in package yavta requires librt.s=
o.1()(64bit), but no providers found in its RDEPENDS [file-rdeps]


count: 0	issue: version-going-backwards


count: 2	issue: host-user-contaminated
dri3proto-1.0: dri3proto: /dri3proto-dbg/CONTROL/control is owned by uid 30=
04, which is the same as the user running bitbake. This may be due to host =
contamination [host-user-contaminated]
firefox-addon-webconverger: /firefox-addon-webconverger/usr/lib/firefox/ext=
ensions/{ee11fa88-036b-4661-bb04-d436f86bc06a}/content/wc.js is owned by ui=
d 3004, which is the same as the user running bitbake. This may be due to h=
ost contamination [host-user-contaminated]


count: 2	issue: installed-vs-shipped
ed: 10 installed and not shipped files. [installed-vs-shipped]
poppler-data: 261 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla4lz8ACgkQN1Ujt2V2gBw3VwCgn88QtWvX+iOE148gGY0lzdtL
Z+4AoJJYfpP58GatVF7Yxueg5rKO02Cg
=rXXC
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
