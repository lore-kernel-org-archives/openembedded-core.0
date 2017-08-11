Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5478F6FFCD;
	Fri, 11 Aug 2017 16:00:18 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id u5so17234197pgn.0;
	Fri, 11 Aug 2017 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BBy/QjlqokKP3NzOU++nf5eqipxfHp8MruZ7NAi5bIs=;
	b=NZJJe6NbJcSu+GsFw0dSoAUnwlfhTbB1gLLJDzH5ADLhiNPYCo4uw8lpGiG/CCWHNp
	3ufXSXlP3fZQxXCBtwaKEhBo0gBfLSdILzTR7DGd2f8ieCEVS5lqNBsDEW9KXkYpZD/m
	AJi1p63U8Ooa+OPiCIqEK8SEoz+D5Wa5FdYfi6q0pJhrZi/JcocBIZ8G5VcRjwe9jASX
	97xUMzRcbtfF2sQBkuDdnpRkVV1w+9YNMsmdrhBu6gglUlv699X5X3Ie/MJ0S8d5aF4r
	jjiQvoQFTOiiHykPqt23QZE0LCSqA0u4jUMhUvqj7JVYZbMyxIJDAeuL/1MBMiND2gxU
	oX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BBy/QjlqokKP3NzOU++nf5eqipxfHp8MruZ7NAi5bIs=;
	b=m8IeYnKrZzKGIfmCVyFrE5VvYhG8nLZUxJzJZFxumbbgVZD0xhlPgNXYwwg06ycp3G
	HrDjTLXGgls2TkCh5REVzXSSLdN273hGkIEZhJ62Pf/mBmv/TIv4vv4CgBvNLKmLtxYP
	hQqNs/sfbACwgHJal3ivmufMTGV6A3rmGLJBCm2rAvd9RAvQQ/IZoMFL4i8qZ8NEBE7B
	fx+0HtNFee6z0YLdVII4AOv1GpkCct1GKMfIvDILNXbcC+DEkYoiRIWzDm/r7GKxzPbp
	mRUGgECifNxX1GM986Eet2Y8UwYODsHQgIsu2CPe/tV940tC8SZJXOw08Alk74Jv0C6i
	gy1g==
X-Gm-Message-State: AHYfb5i7Po2cwFJdtDK4vqjlMK0AcXRNU3ZymxTOA6uP0EtgtnvDZkYF
	snN7LQPBAh572x7BVv1SeoblSn/7TQ==
X-Received: by 10.84.138.129 with SMTP id 1mr18611416plp.223.1502467218570;
	Fri, 11 Aug 2017 09:00:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 11 Aug 2017 08:59:48 -0700 (PDT)
In-Reply-To: <20170811080344.GB3320@jama>
References: <20170811080344.GB3320@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Aug 2017 08:59:48 -0700
Message-ID: <CAMKF1sohv7_j=Gduw5y-9-4jCKWNjx-pc205PmfvN2vR4MOe6Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2017-08-09
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
X-List-Received-Date: Fri, 11 Aug 2017 16:00:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2017 at 1:03 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> It got significantly worse again.
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>

Lot of linking issues seems unique to gold ( firefox, qtbase, mariadb )
Kodi patch to use std::string was sent. mongodb needs something similar.
imagemagick issue is also taken care of
I have sent a patch for squid issue

> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date               !!colspan=3D'3'|Failed tasks                     !!|=
Signatures                 !!colspan=3D'14'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||all   |=
|already-stripped      ||libdir        ||textrel       ||build-deps    ||fi=
le-rdeps    ||version-going-backwards       ||host-user-contaminated       =
 ||installed-vs-shipped  ||unknown-configure-option      ||symlink-to-sysro=
ot    ||invalid-pkgconfig     ||pkgname       ||ldflags       ||compile-hos=
t-path     ||
> |-
> ||2017-08-09    ||4     ||9     ||7     ||1     ||0             ||0      =
       ||5             ||0             ||0             ||5             ||0 =
            ||0             ||0             ||0             ||0            =
 ||0             ||0             ||0             ||
> |}
>
> =3D=3D Failed tasks 2017-08-09 =3D=3D
>
> INFO: jenkins-job.sh-1.8.25 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/rocko/log.report.20170810_215947.log
>
> =3D=3D=3D common (2) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb:do_=
configure
>     * meta-openembedded/meta-oe/recipes-support/imagemagick/imagemagick_7=
.0.6.bb:do_fetch
>
> =3D=3D=3D common-x86 (3) =3D=3D=3D
>     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compil=
e
>     * meta-openembedded/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.=
5.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-extended/polkit/polkit-gnome_0.10=
5.bb:do_configure
>
> =3D=3D=3D qemuarm (2) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:d=
o_compile
>     * openembedded-core/meta/recipes-devtools/llvm/llvm_git.bb:do_compile
>
> =3D=3D=3D qemux86 (4) =3D=3D=3D
>     * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.=
bb:do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.2=
6.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do=
_compile
>     * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile
>
> =3D=3D=3D qemux86_64 (2) =3D=3D=3D
>     * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile
>
> =3D=3D=3D Number of failed tasks (20) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm      || 4     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/rocko/log.world.qemuarm.20170809_054937.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/43306/
> |-
> || qemux86      || 9     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/rocko/log.world.qemux86.20170808_120058.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/43271/
> |-
> || qemux86_64   || 7     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/rocko/log.world.qemux86-64.20170809_132802.log/ ||
> |}
>
> =3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D
>
> =3D=3D=3D QA issues (10) =3D=3D=3D
> {| class=3Dwikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||compile-host-path
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||host-user-contaminated
> |-
> ||0     ||installed-vs-shipped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||ldflags
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||unknown-configure-option
> |-
> ||5     ||textrel
> |-
> ||5     ||version-going-backwards
> |}
>
>
>
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (1) =3D=3D=3D
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.si=
gnatures.20170810_022613.log/
>     * ERROR: 1 issues were found in these recipes: gnome-common
>
>     * ERROR: 1 errors found in signatures.qemuarm.do_package_write_ipk.si=
gdata.log
>
>     * ERROR: gnome-common different signature for task do_package_write_i=
pk.sigdata between qemux86copy and qemuarm
>     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/=
sstate-diff/1502367973/signatures.qemuarm.do_package_write_ipk.sigdata.log
>     * ERROR: 1 issues were found in these recipes: gnome-common
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLA=
CKLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-g=
old', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-qt5:
> meta-smartphone:
> meta-webos-ports:
> PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation=
 which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be te=
sted so much"
> PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be te=
sted so much"
> PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads =
directory in /home/builder/poky :/"
>
>
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 0        issue: libdir
>
>
> count: 5        issue: textrel
> chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.2=
810.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations i=
n .text [textrel]
> chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chrom=
ium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromi=
um/chrome' has relocations in .text [textrel]
> corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0=
/packages-split/corosync/usr/sbin/corosync' has relocations in .text [textr=
el]
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x26=
4/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has =
relocations in .text [textrel]
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x26=
4/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148=
' has relocations in .text [textrel]
>
>
> count: 0        issue: build-deps
>
>
> count: 0        issue: file-rdeps
>
>
> count: 5        issue: version-going-backwards
> initramfs-framework-1.0: Package version for package initramfs-framework-=
base went backwards which would break package feeds from (0:1.0-r2.29 to 0:=
1.0-r2.0) [version-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-module-deb=
ug went backwards which would break package feeds from (0:1.0-r2.29 to 0:1.=
0-r2.0) [version-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-module-e2f=
s went backwards which would break package feeds from (0:1.0-r2.29 to 0:1.0=
-r2.0) [version-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-module-mde=
v went backwards which would break package feeds from (0:1.0-r2.29 to 0:1.0=
-r2.0) [version-going-backwards]
> initramfs-framework-1.0: Package version for package initramfs-module-ude=
v went backwards which would break package feeds from (0:1.0-r2.29 to 0:1.0=
-r2.0) [version-going-backwards]
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
>
> count: 0        issue: ldflags
>
>
> count: 0        issue: compile-host-path
>
>
>
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> latest upstream commit:
> 923d556 main: Handle BB_SERVER_TIMEOUT =3D -1 for no server timeout
> not included in master yet:
> a14f46f world-image: add extra target
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
> latest upstream commit:
> df7f522 libinput: Upgrade 1.7.3 -> 1.8.1
> not included in master yet:
> 1bdfba7 report-error: Allow to upload reports automatically
> 961c3f8 buildhistory.bbclass: metadata-revs show repo parent
> 48809ce metadata-revs: provide more information
> f893927 qemux86: Add identical qemux86copy variant for tests
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
> latest upstream commit:
> a8b54e3 pidgin-otr: unblacklist
> not included in master yet:
> 627c0da dnsmasq: disable the service by default
> 1c0b20d rdate: Fix build with hardening
> 812b1de strongswan: Include stdint.h for uintptr_t
> e887307 netkit-rpc: Fix build with hardening flags
> 25bab80 netkit-telnet: Fix build with hardening
> d053851 ncftp: Upgrade to 3.2.6
> ef1f2d3 autofs: Add build dependency on libnsl2
> 45cb3ea openhpi: Fix build on 64bit platforms e.g. aarch64
> 0ca1629 security_flags.inc: Delete
> 908965b pptp-linux: Upgrade to 1.9.0
> ac540aa ebtables: replace ebtables-save perl script with bash rewrite
> ed3f7a2 pimd: Upgrade to 2.3.2
> 156dc7d igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
> 2019e68 rdate: Define logwtmp if libc !=3D glibc
> 469326a netkit-ftp: Include sys/types.h for u_long definition
> 4e5a633 postfix: Disable nis support on musl
> 55cd330 zeroconf: Fix build with musl
> 6f5c1da netperf: change SRC_URI to git repository
> 78d47b6 ippool: Fix build errors found with hardening flags
> 1635d50 openflow: Fix build with musl
> dc71c92 xl2tpd: Update to 1.3.9
> c688bd7 wvstreams: Fix build with musl
> 2e691cd meson: set needs_exe_wrapper
> ce6c02b gperftools: Upgrade to 2.6.1
> 6ea350b c-ares: update 1.12.0 -> 1.13.0
> be8a512 radvd: 2.14 -> 2.17
> b482e5d pam-ssh-agent-auth: add new recipe
> 5b91085 libpwquality: add recipe 1.4.0
> 9fb3b71 libbytesize: add recipe 0.10
> 81cc44e libtimezonemap: add recipe 0.4.5
> 468d302 xmlrpc-c: add recipe 1.31.0
> cfecae4 usermode: add recipe 1.111
> f934668 syslog-ng: provide correct PID directory location to restart/stop=
 syslog-ng daemon
> d778abd python-pyserial: update to version 3.4
> ac277b5 python3-cassandra-driver: update to version 3.8.1
> f51cb1c python-dateutil: update to version 2.6.1
> 46958cb python-cmd2: update to version 0.7.5
> ef22f05 python-webencodings: update to version 0.5.1
> e467826 python-simplejson: update to version 3.11.1
> d15cffd python-serpent: update to version 1.23
> adeca9e python-cython: update to version 0.26
> 7165137 python-evdev: update to version 0.7.0
> e25df49 python-vobject: update to version 0.9.5
> bc38b73 python-pbr: update to version 3.1.1
> a5e670c python-pycparser: update to version 2.18
> 91a7dd7 python-pymisp: update to version 2.4.77
> f1d73b5 python-urllib3: update to version 1.22
> 343f75a python-ldap: update to version 2.4.41
> d057e73 vlock: add new recipe
> 7627581 openldap: 2.4.44 -> 2.4.45
> d1962a3 gvfs: Fix build regression from uprev
> 2c5cd3b logcheck: update to 1.3.18
> 67816b8 minicoredumper: Initialize struct config
> 1224bb8 cherokee: Upgrade to 1.2.104+git
> 94bac88 libesmtp: Fix config.h define for snprintf detection
> cb8b698 usermode: Link with libm for powl() API
> b908bea dbus-daemon-proxy: Fix return value from master_filter_cb()
> 566fd65 ssiapi: Fix build errors found with clang
> fa30377 flashrom: Fix build with clang
> b1684ed glade: fix host contamination on centos7
> 9eff824 tigervnc: add recipe 1.8.0
> dadef49 libreport: add recipe 2.9.1
> 53b5772 libblockdev: add recipe 2.10
> 8353ed0 python3-blivet: add recipe 2.2.0
> 6329b64 python3-blivetgui: add recipe 2.1.5
> 2a141ab drbd: Add recipe
> 139b1ca net-snmp: fix engineBoots value on SIGHUP
> ee188eb assimp: remove recipe
> 3209524 openl2tp: add LGPL-2.1 license
> 1bf32a7 openl2tp: add init script and systemd support
> dee9157 ntop: add new recipe
> 02a32fa android-tools: fix issue with missing files in eSDK updates
> 3354fb4 autoconf-archive: move from meta-oe to OE-core
> 501342e libebml: inherit dos2unix
> 8972a5a Updated mpv to version 0.26.0.
> 9825e17 libqb: update 1.0.1 -> 1.0.2
> a4d45ee libtdb: update 1.3.12 -> 1.3.14
> ec79e9c glmark2: Upgrade to 2017.07 release
> 91f4c84 klibc: Fix build with clang
> 42f26b3 ninja,re2c: Remove
> f16b1c03 ndisc6: Upgrade to 1.0.3
> 1ae1d14 memcached: Update to 1.5.0
> 36e16cb imagemagick: upgrade from 7.0.5 to 7.0.6p4
> 77377dd lvm2/libdevmapper: workaround build man failure
> c9cb425 python-pyusb: make recipe available as python3 version
> 808501a tcpdump: remove unnecessary patch
> 0be2c64 libcyusbserial: new recipe
> 833af46 libftdi: update to 1.4
> 53905d4 nginx: update stable version to 1.12.1
> 47ae613 nginx: update development version to 1.13.3
> 325bb80 apache2: update to version 2.4.27
> 8686832 libxml-sax-writer-perl: update to version 0.57
> 85f6fbf librole-tiny-perl: update to version 2.000005
> 285584f libnet-ssleay-perl: update to version 1.81
> 2b8d780 libmoo-perl: update to version 2.003002
> 13393dc libextutils-parsexs-perl: update to version 3.35
> 5e7d6fb uim: Modified the order of package definition.
> 627948d uim: add dependency on anthy
> 9dbb462 uim: Added glibc-utils and glibc-gconv-euc-jp to RDEPENDS_uim-ant=
hy
> 7876eeb uim: Removed pkg_postinst_uim-common/pkg_prerm_uim-common.
> eedc727 uim: Fixed pkg_postinst_*/pkg_prerm_* for uim-anthy and uim-skk.
> 590515f uim: Fixed a problem that an immodule.cache is not updated approp=
riately when uim-gtk2.0 or uim-gtk3 was installed.
> 5488b4c bluez4: remove bluez4-only recipes
> 7409cc8 libotr: Upgrade from 4.0.0 to 4.1.1 and update patches
> 94e0b68 pidgin: Update from 2.11.0 to 2.12.0
> fa174b2 exo: update 0.11.2 -> 0.11.5
> 85fcfae thunar: update 1.6.11 -> 1.6.12
> b4f468d xfce4-terminal: update 0.8.4 -> 0.8.6
> 52abb54 xfce4-whiskermenu-plugin: update 2.1.2 -> 2.1.3
> 3343752 xfce4-clipman-plugin: update 1.4.1 -> 1.4.2
> 5c65bed xfce4-xkb-plugin: update 0.7.1 -> 0.8.0
> 2fe51b7 xfce4-screenshooter: update 1.8.2 -> 1.9.1
> 3a03560 kodi: fix build with latest gcc
> 27c28b4 poppler: update 0.53.0 -> 0.57.0
> 0a6c066 php7: upgrade to 7.1.7
> a0b4384 llvm: Remove
> e435561 squid: Add missing dependencies on openssl expat and libxml2
> 2879a64 mongodb: Upgrade to 3.4.6
> 6f387c5 python3-twisted: Fix build with clang
> 3486af5 python-grpcio: Do not hardcode compiler -std options
> e555390 collectd: Fix build with clang
> 0fdf014 fbida: Fix build with libjpeg-turbo
> 362c622 recipes: remove blacklisted recipes
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:
> 8960831 qwt-qt5.inc: fix QA warning
> not included in master yet:
> 6e9892a qtbase: add ptest
> d53382f qt5-ptest: fix build with yocto < 2.3 (pyro)
> 9042969 qtbase: Fix ptests with clang
> 0b41b62 qtbase: Use sched_yield instead of pthread_yield
> 17d94b7 quazip: update to 0.7.3 and add missing metadata
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
> latest upstream commit:
> e3c3aa0 Merge pull request #57 from kraj/kraj/master
> not included in master yet:
> e961581 gnome-settings-daemon: remove the bbappend for removed recipe
>
> =3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
> latest upstream commit:
> 03f4072 alsa-lib: Remove 0001-ucm-fix-handling-of-config-files-when-file-=
type-is-n.patch
> not included in master yet:
>
> =3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=
=3D
> latest upstream commit:
> 1fe2b3b android-system-image-tenderloin: update Android image
> not included in master yet:
> e468a34 meta-shr, meta-fso: remove blacklisted recipes
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

