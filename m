Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id DE40A771BC;
	Mon,  1 Feb 2016 21:27:05 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id x4so84104000lbm.0;
	Mon, 01 Feb 2016 13:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Dql/o5N3EBsq9U/TZcbqftEFb/h6fdaJK2SJjwKQVa8=;
	b=NbFJOKiTsD8U2OrZ80ycEwvjqu3BqaTr8k4BUh+4Pz+we1YIn0Spu0m+5mJkdjHU9Z
	zU7U+TY9TUgp5UXnEQrO+ovr1z3UlTuG9X+bCm6P0Cv3EEEb8nG6/rwJWNAti3UKqr/8
	cfVYL0UxMgUkCmK7DISEZMGOMxoPf1r2bvfecCB3CBJLpbDWbHQaAsruc2txbCMpjsNe
	PqhyJVcAOYmTCrzEveNu4iZQ5DYV4ynz6SbGB0s0JW88juLc058Y+vui/fn+GHyBodfF
	W19rxge+8OW+/Zp7CTQ3Qj0hCZbzxiNTu6gzwdhsr21wV+mu7zHRDE/i9VW9gTbJ913P
	Uvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Dql/o5N3EBsq9U/TZcbqftEFb/h6fdaJK2SJjwKQVa8=;
	b=ksFkKiha3S1xUT99dTCgjBTFGbejq9FRcZZATJjhpt/R1ax+26hB8sHkMNTRgcSFwB
	9iOgmDwcPc+FvEK7hoWCJ4pk8uj+p6TpeCpKa4yzRpk2scSh1yA0FUsgyu04LGq3GBXq
	pcBvFqtwJD5s3l06OpMVXnorPA8HazrEURLnmG0N86G2LmVcnAvH49xD33LMDpddmoac
	+xQ0JHgEy9vwDO4/N/Xtvuu6n9zsBaNlufxmjzSR63xuKiW1GhxH4gEFWzg5zpjRXkf2
	WcRyND2RShs+6zkmDTAI0WLwUnB1f8sU+A99OBtDJXHGmq8eg1HUhysWI0dDR7KXuz8G
	3VqQ==
X-Gm-Message-State: AG10YOQTeifW2nNFvFcEVrDiOu76nXircHH4dGaBmHmbTz3bAsjHFqfrcYhOSyo9Ha52cqv9PJGjB45dfFsS+A==
MIME-Version: 1.0
X-Received: by 10.112.61.226 with SMTP id t2mr9781196lbr.33.1454362025582;
	Mon, 01 Feb 2016 13:27:05 -0800 (PST)
Received: by 10.114.19.35 with HTTP; Mon, 1 Feb 2016 13:27:05 -0800 (PST)
In-Reply-To: <20160201143944.GA2639@jama>
References: <20160201143944.GA2639@jama>
Date: Mon, 1 Feb 2016 22:27:05 +0100
Message-ID: <CAAQYJAthx_JUnirFxJA06Zx-Oeoo8xDqchyL5L2To5K82tYvpw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2016-01-30
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
X-List-Received-Date: Mon, 01 Feb 2016 21:27:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 1, 2016 at 3:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> 450125e world-image: add extra target
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
> 69ddf84 gcc-5.3: backport fix for PR-target-65358
> 8672c24 sstate-sysroot-cruft.sh: Extend the whitelist
> 70fa785 arch-armv7ve.inc: respect armv7a override as well
> 98ca6ff qemux86: Add identical qemux86copy variant for tests
> 7d528e8 report-error: Allow to upload reports automatically
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
> 160300f webkit-efl: fix build with newer CMake 3.4 from oe-core
> fd58baf netkit-telnet: Add to generate telnetlogin.
> cbe45c4 netkit-rsh: add two patches and some fixes.
> d74aff8 net-snmp: fix cross-compile breakage, add libnl pkgconfig option
> 30c60a5 geis: initial add 2.2.17
> 33132f8 grail: initial add 3.1.0
> 061ee30 frame: initial add 2.5.0
> d1d5081 atop: add recipe
> 78b38b4 memtester: upgrade 4.1.3 -> 4.3.0
> ea58369 php: update to 5.6.17 and 5.5.31
> 9d1ca09 php: check for existance of directory before 'rmdir' in do_instal=
l_append_class-target
> 5100f3b nginx: update to 1.9.9
> 30870d9 liboil: import liboil_0.3.17 recipe from oe-core
> d0fb715 rygel: Update to 0.28.2
> 4c28da2 gupnp: Update to 0.20.14
> 71286d0 gst-plugins-base: drop obsolete dependency on liboil
> 73d477a various: delete leftovers from qt4 recipes
> 4dae236 networkmanager: add PACKAGECONFIG for qt4-x11-free
> 76928fa openldap: improve packaging of OpenLDAP modules
> 14344c8 phpmyadmin: CVE-2015-8669
> 4eaf380 gvfs: disable build of documentation to fix build in some envirio=
nments
> 01ac9d7 ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
> 3f56ae3 libx86-1: port a patch to make it work
> 659bede polkit: Fix build with musl
> a38974e fbset: Fix out of tree builds ( S !=3D B )
> 468b83e lvm2: Portable fixes for fixing compile with musl
> bc6873c numactl: update to 2.0.11
> 4df9cab thrift: Add recipe for Apache Thrift.
> 0af4f4a efivar: fix zero initializer compiler error
> d2f68cc wmiconfig: mark as having broken "make clean"
> aea6bb1 s3c64xx-gpio: mark as having broken "make clean"
> 2ddbc2d s3c24xx-gpio: mark as having broken "make clean"
> 7a7f1b0 illume-keyboards-shr: mark as having broken "make clean"
> efa1f63 fix missing packageconfig for samba with sysvinit
> 2a96cd3 hwdata: add new recipe
> 53189bd python(3)-flask-pymongo: add recipes
> cea0c80 python(3)-flask-login: add recipes
> 9a08b69 python(3)-flask: add recipes
> 6f2a75d python(3)-whoosh: add recipes
> 6ecefbd python(3)-xlrd: add recipes
> b02b387 python3-tornado: add recipe
> c97a1cf python-certifi: 14.05.14 -> 2015.11.20.1 and add python3 recipe
> cd27029 python(3)-pymongo: add recipes
> 19067cf python-jinja2: 2.7.3 -> 2.8 and add python3 recipe
> a34b770 python(3)-pymisp: add recipes
> a60f700 python(3)-werkzeug: add recipe
> 4bbc1d0 python(3)-redis: add recipes
> 61dad53 python-requests: 2.7.0 -> 2.9.1 and add python3 recipe
> 5a3d827 python(3)-passlib: add recipes
> 5ae5d5f python(3)-markupsafe: add recipes
> 6c251a5 python(3)-itsdangerous: add recipes
> f065fc9 python-dateutil: 1.5 -> 2.4.2 and add python3 recipe
> 11097a3 python-six: 1.9.0 -> 1.10.0 and add python3-recipe
> a1d888b add pypi3 bbclass to make python3 recipe creation easier as well
> e5660e4 python(3)-feedformatter: add recipes
> 6aa4a19 python(3)-lxml: 3.4.4 -> 3.5.0
> bc72cae waf-samba.bbclass: add cross-answers option and files
> 6f01ef8 samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
> ab09609 lowpan-tools: add missing flex/bison deps
> 2321c0f postfix: fix clean broken issue
> 07f1ec2 ncftp: fix build failures with ccdv
> b53115b iscsitarget: skip the arch test for kernel modules
> 9571949 iscsitarget: split the kernel module into separate package
> c39fb17 netkit-ftp: fixed invalid symlink
> 15c5fbf ctdb: add PACKAGECONFIG for libtdb
> 9b8a390 cim-schema-exper: fix host-user-contaminated
> 998ff83 nbd: use BPN in Files
> 518cd81 wireshark: update SRC_URI link to sources
> 1b89bce postfix: premission of /var/spool/mail seems incorrect
> fa50c24 mongodb: 2.6.0 -> 3.3.0 and remove from pnblacklist
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> 76f8806 qtbase: use PACKAGECONFIG to ensure runtime dependency to libssl
> 877a503 Revert "qtbase: fix Tartget typo"
> 5a149f4 qtbase: fix Tartget typo
> 3bd2972 qtbase: re-enable replacing host paths in qconfig.pri
> 3e2058f qt5: allow overriding git protocol used with QT_GIT uri
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
>
> =3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
>
> =3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=
=3D
> ab3fcab i9300: don't use metadata checksums in ext4 image
> 1b34040 cornucopia: inherit from autotools-brokensep to fix Vala builds
> fc317c6 linux-samsung-i9300: fix compilation with GCC 5
> a31574e linux-samsung-i9300: quieten excessive kernel output
> 5774504 formfactor: Add machconfig for i9300
> b4825ef shr-image: Start graphical environment by default
> c69cf39 linux-lg-mako: bump SRCREV
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
> ||2016-01-30    ||9     ||13    ||14    ||0             ||5             |=
|11            ||5             ||32            ||10            ||11        =
    ||2             ||0             ||0             ||0             ||0    =
         ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Failed tasks 2016-01-30 =3D=3D
>
> INFO: jenkins-job.sh-1.7.1 Complete log available at http://logs.nslu2-li=
nux.org/buildlogs/oe/world/log.report.20160131_163329.log
>
> =3D=3D=3D common (8) =3D=3D=3D
>     * /meta-openembedded/meta-gnome/recipes-gnome/themes/gnome-themes_2.3=
2.1.bb, do_install
>     * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/i=
netutils_1.9.4.bb, do_install
>     * /meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.=
7.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-connectivity/thrift/thrift_0.9.3=
.bb, do_configure
>     * /meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.21.bb, =
do_compile
>     * /meta-openembedded/meta-oe/recipes-graphics/wayland/wayland-fits_gi=
t.bb, do_compile
>     * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.=
3.bb, do_configure
>     * /meta-smartphone/meta-shr/recipes-shr/games/openmoocow_git.bb, do_c=
onfigure
>
> =3D=3D=3D common-x86 (3) =3D=3D=3D
>     * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
>     * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do=
_compile
>     * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile
>
> =3D=3D=3D qemuarm (1) =3D=3D=3D
>     * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/isc=
sitarget_1.4.20.3+svn502.bb, do_compile
>
> =3D=3D=3D qemux86 (2) =3D=3D=3D
>     * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-stat=
ic-utils_2.0.4.bb, do_compile
>     * /meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.=
4.bb, do_compile
>

Hello Martin,
there are specific patches for this one in klibc git.
http://git.kernel.org/cgit/libs/klibc/klibc.git/log/

Last klibc 2.0.4 is dated 2014 and I'm waiting for a new, overdue,
release which should happen very soon.
Otherwise I'll pick some patches or even move to a later git tag.


> =3D=3D=3D qemux86_64 (3) =3D=3D=3D
>     * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-=
tiny-kexecboot_4.1.bb, do_compile

I'm building this recipe right now. Once debugged I'll send a patch to the =
ML.

Thanks for your time building all this stuff!
Andrea

>     * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do=
_compile
>     * /meta-openembedded/meta-python/recipes-devtools/python/python-matpl=
otlib_1.1.0.bb, do_compile
>
> =3D=3D=3D Number of failed tasks (36) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm      || 9     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20160129_153307.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/12018/
> |-
> || qemux86      || 13    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20160129_173933.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/12031/
> |-
> || qemux86_64   || 14    || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20160130_171545.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/12041/
> |}
>
> =3D=3D=3D PNBLACKLISTs (89) =3D=3D=3D
>
> =3D=3D=3D QA issues (76) =3D=3D=3D
> {| class=3Dwikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||unknown-configure-option
> |-
> ||10    ||version-going-backwards
> |-
> ||11    ||host-user-contaminated
> |-
> ||11    ||textrel
> |-
> ||2     ||installed-vs-shipped
> |-
> ||32    ||file-rdeps
> |-
> ||5     ||build-deps
> |-
> ||5     ||libdir
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
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "N=
ot comatible with current nodejs 0.12, but upstream is working on it for v3=
"
> meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[packa=
gekit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently d=
isabled and will be removed soon"
> meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb:PNBLACKLIST[rsyslog] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
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
"Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb:P=
NBLACKLIST[start-stop-daemon] ?=3D "BROKEN: fails because of gettext, parti=
al fix is available here http://patchwork.openembedded.org/patch/89867/"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[va=
la-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `s=
rc/.stamp': No such file or directory"
> meta-qt5:
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
> count: 5        issue: libdir
> qtbase-dbg: found library in wrong location: /usr/share/qt5/examples/widg=
ets/tools/echoplugin/plugin/.debug/libechoplugin.so [libdir]
> qtdeclarative-dbg: found library in wrong location: /usr/share/qt5/exampl=
es/qml/qmlextensionplugins/imports/TimeExample/.debug/libqmlqtimeexampleplu=
gin.so [libdir]
> qtmultimedia-5.5.99+5.6.0-alpha1+gitAUTOINC+ac1b772ec8: qtmultimedia-dbg:=
 found library in wrong location: /usr/share/qt5/examples/multimedia/spectr=
um/.debug/libfftreal.so.1.0.0 [libdir]
> qtquick1-dbg: found library in wrong location: /usr/share/qt5/examples/de=
clarative/cppextensions/imageprovider/ImageProviderCore/.debug/libqmlimagep=
roviderplugin.so [libdir]
> qtsensors-dbg: found library in wrong location: /usr/share/qt5/examples/s=
ensors/grue/.debug/libgruesensor.so.1.0.0 [libdir]
>
>
> count: 11       issue: textrel
> corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0=
/packages-split/corosync/usr/sbin/corosync' has relocations in .text [textr=
el]
> gstreamer1.0-libav-1.6.3: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.=
0-libav/1.6.3-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/li=
bgstlibav.so' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [tex=
trel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [te=
xtrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [tex=
trel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [t=
extrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text =
[textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textre=
l]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textr=
el]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-l=
inux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc=
/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.=
0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has=
 relocations in .text [textrel]
>
>
> count: 5        issue: build-deps
> mongodb-3.3.0+gitAUTOINC+aacd231be0: mongodb rdepends on libpcap, but it =
isn't a build dependency? [build-deps]
> rygel-0.28.2: rygel rdepends on libunistring, but it isn't a build depend=
ency? [build-deps]
> rygel-0.28.2: rygel-plugin-media-export rdepends on libunistring, but it =
isn't a build dependency? [build-deps]
> samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency? =
[build-deps]
> snort-2.9.7.5: snort rdepends on liblzma, but it isn't a build dependency=
? [build-deps]
>
>
> count: 32       issue: file-rdeps
> chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconf=
ig requires libnewt.so()(64bit), but no providers found in its RDEPENDS [fi=
le-rdeps]
> chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconf=
ig requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate req=
uires libucsi.so()(64bit), but no providers found in its RDEPENDS [file-rde=
ps]
> dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate req=
uires libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requir=
es libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdep=
s]
> dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requir=
es libdvbapi.so, but no providers found in its RDEPENDS [file-o providers f=
ound in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon r=
equires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps req=
uires libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
> fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot=
 requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
> gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in pac=
kage gnome-desktop requires /usr/bin/python, but no providers found in its =
RDEPENDS [file-rdeps]
> gst-plugins-base-0.10.36: /usr/bin/gst-visualise-0.10_gst-plugins-base-ap=
ps contained in package gst-plugins-base-apps requires /usr/bin/perl, but n=
o providers found in its RDEPENDS [file-rdeps]
> gupnp-0.20.14: /usr/bin/gupnp-binding-tool_gupnp-dev contained in package=
 gupnp-dev requires /usr/bin/python, but no providers found in its RDEPENDS=
 [file-rdeps]
> libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package lib=
bonobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file=
-rdeps]
> libmodule-build-perl-0.31: /usr/bin/config@underscore@data_libmodule-buil=
d-perl contained in package libmodule-build-perl requires /tmp/sysroots/x86=
_64-linux/usr/bin/perl-native/perl.real, but no providers found in its RDEP=
ENDS [file-rdeps]
> libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail=
 requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
> libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snac=
k.so_libnewt-python contained in package libnewt-python requires libnewt.so=
()(64bit), but no providers found in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snac=
k.so_libnewt-python contained in package libnewt-python requires libnewt.so=
, but no providers found in its RDEPENDS [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui-connect_networkmanager-nmtui contai=
ned in package networkmanager-nmtui requires libnewt.so()(64bit), but no pr=
oviders found in its RDEPENDS [file-rdeps]
> networkmanager-1.0.10: /usr/bin/nmtui-connect_networkmanager-nmtui contai=
ned in package networkmanager-nmtui requires libnewt.so, but no providers f=
ound in its RDEPENDS [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphys=
ics contained in package numptyphysics requires /usr/bin/perl, but no provi=
ders found in its RDEPENDS [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@al=
l.sh_numptyphysics contained in package numptyphysics requires /bin/bash, b=
ut no providers found in its RDEPENDS [file-rdeps]
> perf-1.0: /usr/libexec/perf-core/tests/attr.py_perf contained in package =
perf requires /usr/bin/python, but no providers found in its RDEPENDS [file=
-rdeps]
> tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags=
.so_tracker-nautilus-extension contained in package tracker-nautilus-extens=
ion requires libnautilus-extension.so.1()(64bit), but no providers found in=
 its RDEPENDS [file-rdeps]
> tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags=
.so_tracker-nautilus-extension contained in package tracker-nautil feeds fr=
om (0:None-r9.2 to 0:4.1.15-r9.3) [version-going-backwards]
> perf-1.0: Package version for package perf-tests went backwards which wou=
ld break package feeds from (0:None-r9.2 to 0:4.1.15-r9.3) [version-going-b=
ackwards]
>
>
> count: 11       issue: host-user-contaminated
> babiloo-efl: /babiloo-efl/usr/share/babiloo/core/test/test_dictionary.py =
is owned by uid 3004, which is the same as the user running bitbake. This m=
ay be due to host contamination [host-user-contaminated]
> cinematicexperience: /cinematicexperience/usr/share/cinematicexperience-1=
.0/content/images/qt_logo.png is owned by uid 3004, which is the same as th=
e user running bitbake. This may be due to host contamination [host-user-co=
ntaminated]
> numptyphysics: /numptyphysics/usr/share/numptyphysics/org_level/L50_nauti=
lus.nph is owned by uid 3004, which is the same as the user running bitbake=
. This may be due to host contamination [host-user-contaminated]
> qt5everywheredemo: /qt5everywheredemo/usr/share/qt5everywheredemo-1.0/qml=
/QtDemo/images/tv.png is owned by uid 3004, which is the same as the user r=
unning bitbake. This may be due to host contamination [host-user-contaminat=
ed]
> qt5ledscreen: /qt5ledscreen/usr/share/qt5ledscreen-1.0/images/logo1.png i=
s owned by uid 3004, which is the same as the user running bitbake. This ma=
y be due to host contamination [host-user-contaminated]
> qt5nmapcarousedemo: /qt5nmapcarousedemo/usr/share/qt5nmapcarousedemo-1.0/=
content/images/arrow-right.png is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
> qt5nmapper: /qt5nmapper/usr/share/qt5nmapper-1.0/content/images/switch_th=
umb.png is owned by uid 3004, which is the same as the user running bitbake=
. This may be due to host contamination [host-user-contaminated]
> qtsmarthome: /qtsmarthome/usr/share/qtsmarthome-1.0/qml/smarthome/compone=
nts/tabwidget/VTabBar.qml is owned by uid 3004, which is the same as the us=
er running bitbake. This may be due to host contamination [host-user-contam=
inated]
> quitbattery: /quitbattery/usr/share/quitbattery-1.0.0/qml/QUItBattery/ima=
ges/glass.png is owned by uid 3004, which is the same as the user running b=
itbake. This may be due to host contamination [host-user-contaminated]
> quitindicators: /quitindicators/usr/share/quitindicators-1.0.1/qml/QUItIn=
dicators/images/dots_512.png is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-con=
taminated]
> thone: /thone/usr/bin/thone-toggle is owned by uid 3004, which is the sam=
e as the user running bitbake. This may be due to host contamination [host-=
user-contaminated]
>
>
> count: 2        issue: installed-vs-shipped
> ntp: 1 installed and not shipped files. [installed-vs-shipped]
> uim: 5 installed and not shipped files. [installed-vs-shipped]
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
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

