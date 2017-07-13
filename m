Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id C222677D12;
	Thu, 13 Jul 2017 10:14:22 +0000 (UTC)
Received: by mail-yb0-f169.google.com with SMTP id 84so15926905ybe.0;
	Thu, 13 Jul 2017 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eelBCKNzxvEEM48mvJr2jvCzxfAzjlaWsTnNlIWKxIU=;
	b=TJxEtdLXB0W5qAHHmc57DzINqeyZbAphBc/jFoG58rCu0dp4NOxe8pcTXpZwQ2zzJu
	t8xTXTF9lToLoEj6zZoJn/v7BSD47nMrl1OmBvdDziF5lEIi65WZHnELhTBRX+Xj2UKk
	spMm+t8nxDoCcYc5tVhHS9kMo5Llevs4diho95ftEGbZlJIKr4RmriLz5SRnvIVVjcRW
	Zva1xhnJ+44dejDdIX5znAVWc+KjMvzFfwL4Jbe4vZDgTXKjrp+EcjUj2YccqlzqekIg
	z+yoXUg0lt0Bb4I1sLraCBDCKAshbOV5DiMzNQFbB1YzAoXSCy6oS6nWRfXH+Ayez7RO
	s1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eelBCKNzxvEEM48mvJr2jvCzxfAzjlaWsTnNlIWKxIU=;
	b=IbNApTOjlVhmpxlUHW2YDdaClxHRqtdwiJ6RLI33l9lokjgxhMrPE4ry1PpgKGdZZk
	4wNn3JACIJd7Snc8U6Fp/JB/l5+oBeSduWrsFFw/pUCGiWrQtEGPMm2OIiw5SeO+5t9S
	LzmUVzEncSzNyeQPLRYmdjkzOATN/FxL1/n79h4UZJrB7qtw2lkOYl5tSOKCeIRYbquW
	+3fEWX91g2AC+Ed5flZyuYye4rCxk/AJxmYatkWwWWxVeELjWK36ZOeyzgr1QbGMiqEG
	Bd4bpeGGDq6nCPenfxXaTHr3sm1A18dxzU300c5RsFFDfxi+j1RMix3DZheA8+MmGwlA
	g+Vw==
X-Gm-Message-State: AIVw112sm57Oik9/XjTMp8XEKKY/d6mw5dhsgTJycIG+N2b0IQLeo6r+
	NmT06pBjwrnjdaMAjC16fQCJq/ObAQ==
X-Received: by 10.37.74.133 with SMTP id x127mr2221148yba.69.1499940863446;
	Thu, 13 Jul 2017 03:14:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Thu, 13 Jul 2017 03:14:22 -0700 (PDT)
In-Reply-To: <CAMKF1sqsxPEgLEdeR=AOT19h1Nxd4yzcVObzE_RKE0n_SvMXzg@mail.gmail.com>
References: <20170712085711.GA3061@jama>
	<CAMKF1sqsxPEgLEdeR=AOT19h1Nxd4yzcVObzE_RKE0n_SvMXzg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Jul 2017 12:14:22 +0200
Message-ID: <CA+chaQc-dUw58ULM-j4+shQ4QGJR5ttVUX98iXwrx3EpkXkGkQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 13 Jul 2017 10:14:23 -0000
Content-Type: multipart/alternative; boundary="001a113e8f905993960554303252"

--001a113e8f905993960554303252
Content-Type: text/plain; charset="UTF-8"

Shouldn't but one still slipped in:
http://errors.yoctoproject.org/Errors/Details/147438/

Thanks again for great work preparing the new toolchain.

On Wed, Jul 12, 2017 at 6:34 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Jul 12, 2017 at 1:57 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > There is pending fix for valgrind and klibc, I've dropped udevil until
> v2 is sent, so
> > hopefully next build will show only new issues caused by glibc upgrade.
> >
>
> there shouldn't be any :)
>
> > == Number of issues - stats ==
> > {| class='wikitable'
> > !|Date               !!colspan='3'|Failed tasks
>  !!|Signatures                 !!colspan='14'|QA !!Comment
> > |-
> > ||              ||qemuarm       ||qemux86       ||qemux86_64    ||all
>  ||already-stripped      ||libdir        ||textrel       ||build-deps
> ||file-rdeps    ||version-going-backwards       ||host-user-contaminated
>     ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||ldflags
>      ||compile-host-path     ||
> > |-
> > ||2017-07-11    ||3     ||2     ||2     ||0     ||0             ||1
>        ||0             ||0             ||0             ||229           ||0
>            ||0             ||0             ||0             ||0
>  ||0             ||0             ||0             ||
> > |}
> >
> > == Failed tasks 2017-07-11 ==
> >
> > INFO: jenkins-job.sh-1.8.24 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> report.20170711_071226.log
> >
> > === common (1) ===
> >     * meta-openembedded/meta-filesystems/recipes-utils/
> udevil/udevil_0.4.4.bb:do_package
> >
> > === common-x86 (1) ===
> >     * openembedded-core/meta/recipes-devtools/valgrind/
> valgrind_3.12.0.bb:do_compile_ptest_base
> >
> > === qemuarm (2) ===
> >     * meta-openembedded/meta-initramfs/recipes-devtools/
> klibc/klibc_2.0.4.bb:do_compile
> >     * meta-openembedded/meta-initramfs/recipes-devtools/
> klibc/klibc-static-utils_2.0.4.bb:do_compile
> >
> > === qemux86 (0) ===
> >
> > === qemux86_64 (0) ===
> >
> > === Number of failed tasks (7) ===
> > {| class=wikitable
> > |-
> > || qemuarm      || 3     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/rocko/log.world.qemuarm.20170710_232524.log/ ||
> http://errors.yoctoproject.org/Errors/Build/40944/
> > |-
> > || qemux86      || 2     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/rocko/log.world.qemux86.20170711_003346.log/ ||
> http://errors.yoctoproject.org/Errors/Build/40945/
> > |-
> > || qemux86_64   || 2     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/rocko/log.world.qemux86-64.20170711_035611.log/ ||
> http://errors.yoctoproject.org/Errors/Build/40946/
> > |}
> >
> > === PNBLACKLISTs (14) ===
> >
> > === QA issues (230) ===
> > {| class=wikitable
> > !| Count                ||Issue
> > |-
> > ||0     ||already-stripped
> > |-
> > ||0     ||build-deps
> > |-
> > ||0     ||compile-host-path
> > |-
> > ||0     ||file-rdeps
> > |-
> > ||0     ||host-user-contaminated
> > |-
> > ||0     ||installed-vs-shipped
> > |-
> > ||0     ||invalid-pkgconfig
> > |-
> > ||0     ||ldflags
> > |-
> > ||0     ||pkgname
> > |-
> > ||0     ||symlink-to-sysroot
> > |-
> > ||0     ||textrel
> > |-
> > ||0     ||unknown-configure-option
> > |-
> > ||1     ||libdir
> > |-
> > ||229   ||version-going-backwards
> > |}
> >
> >
> >
> > === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> >
> > Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> signatures.20170711_015904.log/
> >
> > No issues detected
> >
> >
> > PNBLACKLISTs:
> > openembedded-core/:
> > meta-browser:
> > meta-openembedded:
> > meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:
> PNBLACKLIST[lksctp-tools] ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> > meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:
> PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in
> DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130607/ - the recipe will be removed on 2017-09-01
> unless the issue is fixed"
> > meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:
> PNBLACKLIST[xf86-video-geode] ?= "BROKEN, fails to build - the recipe
> will be removed on 2017-09-01 unless the issue is fixed"
> > meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-qt5:
> > meta-smartphone:
> > meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon]
> ?= "BROKEN: not compatible with newer vala, http://errors.yoctoproject.
> org/Errors/Details/143058/"
> > meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?=
> "Not compatible with gcc7 - the recipe will be removed on 2017-09-01 unless
> the issue is fixed"
> > meta-webos-ports:
> > meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:
> PNBLACKLIST[luna-webappmanager] ?= "BROKEN: needs to be adapted to new
> qt-5.7"
> > meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]
> ?= "BROKEN: needs to be adapted to new qtwayland-5.7"
> > PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
> which isn't included in my world builds"
> > PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> tested so much"
> > PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
> tested so much"
> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> tested so much"
> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> tested so much"
> > PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> tested so much"
> > PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> directory in /home/builder/poky :/"
> > PNBLACKLIST[linux-yocto-tiny-kexecboot] = "does weird sh!t breaking
> other kernels and modules - broken for years"
> > PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other kernels
> and modules - broken for years"
> >
> >
> > QA issues by type:
> > count: 0        issue: already-stripped
> >
> >
> > count: 1        issue: libdir
> > qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:
> /usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]
> >
> >
> > count: 0        issue: textrel
> >
> >
> > count: 0        issue: build-deps
> >
> >
> > count: 0        issue: file-rdeps
> >
> >
> > count: 229      issue: version-going-backwards
> > ...
> >
> > count: 0        issue: host-user-contaminated
> >
> >
> > count: 0        issue: installed-vs-shipped
> >
> >
> > count: 0        issue: unknown-configure-option
> >
> >
> > count: 0        issue: symlink-to-sysroot
> >
> >
> > count: 0        issue: invalid-pkgconfig
> >
> >
> > counionfs-fuse: 0.26 -> 2.0
> > 39502f2 autofs: Add build dependency on libnsl2
> > b73b2f4 gst-plugins-gl_0.10.3.bb: Fix build on rpi/userland
> > 5ed1dba librcf: fix mips/mips64 build
> > b02be7a freerdp: Fix build on mips
> > 6869684 gegl: Upgrade to 0.3.18
> > 6cbe8e8 babl: Upgrade to 0.1.28
> > a57a2ed gimp: Upgrade to 2.8.22
> > 8ddbec6 fluentbit: Fix parallel build race
> > 73ccbee dietsplash: Fix build on mips
> > 17afe08 libsrtp: Fix build on mips
> > e6ffb3c assimp: Upgrade to 3.3.1 release
> > 14c5780 synergy: Update to 1.8.8 release
> > bf198f6 kodi: Update to 17.3
> > 220ffd8 libtorrent: Implement 64bit atomics for mips32
> > d1c5c69 rtorrent: Add and enable ipv6 packageconfig based on
> DISTRO_FEATURES
> > b7dac59 uim: Add support for aarch64
> > d855e3d openhpi: Fix build on 64bit platforms e.g. aarch64
> > 553ca7d meson: Port pkgconfig-native patch to 0.40.1
> > 160c92f tinymembench: Disable on mips64
> > b952200 ltrace: Add mips64 support
> > 78c68a2 libtorrent: Link in 64bit atomics for ppc
> > 339f975 librcf: Define byteorder for powerpc machines
> > d6871e9 gperftools: Fix build on ppc
> > 116273f crossguid: Add recipe
> > 5b24757 kodi: User external crossguid
> > 7798745 ser2net: upgrade to version 3.4
> > fba5745 multipath-tools: 0.6.4 -> 0.7.1
> > 576007b python-pytest: update to version 3.1.3
> > ab2195a python-pytest: remove fetch during do_compile phase
> > 257ae76 libtinyxml2: upgrade to 5.0.1
> > 097b85b gnome-common: Add recipe (from oe-core)
> > 8bd9323 webrtc-audio-processing: initial recipe
> > ed824a0 libdbus-c++: Fix build with gcc7 and unblacklist
> > 922fdce security_flags.inc: Delete
> > 76be091 ltrace: Fix build on musl
> > c6b1446 pptp-linux: Upgrade to 1.9.0
> > 05ec709 kodi: Fix build on powerpc
> > 7129489 meta-python: Add Protobuf and gRPC Python recipes
> > 6d67f3b meta-python: Add pybluez recipe
> > 536aaeb meta-python: Add python-daemon recipe and its dependencies
> > 1fa365d recipes-utils: Add recipe for udevil
> > 3b68b89 udisks2: update 2.1.7 -> 2.1.8
> > 40289a3 gvfs: update 1.28.3 -> 1.32.1
> > 886230a garcon: update 0.4.0 -> 0.6.1
> > 282447b gparted: update 0.27.0 -> 0.28.1
> > 59dc097 abiword: update 3.0.1 -> 3.0.2
> > e49a72c faac: update 1.28 -> 1.29
> > f24c55b libdbus-c++: Add -pthread to linker flags
> > 191cab0 klibc: Fix build with musl
> > 090ffc2 ubi-utils-klibc: Pass TUNE_CCARGS into CFLAGS
> > b6e1db9 kodi: Fix build on arm
> > d4b757a fluentbit: fix SYSTEMD_SERVICE name
> > 7b8d32d recipes: remove blacklisted recipes
> >
> > == Tested changes (not included in master yet) - meta-qt5 ==
> > latest upstream commit:
> > 2940d84 Revert "qttools: DEPENDS on icu"
> > not included in master yet:
> > 800d4c1 libconnman-qt5: update to 1.1.10
> > 428be3c qtwebengine: add PACKAGECONFIG for webrtc
> > e171265 qt5: add qt5-ptest.inc
> > 774bec9 qtxmlpatterns: add ptest
> > 6e18c64 qtdeclarative: add ptest
> > 31996e7 qtquickcontrols2: fix compilation of examples/texteditor
> > b36f0b8 qtquick1: add ptest
> > 66010b8 qwt-qt5: Fix rpath issues
> > 965dc46 qtwebengine: fix build with gcc7
> > ea462d6 qt5-ptest.inc: append do_populate_sysroot only for target
> >
> > == Tested changes (not included in master yet) - meta-browser ==
> > latest upstream commit:
> > d822031 Merge pull request #49 from kraj/kraj/master
> > not included in master yet:
> > 6f790a0 gnome-settings-daemon: remove the bbappend for removed recipe
> >
> > == Tested changes (not included in master yet) - meta-webos-ports ==
> > latest upstream commit:
> > 9545fb6 packagegroup-luneos-extended: drop qtscenegraph-adaptation
> > not included in master yet:
> >
> > == Tested changes (not included in master yet) - meta-smartphone ==
> > latest upstream commit:
> > 99253e8 android-system-image-tenderloin: use a Halium 5.1 based Android
> build
> > not included in master yet:
> > 913780b meta-shr, meta-fso: remove blacklisted recipes
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>

--001a113e8f905993960554303252
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shouldn&#39;t but one still slipped in:<div><a href=3D"htt=
p://errors.yoctoproject.org/Errors/Details/147438/">http://errors.yoctoproj=
ect.org/Errors/Details/147438/</a><br></div><div><br></div><div>Thanks agai=
n for great work preparing the new toolchain.</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Wed, Jul 12, 2017 at 6:34 PM, Kh=
em Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Wed, Jul 12, 2017 at 1:57 AM, Martin Jans=
a &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&=
gt; wrote:<br>
&gt; <a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" rel=
=3D"noreferrer" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/Bit=
bake_World_Status</a><br>
&gt;<br>
&gt; There is pending fix for valgrind and klibc, I&#39;ve dropped udevil u=
ntil v2 is sent, so<br>
&gt; hopefully next build will show only new issues caused by glibc upgrade=
.<br>
&gt;<br>
<br>
</span>there shouldn&#39;t be any :)<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; =3D=3D Number of issues - stats =3D=3D<br>
&gt; {| class=3D&#39;wikitable&#39;<br>
&gt; !|Date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=
=3D&#39;3&#39;|Failed tasks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!|Signatures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#39;14&#39;|QA !!Comment<br>
&gt; |-<br>
&gt; ||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||qemuarm=C2=A0 =C2=
=A0 =C2=A0 =C2=A0||qemux86=C2=A0 =C2=A0 =C2=A0 =C2=A0||qemux86_64=C2=A0 =C2=
=A0 ||all=C2=A0 =C2=A0||already-stripped=C2=A0 =C2=A0 =C2=A0 ||libdir=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ||textrel=C2=A0 =C2=A0 =C2=A0 =C2=A0||build-deps=C2=
=A0 =C2=A0 ||file-rdeps=C2=A0 =C2=A0 ||version-going-backwards=C2=A0 =C2=A0=
 =C2=A0 =C2=A0||host-user-contaminated=C2=A0 =C2=A0 =C2=A0 =C2=A0 ||install=
ed-vs-shipped=C2=A0 ||unknown-configure-option=C2=A0 =C2=A0 =C2=A0 ||symlin=
k-to-sysroot=C2=A0 =C2=A0 ||invalid-pkgconfig=C2=A0 =C2=A0 =C2=A0||pkgname=
=C2=A0 =C2=A0 =C2=A0 =C2=A0||ldflags=C2=A0 =C2=A0 =C2=A0 =C2=A0||compile-ho=
st-path=C2=A0 =C2=A0 =C2=A0||<br>
&gt; |-<br>
&gt; ||2017-07-11=C2=A0 =C2=A0 ||3=C2=A0 =C2=A0 =C2=A0||2=C2=A0 =C2=A0 =C2=
=A0||2=C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0||1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0||229=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0||<br>
&gt; |}<br>
&gt;<br>
&gt; =3D=3D Failed tasks 2017-07-11 =3D=3D<br>
&gt;<br>
&gt; INFO: jenkins-job.sh-1.8.24 Complete log available at <a href=3D"http:=
//logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170711_071226.=
log" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/<wbr>=
buildlogs/oe/world/rocko/log.<wbr>report.20170711_071226.log</a><br>
&gt;<br>
&gt; =3D=3D=3D common (1) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0* meta-openembedded/meta-<wbr>filesystems/recipes-u=
tils/<wbr>udevil/udevil_0.4.4.bb:do_<wbr>package<br>
&gt;<br>
&gt; =3D=3D=3D common-x86 (1) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0* openembedded-core/meta/<wbr>recipes-devtools/valg=
rind/<wbr>valgrind_3.12.0.bb:do_compile_<wbr>ptest_base<br>
&gt;<br>
&gt; =3D=3D=3D qemuarm (2) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0* meta-openembedded/meta-<wbr>initramfs/recipes-dev=
tools/<wbr>klibc/klibc_2.0.4.bb:do_<wbr>compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0* meta-openembedded/meta-<wbr>initramfs/recipes-dev=
tools/<wbr>klibc/klibc-static-utils_2.0.<wbr>4.bb:do_compile<br>
&gt;<br>
&gt; =3D=3D=3D qemux86 (0) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D qemux86_64 (0) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D Number of failed tasks (7) =3D=3D=3D<br>
&gt; {| class=3Dwikitable<br>
&gt; |-<br>
&gt; || qemuarm=C2=A0 =C2=A0 =C2=A0 || 3=C2=A0 =C2=A0 =C2=A0|| <a href=3D"h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170=
710_232524.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-lin=
ux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemuarm.20170710_232524=
.<wbr>log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/40=
944/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>=
org/Errors/Build/40944/</a><br>
&gt; |-<br>
&gt; || qemux86=C2=A0 =C2=A0 =C2=A0 || 2=C2=A0 =C2=A0 =C2=A0|| <a href=3D"h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170=
711_003346.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-lin=
ux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemux86.20170711_003346=
.<wbr>log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/40=
945/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>=
org/Errors/Build/40945/</a><br>
&gt; |-<br>
&gt; || qemux86_64=C2=A0 =C2=A0|| 2=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.2017071=
1_035611.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux=
.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemux86-64.20170711_<wbr>=
035611.log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/4=
0946/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr=
>org/Errors/Build/40946/</a><br>
&gt; |}<br>
&gt;<br>
&gt; =3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D QA issues (230) =3D=3D=3D<br>
&gt; {| class=3Dwikitable<br>
&gt; !| Count=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||Issu=
e<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||already-stripped<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||build-deps<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||compile-host-path<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||file-rdeps<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||host-user-contaminated<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||installed-vs-shipped<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||invalid-pkgconfig<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||ldflags<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||pkgname<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||symlink-to-sysroot<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||textrel<br>
&gt; |-<br>
&gt; ||0=C2=A0 =C2=A0 =C2=A0||unknown-configure-option<br>
&gt; |-<br>
&gt; ||1=C2=A0 =C2=A0 =C2=A0||libdir<br>
&gt; |-<br>
&gt; ||229=C2=A0 =C2=A0||version-going-backwards<br>
&gt; |}<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D<br=
>
&gt;<br>
&gt; Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/rocko/log.signatures.20170711_015904.log/" rel=3D"noreferrer" target=3D"_=
blank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>s=
ignatures.20170711_015904.<wbr>log/</a><br>
&gt;<br>
&gt; No issues detected<br>
&gt;<br>
&gt;<br>
&gt; PNBLACKLISTs:<br>
&gt; openembedded-core/:<br>
&gt; meta-browser:<br>
&gt; meta-openembedded:<br>
&gt; meta-networking/recipes-<wbr>support/lksctp-tools/lksctp-<wbr>tools_1.=
0.17.bb:PNBLACKLIST[<wbr>lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39=
;DISTRO_<wbr>FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to li=
nk against sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;<br>
&gt; meta-oe/recipes-connectivity/<wbr>bluez/bluez-hcidump_2.5.bb:PNB<wbr>L=
ACKLIST[bluez-hcidump] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEA=
TURES&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 =
is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
&gt; meta-oe/recipes-connectivity/<wbr>bluez/bluez4_4.101.bb:PNBLACKL<wbr>I=
ST[bluez4] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, =
&#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected =
in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
&gt; meta-oe/recipes-connectivity/<wbr>bluez/gst-plugin-bluetooth_4.<wbr>10=
1.bb:PNBLACKLIST[gst-plugin-<wbr>bluetooth] ?=3D &quot;${@bb.utils.contains=
(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&q=
uot;<br>
&gt; meta-oe/recipes-graphics/<wbr>libsexy/libsexy_0.1.11.bb:PNBL<wbr>ACKLI=
ST[libsexy] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoc=
toproject.org/Errors/Details/130607/" rel=3D"noreferrer" target=3D"_blank">=
http://errors.yoctoproject.<wbr>org/Errors/Details/130607/</a> - the recipe=
 will be removed on 2017-09-01 unless the issue is fixed&quot;<br>
&gt; meta-oe/recipes-graphics/xorg-<wbr>driver/xf86-video-geode_2.11.<wbr>1=
6.bb:PNBLACKLIST[xf86-video-<wbr>geode] ?=3D &quot;BROKEN, fails to build -=
 the recipe will be removed on 2017-09-01 unless the issue is fixed&quot;<b=
r>
&gt; meta-oe/recipes-navigation/<wbr>foxtrotgps/foxtrotgps_1.1.1.<wbr>bb:PN=
BLACKLIST[foxtrotgps] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEAT=
URES&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 i=
s selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
&gt; meta-oe/recipes-navigation/<wbr>gypsy/gypsy.inc:PNBLACKLIST[<wbr>gypsy=
] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;blue=
z5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO=
_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
&gt; meta-oe/recipes-navigation/<wbr>navit/navit.inc:PNBLACKLIST[<wbr>navit=
] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;blue=
z5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO=
_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
&gt; meta-oe/recipes-support/<wbr>opensync/libsyncml_0.5.4.bb:PN<wbr>BLACKL=
IST[libsyncml] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#3=
9;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selec=
ted in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
&gt; meta-qt5:<br>
&gt; meta-smartphone:<br>
&gt; meta-shr/recipes-shr/3rdparty/<wbr>libsensmon_git.bb:PNBLACKLIST[<wbr>=
libsensmon] ?=3D &quot;BROKEN: not compatible with newer vala, <a href=3D"h=
ttp://errors.yoctoproject.org/Errors/Details/143058/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/143058/<=
/a>&quot;<br>
&gt; meta-shr/recipes-shr/3rdparty/<wbr>omhacks_git.bb:PNBLACKLIST[<wbr>omh=
acks] ?=3D &quot;Not compatible with gcc7 - the recipe will be removed on 2=
017-09-01 unless the issue is fixed&quot;<br>
&gt; meta-webos-ports:<br>
&gt; meta-luneos/recipes-luneos/<wbr>luna-webappmanager/luna-<wbr>webappman=
ager.bb:PNBLACKLIST[<wbr>luna-webappmanager] ?=3D &quot;BROKEN: needs to be=
 adapted to new qt-5.7&quot;<br>
&gt; meta-luneui/recipes-luneui/<wbr>luna-next/luna-next.bb:PNBLACK<wbr>LIS=
T[luna-next] ?=3D &quot;BROKEN: needs to be adapted to new qtwayland-5.7&qu=
ot;<br>
&gt; PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtual=
iazation which isn&#39;t included in my world builds&quot;<br>
&gt; PNBLACKLIST[bigbuckbunny-<wbr>1080p] =3D &quot;big and doesn&#39;t rea=
lly need to be tested so much&quot;<br>
&gt; PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really ne=
ed to be tested so much&quot;<br>
&gt; PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really ne=
ed to be tested so much&quot;<br>
&gt; PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really ne=
ed to be tested so much&quot;<br>
&gt; PNBLACKLIST[tearsofsteel-<wbr>1080p] =3D &quot;big and doesn&#39;t rea=
lly need to be tested so much&quot;<br>
&gt; PNBLACKLIST[build-appliance-<wbr>image] =3D &quot;tries to include who=
le downloads directory in /home/builder/poky :/&quot;<br>
&gt; PNBLACKLIST[linux-yocto-tiny-<wbr>kexecboot] =3D &quot;does weird sh!t=
 breaking other kernels and modules - broken for years&quot;<br>
&gt; PNBLACKLIST[linux-yocto-tiny] =3D &quot;does weird sh!t breaking other=
 kernels and modules - broken for years&quot;<br>
&gt;<br>
&gt;<br>
&gt; QA issues by type:<br>
&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: already-stripped<br>
&gt;<br>
&gt;<br>
&gt; count: 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: libdir<br>
&gt; qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location: /usr/plug=
ins/designer/.debug/<wbr>libqwt_designer_plugin.so [libdir]<br>
&gt;<br>
&gt;<br>
&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: textrel<br>
&gt;<br>
&gt;<br>
&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: build-deps<br>
&gt;<br>
&gt;<br>
&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: file-rdeps<br>
&gt;<br>
&gt;<br>
&gt; count: 229=C2=A0 =C2=A0 =C2=A0 issue: version-going-backwards<br>
&gt; ...<br>
&gt;<br>
&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: host-user-contaminated<br>
&gt;<br>
&gt;<br>
&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: installed-vs-shipped<br>
&gt;<br>
&gt;<br>
&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: unknown-configure-option<br=
>
&gt;<br>
&gt;<br>
&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: symlink-to-sysroot<br>
&gt;<br>
&gt;<br>
&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: invalid-pkgconfig<br>
&gt;<br>
&gt;<br>
&gt; counionfs-fuse: 0.26 -&gt; 2.0<br>
&gt; 39502f2 autofs: Add build dependency on libnsl2<br>
&gt; b73b2f4 <a href=3D"http://gst-plugins-gl_0.10.3.bb" rel=3D"noreferrer"=
 target=3D"_blank">gst-plugins-gl_0.10.3.bb</a>: Fix build on rpi/userland<=
br>
&gt; 5ed1dba librcf: fix mips/mips64 build<br>
&gt; b02be7a freerdp: Fix build on mips<br>
&gt; 6869684 gegl: Upgrade to 0.3.18<br>
&gt; 6cbe8e8 babl: Upgrade to 0.1.28<br>
&gt; a57a2ed gimp: Upgrade to 2.8.22<br>
&gt; 8ddbec6 fluentbit: Fix parallel build race<br>
&gt; 73ccbee dietsplash: Fix build on mips<br>
&gt; 17afe08 libsrtp: Fix build on mips<br>
&gt; e6ffb3c assimp: Upgrade to 3.3.1 release<br>
&gt; 14c5780 synergy: Update to 1.8.8 release<br>
&gt; bf198f6 kodi: Update to 17.3<br>
&gt; 220ffd8 libtorrent: Implement 64bit atomics for mips32<br>
&gt; d1c5c69 rtorrent: Add and enable ipv6 packageconfig based on DISTRO_FE=
ATURES<br>
&gt; b7dac59 uim: Add support for aarch64<br>
&gt; d855e3d openhpi: Fix build on 64bit platforms e.g. aarch64<br>
&gt; 553ca7d meson: Port pkgconfig-native patch to 0.40.1<br>
&gt; 160c92f tinymembench: Disable on mips64<br>
&gt; b952200 ltrace: Add mips64 support<br>
&gt; 78c68a2 libtorrent: Link in 64bit atomics for ppc<br>
&gt; 339f975 librcf: Define byteorder for powerpc machines<br>
&gt; d6871e9 gperftools: Fix build on ppc<br>
&gt; 116273f crossguid: Add recipe<br>
&gt; 5b24757 kodi: User external crossguid<br>
&gt; 7798745 ser2net: upgrade to version 3.4<br>
&gt; fba5745 multipath-tools: 0.6.4 -&gt; 0.7.1<br>
&gt; 576007b python-pytest: update to version 3.1.3<br>
&gt; ab2195a python-pytest: remove fetch during do_compile phase<br>
&gt; 257ae76 libtinyxml2: upgrade to 5.0.1<br>
&gt; 097b85b gnome-common: Add recipe (from oe-core)<br>
&gt; 8bd9323 webrtc-audio-processing: initial recipe<br>
&gt; ed824a0 libdbus-c++: Fix build with gcc7 and unblacklist<br>
&gt; 922fdce security_flags.inc: Delete<br>
&gt; 76be091 ltrace: Fix build on musl<br>
&gt; c6b1446 pptp-linux: Upgrade to 1.9.0<br>
&gt; 05ec709 kodi: Fix build on powerpc<br>
&gt; 7129489 meta-python: Add Protobuf and gRPC Python recipes<br>
&gt; 6d67f3b meta-python: Add pybluez recipe<br>
&gt; 536aaeb meta-python: Add python-daemon recipe and its dependencies<br>
&gt; 1fa365d recipes-utils: Add recipe for udevil<br>
&gt; 3b68b89 udisks2: update 2.1.7 -&gt; 2.1.8<br>
&gt; 40289a3 gvfs: update 1.28.3 -&gt; 1.32.1<br>
&gt; 886230a garcon: update 0.4.0 -&gt; 0.6.1<br>
&gt; 282447b gparted: update 0.27.0 -&gt; 0.28.1<br>
&gt; 59dc097 abiword: update 3.0.1 -&gt; 3.0.2<br>
&gt; e49a72c faac: update 1.28 -&gt; 1.29<br>
&gt; f24c55b libdbus-c++: Add -pthread to linker flags<br>
&gt; 191cab0 klibc: Fix build with musl<br>
&gt; 090ffc2 ubi-utils-klibc: Pass TUNE_CCARGS into CFLAGS<br>
&gt; b6e1db9 kodi: Fix build on arm<br>
&gt; d4b757a fluentbit: fix SYSTEMD_SERVICE name<br>
&gt; 7b8d32d recipes: remove blacklisted recipes<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D<b=
r>
&gt; latest upstream commit:<br>
&gt; 2940d84 Revert &quot;qttools: DEPENDS on icu&quot;<br>
&gt; not included in master yet:<br>
&gt; 800d4c1 libconnman-qt5: update to 1.1.10<br>
&gt; 428be3c qtwebengine: add PACKAGECONFIG for webrtc<br>
&gt; e171265 qt5: add qt5-ptest.inc<br>
&gt; 774bec9 qtxmlpatterns: add ptest<br>
&gt; 6e18c64 qtdeclarative: add ptest<br>
&gt; 31996e7 qtquickcontrols2: fix compilation of examples/texteditor<br>
&gt; b36f0b8 qtquick1: add ptest<br>
&gt; 66010b8 qwt-qt5: Fix rpath issues<br>
&gt; 965dc46 qtwebengine: fix build with gcc7<br>
&gt; ea462d6 qt5-ptest.inc: append do_populate_sysroot only for target<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-browser =3D=
=3D<br>
&gt; latest upstream commit:<br>
&gt; d822031 Merge pull request #49 from kraj/kraj/master<br>
&gt; not included in master yet:<br>
&gt; 6f790a0 gnome-settings-daemon: remove the bbappend for removed recipe<=
br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-webos-ports =
=3D=3D<br>
&gt; latest upstream commit:<br>
&gt; 9545fb6 packagegroup-luneos-extended: drop qtscenegraph-adaptation<br>
&gt; not included in master yet:<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-smartphone =
=3D=3D<br>
&gt; latest upstream commit:<br>
&gt; 99253e8 android-system-image-<wbr>tenderloin: use a Halium 5.1 based A=
ndroid build<br>
&gt; not included in master yet:<br>
&gt; 913780b meta-shr, meta-fso: remove blacklisted recipes<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-devel mailing list<br>
&gt; <a href=3D"mailto:Openembedded-devel@lists.openembedded.org">Openembed=
ded-devel@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-devel" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/=
<wbr>mailman/listinfo/openembedded-<wbr>devel</a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--001a113e8f905993960554303252--
