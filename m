Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id A68B272F6C;
	Fri, 15 Sep 2017 22:08:15 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id 72so1897902uas.8;
	Fri, 15 Sep 2017 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=XhwLURNi55EqQuMbkw1w9rrGACl29z5R0kiDr0qnC1w=;
	b=WVZShD3WF+P2pn/5hzcBxzSUengC6qS82/Cia/bswFwZiCld1vO7mhBarVxfw+s5Sm
	iOGz7OHfBTT0h69pfjtXse5lGujM5exSAxfbKF99IiZBm2r4YOTMaXxBeYMG13EDy4rN
	4S9d+v4f3uW25Evv33/jdEvEPtdZK3HJTdVDGIg2TQyJLd2mSAFztvMBG1cZoMFe/BV9
	pt1vouFcc2d55Wanz+y9kYdcfOyaVVR6r+ZCpBTDU0UxSMaKW2LeqoBMAPrRL3c0GX5G
	UEYfahYeZG89R/Zvk3jp8Q55GANxJ0OYu31weKm2ONPjb27EMP8GySFoDgAMLkdzzDOB
	GpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XhwLURNi55EqQuMbkw1w9rrGACl29z5R0kiDr0qnC1w=;
	b=nAk/bDOdrrxEviz99QDqP3C+0TMk67cWjUuLahyFTu1Pya+NcojaWINr8N30S9zKlA
	PX8stGM2EnOYcK4a8UdRn+D44Sa9S5DZqUCTQPaLQD4TiVpwc3MzBE2XtK5hftdunl+w
	+JD6ObzNXnhPcbFISp1oNwX/OUEdbY1d1BgdtOdSBYLG3gaFBBcJqehgou9ECPrUJlai
	kKwZQbZEBvzs2bAc1xsf3agJZSoAdvwYelOo4m+vidyz9lB4Lo46GP/sm4/zR0G/QL2j
	aZxnSNuPw5oVjLrjJlyOnj78gvvgWb6bx2BFWnJGE4iBzNjWZSb0jI1ryDqzkrTjyXdm
	iZ1w==
X-Gm-Message-State: AHPjjUisTzJDHyqdtMYLU4BecQxaNNsi1umYaFRNxz8W3bLySyme4Z8W
	fbdV8biLX45aGyl7hZoFYvKXigyI20S9RdD1WlBkrA==
X-Google-Smtp-Source: AOwi7QAAVXJx5Pz+03M4U6xfd7G5E8qoepmoWyBU/Ar8XPNjmVWlIk9CfcNZcPxp5mJhKTdCNSx5QLE2OXTqFzMBTxs=
X-Received: by 10.176.74.129 with SMTP id s1mr6993542uae.191.1505513295523;
	Fri, 15 Sep 2017 15:08:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Fri, 15 Sep 2017 15:08:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 16 Sep 2017 00:08:14 +0200
Message-ID: <CA+chaQfjWH9SHcF4S61Q2Q_qUk7jcMMehPRibXg-QO_oS_QGiw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-09-14
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
X-List-Received-Date: Fri, 15 Sep 2017 22:08:16 -0000
Content-Type: multipart/alternative; boundary="f403045f903e2f33b5055941a10a"

--f403045f903e2f33b5055941a10a
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date      !!colspan='3'|Failed tasks     !!|Signatures
!!colspan='14'|QA !!Comment
|-
|| ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped ||libdir
||textrel ||build-deps ||file-rdeps ||version-going-backwards
||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option
||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
||compile-host-path ||
|-
||2017-09-14 ||3 ||6 ||2 ||0 ||0 ||0 ||5 ||0 ||0 ||91 ||3 ||0 ||0 ||0 ||0
||0 ||0 ||0 ||
|}

== Failed tasks 2017-09-14 ==

INFO: jenkins-job.sh-1.8.29 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170915_120505.log

=== common (1) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (2) ===
    *
meta-openembedded/meta-multimedia/recipes-connectivity/libupnp/libupnp1.6_1.6.21.bb:
do_fetch
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile

=== qemux86 (5) ===
    *
meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb:
do_compile
    *
meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:
do_configure
    *
meta-openembedded/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb:
do_configure
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
    *
virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb:
do_configure

=== qemux86_64 (1) ===
    *
virtual:native:meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb:
do_install

=== Number of failed tasks (11) ===
{| class=wikitable
|-
|| qemuarm || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170914_113136.log/
|| http://errors.yoctoproject.org/Errors/Build/46775/
|-
|| qemux86 || 6 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170912_234104.log/
|| http://errors.yoctoproject.org/Errors/Build/46714/
|-
|| qemux86_64 || 2 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170914_015733.log/
|| http://errors.yoctoproject.org/Errors/Build/46761/
|}

=== PNBLACKLISTs (1) ===

=== QA issues (99) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||build-deps
|-
||0 ||compile-host-path
|-
||0 ||file-rdeps
|-
||0 ||installed-vs-shipped
|-
||0 ||invalid-pkgconfig
|-
||0 ||ldflags
|-
||0 ||libdir
|-
||0 ||pkgname
|-
||0 ||symlink-to-sysroot
|-
||0 ||unknown-configure-option
|-
||3 ||host-user-contaminated
|-
||5 ||textrel
|-
||91 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170913_214906.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
link against sctp_connectx symbol", '', d)}"
meta-qt5:
PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 5 issue: textrel
chromium-54.0.2810.2: ELF binary
'/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
has relocations in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary
'/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
has relocations in .text [textrel]
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 91 issue: version-going-backwards
gnome-keyring-2.32.1: Package version for package gnome-keyring-dbg went
backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-dev went
backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-doc went
backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ar
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ast
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-as
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-az
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-be+latin went backwards which would break package
feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-be
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-bg
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-bn-in went backwards which would break package feeds
from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-bn
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-bs
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-ca+valencia went backwards which would break package
feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ca
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-cs
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-cy
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-da
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-de
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-dz
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-el
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-en-ca went backwards which would break package feeds
from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-en-gb went backwards which would break package feeds
from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-en+shaw went backwards which would break package feeds
from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-es
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-et
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-eu
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-fa
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-fi
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-fr
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ga
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-gl
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-gu
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-he
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-hi
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-hr
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-hu
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-id
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-is
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-it
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ja
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ka
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-kn
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ko
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-lt
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-lv
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mai
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mg
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mk
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ml
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mn
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-mr
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ms
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-nb
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ne
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-nl
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-nn
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-oc
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-or
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-pa
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-pl
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-pt-br went backwards which would break package feeds
from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-pt
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ro
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ru
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-rw
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-si
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sk
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sl
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sq
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-sr+latin went backwards which would break package
feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sr
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-sv
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ta
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-te
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-th
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-tr
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-uk
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-vi
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-xh
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-zh-cn went backwards which would break package feeds
from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-zh-hk went backwards which would break package feeds
from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package
gnome-keyring-locale-zh-tw went backwards which would break package feeds
from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring-staticdev
went backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
gnome-keyring-2.32.1: Package version for package gnome-keyring went
backwards which would break package feeds from (0:2.32.1-r12.40 to
0:2.32.1-r12.0) [version-going-backwards]
libupnp-1.6.21: Package version for package libupnp-dbg went backwards
which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
[version-going-backwards]
libupnp-1.6.21: Package version for package libupnp-dev went backwards
which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
[version-going-backwards]
libupnp-1.6.21: Package version for package libupnp-doc went backwards
which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
[version-going-backwards]
libupnp-1.6.21: Package version for package libupnp-locale went backwards
which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
[version-going-backwards]
libupnp-1.6.21: Package version for package libupnp-staticdev went
backwards which would break package feeds from (0:1.8.2-r0.0 to
0:1.6.21-r0.2) [version-going-backwards]
libupnp-1.6.21: Package version for package libupnp went backwards which
would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2)
[version-going-backwards]


count: 3 issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ru-ru/usr/lib/locale/ru_RU/LC_CTYPE is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qt5-creator-3.5.1: qt5-creator:
/qt5-creator/usr/lib/qt5/qtcreator/plugins/libPythonEditor.so is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: qtdeclarative:
/qtdeclarative-qmlplugins/usr/lib/qt5/qml/QtQuick.2/qmldir is owned by uid
3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
567f2cf server/process: ensure server failure log is limited to current
session
not included in master yet:
3ec2af2 world-image: add extra target
8eebabe fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
8fe9fb4 python*native.bbclass: suppress user site dirs
not included in master yet:
0d7ac07 report-error: Allow to upload reports automatically
20d6101 buildhistory.bbclass: metadata-revs show repo parent
202fb4c metadata-revs: provide more information
b3500a7 qemux86: Add identical qemux86copy variant for tests
0de46b0 reproducible_build.bbclass: initial support for binary
reproducibility
d407a03 cpio: provide cpio-replacement-native
c872fa6 image_types.bbclass: improve cpio image reproducibility
3fcc641 rootfs-postcommands.bbclass: support binary reproducibility
a132f03 sstate.bbclass: Do not cause build failures due to setscene errors
198ea0e insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
3283a1c insane.bbclass: do_qa_pseudo: don't trigger error from '^inode
mismatch'
beb394d insane.bbclass: do_qa_pseudo: show parts of pseudo.log in console

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
4a45235 opencv: Fix build with clang
not included in master yet:
df98f41 dnsmasq: disable the service by default
fb19f49 openconnect: fix parallel compilation failure
9dafbb4 autofs: Fix build with musl
6e742d3 yp-tools: Upgrade to 4.2.2
ef15059 vim: Remove xfce vim bbappend
6fff604 leveldb: Fix build with clang
2864d93 klibc: Edit out gcc hardcoding in do_compile
d20ab2d klibc.bbclass: Use forcevariable override to define flags
dceaa50 klibc.bbclass: Add -mfloat-abi on arm
2e68338 smbnetfs: delete blacklisted
3f06336 system-setup-keyboard: delete blacklisted
14a15c0 python-jsonschema, python3-jsonschema: add vcversioner-native
dependency
a9d38f7 v4l-utils: added missing dependency on udev
2b489fd ipvsadm: Add HOMEPAGE info into recipe file.
cf39ab8 libidl: Add HOMEPAGE info into recipe file.
4fcda20 lvm2: Add HOMEPAGE info into recipe file.
9e601b0 tcpdump: update to 4.9.2 to fix CVEs
3dbb500 debsums: inherit gettext
b972817 protobuf: update to 3.4.0
3e1748f protobuf-c: update to 1.3.0
a8cf4de libgpiod: bump version to v0.3.1
e9a3fd9 networkmanager: Add HOMEPAGE info into recipe file.
6a0d564 samba: Add HOMEPAGE info into recipe file.
db01ddf squid: upgrade to 3.5.27
8b48a16 iproute2: Move tipc enablement to oe-core
1911f84 libmnl: Move to oe-core
f02eec7 flatbuffers: add version 1.7.1
9d4b685 capnproto: add version 0.6.1
a18db12 libupnp: Add recipe for version 1.8.2
90be7f5 gerbera: clean recipe
62655bc libjs-sizzle: Add HOMEPAGE info into recipe file.
6c0f9c2 liblockfile: Add HOMEPAGE info into recipe file.
87d004b daemontools: Add HOMEPAGE info into recipe file.
346b2a5 fbset: Add HOMEPAGE info into recipe file.
2fdb314 libndp: Add HOMEPAGE info into recipe file.
a96fc97 gnome-keyring: Resolve conflict with gcr 3 and gold linking error
34bb6e5 drbd-utils: remove
0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
864fb16 ceres-solver: add new recipe
60b9eb6 libnih: Add HOMEPAGE info into recipe file.
20eeac7 libtdb: Add HOMEPAGE info into recipe file.
84172c0 mailcap: Add HOMEPAGE info into recipe file.
7454d72 mozjs: Add HOMEPAGE info into recipe file.
47bbfc9 numactl: Add HOMEPAGE info into recipe file.
ad97869 orbit2: Add HOMEPAGE info into recipe file.
f3469c8 sgpio: Add HOMEPAGE info into recipe file.
50a3814 stunnel: Add HOMEPAGE info into recipe file.
d260749 leveldb: disable parallelism

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
743b3b9 qtbase-native: Force use of built-in pcre
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet:
5fcf848 chromium: hide textrel QA issues which are there for ages

--f403045f903e2f33b5055941a10a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><a href=3D"http://www.openembedded.org/wiki/Bitbake_W=
orld_Status">http://www.openembedded.org/wiki/Bitbake_World_Status</a></div=
><div><br></div><div>=3D=3D Number of issues - stats =3D=3D</div><div>{| cl=
ass=3D&#39;wikitable&#39;</div><div>!|Date<span style=3D"white-space:pre">	=
	</span>=C2=A0 =C2=A0 =C2=A0!!colspan=3D&#39;3&#39;|Failed tasks<span style=
=3D"white-space:pre">			</span>=C2=A0 =C2=A0 !!|Signatures<span style=3D"wh=
ite-space:pre">		</span>=C2=A0 !!colspan=3D&#39;14&#39;|QA !!Comment</div><=
div>|-</div><div>||<span style=3D"white-space:pre">		</span>||qemuarm<span =
style=3D"white-space:pre">	</span>||qemux86<span style=3D"white-space:pre">=
	</span>||qemux86_64<span style=3D"white-space:pre">	</span>||all <span sty=
le=3D"white-space:pre">	</span>||already-stripped<span style=3D"white-space=
:pre">	</span>||libdir<span style=3D"white-space:pre">	</span>||textrel<spa=
n style=3D"white-space:pre">	</span>||build-deps<span style=3D"white-space:=
pre">	</span>||file-rdeps<span style=3D"white-space:pre">	</span>||version-=
going-backwards<span style=3D"white-space:pre">	</span>||host-user-contamin=
ated<span style=3D"white-space:pre">	</span>||installed-vs-shipped<span sty=
le=3D"white-space:pre">	</span>||unknown-configure-option<span style=3D"whi=
te-space:pre">	</span>||symlink-to-sysroot<span style=3D"white-space:pre">	=
</span>||invalid-pkgconfig<span style=3D"white-space:pre">	</span>||pkgname=
<span style=3D"white-space:pre">	</span>||ldflags<span style=3D"white-space=
:pre">	</span>||compile-host-path<span style=3D"white-space:pre">	</span>||=
<span style=3D"white-space:pre">	</span></div><div>|-</div><div>||2017-09-1=
4<span style=3D"white-space:pre">	</span>||3<span style=3D"white-space:pre"=
>	</span>||6<span style=3D"white-space:pre">	</span>||2<span style=3D"white=
-space:pre">	</span>||0<span style=3D"white-space:pre">	</span>||0<span sty=
le=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		</span=
>||5<span style=3D"white-space:pre">		</span>||0<span style=3D"white-space:=
pre">		</span>||0<span style=3D"white-space:pre">		</span>||91<span style=
=3D"white-space:pre">		</span>||3<span style=3D"white-space:pre">		</span>|=
|0<span style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pr=
e">		</span>||0<span style=3D"white-space:pre">		</span>||0<span style=3D"w=
hite-space:pre">		</span>||0<span style=3D"white-space:pre">		</span>||0<sp=
an style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		=
</span>||<span style=3D"white-space:pre">	</span></div><div>|}</div><div><b=
r></div><div>=3D=3D Failed tasks 2017-09-14 =3D=3D</div><div><br></div><div=
>INFO: jenkins-job.sh-1.8.29 Complete log available at <a href=3D"http://lo=
gs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170915_120505.log"=
>http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170915_1=
20505.log</a></div><div><br></div><div>=3D=3D=3D common (1) =3D=3D=3D</div>=
<div>=C2=A0 =C2=A0 * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr=
.bb:do_compile</div><div><br></div><div>=3D=3D=3D common-x86 (0) =3D=3D=3D<=
/div><div><br></div><div>=3D=3D=3D qemuarm (2) =3D=3D=3D</div><div>=C2=A0 =
=C2=A0 * meta-openembedded/meta-multimedia/recipes-connectivity/libupnp/lib=
upnp1.6_1.6.21.bb:do_fetch</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta=
-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile</d=
iv><div><br></div><div>=3D=3D=3D qemux86 (5) =3D=3D=3D</div><div>=C2=A0 =C2=
=A0 * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc=
_1.5.1.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-initr=
amfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure</div><div=
>=C2=A0 =C2=A0 * meta-openembedded/meta-multimedia/recipes-multimedia/gerbe=
ra/gerbera_git.bb:do_configure</div><div>=C2=A0 =C2=A0 * meta-qt5/recipes-q=
t/qt5/qtlocation_git.bb:do_compile</div><div>=C2=A0 =C2=A0 * virtual:klibc:=
meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb:do_=
configure</div><div><br></div><div>=3D=3D=3D qemux86_64 (1) =3D=3D=3D</div>=
<div>=C2=A0 =C2=A0 * virtual:native:meta-openembedded/meta-oe/recipes-suppo=
rt/uim/uim_1.8.6.bb:do_install</div><div><br></div><div>=3D=3D=3D Number of=
 failed tasks (11) =3D=3D=3D</div><div>{| class=3Dwikitable</div><div>|-</d=
iv><div>|| qemuarm <span style=3D"white-space:pre">	</span>|| 3<span style=
=3D"white-space:pre">	</span> || <a href=3D"http://logs.nslu2-linux.org/bui=
ldlogs/oe/world/rocko/log.world.qemuarm.20170914_113136.log/">http://logs.n=
slu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170914_113136.l=
og/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46775/">h=
ttp://errors.yoctoproject.org/Errors/Build/46775/</a></div><div>|-</div><di=
v>|| qemux86 <span style=3D"white-space:pre">	</span>|| 6<span style=3D"whi=
te-space:pre">	</span> || <a href=3D"http://logs.nslu2-linux.org/buildlogs/=
oe/world/rocko/log.world.qemux86.20170912_234104.log/">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170912_234104.log/</a>=
 || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46714/">http://e=
rrors.yoctoproject.org/Errors/Build/46714/</a></div><div>|-</div><div>|| qe=
mux86_64 <span style=3D"white-space:pre">	</span>|| 2<span style=3D"white-s=
pace:pre">	</span> || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/rocko/log.world.qemux86-64.20170914_015733.log/">http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170914_015733.log/</=
a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46761/">http:/=
/errors.yoctoproject.org/Errors/Build/46761/</a></div><div>|}</div><div><br=
></div><div>=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D</div><div><br></div><div>=
=3D=3D=3D QA issues (99) =3D=3D=3D</div><div>{| class=3Dwikitable</div><div=
>!| Count<span style=3D"white-space:pre">		</span>||Issue</div><div>|-</div=
><div>||0<span style=3D"white-space:pre">	</span>||already-stripped</div><d=
iv>|-</div><div>||0<span style=3D"white-space:pre">	</span>||build-deps</di=
v><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||compile-ho=
st-path</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>|=
|file-rdeps</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</sp=
an>||installed-vs-shipped</div><div>|-</div><div>||0<span style=3D"white-sp=
ace:pre">	</span>||invalid-pkgconfig</div><div>|-</div><div>||0<span style=
=3D"white-space:pre">	</span>||ldflags</div><div>|-</div><div>||0<span styl=
e=3D"white-space:pre">	</span>||libdir</div><div>|-</div><div>||0<span styl=
e=3D"white-space:pre">	</span>||pkgname</div><div>|-</div><div>||0<span sty=
le=3D"white-space:pre">	</span>||symlink-to-sysroot</div><div>|-</div><div>=
||0<span style=3D"white-space:pre">	</span>||unknown-configure-option</div>=
<div>|-</div><div>||3<span style=3D"white-space:pre">	</span>||host-user-co=
ntaminated</div><div>|-</div><div>||5<span style=3D"white-space:pre">	</spa=
n>||textrel</div><div>|-</div><div>||91<span style=3D"white-space:pre">	</s=
pan>||version-going-backwards</div><div>|}</div><div><br></div><div><br></d=
iv><div><br></div><div>=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signature=
s (0) =3D=3D=3D</div><div><br></div><div>Complete log: <a href=3D"http://lo=
gs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170913_214906.=
log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.2=
0170913_214906.log/</a></div><div><br></div><div>No issues detected</div><d=
iv><br></div><div><br></div><div>PNBLACKLISTs:</div><div>openembedded-core/=
:</div><div>meta-browser:</div><div>meta-openembedded:</div><div>meta-netwo=
rking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksct=
p-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ld=
-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx symbol&quo=
t;, &#39;&#39;, d)}&quot;</div><div>meta-qt5:</div><div>PNBLACKLIST[android=
-system] =3D &quot;depends on lxc from meta-virtualiazation which isn&#39;t=
 included in my world builds&quot;</div><div>PNBLACKLIST[bigbuckbunny-1080p=
] =3D &quot;big and doesn&#39;t really need to be tested so much&quot;</div=
><div>PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really n=
eed to be tested so much&quot;</div><div>PNBLACKLIST[bigbuckbunny-720p] =3D=
 &quot;big and doesn&#39;t really need to be tested so much&quot;</div><div=
>PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;</div><div>PNBLACKLIST[tearsofsteel-1080p] =3D &qu=
ot;big and doesn&#39;t really need to be tested so much&quot;</div><div>PNB=
LACKLIST[build-appliance-image] =3D &quot;tries to include whole downloads =
directory in /home/builder/poky :/&quot;</div><div><br></div><div><br></div=
><div>QA issues by type:</div><div>count: 0<span style=3D"white-space:pre">=
	</span>issue: already-stripped</div><div><br></div><div><br></div><div>cou=
nt: 0<span style=3D"white-space:pre">	</span>issue: libdir</div><div><br></=
div><div><br></div><div>count: 5<span style=3D"white-space:pre">	</span>iss=
ue: textrel</div><div>chromium-54.0.2810.2: ELF binary &#39;/tmp/work/i586-=
oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/c=
hrome&#39; has relocations in .text [textrel]</div><div>chromium-wayland-53=
.0.2785.143: ELF binary &#39;/tmp/work/i586-oe-linux/chromium-wayland/53.0.=
2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome&#39; ha=
s relocations in .text [textrel]</div><div>corosync-2.4.2: ELF binary &#39;=
/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/s=
bin/corosync&#39; has relocations in .text [textrel]</div><div>x264-r2731+g=
itAUTOINC+2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-linux/x264/r2731+gi=
tAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264&#39; has reloca=
tions in .text [textrel]</div><div>x264-r2731+gitAUTOINC+2b741f81e5: ELF bi=
nary &#39;/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packa=
ges-split/x264/usr/lib/libx264.so.148&#39; has relocations in .text [textre=
l]</div><div><br></div><div><br></div><div>count: 0<span style=3D"white-spa=
ce:pre">	</span>issue: build-deps</div><div><br></div><div><br></div><div>c=
ount: 0<span style=3D"white-space:pre">	</span>issue: file-rdeps</div><div>=
<br></div><div><br></div><div>count: 91<span style=3D"white-space:pre">	</s=
pan>issue: version-going-backwards</div><div>gnome-keyring-2.32.1: Package =
version for package gnome-keyring-dbg went backwards which would break pack=
age feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards=
]</div><div>gnome-keyring-2.32.1: Package version for package gnome-keyring=
-dev went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1:=
 Package version for package gnome-keyring-doc went backwards which would b=
reak package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-=
backwards]</div><div>gnome-keyring-2.32.1: Package version for package gnom=
e-keyring-locale-ar went backwards which would break package feeds from (0:=
2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-=
keyring-2.32.1: Package version for package gnome-keyring-locale-ast went b=
ackwards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-=
r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package ve=
rsion for package gnome-keyring-locale-as went backwards which would break =
package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backw=
ards]</div><div>gnome-keyring-2.32.1: Package version for package gnome-key=
ring-locale-az went backwards which would break package feeds from (0:2.32.=
1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyri=
ng-2.32.1: Package version for package gnome-keyring-locale-be+latin went b=
ackwards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-=
r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package ve=
rsion for package gnome-keyring-locale-be went backwards which would break =
package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backw=
ards]</div><div>gnome-keyring-2.32.1: Package version for package gnome-key=
ring-locale-bg went backwards which would break package feeds from (0:2.32.=
1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyri=
ng-2.32.1: Package version for package gnome-keyring-locale-bn-in went back=
wards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12=
.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package versi=
on for package gnome-keyring-locale-bn went backwards which would break pac=
kage feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backward=
s]</div><div>gnome-keyring-2.32.1: Package version for package gnome-keyrin=
g-locale-bs went backwards which would break package feeds from (0:2.32.1-r=
12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-=
2.32.1: Package version for package gnome-keyring-locale-ca+valencia went b=
ackwards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-=
r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package ve=
rsion for package gnome-keyring-locale-ca went backwards which would break =
package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backw=
ards]</div><div>gnome-keyring-2.32.1: Package version for package gnome-key=
ring-locale-cs went backwards which would break package feeds from (0:2.32.=
1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyri=
ng-2.32.1: Package version for package gnome-keyring-locale-cy went backwar=
ds which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0)=
 [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package version =
for package gnome-keyring-locale-da went backwards which would break packag=
e feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]<=
/div><div>gnome-keyring-2.32.1: Package version for package gnome-keyring-l=
ocale-de went backwards which would break package feeds from (0:2.32.1-r12.=
40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.3=
2.1: Package version for package gnome-keyring-locale-dz went backwards whi=
ch would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [vers=
ion-going-backwards]</div><div>gnome-keyring-2.32.1: Package version for pa=
ckage gnome-keyring-locale-el went backwards which would break package feed=
s from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><=
div>gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-=
en-ca went backwards which would break package feeds from (0:2.32.1-r12.40 =
to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1=
: Package version for package gnome-keyring-locale-en-gb went backwards whi=
ch would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [vers=
ion-going-backwards]</div><div>gnome-keyring-2.32.1: Package version for pa=
ckage gnome-keyring-locale-en+shaw went backwards which would break package=
 feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</=
div><div>gnome-keyring-2.32.1: Package version for package gnome-keyring-lo=
cale-es went backwards which would break package feeds from (0:2.32.1-r12.4=
0 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32=
.1: Package version for package gnome-keyring-locale-et went backwards whic=
h would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [versi=
on-going-backwards]</div><div>gnome-keyring-2.32.1: Package version for pac=
kage gnome-keyring-locale-eu went backwards which would break package feeds=
 from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><d=
iv>gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-f=
a went backwards which would break package feeds from (0:2.32.1-r12.40 to 0=
:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Pa=
ckage version for package gnome-keyring-locale-fi went backwards which woul=
d break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-goi=
ng-backwards]</div><div>gnome-keyring-2.32.1: Package version for package g=
nome-keyring-locale-fr went backwards which would break package feeds from =
(0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gno=
me-keyring-2.32.1: Package version for package gnome-keyring-locale-ga went=
 backwards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.=
1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package =
version for package gnome-keyring-locale-gl went backwards which would brea=
k package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-bac=
kwards]</div><div>gnome-keyring-2.32.1: Package version for package gnome-k=
eyring-locale-gu went backwards which would break package feeds from (0:2.3=
2.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-key=
ring-2.32.1: Package version for package gnome-keyring-locale-he went backw=
ards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.=
0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package versio=
n for package gnome-keyring-locale-hi went backwards which would break pack=
age feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards=
]</div><div>gnome-keyring-2.32.1: Package version for package gnome-keyring=
-locale-hr went backwards which would break package feeds from (0:2.32.1-r1=
2.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2=
.32.1: Package version for package gnome-keyring-locale-hu went backwards w=
hich would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [ve=
rsion-going-backwards]</div><div>gnome-keyring-2.32.1: Package version for =
package gnome-keyring-locale-id went backwards which would break package fe=
eds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div=
><div>gnome-keyring-2.32.1: Package version for package gnome-keyring-local=
e-is went backwards which would break package feeds from (0:2.32.1-r12.40 t=
o 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1:=
 Package version for package gnome-keyring-locale-it went backwards which w=
ould break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-=
going-backwards]</div><div>gnome-keyring-2.32.1: Package version for packag=
e gnome-keyring-locale-ja went backwards which would break package feeds fr=
om (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>=
gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-ka w=
ent backwards which would break package feeds from (0:2.32.1-r12.40 to 0:2.=
32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Packa=
ge version for package gnome-keyring-locale-kn went backwards which would b=
reak package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-=
backwards]</div><div>gnome-keyring-2.32.1: Package version for package gnom=
e-keyring-locale-ko went backwards which would break package feeds from (0:=
2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-=
keyring-2.32.1: Package version for package gnome-keyring-locale-lt went ba=
ckwards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r=
12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package ver=
sion for package gnome-keyring-locale-lv went backwards which would break p=
ackage feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwa=
rds]</div><div>gnome-keyring-2.32.1: Package version for package gnome-keyr=
ing-locale-mai went backwards which would break package feeds from (0:2.32.=
1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyri=
ng-2.32.1: Package version for package gnome-keyring-locale-mg went backwar=
ds which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0)=
 [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package version =
for package gnome-keyring-locale-mk went backwards which would break packag=
e feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]<=
/div><div>gnome-keyring-2.32.1: Package version for package gnome-keyring-l=
ocale-ml went backwards which would break package feeds from (0:2.32.1-r12.=
40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.3=
2.1: Package version for package gnome-keyring-locale-mn went backwards whi=
ch would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [vers=
ion-going-backwards]</div><div>gnome-keyring-2.32.1: Package version for pa=
ckage gnome-keyring-locale-mr went backwards which would break package feed=
s from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><=
div>gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-=
ms went backwards which would break package feeds from (0:2.32.1-r12.40 to =
0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: P=
ackage version for package gnome-keyring-locale-nb went backwards which wou=
ld break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-go=
ing-backwards]</div><div>gnome-keyring-2.32.1: Package version for package =
gnome-keyring-locale-ne went backwards which would break package feeds from=
 (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gn=
ome-keyring-2.32.1: Package version for package gnome-keyring-locale-nl wen=
t backwards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32=
.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package=
 version for package gnome-keyring-locale-nn went backwards which would bre=
ak package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-ba=
ckwards]</div><div>gnome-keyring-2.32.1: Package version for package gnome-=
keyring-locale-oc went backwards which would break package feeds from (0:2.=
32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-ke=
yring-2.32.1: Package version for package gnome-keyring-locale-or went back=
wards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12=
.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package versi=
on for package gnome-keyring-locale-pa went backwards which would break pac=
kage feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backward=
s]</div><div>gnome-keyring-2.32.1: Package version for package gnome-keyrin=
g-locale-pl went backwards which would break package feeds from (0:2.32.1-r=
12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-=
2.32.1: Package version for package gnome-keyring-locale-pt-br went backwar=
ds which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0)=
 [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package version =
for package gnome-keyring-locale-pt went backwards which would break packag=
e feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]<=
/div><div>gnome-keyring-2.32.1: Package version for package gnome-keyring-l=
ocale-ro went backwards which would break package feeds from (0:2.32.1-r12.=
40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.3=
2.1: Package version for package gnome-keyring-locale-ru went backwards whi=
ch would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [vers=
ion-going-backwards]</div><div>gnome-keyring-2.32.1: Package version for pa=
ckage gnome-keyring-locale-rw went backwards which would break package feed=
s from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><=
div>gnome-keyring-2.32.1: Package version for package gnome-keyring-locale-=
si went backwards which would break package feeds from (0:2.32.1-r12.40 to =
0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: P=
ackage version for package gnome-keyring-locale-sk went backwards which wou=
ld break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-go=
ing-backwards]</div><div>gnome-keyring-2.32.1: Package version for package =
gnome-keyring-locale-sl went backwards which would break package feeds from=
 (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gn=
ome-keyring-2.32.1: Package version for package gnome-keyring-locale-sq wen=
t backwards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32=
.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package=
 version for package gnome-keyring-locale-sr+latin went backwards which wou=
ld break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-go=
ing-backwards]</div><div>gnome-keyring-2.32.1: Package version for package =
gnome-keyring-locale-sr went backwards which would break package feeds from=
 (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gn=
ome-keyring-2.32.1: Package version for package gnome-keyring-locale-sv wen=
t backwards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32=
.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package=
 version for package gnome-keyring-locale-ta went backwards which would bre=
ak package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-ba=
ckwards]</div><div>gnome-keyring-2.32.1: Package version for package gnome-=
keyring-locale-te went backwards which would break package feeds from (0:2.=
32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-ke=
yring-2.32.1: Package version for package gnome-keyring-locale-th went back=
wards which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12=
.0) [version-going-backwards]</div><div>gnome-keyring-2.32.1: Package versi=
on for package gnome-keyring-locale-tr went backwards which would break pac=
kage feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backward=
s]</div><div>gnome-keyring-2.32.1: Package version for package gnome-keyrin=
g-locale-uk went backwards which would break package feeds from (0:2.32.1-r=
12.40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-=
2.32.1: Package version for package gnome-keyring-locale-vi went backwards =
which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [v=
ersion-going-backwards]</div><div>gnome-keyring-2.32.1: Package version for=
 package gnome-keyring-locale-xh went backwards which would break package f=
eeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]</di=
v><div>gnome-keyring-2.32.1: Package version for package gnome-keyring-loca=
le-zh-cn went backwards which would break package feeds from (0:2.32.1-r12.=
40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.3=
2.1: Package version for package gnome-keyring-locale-zh-hk went backwards =
which would break package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [v=
ersion-going-backwards]</div><div>gnome-keyring-2.32.1: Package version for=
 package gnome-keyring-locale-zh-tw went backwards which would break packag=
e feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-backwards]<=
/div><div>gnome-keyring-2.32.1: Package version for package gnome-keyring-s=
taticdev went backwards which would break package feeds from (0:2.32.1-r12.=
40 to 0:2.32.1-r12.0) [version-going-backwards]</div><div>gnome-keyring-2.3=
2.1: Package version for package gnome-keyring went backwards which would b=
reak package feeds from (0:2.32.1-r12.40 to 0:2.32.1-r12.0) [version-going-=
backwards]</div><div>libupnp-1.6.21: Package version for package libupnp-db=
g went backwards which would break package feeds from (0:1.8.2-r0.0 to 0:1.=
6.21-r0.2) [version-going-backwards]</div><div>libupnp-1.6.21: Package vers=
ion for package libupnp-dev went backwards which would break package feeds =
from (0:1.8.2-r0.0 to 0:1.6.21-r0.2) [version-going-backwards]</div><div>li=
bupnp-1.6.21: Package version for package libupnp-doc went backwards which =
would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2) [version-goi=
ng-backwards]</div><div>libupnp-1.6.21: Package version for package libupnp=
-locale went backwards which would break package feeds from (0:1.8.2-r0.0 t=
o 0:1.6.21-r0.2) [version-going-backwards]</div><div>libupnp-1.6.21: Packag=
e version for package libupnp-staticdev went backwards which would break pa=
ckage feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2) [version-going-backwards]<=
/div><div>libupnp-1.6.21: Package version for package libupnp went backward=
s which would break package feeds from (0:1.8.2-r0.0 to 0:1.6.21-r0.2) [ver=
sion-going-backwards]</div><div><br></div><div><br></div><div>count: 3<span=
 style=3D"white-space:pre">	</span>issue: host-user-contaminated</div><div>=
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ru-ru/usr/lib/loc=
ale/ru_RU/LC_CTYPE is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]=
</div><div>qt5-creator-3.5.1: qt5-creator: /qt5-creator/usr/lib/qt5/qtcreat=
or/plugins/libPythonEditor.so is owned by uid 3004, which is the same as th=
e user running bitbake. This may be due to host contamination [host-user-co=
ntaminated]</div><div>qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: qtdeclarat=
ive: /qtdeclarative-qmlplugins/usr/lib/qt5/qml/QtQuick.2/qmldir is owned by=
 uid 3004, which is the same as the user running bitbake. This may be due t=
o host contamination [host-user-contaminated]</div><div><br></div><div><br>=
</div><div>count: 0<span style=3D"white-space:pre">	</span>issue: installed=
-vs-shipped</div><div><br></div><div><br></div><div>count: 0<span style=3D"=
white-space:pre">	</span>issue: unknown-configure-option</div><div><br></di=
v><div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>issue=
: symlink-to-sysroot</div><div><br></div><div><br></div><div>count: 0<span =
style=3D"white-space:pre">	</span>issue: invalid-pkgconfig</div><div><br></=
div><div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>iss=
ue: pkgname</div><div><br></div><div><br></div><div>count: 0<span style=3D"=
white-space:pre">	</span>issue: ldflags</div><div><br></div><div><br></div>=
<div>count: 0<span style=3D"white-space:pre">	</span>issue: compile-host-pa=
th</div><div><br></div><div><br></div><div><br></div><div>=3D=3D Tested cha=
nges (not included in master yet) - bitbake =3D=3D</div><div>latest upstrea=
m commit:=C2=A0</div><div>567f2cf server/process: ensure server failure log=
 is limited to current session</div><div>not included in master yet:=C2=A0<=
/div><div>3ec2af2 world-image: add extra target</div><div>8eebabe fetch2: A=
llow Fetch.download() to warn instead of error</div><div><br></div><div>=3D=
=3D Tested changes (not included in master yet) - openembedded-core =3D=3D<=
/div><div>latest upstream commit:=C2=A0</div><div>8fe9fb4 python*native.bbc=
lass: suppress user site dirs</div><div>not included in master yet:=C2=A0</=
div><div>0d7ac07 report-error: Allow to upload reports automatically</div><=
div>20d6101 buildhistory.bbclass: metadata-revs show repo parent</div><div>=
202fb4c metadata-revs: provide more information</div><div>b3500a7 qemux86: =
Add identical qemux86copy variant for tests</div><div>0de46b0 reproducible_=
build.bbclass: initial support for binary reproducibility</div><div>d407a03=
 cpio: provide cpio-replacement-native</div><div>c872fa6 image_types.bbclas=
s: improve cpio image reproducibility</div><div>3fcc641 rootfs-postcommands=
.bbclass: support binary reproducibility</div><div>a132f03 sstate.bbclass: =
Do not cause build failures due to setscene errors</div><div>198ea0e insane=
.bbclass: Add do_qa_pseudo function to check for common errors listed in ps=
eudo.log</div><div>3283a1c insane.bbclass: do_qa_pseudo: don&#39;t trigger =
error from &#39;^inode mismatch&#39;</div><div>beb394d insane.bbclass: do_q=
a_pseudo: show parts of pseudo.log in console</div><div><br></div><div>=3D=
=3D Tested changes (not included in master yet) - meta-openembedded =3D=3D<=
/div><div>latest upstream commit:=C2=A0</div><div>4a45235 opencv: Fix build=
 with clang</div><div>not included in master yet:=C2=A0</div><div>df98f41 d=
nsmasq: disable the service by default</div><div>fb19f49 openconnect: fix p=
arallel compilation failure</div><div>9dafbb4 autofs: Fix build with musl</=
div><div>6e742d3 yp-tools: Upgrade to 4.2.2</div><div>ef15059 vim: Remove x=
fce vim bbappend</div><div>6fff604 leveldb: Fix build with clang</div><div>=
2864d93 klibc: Edit out gcc hardcoding in do_compile</div><div>d20ab2d klib=
c.bbclass: Use forcevariable override to define flags</div><div>dceaa50 kli=
bc.bbclass: Add -mfloat-abi on arm</div><div>2e68338 smbnetfs: delete black=
listed</div><div>3f06336 system-setup-keyboard: delete blacklisted</div><di=
v>14a15c0 python-jsonschema, python3-jsonschema: add vcversioner-native dep=
endency</div><div>a9d38f7 v4l-utils: added missing dependency on udev</div>=
<div>2b489fd ipvsadm: Add HOMEPAGE info into recipe file.</div><div>cf39ab8=
 libidl: Add HOMEPAGE info into recipe file.</div><div>4fcda20 lvm2: Add HO=
MEPAGE info into recipe file.</div><div>9e601b0 tcpdump: update to 4.9.2 to=
 fix CVEs</div><div>3dbb500 debsums: inherit gettext</div><div>b972817 prot=
obuf: update to 3.4.0</div><div>3e1748f protobuf-c: update to 1.3.0</div><d=
iv>a8cf4de libgpiod: bump version to v0.3.1</div><div>e9a3fd9 networkmanage=
r: Add HOMEPAGE info into recipe file.</div><div>6a0d564 samba: Add HOMEPAG=
E info into recipe file.</div><div>db01ddf squid: upgrade to 3.5.27</div><d=
iv>8b48a16 iproute2: Move tipc enablement to oe-core</div><div>1911f84 libm=
nl: Move to oe-core</div><div>f02eec7 flatbuffers: add version 1.7.1</div><=
div>9d4b685 capnproto: add version 0.6.1</div><div>a18db12 libupnp: Add rec=
ipe for version 1.8.2</div><div>90be7f5 gerbera: clean recipe</div><div>626=
55bc libjs-sizzle: Add HOMEPAGE info into recipe file.</div><div>6c0f9c2 li=
blockfile: Add HOMEPAGE info into recipe file.</div><div>87d004b daemontool=
s: Add HOMEPAGE info into recipe file.</div><div>346b2a5 fbset: Add HOMEPAG=
E info into recipe file.</div><div>2fdb314 libndp: Add HOMEPAGE info into r=
ecipe file.</div><div>a96fc97 gnome-keyring: Resolve conflict with gcr 3 an=
d gold linking error</div><div>34bb6e5 drbd-utils: remove 0001-drbd-8.4.4-d=
rbd-tools-only-rmmod-if-DRBD-is-a-module.patch</div><div>864fb16 ceres-solv=
er: add new recipe</div><div>60b9eb6 libnih: Add HOMEPAGE info into recipe =
file.</div><div>20eeac7 libtdb: Add HOMEPAGE info into recipe file.</div><d=
iv>84172c0 mailcap: Add HOMEPAGE info into recipe file.</div><div>7454d72 m=
ozjs: Add HOMEPAGE info into recipe file.</div><div>47bbfc9 numactl: Add HO=
MEPAGE info into recipe file.</div><div>ad97869 orbit2: Add HOMEPAGE info i=
nto recipe file.</div><div>f3469c8 sgpio: Add HOMEPAGE info into recipe fil=
e.</div><div>50a3814 stunnel: Add HOMEPAGE info into recipe file.</div><div=
>d260749 leveldb: disable parallelism</div><div><br></div><div>=3D=3D Teste=
d changes (not included in master yet) - meta-qt5 =3D=3D</div><div>latest u=
pstream commit:=C2=A0</div><div>743b3b9 qtbase-native: Force use of built-i=
n pcre</div><div>not included in master yet:=C2=A0</div><div><br></div><div=
>=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D</=
div><div>latest upstream commit:=C2=A0</div><div>972cab7 gnome-settings-dae=
mon: remove the bbappend for removed recipe</div><div>not included in maste=
r yet:=C2=A0</div><div>5fcf848 chromium: hide textrel QA issues which are t=
here for ages</div></div>

--f403045f903e2f33b5055941a10a--
