Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id B521178096;
	Thu,  7 Sep 2017 14:30:22 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id l24so19223659uaa.5;
	Thu, 07 Sep 2017 07:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=pElQd1eUjbzgL3/vRcCheKZ8PT2z4LdAEaZUUT/YJoA=;
	b=uxA3SMHhcFEaZvdV51WymZNNC2RcQqNQyJDPuw/KuEZcnTzv5prJ62GvHtE8p+M5xp
	qBGqQk4tHWV9xnS4EE6sJpzyBnfIF1kYF621u5DiAKjxgNGk0hVd3VABNvNJP4Ewkw0/
	USOaVtUACwUfNaK/IadAv442gxjyeev/5n3CDhq8kGHRWc50tC9P01iOzc+NREVx12J9
	9fyn2hzhEPvvHuJkLmahTfZ5ZUzFRtTV8d89XKsKogbWZiEYPeLb3uTkwTpxEIu8XRL9
	UcdqGRzaujegeq0I6HP1uw6bmOmFF/+M2cxNmzh/c9wPGmjAwaCWx6LlC0GwQ6OUjlZE
	E+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=pElQd1eUjbzgL3/vRcCheKZ8PT2z4LdAEaZUUT/YJoA=;
	b=XFgVmfgSoNzq2sefY2TNlSpIwe8Ixt73IynbYWujx0b+joJx6sPwUhBhuazowjidVy
	/1chbhYpSKjj50XViAR/fM4AbDFHysdIUZsvicRCoX2m/al19yJOs5ZmJyH+8vmMe+QL
	B8nAxrukGcqIJVrKVDcqY/ybr8sfCX5FPTWbx2R04tti+6XZytG2nQiq2vC5MK8eO8vj
	qeSP7i2NIBJALGH3Q2kTnciNxxckVRte3HHAye3zKpNocgxMOk7AfedF8ARvSDOv6Ng3
	zoir8ZQn0NvQp8snbfo+kVrZCYt+XTMPrYfjHVRXLxK9pfpjV8BId3TNlogEZdj5NOUT
	iSsQ==
X-Gm-Message-State: AHPjjUi7TZd6+EPbsktbQTQE/o/Fuz8XF5Ith3uMyZ+50gXZenymKkzr
	nws16+9X366i4rm5S1j/Rp2z+WLOhk3N
X-Google-Smtp-Source: ADKCNb7DKgGURMxeYuVnLa58+4L0Ni/Jo55YwkXrKdj8PyW84jhPmvvzZZWb7D1suo5RfuWx/OkBdLHqq/hdJFZoiZg=
X-Received: by 10.176.83.149 with SMTP id k21mr1564440uaa.183.1504794623363;
	Thu, 07 Sep 2017 07:30:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Thu, 7 Sep 2017 07:30:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Sep 2017 16:30:22 +0200
Message-ID: <CA+chaQeAHtkyjx=awhMG-oxxLwgDn4sB_Auw-awra+sQod8MsA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-09-07
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
X-List-Received-Date: Thu, 07 Sep 2017 14:30:23 -0000
Content-Type: multipart/alternative; boundary="f403045dde20fc54cd05589a4c59"

--f403045dde20fc54cd05589a4c59
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
||2017-09-07	||2	||1	||1	||0	||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-09-07 ==

INFO: jenkins-job.sh-1.8.28 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170907_042847.log

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
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170907_000240.log/
|| http://errors.yoctoproject.org/Errors/Build/46307/
|-
|| qemux86 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170907_000239.log/
|| http://errors.yoctoproject.org/Errors/Build/46308/
|-
|| qemux86_64 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170907_021135.log/
|| http://errors.yoctoproject.org/Errors/Build/46309/
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

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170907_020627.log/

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
4b7240a Replace deprecated git branch parameter "--set-upstream"

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
d9f7ef4 krb5: fix CVE-2017-11368
not included in master yet:
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
2b5abad rdate: Define logwtmp if libc != glibc
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
7b2059f openhpi: Fix ptest compile failures due to narrowing warnings with clang
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
ed1693c openlmi-tools: Only build if the necessary python pieces are available
8ae0a35 xorg-drivers: Add opengl distro flag requirement to ati and nouveau
66c4927 boinc-client: Add distro flag, requires opengl
8c56daf networkmanager-openvpn: requires openvpn from meta-networking
796346d telepathy-python: Move to meta-python, requires python-dbus
6c15141 networkmanager: Move to meta-networking, requires dnsmasq
16eae99 python-ldap: Move to meta-networking, requires cyrus-sasl
524cef0 python-networkmanager: Move to networking, requires networkmanager
0ffdc42 corosync: Requires net-snmp from meta-networking
cc63c0d pywbem: Requires python-m2crypto-native (and others) from meta-python
580d402 dlm: requires corosync, from meta-networking
dd5884e open-vm-tools: only build if meta-networking and
meta-filesystems is available
6baab86 miniupnpd: Move to meta-networking, requires libnetfilter-conntrack
b056fbc enable_gnome.conf: Move the AVAHI_GTK setting
3345b65 glade3: Move PACKAGECONFIG setting to enable_gnome.conf
0918940 libart-lgpg: Obsolete, replaced by version in oe-core
89befc7 pinpoint: Add dependency on opengl for cogl
5f5d62c vim: Remove xfce vim bbappend
b529f55 layer.conf: Add meta-networking for the networkmanager
23ecc23 meta-xfce: depend on meta-multimedia
ef9f84d mpv: Requires ffmpeg which has a LICENSE_FLAGS = commercial set
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
3f85676 xfsprogs: Upgrade to 4.12.0
53a13eb ndisc6: Fix build with clang and update to latest on git
f17bf4a vlan: Add HOMEPAGE info into recipe file.
eb0d2e3 fluentbit: Upgrade to 0.12.1
924c7cd leptonica: Upgrade to 1.74.4
9bb729d tesseract: Upgrade to 3.05.01
9bce12b umip: Update SRC_URI to github
c99c58a dovecot: Add HOMEPAGE info into recipe file.
d78dfb6 dracut: Add HOMEPAGE info into recipe file.
4c49707 fetchmail: Add HOMEPAGE info into recipe file.

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

--f403045dde20fc54cd05589a4c59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre id=3D"gmail-out" class=3D"gmail-console-output" style=
=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-=
top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><pre style=3D=
"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top=
:0px;margin-bottom:0px"><a href=3D"http://www.openembedded.org/wiki/Bitbake=
_World_Status" style=3D"box-sizing:border-box;word-wrap:break-word;color:rg=
b(92,53,102)">http://www.openembedded.org/wiki/Bitbake_World_Status</a>

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
||2017-09-07	||2	||1	||1	||0	||0		||0		||0		||0		||0		||0		||0		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-09-07 =3D=3D

INFO: jenkins-job.sh-1.8.28 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170907_042847.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170907_042=
847.log</a>

=3D=3D=3D common (1) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (4) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170907_000240.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170907_000240.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/46307/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/46307/</a>
|-
|| qemux86 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170907_000239.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170907_000239.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/46308/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/46308/</a>
|-
|| qemux86_64 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170907_021135.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170907_021135.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46309/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/46309/</a>
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
ko/log.signatures.20170907_020627.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170907_020627.log/</a>

No issues detected


PNBLACKLISTs:
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">openembedded-core/:
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
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
1ca2eec cooker: clear extra config settings and remote datastores on client=
 disconnect
not included in master yet:=20
fbcc4d6 world-image: add extra target
3e32f80 fetch2: Allow Fetch.download() to warn instead of error
4b7240a Replace deprecated git branch parameter &quot;--set-upstream&quot;

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
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
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
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
eb9979f c-ares: update 1.12.0 -&gt; 1.13.0
38dbcc7 radvd: 2.14 -&gt; 2.17
ba34c7b libesmtp: Fix config.h define for snprintf detection
a171974 drbd: Add recipe
ad67458 net-snmp: fix engineBoots value on SIGHUP
1351f14 openl2tp: add LGPL-2.1 license
4286f9f openl2tp: add init script and systemd support
e572bc1 ntop: add new recipe
b595282 libtdb: update 1.3.12 -&gt; 1.3.14
40e221b ndisc6: Upgrade to 1.0.3
33e545f memcached: Update to 1.5.0
c0d8fff tcpdump: remove unnecessary patch
c65f66c squid: Add missing dependencies on openssl expat and libxml2
d73293f postfix: Upgrade to 3.2.2
f98d9eb freeradius: Upgrade to 3.0.15
5d0968d tcpdump: update to 4.9.1 to fix CVE-2017-11108
e6ca81e wireshark: 2.2.7 -&gt; 2.2.8
e29bd7b quagga: update to 1.2.1
63566ee openvpn: 2.4.2 -&gt; 2.4.3
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
ab59d1a samba: 4.6.5 -&gt; 4.6.7
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
85731dd libmtp: remove &#39;mtp-tools&#39; from PACKAGES
5c418d8 florence: update 0.6.3
776a331 evince: Remove X dependency
801dcd3 core-image-minimal-xfce: inherit distro_features_check
ae77c08 vsftpd: link with wrap when tcp-wrappers configured
994aa45 aufs-util: Use cross strip tool
dc7969b leveldb: Fix build with clang
0e76efc pm-qa: Upgrade to 0.5.2
3f85676 xfsprogs: Upgrade to 4.12.0
53a13eb ndisc6: Fix build with clang and update to latest on git
f17bf4a vlan: Add HOMEPAGE info into recipe file.
eb0d2e3 fluentbit: Upgrade to 0.12.1
924c7cd leptonica: Upgrade to 1.74.4
9bb729d tesseract: Upgrade to 3.05.01
9bce12b umip: Update SRC_URI to github
c99c58a dovecot: Add HOMEPAGE info into recipe file.
d78dfb6 dracut: Add HOMEPAGE info into recipe file.
4c49707 fetchmail: Add HOMEPAGE info into recipe file.

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
not included in master yet: <br></pre></pre></div>

--f403045dde20fc54cd05589a4c59--
