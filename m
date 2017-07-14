Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 76B6D7821C;
	Fri, 14 Jul 2017 17:03:55 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id n205so35294376yba.1;
	Fri, 14 Jul 2017 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RV3h9tzizyASI14KDkhBa+Dxofwv6/e1mNEz8CBovOk=;
	b=iDk2+0YZj7ZSL3Wiy8NvFXUBTaYzC86ZJ2/tk6FgBuomOq2yjiZRMItTZj8kuASzmX
	LdaMcIRU6wFGrmitD/13qlWfjXSUL5MVtTKGB39hrKv5e5jrzASoJDvU5eEMXhOcXBJw
	V+f2u4lFJvh9Qt8vax6QwKMs9V48FKwZOkDRnLc9149D9Bnb8zzhINCl8hTdVIueO+kp
	S3m3PiHRqIfdfxL3EQBbsuxCwrLsvAUorXQwGyxpk9AbAnj2bbuKjFr+RsS2BHjj1ZPz
	QoGUntE16iukdxMa1+uu3aHP5ZQmRZ3FdT7Ly2xRZXjxhjYLQWSSEi5kaBmQxDKhmzLm
	xzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RV3h9tzizyASI14KDkhBa+Dxofwv6/e1mNEz8CBovOk=;
	b=E1IA+7sRf3IlUP0XOe6r9gNvb/XuLYUR0co553h1SfFufiJuVccqoYf/PllpkyVYFV
	YDFeGrhrix6kwWWd0GykcS40aOTuFimCHuBY6KCHqOAUJyqC3zjHDETK+HFvTnmo6dm2
	QNmitexzqlWCNO7EfNiadEOy64yOJzFLI0jtTwv8DFWAAIxEnQ+hJa5TPIp0Nx1fZTPI
	Ukd+5GpQ3JMHFq2h8NDO2YXWnLjEGVAlTUo4Oo3FwS5TBmQ+hn4W37rgxI+AZJEurtiV
	Ru7WEGE3USniut5tYTca8aaUudtIIEihINYa8SWt1H2MeAESiEZqsAWNeM9l/prc5u3C
	UmJA==
X-Gm-Message-State: AIVw112AGV+fe5b/dmAqLMSDyU641iRqHYAQ1ZPYT/+E/zXSg0eC2HlI
	JsNeq4wvQkj25v5WnsdmzVIXHCakvg==
X-Received: by 10.37.208.215 with SMTP id h206mr4555045ybg.2.1500051835976;
	Fri, 14 Jul 2017 10:03:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Fri, 14 Jul 2017 10:03:55 -0700 (PDT)
In-Reply-To: <CAMKF1srxLHCA5YoRr20m+gYWooita6+3shpOLfbXHCVcAwb_dg@mail.gmail.com>
References: <CA+chaQfEGO1Gra1BBCR9jeA+Lu5K6ekUY4etENcwoFQgftqzTA@mail.gmail.com>
	<CAMKF1srxLHCA5YoRr20m+gYWooita6+3shpOLfbXHCVcAwb_dg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 14 Jul 2017 19:03:55 +0200
Message-ID: <CA+chaQeieChzEyyvomMVEa7-14f-J9kASZmNUNd6ZL3jUmdd7w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-07-13
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
X-List-Received-Date: Fri, 14 Jul 2017 17:03:55 -0000
Content-Type: multipart/alternative; boundary="94eb2c056680d418da05544a082a"

--94eb2c056680d418da05544a082a
Content-Type: text/plain; charset="UTF-8"

OK, I'll merge current batch of pending changes and before next build I'll
include
conf/distro/include/security_flags.inc

Is that all I need to do?

On Fri, Jul 14, 2017 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi Martin
>
> On Fri, Jul 14, 2017 at 9:43 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
>
> The results looks good. I wanted to suggest to start building with
> hardening flags on if possible. I have ensured that there are no
> regressions with hardening flags. It would be good to keep that up
>
> > == Number of issues - stats ==
> > {| class='wikitable'
> > !|Date     !!colspan='3'|Failed tasks    !!|Signatures
> > !!colspan='14'|QA !!Comment
> > |-
> > || ||qemuarm ||qemux86 ||qemux86_64 ||all
> > ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
> ||version-going-backwards ||host-user-contaminated ||installed-vs-shipped
> ||unknown-configure-option ||symlink-to-sysroot ||invalid-pkgconfig
> ||pkgname ||ldflags ||compile-host-path ||
> > |-
> >
> > ||2017-07-13 ||1 ||1 ||1 ||0 ||0 ||1 ||4 ||0 ||0 ||21 ||0 ||0 ||0 ||0
> ||0 ||0 ||0 ||0 ||
> > |}
> >
> > == Failed tasks 2017-07-13 ==
> >
> > INFO: jenkins-job.sh-1.8.24 Complete log available at
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> report.20170714_064216.log
> >
> > === common (1) ===
> >     *
> > openembedded-core/meta/recipes-devtools/systemd-
> bootchart/systemd-bootchart_231.bb:do_compile
> >
> > === common-x86 (0) ===
> >
> > === qemuarm (0) ===
> >
> > === qemux86 (0) ===
> >
> > === qemux86_64 (0) ===
> >
> > === Number of failed tasks (3) ===
> > {| class=wikitable
> >
> > |-
> > || qemuarm || 1 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemuarm.20170711_225251.log/
> > || http://errors.yoctoproject.org/Errors/Build/41116/
> > |-
> > || qemux86 || 1 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86.20170711_225251.log/
> > || http://errors.yoctoproject.org/Errors/Build/41118/
> > |-
> > || qemux86_64 || 1 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86-64.20170713_081929.log/
> > || http://errors.yoctoproject.org/Errors/Build/41231/
> > |}
> >
> > === PNBLACKLISTs (14) ===
> >
> > === QA issues (26) ===
> > {| class=wikitable
> > !| Count ||Issue
> > |-
> > ||0 ||already-stripped
> > |-
> > ||0 ||build-deps
> > |-
> > ||0 ||compile-host-path
> > |-
> > ||0 ||file-rdeps
> > |-
> > ||0 ||host-user-contaminated
> > |-
> > ||0 ||installed-vs-shipped
> > |-
> > ||0 ||invalid-pkgconfig
> > |-
> > ||0 ||ldflags
> > |-
> > ||0 ||pkgname
> > |-
> > ||0 ||symlink-to-sysroot
> > |-
> > ||0 ||unknown-configure-option
> > |-
> > ||1 ||libdir
> > |-
> > ||21 ||version-going-backwards
> > |-
> > ||4 ||textrel
> > |}
> >
> >
> >
> > === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> >
> > Complete log:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> signatures.20170712_200847.log/
> >
> > No issues detected
> >
> >
> > PNBLACKLISTs:
> >
> > openembedded-core/:
> > meta-browser:
> > meta-openembedded:
> > meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:
> PNBLACKLIST[lksctp-tools]
> > ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
> fails to
> > link against sctp_connectx symbol", '', d)}"
> > meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNB
> LACKLIST[bluez-hcidump]
> > ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with
> > bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4]
> ?=
> > "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with
> > bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:
> PNBLACKLIST[gst-plugin-bluetooth]
> > ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with
> > bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy]
> ?=
> > "Fails to build with RSS
> > http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe will
> be
> > removed on 2017-09-01 unless the issue is fixed"
> > meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:
> PNBLACKLIST[xf86-video-geode]
> > ?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01
> unless
> > the issue is fixed"
> > meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.
> bb:PNBLACKLIST[foxtrotgps]
> > ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with
> > bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
> > "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with
> > bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
> > "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with
> > bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PN
> BLACKLIST[libsyncml]
> > ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with
> > bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> > meta-qt5:
> > meta-smartphone:
> > meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon]
> ?=
> > "BROKEN: not compatible with newer vala,
> > http://errors.yoctoproject.org/Errors/Details/143058/"
> > meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?=
> "Not
> > compatible with gcc7 - the recipe will be removed on 2017-09-01 unless
> the
> > issue is fixed"
> > meta-webos-ports:
> > meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:
> PNBLACKLIST[luna-webappmanager]
> > ?= "BROKEN: needs to be adapted to new qt-5.7"
> > meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]
> ?=
> > "BROKEN: needs to be adapted to new qtwayland-5.7"
> > PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
> > which isn't included in my world builds"
> > PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> tested
> > so much"
> > PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
> tested
> > so much"
> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> tested
> > so much"
> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> tested
> > so much"
> > PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> tested
> > so much"
> > PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> > directory in /home/builder/poky :/"
> > PNBLACKLIST[linux-yocto-tiny-kexecboot] = "does weird sh!t breaking
> other
> > kernels and modules - broken for years"
> > PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other kernels
> and
> > modules - broken for years"
> >
> >
> > QA issues by type:
> > count: 0 issue: already-stripped
> >
> >
> > count: 1 issue: libdir
> > qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:
> > /usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]
> >
> >
> > count: 4 issue: textrel
> > chromium-54.0.2810.2: ELF binary
> > '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/
> packages-split/chromium/usr/bin/chromium/chrome'
> > has relocations in .text [textrel]
> > chromium-wayland-53.0.2785.143: ELF binary
> > '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.
> 143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
> > has relocations in .text [textrel]
> > corosync-2.4.2: ELF binary
> > '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-
> split/corosync/usr/sbin/corosync'
> > has relocations in .text [textrel]
> > x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> > '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-
> r0/packages-split/x264/usr/lib/libx264.so.148'
> > has relocations in .text [textrel]
> >
> >
> > count: 0 issue: build-deps
> >
> >
> > count: 0 issue: file-rdeps
> >
> >
> > count: 21 issue: version-going-backwards
> > rsyslog-8.22.0: Package version for package rsyslog-dbg went backwards
> which
> > would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-dbg went backwards
> which
> > would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-dev went backwards
> which
> > would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-dev went backwards
> which
> > would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-doc went backwards
> which
> > would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-doc went backwards
> which
> > would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-locale went backwards
> > which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-locale went backwards
> > which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-ptest went backwards
> > which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-ptest went backwards
> > which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-staticdev went
> backwards
> > which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog-staticdev went
> backwards
> > which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog went backwards which
> > would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > rsyslog-8.22.0: Package version for package rsyslog went backwards which
> > would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> > [version-going-backwards]
> > valgrind-3.12.0: Package version for package valgrind-dbg went backwards
> > which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> > [version-going-backwards]
> > valgrind-3.12.0: Package version for package valgrind-dev went backwards
> > which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> > [version-going-backwards]
> > valgrind-3.12.0: Package version for package valgrind-doc went backwards
> > which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> > [version-going-backwards]
> > valgrind-3.12.0: Package version for package valgrind-locale went
> backwards
> > which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> > [version-going-backwards]
> > valgrind-3.12.0: Package version for package valgrind-ptest went
> backwards
> > which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> > [version-going-backwards]
> > valgrind-3.12.0: Package version for package valgrind-staticdev went
> > backwards which would break package feeds from (0:3.12.0-r0.34 to
> > 0:3.12.0-r0.0) [version-going-backwards]
> > valgrind-3.12.0: Package version for package valgrind went backwards
> which
> > would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> > [version-going-backwards]
> >
> >
> > count: 0 issue: host-user-contaminated
> >
> >
> > count: 0 issue: installed-vs-shipped
> >
> >
> > count: 0 issue: unknown-configure-option
> >
> >
> > count: 0 issue: symlink-to-sysroot
> >
> >
> > count: 0 issue: invalid-pkgconfig
> >
> >
> > count: 0 issue: pkgname
> >
> >
> > count: 0 issue: ldflags
> >
> >
> > count: 0 issue: compile-host-path
> >
> >
> >
> > == Tested changes (not included in master yet) - bitbake ==
> >
> > latest upstream commit:
> > 4a14b44 knotty: Drop task prefix of PLAIN log messages
> > not included in master yet:
> > dda3a10 world-image: add extra target
> >
> > == Tested changes (not included in master yet) - openembedded-core ==
> > latest upstream commit:
> > b1c4661 libiconv: remove
> > 0001-Fix-link-error-when-compiling-with-gcc-O0.patch
> > not included in master yet:
> > dd1b5e7 report-error: Allow to upload reports automatically
> > 7fdb805 buildhistory.bbclass: metadata-revs show repo parent
> > 9b6fe73 metadata-revs: provide more information
> > 2cd822c qemux86: Add identical qemux86copy variant for tests
> > db1b8cf valgrind: fix link failure with gold
> >
> > == Tested changes (not included in master yet) - meta-openembedded ==
> >
> > latest upstream commit:
> > 66b88f7 hwloc: Inherit pkgconfig
> > not included in master yet:
> > 9340320 dnsmasq: disable the service by default
> > d1fca80 rdate: Fix build with hardening
> > 96fd8e1 strongswan: Include stdint.h for uintptr_t
> > 961797e netkit-rpc: Fix build with hardening flags
> > b1fb0ad netkit-telnet: Fix build with hardening
> > ed9432c ncftp: Upgrade to 3.2.6
> > 2531f3e ippool: Fix build errors found with hardening flags
> > 5963598 gflags: update SRC_URI with git fetcher
> > 1a3966a unionfs-fuse: 0.26 -> 2.0
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
> > 8253d8c libtinyxml2: upgrade to 5.0.1
> > e5d13e0 gnome-common: Add recipe (from oe-core)
> > 2c09550 webrtc-audio-processing: initial recipe
> > 3e83a12 libdbus-c++: Fix build with gcc7 and unblacklist
> > a9b421b security_flags.inc: Delete
> > 21ac7ab ltrace: Fix build on musl
> > 9f59778 pptp-linux: Upgrade to 1.9.0
> > 011d175 kodi: Fix build on powerpc
> > 96ddef1 meta-python: Add Protobuf and gRPC Python recipes
> > 6978c6c meta-python: Add pybluez recipe
> > 5fc3a7b meta-python: Add python-daemon recipe and its dependencies
> > b234cb7 udisks2: update 2.1.7 -> 2.1.8
> > 6351d5d gvfs: update 1.28.3 -> 1.32.1
> > 072a282 garcon: update 0.4.0 -> 0.6.1
> > 4ae21b2 gparted: update 0.27.0 -> 0.28.1
> > 85f9438 abiword: update 3.0.1 -> 3.0.2
> > f180ebe faac: update 1.28 -> 1.29
> > d4373e3 libdbus-c++: Add -pthread to linker flags
> > 216bf8b klibc: Fix build with musl
> > ac04fc6 ubi-utils-klibc: Pass TUNE_CCARGS into CFLAGS
> > 225e21d kodi: Fix build on arm
> > 5cce369 fluentbit: fix SYSTEMD_SERVICE name
> > 626a865 Intel: remove license file
> > 7fdf736 proj: update to 4.9.3
> > ef59094 klibc: Fix linking by using bfd linker when default linker is
> gold
> > 9b2852b libsombok3: add recipe
> > 20b186c libmime-charset-perl: add recipe
> > 3ccb597 libterm-readkey-perl: add recipe
> > 91736f5 liblocale-gettext-perl: add recipe
> > 9dfe3e1 libtext-charwidth-perl: add recipe
> > f5158f7 libtext-wrapi18n-perl: add recipe
> > 247aec7 libunicode-linebreak-perl: add recipe
> > 131de8c po4a: add full functionalities
> > 1815d4e ebtables: replace ebtables-save perl script with bash rewrite
> > 8fc200c recipes: remove blacklisted recipes
> >
> > == Tested changes (not included in master yet) - meta-qt5 ==
> > latest upstream commit:
> > 2940d84 Revert "qttools: DEPENDS on icu"
> > not included in master yet:
> > 800d4c1 libconnman-qt5: update to 1.1.10
> > 428be3c qtwebengine: add PACKAGECONFIG for webrtc
> > 05455e6 qt5: add qt5-ptest.inc
> > ec8c62e qtxmlpatterns: add ptest
> > 1eac990 qtdeclarative: add ptest
> > 2c1d6b1 qtquick1: add ptest
> > aa0605d qtquickcontrols2: fix compilation of examples/texteditor
> > 00d72cd qwt-qt5: Fix rpath issues
> > c2768bd qtwebengine: fix build with gcc7
> > 932515a qt5-ptest.inc: append do_populate_sysroot only for target
> > bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault
> >
> > == Tested changes (not included in master yet) - meta-browser ==
> >
> > latest upstream commit:
> > d822031 Merge pull request #49 from kraj/kraj/master
> > not included in master yet:
> > 6f790a0 gnome-settings-daemon: remove the bbappend for removed recipe
> >
> > == Tested changes (not included in master yet) - meta-webos-ports ==
> >
> > latest upstream commit:
> > 9545fb6 packagegroup-luneos-extended: drop qtscenegraph-adaptation
> > not included in master yet:
> >
> > == Tested changes (not included in master yet) - meta-smartphone ==
> > latest upstream commit:
> > 80b8107 android-system-image-tenderloin: Fix checksums
> > not included in master yet:
> > e523b07 meta-shr, meta-fso: remove blacklisted recipes
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--94eb2c056680d418da05544a082a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, I&#39;ll merge current batch of pending changes and be=
fore next build I&#39;ll include<div>conf/distro/include/security_flags.inc=
<br></div><div><br></div><div>Is that all I need to do?</div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jul 14, 2017 at 6=
:49 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hi Martin<br>
<br>
On Fri, Jul 14, 2017 at 9:43 AM, Martin Jansa &lt;<a href=3D"mailto:martin.=
jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; <a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" rel=
=3D"noreferrer" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/Bit=
bake_World_Status</a><br>
&gt;<br>
<br>
The results looks good. I wanted to suggest to start building with<br>
hardening flags on if possible. I have ensured that there are no<br>
regressions with hardening flags. It would be good to keep that up<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; =3D=3D Number of issues - stats =3D=3D<br>
&gt; {| class=3D&#39;wikitable&#39;<br>
&gt; !|Date=C2=A0 =C2=A0 =C2=A0!!colspan=3D&#39;3&#39;|Failed tasks=C2=A0 =
=C2=A0 !!|Signatures<br>
&gt; !!colspan=3D&#39;14&#39;|QA !!Comment<br>
&gt; |-<br>
&gt; || ||qemuarm ||qemux86 ||qemux86_64 ||all<br>
&gt; ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps ||vers=
ion-going-backwards ||host-user-contaminated ||installed-vs-shipped ||unkno=
wn-configure-option ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ld=
flags ||compile-host-path ||<br>
&gt; |-<br>
&gt;<br>
&gt; ||2017-07-13 ||1 ||1 ||1 ||0 ||0 ||1 ||4 ||0 ||0 ||21 ||0 ||0 ||0 ||0 =
||0 ||0 ||0 ||0 ||<br>
&gt; |}<br>
&gt;<br>
&gt; =3D=3D Failed tasks 2017-07-13 =3D=3D<br>
&gt;<br>
&gt; INFO: jenkins-job.sh-1.8.24 Complete log available at<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.re=
port.20170714_064216.log" rel=3D"noreferrer" target=3D"_blank">http://logs.=
nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>report.20170714_0642=
16.log</a><br>
&gt;<br>
&gt; =3D=3D=3D common (1) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; openembedded-core/meta/<wbr>recipes-devtools/systemd-<wbr>bootchart/sy=
stemd-bootchart_<wbr>231.bb:do_compile<br>
&gt;<br>
&gt; =3D=3D=3D common-x86 (0) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D qemuarm (0) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D qemux86 (0) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D qemux86_64 (0) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D Number of failed tasks (3) =3D=3D=3D<br>
&gt; {| class=3Dwikitable<br>
&gt;<br>
&gt; |-<br>
&gt; || qemuarm || 1 ||<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wo=
rld.qemuarm.20170711_225251.log/" rel=3D"noreferrer" target=3D"_blank">http=
://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemuar=
m.20170711_225251.<wbr>log/</a><br>
&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41116/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Build/41116/</a><br>
&gt; |-<br>
&gt; || qemux86 || 1 ||<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wo=
rld.qemux86.20170711_225251.log/" rel=3D"noreferrer" target=3D"_blank">http=
://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemux8=
6.20170711_225251.<wbr>log/</a><br>
&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41118/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Build/41118/</a><br>
&gt; |-<br>
&gt; || qemux86_64 || 1 ||<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wo=
rld.qemux86-64.20170713_081929.log/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qem=
ux86-64.20170713_<wbr>081929.log/</a><br>
&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41231/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Build/41231/</a><br>
&gt; |}<br>
&gt;<br>
&gt; =3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D QA issues (26) =3D=3D=3D<br>
&gt; {| class=3Dwikitable<br>
&gt; !| Count ||Issue<br>
&gt; |-<br>
&gt; ||0 ||already-stripped<br>
&gt; |-<br>
&gt; ||0 ||build-deps<br>
&gt; |-<br>
&gt; ||0 ||compile-host-path<br>
&gt; |-<br>
&gt; ||0 ||file-rdeps<br>
&gt; |-<br>
&gt; ||0 ||host-user-contaminated<br>
&gt; |-<br>
&gt; ||0 ||installed-vs-shipped<br>
&gt; |-<br>
&gt; ||0 ||invalid-pkgconfig<br>
&gt; |-<br>
&gt; ||0 ||ldflags<br>
&gt; |-<br>
&gt; ||0 ||pkgname<br>
&gt; |-<br>
&gt; ||0 ||symlink-to-sysroot<br>
&gt; |-<br>
&gt; ||0 ||unknown-configure-option<br>
&gt; |-<br>
&gt; ||1 ||libdir<br>
&gt; |-<br>
&gt; ||21 ||version-going-backwards<br>
&gt; |-<br>
&gt; ||4 ||textrel<br>
&gt; |}<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D<br=
>
&gt;<br>
&gt; Complete log:<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.si=
gnatures.20170712_200847.log/" rel=3D"noreferrer" target=3D"_blank">http://=
logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>signatures.2017=
0712_200847.<wbr>log/</a><br>
&gt;<br>
&gt; No issues detected<br>
&gt;<br>
&gt;<br>
&gt; PNBLACKLISTs:<br>
&gt;<br>
&gt; openembedded-core/:<br>
&gt; meta-browser:<br>
&gt; meta-openembedded:<br>
&gt; meta-networking/recipes-<wbr>support/lksctp-tools/lksctp-<wbr>tools_1.=
0.17.bb:PNBLACKLIST[<wbr>lksctp-tools]<br>
&gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;l=
d-is-gold&#39;, &quot;BROKEN: fails to<br>
&gt; link against sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;<br>
&gt; meta-oe/recipes-connectivity/<wbr>bluez/bluez-hcidump_2.5.bb:PNB<wbr>L=
ACKLIST[bluez-hcidump]<br>
&gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;b=
luez5&#39;, &#39;bluez5 conflicts with<br>
&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}=
&quot;<br>
&gt; meta-oe/recipes-connectivity/<wbr>bluez/bluez4_4.101.bb:PNBLACKL<wbr>I=
ST[bluez4] ?=3D<br>
&gt; &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5=
&#39;, &#39;bluez5 conflicts with<br>
&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}=
&quot;<br>
&gt; meta-oe/recipes-connectivity/<wbr>bluez/gst-plugin-bluetooth_4.<wbr>10=
1.bb:PNBLACKLIST[gst-plugin-<wbr>bluetooth]<br>
&gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;b=
luez5&#39;, &#39;bluez5 conflicts with<br>
&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}=
&quot;<br>
&gt; meta-oe/recipes-graphics/<wbr>libsexy/libsexy_0.1.11.bb:PNBL<wbr>ACKLI=
ST[libsexy] ?=3D<br>
&gt; &quot;Fails to build with RSS<br>
&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/130607/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Details/130607/</a> - the recipe will be<br>
&gt; removed on 2017-09-01 unless the issue is fixed&quot;<br>
&gt; meta-oe/recipes-graphics/xorg-<wbr>driver/xf86-video-geode_2.11.<wbr>1=
6.bb:PNBLACKLIST[xf86-video-<wbr>geode]<br>
&gt; ?=3D &quot;BROKEN, fails to build - the recipe will be removed on 2017=
-09-01 unless<br>
&gt; the issue is fixed&quot;<br>
&gt; meta-oe/recipes-navigation/<wbr>foxtrotgps/foxtrotgps_1.1.1.<wbr>bb:PN=
BLACKLIST[foxtrotgps]<br>
&gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;b=
luez5&#39;, &#39;bluez5 conflicts with<br>
&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}=
&quot;<br>
&gt; meta-oe/recipes-navigation/<wbr>gypsy/gypsy.inc:PNBLACKLIST[<wbr>gypsy=
] ?=3D<br>
&gt; &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5=
&#39;, &#39;bluez5 conflicts with<br>
&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}=
&quot;<br>
&gt; meta-oe/recipes-navigation/<wbr>navit/navit.inc:PNBLACKLIST[<wbr>navit=
] ?=3D<br>
&gt; &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5=
&#39;, &#39;bluez5 conflicts with<br>
&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}=
&quot;<br>
&gt; meta-oe/recipes-support/<wbr>opensync/libsyncml_0.5.4.bb:PN<wbr>BLACKL=
IST[libsyncml]<br>
&gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;b=
luez5&#39;, &#39;bluez5 conflicts with<br>
&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}=
&quot;<br>
&gt; meta-qt5:<br>
&gt; meta-smartphone:<br>
&gt; meta-shr/recipes-shr/3rdparty/<wbr>libsensmon_git.bb:PNBLACKLIST[<wbr>=
libsensmon] ?=3D<br>
&gt; &quot;BROKEN: not compatible with newer vala,<br>
&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/143058/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Details/143058/</a>&quot;<br>
&gt; meta-shr/recipes-shr/3rdparty/<wbr>omhacks_git.bb:PNBLACKLIST[<wbr>omh=
acks] ?=3D &quot;Not<br>
&gt; compatible with gcc7 - the recipe will be removed on 2017-09-01 unless=
 the<br>
&gt; issue is fixed&quot;<br>
&gt; meta-webos-ports:<br>
&gt; meta-luneos/recipes-luneos/<wbr>luna-webappmanager/luna-<wbr>webappman=
ager.bb:PNBLACKLIST[<wbr>luna-webappmanager]<br>
&gt; ?=3D &quot;BROKEN: needs to be adapted to new qt-5.7&quot;<br>
&gt; meta-luneui/recipes-luneui/<wbr>luna-next/luna-next.bb:PNBLACK<wbr>LIS=
T[luna-next] ?=3D<br>
&gt; &quot;BROKEN: needs to be adapted to new qtwayland-5.7&quot;<br>
&gt; PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtual=
iazation<br>
&gt; which isn&#39;t included in my world builds&quot;<br>
&gt; PNBLACKLIST[bigbuckbunny-<wbr>1080p] =3D &quot;big and doesn&#39;t rea=
lly need to be tested<br>
&gt; so much&quot;<br>
&gt; PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really ne=
ed to be tested<br>
&gt; so much&quot;<br>
&gt; PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really ne=
ed to be tested<br>
&gt; so much&quot;<br>
&gt; PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really ne=
ed to be tested<br>
&gt; so much&quot;<br>
&gt; PNBLACKLIST[tearsofsteel-<wbr>1080p] =3D &quot;big and doesn&#39;t rea=
lly need to be tested<br>
&gt; so much&quot;<br>
&gt; PNBLACKLIST[build-appliance-<wbr>image] =3D &quot;tries to include who=
le downloads<br>
&gt; directory in /home/builder/poky :/&quot;<br>
&gt; PNBLACKLIST[linux-yocto-tiny-<wbr>kexecboot] =3D &quot;does weird sh!t=
 breaking other<br>
&gt; kernels and modules - broken for years&quot;<br>
&gt; PNBLACKLIST[linux-yocto-tiny] =3D &quot;does weird sh!t breaking other=
 kernels and<br>
&gt; modules - broken for years&quot;<br>
&gt;<br>
&gt;<br>
&gt; QA issues by type:<br>
&gt; count: 0 issue: already-stripped<br>
&gt;<br>
&gt;<br>
&gt; count: 1 issue: libdir<br>
&gt; qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:<br>
&gt; /usr/plugins/designer/.debug/<wbr>libqwt_designer_plugin.so [libdir]<b=
r>
&gt;<br>
&gt;<br>
&gt; count: 4 issue: textrel<br>
&gt; chromium-54.0.2810.2: ELF binary<br>
&gt; &#39;/tmp/work/i586-oe-linux/<wbr>chromium/54.0.2810.2-r0/<wbr>package=
s-split/chromium/usr/<wbr>bin/chromium/chrome&#39;<br>
&gt; has relocations in .text [textrel]<br>
&gt; chromium-wayland-53.0.2785.<wbr>143: ELF binary<br>
&gt; &#39;/tmp/work/i586-oe-linux/<wbr>chromium-wayland/53.0.2785.<wbr>143-=
r0/packages-split/<wbr>chromium-wayland/usr/bin/<wbr>chromium/chrome&#39;<b=
r>
&gt; has relocations in .text [textrel]<br>
&gt; corosync-2.4.2: ELF binary<br>
&gt; &#39;/tmp/work/core2-64-oe-linux/<wbr>corosync/2.4.2-r0/packages-<wbr>=
split/corosync/usr/sbin/<wbr>corosync&#39;<br>
&gt; has relocations in .text [textrel]<br>
&gt; x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary<br>
&gt; &#39;/tmp/work/i586-oe-linux/x264/<wbr>r2731+gitAUTOINC+2b741f81e5-<wb=
r>r0/packages-split/x264/usr/<wbr>lib/libx264.so.148&#39;<br>
&gt; has relocations in .text [textrel]<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: build-deps<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: file-rdeps<br>
&gt;<br>
&gt;<br>
&gt; count: 21 issue: version-going-backwards<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-dbg went backwards=
 which<br>
&gt; would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-dbg went backwards=
 which<br>
&gt; would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-dev went backwards=
 which<br>
&gt; would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-dev went backwards=
 which<br>
&gt; would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-doc went backwards=
 which<br>
&gt; would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-doc went backwards=
 which<br>
&gt; would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-locale went backwa=
rds<br>
&gt; which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-locale went backwa=
rds<br>
&gt; which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-ptest went backwar=
ds<br>
&gt; which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-ptest went backwar=
ds<br>
&gt; which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-staticdev went bac=
kwards<br>
&gt; which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog-staticdev went bac=
kwards<br>
&gt; which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog went backwards whi=
ch<br>
&gt; would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)<br>
&gt; [version-going-backwards]<br>
&gt; rsyslog-8.22.0: Package version for package rsyslog went backwards whi=
ch<br>
&gt; would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)<br>
&gt; [version-going-backwards]<br>
&gt; valgrind-3.12.0: Package version for package valgrind-dbg went backwar=
ds<br>
&gt; which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; valgrind-3.12.0: Package version for package valgrind-dev went backwar=
ds<br>
&gt; which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; valgrind-3.12.0: Package version for package valgrind-doc went backwar=
ds<br>
&gt; which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; valgrind-3.12.0: Package version for package valgrind-locale went back=
wards<br>
&gt; which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; valgrind-3.12.0: Package version for package valgrind-ptest went backw=
ards<br>
&gt; which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)=
<br>
&gt; [version-going-backwards]<br>
&gt; valgrind-3.12.0: Package version for package valgrind-staticdev went<b=
r>
&gt; backwards which would break package feeds from (0:3.12.0-r0.34 to<br>
&gt; 0:3.12.0-r0.0) [version-going-backwards]<br>
&gt; valgrind-3.12.0: Package version for package valgrind went backwards w=
hich<br>
&gt; would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)<br>
&gt; [version-going-backwards]<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: host-user-contaminated<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: installed-vs-shipped<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: unknown-configure-option<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: symlink-to-sysroot<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: invalid-pkgconfig<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: pkgname<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: ldflags<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: compile-host-path<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D<br=
>
&gt;<br>
&gt; latest upstream commit:<br>
&gt; 4a14b44 knotty: Drop task prefix of PLAIN log messages<br>
&gt; not included in master yet:<br>
&gt; dda3a10 world-image: add extra target<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - openembedded-core=
 =3D=3D<br>
&gt; latest upstream commit:<br>
&gt; b1c4661 libiconv: remove<br>
&gt; 0001-Fix-link-error-when-<wbr>compiling-with-gcc-O0.patch<br>
&gt; not included in master yet:<br>
&gt; dd1b5e7 report-error: Allow to upload reports automatically<br>
&gt; 7fdb805 buildhistory.bbclass: metadata-revs show repo parent<br>
&gt; 9b6fe73 metadata-revs: provide more information<br>
&gt; 2cd822c qemux86: Add identical qemux86copy variant for tests<br>
&gt; db1b8cf valgrind: fix link failure with gold<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-openembedded=
 =3D=3D<br>
&gt;<br>
&gt; latest upstream commit:<br>
&gt; 66b88f7 hwloc: Inherit pkgconfig<br>
&gt; not included in master yet:<br>
&gt; 9340320 dnsmasq: disable the service by default<br>
&gt; d1fca80 rdate: Fix build with hardening<br>
&gt; 96fd8e1 strongswan: Include stdint.h for uintptr_t<br>
&gt; 961797e netkit-rpc: Fix build with hardening flags<br>
&gt; b1fb0ad netkit-telnet: Fix build with hardening<br>
&gt; ed9432c ncftp: Upgrade to 3.2.6<br>
&gt; 2531f3e ippool: Fix build errors found with hardening flags<br>
&gt; 5963598 gflags: update SRC_URI with git fetcher<br>
&gt; 1a3966a unionfs-fuse: 0.26 -&gt; 2.0<br>
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
&gt; 8253d8c libtinyxml2: upgrade to 5.0.1<br>
&gt; e5d13e0 gnome-common: Add recipe (from oe-core)<br>
&gt; 2c09550 webrtc-audio-processing: initial recipe<br>
&gt; 3e83a12 libdbus-c++: Fix build with gcc7 and unblacklist<br>
&gt; a9b421b security_flags.inc: Delete<br>
&gt; 21ac7ab ltrace: Fix build on musl<br>
&gt; 9f59778 pptp-linux: Upgrade to 1.9.0<br>
&gt; 011d175 kodi: Fix build on powerpc<br>
&gt; 96ddef1 meta-python: Add Protobuf and gRPC Python recipes<br>
&gt; 6978c6c meta-python: Add pybluez recipe<br>
&gt; 5fc3a7b meta-python: Add python-daemon recipe and its dependencies<br>
&gt; b234cb7 udisks2: update 2.1.7 -&gt; 2.1.8<br>
&gt; 6351d5d gvfs: update 1.28.3 -&gt; 1.32.1<br>
&gt; 072a282 garcon: update 0.4.0 -&gt; 0.6.1<br>
&gt; 4ae21b2 gparted: update 0.27.0 -&gt; 0.28.1<br>
&gt; 85f9438 abiword: update 3.0.1 -&gt; 3.0.2<br>
&gt; f180ebe faac: update 1.28 -&gt; 1.29<br>
&gt; d4373e3 libdbus-c++: Add -pthread to linker flags<br>
&gt; 216bf8b klibc: Fix build with musl<br>
&gt; ac04fc6 ubi-utils-klibc: Pass TUNE_CCARGS into CFLAGS<br>
&gt; 225e21d kodi: Fix build on arm<br>
&gt; 5cce369 fluentbit: fix SYSTEMD_SERVICE name<br>
&gt; 626a865 Intel: remove license file<br>
&gt; 7fdf736 proj: update to 4.9.3<br>
&gt; ef59094 klibc: Fix linking by using bfd linker when default linker is =
gold<br>
&gt; 9b2852b libsombok3: add recipe<br>
&gt; 20b186c libmime-charset-perl: add recipe<br>
&gt; 3ccb597 libterm-readkey-perl: add recipe<br>
&gt; 91736f5 liblocale-gettext-perl: add recipe<br>
&gt; 9dfe3e1 libtext-charwidth-perl: add recipe<br>
&gt; f5158f7 libtext-wrapi18n-perl: add recipe<br>
&gt; 247aec7 libunicode-linebreak-perl: add recipe<br>
&gt; 131de8c po4a: add full functionalities<br>
&gt; 1815d4e ebtables: replace ebtables-save perl script with bash rewrite<=
br>
&gt; 8fc200c recipes: remove blacklisted recipes<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D<b=
r>
&gt; latest upstream commit:<br>
&gt; 2940d84 Revert &quot;qttools: DEPENDS on icu&quot;<br>
&gt; not included in master yet:<br>
&gt; 800d4c1 libconnman-qt5: update to 1.1.10<br>
&gt; 428be3c qtwebengine: add PACKAGECONFIG for webrtc<br>
&gt; 05455e6 qt5: add qt5-ptest.inc<br>
&gt; ec8c62e qtxmlpatterns: add ptest<br>
&gt; 1eac990 qtdeclarative: add ptest<br>
&gt; 2c1d6b1 qtquick1: add ptest<br>
&gt; aa0605d qtquickcontrols2: fix compilation of examples/texteditor<br>
&gt; 00d72cd qwt-qt5: Fix rpath issues<br>
&gt; c2768bd qtwebengine: fix build with gcc7<br>
&gt; 932515a qt5-ptest.inc: append do_populate_sysroot only for target<br>
&gt; bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-browser =3D=
=3D<br>
&gt;<br>
&gt; latest upstream commit:<br>
&gt; d822031 Merge pull request #49 from kraj/kraj/master<br>
&gt; not included in master yet:<br>
&gt; 6f790a0 gnome-settings-daemon: remove the bbappend for removed recipe<=
br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-webos-ports =
=3D=3D<br>
&gt;<br>
&gt; latest upstream commit:<br>
&gt; 9545fb6 packagegroup-luneos-extended: drop qtscenegraph-adaptation<br>
&gt; not included in master yet:<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-smartphone =
=3D=3D<br>
&gt; latest upstream commit:<br>
&gt; 80b8107 android-system-image-<wbr>tenderloin: Fix checksums<br>
&gt; not included in master yet:<br>
&gt; e523b07 meta-shr, meta-fso: remove blacklisted recipes<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--94eb2c056680d418da05544a082a--
