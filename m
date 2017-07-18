Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id D3C3E71B9D;
	Tue, 18 Jul 2017 03:03:41 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id a10so9174728wrd.0;
	Mon, 17 Jul 2017 20:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qf+DXgDyhhnRHb5cjirprqVsOzl3CY2Z8HGnmYxBRJ0=;
	b=JFnv27aDVnbEkfZgJc9tjr0uQwL+YbEYNpAZQY9MtUjZSGRXIcnxRGCV2qYwdFc/86
	eW5ENA1XYvGkq08wvUE0RIkqZVZRXm++kv8ibUnzh6t+i6sc9HQETLm07tfyfmDyEXXU
	o3aR7llDOEepbwg2QMLg82ftTL1+8pyo9ImzItVB5nz6oT4+FMviu0onuIg0XYstaxVG
	zxflAqNj/T7HvpzNGGjeQGCYqDSASNTE50dd650VOHeNUsj/rcGXF7HY0WIDtmaxhfUV
	dzlGrCGRweW/tkQKe42Gzud0lW1v5FdpebjItN9jfJIaLwg5SA7uyi6c8yIT0P3J8JzO
	x22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qf+DXgDyhhnRHb5cjirprqVsOzl3CY2Z8HGnmYxBRJ0=;
	b=fqBDBD5Q4SWHFpRHsCUesoFgl697p452IFOx7BpuWaNfmmJQ76LmN5vS0bCjbN4ssw
	5IepawJsttdzhtl0Rb0fYEwSeU1c2OscTU66ZrUIHqskgmf/z9p4fWGDpThsC+8bDBeu
	x3CfY+IhiY+FslcUe9ooWFF86uB6fcfVNNWC1eem7dOdo68aVtGxILvNR704AWRy/b5Q
	wGrdjspdCveLAs3XbBhz3GE9RS4gM/h2xU2DUqTGSZqA1iCohNhjSrFuairisQfs7COu
	sUvRk82sy4AqwyyKkv9ItVHokRF2FCSJyXyfgSfzQgIMKpBm7O9iQBI+a4pgPqJ6Y+Ax
	8rOQ==
X-Gm-Message-State: AIVw110WAU0etS1+0ijOj8niCMP8bDlSmMHGENCQktTfisH2jdsl72al
	dIn/j8ggTTx1to7seZeMOcPcXwEZ7w==
X-Received: by 10.80.146.154 with SMTP id k26mr47166eda.23.1500347021731; Mon,
	17 Jul 2017 20:03:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Mon, 17 Jul 2017 20:03:11 -0700 (PDT)
In-Reply-To: <CA+chaQd6=GxCaYe1d4BO_yJM4myTkYmJu-EWG8vDB++BxfMT7Q@mail.gmail.com>
References: <20170717103941.GA3679@jama>
	<CA+chaQd6=GxCaYe1d4BO_yJM4myTkYmJu-EWG8vDB++BxfMT7Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Jul 2017 23:03:11 -0400
Message-ID: <CAMKF1soEKVfTqV=F=s=-XGE9zvFdscHEBGy8dp18AE79NaGQdg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Tue, 18 Jul 2017 03:03:42 -0000
Content-Type: text/plain; charset="UTF-8"

firefox and ipppool seems to not fail for me here.
so I wonder what might be different.

On Mon, Jul 17, 2017 at 11:49 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> The v2s of those patches really helped:
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date     !!colspan='3'|Failed tasks    !!|Signatures
> !!colspan='14'|QA !!Comment
> |-
> || ||qemuarm ||qemux86 ||qemux86_64 ||all
> ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps ||version-going-backwards ||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path ||
> |-
> ||2017-07-17 ||5 ||4 ||4 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||
> |}
>
> == Failed tasks 2017-07-17 ==
>
> INFO: jenkins-job.sh-1.8.25 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170717_054804.log
>
> === common (4) ===
>     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
>     *
> meta-openembedded/meta-networking/recipes-daemons/ippool/ippool_1.3.bb:do_compile
>     *
> meta-webos-ports/meta-luneui/recipes-webos/pmloglib/pmloglib.bb:do_compile
>     *
> openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb:do_compile
>
> === common-x86 (0) ===
>
> === qemuarm (1) ===
>     *
> meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_compile
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (13) ===
> {| class=wikitable
> |-
> || qemuarm || 5 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170717_011149.log/
> || http://errors.yoctoproject.org/Errors/Build/41271/
> |-
> || qemux86 || 4 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170717_011149.log/
> || http://errors.yoctoproject.org/Errors/Build/41272/
> |-
> || qemux86_64 || 4 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170717_031905.log/
> || http://errors.yoctoproject.org/Errors/Build/41273/
> |}
>
> === PNBLACKLISTs (14) ===
>
> === QA issues (0) ===
> {| class=wikitable
> !| Count ||Issue
> |-
> ||0 ||already-stripped
> |-
> ||0 ||build-deps
> |-
> ||0 ||compile-host-path
> |-
> ||0 ||file-rdeps
> |-
> ||0 ||host-user-contaminated
> |-
> ||0 ||installed-vs-shipped
> |-
> ||0 ||invalid-pkgconfig
> |-
> ||0 ||ldflags
> |-
> ||0 ||libdir
> |-
> ||0 ||pkgname
> |-
> ||0 ||symlink-to-sysroot
> |-
> ||0 ||textrel
> |-
> ||0 ||unknown-configure-option
> |-
> ||0 ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170717_031354.log/
>
> No issues detected
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
> link against sctp_connectx symbol", '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
> "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe will be
> removed on 2017-09-01 unless the issue is fixed"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode]
> ?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01 unless
> the issue is fixed"
> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon] ?=
> "BROKEN: not compatible with newer vala,
> http://errors.yoctoproject.org/Errors/Details/143058/"
> meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?= "Not
> compatible with gcc7 - the recipe will be removed on 2017-09-01 unless the
> issue is fixed"
> meta-webos-ports:
> meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACKLIST[luna-webappmanager]
> ?= "BROKEN: needs to be adapted to new qt-5.7"
> meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
> "BROKEN: needs to be adapted to new qtwayland-5.7"
> PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
> which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[build-appliance-
> image] = "tries to include whole downloads directory in /home/builder/poky
> :/"
>
>
> QA issues by type:
> count: 0 issue: already-stripped
>
>
> count: 0 issue: libdir
>
>
> count: 0 issue: textrel
>
>
> count: 0 issue: build-deps
>
>
> count: 0 issue: file-rdeps
>
>
> count: 0 issue: version-going-backwards
>
>
> count: 0 issue: host-user-contaminated
>
>
> count: 0 issue: installed-vs-shipped
>
>
> count: 0 issue: unknown-configure-option
>
>
> count: 0 issue: symlink-to-sysroot
>
>
> count: 0 issue: invalid-pkgconfig
>
>
> count: 0 issue: pkgname
>
>
> count: 0 issue: ldflags
>
>
> count: 0 issue: compile-host-path
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
> b1c4661 libiconv: remove
> 0001-Fix-link-error-when-compiling-with-gcc-O0.patch
> not included in master yet:
> ae75724 icecc.bbclass: prevent nativesdk builds depending on target specific
> KERNEL_CC
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
> d0ea52a nmon: Upgrade to 16g
> bbac8d6 metacity: Fix build with musl by defining _GNU_SOURCE
> ba84876 monkey: Link in libexecinfo on musl
> fdb7abc aufs-util: Upgrade to 4.4 release
> 872870c uftrace: add recipe
> 991233a iperf3: Fix missing stdint.h and do not link with -pg
> 77817c3 v4l-utils: Fix build with musl
> 065575a pimd: Upgrade to 2.3.2
> dd6c1d7 recipes: remove blacklisted recipes
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
> 1fe2b3b android-system-image-tenderloin: update Android image
> not included in master yet:
> 2bc4aaf meta-shr, meta-fso: remove blacklisted recipes
>
>
>
> On Mon, Jul 17, 2017 at 12:39 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>>
>> This time with conf/distro/include/security_flags.inc included as
>> requested by Khem
>>
>> systemd-bootchart is broken since glibc upgrade, Khem already suggested
>> the fix, hopefully Chen Qi or someone else will fix it soon.
>>
>> nmon is broken even without security_flags.inc but v2 from Khem looks
>> like it should fix it.
>>
>> There is also v2 for metacity and monkey in master-next now, so hopefully
>> next build will be a bit better again.
>>
>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>
>> == Number of issues - stats ==
>> {| class='wikitable'
>> !|Date               !!colspan='3'|Failed tasks
>> !!|Signatures                 !!colspan='14'|QA !!Comment
>> |-
>> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||all
>> ||already-stripped      ||libdir        ||textrel       ||build-deps
>> ||file-rdeps    ||version-going-backwards       ||host-user-contaminated
>> ||installed-vs-shipped  ||unknown-configure-option      ||symlink-to-sysroot
>> ||invalid-pkgconfig     ||pkgname       ||ldflags       ||compile-host-path
>> ||
>> |-
>> ||2017-07-16    ||8     ||6     ||7     ||0     ||0             ||1
>> ||4             ||0             ||0             ||0             ||0
>> ||0             ||0             ||0             ||0             ||0
>> ||0             ||0             ||
>> |}
>>
>> == Failed tasks 2017-07-16 ==
>>
>> INFO: jenkins-job.sh-1.8.25 Complete log available at
>> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170717_002720.log
>>
>> === common (6) ===
>>     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
>>     *
>> meta-openembedded/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb:do_compile
>>     *
>> meta-openembedded/meta-networking/recipes-daemons/ippool/ippool_1.3.bb:do_compile
>>     *
>> meta-openembedded/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb:do_compile
>>     *
>> meta-webos-ports/meta-luneui/recipes-webos/pmloglib/pmloglib.bb:do_compile
>>     *
>> openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb:do_compile
>>
>> === common-x86 (0) ===
>>
>> === qemuarm (2) ===
>>     *
>> meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_compile
>>     *
>> meta-openembedded/meta-oe/recipes-support/nmon/nmon_16g.bb:do_compile
>>
>> === qemux86 (0) ===
>>
>> === qemux86_64 (0) ===
>>
>> === Number of failed tasks (21) ===
>> {| class=wikitable
>> |-
>> || qemuarm      || 8     ||
>> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170714_122654.log/
>> || http://errors.yoctoproject.org/Errors/Build/41265/
>> |-
>> || qemux86      || 6     ||
>> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170714_122654.log/
>> || http://errors.yoctoproject.org/Errors/Build/41266/
>> |-
>> || qemux86_64   || 7     ||
>> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170716_100826.log/
>> || http://errors.yoctoproject.org/Errors/Build/41270/
>> |}
>>
>> === PNBLACKLISTs (14) ===
>>
>> === QA issues (5) ===
>> {| class=wikitable
>> !| Count                ||Issue
>> |-
>> ||0     ||already-stripped
>> |-
>> ||0     ||build-deps
>> |-
>> ||0     ||compile-host-path
>> |-
>> ||0     ||file-rdeps
>> |-
>> ||0     ||host-user-contaminated
>> |-
>> ||0     ||installed-vs-shipped
>> |-
>> ||0     ||invalid-pkgconfig
>> |-
>> ||0     ||ldflags
>> |-
>> ||0     ||pkgname
>> |-
>> ||0     ||symlink-to-sysroot
>> |-
>> ||0     ||unknown-configure-option
>> |-
>> ||0     ||version-going-backwards
>> |-
>> ||1     ||libdir
>> |-
>> ||4     ||textrel
>> |}
>>
>>
>>
>> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>>
>> Complete log:
>> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170715_102407.log/
>>
>> No issues detected
>>
>>
>> PNBLACKLISTs:
>> openembedded-core/:
>> meta-browser:
>> meta-openembedded:
>>
>> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
>> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
>> link against sctp_connectx symbol", '', d)}"
>>
>> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
>> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
>> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>>
>> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth]
>> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
>> "Fails to build with RSS
>> http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe will be
>> removed on 2017-09-01 unless the issue is fixed"
>>
>> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode]
>> ?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01 unless
>> the issue is fixed"
>>
>> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
>> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
>> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
>> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
>> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
>> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
>> meta-qt5:
>> meta-smartphone:
>> meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon] ?=
>> "BROKEN: not compatible with newer vala,
>> http://errors.yoctoproject.org/Errors/Details/143058/"
>> meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?= "Not
>> compatible with gcc7 - the recipe will be removed on 2017-09-01 unless the
>> issue is fixed"
>> meta-webos-ports:
>>
>> meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACKLIST[luna-webappmanager]
>> ?= "BROKEN: needs to be adapted to new qt-5.7"
>> meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]
>> ?= "BROKEN: needs to be adapted to new qtwayland-5.7"
>> PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
>> which isn't included in my world builds"
>> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
>> tested so much"
>> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
>> so much"
>> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
>> so much"
>> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
>> so much"
>> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
>> tested so much"
>> PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
>> directory in /home/builder/poky :/"
>>
>>
>> QA issues by type:
>> count: 0        issue: already-stripped
>>
>>
>> count: 1        issue: libdir
>> qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:
>> /usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]
>>
>>
>> count: 4        issue: textrel
>> chromium-54.0.2810.2: ELF binary
>> '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
>> has relocations in .text [textrel]
>> chromium-wayland-53.0.2785.143: ELF binary
>> '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
>> has relocations in .text [textrel]
>> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
>> '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264'
>> has relocations in .text [textrel]
>> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
>> '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
>> has relocations in .text [textrel]
>>
>>
>> count: 0        issue: build-deps
>>
>>
>> count: 0        issue: file-rdeps
>>
>>
>> count: 0        issue: version-going-backwards
>>
>>
>> count: 0        issue: host-user-contaminated
>>
>>
>> count: 0        issue: installed-vs-shipped
>>
>>
>> count: 0        issue: unknown-configure-option
>>
>>
>> count: 0        issue: symlink-to-sysroot
>>
>>
>> count: 0        issue: invalid-pkgconfig
>>
>>
>> count: 0        issue: pkgname
>>
>>
>> count: 0        issue: ldflags
>>
>>
>> count: 0        issue: compile-host-path
>>
>>
>>
>> == Tested changes (not included in master yet) - bitbake ==
>> latest upstream commit:
>> 4a14b44 knotty: Drop task prefix of PLAIN log messages
>> not included in master yet:
>> dda3a10 world-image: add extra target
>>
>> == Tested changes (not included in master yet) - openembedded-core ==
>> latest upstream commit:
>> b1c4661 libiconv: remove
>> 0001-Fix-link-error-when-compiling-with-gcc-O0.patch
>> not included in master yet:
>> ae75724 icecc.bbclass: prevent nativesdk builds depending on target
>> specific KERNEL_CC
>> 4c28728 report-error: Allow to upload reports automatically
>> 205c547 buildhistory.bbclass: metadata-revs show repo parent
>> ef06cb2 metadata-revs: provide more information
>> 4cdff2b qemux86: Add identical qemux86copy variant for tests
>> 617ef4f valgrind: fix link failure with gold
>>
>> == Tested changes (not included in master yet) - meta-openembedded ==
>> latest upstream commit:
>> 1cbd1bc unionfs-fuse: 0.26 -> 2.0
>> not included in master yet:
>> c6d4c7a dnsmasq: disable the service by default
>> ba5e474 rdate: Fix build with hardening
>> cb4a014 strongswan: Include stdint.h for uintptr_t
>> 046d96d netkit-rpc: Fix build with hardening flags
>> caf0d05 netkit-telnet: Fix build with hardening
>> 933f271 ncftp: Upgrade to 3.2.6
>> 31642e1 ippool: Fix build errors found with hardening flags
>> 7728c8f autofs: Add build dependency on libnsl2
>> e4a0edd openhpi: Fix build on 64bit platforms e.g. aarch64
>> d6b2593 security_flags.inc: Delete
>> 98a8830 pptp-linux: Upgrade to 1.9.0
>> 39176bd ebtables: replace ebtables-save perl script with bash rewrite
>> 80a8634 librcf: RDEPENDS on protobuf, json-spirit
>> bbb9286 fuse: Correct runlevels and startup order
>> 1483a97 recipes-utils: Add recipe for udevil
>> d50395e klibc: Fix build issue when default ISA is not thumb
>> 852412e libteam: Upgrade to 1.27
>> cebae2c sox: Fix build with musl
>> 4b4a68f webrtc-audio-processing: Link with libexecinfo on musl
>> 4c56033 cdparanoia: Fix build with musl
>> a8481ce lightmediascanner: Define comparison_fn_t if undefined
>> ab4314a lmbench: Fix build with musl
>> daab2b9 xfce4-netload-plugin: Do not include sys/sysctl.h
>> 5a30d20 imsettings: Fix build with musl
>> 0206352 gedit: Define ACCESSPERMS if not defined already
>> 8fd8bc8 onboard: Fix build with musl
>> 43ad720 libgtop: Fix build with musl
>> ea840c2 netdata: Upgrade to 1.6.0
>> 14d749f can-utils: Update to tip of master
>> 1c46c71 kexec-tools-klibc: Fix build with musl
>> b75b17c dracut: Upgrade to 045
>> ae7ac67 yaffs2-utils: Fix build with musl
>> 82650e1 logfsprogs: Rename setkey API to _setkey to not conflict with libc
>> e060cf2 unionfs-fuse: Fix build with musl
>> a764ec3 xfsdump: Fix build with musl
>> 1c5c8e8 nmon: Upgrade to 16g
>> 5d80364 metacity: Fix build with musl
>> 9d50570 monkey: Link in libexecinfo on musl
>> fcee6e9 aufs-util: Upgrade to 4.4 release
>> ad0c2dc recipes: remove blacklisted recipes
>>
>> == Tested changes (not included in master yet) - meta-qt5 ==
>> latest upstream commit:
>> bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault
>> not included in master yet:
>> 2afd1b7 maliit-framework-qt5: Always have optimize flags
>> 92c634e qt5-creator: Fix build with NO_ACCESSIBILITY
>> d69be5d qtwebengine: Fix build on musl
>> e1027a5 qtvirtualkeyboard: Include sys/time.h
>> 045e39b qt5-creator: Link with libexecinfo on musl
>>
>> == Tested changes (not included in master yet) - meta-browser ==
>> latest upstream commit:
>> 6c063d6 Merge pull request #53 from kraj/kraj/master
>> not included in master yet:
>> 8ca260e gnome-settings-daemon: remove the bbappend for removed recipe
>>
>> == Tested changes (not included in master yet) - meta-webos-ports ==
>> latest upstream commit:
>> 2186458 packagegroup-luneos-extended: drop qtscenegraph-adaptation
>> not included in master yet:
>>
>> == Tested changes (not included in master yet) - meta-smartphone ==
>> latest upstream commit:
>> bbeb2c2 linux-hp-tenderloin: bump  SRCREV
>> not included in master yet:
>> 7fd4215 meta-shr, meta-fso: remove blacklisted recipes
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

