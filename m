Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 23CCD7782F;
	Tue, 19 Sep 2017 20:38:44 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id k20so605588wre.4;
	Tue, 19 Sep 2017 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZvUh44bD1/c9FyCZnnqLN6SXfboCMUYl96rPE8KNoHE=;
	b=WKqtUt7G/+ba9acDgCJ6mnYVc9eZCF1YHevZVSx+AtEid+Ldx15DmKsWazA5P0CbvT
	HuLJ+tc3+UhqA2mc5xDsA2gKV/wMrpvIGsuanlwNB5xvtCCXnKTIjcRBTSxdClsV8cJ+
	hJw8rpbmJu9Wdc+70RsLfw/2gIlFrfimPiwRIz8yvUMV2qxprnbV6zawHEAZZpypKGKT
	qVvVfAaWTb2qGtse3aLv1KoK4AhfuGeDuoXtRNt3AiQ7vPAKMDupbKE1uzfEbwWrd8tt
	AWwNaPUPx6NSq3W55TPCsO8KXi7krxgNeMvJe/k6vtaMHPcB5RBWTS4fKSUfSV2xKK2q
	yIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZvUh44bD1/c9FyCZnnqLN6SXfboCMUYl96rPE8KNoHE=;
	b=XqS+4/SGOqplErdL7TjNC8bHXXfh2QRdMB2kSOzlZ9sBstc3MaJoE/w3/06MRDvGBQ
	Pau972/d/BuOmy85wfH9UqVNX3xo5tE9t2DH9f9Ok6I0q3TuJKjL06Cf8SwT0EPmQLxa
	9rz0wH1L/7lykscVCgy4S8g6WSVfO9nn2HrYl8dcDPPEx6okWZu4tawFpLb1joiOSqZs
	qoSfmhRl3f518I1mKZQhZweqL4PORs+b4VVQY++GxyZKtWdolDPJU8hK1opkOERaQkF2
	rD3ZIMrO6hvf413qO7A6VlKGBfdn8fAsVIAsRwq7N5lV8fsKN56WzTwAH4bBdEBa0+57
	HKGQ==
X-Gm-Message-State: AHPjjUjTrtGnOOdBvoY+O2dwMnM/Ib71jEt9M/08d7SatJ4GJplulcjD
	xFjmC7jJmGpf9w9rFJ6eQJHQodouJNFwIrHM5sU=
X-Google-Smtp-Source: AOwi7QCqsT5cCNYlOiE9FEhQBLg6lJTrxKE48hzndtR3xQfcKIlxK/2GSZtvJooz+5LuAP3YNRSC4nkJUpj87oGFNvE=
X-Received: by 10.223.164.153 with SMTP id g25mr2694804wrb.67.1505853525554;
	Tue, 19 Sep 2017 13:38:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Tue, 19 Sep 2017 13:38:44 -0700 (PDT)
In-Reply-To: <CAMKF1soA5UfaisQ3dqKv=R6N8nkVKLH_30JcjxncS4T-40HZWA@mail.gmail.com>
References: <CA+chaQfjWH9SHcF4S61Q2Q_qUk7jcMMehPRibXg-QO_oS_QGiw@mail.gmail.com>
	<CAMKF1soALs=ksNmvTO3vrDnP0gvRQviShq3O--iCZwRzjTB8Xg@mail.gmail.com>
	<CA+chaQdbNsKYzowonqmWYY-hp-e=GdJ_A7_hYq8jCjobw414jA@mail.gmail.com>
	<CAMKF1spWpSo4pnB+GVUGAqU0T41jKmVDtRB2cC_+1a7YAaY2vA@mail.gmail.com>
	<CA+chaQcLPGQaFJOU+pbg=OwceGsmkE3oO8FEitfrL0BvBLmaaQ@mail.gmail.com>
	<CAMKF1soA5UfaisQ3dqKv=R6N8nkVKLH_30JcjxncS4T-40HZWA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Sep 2017 22:38:44 +0200
Message-ID: <CA+chaQcJ_eFjBKFGfbG2RRqCpeM0qhuEfJ4Du9ypNj+23=Beug@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Sep 2017 20:38:45 -0000
Content-Type: multipart/alternative; boundary="f403045f1eaa797bec055990d8e4"

--f403045f1eaa797bec055990d8e4
Content-Type: text/plain; charset="UTF-8"

Done
https://github.com/shr-project/jenkins-jobs/commit/dbb5e4e4e2c5821381eda729ab746a21238c8801

On Sat, Sep 16, 2017 at 5:01 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Sep 16, 2017 at 7:41 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Just the commit IDs from the top won't be very useful, because it's from
> > jansa/master branches which are rebased even more often than master-next.
> >
> > If you really want to see them, then there are links to the build logs
> for
> > each MACHINE and you can see the build configuration there.
> >
> > That's why at the bottom is the list of last master commit (as seen in
> > qemuarm build directory) and list of patches currently applied on top of
> it.
> > But to make it accurate for all MACHINEs I would either need to update
> the
> > branches only once in 2-3 days when the builds are all finished or to
> repeat
> > this section 3 times (which is sometimes quite long even when listed just
> > for qemuarm).
> >
> > What I'll do is to include similar git log at the beginning of each
> build,
> > so if in doubt opening the individual logs will not only show the
> > configuration as seen by bitbake, but also the master branch and applied
> > patches.
> >
>
> I think that will be useful.
>
> >
> > On Sat, Sep 16, 2017 at 4:32 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Sat, Sep 16, 2017 at 2:00 AM, Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >> > Probably is, qemux86 was built from slightly older metadata, so
> probably
> >> > including previous versions of your klibc changes.
> >> >
> >> > I know it's confusing in the report, but still each build takes around
> >> > 24
> >> > hours per machine and I have only 2 builders. e.g. this qemux86 build
> >> > was
> >> > started 20170912_234104 as the log directory shows and at that time
> >> > there
> >> > wasn't even the latest version of klibc patches on ML.
> >> >
> >>
> >> thats ok. May be top of build configuration would be a good thing to
> >> have in report. so we know which commit the results belong to.
> >>
> >> > Thanks
> >> >
> >> > On Sat, Sep 16, 2017 at 1:02 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> >>
> >> >> On Fri, Sep 15, 2017 at 3:08 PM, Martin Jansa <
> martin.jansa@gmail.com>
> >> >> wrote:
> >> >> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >> >> >
> >> >> > == Number of issues - stats ==
> >> >> > {| class='wikitable'
> >> >> > !|Date      !!colspan='3'|Failed tasks     !!|Signatures
> >> >> > !!colspan='14'|QA
> >> >> > !!Comment
> >> >> > |-
> >> >> > || ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped
> ||libdir
> >> >> > ||textrel ||build-deps ||file-rdeps ||version-going-backwards
> >> >> > ||host-user-contaminated ||installed-vs-shipped
> >> >> > ||unknown-configure-option
> >> >> > ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
> >> >> > ||compile-host-path ||
> >> >> > |-
> >> >> > ||2017-09-14 ||3 ||6 ||2 ||0 ||0 ||0 ||5 ||0 ||0 ||91 ||3 ||0 ||0
> ||0
> >> >> > ||0
> >> >> > ||0 ||0 ||0 ||
> >> >> > |}
> >> >> >
> >> >> > == Failed tasks 2017-09-14 ==
> >> >> >
> >> >> > INFO: jenkins-job.sh-1.8.29 Complete log available at
> >> >> >
> >> >> >
> >> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> report.20170915_120505.log
> >> >> >
> >> >> > === common (1) ===
> >> >> >     *
> >> >> > meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:d
> o_compile
> >> >> >
> >> >> > === common-x86 (0) ===
> >> >> >
> >> >> > === qemuarm (2) ===
> >> >> >     *
> >> >> >
> >> >> >
> >> >> > meta-openembedded/meta-multimedia/recipes-
> connectivity/libupnp/libupnp1.6_1.6.21.bb:do_fetch
> >> >> >     *
> >> >> >
> >> >> >
> >> >> > meta-openembedded/meta-oe/recipes-devtools/android-
> tools/android-tools_5.1.1.r37.bb:do_compile
> >> >> >
> >> >> > === qemux86 (5) ===
> >> >> >     *
> >> >> >
> >> >> >
> >> >> > meta-openembedded/meta-initramfs/recipes-devtools/
> mtd/ubi-utils-klibc_1.5.1.bb:do_compile
> >> >> >     *
> >> >> >
> >> >> >
> >> >> > meta-openembedded/meta-initramfs/recipes-kernel/
> kexec/kexec-tools-klibc_2.0.2.bb:do_configure
> >> >> >     *
> >> >> >
> >> >> >
> >> >> > meta-openembedded/meta-multimedia/recipes-multimedia/
> gerbera/gerbera_git.bb:do_configure
> >> >> >     * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
> >> >> >     *
> >> >> >
> >> >> >
> >> >> > virtual:klibc:meta-openembedded/meta-initramfs/
> recipes-bsp/kexecboot/kexecboot_git.bb:do_configure
> >> >> >
> >> >>
> >> >> all meta-initramfs should have been fixed with latest patchset it
> that
> >> >> not
> >> >> the case ?
> >> >>
> >> >> > === qemux86_64 (1) ===
> >> >> >     *
> >> >> >
> >> >> >
> >> >> > virtual:native:meta-openembedded/meta-oe/recipes-
> support/uim/uim_1.8.6.bb:do_install
> >> >> >
> >> >> > === Number of failed tasks (11) ===
> >> >> > {| class=wikitable
> >> >> > |-
> >> >> > || qemuarm || 3 ||
> >> >> >
> >> >> >
> >> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemuarm.20170914_113136.log/
> >> >> > || http://errors.yoctoproject.org/Errors/Build/46775/
> >> >> > |-
> >> >> > || qemux86 || 6 ||
> >> >> >
> >> >> >
> >> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86.20170912_234104.log/
> >> >> > || http://errors.yoctoproject.org/Errors/Build/46714/
> >> >> > |-
> >> >> > || qemux86_64 || 2 ||
> >> >> >
> >> >> >
> >> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86-64.20170914_015733.log/
> >> >> > || http://errors.yoctoproject.org/Errors/Build/46761/
> >> >> > |}
> >> >> >
> >> >> > === PNBLACKLISTs (1) ===
> >> >> >
> >> >> > === QA issues (99) ===
> >> >> > {| class=wikitable
> >> >> > !| Count ||Issue
> >> >> > |-
> >> >> > ||0 ||already-stripped
> >> >> > |-
> >> >> > ||0 ||build-deps
> >> >> > |-
> >> >> > ||0 ||compile-host-path
> >> >> > |-
> >> >> > ||0 ||file-rdeps
> >> >> > |-
> >> >> > ||0 ||installed-vs-shipped
> >> >> > |-
> >> >> > ||0 ||invalid-pkgconfig
> >> >> > |-
> >> >> > ||0 ||ldflags
> >> >> > |-
> >> >> > ||0 ||libdir
> >> >> > |-
> >> >> > ||0 ||pkgname
> >> >> > |-
> >> >> > ||0 ||symlink-to-sysroot
> >> >> > |-
> >> >> > ||0 ||unknown-configure-option
> >> >> > |-
> >> >> > ||3 ||host-user-contaminated
> >> >> > |-
> >> >> > ||5 ||textrel
> >> >> > |-
> >> >> > ||91 ||version-going-backwards
> >> >> > |}
> >> >> >
> >> >> >
> >> >> >
> >> >> > === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> >> >> >
> >> >> > Complete log:
> >> >> >
> >> >> >
> >> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> signatures.20170913_214906.log/
> >> >> >
> >> >> > No issues detected
> >> >> >
> >> >> >
> >> >> > PNBLACKLISTs:
> >> >> > openembedded-core/:
> >> >> > meta-browser:
> >> >> > meta-openembedded:
> >> >> >
> >> >> >
> >> >> > meta-networking/recipes-support/lksctp-tools/lksctp-
> tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
> >> >> > ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
> >> >> > fails
> >> >> > to
> >> >> > link against sctp_connectx symbol", '', d)}"
> >> >> > meta-qt5:
> >> >> > PNBLACKLIST[android-system] = "depends on lxc from
> >> >> > meta-virtualiazation
> >> >> > which isn't included in my world builds"
> >> >> > PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to
> be
> >> >> > tested
> >> >> > so much"
> >> >> > PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
> >> >> > tested
> >> >> > so much"
> >> >> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> >> >> > tested
> >> >> > so much"
> >> >> > PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
> >> >> > tested
> >> >> > so much"
> >> >> > PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to
> be
> >> >> > tested
> >> >> > so much"
> >> >> > PNBLACKLIST[build-appliance-image] = "tries to include whole
> >> >> > downloads
> >> >> > directory in /home/builder/poky :/"
> >> >> >
> >> >> >
> >> >> > QA issues by type:
> >> >> > count: 0 issue: already-stripped
> >> >> >
> >> >> >
> >> >> > count: 0 issue: libdir
> >> >> >
> >> >> >
> >> >> > count: 5 issue: textrel
> >> >> > chromium-54.0.2810.2: ELF binary
> >> >> >
> >> >> >
> >> >> > '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/
> packages-split/chromium/usr/bin/chromium/chrome'
> >> >> > has relocations in .text [textrel]
> >> >> > chromium-wayland-53.0.2785.143: ELF binary
> >> >> >
> >> >> >
> >> >> > '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.
> 143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
> >> >> > has relocations in .text [textrel]
> >> >> > corosync-2.4.2: ELF binary
> >> >> >
> >> >> >
> >> >> > '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-
> split/corosync/usr/sbin/corosync'
> >> >> > has relocations in .text [textrel]
> >> >> > x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> >> >> >
> >> >> >
> >> >> > '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-
> r0/packages-split/x264-bin/usr/bin/x264'
> >> >> > has relocations in .text [textrel]
> >> >> > x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> >> >> >
> >> >> >
> >> >> > '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-
> r0/packages-split/x264/usr/lib/libx264.so.148'
> >> >> > has relocations in .text [textrel]
> >> >> >
> >> >> >
> >> >> > count: 0 issue: build-deps
> >> >> >
> >> >> >
> >> >> > count: 0 issue: file-rdeps
> >> >> >
> >> >> >
> >> >> > count: 91 issue: version-going-backwards
> >> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring-dbg
> >> >> > went
> >> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring-dev
> >> >> > went
> >> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring-doc
> >> >> > went
> >> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ar
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ast
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-as
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-az
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-be+latin went backwards which would break
> >> >> > package
> >> >> > feeds
> >> >> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-be
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-bg
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-bn-in
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-bn
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-bs
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ca+valencia went backwards which would break
> >> >> > package
> >> >> > feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0)
> >> >> > [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ca
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-cs
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-cy
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-da
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-de
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-dz
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-el
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-en-ca
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-en-gb
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-en+shaw went backwards which would break
> package
> >> >> > feeds
> >> >> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-es
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-et
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-eu
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-fa
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-fi
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-fr
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ga
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-gl
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-gu
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-he
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-hi
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-hr
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-hu
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-id
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-is
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-it
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ja
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ka
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-kn
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ko
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-lt
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-lv
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-mai
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-mg
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-mk
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ml
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-mn
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-mr
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ms
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-nb
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ne
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-nl
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-nn
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-oc
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-or
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-pa
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-pl
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-pt-br
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-pt
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ro
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ru
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-rw
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-si
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-sk
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-sl
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-sq
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-sr+latin went backwards which would break
> >> >> > package
> >> >> > feeds
> >> >> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-sr
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-sv
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-ta
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-te
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-th
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-tr
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-uk
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-vi
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-xh
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-zh-cn
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-zh-hk
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-locale-zh-tw
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package
> >> >> > gnome-keyring-staticdev
> >> >> > went backwards which would break package feeds from
> (0:2.32.1-r12.40
> >> >> > to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > gnome-keyring-2.32.1: Package version for package gnome-keyring
> went
> >> >> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> >> >> > 0:2.32.1-r12.0) [version-going-backwards]
> >> >> > libupnp-1.6.21: Package version for package libupnp-dbg went
> >> >> > backwards
> >> >> > which
> >> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> >> >> > [version-going-backwards]
> >> >> > libupnp-1.6.21: Package version for package libupnp-dev went
> >> >> > backwards
> >> >> > which
> >> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> >> >> > [version-going-backwards]
> >> >> > libupnp-1.6.21: Package version for package libupnp-doc went
> >> >> > backwards
> >> >> > which
> >> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> >> >> > [version-going-backwards]
> >> >> > libupnp-1.6.21: Package version for package libupnp-locale went
> >> >> > backwards
> >> >> > which would break package feeds from (0:1.8.2-r0.0 to
> 0:1.6.21-r0.2)
> >> >> > [version-going-backwards]
> >> >> > libupnp-1.6.21: Package version for package libupnp-staticdev went
> >> >> > backwards
> >> >> > which would break package feeds from (0:1.8.2-r0.0 to
> 0:1.6.21-r0.2)
> >> >> > [version-going-backwards]
> >> >> > libupnp-1.6.21: Package version for package libupnp went backwards
> >> >> > which
> >> >> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> >> >> > [version-going-backwards]
> >> >> >
> >> >> >
> >> >> > count: 3 issue: host-user-contaminated
> >> >> > glibc-locale-2.26: glibc-locale:
> >> >> > /glibc-binary-localedata-ru-ru/usr/lib/locale/ru_RU/LC_CTYPE is
> owned
> >> >> > by
> >> >> > uid
> >> >> > 3004, which is the same as the user running bitbake. This may be
> due
> >> >> > to
> >> >> > host
> >> >> > contamination [host-user-contaminated]
> >> >> > qt5-creator-3.5.1: qt5-creator:
> >> >> > /qt5-creator/usr/lib/qt5/qtcreator/plugins/libPythonEditor.so is
> >> >> > owned
> >> >> > by
> >> >> > uid 3004, which is the same as the user running bitbake. This may
> be
> >> >> > due
> >> >> > to
> >> >> > host contamination [host-user-contaminated]
> >> >> > qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: qtdeclarative:
> >> >> > /qtdeclarative-qmlplugins/usr/lib/qt5/qml/QtQuick.2/qmldir is
> owned
> >> >> > by
> >> >> > uid
> >> >> > 3004, which is the same as the user running bitbake. This may be
> due
> >> >> > to
> >> >> > host
> >> >> > contamination [host-user-contaminated]
> >> >> >
> >> >> >
> >> >> > count: 0 issue: installed-vs-shipped
> >> >> >
> >> >> >
> >> >> > count: 0 issue: unknown-configure-option
> >> >> >
> >> >> >
> >> >> > count: 0 issue: symlink-to-sysroot
> >> >> >
> >> >> >
> >> >> > count: 0 issue: invalid-pkgconfig
> >> >> >
> >> >> >
> >> >> > count: 0 issue: pkgname
> >> >> >
> >> >> >
> >> >> > count: 0 issue: ldflags
> >> >> >
> >> >> >
> >> >> > count: 0 issue: compile-host-path
> >> >> >
> >> >> >
> >> >> >
> >> >> > == Tested changes (not included in master yet) - bitbake ==
> >> >> > latest upstream commit:
> >> >> > 567f2cf server/process: ensure server failure log is limited to
> >> >> > current
> >> >> > session
> >> >> > not included in master yet:
> >> >> > 3ec2af2 world-image: add extra target
> >> >> > 8eebabe fetch2: Allow Fetch.download() to warn instead of error
> >> >> >
> >> >> > == Tested changes (not included in master yet) - openembedded-core
> ==
> >> >> > latest upstream commit:
> >> >> > 8fe9fb4 python*native.bbclass: suppress user site dirs
> >> >> > not included in master yet:
> >> >> > 0d7ac07 report-error: Allow to upload reports automatically
> >> >> > 20d6101 buildhistory.bbclass: metadata-revs show repo parent
> >> >> > 202fb4c metadata-revs: provide more information
> >> >> > b3500a7 qemux86: Add identical qemux86copy variant for tests
> >> >> > 0de46b0 reproducible_build.bbclass: initial support for binary
> >> >> > reproducibility
> >> >> > d407a03 cpio: provide cpio-replacement-native
> >> >> > c872fa6 image_types.bbclass: improve cpio image reproducibility
> >> >> > 3fcc641 rootfs-postcommands.bbclass: support binary reproducibility
> >> >> > a132f03 sstate.bbclass: Do not cause build failures due to setscene
> >> >> > errors
> >> >> > 198ea0e insane.bbclass: Add do_qa_pseudo function to check for
> common
> >> >> > errors
> >> >> > listed in pseudo.log
> >> >> > 3283a1c insane.bbclass: do_qa_pseudo: don't trigger error from
> >> >> > '^inode
> >> >> > mismatch'
> >> >> > beb394d insane.bbclass: do_qa_pseudo: show parts of pseudo.log in
> >> >> > console
> >> >> >
> >> >> > == Tested changes (not included in master yet) - meta-openembedded
> ==
> >> >> > latest upstream commit:
> >> >> > 4a45235 opencv: Fix build with clang
> >> >> > not included in master yet:
> >> >> > df98f41 dnsmasq: disable the service by default
> >> >> > fb19f49 openconnect: fix parallel compilation failure
> >> >> > 9dafbb4 autofs: Fix build with musl
> >> >> > 6e742d3 yp-tools: Upgrade to 4.2.2
> >> >> > ef15059 vim: Remove xfce vim bbappend
> >> >> > 6fff604 leveldb: Fix build with clang
> >> >> > 2864d93 klibc: Edit out gcc hardcoding in do_compile
> >> >> > d20ab2d klibc.bbclass: Use forcevariable override to define flags
> >> >> > dceaa50 klibc.bbclass: Add -mfloat-abi on arm
> >> >> > 2e68338 smbnetfs: delete blacklisted
> >> >> > 3f06336 system-setup-keyboard: delete blacklisted
> >> >> > 14a15c0 python-jsonschema, python3-jsonschema: add
> vcversioner-native
> >> >> > dependency
> >> >> > a9d38f7 v4l-utils: added missing dependency on udev
> >> >> > 2b489fd ipvsadm: Add HOMEPAGE info into recipe file.
> >> >> > cf39ab8 libidl: Add HOMEPAGE info into recipe file.
> >> >> > 4fcda20 lvm2: Add HOMEPAGE info into recipe file.
> >> >> > 9e601b0 tcpdump: update to 4.9.2 to fix CVEs
> >> >> > 3dbb500 debsums: inherit gettext
> >> >> > b972817 protobuf: update to 3.4.0
> >> >> > 3e1748f protobuf-c: update to 1.3.0
> >> >> > a8cf4de libgpiod: bump version to v0.3.1
> >> >> > e9a3fd9 networkmanager: Add HOMEPAGE info into recipe file.
> >> >> > 6a0d564 samba: Add HOMEPAGE info into recipe file.
> >> >> > db01ddf squid: upgrade to 3.5.27
> >> >> > 8b48a16 iproute2: Move tipc enablement to oe-core
> >> >> > 1911f84 libmnl: Move to oe-core
> >> >> > f02eec7 flatbuffers: add version 1.7.1
> >> >> > 9d4b685 capnproto: add version 0.6.1
> >> >> > a18db12 libupnp: Add recipe for version 1.8.2
> >> >> > 90be7f5 gerbera: clean recipe
> >> >> > 62655bc libjs-sizzle: Add HOMEPAGE info into recipe file.
> >> >> > 6c0f9c2 liblockfile: Add HOMEPAGE info into recipe file.
> >> >> > 87d004b daemontools: Add HOMEPAGE info into recipe file.
> >> >> > 346b2a5 fbset: Add HOMEPAGE info into recipe file.
> >> >> > 2fdb314 libndp: Add HOMEPAGE info into recipe file.
> >> >> > a96fc97 gnome-keyring: Resolve conflict with gcr 3 and gold linking
> >> >> > error
> >> >> > 34bb6e5 drbd-utils: remove
> >> >> > 0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
> >> >> > 864fb16 ceres-solver: add new recipe
> >> >> > 60b9eb6 libnih: Add HOMEPAGE info into recipe file.
> >> >> > 20eeac7 libtdb: Add HOMEPAGE info into recipe file.
> >> >> > 84172c0 mailcap: Add HOMEPAGE info into recipe file.
> >> >> > 7454d72 mozjs: Add HOMEPAGE info into recipe file.
> >> >> > 47bbfc9 numactl: Add HOMEPAGE info into recipe file.
> >> >> > ad97869 orbit2: Add HOMEPAGE info into recipe file.
> >> >> > f3469c8 sgpio: Add HOMEPAGE info into recipe file.
> >> >> > 50a3814 stunnel: Add HOMEPAGE info into recipe file.
> >> >> > d260749 leveldb: disable parallelism
> >> >> >
> >> >> > == Tested changes (not included in master yet) - meta-qt5 ==
> >> >> > latest upstream commit:
> >> >> > 743b3b9 qtbase-native: Force use of built-in pcre
> >> >> > not included in master yet:
> >> >> >
> >> >> > == Tested changes (not included in master yet) - meta-browser ==
> >> >> > latest upstream commit:
> >> >> > 972cab7 gnome-settings-daemon: remove the bbappend for removed
> recipe
> >> >> > not included in master yet:
> >> >> > 5fcf848 chromium: hide textrel QA issues which are there for ages
> >> >> >
> >> >> > --
> >> >> > _______________________________________________
> >> >> > Openembedded-core mailing list
> >> >> > Openembedded-core@lists.openembedded.org
> >> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >> >
> >> >
> >> >
> >
> >
>

--f403045f1eaa797bec055990d8e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Done<div><a href=3D"https://github.com/shr-project/jenkins=
-jobs/commit/dbb5e4e4e2c5821381eda729ab746a21238c8801">https://github.com/s=
hr-project/jenkins-jobs/commit/dbb5e4e4e2c5821381eda729ab746a21238c8801</a>=
<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Sat, Sep 16, 2017 at 5:01 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Sat, Sep 16=
, 2017 at 7:41 AM, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.co=
m">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; Just the commit IDs from the top won&#39;t be very useful, because it&=
#39;s from<br>
&gt; jansa/master branches which are rebased even more often than master-ne=
xt.<br>
&gt;<br>
&gt; If you really want to see them, then there are links to the build logs=
 for<br>
&gt; each MACHINE and you can see the build configuration there.<br>
&gt;<br>
&gt; That&#39;s why at the bottom is the list of last master commit (as see=
n in<br>
&gt; qemuarm build directory) and list of patches currently applied on top =
of it.<br>
&gt; But to make it accurate for all MACHINEs I would either need to update=
 the<br>
&gt; branches only once in 2-3 days when the builds are all finished or to =
repeat<br>
&gt; this section 3 times (which is sometimes quite long even when listed j=
ust<br>
&gt; for qemuarm).<br>
&gt;<br>
&gt; What I&#39;ll do is to include similar git log at the beginning of eac=
h build,<br>
&gt; so if in doubt opening the individual logs will not only show the<br>
&gt; configuration as seen by bitbake, but also the master branch and appli=
ed<br>
&gt; patches.<br>
&gt;<br>
<br>
</span>I think that will be useful.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; On Sat, Sep 16, 2017 at 4:32 PM, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Sep 16, 2017 at 2:00 AM, Martin Jansa &lt;<a href=3D"mailt=
o:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; Probably is, qemux86 was built from slightly older metadata, =
so probably<br>
&gt;&gt; &gt; including previous versions of your klibc changes.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I know it&#39;s confusing in the report, but still each build=
 takes around<br>
&gt;&gt; &gt; 24<br>
&gt;&gt; &gt; hours per machine and I have only 2 builders. e.g. this qemux=
86 build<br>
&gt;&gt; &gt; was<br>
&gt;&gt; &gt; started 20170912_234104 as the log directory shows and at tha=
t time<br>
&gt;&gt; &gt; there<br>
&gt;&gt; &gt; wasn&#39;t even the latest version of klibc patches on ML.<br=
>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; thats ok. May be top of build configuration would be a good thing =
to<br>
&gt;&gt; have in report. so we know which commit the results belong to.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Thanks<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Sat, Sep 16, 2017 at 1:02 AM, Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Fri, Sep 15, 2017 at 3:08 PM, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://www.openembedded.org/wiki/Bitbake_=
World_Status" rel=3D"noreferrer" target=3D"_blank">http://www.openembedded.=
org/<wbr>wiki/Bitbake_World_Status</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D Number of issues - stats =3D=3D<br>
&gt;&gt; &gt;&gt; &gt; {| class=3D&#39;wikitable&#39;<br>
&gt;&gt; &gt;&gt; &gt; !|Date=C2=A0 =C2=A0 =C2=A0 !!colspan=3D&#39;3&#39;|F=
ailed tasks=C2=A0 =C2=A0 =C2=A0!!|Signatures<br>
&gt;&gt; &gt;&gt; &gt; !!colspan=3D&#39;14&#39;|QA<br>
&gt;&gt; &gt;&gt; &gt; !!Comment<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; || ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-=
stripped ||libdir<br>
&gt;&gt; &gt;&gt; &gt; ||textrel ||build-deps ||file-rdeps ||version-going-=
backwards<br>
&gt;&gt; &gt;&gt; &gt; ||host-user-contaminated ||installed-vs-shipped<br>
&gt;&gt; &gt;&gt; &gt; ||unknown-configure-option<br>
&gt;&gt; &gt;&gt; &gt; ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname |=
|ldflags<br>
&gt;&gt; &gt;&gt; &gt; ||compile-host-path ||<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||2017-09-14 ||3 ||6 ||2 ||0 ||0 ||0 ||5 ||0 ||0 ||9=
1 ||3 ||0 ||0 ||0<br>
&gt;&gt; &gt;&gt; &gt; ||0<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||0 ||0 ||<br>
&gt;&gt; &gt;&gt; &gt; |}<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D Failed tasks 2017-09-14 =3D=3D<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; INFO: jenkins-job.sh-1.8.29 Complete log available a=
t<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/=
world/rocko/log.report.20170915_120505.log" rel=3D"noreferrer" target=3D"_b=
lank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>re=
port.20170915_120505.log</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D=3D common (1) =3D=3D=3D<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; &gt; meta-browser/recipes-mozilla/<wbr>firefox/firefox_45=
.9.0esr.bb:d<wbr>o_compile<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D=3D common-x86 (0) =3D=3D=3D<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D=3D qemuarm (2) =3D=3D=3D<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; meta-openembedded/meta-<wbr>multimedia/recipes-<wbr>=
connectivity/libupnp/libupnp1.<wbr>6_1.6.21.bb:do_fetch<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; meta-openembedded/meta-oe/<wbr>recipes-devtools/andr=
oid-<wbr>tools/android-tools_5.1.1.r37.<wbr>bb:do_compile<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D=3D qemux86 (5) =3D=3D=3D<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; meta-openembedded/meta-<wbr>initramfs/recipes-devtoo=
ls/<wbr>mtd/ubi-utils-klibc_1.5.1.bb:d<wbr>o_compile<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; meta-openembedded/meta-<wbr>initramfs/recipes-kernel=
/<wbr>kexec/kexec-tools-klibc_2.0.2.<wbr>bb:do_configure<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; meta-openembedded/meta-<wbr>multimedia/recipes-multi=
media/<wbr>gerbera/gerbera_git.bb:do_<wbr>configure<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0* meta-qt5/recipes-qt/qt5/<wbr>qt=
location_git.bb:do_compile<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; virtual:klibc:meta-<wbr>openembedded/meta-initramfs/=
<wbr>recipes-bsp/kexecboot/<wbr>kexecboot_git.bb:do_configure<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; all meta-initramfs should have been fixed with latest pat=
chset it that<br>
&gt;&gt; &gt;&gt; not<br>
&gt;&gt; &gt;&gt; the case ?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D=3D qemux86_64 (1) =3D=3D=3D<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; virtual:native:meta-<wbr>openembedded/meta-oe/recipe=
s-<wbr>support/uim/uim_1.8.6.bb:do_<wbr>install<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D=3D Number of failed tasks (11) =3D=3D=3D<br>
&gt;&gt; &gt;&gt; &gt; {| class=3Dwikitable<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; || qemuarm || 3 ||<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/=
world/rocko/log.world.qemuarm.20170914_113136.log/" rel=3D"noreferrer" targ=
et=3D"_blank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log=
.<wbr>world.qemuarm.20170914_113136.<wbr>log/</a><br>
&gt;&gt; &gt;&gt; &gt; || <a href=3D"http://errors.yoctoproject.org/Errors/=
Build/46775/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproje=
ct.<wbr>org/Errors/Build/46775/</a><br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; || qemux86 || 6 ||<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/=
world/rocko/log.world.qemux86.20170912_234104.log/" rel=3D"noreferrer" targ=
et=3D"_blank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log=
.<wbr>world.qemux86.20170912_234104.<wbr>log/</a><br>
&gt;&gt; &gt;&gt; &gt; || <a href=3D"http://errors.yoctoproject.org/Errors/=
Build/46714/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproje=
ct.<wbr>org/Errors/Build/46714/</a><br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; || qemux86_64 || 2 ||<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/=
world/rocko/log.world.qemux86-64.20170914_015733.log/" rel=3D"noreferrer" t=
arget=3D"_blank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/=
log.<wbr>world.qemux86-64.20170914_<wbr>015733.log/</a><br>
&gt;&gt; &gt;&gt; &gt; || <a href=3D"http://errors.yoctoproject.org/Errors/=
Build/46761/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproje=
ct.<wbr>org/Errors/Build/46761/</a><br>
&gt;&gt; &gt;&gt; &gt; |}<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D=3D QA issues (99) =3D=3D=3D<br>
&gt;&gt; &gt;&gt; &gt; {| class=3Dwikitable<br>
&gt;&gt; &gt;&gt; &gt; !| Count ||Issue<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||already-stripped<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||build-deps<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||compile-host-path<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||file-rdeps<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||installed-vs-shipped<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||invalid-pkgconfig<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||ldflags<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||libdir<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||pkgname<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||symlink-to-sysroot<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||0 ||unknown-configure-option<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||3 ||host-user-contaminated<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||5 ||textrel<br>
&gt;&gt; &gt;&gt; &gt; |-<br>
&gt;&gt; &gt;&gt; &gt; ||91 ||version-going-backwards<br>
&gt;&gt; &gt;&gt; &gt; |}<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signature=
s (0) =3D=3D=3D<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Complete log:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/=
world/rocko/log.signatures.20170913_214906.log/" rel=3D"noreferrer" target=
=3D"_blank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<=
wbr>signatures.20170913_214906.<wbr>log/</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; No issues detected<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; PNBLACKLISTs:<br>
&gt;&gt; &gt;&gt; &gt; openembedded-core/:<br>
&gt;&gt; &gt;&gt; &gt; meta-browser:<br>
&gt;&gt; &gt;&gt; &gt; meta-openembedded:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; meta-networking/recipes-<wbr>support/lksctp-tools/lk=
sctp-<wbr>tools_1.0.17.bb:PNBLACKLIST[<wbr>lksctp-tools]<br>
&gt;&gt; &gt;&gt; &gt; ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEA=
TURES&#39;, &#39;ld-is-gold&#39;, &quot;BROKEN:<br>
&gt;&gt; &gt;&gt; &gt; fails<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; link against sctp_connectx symbol&quot;, &#39;&#39;,=
 d)}&quot;<br>
&gt;&gt; &gt;&gt; &gt; meta-qt5:<br>
&gt;&gt; &gt;&gt; &gt; PNBLACKLIST[android-system] =3D &quot;depends on lxc=
 from<br>
&gt;&gt; &gt;&gt; &gt; meta-virtualiazation<br>
&gt;&gt; &gt;&gt; &gt; which isn&#39;t included in my world builds&quot;<br=
>
&gt;&gt; &gt;&gt; &gt; PNBLACKLIST[bigbuckbunny-<wbr>1080p] =3D &quot;big a=
nd doesn&#39;t really need to be<br>
&gt;&gt; &gt;&gt; &gt; tested<br>
&gt;&gt; &gt;&gt; &gt; so much&quot;<br>
&gt;&gt; &gt;&gt; &gt; PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doe=
sn&#39;t really need to be<br>
&gt;&gt; &gt;&gt; &gt; tested<br>
&gt;&gt; &gt;&gt; &gt; so much&quot;<br>
&gt;&gt; &gt;&gt; &gt; PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doe=
sn&#39;t really need to be<br>
&gt;&gt; &gt;&gt; &gt; tested<br>
&gt;&gt; &gt;&gt; &gt; so much&quot;<br>
&gt;&gt; &gt;&gt; &gt; PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doe=
sn&#39;t really need to be<br>
&gt;&gt; &gt;&gt; &gt; tested<br>
&gt;&gt; &gt;&gt; &gt; so much&quot;<br>
&gt;&gt; &gt;&gt; &gt; PNBLACKLIST[tearsofsteel-<wbr>1080p] =3D &quot;big a=
nd doesn&#39;t really need to be<br>
&gt;&gt; &gt;&gt; &gt; tested<br>
&gt;&gt; &gt;&gt; &gt; so much&quot;<br>
&gt;&gt; &gt;&gt; &gt; PNBLACKLIST[build-appliance-<wbr>image] =3D &quot;tr=
ies to include whole<br>
&gt;&gt; &gt;&gt; &gt; downloads<br>
&gt;&gt; &gt;&gt; &gt; directory in /home/builder/poky :/&quot;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; QA issues by type:<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: already-stripped<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: libdir<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 5 issue: textrel<br>
&gt;&gt; &gt;&gt; &gt; chromium-54.0.2810.2: ELF binary<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &#39;/tmp/work/i586-oe-linux/<wbr>chromium/54.0.2810=
.2-r0/<wbr>packages-split/chromium/usr/<wbr>bin/chromium/chrome&#39;<br>
&gt;&gt; &gt;&gt; &gt; has relocations in .text [textrel]<br>
&gt;&gt; &gt;&gt; &gt; chromium-wayland-53.0.2785.<wbr>143: ELF binary<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &#39;/tmp/work/i586-oe-linux/<wbr>chromium-wayland/5=
3.0.2785.<wbr>143-r0/packages-split/<wbr>chromium-wayland/usr/bin/<wbr>chro=
mium/chrome&#39;<br>
&gt;&gt; &gt;&gt; &gt; has relocations in .text [textrel]<br>
&gt;&gt; &gt;&gt; &gt; corosync-2.4.2: ELF binary<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &#39;/tmp/work/core2-64-oe-linux/<wbr>corosync/2.4.2=
-r0/packages-<wbr>split/corosync/usr/sbin/<wbr>corosync&#39;<br>
&gt;&gt; &gt;&gt; &gt; has relocations in .text [textrel]<br>
&gt;&gt; &gt;&gt; &gt; x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary<br=
>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &#39;/tmp/work/i586-oe-linux/x264/<wbr>r2731+gitAUTO=
INC+2b741f81e5-<wbr>r0/packages-split/x264-bin/<wbr>usr/bin/x264&#39;<br>
&gt;&gt; &gt;&gt; &gt; has relocations in .text [textrel]<br>
&gt;&gt; &gt;&gt; &gt; x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary<br=
>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &#39;/tmp/work/i586-oe-linux/x264/<wbr>r2731+gitAUTO=
INC+2b741f81e5-<wbr>r0/packages-split/x264/usr/<wbr>lib/libx264.so.148&#39;=
<br>
&gt;&gt; &gt;&gt; &gt; has relocations in .text [textrel]<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: build-deps<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: file-rdeps<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 91 issue: version-going-backwards<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package gn=
ome-keyring-dbg<br>
&gt;&gt; &gt;&gt; &gt; went<br>
&gt;&gt; &gt;&gt; &gt; backwards which would break package feeds from (0:2.=
32.1-r12.40 to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package gn=
ome-keyring-dev<br>
&gt;&gt; &gt;&gt; &gt; went<br>
&gt;&gt; &gt;&gt; &gt; backwards which would break package feeds from (0:2.=
32.1-r12.40 to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package gn=
ome-keyring-doc<br>
&gt;&gt; &gt;&gt; &gt; went<br>
&gt;&gt; &gt;&gt; &gt; backwards which would break package feeds from (0:2.=
32.1-r12.40 to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ar<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ast<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-as<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-az<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-be+latin went backwards which w=
ould break<br>
&gt;&gt; &gt;&gt; &gt; package<br>
&gt;&gt; &gt;&gt; &gt; feeds<br>
&gt;&gt; &gt;&gt; &gt; from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-go=
ing-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-be<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-bg<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-bn-in<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-bn<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-bs<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ca+<wbr>valencia went backwards=
 which would break<br>
&gt;&gt; &gt;&gt; &gt; package<br>
&gt;&gt; &gt;&gt; &gt; feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0)<br>
&gt;&gt; &gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ca<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-cs<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-cy<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-da<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-de<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-dz<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-el<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-en-ca<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-en-gb<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-en+shaw went backwards which wo=
uld break package<br>
&gt;&gt; &gt;&gt; &gt; feeds<br>
&gt;&gt; &gt;&gt; &gt; from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-go=
ing-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-es<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-et<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-eu<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-fa<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-fi<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-fr<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ga<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-gl<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-gu<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-he<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-hi<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-hr<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-hu<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-id<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-is<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-it<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ja<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ka<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-kn<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ko<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-lt<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-lv<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-mai<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-mg<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-mk<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ml<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-mn<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-mr<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ms<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-nb<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ne<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-nl<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-nn<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-oc<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-or<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-pa<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-pl<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-pt-br<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-pt<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ro<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ru<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-rw<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-si<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-sk<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-sl<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-sq<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-sr+latin went backwards which w=
ould break<br>
&gt;&gt; &gt;&gt; &gt; package<br>
&gt;&gt; &gt;&gt; &gt; feeds<br>
&gt;&gt; &gt;&gt; &gt; from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-go=
ing-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-sr<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-sv<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-ta<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-te<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-th<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-tr<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-uk<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-vi<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-xh<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-zh-cn<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-zh-hk<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-locale-zh-tw<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package<br=
>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-staticdev<br>
&gt;&gt; &gt;&gt; &gt; went backwards which would break package feeds from =
(0:2.32.1-r12.40<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; gnome-keyring-2.32.1: Package version for package gn=
ome-keyring went<br>
&gt;&gt; &gt;&gt; &gt; backwards which would break package feeds from (0:2.=
32.1-r12.40 to<br>
&gt;&gt; &gt;&gt; &gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp-=
dbg went<br>
&gt;&gt; &gt;&gt; &gt; backwards<br>
&gt;&gt; &gt;&gt; &gt; which<br>
&gt;&gt; &gt;&gt; &gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.=
6.21-r0.2)<br>
&gt;&gt; &gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp-=
dev went<br>
&gt;&gt; &gt;&gt; &gt; backwards<br>
&gt;&gt; &gt;&gt; &gt; which<br>
&gt;&gt; &gt;&gt; &gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.=
6.21-r0.2)<br>
&gt;&gt; &gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp-=
doc went<br>
&gt;&gt; &gt;&gt; &gt; backwards<br>
&gt;&gt; &gt;&gt; &gt; which<br>
&gt;&gt; &gt;&gt; &gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.=
6.21-r0.2)<br>
&gt;&gt; &gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp-=
locale went<br>
&gt;&gt; &gt;&gt; &gt; backwards<br>
&gt;&gt; &gt;&gt; &gt; which would break package feeds from (0:1.8.2-r0.0 t=
o 0:1.6.21-r0.2)<br>
&gt;&gt; &gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp-=
staticdev went<br>
&gt;&gt; &gt;&gt; &gt; backwards<br>
&gt;&gt; &gt;&gt; &gt; which would break package feeds from (0:1.8.2-r0.0 t=
o 0:1.6.21-r0.2)<br>
&gt;&gt; &gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt; libupnp-1.6.21: Package version for package libupnp =
went backwards<br>
&gt;&gt; &gt;&gt; &gt; which<br>
&gt;&gt; &gt;&gt; &gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.=
6.21-r0.2)<br>
&gt;&gt; &gt;&gt; &gt; [version-going-backwards]<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 3 issue: host-user-contaminated<br>
&gt;&gt; &gt;&gt; &gt; glibc-locale-2.26: glibc-locale:<br>
&gt;&gt; &gt;&gt; &gt; /glibc-binary-localedata-ru-<wbr>ru/usr/lib/locale/r=
u_RU/LC_<wbr>CTYPE is owned<br>
&gt;&gt; &gt;&gt; &gt; by<br>
&gt;&gt; &gt;&gt; &gt; uid<br>
&gt;&gt; &gt;&gt; &gt; 3004, which is the same as the user running bitbake.=
 This may be due<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; host<br>
&gt;&gt; &gt;&gt; &gt; contamination [host-user-contaminated]<br>
&gt;&gt; &gt;&gt; &gt; qt5-creator-3.5.1: qt5-creator:<br>
&gt;&gt; &gt;&gt; &gt; /qt5-creator/usr/lib/qt5/<wbr>qtcreator/plugins/<wbr=
>libPythonEditor.so is<br>
&gt;&gt; &gt;&gt; &gt; owned<br>
&gt;&gt; &gt;&gt; &gt; by<br>
&gt;&gt; &gt;&gt; &gt; uid 3004, which is the same as the user running bitb=
ake. This may be<br>
&gt;&gt; &gt;&gt; &gt; due<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; host contamination [host-user-contaminated]<br>
&gt;&gt; &gt;&gt; &gt; qtdeclarative-5.9.2+<wbr>gitAUTOINC+7c45b035b9: qtde=
clarative:<br>
&gt;&gt; &gt;&gt; &gt; /qtdeclarative-qmlplugins/usr/<wbr>lib/qt5/qml/QtQui=
ck.2/qmldir is owned<br>
&gt;&gt; &gt;&gt; &gt; by<br>
&gt;&gt; &gt;&gt; &gt; uid<br>
&gt;&gt; &gt;&gt; &gt; 3004, which is the same as the user running bitbake.=
 This may be due<br>
&gt;&gt; &gt;&gt; &gt; to<br>
&gt;&gt; &gt;&gt; &gt; host<br>
&gt;&gt; &gt;&gt; &gt; contamination [host-user-contaminated]<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: installed-vs-shipped<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: unknown-configure-option<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: symlink-to-sysroot<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: invalid-pkgconfig<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: pkgname<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: ldflags<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; count: 0 issue: compile-host-path<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D Tested changes (not included in master yet) -=
 bitbake =3D=3D<br>
&gt;&gt; &gt;&gt; &gt; latest upstream commit:<br>
&gt;&gt; &gt;&gt; &gt; 567f2cf server/process: ensure server failure log is=
 limited to<br>
&gt;&gt; &gt;&gt; &gt; current<br>
&gt;&gt; &gt;&gt; &gt; session<br>
&gt;&gt; &gt;&gt; &gt; not included in master yet:<br>
&gt;&gt; &gt;&gt; &gt; 3ec2af2 world-image: add extra target<br>
&gt;&gt; &gt;&gt; &gt; 8eebabe fetch2: Allow Fetch.download() to warn inste=
ad of error<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D Tested changes (not included in master yet) -=
 openembedded-core =3D=3D<br>
&gt;&gt; &gt;&gt; &gt; latest upstream commit:<br>
&gt;&gt; &gt;&gt; &gt; 8fe9fb4 python*native.bbclass: suppress user site di=
rs<br>
&gt;&gt; &gt;&gt; &gt; not included in master yet:<br>
&gt;&gt; &gt;&gt; &gt; 0d7ac07 report-error: Allow to upload reports automa=
tically<br>
&gt;&gt; &gt;&gt; &gt; 20d6101 buildhistory.bbclass: metadata-revs show rep=
o parent<br>
&gt;&gt; &gt;&gt; &gt; 202fb4c metadata-revs: provide more information<br>
&gt;&gt; &gt;&gt; &gt; b3500a7 qemux86: Add identical qemux86copy variant f=
or tests<br>
&gt;&gt; &gt;&gt; &gt; 0de46b0 reproducible_build.bbclass: initial support =
for binary<br>
&gt;&gt; &gt;&gt; &gt; reproducibility<br>
&gt;&gt; &gt;&gt; &gt; d407a03 cpio: provide cpio-replacement-native<br>
&gt;&gt; &gt;&gt; &gt; c872fa6 image_types.bbclass: improve cpio image repr=
oducibility<br>
&gt;&gt; &gt;&gt; &gt; 3fcc641 rootfs-postcommands.bbclass: support binary =
reproducibility<br>
&gt;&gt; &gt;&gt; &gt; a132f03 sstate.bbclass: Do not cause build failures =
due to setscene<br>
&gt;&gt; &gt;&gt; &gt; errors<br>
&gt;&gt; &gt;&gt; &gt; 198ea0e insane.bbclass: Add do_qa_pseudo function to=
 check for common<br>
&gt;&gt; &gt;&gt; &gt; errors<br>
&gt;&gt; &gt;&gt; &gt; listed in pseudo.log<br>
&gt;&gt; &gt;&gt; &gt; 3283a1c insane.bbclass: do_qa_pseudo: don&#39;t trig=
ger error from<br>
&gt;&gt; &gt;&gt; &gt; &#39;^inode<br>
&gt;&gt; &gt;&gt; &gt; mismatch&#39;<br>
&gt;&gt; &gt;&gt; &gt; beb394d insane.bbclass: do_qa_pseudo: show parts of =
pseudo.log in<br>
&gt;&gt; &gt;&gt; &gt; console<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D Tested changes (not included in master yet) -=
 meta-openembedded =3D=3D<br>
&gt;&gt; &gt;&gt; &gt; latest upstream commit:<br>
&gt;&gt; &gt;&gt; &gt; 4a45235 opencv: Fix build with clang<br>
&gt;&gt; &gt;&gt; &gt; not included in master yet:<br>
&gt;&gt; &gt;&gt; &gt; df98f41 dnsmasq: disable the service by default<br>
&gt;&gt; &gt;&gt; &gt; fb19f49 openconnect: fix parallel compilation failur=
e<br>
&gt;&gt; &gt;&gt; &gt; 9dafbb4 autofs: Fix build with musl<br>
&gt;&gt; &gt;&gt; &gt; 6e742d3 yp-tools: Upgrade to 4.2.2<br>
&gt;&gt; &gt;&gt; &gt; ef15059 vim: Remove xfce vim bbappend<br>
&gt;&gt; &gt;&gt; &gt; 6fff604 leveldb: Fix build with clang<br>
&gt;&gt; &gt;&gt; &gt; 2864d93 klibc: Edit out gcc hardcoding in do_compile=
<br>
&gt;&gt; &gt;&gt; &gt; d20ab2d klibc.bbclass: Use forcevariable override to=
 define flags<br>
&gt;&gt; &gt;&gt; &gt; dceaa50 klibc.bbclass: Add -mfloat-abi on arm<br>
&gt;&gt; &gt;&gt; &gt; 2e68338 smbnetfs: delete blacklisted<br>
&gt;&gt; &gt;&gt; &gt; 3f06336 system-setup-keyboard: delete blacklisted<br=
>
&gt;&gt; &gt;&gt; &gt; 14a15c0 python-jsonschema, python3-jsonschema: add v=
cversioner-native<br>
&gt;&gt; &gt;&gt; &gt; dependency<br>
&gt;&gt; &gt;&gt; &gt; a9d38f7 v4l-utils: added missing dependency on udev<=
br>
&gt;&gt; &gt;&gt; &gt; 2b489fd ipvsadm: Add HOMEPAGE info into recipe file.=
<br>
&gt;&gt; &gt;&gt; &gt; cf39ab8 libidl: Add HOMEPAGE info into recipe file.<=
br>
&gt;&gt; &gt;&gt; &gt; 4fcda20 lvm2: Add HOMEPAGE info into recipe file.<br=
>
&gt;&gt; &gt;&gt; &gt; 9e601b0 tcpdump: update to 4.9.2 to fix CVEs<br>
&gt;&gt; &gt;&gt; &gt; 3dbb500 debsums: inherit gettext<br>
&gt;&gt; &gt;&gt; &gt; b972817 protobuf: update to 3.4.0<br>
&gt;&gt; &gt;&gt; &gt; 3e1748f protobuf-c: update to 1.3.0<br>
&gt;&gt; &gt;&gt; &gt; a8cf4de libgpiod: bump version to v0.3.1<br>
&gt;&gt; &gt;&gt; &gt; e9a3fd9 networkmanager: Add HOMEPAGE info into recip=
e file.<br>
&gt;&gt; &gt;&gt; &gt; 6a0d564 samba: Add HOMEPAGE info into recipe file.<b=
r>
&gt;&gt; &gt;&gt; &gt; db01ddf squid: upgrade to 3.5.27<br>
&gt;&gt; &gt;&gt; &gt; 8b48a16 iproute2: Move tipc enablement to oe-core<br=
>
&gt;&gt; &gt;&gt; &gt; 1911f84 libmnl: Move to oe-core<br>
&gt;&gt; &gt;&gt; &gt; f02eec7 flatbuffers: add version 1.7.1<br>
&gt;&gt; &gt;&gt; &gt; 9d4b685 capnproto: add version 0.6.1<br>
&gt;&gt; &gt;&gt; &gt; a18db12 libupnp: Add recipe for version 1.8.2<br>
&gt;&gt; &gt;&gt; &gt; 90be7f5 gerbera: clean recipe<br>
&gt;&gt; &gt;&gt; &gt; 62655bc libjs-sizzle: Add HOMEPAGE info into recipe =
file.<br>
&gt;&gt; &gt;&gt; &gt; 6c0f9c2 liblockfile: Add HOMEPAGE info into recipe f=
ile.<br>
&gt;&gt; &gt;&gt; &gt; 87d004b daemontools: Add HOMEPAGE info into recipe f=
ile.<br>
&gt;&gt; &gt;&gt; &gt; 346b2a5 fbset: Add HOMEPAGE info into recipe file.<b=
r>
&gt;&gt; &gt;&gt; &gt; 2fdb314 libndp: Add HOMEPAGE info into recipe file.<=
br>
&gt;&gt; &gt;&gt; &gt; a96fc97 gnome-keyring: Resolve conflict with gcr 3 a=
nd gold linking<br>
&gt;&gt; &gt;&gt; &gt; error<br>
&gt;&gt; &gt;&gt; &gt; 34bb6e5 drbd-utils: remove<br>
&gt;&gt; &gt;&gt; &gt; 0001-drbd-8.4.4-drbd-tools-<wbr>only-rmmod-if-DRBD-i=
s-a-<wbr>module.patch<br>
&gt;&gt; &gt;&gt; &gt; 864fb16 ceres-solver: add new recipe<br>
&gt;&gt; &gt;&gt; &gt; 60b9eb6 libnih: Add HOMEPAGE info into recipe file.<=
br>
&gt;&gt; &gt;&gt; &gt; 20eeac7 libtdb: Add HOMEPAGE info into recipe file.<=
br>
&gt;&gt; &gt;&gt; &gt; 84172c0 mailcap: Add HOMEPAGE info into recipe file.=
<br>
&gt;&gt; &gt;&gt; &gt; 7454d72 mozjs: Add HOMEPAGE info into recipe file.<b=
r>
&gt;&gt; &gt;&gt; &gt; 47bbfc9 numactl: Add HOMEPAGE info into recipe file.=
<br>
&gt;&gt; &gt;&gt; &gt; ad97869 orbit2: Add HOMEPAGE info into recipe file.<=
br>
&gt;&gt; &gt;&gt; &gt; f3469c8 sgpio: Add HOMEPAGE info into recipe file.<b=
r>
&gt;&gt; &gt;&gt; &gt; 50a3814 stunnel: Add HOMEPAGE info into recipe file.=
<br>
&gt;&gt; &gt;&gt; &gt; d260749 leveldb: disable parallelism<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D Tested changes (not included in master yet) -=
 meta-qt5 =3D=3D<br>
&gt;&gt; &gt;&gt; &gt; latest upstream commit:<br>
&gt;&gt; &gt;&gt; &gt; 743b3b9 qtbase-native: Force use of built-in pcre<br=
>
&gt;&gt; &gt;&gt; &gt; not included in master yet:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; =3D=3D Tested changes (not included in master yet) -=
 meta-browser =3D=3D<br>
&gt;&gt; &gt;&gt; &gt; latest upstream commit:<br>
&gt;&gt; &gt;&gt; &gt; 972cab7 gnome-settings-daemon: remove the bbappend f=
or removed recipe<br>
&gt;&gt; &gt;&gt; &gt; not included in master yet:<br>
&gt;&gt; &gt;&gt; &gt; 5fcf848 chromium: hide textrel QA issues which are t=
here for ages<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; ______________________________<wbr>_________________=
<br>
&gt;&gt; &gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedd=
ed.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/lis=
tinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.=
openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--f403045f1eaa797bec055990d8e4--
