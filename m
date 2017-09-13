Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD22781FF;
	Wed, 13 Sep 2017 09:39:38 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id a43so27571252wrc.0;
	Wed, 13 Sep 2017 02:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=FLSg41ABnpZdJ+WGiHmsmfWEDWomf9u/CfkfZll5hps=;
	b=ckaTS0IEfORr0u6YBszePCH+4dsPUJGFtVBaxmRb9TPrtNUn8l1L4gtYNUF7EOg69e
	nGYgDe+UyTqH4Lo7GdPoqPJFiw8Wzz6bonjmHXV+ujevjq4zYuHe9flxSfm0UHEhc/OE
	1CsUJ12NWXWxsdDXiTAxw1vpQNkMNoYDiopmNccKo4mRPhzRUE/5GBl8J6EqBZSyr9IY
	9//B3kEtnvdWlM/0jTxkbGI53+UgKb4VjUZ1NYLebcEqdIa1uTiK95FM3gknFV8p+1ht
	1ySqG8d3wVYXMSp9odMEaSdw8va2yjkPo6Nn0WYeWMfBlG/jR6MrRKvLXFDul1jk1tKq
	pcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=FLSg41ABnpZdJ+WGiHmsmfWEDWomf9u/CfkfZll5hps=;
	b=Uqcer/Jq2dkkA9i/ssyHDWeMFH2FfEsizhGN+YdoYpZXA3ymOtTIZIs10YwCHXDFtE
	i9nfXkk7eYyFMQRlw++fsBDxv9mjRFeIPW1siqTy0URu4+pdLB9NitkSBeTu7EHr1r4K
	QaZj8HMnH8o5RPVEPwKDFHVtzcRI55okKFB9edfYp4ZF19WGCrLIO8P82g+J5IcsdyX3
	iQn3PhLFCd9pTMLiQlXmben/kgikxwaSVZ7PrtT+agOrnrzvs7o5KRtKB63N8coyMBlQ
	NAciU9oNqTVtpK3sB78FbZob6z7kiUFw1ZQU6N0YwgSwwMqvI5XkNV35hbxfkaHdzNPK
	xnag==
X-Gm-Message-State: AHPjjUjRqqWx96GFFXjcpChb9dHLz1QWUFcKYLB6JuZh65u9bandcVnT
	J98Ni/sJhXTyvf+d
X-Google-Smtp-Source: ADKCNb5V1HsiHVWIU/SqxDzb24Z1J30B0Beo+1W0gEoJX85rXLGOm0kMW4dfirM6v5kCOg8uPQwYcQ==
X-Received: by 10.223.165.73 with SMTP id j9mr14856245wrb.62.1505295579319;
	Wed, 13 Sep 2017 02:39:39 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r15sm7612561wrc.30.2017.09.13.02.39.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 02:39:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Sep 2017 11:41:56 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170913094156.GA3288@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.9.0 (2017-09-02)
Subject: State of bitbake world, Failed tasks 2017-09-11
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
X-List-Received-Date: Wed, 13 Sep 2017 09:39:40 -0000
X-Groupsio-MsgNum: 102817
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

qemux86 shows a bit more failures, because it's built from slightly
older metadata (I've removed some pending changes from master-next after
that build).

Also big chunk of meta-networking changes was finally merged, so the list
of tested changes in next report should be significantly shorter again. Tha=
nks Joe.

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
||2017-09-11	||5	||4	||5	||0	||0		||0		||1		||0		||0		||7		||4		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-09-11 =3D=3D

INFO: jenkins-job.sh-1.8.28 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170912_224314.log

=3D=3D=3D common (2) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19=
=2E21.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-kli=
bc_2.0.2.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile
    * openembedded-core/meta/recipes-devtools/go/go-dep_0.3.0.bb:do_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.=
bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.=
3.bb:do_compile

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc=
_1.5.1.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-kli=
bc_2.0.2.bb:do_configure
    * virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/=
kexecboot_git.bb:do_configure

=3D=3D=3D Number of failed tasks (14) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170911_072424.log/ || http://errors.yoctoproject.org/Err=
ors/Build/46584/
|-
|| qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170911_024629.log/ || http://errors.yoctoproject.org/Err=
ors/Build/46420/
|-
|| qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170911_074423.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/46588/
|}

=3D=3D=3D PNBLACKLISTs (4) =3D=3D=3D

=3D=3D=3D QA issues (12) =3D=3D=3D
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
||1	||textrel
|-
||4	||host-user-contaminated
|-
||7	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170911_063504.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[s=
mbnetfs] ?=3D "Fails to build with RSS http://errors.yoctoproject.org/Error=
s/Details/132827/ - the recipe will be removed on 2017-09-01 unless the iss=
ue is fixed"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.b=
b:PNBLACKLIST[system-setup-keyboard] ?=3D "Depends on blacklisted system-co=
nfig-keyboard-native - the recipe will be removed on 2017-09-01 unless the =
issue is fixed"
meta-qt5:
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


count: 1	issue: textrel
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 7	issue: version-going-backwards
protobuf-3.3.0+gitAUTOINC+a6189acd18: Package version for package protobuf-=
compiler went backwards which would break package feeds from (0:3.4.0+git0+=
80a37e0782-r0.0 to 0:3.3.0+git0+a6189acd18-r0.3) [version-going-backwards]
protobuf-3.3.0+gitAUTOINC+a6189acd18: Package version for package protobuf-=
dbg went backwards which would break package feeds from (0:3.4.0+git0+80a37=
e0782-r0.0 to 0:3.3.0+git0+a6189acd18-r0.3) [version-going-backwards]
protobuf-3.3.0+gitAUTOINC+a6189acd18: Package version for package protobuf-=
dev went backwards which would break package feeds from (0:3.4.0+git0+80a37=
e0782-r0.0 to 0:3.3.0+git0+a6189acd18-r0.3) [version-going-backwards]
protobuf-3.3.0+gitAUTOINC+a6189acd18: Package version for package protobuf-=
doc went backwards which would break package feeds from (0:3.4.0+git0+80a37=
e0782-r0.0 to 0:3.3.0+git0+a6189acd18-r0.3) [version-going-backwards]
protobuf-3.3.0+gitAUTOINC+a6189acd18: Package version for package protobuf-=
locale went backwards which would break package feeds from (0:3.4.0+git0+80=
a37e0782-r0.0 to 0:3.3.0+git0+a6189acd18-r0.3) [version-going-backwards]
protobuf-3.3.0+gitAUTOINC+a6189acd18: Package version for package protobuf-=
staticdev went backwards which would break package feeds from (0:3.4.0+git0=
+80a37e0782-r0.0 to 0:3.3.0+git0+a6189acd18-r0.3) [version-going-backwards]
protobuf-3.3.0+gitAUTOINC+a6189acd18: Package version for package protobuf =
went backwards which would break package feeds from (0:3.4.0+git0+80a37e078=
2-r0.0 to 0:3.3.0+git0+a6189acd18-r0.3) [version-going-backwards]


count: 4	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-be-by+latin/usr/l=
ib/locale/be_BY@latin/LC_PAPER is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
qt3d-5.9.2+gitAUTOINC+9d8c9ada16: qt3d: /qt3d-mkspecs/usr/lib/qt5/mkspecs/m=
odules/qt_lib_3dextras_private.pri is owned by uid 3004, which is the same =
as the user running bitbake. This may be due to host contamination [host-us=
er-contaminated]
qtbase-5.9.2+gitAUTOINC+73573fce29: qtbase: /qtbase-mkspecs/usr/lib/qt5/mks=
pecs/modules/qt_lib_platformcompositor_support_private.pri is owned by uid =
3004, which is the same as the user running bitbake. This may be due to hos=
t contamination [host-user-contaminated]
qtlocation-5.9.2+gitAUTOINC+c832af7897_9ecbe3642f: qtlocation: /qtlocation-=
plugins/usr/lib/qt5/plugins/geoservices/libqtgeoservices_mapbox.so is owned=
 by uid 3004, which is the same as the user running bitbake. This may be du=
e to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
ed3aab9 toaster: update pyro to rocko as stable release
not included in master yet:=20
fd1ac02 world-image: add extra target
3a96564 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
2ebbeb6 staging: gracefully abort if two recipes conflict in the sysroot
not included in master yet:=20
c798d16 bitbake.conf: add bzr to HOSTTOOLS_NONFATAL
ddaa035 glibc-locale: add runtime dependency on glibc
fae04b1 report-error: Allow to upload reports automatically
b580263 buildhistory.bbclass: metadata-revs show repo parent
b5d013f metadata-revs: provide more information
96645c6 qemux86: Add identical qemux86copy variant for tests
8b78730 reproducible_build.bbclass: initial support for binary reproducibil=
ity
da6d951 cpio: provide cpio-replacement-native
726b8f2 image_types.bbclass: improve cpio image reproducibility
8736716 rootfs-postcommands.bbclass: support binary reproducibility
4d21e08 sstate.bbclass: Do not cause build failures due to setscene errors

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
d9f7ef4 krb5: fix CVE-2017-11368
not included in master yet:=20
bfa8ace dnsmasq: disable the service by default
8079582 rdate: Fix build with hardening
f4cde9b strongswan: Include stdint.h for uintptr_t
a66e02e netkit-rpc: Fix build with hardening flags
060a60b netkit-telnet: Fix build with hardening
174faea ncftp: Upgrade to 3.2.6
45fb804 autofs: Add build dependency on libnsl2
7f1b69c openhpi: Fix build on 64bit platforms e.g. aarch64
8323bd2 security_flags.inc: Delete
efa8f67 pptp-linux: Upgrade to 1.9.0
7450d1d ebtables: replace ebtables-save perl script with bash rewrite
72b59c9 pimd: Upgrade to 2.3.2
137b606 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
2b5abad rdate: Define logwtmp if libc !=3D glibc
0e877ef netkit-ftp: Include sys/types.h for u_long definition
8cd3cc1 postfix: Disable nis support on musl
a7de309 zeroconf: Fix build with musl
e88b2c2 ippool: Fix build errors found with hardening flags
b74da53 openflow: Fix build with musl
d194658 xl2tpd: Update to 1.3.9
eb9979f c-ares: update 1.12.0 -> 1.13.0
38dbcc7 radvd: 2.14 -> 2.17
ba34c7b libesmtp: Fix config.h define for snprintf detection
a171974 drbd: Add recipe
ad67458 net-snmp: fix engineBoots value on SIGHUP
1351f14 openl2tp: add LGPL-2.1 license
4286f9f openl2tp: add init script and systemd support
e572bc1 ntop: add new recipe
b595282 libtdb: update 1.3.12 -> 1.3.14
40e221b ndisc6: Upgrade to 1.0.3
33e545f memcached: Update to 1.5.0
c0d8fff tcpdump: remove unnecessary patch
c65f66c squid: Add missing dependencies on openssl expat and libxml2
d73293f postfix: Upgrade to 3.2.2
f98d9eb freeradius: Upgrade to 3.0.15
5d0968d tcpdump: update to 4.9.1 to fix CVE-2017-11108
e6ca81e wireshark: 2.2.7 -> 2.2.8
e29bd7b quagga: update to 1.2.1
63566ee openvpn: 2.4.2 -> 2.4.3
af1c3fc ipsec-tools: fix CVE-2016-10396
537b141 netcf: upgrade to latest 0.2.8
45c4ca2 tftp-hpa: add systemd unit files
0625fca openconnect: fix parallel compilation failure
ae0de72 openconnect: upgrade to 7.08
ab289ae ndisc6: specify target location of perl
c7e20c7 wireguard-tools: Add bash to rdeps
ebbe38a openl2tp: Add bash to rdeps
9cedd45 squid: Disable format-truncation warning only with gcc
cfe6897 squid: Fix QA errors about wrong perl interpreter
9116674 wireguard: Upgrade to 20170810 snapshot
b4c93ff ippool: Fix build errors found by clang
da7106e iscsitarget: Fix kernel with new 4.12+ kernel
aacdca5 postfix: Fix build with security flags and clang
345a1b2 openhpi: Fix build with clang+c++11
7b2059f openhpi: Fix ptest compile failures due to narrowing warnings with =
clang
2747753 tcpreplay: upgrade to 4.2.6
67d591f tftp-hpa: Fix PIE build with clang
ab59d1a samba: 4.6.5 -> 4.6.7
4c6b4d4 wolfssl: upgrade to 3.12.0
02fca91 netperf: upgrade to 2.7.0+ with git version
86bb959 ntop: Fix build with musl
1e874bb netkit-rwho: Fix build with musl
9574ccb netkit-tftp: Fix build with musl
dc7f5c9 drbd-utils: only rmmod if DRBD is a module
078d888 vpnc: Reduce lifetime value to widely-compatible value
d84f754 wireshark: update to 2.2.9
c1e0482 tftp-hpa: Add HOMEPAGE info into recipe file.
e74b007 cyrus-sasl: Add HOMEPAGE info into recipe file.
27a4257 netkit-rpc: Link libtirpc on musl
ede8475 openipmi: Move to meta-networking requires net-snmp
24fac23 glmark2: Set required distro features to opengl
ed1693c openlmi-tools: Only build if the necessary python pieces are availa=
ble
8ae0a35 xorg-drivers: Add opengl distro flag requirement to ati and nouveau
66c4927 boinc-client: Add distro flag, requires opengl
8c56daf networkmanager-openvpn: requires openvpn from meta-networking
796346d telepathy-python: Move to meta-python, requires python-dbus
6c15141 networkmanager: Move to meta-networking, requires dnsmasq
16eae99 python-ldap: Move to meta-networking, requires cyrus-sasl
524cef0 python-networkmanager: Move to networking, requires networkmanager
0ffdc42 corosync: Requires net-snmp from meta-networking
cc63c0d pywbem: Requires python-m2crypto-native (and others) from meta-pyth=
on
580d402 dlm: requires corosync, from meta-networking
dd5884e open-vm-tools: only build if meta-networking and meta-filesystems i=
s available
6baab86 miniupnpd: Move to meta-networking, requires libnetfilter-conntrack
b056fbc enable_gnome.conf: Move the AVAHI_GTK setting
3345b65 glade3: Move PACKAGECONFIG setting to enable_gnome.conf
0918940 libart-lgpg: Obsolete, replaced by version in oe-core
89befc7 pinpoint: Add dependency on opengl for cogl
5f5d62c vim: Remove xfce vim bbappend
b529f55 layer.conf: Add meta-networking for the networkmanager
23ecc23 meta-xfce: depend on meta-multimedia
ef9f84d mpv: Requires ffmpeg which has a LICENSE_FLAGS =3D commercial set
c210fa0 recipes-multimedia: Add LICENSE_FLAGS
7847af3 recipes-multimedia: Add LICENSE_FLAGS
85731dd libmtp: remove 'mtp-tools' from PACKAGES
5c418d8 florence: update 0.6.3
776a331 evince: Remove X dependency
801dcd3 core-image-minimal-xfce: inherit distro_features_check
ae77c08 vsftpd: link with wrap when tcp-wrappers configured
994aa45 aufs-util: Use cross strip tool
dc7969b leveldb: Fix build with clang
0e76efc pm-qa: Upgrade to 0.5.2
8f6d310 ndisc6: Fix build with clang and update to latest on git
2b86359 vlan: Add HOMEPAGE info into recipe file.
dc8b62c leptonica: Upgrade to 1.74.4
da5c847 tesseract: Upgrade to 3.05.01
5760862 umip: Update SRC_URI to github
a6cc3fe dovecot: Add HOMEPAGE info into recipe file.
257bc9d dracut: Add HOMEPAGE info into recipe file.
36ecbf9 fetchmail: Add HOMEPAGE info into recipe file.
57ec8c8 sblim-sfcc: Fix build with musl
fc9971a autofs: Fix build with musl
99e9b26 thrift: build lib for native and nativesdk
57919d5 efivar: fix build when host gcc version is < 4.9
8bb2d03 gerbera: Add recipe
46f53dd yp-tools: Upgrade to 4.2.2
45b61cb xfsprogs: Upgrade to 4.12.0
284287e minicoredumper: Switch src_uri to upstream lf git
4aa88d7 fluentbit: Upgrade to 0.12.1
b347b38 klibc: Fix include_next stdarg.h with clang
8292891 python-cffi: Add HOMEPAGE info into recipe file.
24b7008 python-cryptography: Add HOMEPAGE info into recipe file.
067ff16 python-cryptography-vectors: Add HOMEPAGE info into recipe file.
95b4f3b python-enum34: Add HOMEPAGE info into recipe file.
f17009b python-iso8601: Add HOMEPAGE info into recipe file.
98af994 python-pip: Add HOMEPAGE info into recipe file.
7554a22 python-pretend: Add HOMEPAGE info into recipe file.
61c7e0a python-py: Add HOMEPAGE info into recipe file.
309195d python-pycparser: Add HOMEPAGE info into recipe file.
017c1f6 python-pygobject: Add HOMEPAGE info into recipe file.
53dcc33 python-pyopenssl: Add HOMEPAGE info into recipe file.
55a5721 python-six: Add HOMEPAGE info into recipe file.
3f89319 python-pytest: Add HOMEPAGE info into recipe file.
6215f77 ell: upgrade SRCREV
de7f4cb libupnp: Bump to version 1.8.2
e6beb1b klibc: Edit out gcc hardcoding in do_compile
8f9bfca xfsdump: Upgrade to 3.1.7
be4fd7c opencv: Fix build with clang
f318f51 klibc.bbclass: Use forcevariable override to define flags
51fb92e klibc.bbclass: Add -mfloat-abi on arm

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
be3c2d3 qtbase-native: set path to mkspec for cmake properly again
not included in master yet:=20
743b3b9 qtbase-native: Force use of built-in pcre

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet:=20

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWbj9ZAAKCRA3VSO3ZXaA
HP5/AKCHJX8QUlwdLdTWmhIkIHG7RAaj+wCgiPBNs3ahrYF0gmVBiEZobEPjPHo=
=pHMS
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
