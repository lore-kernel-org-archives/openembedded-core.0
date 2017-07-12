Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id F2625781F7;
	Wed, 12 Jul 2017 16:35:21 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id h22so22075777lfk.3;
	Wed, 12 Jul 2017 09:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kI6i1e3VZ2tHFpQeVEwwHzsG6mvzirGO5u2WfRe5YOc=;
	b=AA9yDWkDc4piPLGwqAP4IqQVxXracQLheoFQx79urylxZKiBMzc3eNeoE43sN5rk4A
	WUtl4tUWBzTptANhzqG5WUcw/mKc+KNt3GSlv0+ehBpqYVvfABSmlCaCIhE24dIrIFp2
	Hoof/2MEkTRfZVw+2aeRZYuOiJSClA4Th+QN4nNloBzHL7KY5GdtN3QhxYBMi2WDayXU
	myniQFzQgBbXXWElRTZTD2XlCBZOMid+FgfzYghYdh2TYmLlfOAEHsgbzUhfs4hbyJhl
	D4Jjmp0ga9QRo5mdkkcOJusz2K/kMvTf5doPhX5/e3GgsvSGLf0qfJkXp3oVLha+i3PH
	WV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kI6i1e3VZ2tHFpQeVEwwHzsG6mvzirGO5u2WfRe5YOc=;
	b=e+hH97/mtrdve7N51RmCYBE5q9JanKgc3UQi8nPuGcaRQNcMpqPZF4ifgePe86SARm
	ypW5hMK3oUaM9LzOC13oQwknjDS9o+EcWQnfgVbfjyR4xU29ah79HGOhRzSiismfaGF9
	j8T8/JnEYx6WuTMB3QHXSm0CbEjDOdo1fQz6gbJt13t2uUJi2XF356EqZt8jXQkv+Civ
	YBITZ+0fRj43/iQxTewqR5/dKSbwK1WCKjUwY9cX0DcpGrKol5tOuhURzlkhhckbmKCA
	alT7EP+64WEdL1pDj/5NSdTkBd4+RFC3pw113HdkmKtSenk/QITUXCcHgbRTZuyIKm8T
	+1rg==
X-Gm-Message-State: AIVw111S+m+6Hd4yrPDZoWk2I6za7h5M36HltsIGLWii2v85W4frTbAT
	p90SzrwTEvchSbPrrsfdkvEtIAqb/w==
X-Received: by 10.80.140.204 with SMTP id r12mr6742399edr.123.1499877322056;
	Wed, 12 Jul 2017 09:35:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Wed, 12 Jul 2017 09:34:51 -0700 (PDT)
In-Reply-To: <20170712085711.GA3061@jama>
References: <20170712085711.GA3061@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Jul 2017 09:34:51 -0700
Message-ID: <CAMKF1sqsxPEgLEdeR=AOT19h1Nxd4yzcVObzE_RKE0n_SvMXzg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2017-07-11
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
X-List-Received-Date: Wed, 12 Jul 2017 16:35:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2017 at 1:57 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> There is pending fix for valgrind and klibc, I've dropped udevil until v2=
 is sent, so
> hopefully next build will show only new issues caused by glibc upgrade.
>

there shouldn't be any :)

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
> ||2017-07-11    ||3     ||2     ||2     ||0     ||0             ||1      =
       ||0             ||0             ||0             ||229           ||0 =
            ||0             ||0             ||0             ||0            =
 ||0             ||0             ||0             ||
> |}
>
> =3D=3D Failed tasks 2017-07-11 =3D=3D
>
> INFO: jenkins-job.sh-1.8.24 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/rocko/log.report.20170711_071226.log
>
> =3D=3D=3D common (1) =3D=3D=3D
>     * meta-openembedded/meta-filesystems/recipes-utils/udevil/udevil_0.4.=
4.bb:do_package
>
> =3D=3D=3D common-x86 (1) =3D=3D=3D
>     * openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb=
:do_compile_ptest_base
>
> =3D=3D=3D qemuarm (2) =3D=3D=3D
>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4=
.bb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-stati=
c-utils_2.0.4.bb:do_compile
>
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>
> =3D=3D=3D qemux86_64 (0) =3D=3D=3D
>
> =3D=3D=3D Number of failed tasks (7) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm      || 3     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/rocko/log.world.qemuarm.20170710_232524.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/40944/
> |-
> || qemux86      || 2     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/rocko/log.world.qemux86.20170711_003346.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/40945/
> |-
> || qemux86_64   || 2     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/rocko/log.world.qemux86-64.20170711_035611.log/ || http://errors.yoctopro=
ject.org/Errors/Build/40946/
> |}
>
> =3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D
>
> =3D=3D=3D QA issues (230) =3D=3D=3D
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
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||textrel
> |-
> ||0     ||unknown-configure-option
> |-
> ||1     ||libdir
> |-
> ||229   ||version-going-backwards
> |}
>
>
>
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.si=
gnatures.20170711_015904.log/
>
> No issues detected
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLA=
CKLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-g=
old', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
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
> meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130607/ - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKL=
IST[xf86-video-geode] ?=3D "BROKEN, fails to build - the recipe will be rem=
oved on 2017-09-01 unless the issue is fixed"
> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[fox=
trotgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 co=
nflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb=
.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 =
and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb=
.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 =
and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml=
] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts=
 with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon] ?=
=3D "BROKEN: not compatible with newer vala, http://errors.yoctoproject.org=
/Errors/Details/143058/"
> meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?=3D "N=
ot compatible with gcc7 - the recipe will be removed on 2017-09-01 unless t=
he issue is fixed"
> meta-webos-ports:
> meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLA=
CKLIST[luna-webappmanager] ?=3D "BROKEN: needs to be adapted to new qt-5.7"
> meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] =
?=3D "BROKEN: needs to be adapted to new qtwayland-5.7"
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
> PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking oth=
er kernels and modules - broken for years"
> PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other kernels=
 and modules - broken for years"
>
>
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 1        issue: libdir
> qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location: /usr/plugins=
/designer/.debug/libqwt_designer_plugin.so [libdir]
>
>
> count: 0        issue: textrel
>
>
> count: 0        issue: build-deps
>
>
> count: 0        issue: file-rdeps
>
>
> count: 229      issue: version-going-backwards
> ...
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
> counionfs-fuse: 0.26 -> 2.0
> 39502f2 autofs: Add build dependency on libnsl2
> b73b2f4 gst-plugins-gl_0.10.3.bb: Fix build on rpi/userland
> 5ed1dba librcf: fix mips/mips64 build
> b02be7a freerdp: Fix build on mips
> 6869684 gegl: Upgrade to 0.3.18
> 6cbe8e8 babl: Upgrade to 0.1.28
> a57a2ed gimp: Upgrade to 2.8.22
> 8ddbec6 fluentbit: Fix parallel build race
> 73ccbee dietsplash: Fix build on mips
> 17afe08 libsrtp: Fix build on mips
> e6ffb3c assimp: Upgrade to 3.3.1 release
> 14c5780 synergy: Update to 1.8.8 release
> bf198f6 kodi: Update to 17.3
> 220ffd8 libtorrent: Implement 64bit atomics for mips32
> d1c5c69 rtorrent: Add and enable ipv6 packageconfig based on DISTRO_FEATU=
RES
> b7dac59 uim: Add support for aarch64
> d855e3d openhpi: Fix build on 64bit platforms e.g. aarch64
> 553ca7d meson: Port pkgconfig-native patch to 0.40.1
> 160c92f tinymembench: Disable on mips64
> b952200 ltrace: Add mips64 support
> 78c68a2 libtorrent: Link in 64bit atomics for ppc
> 339f975 librcf: Define byteorder for powerpc machines
> d6871e9 gperftools: Fix build on ppc
> 116273f crossguid: Add recipe
> 5b24757 kodi: User external crossguid
> 7798745 ser2net: upgrade to version 3.4
> fba5745 multipath-tools: 0.6.4 -> 0.7.1
> 576007b python-pytest: update to version 3.1.3
> ab2195a python-pytest: remove fetch during do_compile phase
> 257ae76 libtinyxml2: upgrade to 5.0.1
> 097b85b gnome-common: Add recipe (from oe-core)
> 8bd9323 webrtc-audio-processing: initial recipe
> ed824a0 libdbus-c++: Fix build with gcc7 and unblacklist
> 922fdce security_flags.inc: Delete
> 76be091 ltrace: Fix build on musl
> c6b1446 pptp-linux: Upgrade to 1.9.0
> 05ec709 kodi: Fix build on powerpc
> 7129489 meta-python: Add Protobuf and gRPC Python recipes
> 6d67f3b meta-python: Add pybluez recipe
> 536aaeb meta-python: Add python-daemon recipe and its dependencies
> 1fa365d recipes-utils: Add recipe for udevil
> 3b68b89 udisks2: update 2.1.7 -> 2.1.8
> 40289a3 gvfs: update 1.28.3 -> 1.32.1
> 886230a garcon: update 0.4.0 -> 0.6.1
> 282447b gparted: update 0.27.0 -> 0.28.1
> 59dc097 abiword: update 3.0.1 -> 3.0.2
> e49a72c faac: update 1.28 -> 1.29
> f24c55b libdbus-c++: Add -pthread to linker flags
> 191cab0 klibc: Fix build with musl
> 090ffc2 ubi-utils-klibc: Pass TUNE_CCARGS into CFLAGS
> b6e1db9 kodi: Fix build on arm
> d4b757a fluentbit: fix SYSTEMD_SERVICE name
> 7b8d32d recipes: remove blacklisted recipes
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:
> 2940d84 Revert "qttools: DEPENDS on icu"
> not included in master yet:
> 800d4c1 libconnman-qt5: update to 1.1.10
> 428be3c qtwebengine: add PACKAGECONFIG for webrtc
> e171265 qt5: add qt5-ptest.inc
> 774bec9 qtxmlpatterns: add ptest
> 6e18c64 qtdeclarative: add ptest
> 31996e7 qtquickcontrols2: fix compilation of examples/texteditor
> b36f0b8 qtquick1: add ptest
> 66010b8 qwt-qt5: Fix rpath issues
> 965dc46 qtwebengine: fix build with gcc7
> ea462d6 qt5-ptest.inc: append do_populate_sysroot only for target
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
> latest upstream commit:
> d822031 Merge pull request #49 from kraj/kraj/master
> not included in master yet:
> 6f790a0 gnome-settings-daemon: remove the bbappend for removed recipe
>
> =3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
> latest upstream commit:
> 9545fb6 packagegroup-luneos-extended: drop qtscenegraph-adaptation
> not included in master yet:
>
> =3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=
=3D
> latest upstream commit:
> 99253e8 android-system-image-tenderloin: use a Halium 5.1 based Android b=
uild
> not included in master yet:
> 913780b meta-shr, meta-fso: remove blacklisted recipes
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

