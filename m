Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 100D678451;
	Sat, 16 Sep 2017 09:00:13 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id v142so12789488wmv.5;
	Sat, 16 Sep 2017 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+LcivAJfnRTQRcT3Dzdp5L8StP+E56TPSOw/a7UfdpA=;
	b=cQTiavWRaJojum1+4mzxHLKO4pTVHdYUxFdtd+XSvfhXf+62YfLJsLLzLvPApnrFmX
	u2dG7Qgx7j7gaXIHN/FQxqw//ANwGfzHU5p/MG6Ghwyn8pjIS598JuFaIBBT8PZUuND6
	mOgwVxFpRk1yHHr7rWQYQ1Lq0Wd8d7300WbvsL9UIU2VuYbQ1GjKI+X+XHIZdLcSOJoI
	jL782P6VxTRKE10o7jxVMfclO/Y/LGe/qmXLPn/YDpqPhef7G0PgvT03qzOqYllIX/c0
	5k7tADIcz23tEhAjwDPhem0f65r8UbNNs6pe3/igA/0GpudKjUFR9+9Ks+CR6cieZ7yy
	vjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+LcivAJfnRTQRcT3Dzdp5L8StP+E56TPSOw/a7UfdpA=;
	b=Sg7Pei2hXo5BpexucQqvcGwmTW0p5D69/5VhsxeRtA+ci4NWs5LWckwNCrEViP1kmQ
	VcFgAo82oG+4gDoZX+OMTD4drMBJfcZpbLe+d/1qADKM4rAfm3BgJroGcjoyU6NslTxt
	ap1uJvy4tJcMwSBx6sdD2CAQrgI1/WVhT/2rwfxQ2jct7ruCZyR/4DKjhH0AH4K0RoJE
	dVIn1QgG8DcwcLdnUs9es3TZzR3oOEug7aSbpLlvi/82S/1UJXNQt5DZ+XIB7YWczTuK
	DuufP1KYLdYhdW7eNUHFnxhG84lbchDAag3CJWBbQ9HEwuxTGuOaYdXx87YZlaeEVdtY
	GbXg==
X-Gm-Message-State: AHPjjUizssWafB+MsdfqJht2wM8AWYBUUhr+ClLZAaODSIyay5Vlcvzb
	W8hk9IlQzmEscNwyzRotMc/hhm+LVWQ76d4b/jHvSQ==
X-Google-Smtp-Source: AOwi7QCpRxh5s6jeQFYvn9eMiWaH+Og87Ty6FemDKgyItG+XCpkAuDjen4UdSN2stb51vIvFL5e+4MHC6hJyWJxgjKM=
X-Received: by 10.28.73.134 with SMTP id w128mr4430495wma.141.1505552414121;
	Sat, 16 Sep 2017 02:00:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Sat, 16 Sep 2017 02:00:13 -0700 (PDT)
In-Reply-To: <CAMKF1soALs=ksNmvTO3vrDnP0gvRQviShq3O--iCZwRzjTB8Xg@mail.gmail.com>
References: <CA+chaQfjWH9SHcF4S61Q2Q_qUk7jcMMehPRibXg-QO_oS_QGiw@mail.gmail.com>
	<CAMKF1soALs=ksNmvTO3vrDnP0gvRQviShq3O--iCZwRzjTB8Xg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 16 Sep 2017 11:00:13 +0200
Message-ID: <CA+chaQdbNsKYzowonqmWYY-hp-e=GdJ_A7_hYq8jCjobw414jA@mail.gmail.com>
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
X-List-Received-Date: Sat, 16 Sep 2017 09:00:14 -0000
Content-Type: multipart/alternative; boundary="001a114b70b4d5a43a05594abcbd"

--001a114b70b4d5a43a05594abcbd
Content-Type: text/plain; charset="UTF-8"

Probably is, qemux86 was built from slightly older metadata, so probably
including previous versions of your klibc changes.

I know it's confusing in the report, but still each build takes around 24
hours per machine and I have only 2 builders. e.g. this qemux86 build was
started 20170912_234104
<http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170912_234104.log/>
as
the log directory shows and at that time there wasn't even the latest
version of klibc patches on ML.

Thanks

On Sat, Sep 16, 2017 at 1:02 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Sep 15, 2017 at 3:08 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > == Number of issues - stats ==
> > {| class='wikitable'
> > !|Date      !!colspan='3'|Failed tasks     !!|Signatures
>  !!colspan='14'|QA
> > !!Comment
> > |-
> > || ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped ||libdir
> > ||textrel ||build-deps ||file-rdeps ||version-going-backwards
> > ||host-user-contaminated ||installed-vs-shipped
> ||unknown-configure-option
> > ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
> > ||compile-host-path ||
> > |-
> > ||2017-09-14 ||3 ||6 ||2 ||0 ||0 ||0 ||5 ||0 ||0 ||91 ||3 ||0 ||0 ||0 ||0
> > ||0 ||0 ||0 ||
> > |}
> >
> > == Failed tasks 2017-09-14 ==
> >
> > INFO: jenkins-job.sh-1.8.29 Complete log available at
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> report.20170915_120505.log
> >
> > === common (1) ===
> >     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:d
> o_compile
> >
> > === common-x86 (0) ===
> >
> > === qemuarm (2) ===
> >     *
> > meta-openembedded/meta-multimedia/recipes-connectivity/libupnp/libupnp1.
> 6_1.6.21.bb:do_fetch
> >     *
> > meta-openembedded/meta-oe/recipes-devtools/android-
> tools/android-tools_5.1.1.r37.bb:do_compile
> >
> > === qemux86 (5) ===
> >     *
> > meta-openembedded/meta-initramfs/recipes-devtools/
> mtd/ubi-utils-klibc_1.5.1.bb:do_compile
> >     *
> > meta-openembedded/meta-initramfs/recipes-kernel/
> kexec/kexec-tools-klibc_2.0.2.bb:do_configure
> >     *
> > meta-openembedded/meta-multimedia/recipes-multimedia/
> gerbera/gerbera_git.bb:do_configure
> >     * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
> >     *
> > virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/
> kexecboot_git.bb:do_configure
> >
>
> all meta-initramfs should have been fixed with latest patchset it that not
> the case ?
>
> > === qemux86_64 (1) ===
> >     *
> > virtual:native:meta-openembedded/meta-oe/recipes-
> support/uim/uim_1.8.6.bb:do_install
> >
> > === Number of failed tasks (11) ===
> > {| class=wikitable
> > |-
> > || qemuarm || 3 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemuarm.20170914_113136.log/
> > || http://errors.yoctoproject.org/Errors/Build/46775/
> > |-
> > || qemux86 || 6 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86.20170912_234104.log/
> > || http://errors.yoctoproject.org/Errors/Build/46714/
> > |-
> > || qemux86_64 || 2 ||
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> world.qemux86-64.20170914_015733.log/
> > || http://errors.yoctoproject.org/Errors/Build/46761/
> > |}
> >
> > === PNBLACKLISTs (1) ===
> >
> > === QA issues (99) ===
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
> > ||0 ||unknown-configure-option
> > |-
> > ||3 ||host-user-contaminated
> > |-
> > ||5 ||textrel
> > |-
> > ||91 ||version-going-backwards
> > |}
> >
> >
> >
> > === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
> >
> > Complete log:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> signatures.20170913_214906.log/
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
> > meta-qt5:
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
> >
> >
> > QA issues by type:
> > count: 0 issue: already-stripped
> >
> >
> > count: 0 issue: libdir
> >
> >
> > count: 5 issue: textrel
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
> r0/packages-split/x264-bin/usr/bin/x264'
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
> > count: 91 issue: version-going-backwards
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-dbg went
> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-dev went
> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-doc went
> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ar
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> gnome-keyring-locale-ast
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-as
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-az
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> > gnome-keyring-locale-be+latin went backwards which would break package
> feeds
> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-be
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-bg
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> gnome-keyring-locale-bn-in
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-bn
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-bs
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> > gnome-keyring-locale-ca+valencia went backwards which would break
> package
> > feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ca
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-cs
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-cy
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-da
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-de
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-dz
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-el
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> gnome-keyring-locale-en-ca
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> gnome-keyring-locale-en-gb
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> > gnome-keyring-locale-en+shaw went backwards which would break package
> feeds
> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-es
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-et
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-eu
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-fa
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-fi
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-fr
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ga
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-gl
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-gu
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-he
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-hi
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-hr
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-hu
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-id
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-is
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-it
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ja
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ka
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-kn
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ko
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-lt
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-lv
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> gnome-keyring-locale-mai
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mg
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mk
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ml
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mn
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mr
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ms
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-nb
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ne
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-nl
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-nn
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-oc
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-or
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-pa
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-pl
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> gnome-keyring-locale-pt-br
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-pt
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ro
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ru
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-rw
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-si
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sk
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sl
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sq
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> > gnome-keyring-locale-sr+latin went backwards which would break package
> feeds
> > from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sr
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sv
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ta
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-te
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-th
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-tr
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-uk
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-vi
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-xh
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> gnome-keyring-locale-zh-cn
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> gnome-keyring-locale-zh-hk
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package
> gnome-keyring-locale-zh-tw
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring-staticdev
> > went backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > gnome-keyring-2.32.1: Package version for package gnome-keyring went
> > backwards which would break package feeds from (0:2.32.1-r12.40 to
> > 0:2.32.1-r12.0) [version-going-backwards]
> > libupnp-1.6.21: Package version for package libupnp-dbg went backwards
> which
> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> > [version-going-backwards]
> > libupnp-1.6.21: Package version for package libupnp-dev went backwards
> which
> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> > [version-going-backwards]
> > libupnp-1.6.21: Package version for package libupnp-doc went backwards
> which
> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> > [version-going-backwards]
> > libupnp-1.6.21: Package version for package libupnp-locale went backwards
> > which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> > [version-going-backwards]
> > libupnp-1.6.21: Package version for package libupnp-staticdev went
> backwards
> > which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> > [version-going-backwards]
> > libupnp-1.6.21: Package version for package libupnp went backwards which
> > would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
> > [version-going-backwards]
> >
> >
> > count: 3 issue: host-user-contaminated
> > glibc-locale-2.26: glibc-locale:
> > /glibc-binary-localedata-ru-ru/usr/lib/locale/ru_RU/LC_CTYPE is owned
> by uid
> > 3004, which is the same as the user running bitbake. This may be due to
> host
> > contamination [host-user-contaminated]
> > qt5-creator-3.5.1: qt5-creator:
> > /qt5-creator/usr/lib/qt5/qtcreator/plugins/libPythonEditor.so is owned
> by
> > uid 3004, which is the same as the user running bitbake. This may be due
> to
> > host contamination [host-user-contaminated]
> > qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: qtdeclarative:
> > /qtdeclarative-qmlplugins/usr/lib/qt5/qml/QtQuick.2/qmldir is owned by
> uid
> > 3004, which is the same as the user running bitbake. This may be due to
> host
> > contamination [host-user-contaminated]
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
> > 567f2cf server/process: ensure server failure log is limited to current
> > session
> > not included in master yet:
> > 3ec2af2 world-image: add extra target
> > 8eebabe fetch2: Allow Fetch.download() to warn instead of error
> >
> > == Tested changes (not included in master yet) - openembedded-core ==
> > latest upstream commit:
> > 8fe9fb4 python*native.bbclass: suppress user site dirs
> > not included in master yet:
> > 0d7ac07 report-error: Allow to upload reports automatically
> > 20d6101 buildhistory.bbclass: metadata-revs show repo parent
> > 202fb4c metadata-revs: provide more information
> > b3500a7 qemux86: Add identical qemux86copy variant for tests
> > 0de46b0 reproducible_build.bbclass: initial support for binary
> > reproducibility
> > d407a03 cpio: provide cpio-replacement-native
> > c872fa6 image_types.bbclass: improve cpio image reproducibility
> > 3fcc641 rootfs-postcommands.bbclass: support binary reproducibility
> > a132f03 sstate.bbclass: Do not cause build failures due to setscene
> errors
> > 198ea0e insane.bbclass: Add do_qa_pseudo function to check for common
> errors
> > listed in pseudo.log
> > 3283a1c insane.bbclass: do_qa_pseudo: don't trigger error from '^inode
> > mismatch'
> > beb394d insane.bbclass: do_qa_pseudo: show parts of pseudo.log in console
> >
> > == Tested changes (not included in master yet) - meta-openembedded ==
> > latest upstream commit:
> > 4a45235 opencv: Fix build with clang
> > not included in master yet:
> > df98f41 dnsmasq: disable the service by default
> > fb19f49 openconnect: fix parallel compilation failure
> > 9dafbb4 autofs: Fix build with musl
> > 6e742d3 yp-tools: Upgrade to 4.2.2
> > ef15059 vim: Remove xfce vim bbappend
> > 6fff604 leveldb: Fix build with clang
> > 2864d93 klibc: Edit out gcc hardcoding in do_compile
> > d20ab2d klibc.bbclass: Use forcevariable override to define flags
> > dceaa50 klibc.bbclass: Add -mfloat-abi on arm
> > 2e68338 smbnetfs: delete blacklisted
> > 3f06336 system-setup-keyboard: delete blacklisted
> > 14a15c0 python-jsonschema, python3-jsonschema: add vcversioner-native
> > dependency
> > a9d38f7 v4l-utils: added missing dependency on udev
> > 2b489fd ipvsadm: Add HOMEPAGE info into recipe file.
> > cf39ab8 libidl: Add HOMEPAGE info into recipe file.
> > 4fcda20 lvm2: Add HOMEPAGE info into recipe file.
> > 9e601b0 tcpdump: update to 4.9.2 to fix CVEs
> > 3dbb500 debsums: inherit gettext
> > b972817 protobuf: update to 3.4.0
> > 3e1748f protobuf-c: update to 1.3.0
> > a8cf4de libgpiod: bump version to v0.3.1
> > e9a3fd9 networkmanager: Add HOMEPAGE info into recipe file.
> > 6a0d564 samba: Add HOMEPAGE info into recipe file.
> > db01ddf squid: upgrade to 3.5.27
> > 8b48a16 iproute2: Move tipc enablement to oe-core
> > 1911f84 libmnl: Move to oe-core
> > f02eec7 flatbuffers: add version 1.7.1
> > 9d4b685 capnproto: add version 0.6.1
> > a18db12 libupnp: Add recipe for version 1.8.2
> > 90be7f5 gerbera: clean recipe
> > 62655bc libjs-sizzle: Add HOMEPAGE info into recipe file.
> > 6c0f9c2 liblockfile: Add HOMEPAGE info into recipe file.
> > 87d004b daemontools: Add HOMEPAGE info into recipe file.
> > 346b2a5 fbset: Add HOMEPAGE info into recipe file.
> > 2fdb314 libndp: Add HOMEPAGE info into recipe file.
> > a96fc97 gnome-keyring: Resolve conflict with gcr 3 and gold linking error
> > 34bb6e5 drbd-utils: remove
> > 0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
> > 864fb16 ceres-solver: add new recipe
> > 60b9eb6 libnih: Add HOMEPAGE info into recipe file.
> > 20eeac7 libtdb: Add HOMEPAGE info into recipe file.
> > 84172c0 mailcap: Add HOMEPAGE info into recipe file.
> > 7454d72 mozjs: Add HOMEPAGE info into recipe file.
> > 47bbfc9 numactl: Add HOMEPAGE info into recipe file.
> > ad97869 orbit2: Add HOMEPAGE info into recipe file.
> > f3469c8 sgpio: Add HOMEPAGE info into recipe file.
> > 50a3814 stunnel: Add HOMEPAGE info into recipe file.
> > d260749 leveldb: disable parallelism
> >
> > == Tested changes (not included in master yet) - meta-qt5 ==
> > latest upstream commit:
> > 743b3b9 qtbase-native: Force use of built-in pcre
> > not included in master yet:
> >
> > == Tested changes (not included in master yet) - meta-browser ==
> > latest upstream commit:
> > 972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
> > not included in master yet:
> > 5fcf848 chromium: hide textrel QA issues which are there for ages
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--001a114b70b4d5a43a05594abcbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Probably is, qemux86 was built from slightly older metadat=
a, so probably including previous versions of your klibc changes.<div><br><=
/div><div>I know it&#39;s confusing in the report, but still each build tak=
es around 24 hours per machine and I have only 2 builders. e.g. this qemux8=
6 build was started=C2=A0<a href=3D"http://logs.nslu2-linux.org/buildlogs/o=
e/world/rocko/log.world.qemux86.20170912_234104.log/" target=3D"_blank" sty=
le=3D"font-size:12.8px">20170912_234104</a>=C2=A0as the log directory shows=
 and at that time there wasn&#39;t even the latest version of klibc patches=
 on ML.</div><div><br></div><div>Thanks</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Sat, Sep 16, 2017 at 1:02 AM, Khem Raj=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bla=
nk">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div class=3D"HOEnZb"><div class=3D"h5">On Fri, Sep 15, 2017 at 3:08 PM=
, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@g=
mail.com</a>&gt; wrote:<br>
&gt; <a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" rel=
=3D"noreferrer" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/Bit=
bake_World_Status</a><br>
&gt;<br>
&gt; =3D=3D Number of issues - stats =3D=3D<br>
&gt; {| class=3D&#39;wikitable&#39;<br>
&gt; !|Date=C2=A0 =C2=A0 =C2=A0 !!colspan=3D&#39;3&#39;|Failed tasks=C2=A0 =
=C2=A0 =C2=A0!!|Signatures=C2=A0 =C2=A0!!colspan=3D&#39;14&#39;|QA<br>
&gt; !!Comment<br>
&gt; |-<br>
&gt; || ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped ||libdir<=
br>
&gt; ||textrel ||build-deps ||file-rdeps ||version-going-backwards<br>
&gt; ||host-user-contaminated ||installed-vs-shipped ||unknown-configure-op=
tion<br>
&gt; ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags<br>
&gt; ||compile-host-path ||<br>
&gt; |-<br>
&gt; ||2017-09-14 ||3 ||6 ||2 ||0 ||0 ||0 ||5 ||0 ||0 ||91 ||3 ||0 ||0 ||0 =
||0<br>
&gt; ||0 ||0 ||0 ||<br>
&gt; |}<br>
&gt;<br>
&gt; =3D=3D Failed tasks 2017-09-14 =3D=3D<br>
&gt;<br>
&gt; INFO: jenkins-job.sh-1.8.29 Complete log available at<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.re=
port.20170915_120505.log" rel=3D"noreferrer" target=3D"_blank">http://logs.=
nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>report.20170915_1205=
05.log</a><br>
&gt;<br>
&gt; =3D=3D=3D common (1) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0* meta-browser/recipes-mozilla/<wbr>firefox/firefox=
_45.9.0esr.bb:d<wbr>o_compile<br>
&gt;<br>
&gt; =3D=3D=3D common-x86 (0) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D qemuarm (2) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; meta-openembedded/meta-<wbr>multimedia/recipes-<wbr>connectivity/libup=
np/libupnp1.<wbr>6_1.6.21.bb:do_fetch<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; meta-openembedded/meta-oe/<wbr>recipes-devtools/android-<wbr>tools/and=
roid-tools_5.1.1.r37.<wbr>bb:do_compile<br>
&gt;<br>
&gt; =3D=3D=3D qemux86 (5) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; meta-openembedded/meta-<wbr>initramfs/recipes-devtools/<wbr>mtd/ubi-ut=
ils-klibc_1.5.1.bb:d<wbr>o_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; meta-openembedded/meta-<wbr>initramfs/recipes-kernel/<wbr>kexec/kexec-=
tools-klibc_2.0.2.<wbr>bb:do_configure<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; meta-openembedded/meta-<wbr>multimedia/recipes-multimedia/<wbr>gerbera=
/gerbera_git.bb:do_<wbr>configure<br>
&gt;=C2=A0 =C2=A0 =C2=A0* meta-qt5/recipes-qt/qt5/<wbr>qtlocation_git.bb:do=
_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; virtual:klibc:meta-<wbr>openembedded/meta-initramfs/<wbr>recipes-bsp/k=
execboot/<wbr>kexecboot_git.bb:do_configure<br>
&gt;<br>
<br>
</div></div>all meta-initramfs should have been fixed with latest patchset =
it that not<br>
the case ?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; =3D=3D=3D qemux86_64 (1) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0*<br>
&gt; virtual:native:meta-<wbr>openembedded/meta-oe/recipes-<wbr>support/uim=
/uim_1.8.6.bb:do_<wbr>install<br>
&gt;<br>
&gt; =3D=3D=3D Number of failed tasks (11) =3D=3D=3D<br>
&gt; {| class=3Dwikitable<br>
&gt; |-<br>
&gt; || qemuarm || 3 ||<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wo=
rld.qemuarm.20170914_113136.log/" rel=3D"noreferrer" target=3D"_blank">http=
://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemuar=
m.20170914_113136.<wbr>log/</a><br>
&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46775/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Build/46775/</a><br>
&gt; |-<br>
&gt; || qemux86 || 6 ||<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wo=
rld.qemux86.20170912_234104.log/" rel=3D"noreferrer" target=3D"_blank">http=
://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemux8=
6.20170912_234104.<wbr>log/</a><br>
&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46714/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Build/46714/</a><br>
&gt; |-<br>
&gt; || qemux86_64 || 2 ||<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.wo=
rld.qemux86-64.20170914_015733.log/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qem=
ux86-64.20170914_<wbr>015733.log/</a><br>
&gt; || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46761/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Build/46761/</a><br>
&gt; |}<br>
&gt;<br>
&gt; =3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D<br>
&gt;<br>
&gt; =3D=3D=3D QA issues (99) =3D=3D=3D<br>
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
&gt; ||0 ||unknown-configure-option<br>
&gt; |-<br>
&gt; ||3 ||host-user-contaminated<br>
&gt; |-<br>
&gt; ||5 ||textrel<br>
&gt; |-<br>
&gt; ||91 ||version-going-backwards<br>
&gt; |}<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D<br=
>
&gt;<br>
&gt; Complete log:<br>
&gt; <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.si=
gnatures.20170913_214906.log/" rel=3D"noreferrer" target=3D"_blank">http://=
logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>signatures.2017=
0913_214906.<wbr>log/</a><br>
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
&gt; meta-qt5:<br>
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
&gt;<br>
&gt;<br>
&gt; QA issues by type:<br>
&gt; count: 0 issue: already-stripped<br>
&gt;<br>
&gt;<br>
&gt; count: 0 issue: libdir<br>
&gt;<br>
&gt;<br>
&gt; count: 5 issue: textrel<br>
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
r>r0/packages-split/x264-bin/<wbr>usr/bin/x264&#39;<br>
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
&gt; count: 91 issue: version-going-backwards<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-dbg we=
nt<br>
&gt; backwards which would break package feeds from (0:2.32.1-r12.40 to<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-dev we=
nt<br>
&gt; backwards which would break package feeds from (0:2.32.1-r12.40 to<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-doc we=
nt<br>
&gt; backwards which would break package feeds from (0:2.32.1-r12.40 to<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ar<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ast<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-as<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-az<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package<br>
&gt; gnome-keyring-locale-be+latin went backwards which would break package=
 feeds<br>
&gt; from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-be<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-bg<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-bn-in<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-bn<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-bs<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package<br>
&gt; gnome-keyring-locale-ca+<wbr>valencia went backwards which would break=
 package<br>
&gt; feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backward=
s]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ca<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-cs<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-cy<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-da<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-de<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-dz<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-el<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-en-ca<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-en-gb<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package<br>
&gt; gnome-keyring-locale-en+shaw went backwards which would break package =
feeds<br>
&gt; from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-es<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-et<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-eu<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-fa<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-fi<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-fr<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ga<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-gl<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-gu<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-he<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-hi<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-hr<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-hu<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-id<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-is<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-it<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ja<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ka<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-kn<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ko<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-lt<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-lv<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-mai<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-mg<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-mk<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ml<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-mn<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-mr<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ms<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-nb<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ne<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-nl<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-nn<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-oc<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-or<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-pa<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-pl<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-pt-br<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-pt<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ro<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ru<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-rw<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-si<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-sk<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-sl<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-sq<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package<br>
&gt; gnome-keyring-locale-sr+latin went backwards which would break package=
 feeds<br>
&gt; from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-sr<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-sv<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-ta<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-te<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-th<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-tr<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-uk<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-vi<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-xh<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-zh-cn<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-zh-hk<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-locale=
-zh-tw<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring-static=
dev<br>
&gt; went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; gnome-keyring-2.32.1: Package version for package gnome-keyring went<b=
r>
&gt; backwards which would break package feeds from (0:2.32.1-r12.40 to<br>
&gt; 0:2.32.1-r12.0) [version-going-backwards]<br>
&gt; libupnp-1.6.21: Package version for package libupnp-dbg went backwards=
 which<br>
&gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)<br>
&gt; [version-going-backwards]<br>
&gt; libupnp-1.6.21: Package version for package libupnp-dev went backwards=
 which<br>
&gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)<br>
&gt; [version-going-backwards]<br>
&gt; libupnp-1.6.21: Package version for package libupnp-doc went backwards=
 which<br>
&gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)<br>
&gt; [version-going-backwards]<br>
&gt; libupnp-1.6.21: Package version for package libupnp-locale went backwa=
rds<br>
&gt; which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)<b=
r>
&gt; [version-going-backwards]<br>
&gt; libupnp-1.6.21: Package version for package libupnp-staticdev went bac=
kwards<br>
&gt; which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)<b=
r>
&gt; [version-going-backwards]<br>
&gt; libupnp-1.6.21: Package version for package libupnp went backwards whi=
ch<br>
&gt; would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)<br>
&gt; [version-going-backwards]<br>
&gt;<br>
&gt;<br>
&gt; count: 3 issue: host-user-contaminated<br>
&gt; glibc-locale-2.26: glibc-locale:<br>
&gt; /glibc-binary-localedata-ru-<wbr>ru/usr/lib/locale/ru_RU/LC_<wbr>CTYPE=
 is owned by uid<br>
&gt; 3004, which is the same as the user running bitbake. This may be due t=
o host<br>
&gt; contamination [host-user-contaminated]<br>
&gt; qt5-creator-3.5.1: qt5-creator:<br>
&gt; /qt5-creator/usr/lib/qt5/<wbr>qtcreator/plugins/<wbr>libPythonEditor.s=
o is owned by<br>
&gt; uid 3004, which is the same as the user running bitbake. This may be d=
ue to<br>
&gt; host contamination [host-user-contaminated]<br>
&gt; qtdeclarative-5.9.2+<wbr>gitAUTOINC+7c45b035b9: qtdeclarative:<br>
&gt; /qtdeclarative-qmlplugins/usr/<wbr>lib/qt5/qml/QtQuick.2/qmldir is own=
ed by uid<br>
&gt; 3004, which is the same as the user running bitbake. This may be due t=
o host<br>
&gt; contamination [host-user-contaminated]<br>
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
&gt; 567f2cf server/process: ensure server failure log is limited to curren=
t<br>
&gt; session<br>
&gt; not included in master yet:<br>
&gt; 3ec2af2 world-image: add extra target<br>
&gt; 8eebabe fetch2: Allow Fetch.download() to warn instead of error<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - openembedded-core=
 =3D=3D<br>
&gt; latest upstream commit:<br>
&gt; 8fe9fb4 python*native.bbclass: suppress user site dirs<br>
&gt; not included in master yet:<br>
&gt; 0d7ac07 report-error: Allow to upload reports automatically<br>
&gt; 20d6101 buildhistory.bbclass: metadata-revs show repo parent<br>
&gt; 202fb4c metadata-revs: provide more information<br>
&gt; b3500a7 qemux86: Add identical qemux86copy variant for tests<br>
&gt; 0de46b0 reproducible_build.bbclass: initial support for binary<br>
&gt; reproducibility<br>
&gt; d407a03 cpio: provide cpio-replacement-native<br>
&gt; c872fa6 image_types.bbclass: improve cpio image reproducibility<br>
&gt; 3fcc641 rootfs-postcommands.bbclass: support binary reproducibility<br=
>
&gt; a132f03 sstate.bbclass: Do not cause build failures due to setscene er=
rors<br>
&gt; 198ea0e insane.bbclass: Add do_qa_pseudo function to check for common =
errors<br>
&gt; listed in pseudo.log<br>
&gt; 3283a1c insane.bbclass: do_qa_pseudo: don&#39;t trigger error from &#3=
9;^inode<br>
&gt; mismatch&#39;<br>
&gt; beb394d insane.bbclass: do_qa_pseudo: show parts of pseudo.log in cons=
ole<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-openembedded=
 =3D=3D<br>
&gt; latest upstream commit:<br>
&gt; 4a45235 opencv: Fix build with clang<br>
&gt; not included in master yet:<br>
&gt; df98f41 dnsmasq: disable the service by default<br>
&gt; fb19f49 openconnect: fix parallel compilation failure<br>
&gt; 9dafbb4 autofs: Fix build with musl<br>
&gt; 6e742d3 yp-tools: Upgrade to 4.2.2<br>
&gt; ef15059 vim: Remove xfce vim bbappend<br>
&gt; 6fff604 leveldb: Fix build with clang<br>
&gt; 2864d93 klibc: Edit out gcc hardcoding in do_compile<br>
&gt; d20ab2d klibc.bbclass: Use forcevariable override to define flags<br>
&gt; dceaa50 klibc.bbclass: Add -mfloat-abi on arm<br>
&gt; 2e68338 smbnetfs: delete blacklisted<br>
&gt; 3f06336 system-setup-keyboard: delete blacklisted<br>
&gt; 14a15c0 python-jsonschema, python3-jsonschema: add vcversioner-native<=
br>
&gt; dependency<br>
&gt; a9d38f7 v4l-utils: added missing dependency on udev<br>
&gt; 2b489fd ipvsadm: Add HOMEPAGE info into recipe file.<br>
&gt; cf39ab8 libidl: Add HOMEPAGE info into recipe file.<br>
&gt; 4fcda20 lvm2: Add HOMEPAGE info into recipe file.<br>
&gt; 9e601b0 tcpdump: update to 4.9.2 to fix CVEs<br>
&gt; 3dbb500 debsums: inherit gettext<br>
&gt; b972817 protobuf: update to 3.4.0<br>
&gt; 3e1748f protobuf-c: update to 1.3.0<br>
&gt; a8cf4de libgpiod: bump version to v0.3.1<br>
&gt; e9a3fd9 networkmanager: Add HOMEPAGE info into recipe file.<br>
&gt; 6a0d564 samba: Add HOMEPAGE info into recipe file.<br>
&gt; db01ddf squid: upgrade to 3.5.27<br>
&gt; 8b48a16 iproute2: Move tipc enablement to oe-core<br>
&gt; 1911f84 libmnl: Move to oe-core<br>
&gt; f02eec7 flatbuffers: add version 1.7.1<br>
&gt; 9d4b685 capnproto: add version 0.6.1<br>
&gt; a18db12 libupnp: Add recipe for version 1.8.2<br>
&gt; 90be7f5 gerbera: clean recipe<br>
&gt; 62655bc libjs-sizzle: Add HOMEPAGE info into recipe file.<br>
&gt; 6c0f9c2 liblockfile: Add HOMEPAGE info into recipe file.<br>
&gt; 87d004b daemontools: Add HOMEPAGE info into recipe file.<br>
&gt; 346b2a5 fbset: Add HOMEPAGE info into recipe file.<br>
&gt; 2fdb314 libndp: Add HOMEPAGE info into recipe file.<br>
&gt; a96fc97 gnome-keyring: Resolve conflict with gcr 3 and gold linking er=
ror<br>
&gt; 34bb6e5 drbd-utils: remove<br>
&gt; 0001-drbd-8.4.4-drbd-tools-<wbr>only-rmmod-if-DRBD-is-a-<wbr>module.pa=
tch<br>
&gt; 864fb16 ceres-solver: add new recipe<br>
&gt; 60b9eb6 libnih: Add HOMEPAGE info into recipe file.<br>
&gt; 20eeac7 libtdb: Add HOMEPAGE info into recipe file.<br>
&gt; 84172c0 mailcap: Add HOMEPAGE info into recipe file.<br>
&gt; 7454d72 mozjs: Add HOMEPAGE info into recipe file.<br>
&gt; 47bbfc9 numactl: Add HOMEPAGE info into recipe file.<br>
&gt; ad97869 orbit2: Add HOMEPAGE info into recipe file.<br>
&gt; f3469c8 sgpio: Add HOMEPAGE info into recipe file.<br>
&gt; 50a3814 stunnel: Add HOMEPAGE info into recipe file.<br>
&gt; d260749 leveldb: disable parallelism<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D<b=
r>
&gt; latest upstream commit:<br>
&gt; 743b3b9 qtbase-native: Force use of built-in pcre<br>
&gt; not included in master yet:<br>
&gt;<br>
&gt; =3D=3D Tested changes (not included in master yet) - meta-browser =3D=
=3D<br>
&gt; latest upstream commit:<br>
&gt; 972cab7 gnome-settings-daemon: remove the bbappend for removed recipe<=
br>
&gt; not included in master yet:<br>
&gt; 5fcf848 chromium: hide textrel QA issues which are there for ages<br>
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

--001a114b70b4d5a43a05594abcbd--
