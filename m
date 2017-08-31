Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id B8A7B7840C;
	Thu, 31 Aug 2017 13:34:38 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id j46so1938011uag.5;
	Thu, 31 Aug 2017 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=avOaZ8iNRfLjemdgQ8ED25BscKvY6fkKSntszAwoGYs=;
	b=j/C1dRnpq3Tzv1fK+Q3ycqlrm19xoK3cCyg2KngyWAELWj5Bdv6xTFk06P6qG87DqO
	nIW5XQN7PnZVKqDGKEMwbGs9HcC/KgaPGaXD8+VTTjTdmpNpj3VxI3nlVplTpCyFmtMz
	kD4pJdLXVnNkc8+dDaAkJHn9WvPoFvo8A3mLRZyEooh25Y6dygSAytwzOtIEAUy+6n1a
	piNhwtxSBbRCqU8ds6Y8z6ryIJrlJcHxgnLGRlyZOAAGRC6cr0ryyRRXZNtVNL31hi97
	BFy1EIvDRJpKvoQ3KSU6Jumc2fhGX57Gqt/wpWaRdySP6Skz/Wx2kH4T5AlrVveGHEGE
	ZIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=avOaZ8iNRfLjemdgQ8ED25BscKvY6fkKSntszAwoGYs=;
	b=n2z2BLV+4y4VnbmahRGiE4kpIBIeyPpS2+dnv5I8n+/afynIvXaLQ+jlHAfkElpeYo
	3eu1+cuhYR+rMPLaBsxqDCixDy0/wkCDCbDKimHkNTx7wtYTGnE10UmVG5J89GcSo2jN
	DC2NrMPWhzX62QTxoy6Kvx/ZufOWuH/IA5Oga2NyIGQIk6SoOFvEndEqkIKXcbE76RFl
	6N5g9jW5W0oAZHN8OgXf1b0sOQoZ3WmiXBcspI8+/XsH/C+XWOu8G07l5j+yquIeJiZg
	4/iIo235BzsBho4SMCIvkd76aTTNr8/MC6GO0Ljc7dyT8WjNw2LDOEiwG8uhaJ1P7KER
	LZvA==
X-Gm-Message-State: AHPjjUjlkFM82LmpYb3oHEe3JcJO64x5LIvaL8hrwrX4W1RA5rgyFrWw
	6FztUDwLJmZwIjJVZElDX79Q0Ty3NsKJ
X-Google-Smtp-Source: ADKCNb4GT4PvEfBbEANxLavqTMhqxU/sRtLJUk8AO2WUoBbFieXH58DA0iG4pVjgfM5s/Mns45WOGvixvonvF5XW4EY=
X-Received: by 10.176.26.24 with SMTP id a24mr3459658uai.102.1504186479011;
	Thu, 31 Aug 2017 06:34:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Thu, 31 Aug 2017 06:34:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 31 Aug 2017 15:34:38 +0200
Message-ID: <CA+chaQdpE2iGDTMQ0kjf29PkvW3W+r7RgYYpnxaaEpUvst3-Vg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-08-31
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
X-List-Received-Date: Thu, 31 Aug 2017 13:34:39 -0000
Content-Type: multipart/alternative; boundary="f40304366528c1f8ad05580cb4a4"

--f40304366528c1f8ad05580cb4a4
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!|Signatures		
!!colspan='14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||
|-
||2017-08-31	||3	||3	||2	||1	||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-08-31 ==

INFO: jenkins-job.sh-1.8.28 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170831_030012.log

=== common (2) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (1) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile

=== qemux86 (1) ===
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (8) ===
{| class=wikitable
|-
|| qemuarm 	|| 3	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170830_222153.log/
|| http://errors.yoctoproject.org/Errors/Build/46017/
|-
|| qemux86 	|| 3	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170830_222153.log/
|| http://errors.yoctoproject.org/Errors/Build/46018/
|-
|| qemux86_64 	|| 2	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170831_001942.log/
|| http://errors.yoctoproject.org/Errors/Build/46019/
|}

=== PNBLACKLISTs (4) ===

=== QA issues (0) ===
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
||0	||ldflags
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
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (1) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170831_020540.log/
    * ERROR: 1 issues were found in these recipes: android-tools

    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log

    * ERROR: android-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1504181140/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 issues were found in these recipes: android-tools


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[smbnetfs]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring]
?= "This version conflicts with gcr from oe-core - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb:PNBLACKLIST[system-setup-keyboard]
?= "Depends on blacklisted system-config-keyboard-native - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
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


count: 0	issue: textrel


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


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
4610106 meta-gpe: remove this now pretty empty layer
not included in master yet:
e217113 dnsmasq: disable the service by default
efd625f rdate: Fix build with hardening
817c1a8 strongswan: Include stdint.h for uintptr_t
da1be86 netkit-rpc: Fix build with hardening flags
183dfc2 netkit-telnet: Fix build with hardening
c2c62eb ncftp: Upgrade to 3.2.6
1aa9626 autofs: Add build dependency on libnsl2
c975e5f openhpi: Fix build on 64bit platforms e.g. aarch64
70475da security_flags.inc: Delete
4c2422d pptp-linux: Upgrade to 1.9.0
18ca024 ebtables: replace ebtables-save perl script with bash rewrite
a754dfb pimd: Upgrade to 2.3.2
a999cb6 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
c5dd8aa rdate: Define logwtmp if libc != glibc
d5170f5 netkit-ftp: Include sys/types.h for u_long definition
2bcbcd0 postfix: Disable nis support on musl
a740097 zeroconf: Fix build with musl
76f77d7 netperf: change SRC_URI to git repository
e6b7ff1 ippool: Fix build errors found with hardening flags
85479ad openflow: Fix build with musl
561972d xl2tpd: Update to 1.3.9
f931f8f c-ares: update 1.12.0 -> 1.13.0
a867265 radvd: 2.14 -> 2.17
78b7299 libesmtp: Fix config.h define for snprintf detection
8437177 drbd: Add recipe
443dc4e net-snmp: fix engineBoots value on SIGHUP
5bf0c4f openl2tp: add LGPL-2.1 license
f499fc2 openl2tp: add init script and systemd support
a8aaa12 ntop: add new recipe
71b68e5 libtdb: update 1.3.12 -> 1.3.14
d722cb1 ndisc6: Upgrade to 1.0.3
7a36ab3 memcached: Update to 1.5.0
cea1066 tcpdump: remove unnecessary patch
6cdee70 squid: Add missing dependencies on openssl expat and libxml2
c72b540 postfix: Upgrade to 3.2.2
0077032 freeradius: Upgrade to 3.0.15
f180b2f tcpdump: update to 4.9.1 to fix CVE-2017-11108
6adb4dd wireshark: 2.2.7 -> 2.2.8
828abeb krb5: fix CVE-2017-11368
8de6512 quagga: update to 1.2.1
28ff30a openvpn: 2.4.2 -> 2.4.3
ed65655 ipsec-tools: fix CVE-2016-10396
78b8ac1 netcf: upgrade to latest 0.2.8
b59acb0 tftp-hpa: add systemd unit files
5a0d10e openconnect: fix parallel compilation failure
ed519a5 openconnect: upgrade to 7.08
92d8a9a ndisc6: specify target location of perl
badbf73 wireguard-tools: Add bash to rdeps
94e2ad6 openl2tp: Add bash to rdeps
ba9e39e squid: Disable format-truncation warning only with gcc
8bccf65 squid: Fix QA errors about wrong perl interpreter
446fb16 wireguard: Upgrade to 20170810 snapshot
4063fe7 ippool: Fix build errors found by clang
71a1eca iscsitarget: Fix kernel with new 4.12+ kernel
aa82bb7 postfix: Fix build with security flags and clang
b4caa45 openhpi: Fix build with clang+c++11
82ca2f3 openhpi: Fix ptest compile failures due to narrowing warnings with clang
efbadcf tcpreplay: upgrade to 4.2.6
0d9c27d tftp-hpa: Fix PIE build with clang
f3bd17a samba: 4.6.5 -> 4.6.7
45eb5db wolfssl: upgrade to 3.12.0
048d42c system-setup-keyboard: unblacklist recipe
68056ce smbnetfs: unblacklist recipe
2740da2 gnome-keyring: Fix compatibility with gcr 3 in oe-core
e04077c Revert "system-setup-keyboard: unblacklist recipe"
d6e3b95 Revert "smbnetfs: unblacklist recipe"
ff35290 Revert "gnome-keyring: Fix compatibility with gcr 3 in oe-core"

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2684299 qtwebengine: add patch for long paths
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe

--f40304366528c1f8ad05580cb4a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bo=
ttom:0px;color:rgb(51,51,51);font-size:14px"><a href=3D"http://www.openembe=
dded.org/wiki/Bitbake_World_Status" style=3D"box-sizing:border-box;word-wra=
p:break-word;color:rgb(92,53,102)">http://www.openembedded.org/wiki/Bitbake=
_World_Status</a>

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
||2017-08-31	||3	||3	||2	||1	||0		||0		||0		||0		||0		||0		||0		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-08-31 =3D=3D

INFO: jenkins-job.sh-1.8.28 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170831_030012.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170831_030=
012.log</a>

=3D=3D=3D common (2) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
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

=3D=3D=3D Number of failed tasks (8) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170830_222153.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170830_222153.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/46017/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/46017/</a>
|-
|| qemux86 	|| 3	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170830_222153.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170830_222153.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/46018/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/46018/</a>
|-
|| qemux86_64 	|| 2	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170831_001942.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170831_001942.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46019/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/46019/</a>
|}

=3D=3D=3D PNBLACKLISTs (4) =3D=3D=3D

=3D=3D=3D QA issues (0) =3D=3D=3D
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
||0	||textrel
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (1) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170831_020540.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170831_020540.log/</a>
    * ERROR: 1 issues were found in these recipes: android-tools

    * ERROR: 1 errors found in signatures.qemux86.do_package_write_ipk.sigd=
ata.log

    * ERROR: android-tools different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1504181140/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 issues were found in these recipes: android-tools


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[s=
mbnetfs] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctop=
roject.org/Errors/Details/132827/" style=3D"box-sizing:border-box;word-wrap=
:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Det=
ails/132827/</a> - the recipe will be removed on 2017-09-01 unless the issu=
e is fixed&quot;
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D &quot;This version conflicts with gcr from oe-core - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)}&quot;
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.b=
b:PNBLACKLIST[system-setup-keyboard] ?=3D &quot;Depends on blacklisted syst=
em-config-keyboard-native - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed&quot;
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


count: 0	issue: textrel


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


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
4610106 meta-gpe: remove this now pretty empty layer
not included in master yet:=20
e217113 dnsmasq: disable the service by default
efd625f rdate: Fix build with hardening
817c1a8 strongswan: Include stdint.h for uintptr_t
da1be86 netkit-rpc: Fix build with hardening flags
183dfc2 netkit-telnet: Fix build with hardening
c2c62eb ncftp: Upgrade to 3.2.6
1aa9626 autofs: Add build dependency on libnsl2
c975e5f openhpi: Fix build on 64bit platforms e.g. aarch64
70475da security_flags.inc: Delete
4c2422d pptp-linux: Upgrade to 1.9.0
18ca024 ebtables: replace ebtables-save perl script with bash rewrite
a754dfb pimd: Upgrade to 2.3.2
a999cb6 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
c5dd8aa rdate: Define logwtmp if libc !=3D glibc
d5170f5 netkit-ftp: Include sys/types.h for u_long definition
2bcbcd0 postfix: Disable nis support on musl
a740097 zeroconf: Fix build with musl
76f77d7 netperf: change SRC_URI to git repository
e6b7ff1 ippool: Fix build errors found with hardening flags
85479ad openflow: Fix build with musl
561972d xl2tpd: Update to 1.3.9
f931f8f c-ares: update 1.12.0 -&gt; 1.13.0
a867265 radvd: 2.14 -&gt; 2.17
78b7299 libesmtp: Fix config.h define for snprintf detection
8437177 drbd: Add recipe
443dc4e net-snmp: fix engineBoots value on SIGHUP
5bf0c4f openl2tp: add LGPL-2.1 license
f499fc2 openl2tp: add init script and systemd support
a8aaa12 ntop: add new recipe
71b68e5 libtdb: update 1.3.12 -&gt; 1.3.14
d722cb1 ndisc6: Upgrade to 1.0.3
7a36ab3 memcached: Update to 1.5.0
cea1066 tcpdump: remove unnecessary patch
6cdee70 squid: Add missing dependencies on openssl expat and libxml2
c72b540 postfix: Upgrade to 3.2.2
0077032 freeradius: Upgrade to 3.0.15
f180b2f tcpdump: update to 4.9.1 to fix CVE-2017-11108
6adb4dd wireshark: 2.2.7 -&gt; 2.2.8
828abeb krb5: fix CVE-2017-11368
8de6512 quagga: update to 1.2.1
28ff30a openvpn: 2.4.2 -&gt; 2.4.3
ed65655 ipsec-tools: fix CVE-2016-10396
78b8ac1 netcf: upgrade to latest 0.2.8
b59acb0 tftp-hpa: add systemd unit files
5a0d10e openconnect: fix parallel compilation failure
ed519a5 openconnect: upgrade to 7.08
92d8a9a ndisc6: specify target location of perl
badbf73 wireguard-tools: Add bash to rdeps
94e2ad6 openl2tp: Add bash to rdeps
ba9e39e squid: Disable format-truncation warning only with gcc
8bccf65 squid: Fix QA errors about wrong perl interpreter
446fb16 wireguard: Upgrade to 20170810 snapshot
4063fe7 ippool: Fix build errors found by clang
71a1eca iscsitarget: Fix kernel with new 4.12+ kernel
aa82bb7 postfix: Fix build with security flags and clang
b4caa45 openhpi: Fix build with clang+c++11
82ca2f3 openhpi: Fix ptest compile failures due to narrowing warnings with =
clang
efbadcf tcpreplay: upgrade to 4.2.6
0d9c27d tftp-hpa: Fix PIE build with clang
f3bd17a samba: 4.6.5 -&gt; 4.6.7
45eb5db wolfssl: upgrade to 3.12.0
048d42c system-setup-keyboard: unblacklist recipe
68056ce smbnetfs: unblacklist recipe
2740da2 gnome-keyring: Fix compatibility with gcr 3 in oe-core
e04077c Revert &quot;system-setup-keyboard: unblacklist recipe&quot;
d6e3b95 Revert &quot;smbnetfs: unblacklist recipe&quot;
ff35290 Revert &quot;gnome-keyring: Fix compatibility with gcr 3 in oe-core=
&quot;

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
2684299 qtwebengine: add patch for long paths
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:=20
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe</pre>=
</div>

--f40304366528c1f8ad05580cb4a4--
