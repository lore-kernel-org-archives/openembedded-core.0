Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 15CB377BBE;
	Tue, 18 Jul 2017 08:22:29 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id 70so3976884ybn.2;
	Tue, 18 Jul 2017 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KwjnNv+kniDNlkT6erB6oJCo6DIzlLajal4W+H2SAZI=;
	b=jAVHuSfQ5KrWr7Cado2BEs12dQsVw9UF4uuDi3JTfR5xl0FGlPDaTET/2g0QfESXLr
	FqpXAlU1i7U/Mtr66zuKxmiIoEuN2ok1rObBlrxXePAjN8/4VfIDiU5EFeNjZn7cK8BH
	05ZEDRRYDSNEgPAEF1lCE+cM6lPdY0G7pBrMEQFUtixlf5s+Z8fYnOCT3oAxlUZzi2Vr
	DNhfgh4om+mriZGSRA25+4V7drOwLpTTjqhWUODoPlB7t9fpEABdbkUxz/zGkgNQ+AiB
	7TEo8aB6C9JbJPjv/+M2EMijRBPFca8y+DfnOMKgt798UhfxmSElOqXeEwqonsxPMpZG
	x72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KwjnNv+kniDNlkT6erB6oJCo6DIzlLajal4W+H2SAZI=;
	b=NYyX0id6jMHw4vLQbYwcXdSVAcj/lBoOxQsj7V0j/xOM0w+Gb1A5tpkiS3jpQIAguh
	Tfg7NnyBEGYYcjBaNsoGsJFEUCX/dL5Pi1PTNl2ToTPb7BrdUDyULTcrylHz+whCr54s
	9NTyn+RHY2XRJ7c7nh1SKreIbI1XIE75RcACsuWPhfdZcVDGuw2UfqDRIPGXKZvO3xiW
	8+WlEo9PyXrDBPa5dgjUSsUiqIeb6WVJtmZchaIpSLC1SSOXrI2Yp9GTsxqwMJQWWmhw
	fZ0X1YjZ0Ydg+75kTDXn3g6SuyDLn5Ynr0VClZ5iH7owbzhAXblffVZEZZxo2M3ui5mi
	QAqA==
X-Gm-Message-State: AIVw113c82AqpnX7yA5No3thRLqHg+89VCf567T/Y5Qm7HajWw6jo+Aj
	g1rmTzn86z/1LHKl594EbqZ8Ul0H6g==
X-Received: by 10.37.80.129 with SMTP id e123mr317873ybb.109.1500366150862;
	Tue, 18 Jul 2017 01:22:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Tue, 18 Jul 2017 01:22:30 -0700 (PDT)
In-Reply-To: <CAMKF1soEKVfTqV=F=s=-XGE9zvFdscHEBGy8dp18AE79NaGQdg@mail.gmail.com>
References: <20170717103941.GA3679@jama>
	<CA+chaQd6=GxCaYe1d4BO_yJM4myTkYmJu-EWG8vDB++BxfMT7Q@mail.gmail.com>
	<CAMKF1soEKVfTqV=F=s=-XGE9zvFdscHEBGy8dp18AE79NaGQdg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Jul 2017 10:22:30 +0200
Message-ID: <CA+chaQd7_1cUw-CCJ5urvFCKtNJoS-4LC1zBpa43aFOQmNKk5A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 18 Jul 2017 08:22:30 -0000
Content-Type: multipart/alternative; boundary="001a114026f6748e4f0554933766"

--001a114026f6748e4f0554933766
Content-Type: text/plain; charset="UTF-8"

I don't know what setup you're using, but my is described here:
http://www.openembedded.org/wiki/Bitbake_World_Status_Setup

and the current version published with the results:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170717_011149.log/world_fixes.inc

now I see that e.g. security-flags.inc addition i not shown in
world_fixes.inc above, because I've added it to local.conf in:
https://github.com/shr-project/jenkins-jobs/commit/94a25010b439e9144e4b564102c4ee7a7c1e5277

I'll move them and few other lines to world_fixes.inc.


On Tue, Jul 18, 2017 at 5:03 AM, Khem Raj <raj.khem@gmail.com> wrote:

> firefox and ipppool seems to not fail for me here.
> so I wonder what might be different.
>
> On Mon, Jul 17, 2017 at 11:49 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > The v2s of those patches really helped:
> >
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
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
> > ||2017-07-17 ||5 ||4 ||4 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0
> ||0 ||0 ||0 ||
> > |}
> >
> > == Failed tasks 2017-07-17 ==
> >
> > INFO: jenkins-job.sh-1.8.25 Complete log available at
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> report.20170717_054804.log
> >
> > === common (4) ===
> >     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:d
> o_compile
> >     *
> > meta-openembedded/meta-networking/recipes-daemons/ippool/ippool_1.3.bb:
> do_compile
> >     *
> > meta-webos-ports/meta-luneui/recipes-webos/pmloglib/pmloglib.bb:
> do_compile
> >     *
> > openembedded-core/meta/recipes-devtools/systemd-
> bootchart/systemd-bootchart_231.bb:do_compile
> >
> > === common-x86 (0) ===
> >
> > === qemuarm (1) ===
> >     *
> > meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:
> do_compile
> >
> > === qemux86 (0) ===
> >
> > === qemux86_64 (0) ===
> >
> > === Number of failed tasks (13) ===
> > {| class=wikitable
> > |-
> > || qemuarm || 5 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemuarm.20170717_011149.log/
> > || http://errors.yoctoproject.org/Errors/Build/41271/
> > |-
> > || qemux86 || 4 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86.20170717_011149.log/
> > || http://errors.yoctoproject.org/Errors/Build/41272/
> > |-
> > || qemux86_64 || 4 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86-64.20170717_031905.log/
> > || http://errors.yoctoproject.org/Errors/Build/41273/
> > |}
> >
> > === PNBLACKLISTs (14) ===
> >
> > === QA issues (0) ===
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
> > ||0 ||libdir
> > |-
> > ||0 ||pkgname
> > |-
> > ||0 ||symlink-to-sysroot
> > |-
> > ||0 ||textrel
> > |-
> > ||0 ||unknown-configure-option
> > |-
> > ||0 ||version-going-backwards
> > |}
> >
> >
> >
> > === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> >
> > Complete log:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> signatures.20170717_031354.log/
> >
> > No issues detected
> >
> >
> > PNBLACKLISTs:
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
> > PNBLACKLIST[build-appliance-
> > image] = "tries to include whole downloads directory in
> /home/builder/poky
> > :/"
> >
> >
> > QA issues by type:
> > count: 0 issue: already-stripped
> >
> >
> > count: 0 issue: libdir
> >
> >
> > count: 0 issue: textrel
> >
> >
> > count: 0 issue: build-deps
> >
> >
> > count: 0 issue: file-rdeps
> >
> >
> > count: 0 issue: version-going-backwards
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
> > ae75724 icecc.bbclass: prevent nativesdk builds depending on target
> specific
> > KERNEL_CC
> > 4c28728 report-error: Allow to upload reports automatically
> > 205c547 buildhistory.bbclass: metadata-revs show repo parent
> > ef06cb2 metadata-revs: provide more information
> > 4cdff2b qemux86: Add identical qemux86copy variant for tests
> > 617ef4f valgrind: fix link failure with gold
> >
> > == Tested changes (not included in master yet) - meta-openembedded ==
> > latest upstream commit:
> > 1cbd1bc unionfs-fuse: 0.26 -> 2.0
> > not included in master yet:
> > c6d4c7a dnsmasq: disable the service by default
> > ba5e474 rdate: Fix build with hardening
> > cb4a014 strongswan: Include stdint.h for uintptr_t
> > 046d96d netkit-rpc: Fix build with hardening flags
> > caf0d05 netkit-telnet: Fix build with hardening
> > 933f271 ncftp: Upgrade to 3.2.6
> > 31642e1 ippool: Fix build errors found with hardening flags
> > 7728c8f autofs: Add build dependency on libnsl2
> > e4a0edd openhpi: Fix build on 64bit platforms e.g. aarch64
> > d6b2593 security_flags.inc: Delete
> > 98a8830 pptp-linux: Upgrade to 1.9.0
> > 39176bd ebtables: replace ebtables-save perl script with bash rewrite
> > 80a8634 librcf: RDEPENDS on protobuf, json-spirit
> > bbb9286 fuse: Correct runlevels and startup order
> > 1483a97 recipes-utils: Add recipe for udevil
> > d50395e klibc: Fix build issue when default ISA is not thumb
> > 852412e libteam: Upgrade to 1.27
> > cebae2c sox: Fix build with musl
> > 4b4a68f webrtc-audio-processing: Link with libexecinfo on musl
> > 4c56033 cdparanoia: Fix build with musl
> > a8481ce lightmediascanner: Define comparison_fn_t if undefined
> > ab4314a lmbench: Fix build with musl
> > daab2b9 xfce4-netload-plugin: Do not include sys/sysctl.h
> > 5a30d20 imsettings: Fix build with musl
> > 0206352 gedit: Define ACCESSPERMS if not defined already
> > 8fd8bc8 onboard: Fix build with musl
> > 43ad720 libgtop: Fix build with musl
> > ea840c2 netdata: Upgrade to 1.6.0
> > 14d749f can-utils: Update to tip of master
> > 1c46c71 kexec-tools-klibc: Fix build with musl
> > b75b17c dracut: Upgrade to 045
> > ae7ac67 yaffs2-utils: Fix build with musl
> > 82650e1 logfsprogs: Rename setkey API to _setkey to not conflict with
> libc
> > e060cf2 unionfs-fuse: Fix build with musl
> > a764ec3 xfsdump: Fix build with musl
> > d0ea52a nmon: Upgrade to 16g
> > bbac8d6 metacity: Fix build with musl by defining _GNU_SOURCE
> > ba84876 monkey: Link in libexecinfo on musl
> > fdb7abc aufs-util: Upgrade to 4.4 release
> > 872870c uftrace: add recipe
> > 991233a iperf3: Fix missing stdint.h and do not link with -pg
> > 77817c3 v4l-utils: Fix build with musl
> > 065575a pimd: Upgrade to 2.3.2
> > dd6c1d7 recipes: remove blacklisted recipes
> >
> > == Tested changes (not included in master yet) - meta-qt5 ==
> > latest upstream commit:
> > bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault
> > not included in master yet:
> > 2afd1b7 maliit-framework-qt5: Always have optimize flags
> > 92c634e qt5-creator: Fix build with NO_ACCESSIBILITY
> > d69be5d qtwebengine: Fix build on musl
> > e1027a5 qtvirtualkeyboard: Include sys/time.h
> > 045e39b qt5-creator: Link with libexecinfo on musl
> >
> > == Tested changes (not included in master yet) - meta-browser ==
> > latest upstream commit:
> > 6c063d6 Merge pull request #53 from kraj/kraj/master
> > not included in master yet:
> > 8ca260e gnome-settings-daemon: remove the bbappend for removed recipe
> >
> > == Tested changes (not included in master yet) - meta-webos-ports ==
> > latest upstream commit:
> > 2186458 packagegroup-luneos-extended: drop qtscenegraph-adaptation
> > not included in master yet:
> >
> > == Tested changes (not included in master yet) - meta-smartphone ==
> > latest upstream commit:
> > 1fe2b3b android-system-image-tenderloin: update Android image
> > not included in master yet:
> > 2bc4aaf meta-shr, meta-fso: remove blacklisted recipes
> >
> >
> >
> > On Mon, Jul 17, 2017 at 12:39 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >>
> >> This time with conf/distro/include/security_flags.inc included as
> >> requested by Khem
> >>
> >> systemd-bootchart is broken since glibc upgrade, Khem already suggested
> >> the fix, hopefully Chen Qi or someone else will fix it soon.
> >>
> >> nmon is broken even without security_flags.inc but v2 from Khem looks
> >> like it should fix it.
> >>
> >> There is also v2 for metacity and monkey in master-next now, so
> hopefully
> >> next build will be a bit better again.
> >>
> >> http://www.openembedded.org/wiki/Bitbake_World_Status
> >>
> >> == Number of issues - stats ==
> >> {| class='wikitable'
> >> !|Date               !!colspan='3'|Failed tasks
> >> !!|Signatures                 !!colspan='14'|QA !!Comment
> >> |-
> >> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||all
> >> ||already-stripped      ||libdir        ||textrel       ||build-deps
> >> ||file-rdeps    ||version-going-backwards       ||host-user-contaminated
> >> ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot
> >> ||invalid-pkgconfig     ||pkgname       ||ldflags
>  ||compile-host-path
> >> ||
> >> |-
> >> ||2017-07-16    ||8     ||6     ||7     ||0     ||0             ||1
> >> ||4             ||0             ||0             ||0             ||0
> >> ||0             ||0             ||0             ||0             ||0
> >> ||0             ||0             ||
> >> |}
> >>
> >> == Failed tasks 2017-07-16 ==
> >>
> >> INFO: jenkins-job.sh-1.8.25 Complete log available at
> >> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> report.20170717_002720.log
> >>
> >> === common (6) ===
> >>     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:d
> o_compile
> >>     *
> >> meta-openembedded/meta-gnome/recipes-gnome/metacity/
> metacity_2.34.13.bb:do_compile
> >>     *
> >> meta-openembedded/meta-networking/recipes-daemons/ippool/ippool_1.3.bb:
> do_compile
> >>     *
> >> meta-openembedded/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb:
> do_compile
> >>     *
> >> meta-webos-ports/meta-luneui/recipes-webos/pmloglib/pmloglib.bb:
> do_compile
> >>     *
> >> openembedded-core/meta/recipes-devtools/systemd-
> bootchart/systemd-bootchart_231.bb:do_compile
> >>
> >> === common-x86 (0) ===
> >>
> >> === qemuarm (2) ===
> >>     *
> >> meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:
> do_compile
> >>     *
> >> meta-openembedded/meta-oe/recipes-support/nmon/nmon_16g.bb:do_compile
> >>
> >> === qemux86 (0) ===
> >>
> >> === qemux86_64 (0) ===
> >>
> >> === Number of failed tasks (21) ===
> >> {| class=wikitable
> >> |-
> >> || qemuarm      || 8     ||
> >> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemuarm.20170714_122654.log/
> >> || http://errors.yoctoproject.org/Errors/Build/41265/
> >> |-
> >> || qemux86      || 6     ||
> >> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86.20170714_122654.log/
> >> || http://errors.yoctoproject.org/Errors/Build/41266/
> >> |-
> >> || qemux86_64   || 7     ||
> >> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86-64.20170716_100826.log/
> >> || http://errors.yoctoproject.org/Errors/Build/41270/
> >> |}
> >>
> >> === PNBLACKLISTs (14) ===
> >>
> >> === QA issues (5) ===
> >> {| class=wikitable
> >> !| Count                ||Issue
> >> |-
> >> ||0     ||already-stripped
> >> |-
> >> ||0     ||build-deps
> >> |-
> >> ||0     ||compile-host-path
> >> |-
> >> ||0     ||file-rdeps
> >> |-
> >> ||0     ||host-user-contaminated
> >> |-
> >> ||0     ||installed-vs-shipped
> >> |-
> >> ||0     ||invalid-pkgconfig
> >> |-
> >> ||0     ||ldflags
> >> |-
> >> ||0     ||pkgname
> >> |-
> >> ||0     ||symlink-to-sysroot
> >> |-
> >> ||0     ||unknown-configure-option
> >> |-
> >> ||0     ||version-going-backwards
> >> |-
> >> ||1     ||libdir
> >> |-
> >> ||4     ||textrel
> >> |}
> >>
> >>
> >>
> >> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> >>
> >> Complete log:
> >> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> signatures.20170715_102407.log/
> >>
> >> No issues detected
> >>
> >>
> >> PNBLACKLISTs:
> >> openembedded-core/:
> >> meta-browser:
> >> meta-openembedded:
> >>
> >> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:
> PNBLACKLIST[lksctp-tools]
> >> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
> fails to
> >> link against sctp_connectx symbol", '', d)}"
> >>
> >> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNB
> LACKLIST[bluez-hcidump]
> >> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
> conflicts with
> >> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> >> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4]
> ?=
> >> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with
> >> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> >>
> >> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:
> PNBLACKLIST[gst-plugin-bluetooth]
> >> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
> conflicts with
> >> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> >> meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy]
> ?=
> >> "Fails to build with RSS
> >> http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe
> will be
> >> removed on 2017-09-01 unless the issue is fixed"
> >>
> >> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:
> PNBLACKLIST[xf86-video-geode]
> >> ?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01
> unless
> >> the issue is fixed"
> >>
> >> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.
> bb:PNBLACKLIST[foxtrotgps]
> >> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
> conflicts with
> >> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> >> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
> >> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with
> >> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> >> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
> >> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
> with
> >> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> >> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PN
> BLACKLIST[libsyncml]
> >> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
> conflicts with
> >> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> >> meta-qt5:
> >> meta-smartphone:
> >> meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon]
> ?=
> >> "BROKEN: not compatible with newer vala,
> >> http://errors.yoctoproject.org/Errors/Details/143058/"
> >> meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?=
> "Not
> >> compatible with gcc7 - the recipe will be removed on 2017-09-01 unless
> the
> >> issue is fixed"
> >> meta-webos-ports:
> >>
> >> meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:
> PNBLACKLIST[luna-webappmanager]
> >> ?= "BROKEN: needs to be adapted to new qt-5.7"
> >> meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACK
> LIST[luna-next]
> >> ?= "BROKEN: needs to be adapted to new qtwayland-5.7"
> >> PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
> >> which isn't included in my world builds"
> >> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> >> tested so much"
> >> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
> tested
> >> so much"
> >> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> tested
> >> so much"
> >> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> tested
> >> so much"
> >> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> >> tested so much"
> >> PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> >> directory in /home/builder/poky :/"
> >>
> >>
> >> QA issues by type:
> >> count: 0        issue: already-stripped
> >>
> >>
> >> count: 1        issue: libdir
> >> qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:
> >> /usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]
> >>
> >>
> >> count: 4        issue: textrel
> >> chromium-54.0.2810.2: ELF binary
> >> '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/
> packages-split/chromium/usr/bin/chromium/chrome'
> >> has relocations in .text [textrel]
> >> chromium-wayland-53.0.2785.143: ELF binary
> >> '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.
> 143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
> >> has relocations in .text [textrel]
> >> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> >> '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-
> r0/packages-split/x264-bin/usr/bin/x264'
> >> has relocations in .text [textrel]
> >> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> >> '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-
> r0/packages-split/x264/usr/lib/libx264.so.148'
> >> has relocations in .text [textrel]
> >>
> >>
> >> count: 0        issue: build-deps
> >>
> >>
> >> count: 0        issue: file-rdeps
> >>
> >>
> >> count: 0        issue: version-going-backwards
> >>
> >>
> >> count: 0        issue: host-user-contaminated
> >>
> >>
> >> count: 0        issue: installed-vs-shipped
> >>
> >>
> >> count: 0        issue: unknown-configure-option
> >>
> >>
> >> count: 0        issue: symlink-to-sysroot
> >>
> >>
> >> count: 0        issue: invalid-pkgconfig
> >>
> >>
> >> count: 0        issue: pkgname
> >>
> >>
> >> count: 0        issue: ldflags
> >>
> >>
> >> count: 0        issue: compile-host-path
> >>
> >>
> >>
> >> == Tested changes (not included in master yet) - bitbake ==
> >> latest upstream commit:
> >> 4a14b44 knotty: Drop task prefix of PLAIN log messages
> >> not included in master yet:
> >> dda3a10 world-image: add extra target
> >>
> >> == Tested changes (not included in master yet) - openembedded-core ==
> >> latest upstream commit:
> >> b1c4661 libiconv: remove
> >> 0001-Fix-link-error-when-compiling-with-gcc-O0.patch
> >> not included in master yet:
> >> ae75724 icecc.bbclass: prevent nativesdk builds depending on target
> >> specific KERNEL_CC
> >> 4c28728 report-error: Allow to upload reports automatically
> >> 205c547 buildhistory.bbclass: metadata-revs show repo parent
> >> ef06cb2 metadata-revs: provide more information
> >> 4cdff2b qemux86: Add identical qemux86copy variant for tests
> >> 617ef4f valgrind: fix link failure with gold
> >>
> >> == Tested changes (not included in master yet) - meta-openembedded ==
> >> latest upstream commit:
> >> 1cbd1bc unionfs-fuse: 0.26 -> 2.0
> >> not included in master yet:
> >> c6d4c7a dnsmasq: disable the service by default
> >> ba5e474 rdate: Fix build with hardening
> >> cb4a014 strongswan: Include stdint.h for uintptr_t
> >> 046d96d netkit-rpc: Fix build with hardening flags
> >> caf0d05 netkit-telnet: Fix build with hardening
> >> 933f271 ncftp: Upgrade to 3.2.6
> >> 31642e1 ippool: Fix build errors found with hardening flags
> >> 7728c8f autofs: Add build dependency on libnsl2
> >> e4a0edd openhpi: Fix build on 64bit platforms e.g. aarch64
> >> d6b2593 security_flags.inc: Delete
> >> 98a8830 pptp-linux: Upgrade to 1.9.0
> >> 39176bd ebtables: replace ebtables-save perl script with bash rewrite
> >> 80a8634 librcf: RDEPENDS on protobuf, json-spirit
> >> bbb9286 fuse: Correct runlevels and startup order
> >> 1483a97 recipes-utils: Add recipe for udevil
> >> d50395e klibc: Fix build issue when default ISA is not thumb
> >> 852412e libteam: Upgrade to 1.27
> >> cebae2c sox: Fix build with musl
> >> 4b4a68f webrtc-audio-processing: Link with libexecinfo on musl
> >> 4c56033 cdparanoia: Fix build with musl
> >> a8481ce lightmediascanner: Define comparison_fn_t if undefined
> >> ab4314a lmbench: Fix build with musl
> >> daab2b9 xfce4-netload-plugin: Do not include sys/sysctl.h
> >> 5a30d20 imsettings: Fix build with musl
> >> 0206352 gedit: Define ACCESSPERMS if not defined already
> >> 8fd8bc8 onboard: Fix build with musl
> >> 43ad720 libgtop: Fix build with musl
> >> ea840c2 netdata: Upgrade to 1.6.0
> >> 14d749f can-utils: Update to tip of master
> >> 1c46c71 kexec-tools-klibc: Fix build with musl
> >> b75b17c dracut: Upgrade to 045
> >> ae7ac67 yaffs2-utils: Fix build with musl
> >> 82650e1 logfsprogs: Rename setkey API to _setkey to not conflict with
> libc
> >> e060cf2 unionfs-fuse: Fix build with musl
> >> a764ec3 xfsdump: Fix build with musl
> >> 1c5c8e8 nmon: Upgrade to 16g
> >> 5d80364 metacity: Fix build with musl
> >> 9d50570 monkey: Link in libexecinfo on musl
> >> fcee6e9 aufs-util: Upgrade to 4.4 release
> >> ad0c2dc recipes: remove blacklisted recipes
> >>
> >> == Tested changes (not included in master yet) - meta-qt5 ==
> >> latest upstream commit:
> >> bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault
> >> not included in master yet:
> >> 2afd1b7 maliit-framework-qt5: Always have optimize flags
> >> 92c634e qt5-creator: Fix build with NO_ACCESSIBILITY
> >> d69be5d qtwebengine: Fix build on musl
> >> e1027a5 qtvirtualkeyboard: Include sys/time.h
> >> 045e39b qt5-creator: Link with libexecinfo on musl
> >>
> >> == Tested changes (not included in master yet) - meta-browser ==
> >> latest upstream commit:
> >> 6c063d6 Merge pull request #53 from kraj/kraj/master
> >> not included in master yet:
> >> 8ca260e gnome-settings-daemon: remove the bbappend for removed recipe
> >>
> >> == Tested changes (not included in master yet) - meta-webos-ports ==
> >> latest upstream commit:
> >> 2186458 packagegroup-luneos-extended: drop qtscenegraph-adaptation
> >> not included in master yet:
> >>
> >> == Tested changes (not included in master yet) - meta-smartphone ==
> >> latest upstream commit:
> >> bbeb2c2 linux-hp-tenderloin: bump  SRCREV
> >> not included in master yet:
> >> 7fd4215 meta-shr, meta-fso: remove blacklisted recipes
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

--001a114026f6748e4f0554933766
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t know what setup you&#39;re using, but my is de=
scribed here:<div><a href=3D"http://www.openembedded.org/wiki/Bitbake_World=
_Status_Setup">http://www.openembedded.org/wiki/Bitbake_World_Status_Setup<=
/a><br></div><div><br></div><div>and the current version published with the=
 results:</div><div><a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/rocko/log.world.qemuarm.20170717_011149.log/world_fixes.inc">http://logs=
.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170717_011149=
.log/world_fixes.inc</a><br></div><div><br></div><div>now I see that e.g. s=
ecurity-flags.inc addition i not shown in world_fixes.inc above, because I&=
#39;ve added it to local.conf in:</div><div><a href=3D"https://github.com/s=
hr-project/jenkins-jobs/commit/94a25010b439e9144e4b564102c4ee7a7c1e5277">ht=
tps://github.com/shr-project/jenkins-jobs/commit/94a25010b439e9144e4b564102=
c4ee7a7c1e5277</a><br></div><div><br></div><div>I&#39;ll move them and few =
other lines to world_fixes.inc.</div><div><br></div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Tue, Jul 18, 2017 at 5:03 AM, K=
hem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">firefox and ipppool seems to not fail for me here.<br>
so I wonder what might be different.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Mon, Jul 17, 2017 at 11:49 AM, Martin Jansa &lt;<a href=3D"mailto:martin=
.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; The v2s of those patches really helped:<br>
&gt;<br>
&gt; <a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" rel=
=3D"noreferrer" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/Bit=
bake_World_Status</a><br>
&gt;<br>
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
&gt; ||2017-07-17 ||5 ||4 ||4 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 |=
|0 ||0 ||0 ||0 ||<br>
&gt; |}<br>
&gt;<br>
&gt; =3D=3D Failed tasks 2017-07-17 =3D=3D<br>
&gt;<br>
&gt; INFO: jenkins-job.sh-1.8.25 Complete log available at<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.re=
port.20170717_054804.log" rel=3D"noreferrer" target=3D"_blank">http://logs.=
nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>report.20170717_0548=
04.log</a><br>
&gt;<br>
&gt; =3D=3D=3D common (4) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0* meta-browser/recipes-mozilla/<wbr>firefox/firefox=
_45.9.0esr.bb:d<wbr>o_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; meta-openembedded/meta-<wbr>networking/recipes-daemons/<wbr>ippool/ipp=
ool_1.3.bb:do_<wbr>compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; meta-webos-ports/meta-luneui/<wbr>recipes-webos/pmloglib/<wbr>pmloglib=
.bb:do_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; openembedded-core/meta/<wbr>recipes-devtools/systemd-<wbr>bootchart/sy=
stemd-bootchart_<wbr>231.bb:do_compile<br>
&gt;<br>
&gt; =3D=3D=3D common-x86 (0) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D qemuarm (1) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; meta-openembedded/meta-oe/<wbr>recipes-support/mysql/mariadb_<wbr>5.5.=
55.bb:do_compile<br>
&gt;<br>
&gt; =3D=3D=3D qemux86 (0) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D qemux86_64 (0) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D Number of failed tasks (13) =3D=3D=3D<br>
&gt; {| class=3Dwikitable<br>
&gt; |-<br>
&gt; || qemuarm || 5 ||<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wo=
rld.qemuarm.20170717_011149.log/" rel=3D"noreferrer" target=3D"_blank">http=
://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemuar=
m.20170717_011149.<wbr>log/</a><br>
&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41271/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Build/41271/</a><br>
&gt; |-<br>
&gt; || qemux86 || 4 ||<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wo=
rld.qemux86.20170717_011149.log/" rel=3D"noreferrer" target=3D"_blank">http=
://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemux8=
6.20170717_011149.<wbr>log/</a><br>
&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41272/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Build/41272/</a><br>
&gt; |-<br>
&gt; || qemux86_64 || 4 ||<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wo=
rld.qemux86-64.20170717_031905.log/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qem=
ux86-64.20170717_<wbr>031905.log/</a><br>
&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41273/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Build/41273/</a><br>
&gt; |}<br>
&gt;<br>
&gt; =3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D QA issues (0) =3D=3D=3D<br>
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
&gt; ||0 ||libdir<br>
&gt; |-<br>
&gt; ||0 ||pkgname<br>
&gt; |-<br>
&gt; ||0 ||symlink-to-sysroot<br>
&gt; |-<br>
&gt; ||0 ||textrel<br>
&gt; |-<br>
&gt; ||0 ||unknown-configure-option<br>
&gt; |-<br>
&gt; ||0 ||version-going-backwards<br>
&gt; |}<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D<br=
>
&gt;<br>
&gt; Complete log:<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.si=
gnatures.20170717_031354.log/" rel=3D"noreferrer" target=3D"_blank">http://=
logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>signatures.2017=
0717_031354.<wbr>log/</a><br>
&gt;<br>
&gt; No issues detected<br>
&gt;<br>
&gt;<br>
&gt; PNBLACKLISTs:<br>
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
&gt; PNBLACKLIST[build-appliance-<br>
&gt; image] =3D &quot;tries to include whole downloads directory in /home/b=
uilder/poky<br>
&gt; :/&quot;<br>
&gt;<br>
&gt;<br>
&gt; QA issues by type:<br>
&gt; count: 0 issue: already-stripped<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: libdir<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: textrel<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: build-deps<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: file-rdeps<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: version-going-backwards<br>
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
&gt; ae75724 icecc.bbclass: prevent nativesdk builds depending on target sp=
ecific<br>
&gt; KERNEL_CC<br>
&gt; 4c28728 report-error: Allow to upload reports automatically<br>
&gt; 205c547 buildhistory.bbclass: metadata-revs show repo parent<br>
&gt; ef06cb2 metadata-revs: provide more information<br>
&gt; 4cdff2b qemux86: Add identical qemux86copy variant for tests<br>
&gt; 617ef4f valgrind: fix link failure with gold<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-openembedded=
 =3D=3D<br>
&gt; latest upstream commit:<br>
&gt; 1cbd1bc unionfs-fuse: 0.26 -&gt; 2.0<br>
&gt; not included in master yet:<br>
&gt; c6d4c7a dnsmasq: disable the service by default<br>
&gt; ba5e474 rdate: Fix build with hardening<br>
&gt; cb4a014 strongswan: Include stdint.h for uintptr_t<br>
&gt; 046d96d netkit-rpc: Fix build with hardening flags<br>
&gt; caf0d05 netkit-telnet: Fix build with hardening<br>
&gt; 933f271 ncftp: Upgrade to 3.2.6<br>
&gt; 31642e1 ippool: Fix build errors found with hardening flags<br>
&gt; 7728c8f autofs: Add build dependency on libnsl2<br>
&gt; e4a0edd openhpi: Fix build on 64bit platforms e.g. aarch64<br>
&gt; d6b2593 security_flags.inc: Delete<br>
&gt; 98a8830 pptp-linux: Upgrade to 1.9.0<br>
&gt; 39176bd ebtables: replace ebtables-save perl script with bash rewrite<=
br>
&gt; 80a8634 librcf: RDEPENDS on protobuf, json-spirit<br>
&gt; bbb9286 fuse: Correct runlevels and startup order<br>
&gt; 1483a97 recipes-utils: Add recipe for udevil<br>
&gt; d50395e klibc: Fix build issue when default ISA is not thumb<br>
&gt; 852412e libteam: Upgrade to 1.27<br>
&gt; cebae2c sox: Fix build with musl<br>
&gt; 4b4a68f webrtc-audio-processing: Link with libexecinfo on musl<br>
&gt; 4c56033 cdparanoia: Fix build with musl<br>
&gt; a8481ce lightmediascanner: Define comparison_fn_t if undefined<br>
&gt; ab4314a lmbench: Fix build with musl<br>
&gt; daab2b9 xfce4-netload-plugin: Do not include sys/sysctl.h<br>
&gt; 5a30d20 imsettings: Fix build with musl<br>
&gt; 0206352 gedit: Define ACCESSPERMS if not defined already<br>
&gt; 8fd8bc8 onboard: Fix build with musl<br>
&gt; 43ad720 libgtop: Fix build with musl<br>
&gt; ea840c2 netdata: Upgrade to 1.6.0<br>
&gt; 14d749f can-utils: Update to tip of master<br>
&gt; 1c46c71 kexec-tools-klibc: Fix build with musl<br>
&gt; b75b17c dracut: Upgrade to 045<br>
&gt; ae7ac67 yaffs2-utils: Fix build with musl<br>
&gt; 82650e1 logfsprogs: Rename setkey API to _setkey to not conflict with =
libc<br>
&gt; e060cf2 unionfs-fuse: Fix build with musl<br>
&gt; a764ec3 xfsdump: Fix build with musl<br>
&gt; d0ea52a nmon: Upgrade to 16g<br>
&gt; bbac8d6 metacity: Fix build with musl by defining _GNU_SOURCE<br>
&gt; ba84876 monkey: Link in libexecinfo on musl<br>
&gt; fdb7abc aufs-util: Upgrade to 4.4 release<br>
&gt; 872870c uftrace: add recipe<br>
&gt; 991233a iperf3: Fix missing stdint.h and do not link with -pg<br>
&gt; 77817c3 v4l-utils: Fix build with musl<br>
&gt; 065575a pimd: Upgrade to 2.3.2<br>
&gt; dd6c1d7 recipes: remove blacklisted recipes<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D<b=
r>
&gt; latest upstream commit:<br>
&gt; bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault<br>
&gt; not included in master yet:<br>
&gt; 2afd1b7 maliit-framework-qt5: Always have optimize flags<br>
&gt; 92c634e qt5-creator: Fix build with NO_ACCESSIBILITY<br>
&gt; d69be5d qtwebengine: Fix build on musl<br>
&gt; e1027a5 qtvirtualkeyboard: Include sys/time.h<br>
&gt; 045e39b qt5-creator: Link with libexecinfo on musl<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-browser =3D=
=3D<br>
&gt; latest upstream commit:<br>
&gt; 6c063d6 Merge pull request #53 from kraj/kraj/master<br>
&gt; not included in master yet:<br>
&gt; 8ca260e gnome-settings-daemon: remove the bbappend for removed recipe<=
br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-webos-ports =
=3D=3D<br>
&gt; latest upstream commit:<br>
&gt; 2186458 packagegroup-luneos-extended: drop qtscenegraph-adaptation<br>
&gt; not included in master yet:<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-smartphone =
=3D=3D<br>
&gt; latest upstream commit:<br>
&gt; 1fe2b3b android-system-image-<wbr>tenderloin: update Android image<br>
&gt; not included in master yet:<br>
&gt; 2bc4aaf meta-shr, meta-fso: remove blacklisted recipes<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Jul 17, 2017 at 12:39 PM, Martin Jansa &lt;<a href=3D"mailto:m=
artin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This time with conf/distro/include/security_<wbr>flags.inc include=
d as<br>
&gt;&gt; requested by Khem<br>
&gt;&gt;<br>
&gt;&gt; systemd-bootchart is broken since glibc upgrade, Khem already sugg=
ested<br>
&gt;&gt; the fix, hopefully Chen Qi or someone else will fix it soon.<br>
&gt;&gt;<br>
&gt;&gt; nmon is broken even without security_flags.inc but v2 from Khem lo=
oks<br>
&gt;&gt; like it should fix it.<br>
&gt;&gt;<br>
&gt;&gt; There is also v2 for metacity and monkey in master-next now, so ho=
pefully<br>
&gt;&gt; next build will be a bit better again.<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" =
rel=3D"noreferrer" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/=
Bitbake_World_Status</a><br>
&gt;&gt;<br>
&gt;&gt; =3D=3D Number of issues - stats =3D=3D<br>
&gt;&gt; {| class=3D&#39;wikitable&#39;<br>
&gt;&gt; !|Date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!col=
span=3D&#39;3&#39;|Failed tasks<br>
&gt;&gt; !!|Signatures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0!!colspan=3D&#39;14&#39;|QA !!Comment<br>
&gt;&gt; |-<br>
&gt;&gt; ||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||qemuarm=C2=A0=
 =C2=A0 =C2=A0 =C2=A0||qemux86=C2=A0 =C2=A0 =C2=A0 =C2=A0||qemux86_64=C2=A0=
 =C2=A0 ||all<br>
&gt;&gt; ||already-stripped=C2=A0 =C2=A0 =C2=A0 ||libdir=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ||textrel=C2=A0 =C2=A0 =C2=A0 =C2=A0||build-deps<br>
&gt;&gt; ||file-rdeps=C2=A0 =C2=A0 ||version-going-backwards=C2=A0 =C2=A0 =
=C2=A0 =C2=A0||host-user-contaminated<br>
&gt;&gt; ||installed-vs-shipped=C2=A0 ||unknown-configure-option=C2=A0 =C2=
=A0 =C2=A0 ||symlink-to-sysroot<br>
&gt;&gt; ||invalid-pkgconfig=C2=A0 =C2=A0 =C2=A0||pkgname=C2=A0 =C2=A0 =C2=
=A0 =C2=A0||ldflags=C2=A0 =C2=A0 =C2=A0 =C2=A0||compile-host-path<br>
&gt;&gt; ||<br>
&gt;&gt; |-<br>
&gt;&gt; ||2017-07-16=C2=A0 =C2=A0 ||8=C2=A0 =C2=A0 =C2=A0||6=C2=A0 =C2=A0 =
=C2=A0||7=C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0||1<br>
&gt;&gt; ||4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||<br>
&gt;&gt; |}<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D Failed tasks 2017-07-16 =3D=3D<br>
&gt;&gt;<br>
&gt;&gt; INFO: jenkins-job.sh-1.8.25 Complete log available at<br>
&gt;&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/lo=
g.report.20170717_002720.log" rel=3D"noreferrer" target=3D"_blank">http://l=
ogs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>report.20170717_=
002720.log</a><br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D common (6) =3D=3D=3D<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0* meta-browser/recipes-mozilla/<wbr>firefox/fir=
efox_45.9.0esr.bb:d<wbr>o_compile<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; meta-openembedded/meta-gnome/<wbr>recipes-gnome/metacity/<wbr>meta=
city_2.34.13.bb:do_compile<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; meta-openembedded/meta-<wbr>networking/recipes-daemons/<wbr>ippool=
/ippool_1.3.bb:do_<wbr>compile<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; meta-openembedded/meta-<wbr>webserver/recipes-httpd/<wbr>monkey/mo=
nkey_1.5.6.bb:do_<wbr>compile<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; meta-webos-ports/meta-luneui/<wbr>recipes-webos/pmloglib/<wbr>pmlo=
glib.bb:do_compile<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; openembedded-core/meta/<wbr>recipes-devtools/systemd-<wbr>bootchar=
t/systemd-bootchart_<wbr>231.bb:do_compile<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D common-x86 (0) =3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D qemuarm (2) =3D=3D=3D<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; meta-openembedded/meta-oe/<wbr>recipes-support/mysql/mariadb_<wbr>=
5.5.55.bb:do_compile<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; meta-openembedded/meta-oe/<wbr>recipes-support/nmon/nmon_16g.<wbr>=
bb:do_compile<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D qemux86 (0) =3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D qemux86_64 (0) =3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D Number of failed tasks (21) =3D=3D=3D<br>
&gt;&gt; {| class=3Dwikitable<br>
&gt;&gt; |-<br>
&gt;&gt; || qemuarm=C2=A0 =C2=A0 =C2=A0 || 8=C2=A0 =C2=A0 =C2=A0||<br>
&gt;&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/lo=
g.world.qemuarm.20170714_122654.log/" rel=3D"noreferrer" target=3D"_blank">=
http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qe=
muarm.20170714_122654.<wbr>log/</a><br>
&gt;&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41265/" =
rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Er=
rors/Build/41265/</a><br>
&gt;&gt; |-<br>
&gt;&gt; || qemux86=C2=A0 =C2=A0 =C2=A0 || 6=C2=A0 =C2=A0 =C2=A0||<br>
&gt;&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/lo=
g.world.qemux86.20170714_122654.log/" rel=3D"noreferrer" target=3D"_blank">=
http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qe=
mux86.20170714_122654.<wbr>log/</a><br>
&gt;&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41266/" =
rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Er=
rors/Build/41266/</a><br>
&gt;&gt; |-<br>
&gt;&gt; || qemux86_64=C2=A0 =C2=A0|| 7=C2=A0 =C2=A0 =C2=A0||<br>
&gt;&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/lo=
g.world.qemux86-64.20170716_100826.log/" rel=3D"noreferrer" target=3D"_blan=
k">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world=
.qemux86-64.20170716_<wbr>100826.log/</a><br>
&gt;&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41270/" =
rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Er=
rors/Build/41270/</a><br>
&gt;&gt; |}<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D QA issues (5) =3D=3D=3D<br>
&gt;&gt; {| class=3Dwikitable<br>
&gt;&gt; !| Count=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||=
Issue<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||already-stripped<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||build-deps<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||compile-host-path<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||file-rdeps<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||host-user-contaminated<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||installed-vs-shipped<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||invalid-pkgconfig<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||ldflags<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||pkgname<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||symlink-to-sysroot<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||unknown-configure-option<br>
&gt;&gt; |-<br>
&gt;&gt; ||0=C2=A0 =C2=A0 =C2=A0||version-going-backwards<br>
&gt;&gt; |-<br>
&gt;&gt; ||1=C2=A0 =C2=A0 =C2=A0||libdir<br>
&gt;&gt; |-<br>
&gt;&gt; ||4=C2=A0 =C2=A0 =C2=A0||textrel<br>
&gt;&gt; |}<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=
=3D<br>
&gt;&gt;<br>
&gt;&gt; Complete log:<br>
&gt;&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/lo=
g.signatures.20170715_102407.log/" rel=3D"noreferrer" target=3D"_blank">htt=
p://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>signatures.=
20170715_102407.<wbr>log/</a><br>
&gt;&gt;<br>
&gt;&gt; No issues detected<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; PNBLACKLISTs:<br>
&gt;&gt; openembedded-core/:<br>
&gt;&gt; meta-browser:<br>
&gt;&gt; meta-openembedded:<br>
&gt;&gt;<br>
&gt;&gt; meta-networking/recipes-<wbr>support/lksctp-tools/lksctp-<wbr>tool=
s_1.0.17.bb:PNBLACKLIST[<wbr>lksctp-tools]<br>
&gt;&gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;ld-is-gold&#39;, &quot;BROKEN: fails to<br>
&gt;&gt; link against sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;<br>
&gt;&gt;<br>
&gt;&gt; meta-oe/recipes-connectivity/<wbr>bluez/bluez-hcidump_2.5.bb:PNB<w=
br>LACKLIST[bluez-hcidump]<br>
&gt;&gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;bluez5&#39;, &#39;bluez5 conflicts with<br>
&gt;&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt;&gt; meta-oe/recipes-connectivity/<wbr>bluez/bluez4_4.101.bb:PNBLACKL<w=
br>IST[bluez4] ?=3D<br>
&gt;&gt; &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bl=
uez5&#39;, &#39;bluez5 conflicts with<br>
&gt;&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt;&gt;<br>
&gt;&gt; meta-oe/recipes-connectivity/<wbr>bluez/gst-plugin-bluetooth_4.<wb=
r>101.bb:PNBLACKLIST[gst-plugin-<wbr>bluetooth]<br>
&gt;&gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;bluez5&#39;, &#39;bluez5 conflicts with<br>
&gt;&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt;&gt; meta-oe/recipes-graphics/<wbr>libsexy/libsexy_0.1.11.bb:PNBL<wbr>A=
CKLIST[libsexy] ?=3D<br>
&gt;&gt; &quot;Fails to build with RSS<br>
&gt;&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/130607/" =
rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Er=
rors/Details/130607/</a> - the recipe will be<br>
&gt;&gt; removed on 2017-09-01 unless the issue is fixed&quot;<br>
&gt;&gt;<br>
&gt;&gt; meta-oe/recipes-graphics/xorg-<wbr>driver/xf86-video-geode_2.11.<w=
br>16.bb:PNBLACKLIST[xf86-video-<wbr>geode]<br>
&gt;&gt; ?=3D &quot;BROKEN, fails to build - the recipe will be removed on =
2017-09-01 unless<br>
&gt;&gt; the issue is fixed&quot;<br>
&gt;&gt;<br>
&gt;&gt; meta-oe/recipes-navigation/<wbr>foxtrotgps/foxtrotgps_1.1.1.<wbr>b=
b:PNBLACKLIST[foxtrotgps]<br>
&gt;&gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;bluez5&#39;, &#39;bluez5 conflicts with<br>
&gt;&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt;&gt; meta-oe/recipes-navigation/<wbr>gypsy/gypsy.inc:PNBLACKLIST[<wbr>g=
ypsy] ?=3D<br>
&gt;&gt; &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bl=
uez5&#39;, &#39;bluez5 conflicts with<br>
&gt;&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt;&gt; meta-oe/recipes-navigation/<wbr>navit/navit.inc:PNBLACKLIST[<wbr>n=
avit] ?=3D<br>
&gt;&gt; &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bl=
uez5&#39;, &#39;bluez5 conflicts with<br>
&gt;&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt;&gt; meta-oe/recipes-support/<wbr>opensync/libsyncml_0.5.4.bb:PN<wbr>BL=
ACKLIST[libsyncml]<br>
&gt;&gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;bluez5&#39;, &#39;bluez5 conflicts with<br>
&gt;&gt; bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt;&gt; meta-qt5:<br>
&gt;&gt; meta-smartphone:<br>
&gt;&gt; meta-shr/recipes-shr/3rdparty/<wbr>libsensmon_git.bb:PNBLACKLIST[<=
wbr>libsensmon] ?=3D<br>
&gt;&gt; &quot;BROKEN: not compatible with newer vala,<br>
&gt;&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/143058/" =
rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Er=
rors/Details/143058/</a>&quot;<br>
&gt;&gt; meta-shr/recipes-shr/3rdparty/<wbr>omhacks_git.bb:PNBLACKLIST[<wbr=
>omhacks] ?=3D &quot;Not<br>
&gt;&gt; compatible with gcc7 - the recipe will be removed on 2017-09-01 un=
less the<br>
&gt;&gt; issue is fixed&quot;<br>
&gt;&gt; meta-webos-ports:<br>
&gt;&gt;<br>
&gt;&gt; meta-luneos/recipes-luneos/<wbr>luna-webappmanager/luna-<wbr>webap=
pmanager.bb:PNBLACKLIST[<wbr>luna-webappmanager]<br>
&gt;&gt; ?=3D &quot;BROKEN: needs to be adapted to new qt-5.7&quot;<br>
&gt;&gt; meta-luneui/recipes-luneui/<wbr>luna-next/luna-next.bb:PNBLACK<wbr=
>LIST[luna-next]<br>
&gt;&gt; ?=3D &quot;BROKEN: needs to be adapted to new qtwayland-5.7&quot;<=
br>
&gt;&gt; PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-vir=
tualiazation<br>
&gt;&gt; which isn&#39;t included in my world builds&quot;<br>
&gt;&gt; PNBLACKLIST[bigbuckbunny-<wbr>1080p] =3D &quot;big and doesn&#39;t=
 really need to be<br>
&gt;&gt; tested so much&quot;<br>
&gt;&gt; PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t reall=
y need to be tested<br>
&gt;&gt; so much&quot;<br>
&gt;&gt; PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t reall=
y need to be tested<br>
&gt;&gt; so much&quot;<br>
&gt;&gt; PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t reall=
y need to be tested<br>
&gt;&gt; so much&quot;<br>
&gt;&gt; PNBLACKLIST[tearsofsteel-<wbr>1080p] =3D &quot;big and doesn&#39;t=
 really need to be<br>
&gt;&gt; tested so much&quot;<br>
&gt;&gt; PNBLACKLIST[build-appliance-<wbr>image] =3D &quot;tries to include=
 whole downloads<br>
&gt;&gt; directory in /home/builder/poky :/&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; QA issues by type:<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: already-stripped<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: libdir<br>
&gt;&gt; qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:<br>
&gt;&gt; /usr/plugins/designer/.debug/<wbr>libqwt_designer_plugin.so [libdi=
r]<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: textrel<br>
&gt;&gt; chromium-54.0.2810.2: ELF binary<br>
&gt;&gt; &#39;/tmp/work/i586-oe-linux/<wbr>chromium/54.0.2810.2-r0/<wbr>pac=
kages-split/chromium/usr/<wbr>bin/chromium/chrome&#39;<br>
&gt;&gt; has relocations in .text [textrel]<br>
&gt;&gt; chromium-wayland-53.0.2785.<wbr>143: ELF binary<br>
&gt;&gt; &#39;/tmp/work/i586-oe-linux/<wbr>chromium-wayland/53.0.2785.<wbr>=
143-r0/packages-split/<wbr>chromium-wayland/usr/bin/<wbr>chromium/chrome&#3=
9;<br>
&gt;&gt; has relocations in .text [textrel]<br>
&gt;&gt; x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary<br>
&gt;&gt; &#39;/tmp/work/i586-oe-linux/x264/<wbr>r2731+gitAUTOINC+2b741f81e5=
-<wbr>r0/packages-split/x264-bin/<wbr>usr/bin/x264&#39;<br>
&gt;&gt; has relocations in .text [textrel]<br>
&gt;&gt; x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary<br>
&gt;&gt; &#39;/tmp/work/i586-oe-linux/x264/<wbr>r2731+gitAUTOINC+2b741f81e5=
-<wbr>r0/packages-split/x264/usr/<wbr>lib/libx264.so.148&#39;<br>
&gt;&gt; has relocations in .text [textrel]<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: build-deps<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: file-rdeps<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: version-going-backwards=
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: host-user-contaminated<=
br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: installed-vs-shipped<br=
>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: unknown-configure-optio=
n<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: symlink-to-sysroot<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: invalid-pkgconfig<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: pkgname<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: ldflags<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: compile-host-path<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D Tested changes (not included in master yet) - bitbake =3D=
=3D<br>
&gt;&gt; latest upstream commit:<br>
&gt;&gt; 4a14b44 knotty: Drop task prefix of PLAIN log messages<br>
&gt;&gt; not included in master yet:<br>
&gt;&gt; dda3a10 world-image: add extra target<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D Tested changes (not included in master yet) - openembedded-=
core =3D=3D<br>
&gt;&gt; latest upstream commit:<br>
&gt;&gt; b1c4661 libiconv: remove<br>
&gt;&gt; 0001-Fix-link-error-when-<wbr>compiling-with-gcc-O0.patch<br>
&gt;&gt; not included in master yet:<br>
&gt;&gt; ae75724 icecc.bbclass: prevent nativesdk builds depending on targe=
t<br>
&gt;&gt; specific KERNEL_CC<br>
&gt;&gt; 4c28728 report-error: Allow to upload reports automatically<br>
&gt;&gt; 205c547 buildhistory.bbclass: metadata-revs show repo parent<br>
&gt;&gt; ef06cb2 metadata-revs: provide more information<br>
&gt;&gt; 4cdff2b qemux86: Add identical qemux86copy variant for tests<br>
&gt;&gt; 617ef4f valgrind: fix link failure with gold<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D Tested changes (not included in master yet) - meta-openembe=
dded =3D=3D<br>
&gt;&gt; latest upstream commit:<br>
&gt;&gt; 1cbd1bc unionfs-fuse: 0.26 -&gt; 2.0<br>
&gt;&gt; not included in master yet:<br>
&gt;&gt; c6d4c7a dnsmasq: disable the service by default<br>
&gt;&gt; ba5e474 rdate: Fix build with hardening<br>
&gt;&gt; cb4a014 strongswan: Include stdint.h for uintptr_t<br>
&gt;&gt; 046d96d netkit-rpc: Fix build with hardening flags<br>
&gt;&gt; caf0d05 netkit-telnet: Fix build with hardening<br>
&gt;&gt; 933f271 ncftp: Upgrade to 3.2.6<br>
&gt;&gt; 31642e1 ippool: Fix build errors found with hardening flags<br>
&gt;&gt; 7728c8f autofs: Add build dependency on libnsl2<br>
&gt;&gt; e4a0edd openhpi: Fix build on 64bit platforms e.g. aarch64<br>
&gt;&gt; d6b2593 security_flags.inc: Delete<br>
&gt;&gt; 98a8830 pptp-linux: Upgrade to 1.9.0<br>
&gt;&gt; 39176bd ebtables: replace ebtables-save perl script with bash rewr=
ite<br>
&gt;&gt; 80a8634 librcf: RDEPENDS on protobuf, json-spirit<br>
&gt;&gt; bbb9286 fuse: Correct runlevels and startup order<br>
&gt;&gt; 1483a97 recipes-utils: Add recipe for udevil<br>
&gt;&gt; d50395e klibc: Fix build issue when default ISA is not thumb<br>
&gt;&gt; 852412e libteam: Upgrade to 1.27<br>
&gt;&gt; cebae2c sox: Fix build with musl<br>
&gt;&gt; 4b4a68f webrtc-audio-processing: Link with libexecinfo on musl<br>
&gt;&gt; 4c56033 cdparanoia: Fix build with musl<br>
&gt;&gt; a8481ce lightmediascanner: Define comparison_fn_t if undefined<br>
&gt;&gt; ab4314a lmbench: Fix build with musl<br>
&gt;&gt; daab2b9 xfce4-netload-plugin: Do not include sys/sysctl.h<br>
&gt;&gt; 5a30d20 imsettings: Fix build with musl<br>
&gt;&gt; 0206352 gedit: Define ACCESSPERMS if not defined already<br>
&gt;&gt; 8fd8bc8 onboard: Fix build with musl<br>
&gt;&gt; 43ad720 libgtop: Fix build with musl<br>
&gt;&gt; ea840c2 netdata: Upgrade to 1.6.0<br>
&gt;&gt; 14d749f can-utils: Update to tip of master<br>
&gt;&gt; 1c46c71 kexec-tools-klibc: Fix build with musl<br>
&gt;&gt; b75b17c dracut: Upgrade to 045<br>
&gt;&gt; ae7ac67 yaffs2-utils: Fix build with musl<br>
&gt;&gt; 82650e1 logfsprogs: Rename setkey API to _setkey to not conflict w=
ith libc<br>
&gt;&gt; e060cf2 unionfs-fuse: Fix build with musl<br>
&gt;&gt; a764ec3 xfsdump: Fix build with musl<br>
&gt;&gt; 1c5c8e8 nmon: Upgrade to 16g<br>
&gt;&gt; 5d80364 metacity: Fix build with musl<br>
&gt;&gt; 9d50570 monkey: Link in libexecinfo on musl<br>
&gt;&gt; fcee6e9 aufs-util: Upgrade to 4.4 release<br>
&gt;&gt; ad0c2dc recipes: remove blacklisted recipes<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=
=3D<br>
&gt;&gt; latest upstream commit:<br>
&gt;&gt; bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault<br>
&gt;&gt; not included in master yet:<br>
&gt;&gt; 2afd1b7 maliit-framework-qt5: Always have optimize flags<br>
&gt;&gt; 92c634e qt5-creator: Fix build with NO_ACCESSIBILITY<br>
&gt;&gt; d69be5d qtwebengine: Fix build on musl<br>
&gt;&gt; e1027a5 qtvirtualkeyboard: Include sys/time.h<br>
&gt;&gt; 045e39b qt5-creator: Link with libexecinfo on musl<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D Tested changes (not included in master yet) - meta-browser =
=3D=3D<br>
&gt;&gt; latest upstream commit:<br>
&gt;&gt; 6c063d6 Merge pull request #53 from kraj/kraj/master<br>
&gt;&gt; not included in master yet:<br>
&gt;&gt; 8ca260e gnome-settings-daemon: remove the bbappend for removed rec=
ipe<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D Tested changes (not included in master yet) - meta-webos-po=
rts =3D=3D<br>
&gt;&gt; latest upstream commit:<br>
&gt;&gt; 2186458 packagegroup-luneos-extended: drop qtscenegraph-adaptation=
<br>
&gt;&gt; not included in master yet:<br>
&gt;&gt;<br>
&gt;&gt; =3D=3D Tested changes (not included in master yet) - meta-smartpho=
ne =3D=3D<br>
&gt;&gt; latest upstream commit:<br>
&gt;&gt; bbeb2c2 linux-hp-tenderloin: bump=C2=A0 SRCREV<br>
&gt;&gt; not included in master yet:<br>
&gt;&gt; 7fd4215 meta-shr, meta-fso: remove blacklisted recipes<br>
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

--001a114026f6748e4f0554933766--
