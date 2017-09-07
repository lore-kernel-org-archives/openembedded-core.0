Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8F44F60017;
	Thu,  7 Sep 2017 08:47:24 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id m142so8003135vkf.2;
	Thu, 07 Sep 2017 01:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=V/z8C/jVcfw1SVCYHBqQsGR8pEhFeZNznZsoEhf4Ras=;
	b=RY2vqT+EkUkbbtUG8O68BPqqpT/JNT9eG9J3yJz90/QVNZ+oqz1UUbrqj1FvXBxLQQ
	qBcvEPZU7gaDwR5yttc/aUlUeTvO1xmZbkvyg+l+oF1Ne/r/JVVEr+/HMeBYkCBUmSOw
	3dAuoCxPym1pRS54/zvXi4ggl7XtOTJ7eBK699gfZQul58nmDzvSUR5cCcSvYlfO66dQ
	z+MaPjJXmQPpF3lELxlrWjL69QXuX/MtpvBy0fkbP4EmKAHG1IZq0PVjRNPmLAy3DEH8
	n9/01HrTZmxG2C7Ns/tlm7BDAjJCwDPKt6CxRS1tXv7ndvvMIP6GU/Gq9vVVhwJZnxs7
	p3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=V/z8C/jVcfw1SVCYHBqQsGR8pEhFeZNznZsoEhf4Ras=;
	b=f/YecgPizGD+67o+F71+CpHEwH/TH4qHH8yQOmXa/ZFXjt3jT9EjBp73uWnobC+yrl
	VcZ0YhUzaAtQsuOmuDo9nXg5AJdi8lhpRoyyb3Wl8p3+m40QhDbZpUSXLMV6r9ygD7Jn
	CHf3UJzrQkOj0+3EBVTHo5K/V2qwUXcsvPVdOHcrXvtID18OjAC1EVYmg8hnKFQVFYbv
	z9JUgO7peFdNlwuC63/lCllh89HYd7qBt61Tn+x5AZVnhI8hUTaT1tBHjUIsW2eB2P2Y
	8AO03EMWuYS9EyHKP2JTnbQ96wtZgLQ20e1bV/r5LkFz9MG4j6bjEv0t7AuB+JSKsrSR
	lhEg==
X-Gm-Message-State: AHPjjUhglbBczM9fiUAQ1R4N2ElnF3fY940FXyNWN/P7lUlzEpCy3mgd
	l88fZ60P9wu6s6zE490/H29QQIGt7mCw
X-Google-Smtp-Source: ADKCNb70uV3kCoE7vavM75tmEKd6//Yudr+yoPbe/9QLDTF6FKOPBOMI/JLHMFthVtiIuqz/Hafn5wZr1S5BeHaHguk=
X-Received: by 10.31.231.1 with SMTP id e1mr1201944vkh.90.1504774045130; Thu,
	07 Sep 2017 01:47:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Thu, 7 Sep 2017 01:47:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Sep 2017 10:47:24 +0200
Message-ID: <CA+chaQfs4qxeW5uoyi5RH1ftgEr_P61zq8mOjN=YiORBOwMOLg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-09-06
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
X-List-Received-Date: Thu, 07 Sep 2017 08:47:25 -0000
Content-Type: multipart/alternative; boundary="94eb2c092d4e6d68e40558958279"

--94eb2c092d4e6d68e40558958279
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
||2017-09-06	||2	||1	||1	||0	||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-09-06 ==

INFO: jenkins-job.sh-1.8.28 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170906_221116.log

=== common (1) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (1) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (4) ===
{| class=wikitable
|-
|| qemuarm 	|| 2	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170906_130143.log/
|| http://errors.yoctoproject.org/Errors/Build/46298/
|-
|| qemux86 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170906_150119.log/
||
|-
|| qemux86_64 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170906_170855.log/
|| http://errors.yoctoproject.org/Errors/Build/46303/
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



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170906_145241.log/

No issues detected


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
1ca2eec cooker: clear extra config settings and remote datastores on
client disconnect
not included in master yet:
fbcc4d6 world-image: add extra target
3e32f80 fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
cc319b6 mesa-gl: Fix build after recent mesa PACKAGECONFIG changes
not included in master yet:
ae7fe8a report-error: Allow to upload reports automatically
bba20cb buildhistory.bbclass: metadata-revs show repo parent
2ab075c metadata-revs: provide more information
d8bffe1 qemux86: Add identical qemux86copy variant for tests
e1d5fbf reproducible_build.bbclass: initial support for binary reproducibility
41bef84 cpio: provide cpio-replacement-native
9afb603 image_types.bbclass: improve cpio image reproducibility
847937b rootfs-postcommands.bbclass: support binary reproducibility
6b26861 insane.bbclass: write QA issues to log file only when they are
in ERROR_QA or WARN_QA
0749360 sstate.bbclass: Do not cause build failures due to setscene errors

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
e5681e1 layer.conf: remove FREESMARTPHONE_GIT variable
not included in master yet:
10bace9 dnsmasq: disable the service by default
4f93985 rdate: Fix build with hardening
e5c886b strongswan: Include stdint.h for uintptr_t
4677c6a netkit-rpc: Fix build with hardening flags
c8efb3c netkit-telnet: Fix build with hardening
76662d3 ncftp: Upgrade to 3.2.6
53c064f autofs: Add build dependency on libnsl2
8e943f5 openhpi: Fix build on 64bit platforms e.g. aarch64
da43327 security_flags.inc: Delete
2194ffc pptp-linux: Upgrade to 1.9.0
3426784 ebtables: replace ebtables-save perl script with bash rewrite
a9a8724 pimd: Upgrade to 2.3.2
f131a95 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
e7c14f4 rdate: Define logwtmp if libc != glibc
ec9e308 netkit-ftp: Include sys/types.h for u_long definition
066a9c7 postfix: Disable nis support on musl
8da3ce9 zeroconf: Fix build with musl
9c2d01f ippool: Fix build errors found with hardening flags
fff054d openflow: Fix build with musl
25d61ba xl2tpd: Update to 1.3.9
51b1378 c-ares: update 1.12.0 -> 1.13.0
f636b27 radvd: 2.14 -> 2.17
82bf544 libesmtp: Fix config.h define for snprintf detection
4cb7315 drbd: Add recipe
6aa8077 net-snmp: fix engineBoots value on SIGHUP
b270230 openl2tp: add LGPL-2.1 license
fb9b74b openl2tp: add init script and systemd support
4d7fd49 ntop: add new recipe
650c226 libtdb: update 1.3.12 -> 1.3.14
bc2ecf9 ndisc6: Upgrade to 1.0.3
60b2801 memcached: Update to 1.5.0
ab22cc4 tcpdump: remove unnecessary patch
424e6e6 squid: Add missing dependencies on openssl expat and libxml2
07e09c6 postfix: Upgrade to 3.2.2
8ef3e24 freeradius: Upgrade to 3.0.15
37e3ccd tcpdump: update to 4.9.1 to fix CVE-2017-11108
ebff0aa wireshark: 2.2.7 -> 2.2.8
d95f6b1 krb5: fix CVE-2017-11368
4b71e13 quagga: update to 1.2.1
346ae75 openvpn: 2.4.2 -> 2.4.3
d1cf702 ipsec-tools: fix CVE-2016-10396
1b793a9 netcf: upgrade to latest 0.2.8
87377c8 tftp-hpa: add systemd unit files
b04d96c openconnect: fix parallel compilation failure
20c367e openconnect: upgrade to 7.08
6b1cd36 ndisc6: specify target location of perl
053e2cd wireguard-tools: Add bash to rdeps
e4a15f9 openl2tp: Add bash to rdeps
42116f6 squid: Disable format-truncation warning only with gcc
2cb8fcb squid: Fix QA errors about wrong perl interpreter
08f0852 wireguard: Upgrade to 20170810 snapshot
ba3a771 ippool: Fix build errors found by clang
ba00b39 iscsitarget: Fix kernel with new 4.12+ kernel
3267d6d postfix: Fix build with security flags and clang
e8f4c41 openhpi: Fix build with clang+c++11
64030b1 openhpi: Fix ptest compile failures due to narrowing warnings with clang
96f8322 tcpreplay: upgrade to 4.2.6
78433db tftp-hpa: Fix PIE build with clang
d2e0096 samba: 4.6.5 -> 4.6.7
1fc6436 wolfssl: upgrade to 3.12.0
c6bf516 netperf: upgrade to 2.7.0+ with git version
2624ca3 json-spirit: link to libatomic
907da25 librcf: link to libatomic
33f5af8 ntop: Fix build with musl
02ac394 corosync: Fix build with musl
88d3bbf netkit-rwho: Fix build with musl
ec4305b netkit-tftp: Fix build with musl
6d3a59a serial-forward: Fix build with hardening+musl
f71212d gsoap: Fix build with musl
7b54903 libpwquality: fix do_qa_configure issue
5171cff drbd-utils: only rmmod if DRBD is a module
b022240 libgphoto2: Copy Makefile.in.in from gettext-native
ef87d81 lxdm: Copy Makefile.in.in from gettext-native
85fb730 mosquitto: add from meta-intel-iot-middleware and update
d2eabf8 paho-mqtt-c: add recipe from meta-intel-iot-middleware and update
63fb151 iptraf-ng: Add new recipe
62bff08 sblim-sfcb: Fix build with musl
eeeec50 libmtp: fix build issue
5602afe libexecinfo: fix complie issue
336297c pmtools: use update-alternatives for acpixtract
4f94470 openjpeg: upgrade to 2.2.0
7f47d47 vpnc: Reduce lifetime value to widely-compatible value
6bd0135 pam-ssh-agent-auth: Get newer version of config.sub and
config.guess scripts
23cd1a5 python-matplotlib: Upgrade to 2.0.2
6f1ee9c wireshark: update to 2.2.9
7704781 gperftools: Fix build with musl
7b92849 mongodb: Disable for armv7 and fix build on musl
ede7768 open-vm-tools: Add -Wno-address-of-packed-member for with clang
392aa0d xfsprogs: Upgrade to 4.12.0
bde0fe7 tftp-hpa: Add HOMEPAGE info into recipe file.
c22dea3 cyrus-sasl: Add HOMEPAGE info into recipe file.
0ed9cde pps-tools: Add HOMEPAGE info into recipe file.
fed5f72 libjs-jquery: Add HOMEPAGE info into recipe file.
f2eada8 netkit-rpc: Link libtirpc on musl
e668879 ndisc6: Fix build with clang and update to latest on git
5110b4d psqlodbc: add recipe
baf375f python-networkx: add python-2to3 to RDEPENDS
01abeb9 protobuf-c: use git fetcher instead of github archives
1cb2de1 leveldb: Fix build with clang
41c1962 rsyslog: fix segfault after configuration errors
eac05cb logcheck: Add HOMEPAGE info into recipe file
befda04 Revert "leveldb: Fix build with clang"
7a91a8b Revert "ndisc6: Fix build with clang and update to latest on git"
8662b99 Revert "xfsprogs: Upgrade to 4.12.0"

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2684299 qtwebengine: add patch for long paths
not included in master yet:
90d4a41 qtbase: Add OE clang specific mkspecs
ec80b09 qtbase: Fix build with musl/clang
be3c2d3 qtbase-native: set path to mkspec for cmake properly again

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet:

--94eb2c092d4e6d68e40558958279
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
||2017-09-06	||2	||1	||1	||0	||0		||0		||0		||0		||0		||0		||0		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-09-06 =3D=3D

INFO: jenkins-job.sh-1.8.28 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170906_221116.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170906_221=
116.log</a>

=3D=3D=3D common (1) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (4) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170906_130143.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170906_130143.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/46298/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/46298/</a>
|-
|| qemux86 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170906_150119.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170906_150119.log/</a> ||=20
|-
|| qemux86_64 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170906_170855.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170906_170855.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46303/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/46303/</a>
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



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170906_145241.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170906_145241.log/</a>

No issues detected


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
1ca2eec cooker: clear extra config settings and remote datastores on client=
 disconnect
not included in master yet:=20
fbcc4d6 world-image: add extra target
3e32f80 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
cc319b6 mesa-gl: Fix build after recent mesa PACKAGECONFIG changes
not included in master yet:=20
ae7fe8a report-error: Allow to upload reports automatically
bba20cb buildhistory.bbclass: metadata-revs show repo parent
2ab075c metadata-revs: provide more information
d8bffe1 qemux86: Add identical qemux86copy variant for tests
e1d5fbf reproducible_build.bbclass: initial support for binary reproducibil=
ity
41bef84 cpio: provide cpio-replacement-native
9afb603 image_types.bbclass: improve cpio image reproducibility
847937b rootfs-postcommands.bbclass: support binary reproducibility
6b26861 insane.bbclass: write QA issues to log file only when they are in E=
RROR_QA or WARN_QA
0749360 sstate.bbclass: Do not cause build failures due to setscene errors

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
e5681e1 layer.conf: remove FREESMARTPHONE_GIT variable
not included in master yet:=20
10bace9 dnsmasq: disable the service by default
4f93985 rdate: Fix build with hardening
e5c886b strongswan: Include stdint.h for uintptr_t
4677c6a netkit-rpc: Fix build with hardening flags
c8efb3c netkit-telnet: Fix build with hardening
76662d3 ncftp: Upgrade to 3.2.6
53c064f autofs: Add build dependency on libnsl2
8e943f5 openhpi: Fix build on 64bit platforms e.g. aarch64
da43327 security_flags.inc: Delete
2194ffc pptp-linux: Upgrade to 1.9.0
3426784 ebtables: replace ebtables-save perl script with bash rewrite
a9a8724 pimd: Upgrade to 2.3.2
f131a95 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
e7c14f4 rdate: Define logwtmp if libc !=3D glibc
ec9e308 netkit-ftp: Include sys/types.h for u_long definition
066a9c7 postfix: Disable nis support on musl
8da3ce9 zeroconf: Fix build with musl
9c2d01f ippool: Fix build errors found with hardening flags
fff054d openflow: Fix build with musl
25d61ba xl2tpd: Update to 1.3.9
51b1378 c-ares: update 1.12.0 -&gt; 1.13.0
f636b27 radvd: 2.14 -&gt; 2.17
82bf544 libesmtp: Fix config.h define for snprintf detection
4cb7315 drbd: Add recipe
6aa8077 net-snmp: fix engineBoots value on SIGHUP
b270230 openl2tp: add LGPL-2.1 license
fb9b74b openl2tp: add init script and systemd support
4d7fd49 ntop: add new recipe
650c226 libtdb: update 1.3.12 -&gt; 1.3.14
bc2ecf9 ndisc6: Upgrade to 1.0.3
60b2801 memcached: Update to 1.5.0
ab22cc4 tcpdump: remove unnecessary patch
424e6e6 squid: Add missing dependencies on openssl expat and libxml2
07e09c6 postfix: Upgrade to 3.2.2
8ef3e24 freeradius: Upgrade to 3.0.15
37e3ccd tcpdump: update to 4.9.1 to fix CVE-2017-11108
ebff0aa wireshark: 2.2.7 -&gt; 2.2.8
d95f6b1 krb5: fix CVE-2017-11368
4b71e13 quagga: update to 1.2.1
346ae75 openvpn: 2.4.2 -&gt; 2.4.3
d1cf702 ipsec-tools: fix CVE-2016-10396
1b793a9 netcf: upgrade to latest 0.2.8
87377c8 tftp-hpa: add systemd unit files
b04d96c openconnect: fix parallel compilation failure
20c367e openconnect: upgrade to 7.08
6b1cd36 ndisc6: specify target location of perl
053e2cd wireguard-tools: Add bash to rdeps
e4a15f9 openl2tp: Add bash to rdeps
42116f6 squid: Disable format-truncation warning only with gcc
2cb8fcb squid: Fix QA errors about wrong perl interpreter
08f0852 wireguard: Upgrade to 20170810 snapshot
ba3a771 ippool: Fix build errors found by clang
ba00b39 iscsitarget: Fix kernel with new 4.12+ kernel
3267d6d postfix: Fix build with security flags and clang
e8f4c41 openhpi: Fix build with clang+c++11
64030b1 openhpi: Fix ptest compile failures due to narrowing warnings with =
clang
96f8322 tcpreplay: upgrade to 4.2.6
78433db tftp-hpa: Fix PIE build with clang
d2e0096 samba: 4.6.5 -&gt; 4.6.7
1fc6436 wolfssl: upgrade to 3.12.0
c6bf516 netperf: upgrade to 2.7.0+ with git version
2624ca3 json-spirit: link to libatomic
907da25 librcf: link to libatomic
33f5af8 ntop: Fix build with musl
02ac394 corosync: Fix build with musl
88d3bbf netkit-rwho: Fix build with musl
ec4305b netkit-tftp: Fix build with musl
6d3a59a serial-forward: Fix build with hardening+musl
f71212d gsoap: Fix build with musl
7b54903 libpwquality: fix do_qa_configure issue
5171cff drbd-utils: only rmmod if DRBD is a module
b022240 libgphoto2: Copy <a href=3D"http://Makefile.in.in">Makefile.in.in</=
a> from gettext-native
ef87d81 lxdm: Copy <a href=3D"http://Makefile.in.in">Makefile.in.in</a> fro=
m gettext-native
85fb730 mosquitto: add from meta-intel-iot-middleware and update
d2eabf8 paho-mqtt-c: add recipe from meta-intel-iot-middleware and update
63fb151 iptraf-ng: Add new recipe
62bff08 sblim-sfcb: Fix build with musl
eeeec50 libmtp: fix build issue
5602afe libexecinfo: fix complie issue
336297c pmtools: use update-alternatives for acpixtract
4f94470 openjpeg: upgrade to 2.2.0
7f47d47 vpnc: Reduce lifetime value to widely-compatible value
6bd0135 pam-ssh-agent-auth: Get newer version of config.sub and config.gues=
s scripts
23cd1a5 python-matplotlib: Upgrade to 2.0.2
6f1ee9c wireshark: update to 2.2.9
7704781 gperftools: Fix build with musl
7b92849 mongodb: Disable for armv7 and fix build on musl
ede7768 open-vm-tools: Add -Wno-address-of-packed-member for with clang
392aa0d xfsprogs: Upgrade to 4.12.0
bde0fe7 tftp-hpa: Add HOMEPAGE info into recipe file.
c22dea3 cyrus-sasl: Add HOMEPAGE info into recipe file.
0ed9cde pps-tools: Add HOMEPAGE info into recipe file.
fed5f72 libjs-jquery: Add HOMEPAGE info into recipe file.
f2eada8 netkit-rpc: Link libtirpc on musl
e668879 ndisc6: Fix build with clang and update to latest on git
5110b4d psqlodbc: add recipe
baf375f python-networkx: add python-2to3 to RDEPENDS
01abeb9 protobuf-c: use git fetcher instead of github archives
1cb2de1 leveldb: Fix build with clang
41c1962 rsyslog: fix segfault after configuration errors
eac05cb logcheck: Add HOMEPAGE info into recipe file
befda04 Revert &quot;leveldb: Fix build with clang&quot;
7a91a8b Revert &quot;ndisc6: Fix build with clang and update to latest on g=
it&quot;
8662b99 Revert &quot;xfsprogs: Upgrade to 4.12.0&quot;

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
2684299 qtwebengine: add patch for long paths
not included in master yet:=20
90d4a41 qtbase: Add OE clang specific mkspecs
ec80b09 qtbase: Fix build with musl/clang
be3c2d3 qtbase-native: set path to mkspec for cmake properly again

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet:=20
</pre><div><br></div></div>

--94eb2c092d4e6d68e40558958279--
