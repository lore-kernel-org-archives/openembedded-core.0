Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE1978248;
	Sun,  3 Sep 2017 06:49:06 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id j7so8635632vke.0;
	Sat, 02 Sep 2017 23:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=U5VekROav9Mhx5fE/f4f6pbgawU90UmsvqW+dsZbFiM=;
	b=PGMQGhObkRftoTBQ4UBlRDvxwA3CFysDguu4zw2iDZEpMJXnnP0X8dJtaCpPnjoQFu
	CPS1tBje+lkwLP2CrXHkzUg9FZRXrDYU9VVRNy0VDx1Jvv9medEAAeDDzIMdFxFSoQQ3
	BhFkLK2kQBDp3Og54qs7gbNKZqE1qZNaZ5+YHgt5R5f06S4UZ9AM8RL15bXl8iLqB2Yo
	RBG8GInN9E7/txUiDZS2M6BUYc2rkUxhJBbV/53ED5kMuJEmdudNpYnL5BlGssXgNPP7
	wlkhI8Rtkt/vURQMxXi39bBCdtkloLPblSX8kN9Q4WGZW3jhBVdo98VpPsZFe1ETtKse
	28iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=U5VekROav9Mhx5fE/f4f6pbgawU90UmsvqW+dsZbFiM=;
	b=DIa+TGR0c3YOblqF1UOOHAxC+eCqK8aLnJ2jivhNizZcSrMb4sXgQJq+LLVoZ1mh9I
	PGE/pVsQF0QGQBxvqx41V3fCfnrTuXg9LXkA7btiMc8w45ZcvYWv63+C0qmtqEIKfyPS
	LEvN4riPvbXZQ9CA6qkBEpvKlS5oOOeTDhE9Ul1D0PXCcHSzRyitsWuxCctm7Afnf0qa
	IEJYagMhUmZZ7MHHCoXYI9WsO+PaSwnKkVt+WC9qrcfwrNCqkZNZsZypqaKEKH7hfuCq
	nkz6xvGqcpQqz4vWktfsSr7CsuS5p4KwCc3MD/cmO8zEv6oC8oUqz+WydgdctP0bMUiw
	R2PA==
X-Gm-Message-State: AHPjjUg9ae4hUHjA824ScuA1l+04/QHeSSXQD6xluHrrLhrcS41pHfV1
	YS0XeV7vcRSTI9moSiRBfTmk2OTSMBRh
X-Google-Smtp-Source: ADKCNb7LMdNQXAJohz8SW3z9j6VIXKPeAoJkBSSABcCeRcuNxyVqq+ibnd9mNDdx/nyxirSM8puErbbQtEmZlVqnAAY=
X-Received: by 10.31.176.132 with SMTP id z126mr3786276vke.1.1504421346892;
	Sat, 02 Sep 2017 23:49:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Sat, 2 Sep 2017 23:49:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 3 Sep 2017 08:49:06 +0200
Message-ID: <CA+chaQeg6Z3ms+eMc3vtTp6avh+LWFrzQYMMkETuRw_fTL4q7Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-09-01
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
X-List-Received-Date: Sun, 03 Sep 2017 06:49:07 -0000
Content-Type: multipart/alternative; boundary="001a114411b6f95f780558436394"

--001a114411b6f95f780558436394
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

||2017-09-01	||4	||6	||3	||0	||0		||0		||5		||0		||0		||44058		||2		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-09-01 ==

INFO: jenkins-job.sh-1.8.28 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170902_201615.log

=== common (3) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.0.1.bb:do_patch
    * meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (1) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile

=== qemux86 (3) ===
    * meta-openembedded/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (13) ===
{| class=wikitable

|-
|| qemuarm 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170901_034938.log/
|| http://errors.yoctoproject.org/Errors/Build/46155/
|-
|| qemux86 	|| 6	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170831_032945.log/
|| http://errors.yoctoproject.org/Errors/Build/46063/
|-
|| qemux86_64 	|| 3	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170901_071730.log/
|| http://errors.yoctoproject.org/Errors/Build/46163/
|}

=== PNBLACKLISTs (4) ===

=== QA issues (44065) ===
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
||2	||host-user-contaminated
|-
||44058	||version-going-backwards
|-
||5	||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170901_030102.log/

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

count: 5	issue: textrel

chromium-54.0.2810.2: ELF binary
'/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
has relocations in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary
'/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
has relocations in .text [textrel]
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0	issue: build-deps

count: 0	issue: file-rdeps

count: 44058	issue: version-going-backwards

a2jmidid-8: Package version for package a2jmidid-dbg went backwards
which would break package feeds from (0:8-r0.3 to 0:8-r0.0)
[version-going-backwards]

...skip 44056 lines...

zsh-5.3.1: Package version for package zsh went backwards which would
break package feeds from (0:5.3.1-r0.3 to 0:5.3.1-r0.0)
[version-going-backwards]


count: 2	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-gl-es.iso-8859-1/usr/lib/locale/gl_ES.ISO-8859-1/LC_CTYPE
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
libqofono-0.87+gitrAUTOINC+54435de3be: libqofono:
/libqofono-tests/usr/lib/libqofono-qt5/tests/tst_qofonocellbroadcast
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

count: 0	issue: ldflags



count: 0	issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==

latest upstream commit:
2a78c2d siggen: Add reset to SignatureGenerator
not included in master yet:
72ae1b2 world-image: add extra target
87ac37a fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==

latest upstream commit:
811edd9 selftest/prservice: Adapt to BB_SERVER_TIMEOUT
not included in master yet:
c14576a report-error: Allow to upload reports automatically
910bca2 buildhistory.bbclass: metadata-revs show repo parent
686d9d9 metadata-revs: provide more information
9e73365 qemux86: Add identical qemux86copy variant for tests
59e8b83 reproducible_build.bbclass: initial support for binary reproducibility
95652fb cpio: provide cpio-replacement-native
3b23ef6 image_types.bbclass: improve cpio image reproducibility
bf38798 rootfs-postcommands.bbclass: support binary reproducibility
7eeda32 insane.bbclass: write QA issues to log file only when they are
in ERROR_QA or WARN_QA
061d137 sstate.bbclass: Do not cause build failures due to setscene errors

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
ed9cb27 iscsitarget: Fix kernel with new 4.12+ kernel
2e70823 postfix: Fix build with security flags and clang
f45593d openhpi: Fix build with clang+c++11
3ec9d31 openhpi: Fix ptest compile failures due to narrowing warnings with clang
0fa6136 tcpreplay: upgrade to 4.2.6
2ec0aa6 tftp-hpa: Fix PIE build with clang
968836a samba: 4.6.5 -> 4.6.7
43e4a8c wolfssl: upgrade to 3.12.0
6af98c4 netperf: upgrade to 2.7.0+ with git version
cc5e1a4 json-spirit: link to libatomic
df870b0 librcf: link to libatomic
48c49f5 ntop: Fix build with musl
a67034e corosync: Fix build with musl
0852b86 netkit-rwho: Fix build with musl
0d251e8 netkit-tftp: Fix build with musl
6010fc1 serial-forward: Fix build with hardening+musl
9337155 gsoap: Fix build with musl
7cc1044 libpwquality: fix do_qa_configure issue
2d08073 drbd-utils: only rmmod if DRBD is a module
b7b7c81 libgphoto2: Copy Makefile.in.in from gettext-native
51f6429 lxdm: Copy Makefile.in.in from gettext-native

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2684299 qtwebengine: add patch for long paths
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet:

--001a114411b6f95f780558436394
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
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">||2017-09-01	||4	||6	||3	||0	||0=
		||0		||5		||0		||0		||44058		||2		||0		||0		||0		||0		||0		||0		||0		||=
=09
|}

=3D=3D Failed tasks 2017-09-01 =3D=3D

INFO: jenkins-job.sh-1.8.28 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170902_201615.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170902_201=
615.log</a>

=3D=3D=3D common (3) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.0.1.bb:=
do_patch
    * meta-openembedded/meta-python/recipes-devtools/python/python-matplotl=
ib_1.1.0.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.b=
b:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb:do_conf=
igure
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_c=
ompile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (13) =3D=3D=3D
{| class=3Dwikitable
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">|-
|| qemuarm 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170901_034938.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170901_034938.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/46155/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/46155/</a>
|-
|| qemux86 	|| 6	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170831_032945.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170831_032945.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/46063/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/46063/</a>
|-
|| qemux86_64 	|| 3	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170901_071730.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170901_071730.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46163/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/46163/</a>
|}

=3D=3D=3D PNBLACKLISTs (4) =3D=3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">=3D=3D=3D QA issues (44065) =3D=
=3D=3D
{| class=3Dwikitable
!| Count		||Issue
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">|-
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
||2	||host-user-contaminated
|-
||44058	||version-going-backwards
|-
||5	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170901_030102.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170901_030102.log/</a>

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
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 0	issue: already-stripped
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 0	issue: libdir
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 5	issue: textrel
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">chromium-54.0.2810.2: ELF binary=
 &#39;/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromi=
um/usr/bin/chromium/chrome&#39; has relocations in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary &#39;/tmp/work/i586-oe-linux/chr=
omium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chro=
mium/chrome&#39; has relocations in .text [textrel]
corosync-2.4.2: ELF binary &#39;/tmp/work/core2-64-oe-linux/corosync/2.4.2-=
r0/packages-split/corosync/usr/sbin/corosync&#39; has relocations in .text =
[textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-linux/x=
264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264&#39=
; has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-linux/x=
264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.1=
48&#39; has relocations in .text [textrel]


count: 0	issue: build-deps
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 0	issue: file-rdeps
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 44058	issue: version-goin=
g-backwards
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">a2jmidid-8: Package version for =
package a2jmidid-dbg went backwards which would break package feeds from (0=
:8-r0.3 to 0:8-r0.0) [version-going-backwards]</pre><pre style=3D"box-sizin=
g:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margi=
n-bottom:0px">...skip 44056 lines...</pre><pre style=3D"box-sizing:border-b=
ox;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0=
px"><pre id=3D"gmail-out" class=3D"gmail-console-output" style=3D"box-sizin=
g:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margi=
n-bottom:0px"><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word=
-wrap:break-word;margin-top:0px;margin-bottom:0px">zsh-5.3.1: Package versi=
on for package zsh went backwards which would break package feeds from (0:5=
.3.1-r0.3 to 0:5.3.1-r0.0) [version-going-backwards]


count: 2	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-gl-es.iso-8859-1/=
usr/lib/locale/gl_ES.ISO-8859-1/LC_CTYPE is owned by uid 3004, which is the=
 same as the user running bitbake. This may be due to host contamination [h=
ost-user-contaminated]
libqofono-0.87+gitrAUTOINC+54435de3be: libqofono: /libqofono-tests/usr/lib/=
libqofono-qt5/tests/tst_qofonocellbroadcast is owned by uid 3004, which is =
the same as the user running bitbake. This may be due to host contamination=
 [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px"></pre><pre style=3D"box-sizing:b=
order-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px">count: 0	issue: ldflags


</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 0	issue: compile-host-pat=
h



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
2a78c2d siggen: Add reset to SignatureGenerator
not included in master yet:=20
72ae1b2 world-image: add extra target
87ac37a fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
811edd9 selftest/prservice: Adapt to BB_SERVER_TIMEOUT
not included in master yet:=20
c14576a report-error: Allow to upload reports automatically
910bca2 buildhistory.bbclass: metadata-revs show repo parent
686d9d9 metadata-revs: provide more information
9e73365 qemux86: Add identical qemux86copy variant for tests
59e8b83 reproducible_build.bbclass: initial support for binary reproducibil=
ity
95652fb cpio: provide cpio-replacement-native
3b23ef6 image_types.bbclass: improve cpio image reproducibility
bf38798 rootfs-postcommands.bbclass: support binary reproducibility
7eeda32 insane.bbclass: write QA issues to log file only when they are in E=
RROR_QA or WARN_QA
061d137 sstate.bbclass: Do not cause build failures due to setscene errors

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
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
ed9cb27 iscsitarget: Fix kernel with new 4.12+ kernel
2e70823 postfix: Fix build with security flags and clang
f45593d openhpi: Fix build with clang+c++11
3ec9d31 openhpi: Fix ptest compile failures due to narrowing warnings with =
clang
0fa6136 tcpreplay: upgrade to 4.2.6
2ec0aa6 tftp-hpa: Fix PIE build with clang
968836a samba: 4.6.5 -&gt; 4.6.7
43e4a8c wolfssl: upgrade to 3.12.0
6af98c4 netperf: upgrade to 2.7.0+ with git version
cc5e1a4 json-spirit: link to libatomic
df870b0 librcf: link to libatomic
48c49f5 ntop: Fix build with musl
a67034e corosync: Fix build with musl
0852b86 netkit-rwho: Fix build with musl
0d251e8 netkit-tftp: Fix build with musl
6010fc1 serial-forward: Fix build with hardening+musl
9337155 gsoap: Fix build with musl
7cc1044 libpwquality: fix do_qa_configure issue
2d08073 drbd-utils: only rmmod if DRBD is a module
b7b7c81 libgphoto2: Copy <a href=3D"http://Makefile.in.in">Makefile.in.in</=
a> from gettext-native
51f6429 lxdm: Copy <a href=3D"http://Makefile.in.in">Makefile.in.in</a> fro=
m gettext-native

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
2684299 qtwebengine: add patch for long paths
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet:=20
</pre><div><br></div></pre></pre></pre></div>

--001a114411b6f95f780558436394--
