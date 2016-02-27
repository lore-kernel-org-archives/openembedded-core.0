Return-Path: <andrea.adami@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9375860053;
	Sat, 27 Feb 2016 23:48:06 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id k196so106704380vka.0;
	Sat, 27 Feb 2016 15:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=40SZ5F4Kd1dy+2lENcYos37Z1BfyxAGWARDu/+dVJoc=;
	b=cg+P8bA9A40keq3x3FYjozVEdrXkV3yCrdBpV9Ao71emJYUYAz12zajoalXe/knD46
	Az2Ys+lNi4SBecg0lE5q35ZSR8zOu8xGZ9F3TYDs83NFq+3wJyxBKjMm2e+adyHCojxc
	9te4IkylPUr210sRArStdR1zOMlxHK5GDLvQi+l4IlwYUuE5prz3ayqOkjzMcPAZ4a2G
	syjUobLtrhxphxCB0y8k27dNodwoOcrdi3sxKf3gv8lpbi8/GQqhCdiwwPyImXt9HyT5
	QJXGkBICgUHyhgR4Kw0RGFPcTCsys0uoZNJMRk+Uw9+4t99UDhr+RrgePZXfYPIS56qb
	wIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=40SZ5F4Kd1dy+2lENcYos37Z1BfyxAGWARDu/+dVJoc=;
	b=JNtSs3cg7hYFrBd3AHxVBADQzqfln29K4C0HLCTE6wqaQm3z+PC55fr0I7CV+SlghP
	0wu1TX809qS1Q6upI3p9kcTmSjj+Lz9fXQXooYLzWy57G1CIEr6RZ5HDxEbK8BZc0jnV
	0EHEWCp+iAeHhEkTVqfRfTA55Uh0JgC5A4KVACuhfakgc9UZA1O8XDRfbVtvBKNawxIR
	ViI28ei6E3C6neO0fDG94Kv0EFlGHV49gW6xu654V+rgWMaRSfjT74JRcSp+BTfQNY56
	/Lu6cPjGs1+6zKFOYxaDDkPcjvvPB0+k/CcIDXleLGS/qNbXTi/ihQDrwDALPmgU/egU
	j5pQ==
X-Gm-Message-State: AD7BkJKuSfY5R3V1wwYLK6SodDPK+N0CpTf0w7wc3jFVjmVfs/JY1p+wu3ujHM4T9AMlMUSzwArBRe/irdJuGA==
MIME-Version: 1.0
X-Received: by 10.31.16.24 with SMTP id g24mr6222521vki.41.1456616887232; Sat,
	27 Feb 2016 15:48:07 -0800 (PST)
Received: by 10.176.1.7 with HTTP; Sat, 27 Feb 2016 15:48:07 -0800 (PST)
In-Reply-To: <20160227194133.GB2554@jama>
References: <20160227194133.GB2554@jama>
Date: Sun, 28 Feb 2016 00:48:07 +0100
Message-ID: <CAAQYJAsUT1hS-Hum6T2S5kuCHVUcdwHOFRxYtdVVYV6zFcqnvw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-02-26
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
X-List-Received-Date: Sat, 27 Feb 2016 23:48:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 27, 2016 at 8:41 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> 88fded1 world-image: add extra target
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
> d5d0890 ffmpeg: update to 3.0
> 4e91977 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=
=3Dmode,links"
> 42c927f fontconfig: Don't add font directories from host
> 4461a13 Upgrade systemd to 229
> ba82f5e signing-keys: Make signing keys the only publisher of keys
> 3f72c5f sstate-sysroot-cruft.sh: Extend the whitelist
> faebf66 qemux86: Add identical qemux86copy variant for tests
> 3fb0865 report-error: Allow to upload reports automatically
> 4dbc0fd arch-armv7ve.inc: respect armv7a override as well
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
> 6bce3c1 efibootmgr: blacklist, depends on blacklisted efivar
> b970e18 freerdp: Fix QA warning when no binaries are built
> 061bf58 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=
=3Dmode,links"
> 46bab83 efivar: nvme header was renamed in linux 4.4
> e4238f8 efivar: fix zero initializer compiler error
> 93c8a3c inetutils: Fix build when static libs disabled
> 32b5c6f ntp: remove empty libexecdir to prevent potential QA issues
> 8b320f4 lldpd: use bash-completion.bbclass
> 87edda7 samba: update systemd service files
> ef42784 ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
> c3c6106 waf-samba.bbclass: add cross-answers option and files
> dd64a6b samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
> ba57020 lowpan-tools: add missing flex/bison deps
> 46b1e93 postfix: fix clean broken issue
> 84bfeae ncftp: fix build failures with ccdv
> 38fd81c iscsitarget: skip the arch test for kernel modules
> 56c4f31 iscsitarget: split the kernel module into separate package
> 3c95127 netkit-ftp: fixed invalid symlink
> 1dd195e ctdb: add PACKAGECONFIG for libtdb
> ed0b197 cim-schema-exper: fix host-user-contaminated
> 204683a nbd: use BPN in Files
> 21ccb84 wireshark: update SRC_URI link to sources
> 959b908 postfix: premission of /var/spool/mail seems incorrect
> 26ee184 toybox: upgrade to 0.7.0
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> 26637f7 qtbase: add runtime dependency to xkeyboard-config
> 8f37f09 recipetool: add support for Qt5 to meta-qt5
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
> 9c18b2d recipes: Replace "mv" with "cp -R --no-dereference --preserve=3Dm=
ode,links"
> f670c0f chromium: fix build with newer gcc
> 32e1c86 firefox: fix install for oe-core master and cleanup packaging
>
> =3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
>
> =3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=
=3D
> f266cb0 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=
=3Dmode,links"
> 63f8944 invensense: include both built libraries in ${PN} not ${PN}-dev
> 6f49c26 atd-over-fso: add explicit EXTRA_OEMAKE
> 40a2802 avahi*: remove unnecessary bbappends
>
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date               !!colspan=3D'3'|Failed tasks                     !!c=
olspan=3D'12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||already=
-stripped      ||libdir        ||textrel       ||build-deps    ||file-rdeps=
    ||version-going-backwards       ||host-user-contaminated        ||insta=
lled-vs-shipped  ||unknown-configure-option      ||symlink-to-sysroot    ||=
invalid-pkgconfig     ||pkgname       ||
> |-
> ||2016-02-26    ||1     ||7     ||10    ||0             ||0             |=
|7             ||2             ||29            ||10            ||0         =
    ||0             ||0             ||0             ||0             ||0    =
         ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Failed tasks 2016-02-26 =3D=3D
>
> INFO: jenkins-job.sh-1.7.1 Complete log available at http://logs.nslu2-li=
nux.org/buildlogs/oe/world/log.report.20160227_180101.log
>
> =3D=3D=3D common () =3D=3D=3D
>
> =3D=3D=3D common-x86 (7) =3D=3D=3D
>     * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
>     * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do=
_compile
>     * /meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb=
, do_compile
>     * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-=
tiny-kexecboot_4.4.bb, do_compile

Hi Martin,

I've finally reproduced the error and I'll send a patch to fix it.
After some change to kernel.bbclass it is necessary to redefine INITRAMFS_T=
ASK

 INITRAMFS_IMAGE =3D "initramfs-kexecboot-klibc-image"
-INITRAMFS_TASK =3D "${INITRAMFS_IMAGE}:do_rootfs"
+INITRAMFS_TASK =3D "${INITRAMFS_IMAGE}:do_image_complete"

See commit 59a5f59 in oe-core "classes: Fix do_rootfs references"

Regards
Andrea

P.S. this recipe does now fail if linux-yocto isn't built
before...investigating with the help of Bruce

>     * /meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-0.1=
0/gst-ffmpeg_0.10.13.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.=
bb, do_configure
>     * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_populate_sysroot
>
> =3D=3D=3D qemuarm (1) =3D=3D=3D
>     * /openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb, =
do_compile
>
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>
> =3D=3D=3D qemux86_64 (3) =3D=3D=3D
>     * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1=
.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do=
_compile
>     * /meta-openembedded/meta-python/recipes-devtools/python/python-matpl=
otlib_1.1.0.bb, do_compile
>
> =3D=3D=3D Number of failed tasks (18) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm      || 1     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20160225_181822.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/12890/
> |-
> || qemux86      || 7     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20160225_201935.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/12999/
> |-
> || qemux86_64   || 10    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20160226_192504.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/13077/
> |}
>
> =3D=3D=3D PNBLACKLISTs (109) =3D=3D=3D
>
> =3D=3D=3D QA issues (48) =3D=3D=3D
> {| class=3Dwikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||host-user-contaminated
> |-
> ||0     ||installed-vs-shipped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||unknown-configure-option
> |-
> ||10    ||version-going-backwards
> |-
> ||2     ||build-deps
> |-
> ||29    ||file-rdeps
> |-
> ||7     ||textrel
> |}
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: =
switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ a=
nd fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. =
invalid state name: 'off'. "default" state must always be first."
> meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "=
OLD and depends on broken azy"
> meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you=
 want to use these modules with E18, then you need to update it to git reci=
pe fetching newer sources from http://git.enlightenment.org/apps/emprint.gi=
t/"
> meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want =
to use these modules with E18, then you need to update it to git recipe fet=
ching newer sources from http://git.enlightenment.org/enlightenment/modules=
/news.git/"
> meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want =
to use these modules with E18, then you need to update it to git recipe fet=
ching newer sources from  http://git.enlightenment.org/apps/rage.git/"
> meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "=
depends on blacklisted emprint"
> meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn'=
t build with gcc-5"
> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "brok=
en: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4=
+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name:=
 'defaault'. "default" state must always be first."
> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=
=3D "BROKEN: latest version 0.3.4 is 3 years old and now broken with more s=
trict ejde_cc from efl-1.13"
> meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] =
?=3D "BROKEN: images are not displayed anymore"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[=
gnome-mplayer] ?=3D "rdepends on blacklisted mplayer"
> meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:=
PNBLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size=
 of array '_GStaticAssertCompileTimeAssertion_2' is negative"
> meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb:PNBLACKLIST[abiword] ?=
=3D "Depends on broken gtkmathview"
> meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalct=
ool] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gman=
e.comp.handhelds.openembedded/57920 and nobody complained, it's also replac=
ed by gnome calculator"
> meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIS=
T[gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[g=
nome-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gn=
ome-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with li=
bgweather"
> meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.b=
b:PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with curren=
t libnotify"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgw=
eather3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus=
3] ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-=
utils.h provider"
> meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNB=
LACKLIST[system-tools-backends] ?=3D "does not build with distroless qemuar=
m as reported in 'State of bitbake world' thread, nobody volunteered to fix=
 them"
> meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb:PNBLACKLIST[gnome-=
themes] ?=3D "BROKEN: x86_64-linux/usr/lib/icon-naming-utils/icon-name-mapp=
ing: No such file or directory"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D=
 "BROKEN: doesn't build with B!=3DS"
> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=
=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
> meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvt=
oolnix] ?=3D "BROKEN: Failx to build with gcc-5"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLI=
ST[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config=
 was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:=
PNBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS =
(trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[=
gst123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
> meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb:PNBLACKLIST[s=
nort] ?=3D "BROKEN: QA Issue: snort_preproc.pc, snort_output.pc, snort.pc"
> meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=
=3D "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories w=
ere installed but not shipped in any package:"
> meta-networking/recipes-daemons/squid/squid_3.5.7.bb:PNBLACKLIST[squid] ?=
=3D "BROKEN: sysroots/qemuarm/usr/include/linux/in.h:28:16: error: redeclar=
ation of 'IPPROTO_IP'"
> meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.=
bb:PNBLACKLIST[iscsitarget] ?=3D "BROKEN: kernel/block-io.c:36:19: error: '=
BIO_UPTODATE' undeclared (first use in this function)"
> meta-networking/recipes-irc/znc/znc_git.bb:PNBLACKLIST[znc] ?=3D "BROKEN:=
 QA Issue: znc.pc failed sanity test"
> meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb:PNBLACKLIST[curlpp=
] ?=3D "BROKEN: QA Issue: curlpp.pc failed sanity test (tmpdir)"
> meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb:PNBLACKLIST[dov=
ecot] ?=3D "BROKEN: QA Issue: -dev package contains non-symlink .so"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLA=
CKLIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold'=
, "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools]=
 ?=3D "BROKEN: fails to build for qemuarm."
> meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-m=
t] ?=3D "BROKEN: Depends on broken yp-tools"
> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez=
-hcidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 c=
onflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKL=
IST[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bl=
uez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATU=
RES', '', d)}"
> meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp]=
 ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts =
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
=3D "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zer=
oc-ice] ?=3D "BROKEN: not compatible with default db version"
> meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=
=3D "BROKEN: QA Issue: -dev package contains non-symlink .so"
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "N=
ot comatible with current nodejs 0.12, but upstream is working on it for v3=
"
> meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb:PNBLACKLIST[cunit] ?=3D "BR=
OKEN: QA Issue: libcunit.la failed sanity test (workdir)"
> meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb:PNBLACKLIST[mpich] ?=3D "BR=
OKEN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc =
failed sanity test (tmpdir)"
> meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[packa=
gekit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently d=
isabled and will be removed soon"
> meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb:PNBLACKLIST[xerces-c]=
 ?=3D "BROKEN: QA Issue: xerces-c.pc failed sanity test (tmpdir)"
> meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb:PNBLACKLIST[efiboo=
tmgr] ?=3D "Depends on blacklisted efivar"
> meta-oe/recipes-extended/efivar/efivar_0.21.bb:PNBLACKLIST[efivar] ?=3D "=
BROKEN: linux.c:27:30: fatal error: linux/nvme_ioctl.h: No such file or dir=
ectory"
> meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb:PNBLACKLIST[gtkm=
athview] ?=3D "BROKEN: ERROR: QA Issue: mathview-frontend-libxml2.pc, mathv=
iew-frontend-libxml2-reader.pc failed sanity test (tmpdir)"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurf=
ace] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=
=3D "BROKEN: Fails to build with gcc-5"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter=
-box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN=
: doesn't build with B!=3DS (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does =
not build with distroless qemuarm as reported in 'State of bitbake world' t=
hread, nobody volunteered to fix them"
> meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb:PNBLACKLIST[tesse=
ract] ?=3D "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
> meta-oe/recipes-graphics/wayland/wayland-fits_git.bb:PNBLACKLIST[wayland-=
fits] ?=3D "BROKEN: fails since wayland upgrade: weston-wfits.cpp:86:39: er=
ror: expected primary-expression before 'struct'"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[x=
f86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without $=
{S} in sed call)"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKL=
IST[xf86-video-geode] ?=3D "BROKEN, fails to build"
> meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends o=
n blacklisted kernel-module-ktapvm"
> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[fox=
trotgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 co=
nflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BR=
OKEN: fails to build with gcc-5"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb=
.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 =
and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb=
.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 =
and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mai=
l] ?=3D "depends on blacklisted libetpan"
> meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBL=
ACKLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-ma=
il"
> meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST=
[claws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
> meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[cl=
aws-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu=
: uncaught target signal 11 (Segmentation fault) - core dumped"
> meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight=
2] ?=3D "Depends on broken libnice"
> meta-oe/recipes-support/farsight/libnice_0.0.13.bb:PNBLACKLIST[libnice] ?=
=3D "BROKEN: QA Issue: nice.pc failed sanity test (tmpdir)"
> meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "=
does not build with distroless qemuarm as reported in 'State of bitbake wor=
ld' thread, nobody volunteered to fix them"
> meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D =
"Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libd=
bi-drivers] ?=3D "BROKEN: fails to build with gcc-5"
> meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmoti=
f] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml=
] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts=
 with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr=
] ?=3D "depends on blacklisted pidgin"
> meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb:PNBLACKLIST[pidgin] ?=3D =
"Not compatible with gnutls version 3.4 currently in oe-core and also depen=
ds on broken libnice through farsight2"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[va=
la-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `s=
rc/.stamp': No such file or directory"
> meta-qt5:
> recipes-qt/libconnman-qt/libconnman-qt5_git.bb:PNBLACKLIST[libconnman-qt5=
] ?=3D "BROKEN: QA Issue: connman-qt5.pc failed sanity test (tmpdir)"
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with b=
luez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "=
Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=
=3D "broken: depends on blacklisted fltk"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn'=
t build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdep=
ends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D "d=
epends on blacklisted iksemel"
> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "${@bb=
.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 =
and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@=
bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]=
 =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] =
?=3D "Depends on blacklisted packagekit"
> meta-webos-ports:
> conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc from=
 meta-virtualiazation which isn't included in my world builds"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't=
 really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't =
really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't =
really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't =
really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't=
 really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[build-appliance-image] =3D "tries to inc=
lude whole downloads directory in /home/builder/poky :/"
> conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 0        issue: libdir
>
>
> count: 7        issue: textrel
> corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0=
/packages-split/corosync/usr/sbin/corosync' has relocations in .text [textr=
el]
> ffmpeg-2.8.6: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.6-r0/package=
s-split/libavcodec/usr/lib/libavcodec.so.56.60.100' has relocations in .tex=
t [textrel]
> ffmpeg-2.8.6: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.6-r0/package=
s-split/libavfilter/usr/lib/libavfilter.so.5.40.101' has relocations in .te=
xt [textrel]
> ffmpeg-2.8.6: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.6-r0/package=
s-split/libpostproc/usr/lib/libpostproc.so.53.3.100' has relocations in .te=
xt [textrel]
> ffmpeg-2.8.6: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.6-r0/package=
s-split/libswresample/usr/lib/libswresample.so.1.2.101' has relocations in =
.text [textrel]
> ffmpeg-2.8.6: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/2.8.6-r0/package=
s-split/libswscale/usr/lib/libswscale.so.3.1.101' has relocations in .text =
[textrel]
> gstreamer1.0-libav-1.6.3: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.=
0-libav/1.6.3-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/li=
bgstlibav.so' has relocations in .text [textrel]
>
>
> count: 2        issue: build-deps
> samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency, =
missing libpam in DEPENDS or PACKAGECONFIG? [build-deps]
> toybox-0.7.0: toybox rdepends on libattr, but it isn't a build dependency=
, missing attr in DEPENDS or PACKAGECONFIG? [build-deps]
>
>
> count: 29       issue: file-rdeps
> chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig require=
s libnewt.so()(64bit), but no providers found in RDEPENDS_chkconfig? [file-=
rdeps]
> chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig require=
s libnewt.so, but no providers found in RDEPENDS_chkconfig? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires li=
bucsi.so()(64bit), but no providers found in RDEPENDS_dvbdate? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires li=
bucsi.so, but no providers found in RDEPENDS_dvbdate? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requires libd=
vbapi.so()(64bit), but no providers found in RDEPENDS_dvbnet? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requires libd=
vbapi.so, but no providers found in RDEPENDS_dvbnet? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan requires l=
ibdvbapi.so, but no providers found in RDEPENDS_dvb-scan? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan requires l=
ibdvbsec.so()(64bit), but no providers found in RDEPENDS_dvb-scan? [file-rd=
eps]
> dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic requi=
res libdvbapi.so()(64bit), but no providers found in RDEPENDS_dvbtraffic? [=
file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic requi=
res libdvbapi.so, but no providers found in RDEPENDS_dvbtraffic? [file-rdep=
s]
> dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires li=
bdvbapi.so()(64bit), but no providers found in RDEPENDS_dvb-femon? [file-rd=
eps]
> dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires li=
bdvbapi.so, but no providers found in RDEPENDS_dvb-femon? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires lib=
dvbapi.so, but no providers found in RDEPENDS_dvb-apps? [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires lib=
dvbsec.so()(64bit), but no providers found in RDEPENDS_dvb-apps? [file-rdep=
s]
> gnome-desktop-2.32.1: /usr/bin/gnome-about contained in package gnome-des=
ktop requires /usr/bin/python, but no providers found in RDEPENDS_gnome-des=
ktop? [file-rdeps]
> libbonobo-2.32.1: /usr/bin/bonobo-slay contained in package libbonobo req=
uires /usr/bin/perl, but no providers found in RDEPENDS_libbonobo? [file-rd=
eps]
> libmodule-build-perl-0.31: /usr/bin/config_data contained in package libm=
odule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/pe=
rl.real, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
> libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires=
 libnewt.so()(64bit), but no providers found in RDEPENDS_whiptail? [file-rd=
eps]
> libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires=
 libnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so contai=
ned in package libnewt-python requires libnewt.so()(64bit), but no provider=
s found in RDEPENDS_libnewt-python? [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so contai=
ned in package libnewt-python requires libnewt.so, but no providers found i=
n RDEPENDS_libnewt-python? [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networ=
kmanager-nmtui requires libnewt.so()(64bit), but no providers found in RDEP=
ENDS_networkmanager-nmtui? [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networ=
kmanager-nmtui requires libnewt.so, but no providers found in RDEPENDS_netw=
orkmanager-nmtui? [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained =
in package numptyphysics requires /usr/bin/perl, but no providers found in =
RDEPENDS_numptyphysics? [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh contai=
ned in package numptyphysics requires /bin/bash, but no providers found in =
RDEPENDS_numptyphysics? [file-rdeps]
> perf-1.0: /usr/libexec/perf-core/scripts/python/call-graph-from-postgresq=
l.py contained in package perf requires /usr/bin/python2, but no providers =
found in RDEPENDS_perf? [file-rdeps]
> tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags=
.so contained in package tracker-nautilus-extension requires libnautilus-ex=
tension.so.1()(64bit), but no providers found in RDEPENDS_tracker-nautilus-=
extension? [file-rdeps]
> tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags=
.so contained in package tracker-nautilus-extension requires libnautilus-ex=
tension.so.1, but no providers found in RDEPENDS_tracker-nautilus-extension=
? [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained =
in package ubx-utils requires /bin/bash, but no providers found in RDEPENDS=
_ubx-utils? [file-rdeps]
>
>
> count: 10       issue: version-going-backwards
> perf-1.0: Package version for package perf went backwards which would bre=
ak package feeds from (0:None-r9.8 to 0:4.4.1-r9.9) [version-going-backward=
s]
> perf-1.0: Package version for package perf-archive went backwards which w=
ould break package feeds from (0:None-r9.8 to 0:4.4.1-r9.9) [version-going-=
backwards]
> perf-1.0: Package version for package perf-dbg went backwards which would=
 break package feeds from (0:None-r9.8 to 0:4.4.1-r9.9) [version-going-back=
wards]
> perf-1.0: Package version for package perf-dev went backwards which would=
 break package feeds from (0:None-r9.8 to 0:4.4.1-r9.9) [version-going-back=
wards]
> perf-1.0: Package version for package perf-doc went backwards which would=
 break package feeds from (0:None-r9.8 to 0:4.4.1-r9.9) [version-going-back=
wards]
> perf-1.0: Package version for package perf-locale went backwards which wo=
uld break package feeds from (0:None-r9.8 to 0:4.4.1-r9.9) [version-going-b=
ackwards]
> perf-1.0: Package version for package perf-perl went backwards which woul=
d break package feeds from (0:None-r9.8 to 0:4.4.1-r9.9) [version-going-bac=
kwards]
> perf-1.0: Package version for package perf-python went backwards which wo=
uld break package feeds from (0:None-r9.8 to 0:4.4.1-r9.9) [version-going-b=
ackwards]
> perf-1.0: Package version for package perf-staticdev went backwards which=
 would break package feeds from (0:None-r9.8 to 0:4.4.1-r9.9) [version-goin=
g-backwards]
> perf-1.0: Package version for package perf-tests went backwards which wou=
ld break package feeds from (0:None-r9.8 to 0:4.4.1-r9.9) [version-going-ba=
ckwards]
>
>
> count: 0        issue: host-user-contaminated
>
>
> count: 0        issue: installed-vs-shipped
>
>
> count: 0        issue: unknown-configure-option
>
>
> count: 0        issue: symlink-to-sysroot
>
>
> count: 0        issue: invalid-pkgconfig
>
>
> count: 0        issue: pkgname
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

