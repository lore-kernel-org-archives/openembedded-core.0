Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id F3C4E783A0;
	Thu, 31 Aug 2017 08:21:21 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id z187so40787vkd.2;
	Thu, 31 Aug 2017 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=zEEMLhzlQXaQa0kE/K1PfSAEAoTcwllWSpuKgE62y+w=;
	b=F9QF80pI0vhdqIX/G1Cc6UCnForb80KthCMJE7qPIFsVwqEJu4Yl9IAlgA8kZ8uaRH
	h+ZnvSCLTPtpmq4RVuz4bDrYZkuWDtiyB57q5znRjXA9GNRxKBp4cpCYy0YKGs8U4k7+
	rCUJKZ/xypnUXTX23PCtjUr6TCmXf041gw+htjdPOUn7bxD4dM2j5upjX9yMdjbj3q7E
	/pEKaP7a8dBsQeJkEt+SXx/yOuUWZpm4mezAZUrk3bRaQBL19E7Wd/AB+LSeoOEzpvlr
	fbcr3rOnik5jVto+41X/Q+TComYHPMZwui+gBbCCi5+7wvQ2IXA+Ssxv8xqjmiJf0ffA
	QEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=zEEMLhzlQXaQa0kE/K1PfSAEAoTcwllWSpuKgE62y+w=;
	b=Ea3QOBG4UsQyJ5F83MwDio4/yCuBlepb7KTiKlBhE/TWKHdU5XourGxol+CFzSYdoy
	3Ow323M9ZRV4Cx616QrdpG018EAAOpTTgKUqfLQwVEB8265JXIuiHPO/66JenqgMTNSa
	QTvxnr97Q9uWFRa83dSwrfyaNb4/+zHKF/PCVDef90JkgN59vBcz6oiGr+eLE1yj7KHL
	cagfnit+ZVGkgzaxflhvg8RZhDt4ndt0qLx+mOAhxMryvUzJmqB9H3Ymnc/ELPy5hk0j
	zf/H5ZU6zeR9e77VX02bcVmIrrKAwrPAYD93hZvHRASowZLswZbpEkL8rmFCyUV+dihg
	524w==
X-Gm-Message-State: AHYfb5gzk89O59ucL2/bKZk8LLaBcl3MFJknz2ydzbhB7s9lsNbZ/H/V
	lmMxO7cB48Lx9jg55gIKltyMEuIAKwKs
X-Received: by 10.31.176.132 with SMTP id z126mr2427588vke.1.1504167681982;
	Thu, 31 Aug 2017 01:21:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Thu, 31 Aug 2017 01:21:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 31 Aug 2017 10:21:21 +0200
Message-ID: <CA+chaQdHOZRDDsXjFGhtW6t=7+78wna77RFibkhcNL97ZF15cg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-08-30
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
X-List-Received-Date: Thu, 31 Aug 2017 08:21:22 -0000
Content-Type: multipart/alternative; boundary="001a114411b65e07b205580854d0"

--001a114411b65e07b205580854d0
Content-Type: text/plain; charset="UTF-8"

3 unblacklisted recipes are still causing issues, so unblacklist will
be dropped now from master-next (the recipes will stay with
PNBLACKLIST for a bit longer) and removal of other blacklisted recipes
will be merged later today.

 http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!|Signatures		
!!colspan='14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||
|-
||2017-08-30	||5	||5	||4	||1	||0		||0		||1		||0		||0		||6		||0		||0		||0		||0		||0		||0		||1		||0		||
|}

== Failed tasks 2017-08-30 ==

INFO: jenkins-job.sh-1.8.27 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170830_220828.log

=== common (4) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (1) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile

=== qemux86 (1) ===
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (14) ===
{| class=wikitable
|-
|| qemuarm 	|| 5	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170830_095031.log/
|| http://errors.yoctoproject.org/Errors/Build/45986/
|-
|| qemux86 	|| 5	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170830_100910.log/
|| http://errors.yoctoproject.org/Errors/Build/45987/
|-
|| qemux86_64 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170830_124803.log/
|| http://errors.yoctoproject.org/Errors/Build/45999/
|}

=== PNBLACKLISTs (1) ===

=== QA issues (8) ===
{| class=wikitable
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
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||1	||ldflags
|-
||1	||textrel
|-
||6	||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (1) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170830_113943.log/
    * ERROR: 1 issues were found in these recipes: android-tools

    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log

    * ERROR: android-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1504129183/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 issues were found in these recipes: android-tools


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-qt5:
meta-smartphone:
meta-webos-ports:
PNBLACKLIST[android-system] = "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 1	issue: textrel
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 6	issue: version-going-backwards
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard-dbg went backwards which would break package
feeds from (0:0.8.8-r0.54 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard-dev went backwards which would break package
feeds from (0:0.8.8-r0.54 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard-doc went backwards which would break package
feeds from (0:0.8.8-r0.54 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard-locale went backwards which would break package
feeds from (0:0.8.8-r0.54 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard-staticdev went backwards which would break
package feeds from (0:0.8.8-r0.54 to 0:0.8.8-r0.0)
[version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard went backwards which would break package feeds
from (0:0.8.8-r0.54 to 0:0.8.8-r0.0) [version-going-backwards]


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 1	issue: ldflags
system-setup-keyboard-0.8.8: No GNU_HASH in the elf binary:
'/tmp/work/i586-oe-linux/system-setup-keyboard/0.8.8-r0/packages-split/system-setup-keyboard/usr/bin/system-setup-keyboard'
[ldflags]


count: 0	issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
8a60106 main: Attempt to gain bitbake.lock rather than just waiting
not included in master yet:
a064963 world-image: add extra target
3692060 fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
7f10c51 devtool: deploy-target: Support stripped libs and execs
not included in master yet:
2cc5a44 report-error: Allow to upload reports automatically
80ab89e buildhistory.bbclass: metadata-revs show repo parent
7e0797d metadata-revs: provide more information
62e1eb6 qemux86: Add identical qemux86copy variant for tests
63aacc3 reproducible_build.bbclass: initial support for binary reproducibility
f53f75b cpio: provide cpio-replacement-native
8498b82 image_types.bbclass: improve cpio image reproducibility
9feddbc rootfs-postcommands.bbclass: support binary reproducibility
8fdb2c0 insane.bbclass: write QA issues to log file only when they are
in ERROR_QA or WARN_QA

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
108cb03 multipath-tools: RDEPEND on bash
not included in master yet:
843646b dnsmasq: disable the service by default
2aea9a5 rdate: Fix build with hardening
2438250 strongswan: Include stdint.h for uintptr_t
1d3a7f9 netkit-rpc: Fix build with hardening flags
d1cc808 netkit-telnet: Fix build with hardening
5474882 ncftp: Upgrade to 3.2.6
c8220c5 autofs: Add build dependency on libnsl2
7679672 openhpi: Fix build on 64bit platforms e.g. aarch64
654bc63 security_flags.inc: Delete
f586080 pptp-linux: Upgrade to 1.9.0
650f0c2 ebtables: replace ebtables-save perl script with bash rewrite
9b13c65 pimd: Upgrade to 2.3.2
10e1f1f igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
efaadc9 rdate: Define logwtmp if libc != glibc
cc4b8d1 netkit-ftp: Include sys/types.h for u_long definition
b31171e postfix: Disable nis support on musl
c915f6c zeroconf: Fix build with musl
c8ae4cf netperf: change SRC_URI to git repository
84ce83c ippool: Fix build errors found with hardening flags
24cce58 openflow: Fix build with musl
58e1b96 xl2tpd: Update to 1.3.9
ff0eb68 c-ares: update 1.12.0 -> 1.13.0
424bda9 radvd: 2.14 -> 2.17
6494731 libesmtp: Fix config.h define for snprintf detection
837527a drbd: Add recipe
6fea93a net-snmp: fix engineBoots value on SIGHUP
6235917 openl2tp: add LGPL-2.1 license
ab0fe69 openl2tp: add init script and systemd support
a3ed366 ntop: add new recipe
c9c7003 libtdb: update 1.3.12 -> 1.3.14
1d8a16f ndisc6: Upgrade to 1.0.3
271d1b0 memcached: Update to 1.5.0
4123047 tcpdump: remove unnecessary patch
855d715 squid: Add missing dependencies on openssl expat and libxml2
e15d43e postfix: Upgrade to 3.2.2
2ab6500 freeradius: Upgrade to 3.0.15
c217dd7 tcpdump: update to 4.9.1 to fix CVE-2017-11108
72e0fed wireshark: 2.2.7 -> 2.2.8
832605e mariadb: 5.5.55 -> 5.5.57
b74641a mariadb: disable thumb on armv4 and armv5
9702080 krb5: fix CVE-2017-11368
253ffcc terminus-font: fix RSS breakage and unblacklist
7564354 system-setup-keyboard: unblacklist recipe
e43ee1f smbnetfs: unblacklist recipe
d84a58c iproute2: Move append to meta-networking layer
172a045 quagga: update to 1.2.1
9442f34 efivar: Upgrade to 0.31
6a5f7fc openvpn: 2.4.2 -> 2.4.3
902e15b ipsec-tools: fix CVE-2016-10396
71728ce netcf: upgrade to latest 0.2.8
52a0128 tftp-hpa: add systemd unit files
c01dafc openconnect: fix parallel compilation failure
a65f468 gnome-keyring: Fix compatibility with gcr 3 in oe-core
ea53458 openconnect: upgrade to 7.08
d5e1e54 imagemagick: 7.0.5 -> 7.0.6_9
52bd979 ndisc6: specify target location of perl
53ab133 wireguard-tools: Add bash to rdeps
f2d7761 openl2tp: Add bash to rdeps
eaa2828 efibootmgr: Upgrade to 0.15
b4eeeb8 efivar: Fix build with clang
5f2d327 squid: Disable format-truncation warning only with gcc
6b99862 squid: Fix QA errors about wrong perl interpreter
cd06d4b wireguard: Upgrade to 20170810 snapshot
81ea8e2 ippool: Fix build errors found by clang
8e12120 iscsitarget: Fix kernel with new 4.12+ kernel
1eaa8b2 vboxguestdrivers: Upgrade to 5.1.26
3835819 glmark2: Fix build with clang
3d6ccf4 gedit: Fix with with hardening flags and clang
331d66d openipmi: Upgrade to 2.0.24
8c744b0 libbonoboui: Fix with with hardening and clang
9c1c8cc postfix: Fix build with security flags and clang
07bdc0e irssi: Upgrade to 1.0.4
0903573 nodejs: Upgrade to 8.4.0
22452f3 glade: Fix format string warnings with clang
80e41db openhpi: Fix build with clang+c++11
354d8fe python-subprocess32: add recipe for v3.2.7
2f0a11e libmodule-build-perl: upgrade to v0.4224
dd966a2 openhpi: Fix ptest compile failures due to narrowing warnings with clang
a605b4e libreport: 2.9.1 -> 2.9.2
95786a4 openipmi: Fix build with clang+hardening
aeb6ea2 python-m2crypto: Upgrade to 0.26.0
5302e28 tcpreplay: upgrade to 4.2.6
f03c1c1 tftp-hpa: Fix PIE build with clang
de12eab samba: 4.6.5 -> 4.6.7
10c89d9 corosync: fixes for sysvinit and systemd
da81735 corosync: add support for extra features
fcb988b python-aws-iot-device-sdk-python: Add recipe for version 1.1.2
a54fa54 opencv: fix CVEs
f50c5e2 udisk: fix dependency about libdevmapper
500a29b wolfssl: upgrade to 3.12.0
2f37057 recipes: remove blacklisted recipes
626331f meta-ruby: remove this now pretty empty layer
7878dd9 meta-efl: remove this now pretty empty layer
4952c90 meta-systemd: remove this now pretty empty layer
8c9109b meta-gpe: remove this now pretty empty layer

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
648f7b0 qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation,
qtwayland: disable gold to work around binutils bug
not included in master yet:
969f1f8 Upgrade to Qt 5.9.0
a0b2220 qtwebengine: add a fix for building demobrowser without printing support
2d14d99 qt: refresh remaining patches and add links to meta-qt5 repos
9c7507e qt: upgrade to latest revision in 5.9 branch
b7ae79a qtwebengine: fix build with glibc-2.26
c4c70e7 qtwebengine: update 0004-Force-host-toolchain-configuration.patch
2684299 qtwebengine: add patch for long paths

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe

--001a114411b65e07b205580854d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bo=
ttom:0px;color:rgb(51,51,51);font-size:14px">3 unblacklisted recipes are st=
ill causing issues, so unblacklist will be dropped now from master-next (th=
e recipes will stay with PNBLACKLIST for a bit longer) and removal of other=
 blacklisted recipes will be merged later today.</pre><pre class=3D"gmail-c=
onsole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wra=
p:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size=
:14px"> </pre><pre class=3D"gmail-console-output" style=3D"box-sizing:borde=
r-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-botto=
m:0px;color:rgb(51,51,51);font-size:14px"><a href=3D"http://www.openembedde=
d.org/wiki/Bitbake_World_Status" style=3D"box-sizing:border-box;word-wrap:b=
reak-word;color:rgb(92,53,102)">http://www.openembedded.org/wiki/Bitbake_Wo=
rld_Status</a>

=3D=3D Number of issues - stats =3D=3D
{| class=3D&#39;wikitable&#39;
!|Date		     !!colspan=3D&#39;3&#39;|Failed tasks			    !!|Signatures		  !!=
colspan=3D&#39;14&#39;|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||=09
|-
||2017-08-30	||5	||5	||4	||1	||0		||0		||1		||0		||0		||6		||0		||0		||0		|=
|0		||0		||0		||1		||0		||=09
|}

=3D=3D Failed tasks 2017-08-30 =3D=3D

INFO: jenkins-job.sh-1.8.27 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170830_220828.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170830_220=
828.log</a>

=3D=3D=3D common (4) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbne=
tfs_git.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyrin=
g_2.32.1.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-matplotl=
ib_1.1.0.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_c=
ompile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (14) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 5	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170830_095031.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170830_095031.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/45986/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/45986/</a>
|-
|| qemux86 	|| 5	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170830_100910.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170830_100910.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/45987/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/45987/</a>
|-
|| qemux86_64 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170830_124803.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170830_124803.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/45999/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/45999/</a>
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (8) =3D=3D=3D
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
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||1	||ldflags
|-
||1	||textrel
|-
||6	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (1) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170830_113943.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170830_113943.log/</a>
    * ERROR: 1 issues were found in these recipes: android-tools

    * ERROR: 1 errors found in signatures.qemux86.do_package_write_ipk.sigd=
ata.log

    * ERROR: android-tools different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1504129183/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 issues were found in these recipes: android-tools


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)}&quot;
meta-qt5:
meta-smartphone:
meta-webos-ports:
PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtualiazat=
ion which isn&#39;t included in my world builds&quot;
PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[tearsofsteel-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[build-appliance-image] =3D &quot;tries to include whole downloa=
ds directory in /home/builder/poky :/&quot;


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 1	issue: textrel
corosync-2.4.2: ELF binary &#39;/tmp/work/core2-64-oe-linux/corosync/2.4.2-=
r0/packages-split/corosync/usr/sbin/corosync&#39; has relocations in .text =
[textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 6	issue: version-going-backwards
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard-dbg went backwards which would break package feeds from (0:0.8.8-r0.54 =
to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard-dev went backwards which would break package feeds from (0:0.8.8-r0.54 =
to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard-doc went backwards which would break package feeds from (0:0.8.8-r0.54 =
to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard-locale went backwards which would break package feeds from (0:0.8.8-r0.=
54 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard-staticdev went backwards which would break package feeds from (0:0.8.8-=
r0.54 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard went backwards which would break package feeds from (0:0.8.8-r0.54 to 0=
:0.8.8-r0.0) [version-going-backwards]


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 1	issue: ldflags
system-setup-keyboard-0.8.8: No GNU_HASH in the elf binary: &#39;/tmp/work/=
i586-oe-linux/system-setup-keyboard/0.8.8-r0/packages-split/system-setup-ke=
yboard/usr/bin/system-setup-keyboard&#39; [ldflags]


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
8a60106 main: Attempt to gain bitbake.lock rather than just waiting
not included in master yet:=20
a064963 world-image: add extra target
3692060 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
7f10c51 devtool: deploy-target: Support stripped libs and execs
not included in master yet:=20
2cc5a44 report-error: Allow to upload reports automatically
80ab89e buildhistory.bbclass: metadata-revs show repo parent
7e0797d metadata-revs: provide more information
62e1eb6 qemux86: Add identical qemux86copy variant for tests
63aacc3 reproducible_build.bbclass: initial support for binary reproducibil=
ity
f53f75b cpio: provide cpio-replacement-native
8498b82 image_types.bbclass: improve cpio image reproducibility
9feddbc rootfs-postcommands.bbclass: support binary reproducibility
8fdb2c0 insane.bbclass: write QA issues to log file only when they are in E=
RROR_QA or WARN_QA

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
108cb03 multipath-tools: RDEPEND on bash
not included in master yet:=20
843646b dnsmasq: disable the service by default
2aea9a5 rdate: Fix build with hardening
2438250 strongswan: Include stdint.h for uintptr_t
1d3a7f9 netkit-rpc: Fix build with hardening flags
d1cc808 netkit-telnet: Fix build with hardening
5474882 ncftp: Upgrade to 3.2.6
c8220c5 autofs: Add build dependency on libnsl2
7679672 openhpi: Fix build on 64bit platforms e.g. aarch64
654bc63 security_flags.inc: Delete
f586080 pptp-linux: Upgrade to 1.9.0
650f0c2 ebtables: replace ebtables-save perl script with bash rewrite
9b13c65 pimd: Upgrade to 2.3.2
10e1f1f igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
efaadc9 rdate: Define logwtmp if libc !=3D glibc
cc4b8d1 netkit-ftp: Include sys/types.h for u_long definition
b31171e postfix: Disable nis support on musl
c915f6c zeroconf: Fix build with musl
c8ae4cf netperf: change SRC_URI to git repository
84ce83c ippool: Fix build errors found with hardening flags
24cce58 openflow: Fix build with musl
58e1b96 xl2tpd: Update to 1.3.9
ff0eb68 c-ares: update 1.12.0 -&gt; 1.13.0
424bda9 radvd: 2.14 -&gt; 2.17
6494731 libesmtp: Fix config.h define for snprintf detection
837527a drbd: Add recipe
6fea93a net-snmp: fix engineBoots value on SIGHUP
6235917 openl2tp: add LGPL-2.1 license
ab0fe69 openl2tp: add init script and systemd support
a3ed366 ntop: add new recipe
c9c7003 libtdb: update 1.3.12 -&gt; 1.3.14
1d8a16f ndisc6: Upgrade to 1.0.3
271d1b0 memcached: Update to 1.5.0
4123047 tcpdump: remove unnecessary patch
855d715 squid: Add missing dependencies on openssl expat and libxml2
e15d43e postfix: Upgrade to 3.2.2
2ab6500 freeradius: Upgrade to 3.0.15
c217dd7 tcpdump: update to 4.9.1 to fix CVE-2017-11108
72e0fed wireshark: 2.2.7 -&gt; 2.2.8
832605e mariadb: 5.5.55 -&gt; 5.5.57
b74641a mariadb: disable thumb on armv4 and armv5
9702080 krb5: fix CVE-2017-11368
253ffcc terminus-font: fix RSS breakage and unblacklist
7564354 system-setup-keyboard: unblacklist recipe
e43ee1f smbnetfs: unblacklist recipe
d84a58c iproute2: Move append to meta-networking layer
172a045 quagga: update to 1.2.1
9442f34 efivar: Upgrade to 0.31
6a5f7fc openvpn: 2.4.2 -&gt; 2.4.3
902e15b ipsec-tools: fix CVE-2016-10396
71728ce netcf: upgrade to latest 0.2.8
52a0128 tftp-hpa: add systemd unit files
c01dafc openconnect: fix parallel compilation failure
a65f468 gnome-keyring: Fix compatibility with gcr 3 in oe-core
ea53458 openconnect: upgrade to 7.08
d5e1e54 imagemagick: 7.0.5 -&gt; 7.0.6_9
52bd979 ndisc6: specify target location of perl
53ab133 wireguard-tools: Add bash to rdeps
f2d7761 openl2tp: Add bash to rdeps
eaa2828 efibootmgr: Upgrade to 0.15
b4eeeb8 efivar: Fix build with clang
5f2d327 squid: Disable format-truncation warning only with gcc
6b99862 squid: Fix QA errors about wrong perl interpreter
cd06d4b wireguard: Upgrade to 20170810 snapshot
81ea8e2 ippool: Fix build errors found by clang
8e12120 iscsitarget: Fix kernel with new 4.12+ kernel
1eaa8b2 vboxguestdrivers: Upgrade to 5.1.26
3835819 glmark2: Fix build with clang
3d6ccf4 gedit: Fix with with hardening flags and clang
331d66d openipmi: Upgrade to 2.0.24
8c744b0 libbonoboui: Fix with with hardening and clang
9c1c8cc postfix: Fix build with security flags and clang
07bdc0e irssi: Upgrade to 1.0.4
0903573 nodejs: Upgrade to 8.4.0
22452f3 glade: Fix format string warnings with clang
80e41db openhpi: Fix build with clang+c++11
354d8fe python-subprocess32: add recipe for v3.2.7
2f0a11e libmodule-build-perl: upgrade to v0.4224
dd966a2 openhpi: Fix ptest compile failures due to narrowing warnings with =
clang
a605b4e libreport: 2.9.1 -&gt; 2.9.2
95786a4 openipmi: Fix build with clang+hardening
aeb6ea2 python-m2crypto: Upgrade to 0.26.0
5302e28 tcpreplay: upgrade to 4.2.6
f03c1c1 tftp-hpa: Fix PIE build with clang
de12eab samba: 4.6.5 -&gt; 4.6.7
10c89d9 corosync: fixes for sysvinit and systemd
da81735 corosync: add support for extra features
fcb988b python-aws-iot-device-sdk-python: Add recipe for version 1.1.2
a54fa54 opencv: fix CVEs
f50c5e2 udisk: fix dependency about libdevmapper
500a29b wolfssl: upgrade to 3.12.0
2f37057 recipes: remove blacklisted recipes
626331f meta-ruby: remove this now pretty empty layer
7878dd9 meta-efl: remove this now pretty empty layer
4952c90 meta-systemd: remove this now pretty empty layer
8c9109b meta-gpe: remove this now pretty empty layer

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
648f7b0 qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation, qtwa=
yland: disable gold to work around binutils bug
not included in master yet:=20
969f1f8 Upgrade to Qt 5.9.0
a0b2220 qtwebengine: add a fix for building demobrowser without printing su=
pport
2d14d99 qt: refresh remaining patches and add links to meta-qt5 repos
9c7507e qt: upgrade to latest revision in 5.9 branch
b7ae79a qtwebengine: fix build with glibc-2.26
c4c70e7 qtwebengine: update 0004-Force-host-toolchain-configuration.patch
2684299 qtwebengine: add patch for long paths

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:=20
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe
</pre><div><br></div></div>

--001a114411b65e07b205580854d0--
