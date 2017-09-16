Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id BA9FF78571;
	Sat, 16 Sep 2017 14:41:02 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 13so13816980wmq.2;
	Sat, 16 Sep 2017 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MMgK/raGGSRRz5rWFwie7IKTJHJ6Cjbt2JhYpB9yTuI=;
	b=ke0rnjKNigkK+6zX8sUXCCDBtRJnlSTXEctFd9pfezNNAReiKMq7flAm6vDGydZLq7
	9NHdim0fdSXyz+fw5TEs1h/TErUOgL1kx/QTd7q0OI3tG9tqQ3uKnx+lz26Y2CXFlvtl
	VRZ9zaHYQti6vh7xXbHQFQto5BILuYaRsSlksSTZ5WQS+Bet5TcDoBnN/+wJF8UMDXLf
	2H2PujuYiBgDdmT2tqlA4xSJ3PcDZs6njQJRcswqPZi+gFOj0gG5ppHOGjXrEWIZqoLQ
	M58ztvjyP9X1vkmJblMRXyM/UCY0NFeI+Em/lITWGdnvwoqQHOW8l2caczyRCGFFJoLQ
	b8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MMgK/raGGSRRz5rWFwie7IKTJHJ6Cjbt2JhYpB9yTuI=;
	b=pTeKoivHjI0dUaNx7t5S5WElBNlxYd4SV4vYy0OAMzUFuZSm/pTa+zKgLP9sePGzsD
	npRicIAMdUTDAAc9owZaeOknqDDuU/Dgvlp776tIxDa0OQGsi28+cTmp1o0tYX1IDxNY
	7mp9J2Rdv+POlLjRMI015I/jg/p47yOteC6PiEu0gt7nPSsu59/sunHrYLEx1jtWMDK/
	E9TmrokxMwbczMPPVWUeABF/cIu5AyK3EQgDZQHbnMfIcCPuGzSryQa9X1l0u7HC/QCc
	sX12Pl48xGpJX/Ne3AXnMBCGvmKhfbE/ZpypEAbO+vGdBbt0EYOQfD+P0xR2ggdzdJLB
	pU+Q==
X-Gm-Message-State: AHPjjUhrcAND406JAi68iBbYtR0jbZ3NZzRuFYQ2g4ojwPgc9DlNzftS
	dV7uoKd6SBCbjr6rQum1qnbSVFUHnf0UfRjIUF4=
X-Google-Smtp-Source: AOwi7QAtr2lssgF7HBgaGpws/AisyYoYFj9NnMooTSJ7JWigkqc+PoZjxoIcYCoD7QGu0htoY+uieIiGfUSB8Hivitg=
X-Received: by 10.28.45.14 with SMTP id t14mr5188137wmt.50.1505572863035; Sat,
	16 Sep 2017 07:41:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Sat, 16 Sep 2017 07:41:02 -0700 (PDT)
In-Reply-To: <CAMKF1spWpSo4pnB+GVUGAqU0T41jKmVDtRB2cC_+1a7YAaY2vA@mail.gmail.com>
References: <CA+chaQfjWH9SHcF4S61Q2Q_qUk7jcMMehPRibXg-QO_oS_QGiw@mail.gmail.com>
	<CAMKF1soALs=ksNmvTO3vrDnP0gvRQviShq3O--iCZwRzjTB8Xg@mail.gmail.com>
	<CA+chaQdbNsKYzowonqmWYY-hp-e=GdJ_A7_hYq8jCjobw414jA@mail.gmail.com>
	<CAMKF1spWpSo4pnB+GVUGAqU0T41jKmVDtRB2cC_+1a7YAaY2vA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 16 Sep 2017 16:41:02 +0200
Message-ID: <CA+chaQcLPGQaFJOU+pbg=OwceGsmkE3oO8FEitfrL0BvBLmaaQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sat, 16 Sep 2017 14:41:03 -0000
Content-Type: multipart/alternative; boundary="001a11423646af4d2205594f7fd6"

--001a11423646af4d2205594f7fd6
Content-Type: text/plain; charset="UTF-8"

Just the commit IDs from the top won't be very useful, because it's from
jansa/master branches which are rebased even more often than master-next.

If you really want to see them, then there are links to the build logs for
each MACHINE and you can see the build configuration there.

That's why at the bottom is the list of last master commit (as seen in
qemuarm build directory) and list of patches currently applied on top of
it. But to make it accurate for all MACHINEs I would either need to update
the branches only once in 2-3 days when the builds are all finished or to
repeat this section 3 times (which is sometimes quite long even when listed
just for qemuarm).

What I'll do is to include similar git log at the beginning of each build,
so if in doubt opening the individual logs will not only show the
configuration as seen by bitbake, but also the master branch and applied
patches.


On Sat, Sep 16, 2017 at 4:32 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Sep 16, 2017 at 2:00 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Probably is, qemux86 was built from slightly older metadata, so probably
> > including previous versions of your klibc changes.
> >
> > I know it's confusing in the report, but still each build takes around 24
> > hours per machine and I have only 2 builders. e.g. this qemux86 build was
> > started 20170912_234104 as the log directory shows and at that time there
> > wasn't even the latest version of klibc patches on ML.
> >
>
> thats ok. May be top of build configuration would be a good thing to
> have in report. so we know which commit the results belong to.
>
> > Thanks
> >
> > On Sat, Sep 16, 2017 at 1:02 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Fri, Sep 15, 2017 at 3:08 PM, Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >> >
> >> > == Number of issues - stats ==
> >> > {| class='wikitable'
> >> > !|Date      !!colspan='3'|Failed tasks     !!|Signatures
> >> > !!colspan='14'|QA
> >> > !!Comment
> >> > |-
> >> > || ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped ||libdir
> >> > ||textrel ||build-deps ||file-rdeps ||version-going-backwards
> >> > ||host-user-contaminated ||installed-vs-shipped
> >> > ||unknown-configure-option
> >> > ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
> >> > ||compile-host-path ||
> >> > |-
> >> > ||2017-09-14 ||3 ||6 ||2 ||0 ||0 ||0 ||5 ||0 ||0 ||91 ||3 ||0 ||0 ||0
> >> > ||0
> >> > ||0 ||0 ||0 ||
> >> > |}
> >> >
> >> > == Failed tasks 2017-09-14 ==
> >> >
> >> > INFO: jenkins-job.sh-1.8.29 Complete log available at
> >> >
> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> report.20170915_120505.log
> >> >
> >> > === common (1) ===
> >> >     *
> >> > meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
> >> >
> >> > === common-x86 (0) ===
> >> >
> >> > === qemuarm (2) ===
> >> >     *
> >> >
> >> > meta-openembedded/meta-multimedia/recipes-
> connectivity/libupnp/libupnp1.6_1.6.21.bb:do_fetch
> >> >     *
> >> >
> >> > meta-openembedded/meta-oe/recipes-devtools/android-
> tools/android-tools_5.1.1.r37.bb:do_compile
> >> >
> >> > === qemux86 (5) ===
> >> >     *
> >> >
> >> > meta-openembedded/meta-initramfs/recipes-devtools/
> mtd/ubi-utils-klibc_1.5.1.bb:do_compile
> >> >     *
> >> >
> >> > meta-openembedded/meta-initramfs/recipes-kernel/
> kexec/kexec-tools-klibc_2.0.2.bb:do_configure
> >> >     *
> >> >
> >> > meta-openembedded/meta-multimedia/recipes-multimedia/
> gerbera/gerbera_git.bb:do_configure
> >> >     * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
> >> >     *
> >> >
> >> > virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/
> kexecboot_git.bb:do_configure
> >> >
> >>
> >> all meta-initramfs should have been fixed with latest patchset it that
> not
> >> the case ?
> >>
> >> > === qemux86_64 (1) ===
> >> >     *
> >> >
> >> > virtual:native:meta-openembedded/meta-oe/recipes-
> support/uim/uim_1.8.6.bb:do_install
> >> >
> >> > === Number of failed tasks (11) ===
> >> > {| class=wikitable
> >> > |-
> >> > || qemuarm || 3 ||
> >> >
> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemuarm.20170914_113136.log/
> >> > || http://errors.yoctoproject.org/Errors/Build/46775/
> >> > |-
> >> > || qemux86 || 6 ||
> >> >
> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86.20170912_234104.log/
> >> > || http://errors.yoctoproject.org/Errors/Build/46714/
> >> > |-
> >> > || qemux86_64 || 2 ||
> >> >
> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86-64.20170914_015733.log/
> >> > || http://errors.yoctoproject.org/Errors/Build/46761/
> >> > |}
> >> >
> >> > === PNBLACKLISTs (1) ===
> >> >
> >> > === QA issues (99) ===
> >> > {| class=wikitable
> >> > !| Count ||Issue
> >> > |-
> >> > ||0 ||already-stripped
> >> > |-
> >> > ||0 ||build-deps
> >> > |-
> >> > ||0 ||compile-host-path
> >> > |-
> >> > ||0 ||file-rdeps
> >> > |-
> >> > ||0 ||installed-vs-shipped
> >> > |-
> >> > ||0 ||invalid-pkgconfig
> >> > |-
> >> > ||0 ||ldflags
> >> > |-
> >> > ||0 ||libdir
> >> > |-
> >> > ||0 ||pkgname
> >> > |-
> >> > ||0 ||symlink-to-sysroot
> >> > |-
> >> > ||0 ||unknown-configure-option
> >> > |-
> >> > ||3 ||host-user-contaminated
> >> > |-
> >> > ||5 ||textrel
> >> > |-
> >> > ||91 ||version-going-backwards
> >> > |}
> >> >
> >> >
> >> >
> >> > === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> >> >
> >> > Complete log:
> >> >
> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> signatures.20170913_214906.log/
> >> >
> >> > No issues detected
> >> >
> >> >
> >> > PNBLACKLISTs:
> >> > openembedded-core/:
> >> > meta-browser:
> >> > meta-openembedded:
> >> >
> >> > meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:
> PNBLACKLIST[lksctp-tools]
> >> > ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
> fails
> >> > to
> >> > link against sctp_connectx symbol", '', d)}"
> >> > meta-qt5:
> >> > PNBLACKLIST[android-system] = "depends on lxc from
> meta-virtualiazation
> >> > which isn't included in my world builds"
> >> > PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> >> > tested
> >> > so much"
> >> > PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
> >> > tested
> >> > so much"
> >> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> >> > tested
> >> > so much"
> >> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> >> > tested
> >> > so much"
> >> > PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> >> > tested
> >> > so much"
> >> > PNBLACKLIST[build-appliance-image] = "tries to include whole
> downloads
> >> > directory in /home/builder/poky :/"
> >> >
> >> >
> >> > QA issues by type:
> >> > count: 0 issue: already-stripped
> >> >
> >> >
> >> > count: 0 issue: libdir
> >> >
> >> >
> >> > count: 5 issue: textrel
> >> > chromium-54.0.2810.2: ELF binary
> >> >
> >> > '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/
> packages-split/chromium/usr/bin/chromium/chrome'
> >> > has relocations in .text [textrel]
> >> > chromium-wayland-53.0.2785.143: ELF binary
> >> >
> >> > '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.
> 143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
> >> > has relocations in .text [textrel]
> >> > corosync-2.4.2: ELF binary
> >> >
> >> > '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-
> split/corosync/usr/sbin/corosync'
> >> > has relocations in .text [textrel]
> >> > x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> >> >
> >> > '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-
> r0/packages-split/x264-bin/usr/bin/x264'
> >> > has relocations in .text [textrel]
> >> > x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> >> >
> >> > '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-
> r0/packages-split/x264/usr/lib/libx264.so.148'
> >> > has relocations in .text [textrel]
> >> >
> >> >
> >> > count: 0 issue: build-deps
> >> >
> >> >
> >> > count: 0 issue: file-rdeps
> >> >
> >> >
> >> > count: 91 issue: version-going-backwards
> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring-dbg
> went
> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring-dev
> went
> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring-doc
> went
> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ar
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ast
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-as
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-az
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-be+latin went backwards which would break package
> >> > feeds
> >> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-be
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-bg
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-bn-in
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-bn
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-bs
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ca+valencia went backwards which would break
> >> > package
> >> > feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0)
> [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ca
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-cs
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-cy
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-da
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-de
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-dz
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-el
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-en-ca
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-en-gb
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-en+shaw went backwards which would break package
> >> > feeds
> >> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-es
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-et
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-eu
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-fa
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-fi
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-fr
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ga
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-gl
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-gu
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-he
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-hi
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-hr
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-hu
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-id
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-is
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-it
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ja
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ka
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-kn
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ko
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-lt
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-lv
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-mai
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-mg
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-mk
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ml
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-mn
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-mr
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ms
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-nb
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ne
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-nl
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-nn
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-oc
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-or
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-pa
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-pl
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-pt-br
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-pt
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ro
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ru
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-rw
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-si
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-sk
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-sl
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-sq
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-sr+latin went backwards which would break package
> >> > feeds
> >> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-sr
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-sv
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-ta
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-te
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-th
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-tr
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-uk
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-vi
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-xh
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-zh-cn
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-zh-hk
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-locale-zh-tw
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package
> >> > gnome-keyring-staticdev
> >> > went backwards which would break package feeds from (0:2.32.1-r12.40
> to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring went
> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> > libupnp-1.6.21: Package version for package libupnp-dbg went backwards
> >> > which
> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> >> > [version-going-backwards]
> >> > libupnp-1.6.21: Package version for package libupnp-dev went backwards
> >> > which
> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> >> > [version-going-backwards]
> >> > libupnp-1.6.21: Package version for package libupnp-doc went backwards
> >> > which
> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> >> > [version-going-backwards]
> >> > libupnp-1.6.21: Package version for package libupnp-locale went
> >> > backwards
> >> > which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> >> > [version-going-backwards]
> >> > libupnp-1.6.21: Package version for package libupnp-staticdev went
> >> > backwards
> >> > which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> >> > [version-going-backwards]
> >> > libupnp-1.6.21: Package version for package libupnp went backwards
> which
> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> >> > [version-going-backwards]
> >> >
> >> >
> >> > count: 3 issue: host-user-contaminated
> >> > glibc-locale-2.26: glibc-locale:
> >> > /glibc-binary-localedata-ru-ru/usr/lib/locale/ru_RU/LC_CTYPE is
> owned by
> >> > uid
> >> > 3004, which is the same as the user running bitbake. This may be due
> to
> >> > host
> >> > contamination [host-user-contaminated]
> >> > qt5-creator-3.5.1: qt5-creator:
> >> > /qt5-creator/usr/lib/qt5/qtcreator/plugins/libPythonEditor.so is
> owned
> >> > by
> >> > uid 3004, which is the same as the user running bitbake. This may be
> due
> >> > to
> >> > host contamination [host-user-contaminated]
> >> > qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: qtdeclarative:
> >> > /qtdeclarative-qmlplugins/usr/lib/qt5/qml/QtQuick.2/qmldir is owned
> by
> >> > uid
> >> > 3004, which is the same as the user running bitbake. This may be due
> to
> >> > host
> >> > contamination [host-user-contaminated]
> >> >
> >> >
> >> > count: 0 issue: installed-vs-shipped
> >> >
> >> >
> >> > count: 0 issue: unknown-configure-option
> >> >
> >> >
> >> > count: 0 issue: symlink-to-sysroot
> >> >
> >> >
> >> > count: 0 issue: invalid-pkgconfig
> >> >
> >> >
> >> > count: 0 issue: pkgname
> >> >
> >> >
> >> > count: 0 issue: ldflags
> >> >
> >> >
> >> > count: 0 issue: compile-host-path
> >> >
> >> >
> >> >
> >> > == Tested changes (not included in master yet) - bitbake ==
> >> > latest upstream commit:
> >> > 567f2cf server/process: ensure server failure log is limited to
> current
> >> > session
> >> > not included in master yet:
> >> > 3ec2af2 world-image: add extra target
> >> > 8eebabe fetch2: Allow Fetch.download() to warn instead of error
> >> >
> >> > == Tested changes (not included in master yet) - openembedded-core ==
> >> > latest upstream commit:
> >> > 8fe9fb4 python*native.bbclass: suppress user site dirs
> >> > not included in master yet:
> >> > 0d7ac07 report-error: Allow to upload reports automatically
> >> > 20d6101 buildhistory.bbclass: metadata-revs show repo parent
> >> > 202fb4c metadata-revs: provide more information
> >> > b3500a7 qemux86: Add identical qemux86copy variant for tests
> >> > 0de46b0 reproducible_build.bbclass: initial support for binary
> >> > reproducibility
> >> > d407a03 cpio: provide cpio-replacement-native
> >> > c872fa6 image_types.bbclass: improve cpio image reproducibility
> >> > 3fcc641 rootfs-postcommands.bbclass: support binary reproducibility
> >> > a132f03 sstate.bbclass: Do not cause build failures due to setscene
> >> > errors
> >> > 198ea0e insane.bbclass: Add do_qa_pseudo function to check for common
> >> > errors
> >> > listed in pseudo.log
> >> > 3283a1c insane.bbclass: do_qa_pseudo: don't trigger error from '^inode
> >> > mismatch'
> >> > beb394d insane.bbclass: do_qa_pseudo: show parts of pseudo.log in
> >> > console
> >> >
> >> > == Tested changes (not included in master yet) - meta-openembedded ==
> >> > latest upstream commit:
> >> > 4a45235 opencv: Fix build with clang
> >> > not included in master yet:
> >> > df98f41 dnsmasq: disable the service by default
> >> > fb19f49 openconnect: fix parallel compilation failure
> >> > 9dafbb4 autofs: Fix build with musl
> >> > 6e742d3 yp-tools: Upgrade to 4.2.2
> >> > ef15059 vim: Remove xfce vim bbappend
> >> > 6fff604 leveldb: Fix build with clang
> >> > 2864d93 klibc: Edit out gcc hardcoding in do_compile
> >> > d20ab2d klibc.bbclass: Use forcevariable override to define flags
> >> > dceaa50 klibc.bbclass: Add -mfloat-abi on arm
> >> > 2e68338 smbnetfs: delete blacklisted
> >> > 3f06336 system-setup-keyboard: delete blacklisted
> >> > 14a15c0 python-jsonschema, python3-jsonschema: add vcversioner-native
> >> > dependency
> >> > a9d38f7 v4l-utils: added missing dependency on udev
> >> > 2b489fd ipvsadm: Add HOMEPAGE info into recipe file.
> >> > cf39ab8 libidl: Add HOMEPAGE info into recipe file.
> >> > 4fcda20 lvm2: Add HOMEPAGE info into recipe file.
> >> > 9e601b0 tcpdump: update to 4.9.2 to fix CVEs
> >> > 3dbb500 debsums: inherit gettext
> >> > b972817 protobuf: update to 3.4.0
> >> > 3e1748f protobuf-c: update to 1.3.0
> >> > a8cf4de libgpiod: bump version to v0.3.1
> >> > e9a3fd9 networkmanager: Add HOMEPAGE info into recipe file.
> >> > 6a0d564 samba: Add HOMEPAGE info into recipe file.
> >> > db01ddf squid: upgrade to 3.5.27
> >> > 8b48a16 iproute2: Move tipc enablement to oe-core
> >> > 1911f84 libmnl: Move to oe-core
> >> > f02eec7 flatbuffers: add version 1.7.1
> >> > 9d4b685 capnproto: add version 0.6.1
> >> > a18db12 libupnp: Add recipe for version 1.8.2
> >> > 90be7f5 gerbera: clean recipe
> >> > 62655bc libjs-sizzle: Add HOMEPAGE info into recipe file.
> >> > 6c0f9c2 liblockfile: Add HOMEPAGE info into recipe file.
> >> > 87d004b daemontools: Add HOMEPAGE info into recipe file.
> >> > 346b2a5 fbset: Add HOMEPAGE info into recipe file.
> >> > 2fdb314 libndp: Add HOMEPAGE info into recipe file.
> >> > a96fc97 gnome-keyring: Resolve conflict with gcr 3 and gold linking
> >> > error
> >> > 34bb6e5 drbd-utils: remove
> >> > 0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
> >> > 864fb16 ceres-solver: add new recipe
> >> > 60b9eb6 libnih: Add HOMEPAGE info into recipe file.
> >> > 20eeac7 libtdb: Add HOMEPAGE info into recipe file.
> >> > 84172c0 mailcap: Add HOMEPAGE info into recipe file.
> >> > 7454d72 mozjs: Add HOMEPAGE info into recipe file.
> >> > 47bbfc9 numactl: Add HOMEPAGE info into recipe file.
> >> > ad97869 orbit2: Add HOMEPAGE info into recipe file.
> >> > f3469c8 sgpio: Add HOMEPAGE info into recipe file.
> >> > 50a3814 stunnel: Add HOMEPAGE info into recipe file.
> >> > d260749 leveldb: disable parallelism
> >> >
> >> > == Tested changes (not included in master yet) - meta-qt5 ==
> >> > latest upstream commit:
> >> > 743b3b9 qtbase-native: Force use of built-in pcre
> >> > not included in master yet:
> >> >
> >> > == Tested changes (not included in master yet) - meta-browser ==
> >> > latest upstream commit:
> >> > 972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
> >> > not included in master yet:
> >> > 5fcf848 chromium: hide textrel QA issues which are there for ages
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >
> >
> >
>

--001a11423646af4d2205594f7fd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just the commit IDs from the top won&#39;t be very useful,=
 because it&#39;s from jansa/master branches which are rebased even more of=
ten than master-next.<div><br></div><div>If you really want to see them, th=
en there are links to the build logs for each MACHINE and you can see the b=
uild configuration there.</div><div><br></div><div>That&#39;s why at the bo=
ttom is the list of last master commit (as seen in qemuarm build directory)=
 and list of patches currently applied on top of it. But to make it accurat=
e for all MACHINEs I would either need to update the branches only once in =
2-3 days when the builds are all finished or to repeat this section 3 times=
 (which is sometimes quite long even when listed just for qemuarm).</div><d=
iv><br></div><div>What I&#39;ll do is to include similar git log at the beg=
inning of each build, so if in doubt opening the individual logs will not o=
nly show the configuration as seen by bitbake, but also the master branch a=
nd applied patches.</div><div><br></div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Sat, Sep 16, 2017 at 4:32 PM, Khem Raj <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">r=
aj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">On Sat, Sep 16, 2017 at 2:00 AM, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br=
>
&gt; Probably is, qemux86 was built from slightly older metadata, so probab=
ly<br>
&gt; including previous versions of your klibc changes.<br>
&gt;<br>
&gt; I know it&#39;s confusing in the report, but still each build takes ar=
ound 24<br>
&gt; hours per machine and I have only 2 builders. e.g. this qemux86 build =
was<br>
&gt; started 20170912_234104 as the log directory shows and at that time th=
ere<br>
&gt; wasn&#39;t even the latest version of klibc patches on ML.<br>
&gt;<br>
<br>
</span>thats ok. May be top of build configuration would be a good thing to=
<br>
have in report. so we know which commit the results belong to.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Thanks<br>
&gt;<br>
&gt; On Sat, Sep 16, 2017 at 1:02 AM, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Sep 15, 2017 at 3:08 PM, Martin Jansa &lt;<a href=3D"mailt=
o:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; <a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Sta=
tus" rel=3D"noreferrer" target=3D"_blank">http://www.openembedded.org/<wbr>=
wiki/Bitbake_World_Status</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D Number of issues - stats =3D=3D<br>
&gt;&gt; &gt; {| class=3D&#39;wikitable&#39;<br>
&gt;&gt; &gt; !|Date=C2=A0 =C2=A0 =C2=A0 !!colspan=3D&#39;3&#39;|Failed tas=
ks=C2=A0 =C2=A0 =C2=A0!!|Signatures<br>
&gt;&gt; &gt; !!colspan=3D&#39;14&#39;|QA<br>
&gt;&gt; &gt; !!Comment<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; || ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped =
||libdir<br>
&gt;&gt; &gt; ||textrel ||build-deps ||file-rdeps ||version-going-backwards=
<br>
&gt;&gt; &gt; ||host-user-contaminated ||installed-vs-shipped<br>
&gt;&gt; &gt; ||unknown-configure-option<br>
&gt;&gt; &gt; ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags<=
br>
&gt;&gt; &gt; ||compile-host-path ||<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||2017-09-14 ||3 ||6 ||2 ||0 ||0 ||0 ||5 ||0 ||0 ||91 ||3 ||0=
 ||0 ||0<br>
&gt;&gt; &gt; ||0<br>
&gt;&gt; &gt; ||0 ||0 ||0 ||<br>
&gt;&gt; &gt; |}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D Failed tasks 2017-09-14 =3D=3D<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; INFO: jenkins-job.sh-1.8.29 Complete log available at<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.report.20170915_120505.log" rel=3D"noreferrer" target=3D"_blank">htt=
p://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>report.2017=
0915_120505.log</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D=3D common (1) =3D=3D=3D<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt; meta-browser/recipes-mozilla/<wbr>firefox/firefox_45.9.0esr.b=
b:d<wbr>o_compile<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D=3D common-x86 (0) =3D=3D=3D<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D=3D qemuarm (2) =3D=3D=3D<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; meta-openembedded/meta-<wbr>multimedia/recipes-<wbr>connectiv=
ity/libupnp/libupnp1.<wbr>6_1.6.21.bb:do_fetch<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; meta-openembedded/meta-oe/<wbr>recipes-devtools/android-<wbr>=
tools/android-tools_5.1.1.r37.<wbr>bb:do_compile<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D=3D qemux86 (5) =3D=3D=3D<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; meta-openembedded/meta-<wbr>initramfs/recipes-devtools/<wbr>m=
td/ubi-utils-klibc_1.5.1.bb:d<wbr>o_compile<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; meta-openembedded/meta-<wbr>initramfs/recipes-kernel/<wbr>kex=
ec/kexec-tools-klibc_2.0.2.<wbr>bb:do_configure<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; meta-openembedded/meta-<wbr>multimedia/recipes-multimedia/<wb=
r>gerbera/gerbera_git.bb:do_<wbr>configure<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0* meta-qt5/recipes-qt/qt5/<wbr>qtlocation_=
git.bb:do_compile<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; virtual:klibc:meta-<wbr>openembedded/meta-initramfs/<wbr>reci=
pes-bsp/kexecboot/<wbr>kexecboot_git.bb:do_configure<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; all meta-initramfs should have been fixed with latest patchset it =
that not<br>
&gt;&gt; the case ?<br>
&gt;&gt;<br>
&gt;&gt; &gt; =3D=3D=3D qemux86_64 (1) =3D=3D=3D<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; virtual:native:meta-<wbr>openembedded/meta-oe/recipes-<wbr>su=
pport/uim/uim_1.8.6.bb:do_<wbr>install<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D=3D Number of failed tasks (11) =3D=3D=3D<br>
&gt;&gt; &gt; {| class=3Dwikitable<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; || qemuarm || 3 ||<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.world.qemuarm.20170914_113136.log/" rel=3D"noreferrer" target=3D"_bl=
ank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>wor=
ld.qemuarm.20170914_113136.<wbr>log/</a><br>
&gt;&gt; &gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/467=
75/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>o=
rg/Errors/Build/46775/</a><br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; || qemux86 || 6 ||<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.world.qemux86.20170912_234104.log/" rel=3D"noreferrer" target=3D"_bl=
ank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>wor=
ld.qemux86.20170912_234104.<wbr>log/</a><br>
&gt;&gt; &gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/467=
14/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>o=
rg/Errors/Build/46714/</a><br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; || qemux86_64 || 2 ||<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.world.qemux86-64.20170914_015733.log/" rel=3D"noreferrer" target=3D"=
_blank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>=
world.qemux86-64.20170914_<wbr>015733.log/</a><br>
&gt;&gt; &gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/467=
61/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>o=
rg/Errors/Build/46761/</a><br>
&gt;&gt; &gt; |}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D=3D QA issues (99) =3D=3D=3D<br>
&gt;&gt; &gt; {| class=3Dwikitable<br>
&gt;&gt; &gt; !| Count ||Issue<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||already-stripped<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||build-deps<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||compile-host-path<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||file-rdeps<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||installed-vs-shipped<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||invalid-pkgconfig<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||ldflags<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||libdir<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||pkgname<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||symlink-to-sysroot<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||0 ||unknown-configure-option<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||3 ||host-user-contaminated<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||5 ||textrel<br>
&gt;&gt; &gt; |-<br>
&gt;&gt; &gt; ||91 ||version-going-backwards<br>
&gt;&gt; &gt; |}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=
=3D=3D<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Complete log:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170913_214906.log/" rel=3D"noreferrer" target=3D"_blank=
">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>signat=
ures.20170913_214906.<wbr>log/</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; No issues detected<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; PNBLACKLISTs:<br>
&gt;&gt; &gt; openembedded-core/:<br>
&gt;&gt; &gt; meta-browser:<br>
&gt;&gt; &gt; meta-openembedded:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; meta-networking/recipes-<wbr>support/lksctp-tools/lksctp-<wbr=
>tools_1.0.17.bb:PNBLACKLIST[<wbr>lksctp-tools]<br>
&gt;&gt; &gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails<br>
&gt;&gt; &gt; to<br>
&gt;&gt; &gt; link against sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot=
;<br>
&gt;&gt; &gt; meta-qt5:<br>
&gt;&gt; &gt; PNBLACKLIST[android-system] =3D &quot;depends on lxc from met=
a-virtualiazation<br>
&gt;&gt; &gt; which isn&#39;t included in my world builds&quot;<br>
&gt;&gt; &gt; PNBLACKLIST[bigbuckbunny-<wbr>1080p] =3D &quot;big and doesn&=
#39;t really need to be<br>
&gt;&gt; &gt; tested<br>
&gt;&gt; &gt; so much&quot;<br>
&gt;&gt; &gt; PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t =
really need to be<br>
&gt;&gt; &gt; tested<br>
&gt;&gt; &gt; so much&quot;<br>
&gt;&gt; &gt; PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t =
really need to be<br>
&gt;&gt; &gt; tested<br>
&gt;&gt; &gt; so much&quot;<br>
&gt;&gt; &gt; PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t =
really need to be<br>
&gt;&gt; &gt; tested<br>
&gt;&gt; &gt; so much&quot;<br>
&gt;&gt; &gt; PNBLACKLIST[tearsofsteel-<wbr>1080p] =3D &quot;big and doesn&=
#39;t really need to be<br>
&gt;&gt; &gt; tested<br>
&gt;&gt; &gt; so much&quot;<br>
&gt;&gt; &gt; PNBLACKLIST[build-appliance-<wbr>image] =3D &quot;tries to in=
clude whole downloads<br>
&gt;&gt; &gt; directory in /home/builder/poky :/&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; QA issues by type:<br>
&gt;&gt; &gt; count: 0 issue: already-stripped<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 0 issue: libdir<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 5 issue: textrel<br>
&gt;&gt; &gt; chromium-54.0.2810.2: ELF binary<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &#39;/tmp/work/i586-oe-linux/<wbr>chromium/54.0.2810.2-r0/<wb=
r>packages-split/chromium/usr/<wbr>bin/chromium/chrome&#39;<br>
&gt;&gt; &gt; has relocations in .text [textrel]<br>
&gt;&gt; &gt; chromium-wayland-53.0.2785.<wbr>143: ELF binary<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &#39;/tmp/work/i586-oe-linux/<wbr>chromium-wayland/53.0.2785.=
<wbr>143-r0/packages-split/<wbr>chromium-wayland/usr/bin/<wbr>chromium/chro=
me&#39;<br>
&gt;&gt; &gt; has relocations in .text [textrel]<br>
&gt;&gt; &gt; corosync-2.4.2: ELF binary<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &#39;/tmp/work/core2-64-oe-linux/<wbr>corosync/2.4.2-r0/packa=
ges-<wbr>split/corosync/usr/sbin/<wbr>corosync&#39;<br>
&gt;&gt; &gt; has relocations in .text [textrel]<br>
&gt;&gt; &gt; x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &#39;/tmp/work/i586-oe-linux/x264/<wbr>r2731+gitAUTOINC+2b741=
f81e5-<wbr>r0/packages-split/x264-bin/<wbr>usr/bin/x264&#39;<br>
&gt;&gt; &gt; has relocations in .text [textrel]<br>
&gt;&gt; &gt; x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &#39;/tmp/work/i586-oe-linux/x264/<wbr>r2731+gitAUTOINC+2b741=
f81e5-<wbr>r0/packages-split/x264/usr/<wbr>lib/libx264.so.148&#39;<br>
&gt;&gt; &gt; has relocations in .text [textrel]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 0 issue: build-deps<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 0 issue: file-rdeps<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 91 issue: version-going-backwards<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package gnome-keyri=
ng-dbg went<br>
&gt;&gt; &gt; backwards which would break package feeds from (0:2.32.1-r12.=
40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package gnome-keyri=
ng-dev went<br>
&gt;&gt; &gt; backwards which would break package feeds from (0:2.32.1-r12.=
40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package gnome-keyri=
ng-doc went<br>
&gt;&gt; &gt; backwards which would break package feeds from (0:2.32.1-r12.=
40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ar<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ast<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-as<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-az<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-be+latin went backwards which would brea=
k package<br>
&gt;&gt; &gt; feeds<br>
&gt;&gt; &gt; from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backw=
ards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-be<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-bg<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-bn-in<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-bn<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-bs<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ca+<wbr>valencia went backwards which wo=
uld break<br>
&gt;&gt; &gt; package<br>
&gt;&gt; &gt; feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going=
-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ca<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-cs<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-cy<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-da<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-de<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-dz<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-el<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-en-ca<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-en-gb<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-en+shaw went backwards which would break=
 package<br>
&gt;&gt; &gt; feeds<br>
&gt;&gt; &gt; from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backw=
ards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-es<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-et<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-eu<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-fa<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-fi<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-fr<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ga<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-gl<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-gu<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-he<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-hi<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-hr<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-hu<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-id<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-is<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-it<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ja<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ka<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-kn<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ko<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-lt<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-lv<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-mai<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-mg<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-mk<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ml<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-mn<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-mr<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ms<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-nb<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ne<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-nl<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-nn<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-oc<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-or<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-pa<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-pl<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-pt-br<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-pt<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ro<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ru<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-rw<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-si<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-sk<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-sl<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-sq<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-sr+latin went backwards which would brea=
k package<br>
&gt;&gt; &gt; feeds<br>
&gt;&gt; &gt; from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backw=
ards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-sr<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-sv<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-ta<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-te<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-th<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-tr<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-uk<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-vi<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-xh<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-zh-cn<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-zh-hk<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-locale-zh-tw<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br>
&gt;&gt; &gt; gnome-keyring-staticdev<br>
&gt;&gt; &gt; went backwards which would break package feeds from (0:2.32.1=
-r12.40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package gnome-keyri=
ng went<br>
&gt;&gt; &gt; backwards which would break package feeds from (0:2.32.1-r12.=
40 to<br>
&gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp-dbg went =
backwards<br>
&gt;&gt; &gt; which<br>
&gt;&gt; &gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2=
)<br>
&gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp-dev went =
backwards<br>
&gt;&gt; &gt; which<br>
&gt;&gt; &gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2=
)<br>
&gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp-doc went =
backwards<br>
&gt;&gt; &gt; which<br>
&gt;&gt; &gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2=
)<br>
&gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp-locale we=
nt<br>
&gt;&gt; &gt; backwards<br>
&gt;&gt; &gt; which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.2=
1-r0.2)<br>
&gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp-staticdev=
 went<br>
&gt;&gt; &gt; backwards<br>
&gt;&gt; &gt; which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.2=
1-r0.2)<br>
&gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp went back=
wards which<br>
&gt;&gt; &gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2=
)<br>
&gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 3 issue: host-user-contaminated<br>
&gt;&gt; &gt; glibc-locale-2.26: glibc-locale:<br>
&gt;&gt; &gt; /glibc-binary-localedata-ru-<wbr>ru/usr/lib/locale/ru_RU/LC_<=
wbr>CTYPE is owned by<br>
&gt;&gt; &gt; uid<br>
&gt;&gt; &gt; 3004, which is the same as the user running bitbake. This may=
 be due to<br>
&gt;&gt; &gt; host<br>
&gt;&gt; &gt; contamination [host-user-contaminated]<br>
&gt;&gt; &gt; qt5-creator-3.5.1: qt5-creator:<br>
&gt;&gt; &gt; /qt5-creator/usr/lib/qt5/<wbr>qtcreator/plugins/<wbr>libPytho=
nEditor.so is owned<br>
&gt;&gt; &gt; by<br>
&gt;&gt; &gt; uid 3004, which is the same as the user running bitbake. This=
 may be due<br>
&gt;&gt; &gt; to<br>
&gt;&gt; &gt; host contamination [host-user-contaminated]<br>
&gt;&gt; &gt; qtdeclarative-5.9.2+<wbr>gitAUTOINC+7c45b035b9: qtdeclarative=
:<br>
&gt;&gt; &gt; /qtdeclarative-qmlplugins/usr/<wbr>lib/qt5/qml/QtQuick.2/qmld=
ir is owned by<br>
&gt;&gt; &gt; uid<br>
&gt;&gt; &gt; 3004, which is the same as the user running bitbake. This may=
 be due to<br>
&gt;&gt; &gt; host<br>
&gt;&gt; &gt; contamination [host-user-contaminated]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 0 issue: installed-vs-shipped<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 0 issue: unknown-configure-option<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 0 issue: symlink-to-sysroot<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 0 issue: invalid-pkgconfig<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 0 issue: pkgname<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 0 issue: ldflags<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; count: 0 issue: compile-host-path<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D Tested changes (not included in master yet) - bitbake =
=3D=3D<br>
&gt;&gt; &gt; latest upstream commit:<br>
&gt;&gt; &gt; 567f2cf server/process: ensure server failure log is limited =
to current<br>
&gt;&gt; &gt; session<br>
&gt;&gt; &gt; not included in master yet:<br>
&gt;&gt; &gt; 3ec2af2 world-image: add extra target<br>
&gt;&gt; &gt; 8eebabe fetch2: Allow Fetch.download() to warn instead of err=
or<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D Tested changes (not included in master yet) - openembe=
dded-core =3D=3D<br>
&gt;&gt; &gt; latest upstream commit:<br>
&gt;&gt; &gt; 8fe9fb4 python*native.bbclass: suppress user site dirs<br>
&gt;&gt; &gt; not included in master yet:<br>
&gt;&gt; &gt; 0d7ac07 report-error: Allow to upload reports automatically<b=
r>
&gt;&gt; &gt; 20d6101 buildhistory.bbclass: metadata-revs show repo parent<=
br>
&gt;&gt; &gt; 202fb4c metadata-revs: provide more information<br>
&gt;&gt; &gt; b3500a7 qemux86: Add identical qemux86copy variant for tests<=
br>
&gt;&gt; &gt; 0de46b0 reproducible_build.bbclass: initial support for binar=
y<br>
&gt;&gt; &gt; reproducibility<br>
&gt;&gt; &gt; d407a03 cpio: provide cpio-replacement-native<br>
&gt;&gt; &gt; c872fa6 image_types.bbclass: improve cpio image reproducibili=
ty<br>
&gt;&gt; &gt; 3fcc641 rootfs-postcommands.bbclass: support binary reproduci=
bility<br>
&gt;&gt; &gt; a132f03 sstate.bbclass: Do not cause build failures due to se=
tscene<br>
&gt;&gt; &gt; errors<br>
&gt;&gt; &gt; 198ea0e insane.bbclass: Add do_qa_pseudo function to check fo=
r common<br>
&gt;&gt; &gt; errors<br>
&gt;&gt; &gt; listed in pseudo.log<br>
&gt;&gt; &gt; 3283a1c insane.bbclass: do_qa_pseudo: don&#39;t trigger error=
 from &#39;^inode<br>
&gt;&gt; &gt; mismatch&#39;<br>
&gt;&gt; &gt; beb394d insane.bbclass: do_qa_pseudo: show parts of pseudo.lo=
g in<br>
&gt;&gt; &gt; console<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D Tested changes (not included in master yet) - meta-ope=
nembedded =3D=3D<br>
&gt;&gt; &gt; latest upstream commit:<br>
&gt;&gt; &gt; 4a45235 opencv: Fix build with clang<br>
&gt;&gt; &gt; not included in master yet:<br>
&gt;&gt; &gt; df98f41 dnsmasq: disable the service by default<br>
&gt;&gt; &gt; fb19f49 openconnect: fix parallel compilation failure<br>
&gt;&gt; &gt; 9dafbb4 autofs: Fix build with musl<br>
&gt;&gt; &gt; 6e742d3 yp-tools: Upgrade to 4.2.2<br>
&gt;&gt; &gt; ef15059 vim: Remove xfce vim bbappend<br>
&gt;&gt; &gt; 6fff604 leveldb: Fix build with clang<br>
&gt;&gt; &gt; 2864d93 klibc: Edit out gcc hardcoding in do_compile<br>
&gt;&gt; &gt; d20ab2d klibc.bbclass: Use forcevariable override to define f=
lags<br>
&gt;&gt; &gt; dceaa50 klibc.bbclass: Add -mfloat-abi on arm<br>
&gt;&gt; &gt; 2e68338 smbnetfs: delete blacklisted<br>
&gt;&gt; &gt; 3f06336 system-setup-keyboard: delete blacklisted<br>
&gt;&gt; &gt; 14a15c0 python-jsonschema, python3-jsonschema: add vcversione=
r-native<br>
&gt;&gt; &gt; dependency<br>
&gt;&gt; &gt; a9d38f7 v4l-utils: added missing dependency on udev<br>
&gt;&gt; &gt; 2b489fd ipvsadm: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; cf39ab8 libidl: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 4fcda20 lvm2: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 9e601b0 tcpdump: update to 4.9.2 to fix CVEs<br>
&gt;&gt; &gt; 3dbb500 debsums: inherit gettext<br>
&gt;&gt; &gt; b972817 protobuf: update to 3.4.0<br>
&gt;&gt; &gt; 3e1748f protobuf-c: update to 1.3.0<br>
&gt;&gt; &gt; a8cf4de libgpiod: bump version to v0.3.1<br>
&gt;&gt; &gt; e9a3fd9 networkmanager: Add HOMEPAGE info into recipe file.<b=
r>
&gt;&gt; &gt; 6a0d564 samba: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; db01ddf squid: upgrade to 3.5.27<br>
&gt;&gt; &gt; 8b48a16 iproute2: Move tipc enablement to oe-core<br>
&gt;&gt; &gt; 1911f84 libmnl: Move to oe-core<br>
&gt;&gt; &gt; f02eec7 flatbuffers: add version 1.7.1<br>
&gt;&gt; &gt; 9d4b685 capnproto: add version 0.6.1<br>
&gt;&gt; &gt; a18db12 libupnp: Add recipe for version 1.8.2<br>
&gt;&gt; &gt; 90be7f5 gerbera: clean recipe<br>
&gt;&gt; &gt; 62655bc libjs-sizzle: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 6c0f9c2 liblockfile: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 87d004b daemontools: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 346b2a5 fbset: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 2fdb314 libndp: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; a96fc97 gnome-keyring: Resolve conflict with gcr 3 and gold l=
inking<br>
&gt;&gt; &gt; error<br>
&gt;&gt; &gt; 34bb6e5 drbd-utils: remove<br>
&gt;&gt; &gt; 0001-drbd-8.4.4-drbd-tools-<wbr>only-rmmod-if-DRBD-is-a-<wbr>=
module.patch<br>
&gt;&gt; &gt; 864fb16 ceres-solver: add new recipe<br>
&gt;&gt; &gt; 60b9eb6 libnih: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 20eeac7 libtdb: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 84172c0 mailcap: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 7454d72 mozjs: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 47bbfc9 numactl: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; ad97869 orbit2: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; f3469c8 sgpio: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; 50a3814 stunnel: Add HOMEPAGE info into recipe file.<br>
&gt;&gt; &gt; d260749 leveldb: disable parallelism<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D Tested changes (not included in master yet) - meta-qt5=
 =3D=3D<br>
&gt;&gt; &gt; latest upstream commit:<br>
&gt;&gt; &gt; 743b3b9 qtbase-native: Force use of built-in pcre<br>
&gt;&gt; &gt; not included in master yet:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D Tested changes (not included in master yet) - meta-bro=
wser =3D=3D<br>
&gt;&gt; &gt; latest upstream commit:<br>
&gt;&gt; &gt; 972cab7 gnome-settings-daemon: remove the bbappend for remove=
d recipe<br>
&gt;&gt; &gt; not included in master yet:<br>
&gt;&gt; &gt; 5fcf848 chromium: hide textrel QA issues which are there for =
ages<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a11423646af4d2205594f7fd6--
