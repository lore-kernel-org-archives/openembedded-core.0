Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A41B778586;
	Sat, 16 Sep 2017 15:01:31 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i23so2604176pfi.2;
	Sat, 16 Sep 2017 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fbMG+6a43kp+ktfv19n/nOt9Ruwxi203FTHSRgb+Kck=;
	b=o2l8c6peaSil9ZEL3Uh9qL1w157rUWQWrbnpUDA2uDuvJEUEJv0c8mxlXtnvaSLWrQ
	D8YBzV9BBMflVKljqb0PQyzkpEAnMXn5u8hijQ+n2rqXhBwBMN2a9aA44+jwn5yX+UnF
	083Z5UNYgtrXZGp7HJtxeysKCf7ZAk2+VBoWklXhNjKA3lRBiWoPWQjOMdOIsvCsHesU
	F5XAAJNP+RmroYIBHjYG1FGssBYWYMrGkzW3StpLHx+XD03KZBcSY14zTqWeXFZnKT+O
	8DsyBMZRfkVpNi1fcfUcWsWLSrgUKo6Vg0ELYPGgZ6o0Pj0+kRghikcQX1ue+0C8jdG1
	+exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fbMG+6a43kp+ktfv19n/nOt9Ruwxi203FTHSRgb+Kck=;
	b=uJicoEPssTbMsRz0svmr+ZOZOMwQA6rn6XFvCMZnCZgnhcgnw7gSWH2XAMfqKnl4zK
	loq4wRcwgrnYK490BwyTAtrqO7i3Bb2ML6It0vNCJ8Q4TGUjJypPohP9FsV9Rherf0lg
	CZOQFNFSgBcAMHDRoWO0ppyZSFxnjeUdpICNrTNXNM4Bg6MHjXzbGTeixMubdydcpGQD
	wyP7aIWhDvJvDkq1uLMt8Es+GC3MLsY3JT4vDsvzM1ovY1DepAODVCSMQCsD69P77S+h
	Uk14T968/wqPl4oL8aCn2viHUCC3JtjOKnEsbvDsWVAosFR5T1lqD2tYqNb07kxztKDO
	y+OA==
X-Gm-Message-State: AHPjjUi4QJGjtsQEEUayDbZjnwEvKj+MCQTlJePIvRImrieeTwCO/C2U
	q3kVCz1eXLhgX8kGPByUW1Xasa6TVgmn7bYb5S8=
X-Google-Smtp-Source: ADKCNb6FOZZC1MmZIflvoX6Ak/7A/I6ljoCcg3zSmhEpoMnaiZGJfmttpQI+lAggurD8FdD41gIkpPtOpZSqyfQVPmQ=
X-Received: by 10.84.138.1 with SMTP id 1mr29377397plo.404.1505574091121; Sat,
	16 Sep 2017 08:01:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Sat, 16 Sep 2017 08:01:00 -0700 (PDT)
In-Reply-To: <CA+chaQcLPGQaFJOU+pbg=OwceGsmkE3oO8FEitfrL0BvBLmaaQ@mail.gmail.com>
References: <CA+chaQfjWH9SHcF4S61Q2Q_qUk7jcMMehPRibXg-QO_oS_QGiw@mail.gmail.com>
	<CAMKF1soALs=ksNmvTO3vrDnP0gvRQviShq3O--iCZwRzjTB8Xg@mail.gmail.com>
	<CA+chaQdbNsKYzowonqmWYY-hp-e=GdJ_A7_hYq8jCjobw414jA@mail.gmail.com>
	<CAMKF1spWpSo4pnB+GVUGAqU0T41jKmVDtRB2cC_+1a7YAaY2vA@mail.gmail.com>
	<CA+chaQcLPGQaFJOU+pbg=OwceGsmkE3oO8FEitfrL0BvBLmaaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Sep 2017 08:01:00 -0700
Message-ID: <CAMKF1soA5UfaisQ3dqKv=R6N8nkVKLH_30JcjxncS4T-40HZWA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-09-14
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
X-List-Received-Date: Sat, 16 Sep 2017 15:01:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 16, 2017 at 7:41 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Just the commit IDs from the top won't be very useful, because it's from
> jansa/master branches which are rebased even more often than master-next.
>
> If you really want to see them, then there are links to the build logs for
> each MACHINE and you can see the build configuration there.
>
> That's why at the bottom is the list of last master commit (as seen in
> qemuarm build directory) and list of patches currently applied on top of it.
> But to make it accurate for all MACHINEs I would either need to update the
> branches only once in 2-3 days when the builds are all finished or to repeat
> this section 3 times (which is sometimes quite long even when listed just
> for qemuarm).
>
> What I'll do is to include similar git log at the beginning of each build,
> so if in doubt opening the individual logs will not only show the
> configuration as seen by bitbake, but also the master branch and applied
> patches.
>

I think that will be useful.

>
> On Sat, Sep 16, 2017 at 4:32 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sat, Sep 16, 2017 at 2:00 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > Probably is, qemux86 was built from slightly older metadata, so probably
>> > including previous versions of your klibc changes.
>> >
>> > I know it's confusing in the report, but still each build takes around
>> > 24
>> > hours per machine and I have only 2 builders. e.g. this qemux86 build
>> > was
>> > started 20170912_234104 as the log directory shows and at that time
>> > there
>> > wasn't even the latest version of klibc patches on ML.
>> >
>>
>> thats ok. May be top of build configuration would be a good thing to
>> have in report. so we know which commit the results belong to.
>>
>> > Thanks
>> >
>> > On Sat, Sep 16, 2017 at 1:02 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Fri, Sep 15, 2017 at 3:08 PM, Martin Jansa <martin.jansa@gmail.com>
>> >> wrote:
>> >> > http://www.openembedded.org/wiki/Bitbake_World_Status
>> >> >
>> >> > == Number of issues - stats ==
>> >> > {| class='wikitable'
>> >> > !|Date      !!colspan='3'|Failed tasks     !!|Signatures
>> >> > !!colspan='14'|QA
>> >> > !!Comment
>> >> > |-
>> >> > || ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped ||libdir
>> >> > ||textrel ||build-deps ||file-rdeps ||version-going-backwards
>> >> > ||host-user-contaminated ||installed-vs-shipped
>> >> > ||unknown-configure-option
>> >> > ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
>> >> > ||compile-host-path ||
>> >> > |-
>> >> > ||2017-09-14 ||3 ||6 ||2 ||0 ||0 ||0 ||5 ||0 ||0 ||91 ||3 ||0 ||0 ||0
>> >> > ||0
>> >> > ||0 ||0 ||0 ||
>> >> > |}
>> >> >
>> >> > == Failed tasks 2017-09-14 ==
>> >> >
>> >> > INFO: jenkins-job.sh-1.8.29 Complete log available at
>> >> >
>> >> >
>> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170915_120505.log
>> >> >
>> >> > === common (1) ===
>> >> >     *
>> >> > meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
>> >> >
>> >> > === common-x86 (0) ===
>> >> >
>> >> > === qemuarm (2) ===
>> >> >     *
>> >> >
>> >> >
>> >> > meta-openembedded/meta-multimedia/recipes-connectivity/libupnp/libupnp1.6_1.6.21.bb:do_fetch
>> >> >     *
>> >> >
>> >> >
>> >> > meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
>> >> >
>> >> > === qemux86 (5) ===
>> >> >     *
>> >> >
>> >> >
>> >> > meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb:do_compile
>> >> >     *
>> >> >
>> >> >
>> >> > meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
>> >> >     *
>> >> >
>> >> >
>> >> > meta-openembedded/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb:do_configure
>> >> >     * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
>> >> >     *
>> >> >
>> >> >
>> >> > virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb:do_configure
>> >> >
>> >>
>> >> all meta-initramfs should have been fixed with latest patchset it that
>> >> not
>> >> the case ?
>> >>
>> >> > === qemux86_64 (1) ===
>> >> >     *
>> >> >
>> >> >
>> >> > virtual:native:meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb:do_install
>> >> >
>> >> > === Number of failed tasks (11) ===
>> >> > {| class=wikitable
>> >> > |-
>> >> > || qemuarm || 3 ||
>> >> >
>> >> >
>> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170914_113136.log/
>> >> > || http://errors.yoctoproject.org/Errors/Build/46775/
>> >> > |-
>> >> > || qemux86 || 6 ||
>> >> >
>> >> >
>> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170912_234104.log/
>> >> > || http://errors.yoctoproject.org/Errors/Build/46714/
>> >> > |-
>> >> > || qemux86_64 || 2 ||
>> >> >
>> >> >
>> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170914_015733.log/
>> >> > || http://errors.yoctoproject.org/Errors/Build/46761/
>> >> > |}
>> >> >
>> >> > === PNBLACKLISTs (1) ===
>> >> >
>> >> > === QA issues (99) ===
>> >> > {| class=wikitable
>> >> > !| Count ||Issue
>> >> > |-
>> >> > ||0 ||already-stripped
>> >> > |-
>> >> > ||0 ||build-deps
>> >> > |-
>> >> > ||0 ||compile-host-path
>> >> > |-
>> >> > ||0 ||file-rdeps
>> >> > |-
>> >> > ||0 ||installed-vs-shipped
>> >> > |-
>> >> > ||0 ||invalid-pkgconfig
>> >> > |-
>> >> > ||0 ||ldflags
>> >> > |-
>> >> > ||0 ||libdir
>> >> > |-
>> >> > ||0 ||pkgname
>> >> > |-
>> >> > ||0 ||symlink-to-sysroot
>> >> > |-
>> >> > ||0 ||unknown-configure-option
>> >> > |-
>> >> > ||3 ||host-user-contaminated
>> >> > |-
>> >> > ||5 ||textrel
>> >> > |-
>> >> > ||91 ||version-going-backwards
>> >> > |}
>> >> >
>> >> >
>> >> >
>> >> > === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>> >> >
>> >> > Complete log:
>> >> >
>> >> >
>> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170913_214906.log/
>> >> >
>> >> > No issues detected
>> >> >
>> >> >
>> >> > PNBLACKLISTs:
>> >> > openembedded-core/:
>> >> > meta-browser:
>> >> > meta-openembedded:
>> >> >
>> >> >
>> >> > meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
>> >> > ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
>> >> > fails
>> >> > to
>> >> > link against sctp_connectx symbol", '', d)}"
>> >> > meta-qt5:
>> >> > PNBLACKLIST[android-system] = "depends on lxc from
>> >> > meta-virtualiazation
>> >> > which isn't included in my world builds"
>> >> > PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
>> >> > tested
>> >> > so much"
>> >> > PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
>> >> > tested
>> >> > so much"
>> >> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
>> >> > tested
>> >> > so much"
>> >> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
>> >> > tested
>> >> > so much"
>> >> > PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
>> >> > tested
>> >> > so much"
>> >> > PNBLACKLIST[build-appliance-image] = "tries to include whole
>> >> > downloads
>> >> > directory in /home/builder/poky :/"
>> >> >
>> >> >
>> >> > QA issues by type:
>> >> > count: 0 issue: already-stripped
>> >> >
>> >> >
>> >> > count: 0 issue: libdir
>> >> >
>> >> >
>> >> > count: 5 issue: textrel
>> >> > chromium-54.0.2810.2: ELF binary
>> >> >
>> >> >
>> >> > '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
>> >> > has relocations in .text [textrel]
>> >> > chromium-wayland-53.0.2785.143: ELF binary
>> >> >
>> >> >
>> >> > '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
>> >> > has relocations in .text [textrel]
>> >> > corosync-2.4.2: ELF binary
>> >> >
>> >> >
>> >> > '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
>> >> > has relocations in .text [textrel]
>> >> > x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
>> >> >
>> >> >
>> >> > '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264'
>> >> > has relocations in .text [textrel]
>> >> > x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
>> >> >
>> >> >
>> >> > '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
>> >> > has relocations in .text [textrel]
>> >> >
>> >> >
>> >> > count: 0 issue: build-deps
>> >> >
>> >> >
>> >> > count: 0 issue: file-rdeps
>> >> >
>> >> >
>> >> > count: 91 issue: version-going-backwards
>> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring-dbg
>> >> > went
>> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring-dev
>> >> > went
>> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring-doc
>> >> > went
>> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ar
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ast
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-as
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-az
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-be+latin went backwards which would break
>> >> > package
>> >> > feeds
>> >> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-be
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-bg
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-bn-in
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-bn
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-bs
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ca+valencia went backwards which would break
>> >> > package
>> >> > feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0)
>> >> > [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ca
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-cs
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-cy
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-da
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-de
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-dz
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-el
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-en-ca
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-en-gb
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-en+shaw went backwards which would break package
>> >> > feeds
>> >> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-es
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-et
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-eu
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-fa
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-fi
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-fr
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ga
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-gl
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-gu
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-he
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-hi
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-hr
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-hu
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-id
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-is
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-it
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ja
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ka
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-kn
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ko
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-lt
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-lv
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-mai
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-mg
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-mk
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ml
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-mn
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-mr
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ms
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-nb
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ne
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-nl
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-nn
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-oc
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-or
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-pa
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-pl
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-pt-br
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-pt
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ro
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ru
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-rw
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-si
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-sk
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-sl
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-sq
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-sr+latin went backwards which would break
>> >> > package
>> >> > feeds
>> >> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-sr
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-sv
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-ta
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-te
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-th
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-tr
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-uk
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-vi
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-xh
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-zh-cn
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-zh-hk
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-locale-zh-tw
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package
>> >> > gnome-keyring-staticdev
>> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
>> >> > to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring went
>> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
>> >> > 0:2.32.1-r12.0) [version-going-backwards]
>> >> > libupnp-1.6.21: Package version for package libupnp-dbg went
>> >> > backwards
>> >> > which
>> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
>> >> > [version-going-backwards]
>> >> > libupnp-1.6.21: Package version for package libupnp-dev went
>> >> > backwards
>> >> > which
>> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
>> >> > [version-going-backwards]
>> >> > libupnp-1.6.21: Package version for package libupnp-doc went
>> >> > backwards
>> >> > which
>> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
>> >> > [version-going-backwards]
>> >> > libupnp-1.6.21: Package version for package libupnp-locale went
>> >> > backwards
>> >> > which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
>> >> > [version-going-backwards]
>> >> > libupnp-1.6.21: Package version for package libupnp-staticdev went
>> >> > backwards
>> >> > which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
>> >> > [version-going-backwards]
>> >> > libupnp-1.6.21: Package version for package libupnp went backwards
>> >> > which
>> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
>> >> > [version-going-backwards]
>> >> >
>> >> >
>> >> > count: 3 issue: host-user-contaminated
>> >> > glibc-locale-2.26: glibc-locale:
>> >> > /glibc-binary-localedata-ru-ru/usr/lib/locale/ru_RU/LC_CTYPE is owned
>> >> > by
>> >> > uid
>> >> > 3004, which is the same as the user running bitbake. This may be due
>> >> > to
>> >> > host
>> >> > contamination [host-user-contaminated]
>> >> > qt5-creator-3.5.1: qt5-creator:
>> >> > /qt5-creator/usr/lib/qt5/qtcreator/plugins/libPythonEditor.so is
>> >> > owned
>> >> > by
>> >> > uid 3004, which is the same as the user running bitbake. This may be
>> >> > due
>> >> > to
>> >> > host contamination [host-user-contaminated]
>> >> > qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: qtdeclarative:
>> >> > /qtdeclarative-qmlplugins/usr/lib/qt5/qml/QtQuick.2/qmldir is owned
>> >> > by
>> >> > uid
>> >> > 3004, which is the same as the user running bitbake. This may be due
>> >> > to
>> >> > host
>> >> > contamination [host-user-contaminated]
>> >> >
>> >> >
>> >> > count: 0 issue: installed-vs-shipped
>> >> >
>> >> >
>> >> > count: 0 issue: unknown-configure-option
>> >> >
>> >> >
>> >> > count: 0 issue: symlink-to-sysroot
>> >> >
>> >> >
>> >> > count: 0 issue: invalid-pkgconfig
>> >> >
>> >> >
>> >> > count: 0 issue: pkgname
>> >> >
>> >> >
>> >> > count: 0 issue: ldflags
>> >> >
>> >> >
>> >> > count: 0 issue: compile-host-path
>> >> >
>> >> >
>> >> >
>> >> > == Tested changes (not included in master yet) - bitbake ==
>> >> > latest upstream commit:
>> >> > 567f2cf server/process: ensure server failure log is limited to
>> >> > current
>> >> > session
>> >> > not included in master yet:
>> >> > 3ec2af2 world-image: add extra target
>> >> > 8eebabe fetch2: Allow Fetch.download() to warn instead of error
>> >> >
>> >> > == Tested changes (not included in master yet) - openembedded-core ==
>> >> > latest upstream commit:
>> >> > 8fe9fb4 python*native.bbclass: suppress user site dirs
>> >> > not included in master yet:
>> >> > 0d7ac07 report-error: Allow to upload reports automatically
>> >> > 20d6101 buildhistory.bbclass: metadata-revs show repo parent
>> >> > 202fb4c metadata-revs: provide more information
>> >> > b3500a7 qemux86: Add identical qemux86copy variant for tests
>> >> > 0de46b0 reproducible_build.bbclass: initial support for binary
>> >> > reproducibility
>> >> > d407a03 cpio: provide cpio-replacement-native
>> >> > c872fa6 image_types.bbclass: improve cpio image reproducibility
>> >> > 3fcc641 rootfs-postcommands.bbclass: support binary reproducibility
>> >> > a132f03 sstate.bbclass: Do not cause build failures due to setscene
>> >> > errors
>> >> > 198ea0e insane.bbclass: Add do_qa_pseudo function to check for common
>> >> > errors
>> >> > listed in pseudo.log
>> >> > 3283a1c insane.bbclass: do_qa_pseudo: don't trigger error from
>> >> > '^inode
>> >> > mismatch'
>> >> > beb394d insane.bbclass: do_qa_pseudo: show parts of pseudo.log in
>> >> > console
>> >> >
>> >> > == Tested changes (not included in master yet) - meta-openembedded ==
>> >> > latest upstream commit:
>> >> > 4a45235 opencv: Fix build with clang
>> >> > not included in master yet:
>> >> > df98f41 dnsmasq: disable the service by default
>> >> > fb19f49 openconnect: fix parallel compilation failure
>> >> > 9dafbb4 autofs: Fix build with musl
>> >> > 6e742d3 yp-tools: Upgrade to 4.2.2
>> >> > ef15059 vim: Remove xfce vim bbappend
>> >> > 6fff604 leveldb: Fix build with clang
>> >> > 2864d93 klibc: Edit out gcc hardcoding in do_compile
>> >> > d20ab2d klibc.bbclass: Use forcevariable override to define flags
>> >> > dceaa50 klibc.bbclass: Add -mfloat-abi on arm
>> >> > 2e68338 smbnetfs: delete blacklisted
>> >> > 3f06336 system-setup-keyboard: delete blacklisted
>> >> > 14a15c0 python-jsonschema, python3-jsonschema: add vcversioner-native
>> >> > dependency
>> >> > a9d38f7 v4l-utils: added missing dependency on udev
>> >> > 2b489fd ipvsadm: Add HOMEPAGE info into recipe file.
>> >> > cf39ab8 libidl: Add HOMEPAGE info into recipe file.
>> >> > 4fcda20 lvm2: Add HOMEPAGE info into recipe file.
>> >> > 9e601b0 tcpdump: update to 4.9.2 to fix CVEs
>> >> > 3dbb500 debsums: inherit gettext
>> >> > b972817 protobuf: update to 3.4.0
>> >> > 3e1748f protobuf-c: update to 1.3.0
>> >> > a8cf4de libgpiod: bump version to v0.3.1
>> >> > e9a3fd9 networkmanager: Add HOMEPAGE info into recipe file.
>> >> > 6a0d564 samba: Add HOMEPAGE info into recipe file.
>> >> > db01ddf squid: upgrade to 3.5.27
>> >> > 8b48a16 iproute2: Move tipc enablement to oe-core
>> >> > 1911f84 libmnl: Move to oe-core
>> >> > f02eec7 flatbuffers: add version 1.7.1
>> >> > 9d4b685 capnproto: add version 0.6.1
>> >> > a18db12 libupnp: Add recipe for version 1.8.2
>> >> > 90be7f5 gerbera: clean recipe
>> >> > 62655bc libjs-sizzle: Add HOMEPAGE info into recipe file.
>> >> > 6c0f9c2 liblockfile: Add HOMEPAGE info into recipe file.
>> >> > 87d004b daemontools: Add HOMEPAGE info into recipe file.
>> >> > 346b2a5 fbset: Add HOMEPAGE info into recipe file.
>> >> > 2fdb314 libndp: Add HOMEPAGE info into recipe file.
>> >> > a96fc97 gnome-keyring: Resolve conflict with gcr 3 and gold linking
>> >> > error
>> >> > 34bb6e5 drbd-utils: remove
>> >> > 0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
>> >> > 864fb16 ceres-solver: add new recipe
>> >> > 60b9eb6 libnih: Add HOMEPAGE info into recipe file.
>> >> > 20eeac7 libtdb: Add HOMEPAGE info into recipe file.
>> >> > 84172c0 mailcap: Add HOMEPAGE info into recipe file.
>> >> > 7454d72 mozjs: Add HOMEPAGE info into recipe file.
>> >> > 47bbfc9 numactl: Add HOMEPAGE info into recipe file.
>> >> > ad97869 orbit2: Add HOMEPAGE info into recipe file.
>> >> > f3469c8 sgpio: Add HOMEPAGE info into recipe file.
>> >> > 50a3814 stunnel: Add HOMEPAGE info into recipe file.
>> >> > d260749 leveldb: disable parallelism
>> >> >
>> >> > == Tested changes (not included in master yet) - meta-qt5 ==
>> >> > latest upstream commit:
>> >> > 743b3b9 qtbase-native: Force use of built-in pcre
>> >> > not included in master yet:
>> >> >
>> >> > == Tested changes (not included in master yet) - meta-browser ==
>> >> > latest upstream commit:
>> >> > 972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
>> >> > not included in master yet:
>> >> > 5fcf848 chromium: hide textrel QA issues which are there for ages
>> >> >
>> >> > --
>> >> > _______________________________________________
>> >> > Openembedded-core mailing list
>> >> > Openembedded-core@lists.openembedded.org
>> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >> >
>> >
>> >
>
>

