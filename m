Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f173.google.com (mail-yb0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4E21877E0D;
	Mon, 17 Jul 2017 15:49:31 +0000 (UTC)
Received: by mail-yb0-f173.google.com with SMTP id k7so8960090ybj.3;
	Mon, 17 Jul 2017 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=15mdsqOqC2LMGo2AvDoT7KUPthVVCGszEaoWj1h3Cz8=;
	b=bj4kKenj/TutTkm5cDiLwTD2dfuTuze4y4GbBDoMZGLo7nqu6vjwFo7n7TcCISrtH6
	wgBFej2fLrfLMK9HjbKOcHYEWMWEyXVxzDKmJTEXOKb+uJPLBCsskjS51pQmgF7nvIXL
	a0U0QDiqa6kKbTIOlLXGlskoKlqmn8xZhwfKAijGRH4VrFL1dUsu0IRW8S138hvLM61R
	237zTZA5wIyyexgvLJhouPxYyT/zgIviiRT2SoNwpT8rQVZJmW96BYdg9YPQXg2j4kSA
	JNF9gfLyIcXdL0cgNOMPkTe/ddBX6XvxGP5W+V9fsqAcMYw5hgaFezWJknk5EFakWIRi
	oUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=15mdsqOqC2LMGo2AvDoT7KUPthVVCGszEaoWj1h3Cz8=;
	b=jAQL4Ugr/0IiA88BouLL47q8BKNrqtKIeWpWDaBdizaZKpoMfmrLdKXziaezwyeDtx
	hd9/JnzlX6NTLM0CqswKCHw/NbRbr7TXyIe4DVqQ0KoVOsA6vACwPyxleWALQav1otVf
	fnAs+mxMPXaDW7aF8huT3AghFptxLGSXXtPGOnL1K7nBizupgTyjumhZqixF0RVvgxBX
	z6CANVEeded9I1Ey3+IwAaWMuoyicRwpxSPmWO8FTcAIv2ZIGY4WB2vAL9P1T3VBUqF2
	O187S9B+0kdY4K3vu3+SB4od2iDKg8m8Zic+1Kc0eQwxITS9shtcnjjlgNrw8O0UeEOn
	JOdQ==
X-Gm-Message-State: AIVw113XwzHE5swpuM0aXrjg215LX/iDICpszqaHOOpX3iJ+O9Dz2jVj
	0tnE7BhB3oiGltFimuMvEgLCWIqVboZ5
X-Received: by 10.37.74.133 with SMTP id x127mr17289732yba.69.1500306572647;
	Mon, 17 Jul 2017 08:49:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Mon, 17 Jul 2017 08:49:32 -0700 (PDT)
In-Reply-To: <20170717103941.GA3679@jama>
References: <20170717103941.GA3679@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Jul 2017 17:49:32 +0200
Message-ID: <CA+chaQd6=GxCaYe1d4BO_yJM4myTkYmJu-EWG8vDB++BxfMT7Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-07-16
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
X-List-Received-Date: Mon, 17 Jul 2017 15:49:33 -0000
Content-Type: multipart/alternative; boundary="001a113e8f90512c4805548558be"

--001a113e8f90512c4805548558be
Content-Type: text/plain; charset="UTF-8"

The v2s of those patches really helped:

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!|Signatures		
!!colspan='14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||
|-
||2017-07-17	||5	||4	||4	||0	||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-07-17 ==

INFO: jenkins-job.sh-1.8.25 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170717_054804.log

=== common (4) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/ippool/ippool_1.3.bb:do_compile
    * meta-webos-ports/meta-luneui/recipes-webos/pmloglib/pmloglib.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (1) ===
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_compile

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (13) ===
{| class=wikitable
|-
|| qemuarm 	|| 5	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170717_011149.log/
|| http://errors.yoctoproject.org/Errors/Build/41271/
|-
|| qemux86 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170717_011149.log/
|| http://errors.yoctoproject.org/Errors/Build/41272/
|-
|| qemux86_64 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170717_031905.log/
|| http://errors.yoctoproject.org/Errors/Build/41273/
|}

=== PNBLACKLISTs (14) ===

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

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170717_031354.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode]
?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon]
?= "BROKEN: not compatible with newer vala,
http://errors.yoctoproject.org/Errors/Details/143058/"
meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?=
"Not compatible with gcc7 - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACKLIST[luna-webappmanager]
?= "BROKEN: needs to be adapted to new qt-5.7"
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]
?= "BROKEN: needs to be adapted to new qtwayland-5.7"
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
4a14b44 knotty: Drop task prefix of PLAIN log messages
not included in master yet:
dda3a10 world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
b1c4661 libiconv: remove 0001-Fix-link-error-when-compiling-with-gcc-O0.patch
not included in master yet:
ae75724 icecc.bbclass: prevent nativesdk builds depending on target
specific KERNEL_CC
4c28728 report-error: Allow to upload reports automatically
205c547 buildhistory.bbclass: metadata-revs show repo parent
ef06cb2 metadata-revs: provide more information
4cdff2b qemux86: Add identical qemux86copy variant for tests
617ef4f valgrind: fix link failure with gold

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
1cbd1bc unionfs-fuse: 0.26 -> 2.0
not included in master yet:
c6d4c7a dnsmasq: disable the service by default
ba5e474 rdate: Fix build with hardening
cb4a014 strongswan: Include stdint.h for uintptr_t
046d96d netkit-rpc: Fix build with hardening flags
caf0d05 netkit-telnet: Fix build with hardening
933f271 ncftp: Upgrade to 3.2.6
31642e1 ippool: Fix build errors found with hardening flags
7728c8f autofs: Add build dependency on libnsl2
e4a0edd openhpi: Fix build on 64bit platforms e.g. aarch64
d6b2593 security_flags.inc: Delete
98a8830 pptp-linux: Upgrade to 1.9.0
39176bd ebtables: replace ebtables-save perl script with bash rewrite
80a8634 librcf: RDEPENDS on protobuf, json-spirit
bbb9286 fuse: Correct runlevels and startup order
1483a97 recipes-utils: Add recipe for udevil
d50395e klibc: Fix build issue when default ISA is not thumb
852412e libteam: Upgrade to 1.27
cebae2c sox: Fix build with musl
4b4a68f webrtc-audio-processing: Link with libexecinfo on musl
4c56033 cdparanoia: Fix build with musl
a8481ce lightmediascanner: Define comparison_fn_t if undefined
ab4314a lmbench: Fix build with musl
daab2b9 xfce4-netload-plugin: Do not include sys/sysctl.h
5a30d20 imsettings: Fix build with musl
0206352 gedit: Define ACCESSPERMS if not defined already
8fd8bc8 onboard: Fix build with musl
43ad720 libgtop: Fix build with musl
ea840c2 netdata: Upgrade to 1.6.0
14d749f can-utils: Update to tip of master
1c46c71 kexec-tools-klibc: Fix build with musl
b75b17c dracut: Upgrade to 045
ae7ac67 yaffs2-utils: Fix build with musl
82650e1 logfsprogs: Rename setkey API to _setkey to not conflict with libc
e060cf2 unionfs-fuse: Fix build with musl
a764ec3 xfsdump: Fix build with musl
d0ea52a nmon: Upgrade to 16g
bbac8d6 metacity: Fix build with musl by defining _GNU_SOURCE
ba84876 monkey: Link in libexecinfo on musl
fdb7abc aufs-util: Upgrade to 4.4 release
872870c uftrace: add recipe
991233a iperf3: Fix missing stdint.h and do not link with -pg
77817c3 v4l-utils: Fix build with musl
065575a pimd: Upgrade to 2.3.2
dd6c1d7 recipes: remove blacklisted recipes

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault
not included in master yet:
2afd1b7 maliit-framework-qt5: Always have optimize flags
92c634e qt5-creator: Fix build with NO_ACCESSIBILITY
d69be5d qtwebengine: Fix build on musl
e1027a5 qtvirtualkeyboard: Include sys/time.h
045e39b qt5-creator: Link with libexecinfo on musl

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
6c063d6 Merge pull request #53 from kraj/kraj/master
not included in master yet:
8ca260e gnome-settings-daemon: remove the bbappend for removed recipe

== Tested changes (not included in master yet) - meta-webos-ports ==
latest upstream commit:
2186458 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:

== Tested changes (not included in master yet) - meta-smartphone ==
latest upstream commit:
1fe2b3b android-system-image-tenderloin: update Android image
not included in master yet:
2bc4aaf meta-shr, meta-fso: remove blacklisted recipes



On Mon, Jul 17, 2017 at 12:39 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> This time with conf/distro/include/security_flags.inc included as
> requested by Khem
>
> systemd-bootchart is broken since glibc upgrade, Khem already suggested
> the fix, hopefully Chen Qi or someone else will fix it soon.
>
> nmon is broken even without security_flags.inc but v2 from Khem looks
> like it should fix it.
>
> There is also v2 for metacity and monkey in master-next now, so hopefully
> next build will be a bit better again.
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date               !!colspan='3'|Failed tasks
>  !!|Signatures                 !!colspan='14'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||all
>  ||already-stripped      ||libdir        ||textrel       ||build-deps
> ||file-rdeps    ||version-going-backwards       ||host-user-contaminated
>     ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||ldflags
>      ||compile-host-path     ||
> |-
> ||2017-07-16    ||8     ||6     ||7     ||0     ||0             ||1
>      ||4             ||0             ||0             ||0             ||0
>          ||0             ||0             ||0             ||0
>  ||0             ||0             ||0             ||
> |}
>
> == Failed tasks 2017-07-16 ==
>
> INFO: jenkins-job.sh-1.8.25 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> report.20170717_002720.log
>
> === common (6) ===
>     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
>     * meta-openembedded/meta-gnome/recipes-gnome/metacity/
> metacity_2.34.13.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/
> ippool/ippool_1.3.bb:do_compile
>     * meta-openembedded/meta-webserver/recipes-httpd/
> monkey/monkey_1.5.6.bb:do_compile
>     * meta-webos-ports/meta-luneui/recipes-webos/pmloglib/pmloglib.bb:
> do_compile
>     * openembedded-core/meta/recipes-devtools/systemd-
> bootchart/systemd-bootchart_231.bb:do_compile
>
> === common-x86 (0) ===
>
> === qemuarm (2) ===
>     * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:
> do_compile
>     * meta-openembedded/meta-oe/recipes-support/nmon/nmon_16g.
> bb:do_compile
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (21) ===
> {| class=wikitable
> |-
> || qemuarm      || 8     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/rocko/log.world.qemuarm.20170714_122654.log/ ||
> http://errors.yoctoproject.org/Errors/Build/41265/
> |-
> || qemux86      || 6     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/rocko/log.world.qemux86.20170714_122654.log/ ||
> http://errors.yoctoproject.org/Errors/Build/41266/
> |-
> || qemux86_64   || 7     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/rocko/log.world.qemux86-64.20170716_100826.log/ ||
> http://errors.yoctoproject.org/Errors/Build/41270/
> |}
>
> === PNBLACKLISTs (14) ===
>
> === QA issues (5) ===
> {| class=wikitable
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
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||unknown-configure-option
> |-
> ||0     ||version-going-backwards
> |-
> ||1     ||libdir
> |-
> ||4     ||textrel
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> signatures.20170715_102407.log/
>
> No issues detected
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:
> PNBLACKLIST[lksctp-tools] ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:
> PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in
> DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130607/ - the recipe will be removed on 2017-09-01
> unless the issue is fixed"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:
> PNBLACKLIST[xf86-video-geode] ?= "BROKEN, fails to build - the recipe
> will be removed on 2017-09-01 unless the issue is fixed"
> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon]
> ?= "BROKEN: not compatible with newer vala, http://errors.yoctoproject.
> org/Errors/Details/143058/"
> meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?= "Not
> compatible with gcc7 - the recipe will be removed on 2017-09-01 unless the
> issue is fixed"
> meta-webos-ports:
> meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:
> PNBLACKLIST[luna-webappmanager] ?= "BROKEN: needs to be adapted to new
> qt-5.7"
> meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]
> ?= "BROKEN: needs to be adapted to new qtwayland-5.7"
> PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
> which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> directory in /home/builder/poky :/"
>
>
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 1        issue: libdir
> qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:
> /usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]
>
>
> count: 4        issue: textrel
> chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/
> chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
> has relocations in .text [textrel]
> chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/
> chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
> has relocations in .text [textrel]
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-
> r0/packages-split/x264-bin/usr/bin/x264' has relocations in .text
> [textrel]
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-
> r0/packages-split/x264/usr/lib/libx264.so.148' has relocations in .text
> [textrel]
>
>
> count: 0        issue: build-deps
>
>
> count: 0        issue: file-rdeps
>
>
> count: 0        issue: version-going-backwards
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
> == Tested changes (not included in master yet) - bitbake ==
> latest upstream commit:
> 4a14b44 knotty: Drop task prefix of PLAIN log messages
> not included in master yet:
> dda3a10 world-image: add extra target
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> b1c4661 libiconv: remove 0001-Fix-link-error-when-
> compiling-with-gcc-O0.patch
> not included in master yet:
> ae75724 icecc.bbclass: prevent nativesdk builds depending on target
> specific KERNEL_CC
> 4c28728 report-error: Allow to upload reports automatically
> 205c547 buildhistory.bbclass: metadata-revs show repo parent
> ef06cb2 metadata-revs: provide more information
> 4cdff2b qemux86: Add identical qemux86copy variant for tests
> 617ef4f valgrind: fix link failure with gold
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> 1cbd1bc unionfs-fuse: 0.26 -> 2.0
> not included in master yet:
> c6d4c7a dnsmasq: disable the service by default
> ba5e474 rdate: Fix build with hardening
> cb4a014 strongswan: Include stdint.h for uintptr_t
> 046d96d netkit-rpc: Fix build with hardening flags
> caf0d05 netkit-telnet: Fix build with hardening
> 933f271 ncftp: Upgrade to 3.2.6
> 31642e1 ippool: Fix build errors found with hardening flags
> 7728c8f autofs: Add build dependency on libnsl2
> e4a0edd openhpi: Fix build on 64bit platforms e.g. aarch64
> d6b2593 security_flags.inc: Delete
> 98a8830 pptp-linux: Upgrade to 1.9.0
> 39176bd ebtables: replace ebtables-save perl script with bash rewrite
> 80a8634 librcf: RDEPENDS on protobuf, json-spirit
> bbb9286 fuse: Correct runlevels and startup order
> 1483a97 recipes-utils: Add recipe for udevil
> d50395e klibc: Fix build issue when default ISA is not thumb
> 852412e libteam: Upgrade to 1.27
> cebae2c sox: Fix build with musl
> 4b4a68f webrtc-audio-processing: Link with libexecinfo on musl
> 4c56033 cdparanoia: Fix build with musl
> a8481ce lightmediascanner: Define comparison_fn_t if undefined
> ab4314a lmbench: Fix build with musl
> daab2b9 xfce4-netload-plugin: Do not include sys/sysctl.h
> 5a30d20 imsettings: Fix build with musl
> 0206352 gedit: Define ACCESSPERMS if not defined already
> 8fd8bc8 onboard: Fix build with musl
> 43ad720 libgtop: Fix build with musl
> ea840c2 netdata: Upgrade to 1.6.0
> 14d749f can-utils: Update to tip of master
> 1c46c71 kexec-tools-klibc: Fix build with musl
> b75b17c dracut: Upgrade to 045
> ae7ac67 yaffs2-utils: Fix build with musl
> 82650e1 logfsprogs: Rename setkey API to _setkey to not conflict with libc
> e060cf2 unionfs-fuse: Fix build with musl
> a764ec3 xfsdump: Fix build with musl
> 1c5c8e8 nmon: Upgrade to 16g
> 5d80364 metacity: Fix build with musl
> 9d50570 monkey: Link in libexecinfo on musl
> fcee6e9 aufs-util: Upgrade to 4.4 release
> ad0c2dc recipes: remove blacklisted recipes
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault
> not included in master yet:
> 2afd1b7 maliit-framework-qt5: Always have optimize flags
> 92c634e qt5-creator: Fix build with NO_ACCESSIBILITY
> d69be5d qtwebengine: Fix build on musl
> e1027a5 qtvirtualkeyboard: Include sys/time.h
> 045e39b qt5-creator: Link with libexecinfo on musl
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> 6c063d6 Merge pull request #53 from kraj/kraj/master
> not included in master yet:
> 8ca260e gnome-settings-daemon: remove the bbappend for removed recipe
>
> == Tested changes (not included in master yet) - meta-webos-ports ==
> latest upstream commit:
> 2186458 packagegroup-luneos-extended: drop qtscenegraph-adaptation
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-smartphone ==
> latest upstream commit:
> bbeb2c2 linux-hp-tenderloin: bump  SRCREV
> not included in master yet:
> 7fd4215 meta-shr, meta-fso: remove blacklisted recipes
>

--001a113e8f90512c4805548558be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The v2s of those patches really helped:<div><br></div><div=
><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-w=
ord;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><a=
 href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" style=3D"bo=
x-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://www.o=
penembedded.org/wiki/Bitbake_World_Status</a>

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
||2017-07-17	||5	||4	||4	||0	||0		||0		||0		||0		||0		||0		||0		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-07-17 =3D=3D

INFO: jenkins-job.sh-1.8.25 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170717_054804.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170717_054=
804.log</a>

=3D=3D=3D common (4) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/ippool/ippool_1.3.b=
b:do_compile
    * meta-webos-ports/meta-luneui/recipes-webos/pmloglib/pmloglib.bb:do_co=
mpile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-boo=
tchart_231.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_=
compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (13) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 5	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170717_011149.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170717_011149.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/41271/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/41271/</a>
|-
|| qemux86 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170717_011149.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170717_011149.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/41272/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/41272/</a>
|-
|| qemux86_64 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170717_031905.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170717_031905.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41273/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/41273/</a>
|}

=3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D

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
ko/log.signatures.20170717_031354.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170717_031354.log/</a>

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blu=
ez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTR=
O_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#=
39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#=
39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is s=
elected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130607/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13060=
7/</a> - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D &quot;BROKEN, fails to build - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blue=
z5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO=
_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D &quot;${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5=
 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39=
;&#39;, d)}&quot;
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D &quot;${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5=
 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39=
;&#39;, d)}&quot;
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;=
, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATUR=
ES&#39;, &#39;&#39;, d)}&quot;
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon] ?=
=3D &quot;BROKEN: not compatible with newer vala, <a href=3D"http://errors.=
yoctoproject.org/Errors/Details/143058/" style=3D"box-sizing:border-box;wor=
d-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Erro=
rs/Details/143058/</a>&quot;
meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?=3D &quo=
t;Not compatible with gcc7 - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed&quot;
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACK=
LIST[luna-webappmanager] ?=3D &quot;BROKEN: needs to be adapted to new qt-5=
.7&quot;
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
=3D &quot;BROKEN: needs to be adapted to new qtwayland-5.7&quot;
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
4a14b44 knotty: Drop task prefix of PLAIN log messages
not included in master yet:=20
dda3a10 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
b1c4661 libiconv: remove 0001-Fix-link-error-when-compiling-with-gcc-O0.pat=
ch
not included in master yet:=20
ae75724 icecc.bbclass: prevent nativesdk builds depending on target specifi=
c KERNEL_CC
4c28728 report-error: Allow to upload reports automatically
205c547 buildhistory.bbclass: metadata-revs show repo parent
ef06cb2 metadata-revs: provide more information
4cdff2b qemux86: Add identical qemux86copy variant for tests
617ef4f valgrind: fix link failure with gold

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
1cbd1bc unionfs-fuse: 0.26 -&gt; 2.0
not included in master yet:=20
c6d4c7a dnsmasq: disable the service by default
ba5e474 rdate: Fix build with hardening
cb4a014 strongswan: Include stdint.h for uintptr_t
046d96d netkit-rpc: Fix build with hardening flags
caf0d05 netkit-telnet: Fix build with hardening
933f271 ncftp: Upgrade to 3.2.6
31642e1 ippool: Fix build errors found with hardening flags
7728c8f autofs: Add build dependency on libnsl2
e4a0edd openhpi: Fix build on 64bit platforms e.g. aarch64
d6b2593 security_flags.inc: Delete
98a8830 pptp-linux: Upgrade to 1.9.0
39176bd ebtables: replace ebtables-save perl script with bash rewrite
80a8634 librcf: RDEPENDS on protobuf, json-spirit
bbb9286 fuse: Correct runlevels and startup order
1483a97 recipes-utils: Add recipe for udevil
d50395e klibc: Fix build issue when default ISA is not thumb
852412e libteam: Upgrade to 1.27
cebae2c sox: Fix build with musl
4b4a68f webrtc-audio-processing: Link with libexecinfo on musl
4c56033 cdparanoia: Fix build with musl
a8481ce lightmediascanner: Define comparison_fn_t if undefined
ab4314a lmbench: Fix build with musl
daab2b9 xfce4-netload-plugin: Do not include sys/sysctl.h
5a30d20 imsettings: Fix build with musl
0206352 gedit: Define ACCESSPERMS if not defined already
8fd8bc8 onboard: Fix build with musl
43ad720 libgtop: Fix build with musl
ea840c2 netdata: Upgrade to 1.6.0
14d749f can-utils: Update to tip of master
1c46c71 kexec-tools-klibc: Fix build with musl
b75b17c dracut: Upgrade to 045
ae7ac67 yaffs2-utils: Fix build with musl
82650e1 logfsprogs: Rename setkey API to _setkey to not conflict with libc
e060cf2 unionfs-fuse: Fix build with musl
a764ec3 xfsdump: Fix build with musl
d0ea52a nmon: Upgrade to 16g
bbac8d6 metacity: Fix build with musl by defining _GNU_SOURCE
ba84876 monkey: Link in libexecinfo on musl
fdb7abc aufs-util: Upgrade to 4.4 release
872870c uftrace: add recipe
991233a iperf3: Fix missing stdint.h and do not link with -pg
77817c3 v4l-utils: Fix build with musl
065575a pimd: Upgrade to 2.3.2
dd6c1d7 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault
not included in master yet:=20
2afd1b7 maliit-framework-qt5: Always have optimize flags
92c634e qt5-creator: Fix build with NO_ACCESSIBILITY
d69be5d qtwebengine: Fix build on musl
e1027a5 qtvirtualkeyboard: Include sys/time.h
045e39b qt5-creator: Link with libexecinfo on musl

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
6c063d6 Merge pull request #53 from kraj/kraj/master
not included in master yet:=20
8ca260e gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
latest upstream commit:=20
2186458 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
1fe2b3b android-system-image-tenderloin: update Android image
not included in master yet:=20
2bc4aaf meta-shr, meta-fso: remove blacklisted recipes
</pre></div><div><br></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Mon, Jul 17, 2017 at 12:39 PM, Martin Jansa <span dir=
=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">ma=
rtin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">This time with conf/distro/include/security_<wbr>flags.inc included as<br=
>
requested by Khem<br>
<br>
systemd-bootchart is broken since glibc upgrade, Khem already suggested<br>
the fix, hopefully Chen Qi or someone else will fix it soon.<br>
<br>
nmon is broken even without security_flags.inc but v2 from Khem looks<br>
like it should fix it.<br>
<br>
There is also v2 for metacity and monkey in master-next now, so hopefully<b=
r>
next build will be a bit better again.<br>
<br>
<a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" rel=3D"no=
referrer" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/Bitbake_W=
orld_Status</a><br>
<br>
=3D=3D Number of issues - stats =3D=3D<br>
{| class=3D&#39;wikitable&#39;<br>
!|Date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#=
39;3&#39;|Failed tasks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0!!|Signatures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#39;14&#39;|QA !!Comment<br>
|-<br>
||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||qemuarm=C2=A0 =C2=A0 =
=C2=A0 =C2=A0||qemux86=C2=A0 =C2=A0 =C2=A0 =C2=A0||qemux86_64=C2=A0 =C2=A0 =
||all=C2=A0 =C2=A0||already-stripped=C2=A0 =C2=A0 =C2=A0 ||libdir=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ||textrel=C2=A0 =C2=A0 =C2=A0 =C2=A0||build-deps=C2=A0 =
=C2=A0 ||file-rdeps=C2=A0 =C2=A0 ||version-going-backwards=C2=A0 =C2=A0 =C2=
=A0 =C2=A0||host-user-contaminated=C2=A0 =C2=A0 =C2=A0 =C2=A0 ||installed-v=
s-shipped=C2=A0 ||unknown-configure-option=C2=A0 =C2=A0 =C2=A0 ||symlink-to=
-sysroot=C2=A0 =C2=A0 ||invalid-pkgconfig=C2=A0 =C2=A0 =C2=A0||pkgname=C2=
=A0 =C2=A0 =C2=A0 =C2=A0||ldflags=C2=A0 =C2=A0 =C2=A0 =C2=A0||compile-host-=
path=C2=A0 =C2=A0 =C2=A0||<br>
|-<br>
||2017-07-16=C2=A0 =C2=A0 ||8=C2=A0 =C2=A0 =C2=A0||6=C2=A0 =C2=A0 =C2=A0||7=
=C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0||1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||4=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0||<br>
|}<br>
<br>
=3D=3D Failed tasks 2017-07-16 =3D=3D<br>
<br>
INFO: jenkins-job.sh-1.8.25 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170717_002720.log" =
rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/<wbr>build=
logs/oe/world/rocko/log.<wbr>report.20170717_002720.log</a><br>
<br>
=3D=3D=3D common (6) =3D=3D=3D<br>
=C2=A0 =C2=A0 * meta-browser/recipes-mozilla/<wbr>firefox/firefox_45.9.0esr=
.bb:d<wbr>o_compile<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-gnome/<wbr>recipes-gnome/metacity/<w=
br>metacity_2.34.13.bb:do_compile<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-<wbr>networking/recipes-daemons/<wbr=
>ippool/ippool_1.3.bb:do_<wbr>compile<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-<wbr>webserver/recipes-httpd/<wbr>mo=
nkey/monkey_1.5.6.bb:do_<wbr>compile<br>
=C2=A0 =C2=A0 * meta-webos-ports/meta-luneui/<wbr>recipes-webos/pmloglib/<w=
br>pmloglib.bb:do_compile<br>
=C2=A0 =C2=A0 * openembedded-core/meta/<wbr>recipes-devtools/systemd-<wbr>b=
ootchart/systemd-bootchart_<wbr>231.bb:do_compile<br>
<br>
=3D=3D=3D common-x86 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemuarm (2) =3D=3D=3D<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-oe/<wbr>recipes-support/mysql/mariad=
b_<wbr>5.5.55.bb:do_compile<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-oe/<wbr>recipes-support/nmon/nmon_16=
g.<wbr>bb:do_compile<br>
<br>
=3D=3D=3D qemux86 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemux86_64 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D Number of failed tasks (21) =3D=3D=3D<br>
{| class=3Dwikitable<br>
|-<br>
|| qemuarm=C2=A0 =C2=A0 =C2=A0 || 8=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170714_1=
22654.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.or=
g/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemuarm.20170714_122654.<wbr=
>log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41265/"=
 rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/E=
rrors/Build/41265/</a><br>
|-<br>
|| qemux86=C2=A0 =C2=A0 =C2=A0 || 6=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170714_1=
22654.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.or=
g/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemux86.20170714_122654.<wbr=
>log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41266/"=
 rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/E=
rrors/Build/41266/</a><br>
|-<br>
|| qemux86_64=C2=A0 =C2=A0|| 7=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170716_100=
826.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/=
<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemux86-64.20170716_<wbr>10082=
6.log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41270/=
" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/=
Errors/Build/41270/</a><br>
|}<br>
<br>
=3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D<br>
<br>
=3D=3D=3D QA issues (5) =3D=3D=3D<br>
{| class=3Dwikitable<br>
!| Count=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||Issue<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||already-stripped<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||build-deps<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||compile-host-path<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||file-rdeps<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||host-user-contaminated<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||installed-vs-shipped<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||invalid-pkgconfig<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||ldflags<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||pkgname<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||symlink-to-sysroot<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||unknown-configure-option<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||version-going-backwards<br>
|-<br>
||1=C2=A0 =C2=A0 =C2=A0||libdir<br>
|-<br>
||4=C2=A0 =C2=A0 =C2=A0||textrel<br>
|}<br>
<br>
<br>
<br>
=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D<br>
<br>
Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170715_102407.log/" rel=3D"noreferrer" target=3D"_blank=
">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>signat=
ures.20170715_102407.<wbr>log/</a><br>
<br>
No issues detected<br>
<br>
<br>
PNBLACKLISTs:<br>
openembedded-core/:<br>
meta-browser:<br>
meta-openembedded:<br>
meta-networking/recipes-<wbr>support/lksctp-tools/lksctp-<wbr>tools_1.0.17.=
bb:PNBLACKLIST[<wbr>lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DIST=
RO_<wbr>FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link ag=
ainst sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;<br>
meta-oe/recipes-connectivity/<wbr>bluez/bluez-hcidump_2.5.bb:PNB<wbr>LACKLI=
ST[bluez-hcidump] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES=
&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is se=
lected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-oe/recipes-connectivity/<wbr>bluez/bluez4_4.101.bb:PNBLACKL<wbr>IST[bl=
uez4] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;=
bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DI=
STRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-oe/recipes-connectivity/<wbr>bluez/gst-plugin-bluetooth_4.<wbr>101.bb:=
PNBLACKLIST[gst-plugin-<wbr>bluetooth] ?=3D &quot;${@bb.utils.contains(&#39=
;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bl=
uez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<=
br>
meta-oe/recipes-graphics/<wbr>libsexy/libsexy_0.1.11.bb:PNBL<wbr>ACKLIST[li=
bsexy] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctopro=
ject.org/Errors/Details/130607/" rel=3D"noreferrer" target=3D"_blank">http:=
//errors.yoctoproject.<wbr>org/Errors/Details/130607/</a> - the recipe will=
 be removed on 2017-09-01 unless the issue is fixed&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>driver/xf86-video-geode_2.11.<wbr>16.bb:=
PNBLACKLIST[xf86-video-<wbr>geode] ?=3D &quot;BROKEN, fails to build - the =
recipe will be removed on 2017-09-01 unless the issue is fixed&quot;<br>
meta-oe/recipes-navigation/<wbr>foxtrotgps/foxtrotgps_1.1.1.<wbr>bb:PNBLACK=
LIST[foxtrotgps] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&=
#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is sel=
ected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-oe/recipes-navigation/<wbr>gypsy/gypsy.inc:PNBLACKLIST[<wbr>gypsy] ?=
=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5&=
#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FE=
ATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-oe/recipes-navigation/<wbr>navit/navit.inc:PNBLACKLIST[<wbr>navit] ?=
=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5&=
#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FE=
ATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-oe/recipes-support/<wbr>opensync/libsyncml_0.5.4.bb:PN<wbr>BLACKLIST[l=
ibsyncml] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &=
#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected i=
n DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-qt5:<br>
meta-smartphone:<br>
meta-shr/recipes-shr/3rdparty/<wbr>libsensmon_git.bb:PNBLACKLIST[<wbr>libse=
nsmon] ?=3D &quot;BROKEN: not compatible with newer vala, <a href=3D"http:/=
/errors.yoctoproject.org/Errors/Details/143058/" rel=3D"noreferrer" target=
=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/143058/</a>&=
quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>omhacks_git.bb:PNBLACKLIST[<wbr>omhacks]=
 ?=3D &quot;Not compatible with gcc7 - the recipe will be removed on 2017-0=
9-01 unless the issue is fixed&quot;<br>
meta-webos-ports:<br>
meta-luneos/recipes-luneos/<wbr>luna-webappmanager/luna-<wbr>webappmanager.=
bb:PNBLACKLIST[<wbr>luna-webappmanager] ?=3D &quot;BROKEN: needs to be adap=
ted to new qt-5.7&quot;<br>
meta-luneui/recipes-luneui/<wbr>luna-next/luna-next.bb:PNBLACK<wbr>LIST[lun=
a-next] ?=3D &quot;BROKEN: needs to be adapted to new qtwayland-5.7&quot;<b=
r>
PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtualiazat=
ion which isn&#39;t included in my world builds&quot;<br>
PNBLACKLIST[bigbuckbunny-<wbr>1080p] =3D &quot;big and doesn&#39;t really n=
eed to be tested so much&quot;<br>
PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;<br>
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;<br>
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;<br>
PNBLACKLIST[tearsofsteel-<wbr>1080p] =3D &quot;big and doesn&#39;t really n=
eed to be tested so much&quot;<br>
PNBLACKLIST[build-appliance-<wbr>image] =3D &quot;tries to include whole do=
wnloads directory in /home/builder/poky :/&quot;<br>
<br>
<br>
QA issues by type:<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: already-stripped<br>
<br>
<br>
count: 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: libdir<br>
qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location: /usr/plugins/d=
esigner/.debug/<wbr>libqwt_designer_plugin.so [libdir]<br>
<br>
<br>
count: 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: textrel<br>
chromium-54.0.2810.2: ELF binary &#39;/tmp/work/i586-oe-linux/<wbr>chromium=
/54.0.2810.2-r0/<wbr>packages-split/chromium/usr/<wbr>bin/chromium/chrome&#=
39; has relocations in .text [textrel]<br>
chromium-wayland-53.0.2785.<wbr>143: ELF binary &#39;/tmp/work/i586-oe-linu=
x/<wbr>chromium-wayland/53.0.2785.<wbr>143-r0/packages-split/<wbr>chromium-=
wayland/usr/bin/<wbr>chromium/chrome&#39; has relocations in .text [textrel=
]<br>
x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-li=
nux/x264/<wbr>r2731+gitAUTOINC+2b741f81e5-<wbr>r0/packages-split/x264-bin/<=
wbr>usr/bin/x264&#39; has relocations in .text [textrel]<br>
x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-li=
nux/x264/<wbr>r2731+gitAUTOINC+2b741f81e5-<wbr>r0/packages-split/x264/usr/<=
wbr>lib/libx264.so.148&#39; has relocations in .text [textrel]<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: build-deps<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: file-rdeps<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: version-going-backwards<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: host-user-contaminated<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: installed-vs-shipped<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: unknown-configure-option<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: symlink-to-sysroot<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: invalid-pkgconfig<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: pkgname<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: ldflags<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: compile-host-path<br>
<br>
<br>
<br>
=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D<br>
latest upstream commit:<br>
4a14b44 knotty: Drop task prefix of PLAIN log messages<br>
not included in master yet:<br>
dda3a10 world-image: add extra target<br>
<br>
=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D<br>
latest upstream commit:<br>
b1c4661 libiconv: remove 0001-Fix-link-error-when-<wbr>compiling-with-gcc-O=
0.patch<br>
not included in master yet:<br>
ae75724 icecc.bbclass: prevent nativesdk builds depending on target specifi=
c KERNEL_CC<br>
4c28728 report-error: Allow to upload reports automatically<br>
205c547 buildhistory.bbclass: metadata-revs show repo parent<br>
ef06cb2 metadata-revs: provide more information<br>
4cdff2b qemux86: Add identical qemux86copy variant for tests<br>
617ef4f valgrind: fix link failure with gold<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D<br>
latest upstream commit:<br>
1cbd1bc unionfs-fuse: 0.26 -&gt; 2.0<br>
not included in master yet:<br>
c6d4c7a dnsmasq: disable the service by default<br>
ba5e474 rdate: Fix build with hardening<br>
cb4a014 strongswan: Include stdint.h for uintptr_t<br>
046d96d netkit-rpc: Fix build with hardening flags<br>
caf0d05 netkit-telnet: Fix build with hardening<br>
933f271 ncftp: Upgrade to 3.2.6<br>
31642e1 ippool: Fix build errors found with hardening flags<br>
7728c8f autofs: Add build dependency on libnsl2<br>
e4a0edd openhpi: Fix build on 64bit platforms e.g. aarch64<br>
d6b2593 security_flags.inc: Delete<br>
98a8830 pptp-linux: Upgrade to 1.9.0<br>
39176bd ebtables: replace ebtables-save perl script with bash rewrite<br>
80a8634 librcf: RDEPENDS on protobuf, json-spirit<br>
bbb9286 fuse: Correct runlevels and startup order<br>
1483a97 recipes-utils: Add recipe for udevil<br>
d50395e klibc: Fix build issue when default ISA is not thumb<br>
852412e libteam: Upgrade to 1.27<br>
cebae2c sox: Fix build with musl<br>
4b4a68f webrtc-audio-processing: Link with libexecinfo on musl<br>
4c56033 cdparanoia: Fix build with musl<br>
a8481ce lightmediascanner: Define comparison_fn_t if undefined<br>
ab4314a lmbench: Fix build with musl<br>
daab2b9 xfce4-netload-plugin: Do not include sys/sysctl.h<br>
5a30d20 imsettings: Fix build with musl<br>
0206352 gedit: Define ACCESSPERMS if not defined already<br>
8fd8bc8 onboard: Fix build with musl<br>
43ad720 libgtop: Fix build with musl<br>
ea840c2 netdata: Upgrade to 1.6.0<br>
14d749f can-utils: Update to tip of master<br>
1c46c71 kexec-tools-klibc: Fix build with musl<br>
b75b17c dracut: Upgrade to 045<br>
ae7ac67 yaffs2-utils: Fix build with musl<br>
82650e1 logfsprogs: Rename setkey API to _setkey to not conflict with libc<=
br>
e060cf2 unionfs-fuse: Fix build with musl<br>
a764ec3 xfsdump: Fix build with musl<br>
1c5c8e8 nmon: Upgrade to 16g<br>
5d80364 metacity: Fix build with musl<br>
9d50570 monkey: Link in libexecinfo on musl<br>
fcee6e9 aufs-util: Upgrade to 4.4 release<br>
ad0c2dc recipes: remove blacklisted recipes<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D<br>
latest upstream commit:<br>
bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault<br>
not included in master yet:<br>
2afd1b7 maliit-framework-qt5: Always have optimize flags<br>
92c634e qt5-creator: Fix build with NO_ACCESSIBILITY<br>
d69be5d qtwebengine: Fix build on musl<br>
e1027a5 qtvirtualkeyboard: Include sys/time.h<br>
045e39b qt5-creator: Link with libexecinfo on musl<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D<br=
>
latest upstream commit:<br>
6c063d6 Merge pull request #53 from kraj/kraj/master<br>
not included in master yet:<br>
8ca260e gnome-settings-daemon: remove the bbappend for removed recipe<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D<br>
latest upstream commit:<br>
2186458 packagegroup-luneos-extended: drop qtscenegraph-adaptation<br>
not included in master yet:<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D=
<br>
latest upstream commit:<br>
bbeb2c2 linux-hp-tenderloin: bump=C2=A0 SRCREV<br>
not included in master yet:<br>
7fd4215 meta-shr, meta-fso: remove blacklisted recipes<br>
</blockquote></div><br></div>

--001a113e8f90512c4805548558be--
