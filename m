Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E059B78244;
	Fri, 11 Aug 2017 08:02:13 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t201so36104231wmt.1;
	Fri, 11 Aug 2017 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=6u0uZgHdeqSJ8eRk9lG0huNOI8oNULq/JxaBIzg7R1o=;
	b=bPsUxhpTOnPzjwgTkkIe+P45oJ5ciukd8p2xkR9QeE/reqhUGSXhQVE7LHaiWK0G3t
	IkjpZoCnBqDmuyYXpEMyCYO0Cr+9Yt13wRaOHPgwVdLZCYR6Lb08+rH7/VQsN5J2olD4
	CpO6aBDTcXt1XYzdMDtEjTqVEakT64zjHksrOl1t1ivVvGbeUhSMTyRTnsio67CDhmGW
	3+lfSCDxQC8VMQdz0J2iRE+D6aGt83l4o0HMHS5WHJ62pJSxvdfvcbCGXVskpcCMJkqN
	DD5Xm38/IPVurNq1OjuzpfbJtGMjH0uKfA3NGuCLMyGUVKOU/04tKMhllLrvJamVm4Pl
	w35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=6u0uZgHdeqSJ8eRk9lG0huNOI8oNULq/JxaBIzg7R1o=;
	b=YEYGId+iIb+LkVs9Ig2ZvuTDMqpkYodQPU+w+WzbAB7momBXqEXENyupx92nTxoym9
	ZXkZvXH1XuVjzNvRDV1o6H0qaVqiqD9i6PPqmQEe+6Urcxf9xcCWns20tF7vx7Mzsf9Y
	oR9xVfqQgkXIgtDsqzOwiWVxKiiLeTzeMRfYaHcioZNrZAHVpPemeIuyZlyOhimdxe7G
	CMibRPJZAbhgFP5e0Am9PrbhyLiWfqskRVk51qBQrWxWsPjdwRLvbTT4DCyHqt2lQcmw
	1xzy8dEwde8gBYriEdn7F/8gSqonH3oADLGVJ2SWe+zSGYx4weyBcOM182M6kmFwUwpM
	pNow==
X-Gm-Message-State: AHYfb5hF1Eon1nTedcLVpETR/KZdeU2/r5urQNECiQb/0j52o4QIgsVV
	St2YlFrBz87r2T89
X-Received: by 10.28.234.145 with SMTP id g17mr8661640wmi.144.1502438533970;
	Fri, 11 Aug 2017 01:02:13 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id i5sm396283wmd.47.2017.08.11.01.02.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 Aug 2017 01:02:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Aug 2017 10:03:44 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170811080344.GB3320@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-08-09
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
X-List-Received-Date: Fri, 11 Aug 2017 08:02:14 -0000
X-Groupsio-MsgNum: 101249
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline

--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It got significantly worse again.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!|Signatures		  !!colspan=
=3D'14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||=09
|-
||2017-08-09	||4	||9	||7	||1	||0		||0		||5		||0		||0		||5		||0		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-08-09 =3D=3D

INFO: jenkins-job.sh-1.8.25 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170810_215947.log

=3D=3D=3D common (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb:do_co=
nfigure
    * meta-openembedded/meta-oe/recipes-support/imagemagick/imagemagick_7.0=
=2E6.bb:do_fetch

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.=
bb:do_configure
    * meta-openembedded/meta-oe/recipes-extended/polkit/polkit-gnome_0.105.=
bb:do_configure

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_=
compile
    * openembedded-core/meta/recipes-devtools/llvm/llvm_git.bb:do_compile

=3D=3D=3D qemux86 (4) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb=
:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.26.=
bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_c=
ompile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtwebkit_git.bb:do_compile

=3D=3D=3D Number of failed tasks (20) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170809_054937.log/ || http://errors.yoctoproject.org/Err=
ors/Build/43306/
|-
|| qemux86 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170808_120058.log/ || http://errors.yoctoproject.org/Err=
ors/Build/43271/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170809_132802.log/ ||=20
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (10) =3D=3D=3D
{| class=3Dwikitable
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
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||5	||textrel
|-
||5	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (1) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170810_022613.log/
    * ERROR: 1 issues were found in these recipes: gnome-common

    * ERROR: 1 errors found in signatures.qemuarm.do_package_write_ipk.sigd=
ata.log

    * ERROR: gnome-common different signature for task do_package_write_ipk=
=2Esigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1502367973/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 1 issues were found in these recipes: gnome-common


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-qt5:
meta-smartphone:
meta-webos-ports:
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation w=
hich isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads di=
rectory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 5	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has re=
locations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 5	issue: version-going-backwards
initramfs-framework-1.0: Package version for package initramfs-framework-ba=
se went backwards which would break package feeds from (0:1.0-r2.29 to 0:1.=
0-r2.0) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-debug=
 went backwards which would break package feeds from (0:1.0-r2.29 to 0:1.0-=
r2.0) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-e2fs =
went backwards which would break package feeds from (0:1.0-r2.29 to 0:1.0-r=
2.0) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-mdev =
went backwards which would break package feeds from (0:1.0-r2.29 to 0:1.0-r=
2.0) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-udev =
went backwards which would break package feeds from (0:1.0-r2.29 to 0:1.0-r=
2.0) [version-going-backwards]


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
923d556 main: Handle BB_SERVER_TIMEOUT =3D -1 for no server timeout
not included in master yet:=20
a14f46f world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
df7f522 libinput: Upgrade 1.7.3 -> 1.8.1
not included in master yet:=20
1bdfba7 report-error: Allow to upload reports automatically
961c3f8 buildhistory.bbclass: metadata-revs show repo parent
48809ce metadata-revs: provide more information
f893927 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
a8b54e3 pidgin-otr: unblacklist
not included in master yet:=20
627c0da dnsmasq: disable the service by default
1c0b20d rdate: Fix build with hardening
812b1de strongswan: Include stdint.h for uintptr_t
e887307 netkit-rpc: Fix build with hardening flags
25bab80 netkit-telnet: Fix build with hardening
d053851 ncftp: Upgrade to 3.2.6
ef1f2d3 autofs: Add build dependency on libnsl2
45cb3ea openhpi: Fix build on 64bit platforms e.g. aarch64
0ca1629 security_flags.inc: Delete
908965b pptp-linux: Upgrade to 1.9.0
ac540aa ebtables: replace ebtables-save perl script with bash rewrite
ed3f7a2 pimd: Upgrade to 2.3.2
156dc7d igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
2019e68 rdate: Define logwtmp if libc !=3D glibc
469326a netkit-ftp: Include sys/types.h for u_long definition
4e5a633 postfix: Disable nis support on musl
55cd330 zeroconf: Fix build with musl
6f5c1da netperf: change SRC_URI to git repository
78d47b6 ippool: Fix build errors found with hardening flags
1635d50 openflow: Fix build with musl
dc71c92 xl2tpd: Update to 1.3.9
c688bd7 wvstreams: Fix build with musl
2e691cd meson: set needs_exe_wrapper
ce6c02b gperftools: Upgrade to 2.6.1
6ea350b c-ares: update 1.12.0 -> 1.13.0
be8a512 radvd: 2.14 -> 2.17
b482e5d pam-ssh-agent-auth: add new recipe
5b91085 libpwquality: add recipe 1.4.0
9fb3b71 libbytesize: add recipe 0.10
81cc44e libtimezonemap: add recipe 0.4.5
468d302 xmlrpc-c: add recipe 1.31.0
cfecae4 usermode: add recipe 1.111
f934668 syslog-ng: provide correct PID directory location to restart/stop s=
yslog-ng daemon
d778abd python-pyserial: update to version 3.4
ac277b5 python3-cassandra-driver: update to version 3.8.1
f51cb1c python-dateutil: update to version 2.6.1
46958cb python-cmd2: update to version 0.7.5
ef22f05 python-webencodings: update to version 0.5.1
e467826 python-simplejson: update to version 3.11.1
d15cffd python-serpent: update to version 1.23
adeca9e python-cython: update to version 0.26
7165137 python-evdev: update to version 0.7.0
e25df49 python-vobject: update to version 0.9.5
bc38b73 python-pbr: update to version 3.1.1
a5e670c python-pycparser: update to version 2.18
91a7dd7 python-pymisp: update to version 2.4.77
f1d73b5 python-urllib3: update to version 1.22
343f75a python-ldap: update to version 2.4.41
d057e73 vlock: add new recipe
7627581 openldap: 2.4.44 -> 2.4.45
d1962a3 gvfs: Fix build regression from uprev
2c5cd3b logcheck: update to 1.3.18
67816b8 minicoredumper: Initialize struct config
1224bb8 cherokee: Upgrade to 1.2.104+git
94bac88 libesmtp: Fix config.h define for snprintf detection
cb8b698 usermode: Link with libm for powl() API
b908bea dbus-daemon-proxy: Fix return value from master_filter_cb()
566fd65 ssiapi: Fix build errors found with clang
fa30377 flashrom: Fix build with clang
b1684ed glade: fix host contamination on centos7
9eff824 tigervnc: add recipe 1.8.0
dadef49 libreport: add recipe 2.9.1
53b5772 libblockdev: add recipe 2.10
8353ed0 python3-blivet: add recipe 2.2.0
6329b64 python3-blivetgui: add recipe 2.1.5
2a141ab drbd: Add recipe
139b1ca net-snmp: fix engineBoots value on SIGHUP
ee188eb assimp: remove recipe
3209524 openl2tp: add LGPL-2.1 license
1bf32a7 openl2tp: add init script and systemd support
dee9157 ntop: add new recipe
02a32fa android-tools: fix issue with missing files in eSDK updates
3354fb4 autoconf-archive: move from meta-oe to OE-core
501342e libebml: inherit dos2unix
8972a5a Updated mpv to version 0.26.0.
9825e17 libqb: update 1.0.1 -> 1.0.2
a4d45ee libtdb: update 1.3.12 -> 1.3.14
ec79e9c glmark2: Upgrade to 2017.07 release
91f4c84 klibc: Fix build with clang
42f26b3 ninja,re2c: Remove
f16b1c03 ndisc6: Upgrade to 1.0.3
1ae1d14 memcached: Update to 1.5.0
36e16cb imagemagick: upgrade from 7.0.5 to 7.0.6p4
77377dd lvm2/libdevmapper: workaround build man failure
c9cb425 python-pyusb: make recipe available as python3 version
808501a tcpdump: remove unnecessary patch
0be2c64 libcyusbserial: new recipe
833af46 libftdi: update to 1.4
53905d4 nginx: update stable version to 1.12.1
47ae613 nginx: update development version to 1.13.3
325bb80 apache2: update to version 2.4.27
8686832 libxml-sax-writer-perl: update to version 0.57
85f6fbf librole-tiny-perl: update to version 2.000005
285584f libnet-ssleay-perl: update to version 1.81
2b8d780 libmoo-perl: update to version 2.003002
13393dc libextutils-parsexs-perl: update to version 3.35
5e7d6fb uim: Modified the order of package definition.
627948d uim: add dependency on anthy
9dbb462 uim: Added glibc-utils and glibc-gconv-euc-jp to RDEPENDS_uim-anthy
7876eeb uim: Removed pkg_postinst_uim-common/pkg_prerm_uim-common.
eedc727 uim: Fixed pkg_postinst_*/pkg_prerm_* for uim-anthy and uim-skk.
590515f uim: Fixed a problem that an immodule.cache is not updated appropri=
ately when uim-gtk2.0 or uim-gtk3 was installed.
5488b4c bluez4: remove bluez4-only recipes
7409cc8 libotr: Upgrade from 4.0.0 to 4.1.1 and update patches
94e0b68 pidgin: Update from 2.11.0 to 2.12.0
fa174b2 exo: update 0.11.2 -> 0.11.5
85fcfae thunar: update 1.6.11 -> 1.6.12
b4f468d xfce4-terminal: update 0.8.4 -> 0.8.6
52abb54 xfce4-whiskermenu-plugin: update 2.1.2 -> 2.1.3
3343752 xfce4-clipman-plugin: update 1.4.1 -> 1.4.2
5c65bed xfce4-xkb-plugin: update 0.7.1 -> 0.8.0
2fe51b7 xfce4-screenshooter: update 1.8.2 -> 1.9.1
3a03560 kodi: fix build with latest gcc
27c28b4 poppler: update 0.53.0 -> 0.57.0
0a6c066 php7: upgrade to 7.1.7
a0b4384 llvm: Remove
e435561 squid: Add missing dependencies on openssl expat and libxml2
2879a64 mongodb: Upgrade to 3.4.6
6f387c5 python3-twisted: Fix build with clang
3486af5 python-grpcio: Do not hardcode compiler -std options
e555390 collectd: Fix build with clang
0fdf014 fbida: Fix build with libjpeg-turbo
362c622 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
8960831 qwt-qt5.inc: fix QA warning
not included in master yet:=20
6e9892a qtbase: add ptest
d53382f qt5-ptest: fix build with yocto < 2.3 (pyro)
9042969 qtbase: Fix ptests with clang
0b41b62 qtbase: Use sched_yield instead of pthread_yield
17d94b7 quazip: update to 0.7.3 and add missing metadata

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
e3c3aa0 Merge pull request #57 from kraj/kraj/master
not included in master yet:=20
e961581 gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
03f4072 alsa-lib: Remove 0001-ucm-fix-handling-of-config-files-when-file-ty=
pe-is-n.patch
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
1fe2b3b android-system-image-tenderloin: update Android image
not included in master yet:=20
e468a34 meta-shr, meta-fso: remove blacklisted recipes

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWY1k3wAKCRA3VSO3ZXaA
HLINAJ0RxxKevDHsk8m1A7eKeYkKRZQSXgCgqbENAPqzamg5dIQplqiNBwJBTFw=
=7LBq
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
