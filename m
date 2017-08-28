Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id B9C9560938;
	Mon, 28 Aug 2017 08:40:16 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id s199so14036479vke.1;
	Mon, 28 Aug 2017 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=LjFudcJVSORDaf7uEnhbmfF2ozmL6DUg161kiZaQtOU=;
	b=AXSAhFOQ4L+VyPU4KC3E0st88n3yHY1+ym2aa37ZoruHwG736JW9OkBYu9L06V+z09
	wfpwYuqsQhARImHvR7NFrN+DuGqHdswZKfc54Z9Dxbwwrsddbs8PD1m9D4kAkd2yTeOS
	8v+PU+TYXpvve9PCrGNxY+HBAeNCiWKVeVjhVVQqerH7fYl3sYaru0QzBsZgOLegVx3l
	0hXH1OU8rRDcFJ2T++Yfp4ceT55vf6r9OuZjQU0OBBLnbe3JPT8j050dWlvUb+ACOk98
	0s+AgbB/lhURhbtcOpyps6umXy6OMIw4OMMDYcxkxZ6m+F4HpRwG+VDV+cQYkRxp75Fc
	GXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LjFudcJVSORDaf7uEnhbmfF2ozmL6DUg161kiZaQtOU=;
	b=cZmuCBvdkirOgXheuM8k20SFsGtK26b2mZm/yUmoUbE0LR+8XMckVUK9lot73HLzFg
	oQ5SJlNo7kuiQ+df1c5+iZRH/QXO0/uInRm+BLAl+c14r0RrSfSGNRfKwll3Xql5FC57
	a16722uZhNVxq7hfKeh7SkQvKgtuJkAasQDO6ycV+GhLZiFGxcUeRrlVIN9kBe5lV3ht
	KTibHuubn/lVkvYSzAhw2eNd6qwwA8S7brNrndeyC7OQhbYmsseTVtz+W80eFQLW14C0
	vfgepJcc3y+l1OTTb0nJnNIMZhB2iuXS/LQ3tc5FCc1tMvk7z9topgWDkDkMTfKUNhRj
	F7Rw==
X-Gm-Message-State: AHYfb5gEILKFNd5lZs0Q8qhKrwkPCsQIb8JFgd2XktuomxVRvCbAkzmo
	ZvjBUVM9jIuRJgx0GrwFdwXvymPUHXpF
X-Received: by 10.31.140.77 with SMTP id o74mr3464154vkd.1.1503909614273; Mon,
	28 Aug 2017 01:40:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Mon, 28 Aug 2017 01:40:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 28 Aug 2017 10:40:13 +0200
Message-ID: <CA+chaQcTA-CFVHj0ycyyc2JCn5O1cLeMGrrFB=VLkL2mipvcvw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-08-26
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
X-List-Received-Date: Mon, 28 Aug 2017 08:40:17 -0000
Content-Type: multipart/alternative; boundary="001a11425a32554ae20557cc3e02"

--001a11425a32554ae20557cc3e02
Content-Type: text/plain; charset="UTF-8"

This one is with qt 5.9.0

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date     !!colspan='3'|Failed tasks    !!|Signatures  !!colspan='14'|QA
!!Comment
|-
|| ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped ||libdir
||textrel ||build-deps ||file-rdeps ||version-going-backwards
||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option
||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
||compile-host-path ||
|-
||2017-08-26 ||9 ||10 ||7 ||4 ||0 ||0 ||3 ||0 ||2 ||232 ||2 ||0 ||0 ||0 ||0
||0 ||0 ||0 ||
|}

== Failed tasks 2017-08-26 ==

INFO: jenkins-job.sh-1.8.27 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170827_223414.log

=== common (6) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    *
meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.26.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb:
do_package_qa
    *
meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb:
do_compile

=== common-x86 (1) ===
    *
meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb:
do_compile

=== qemuarm (3) ===
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb:
do_compile
    *
meta-openembedded/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb:
do_compile

=== qemux86 (2) ===
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (26) ===
{| class=wikitable
|-
|| qemuarm || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170827_015147.log/
|| http://errors.yoctoproject.org/Errors/Build/45890/
|-
|| qemux86 || 10 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170826_080521.log/
|| http://errors.yoctoproject.org/Errors/Build/45886/
|-
|| qemux86_64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170826_231146.log/
|| http://errors.yoctoproject.org/Errors/Build/45891/
|}

=== PNBLACKLISTs (1) ===
=== QA issues (239) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||build-deps
|-
||0 ||compile-host-path
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
||232 ||version-going-backwards
|-
||2 ||file-rdeps
|-
||2 ||host-user-contaminated
|-
||3 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (4) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170827_050201.log/
    * ERROR: 4 issues were found in these recipes: android-tools
libmodule-build-perl

    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 1 errors found in
signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 1 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: android-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503846121/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: libmodule-build-perl different signature for task
do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503846121/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: libmodule-build-perl different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503846121/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: libmodule-build-perl different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503846121/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 4 issues were found in these recipes: android-tools
libmodule-build-perl


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
link against sctp_connectx symbol", '', d)}"
meta-qt5:
meta-smartphone:
meta-webos-ports:
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


count: 3 issue: textrel
chromium-54.0.2810.2: ELF binary
'/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
has relocations in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary
'/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
has relocations in .text [textrel]
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 2 issue: file-rdeps
corosync-2.4.2: /usr/share/corosync/corosync contained in package corosync
requires /tmp/hosttools/bash, but no providers found in RDEPENDS_corosync?
[file-rdeps]
corosync-2.4.2: /usr/share/corosync/corosync-notifyd contained in package
corosync requires /tmp/hosttools/bash, but no providers found in
RDEPENDS_corosync? [file-rdeps]


count: 232 issue: version-going-backwards
abiword-3.0.2: Package version for package abiword-clipart went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-dbg went backwards which
would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-dev went backwards which
would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-doc went backwards which
would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-locale went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-meta went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-applix went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-babelfish went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-bmp went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-clarisworks went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-collab went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-command went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-docbook went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-eml went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-epub went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-freetranslation
went backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-garble went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-gdict went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-gimp went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-google went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-hancom went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-hrtext went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-iscii went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-kword went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-latex went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-loadbindings went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-mathview went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-mht went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-mif went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-mswrite went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-opendocument went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-openwriter went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-openxml went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-opml went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-paint went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-passepartout went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-pdb went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-pdf went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-presentation went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-s5 went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-sdw went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-t602 went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-urldict went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-wikipedia went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-wml went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-plugin-xslfo went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-staticdev went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-strings went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword-systemprofiles went
backwards which would break package feeds from (0:3.0.2-r0.6 to
0:3.0.2-r0.0) [version-going-backwards]
abiword-3.0.2: Package version for package abiword-templates went backwards
which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
abiword-3.0.2: Package version for package abiword went backwards which
would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-dbg
went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-dev
went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-doc
went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-ca went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-cs went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-da went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-de went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-el went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-en-gb went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-es went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-et went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-eu went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-fi went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-fr went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-gl went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-he went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-hu went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-id went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-it went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-ja went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-ko went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-nb went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-nl went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-pa went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-pl went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-pt-br went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-ro went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-ru went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-sk went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-sl went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-sv went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-th went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-zh-cn went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-locale-zh-tw went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package
dates-staticdev went backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates went
backwards which would break package feeds from
(0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-dbg went backwards which would break package
feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-dev went backwards which would break package
feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-doc went backwards which would break package
feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-am went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ar went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ast went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-as went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-az went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-be went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-bg went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-bn-in went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-bn went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-bs went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ca+valencia went backwards which would
break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ca went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-cs went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-cy went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-da went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-de went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-dz went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-el went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-en-au went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-en-ca went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-en-gb went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-en+shaw went backwards which would
break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-eo went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-es went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-et went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-eu went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-fa went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-fi went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-fr went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ga went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-gl went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-gu went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-he went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-hi went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-hr went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-hu went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-id went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-is went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-it went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ja went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ka went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-kn went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ko went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ku went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-lt went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-lv went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-mai went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-mk went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ml went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-mn went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-mr went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ms went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-nb went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ne went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-nl went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-nn went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-oc went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-or went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-pa went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-pl went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-pt-br went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-pt went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ro went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ru went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-rw went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-si went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sk went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sl went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sq went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sr+latin went backwards which would
break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sr went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-sv went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ta went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-te went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-th went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-tr went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-ug went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-uk went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-vi went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-wa went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-xh went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-zh-cn went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-zh-hk went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-locale-zh-tw went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server-staticdev went backwards which would break
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package evolution-data-server went backwards which would break package
feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libcamel-dev went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libcamel went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libebook-dev went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libebook went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libecal-dev went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libecal went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedata-book-dev went backwards which would break package feeds
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedata-book went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedata-cal-dev went backwards which would break package feeds
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedata-cal went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedataserver-dev went backwards which would break package feeds
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedataserverui-dev went backwards which would break package feeds
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedataserverui went backwards which would break package feeds
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
package libedataserver went backwards which would break package feeds from
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
[version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-dbg went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-dev went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-doc went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-locale went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-staticdev went backwards which would break package
feeds from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl went backwards which would break package feeds from
(0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-dbg went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-dbg went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-dev went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-dev went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-doc went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-doc went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-dev went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-dev went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-staticdev went backwards which would break package
feeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples-staticdev went backwards which would break package
feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-examples went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-locale went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-locale went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-mkspecs went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-mkspecs went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-plugins-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-plugins-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-plugins went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-plugins went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmldesigner went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmldesigner went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmlplugins-dbg went backwards which would break package
feeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmlplugins-dbg went backwards which would break package
feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmlplugins went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-qmlplugins went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-staticdev went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-staticdev went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-tools-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-tools-dbg went backwards which would break package feeds
from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-tools went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects-tools went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package
qtremoteobjects went backwards which would break package feeds from
(0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0)
[version-going-backwards]


count: 2 issue: host-user-contaminated
qt5-creator-3.5.1: qt5-creator:
/qt5-creator/usr/lib/qt5/qtcreator/plugins/libIos.so is owned by uid 3004,
which is the same as the user running bitbake. This may be due to host
contamination [host-user-contaminated]
qt5-creator-3.5.1: qt5-creator:
/qt5-creator/usr/lib/qt5/qtcreator/plugins/libQmlProjectManager.so is owned
by uid 3004, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
8a60106 main: Attempt to gain bitbake.lock rather than just waiting
not included in master yet:
a064963 world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
a8b89b3 default-providers: Add entries for pkgconfig (due to pkg-conf being
added)
not included in master yet:
338cc89 report-error: Allow to upload reports automatically
f492b98 buildhistory.bbclass: metadata-revs show repo parent
eb590e9 metadata-revs: provide more information
7860d90 qemux86: Add identical qemux86copy variant for tests
9fdb66a reproducible_build.bbclass: initial support for binary
reproducibility
097476c cpio: provide cpio-replacement-native
c3b689d image_types.bbclass: improve cpio image reproducibility
cbd025c rootfs-postcommands.bbclass: support binary reproducibility
c0f57c9 insane.bbclass: write QA issues to log file only when they are in
ERROR_QA or WARN_QA

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
ac2a6d2 json-spirit: Add -latomic to LDFLAGS
not included in master yet:
6ff499b dnsmasq: disable the service by default
ca0e943 rdate: Fix build with hardening
7e3d8e4 strongswan: Include stdint.h for uintptr_t
217431e netkit-rpc: Fix build with hardening flags
f3819cc netkit-telnet: Fix build with hardening
048e071 ncftp: Upgrade to 3.2.6
61495a9 autofs: Add build dependency on libnsl2
96e606d openhpi: Fix build on 64bit platforms e.g. aarch64
7feddb1 security_flags.inc: Delete
a4723a6 pptp-linux: Upgrade to 1.9.0
ab4774e ebtables: replace ebtables-save perl script with bash rewrite
3a96b76 pimd: Upgrade to 2.3.2
aa43496 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
92bc7d2 rdate: Define logwtmp if libc != glibc
a04b53f netkit-ftp: Include sys/types.h for u_long definition
feb1653 postfix: Disable nis support on musl
93ee634 zeroconf: Fix build with musl
163c868 netperf: change SRC_URI to git repository
4c2b4c4 ippool: Fix build errors found with hardening flags
5ebba48 openflow: Fix build with musl
610e392 xl2tpd: Update to 1.3.9
53982a0 c-ares: update 1.12.0 -> 1.13.0
b101101 radvd: 2.14 -> 2.17
9a7309d libesmtp: Fix config.h define for snprintf detection
b9b2b01 drbd: Add recipe
b7b27a5 net-snmp: fix engineBoots value on SIGHUP
f8559af openl2tp: add LGPL-2.1 license
ce8ed9a openl2tp: add init script and systemd support
4f97a6c ntop: add new recipe
21479a9 libtdb: update 1.3.12 -> 1.3.14
d946a42 ndisc6: Upgrade to 1.0.3
f3dd13e memcached: Update to 1.5.0
3436c8e tcpdump: remove unnecessary patch
209a90c squid: Add missing dependencies on openssl expat and libxml2
5061e4f postfix: Upgrade to 3.2.2
33dff9b mpv: Update to version 0.26.0.
cc37aef python3-blivet: add recipe 2.2.0
ad94afe python3-blivetgui: add recipe 2.1.5
47fb79b librcf: Add -latomic to LDFLAGS
6599b98 upower: update 0.99.4 -> 0.99.5
b720216 geany: update 1.30.1 -> 1.31
29805cb geany-plugins: update 1.30 -> 1.31
c94d8e7 python-wrapt: update to version 1.10.11
69a7670 python-cmd2: update to version 0.7.6
353a2ab python-sqlalchemy: update to version 1.1.13
363c33c python-pytest: update to version 3.2.1
38c6ecb python-pyro4: update to version 4.61
07c7d83 php: move to version 7.1.8 from 7.1.7
03eaf98 gsoap: Upgrade to 2.8.51
16a43c3 caps: Mark ARCH empty
5d25280 mailcap: upgrade to 2.1.48
17dbbb3 mailx: Force mailx to build with openssl10
ac85ad1 php: disable this version by default
7b9dfb7 freeradius: Upgrade to 3.0.15
4978e89 tcpdump: update to 4.9.1 to fix CVE-2017-11108
a99294b vlock: add new recipe
1e2f4b9 fontforge: update to 20170731 to fix CVEs
5567b2a wireshark: 2.2.7 -> 2.2.8
632f250 start-stop-daemon: Only create a link in ${base_sbindir} if
necessary
d8811b9 python-chardet: Extend to native and nativesdk
ebd41b0 openobex: disable building documentation
ac15d80 openwsman: rename to 2.6.3
da135d6 iproute2: add bbappend for supporting tipc tool
cebccb3 tipcutils: add runtime dependency for iproute2-tipc
f920d63 mariadb: 5.5.55 -> 5.5.57
64ee547 rsyslog: fix CVE-2017-12588
cc02e10 rsyslog: install logrotate configuration file into correct location
56d6e0a libvpx: upgrade to 1.6.1
a4ee06b quagga: update to 1.2.1
961abc1 gd: update to 2.2.4
cb686c3 efivar: Upgrade to 0.31
3706ca2 openvpn: 2.4.2 -> 2.4.3
de9860c python*-ptyprocess: add v0.5.2
fab2dd5 python*-pexpect: add v4.2.1
543455e ipsec-tools: fix CVE-2016-10396
6c775f9 multipath-tools: add bash to RDEPENDS
5141a9b python3-pykickstart: tweak shebang to python3
52f0eb1 xmlrpc-c: add perl to RDEPENDS
92d6a0f phpmyadmin: upgrade to 4.7.3
3716024 pcsc-lite: Update to 1.8.22
d3af646 python-requests: Update to version 2.18.4
e3057cc sthttpd: update to 2.27.1
c9f10ab glibmm: fix perl path
3a8e526 postgresql: update to 9.4.13
4c2ea5a Dhrystone: add recipe 2.1
c2a4bdf makedumpfile: update to 1.6.2
6ce999e mozjs: customize HOST_CFLAGS
f3e09bd adduser: use get_perl_version instead of PERLVERSION
a17cffb iperf3: 3.1.3 -> 3.2
40916b0 webmin: add systemd service file
598c29c python-markupsafe: Extend to build native version too
a7f2d3a vim: update to 8.0.0983
9756937 python-m2crypto: Upgrade to 0.26.0
87f7ea5 gnulib: upgrade to 2017-08-20.18
0c7c8fb collectd: 5.7.1 -> 5.7.2
54b071b netcf: upgrade to latest 0.2.8
0c0ef1d tftp-hpa: add systemd unit files
d1f41a0 gperftools: fixup HOMEPAGE
8f5ed1d openconnect: fix parallel compilation failure
5d15b1c gnome-keyring: Fix compatibility with gcr 3 in oe-core
863d51e openconnect: upgrade to 7.08
4dd9884 gflags: add runtime dependency on bash
f3fc0cc logcheck: update to 1.3.18 and move to meta-perl
3815615 python-pycrypto: Security fix CVE-2013-7459
3d85015 logwarn: set correct paths and add missing dependency
c2dbb9b openldap: fix native LDFLAGS build error
166bf62 xorg-fonts-100dpi: unblacklist recipe
a60ac1c recipes: remove blacklisted recipes
69529c6 meta-ruby: remove this now pretty empty layer
61e8314 meta-efl: remove this now pretty empty layer
07ed328 meta-systemd: remove this now pretty empty layer
7b0f2ca meta-gpe: remove this now pretty empty layer
73eccec imagemagick: 7.0.5 -> 7.0.6_9
524e123 libmodule-build-perl: upgrade to v0.4224 and fix qa error
05db9b0 enscript ndisc6: specify target location of perl
51c6073 python*-pylint: upgrade to v1.7.2 and fix qa error
75ba188 python*-astroid: use SPDX compatible license identifier
5332d4f mpich: Define PERL variable and pass to configure
5c2bbb5 wireguard-tools: Add bash to rdeps
3b00593 enscript: Define PERL variable
9773412 udevil: Add missing rdep on bash
ac8a952 libbonobo: Pass PERL_PATH to do_configure
bbcaa21 openl2tp: Add bash to rdeps
2e5566d python-paho-mqtt: licensing improvements
535065f python-paho-mqtt: fix downloading during do_compile
cd3949d libhugetlbfs: Define HUGETLB_LDSCRIPT_PATH
1a7fdc6 efibootmgr: Upgrade to 0.15
c814630 efivar: Fix build with clang
155a8a1 evolution-data-server: Fix build with clang
aeabfe1 wvstreams: Fix parallel build
f7c8d6b squid: Disable format-truncation warning only with gcc
95ba434 squid: Fix QA errors about wrong perl interpreter
4fb1f38 libreport: fix typo of SRC_URI
652998f python-html5lib: add Python3 support
a6fbb22 python-webencodings: add Python3 support
da14eb2 python-beautifulsoup4: add new recipe for both python2 and python3
c01288b multipath-tools: RDEPEND on bash
ca1e184 wireguard: Upgrade to 20170810 snapshot

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
8960831 qwt-qt5.inc: fix QA warning
not included in master yet:
6e9892a qtbase: add ptest
d53382f qt5-ptest: fix build with yocto < 2.3 (pyro)
9042969 qtbase: Fix ptests with clang
0b41b62 qtbase: Use sched_yield instead of pthread_yield
17d94b7 quazip: update to 0.7.3 and add missing metadata
3963daa qtwebkit: Backport a patch to fix build with icu-59
7efcea9 qt3d: Fix build with clang
c74e5b8 qtbase: remove qtbase-native from DEPENDS
1619723 gstreamer1.0-plugins-bad: add qt5 packageconfig
d82317c qtbase: refresh the patches
246ec7b qtwebengine: refresh patches
142f888 qt3d: refresh patches
3522d3d qtbase: fix Krogoth build regression from efa8aaf
d9f4b6e meta-toolchain-qt5: don't rely on COREBASE/LICENSE
209e7e6 qtwebengine: disable SECURITY_STRINGFORMAT to fix the build
648f7b0 qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation,
qtwayland: disable gold to work around binutils bug
969f1f8 Upgrade to Qt 5.9.0
a0b2220 qtwebengine: add a fix for building demobrowser without printing
support
2d14d99 qt: refresh remaining patches and add links to meta-qt5 repos
9c7507e qt: upgrade to latest revision in 5.9 branch
b7ae79a qtwebengine: fix build with glibc-2.26
c4c70e7 qtwebengine: update 0004-Force-host-toolchain-configuration.patch
2684299 qtwebengine: add patch for long paths

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe

--001a11425a32554ae20557cc3e02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This one is with qt 5.9.0<div><br></div><div><div><a href=
=3D"http://www.openembedded.org/wiki/Bitbake_World_Status">http://www.opene=
mbedded.org/wiki/Bitbake_World_Status</a></div><div><br></div><div>=3D=3D N=
umber of issues - stats =3D=3D</div><div>{| class=3D&#39;wikitable&#39;</di=
v><div>!|Date<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre"=
>		</span> =C2=A0 =C2=A0 !!colspan=3D&#39;3&#39;|Failed tasks<span class=3D=
"gmail-Apple-tab-span" style=3D"white-space:pre">			</span> =C2=A0 =C2=A0!!=
|Signatures<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	=
	</span> =C2=A0!!colspan=3D&#39;14&#39;|QA !!Comment</div><div>|-</div><div=
>||<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span>=
||qemuarm<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</=
span>||qemux86<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre=
">	</span>||qemux86_64<span class=3D"gmail-Apple-tab-span" style=3D"white-s=
pace:pre">	</span>||all <span class=3D"gmail-Apple-tab-span" style=3D"white=
-space:pre">	</span>||already-stripped<span class=3D"gmail-Apple-tab-span" =
style=3D"white-space:pre">	</span>||libdir<span class=3D"gmail-Apple-tab-sp=
an" style=3D"white-space:pre">	</span>||textrel<span class=3D"gmail-Apple-t=
ab-span" style=3D"white-space:pre">	</span>||build-deps<span class=3D"gmail=
-Apple-tab-span" style=3D"white-space:pre">	</span>||file-rdeps<span class=
=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>||version-going=
-backwards<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	<=
/span>||host-user-contaminated<span class=3D"gmail-Apple-tab-span" style=3D=
"white-space:pre">	</span>||installed-vs-shipped<span class=3D"gmail-Apple-=
tab-span" style=3D"white-space:pre">	</span>||unknown-configure-option<span=
 class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>||symlink=
-to-sysroot<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	=
</span>||invalid-pkgconfig<span class=3D"gmail-Apple-tab-span" style=3D"whi=
te-space:pre">	</span>||pkgname<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>||ldflags<span class=3D"gmail-Apple-tab-span" =
style=3D"white-space:pre">	</span>||compile-host-path<span class=3D"gmail-A=
pple-tab-span" style=3D"white-space:pre">	</span>||<span class=3D"gmail-App=
le-tab-span" style=3D"white-space:pre">	</span></div><div>|-</div><div>||20=
17-08-26<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</s=
pan>||9<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</sp=
an>||10<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</sp=
an>||7<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</spa=
n>||4<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||3<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||2<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||232<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</sp=
an>||2<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</sp=
an>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</sp=
an>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</sp=
an>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</sp=
an>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</sp=
an>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</sp=
an>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</sp=
an>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</sp=
an>||<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span=
></div><div>|}</div><div><br></div><div>=3D=3D Failed tasks 2017-08-26 =3D=
=3D</div><div><br></div><div>INFO: jenkins-job.sh-1.8.27 Complete log avail=
able at <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log=
.report.20170827_223414.log">http://logs.nslu2-linux.org/buildlogs/oe/world=
/rocko/log.report.20170827_223414.log</a></div><div><br></div><div>=3D=3D=
=3D common (6) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-browser/recipes-moz=
illa/firefox/firefox_45.9.0esr.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta=
-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.b=
b:do_compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-networking/re=
cipes-daemons/squid/squid_3.5.26.bb:do_compile</div><div>=C2=A0 =C2=A0 * me=
ta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.=
4.20.3+svn502.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/met=
a-oe/recipes-extended/corosync/corosync_2.4.2.bb:do_package_qa</div><div>=
=C2=A0 =C2=A0 * meta-openembedded/meta-python/recipes-devtools/python/pytho=
n-matplotlib_1.1.0.bb:do_compile</div><div><br></div><div>=3D=3D=3D common-=
x86 (1) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recip=
es-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb:do_compile</div><div=
><br></div><div>=3D=3D=3D qemuarm (3) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * m=
eta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1=
.r37.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/reci=
pes-support/mysql/mariadb_5.5.57.bb:do_compile</div><div>=C2=A0 =C2=A0 * me=
ta-openembedded/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.=
bb:do_compile</div><div><br></div><div>=3D=3D=3D qemux86 (2) =3D=3D=3D</div=
><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-support/mongodb/mon=
godb_git.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-qt5/recipes-qt/qt5/qt=
webengine_git.bb:do_compile</div><div><br></div><div>=3D=3D=3D qemux86_64 (=
0) =3D=3D=3D</div><div><br></div><div>=3D=3D=3D Number of failed tasks (26)=
 =3D=3D=3D</div><div>{| class=3Dwikitable</div><div>|-</div><div>|| qemuarm=
 <span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>|| =
9<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span> ||=
 <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.=
qemuarm.20170827_015147.log/">http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/rocko/log.world.qemuarm.20170827_015147.log/</a> || <a href=3D"http://err=
ors.yoctoproject.org/Errors/Build/45890/">http://errors.yoctoproject.org/Er=
rors/Build/45890/</a></div><div>|-</div><div>|| qemux86 <span class=3D"gmai=
l-Apple-tab-span" style=3D"white-space:pre">	</span>|| 10<span class=3D"gma=
il-Apple-tab-span" style=3D"white-space:pre">	</span> || <a href=3D"http://=
logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170826_08=
0521.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.q=
emux86.20170826_080521.log/</a> || <a href=3D"http://errors.yoctoproject.or=
g/Errors/Build/45886/">http://errors.yoctoproject.org/Errors/Build/45886/</=
a></div><div>|-</div><div>|| qemux86_64 <span class=3D"gmail-Apple-tab-span=
" style=3D"white-space:pre">	</span>|| 7<span class=3D"gmail-Apple-tab-span=
" style=3D"white-space:pre">	</span> || <a href=3D"http://logs.nslu2-linux.=
org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170826_231146.log/">htt=
p://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.2017=
0826_231146.log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Bu=
ild/45891/">http://errors.yoctoproject.org/Errors/Build/45891/</a></div><di=
v>|}</div><div><br></div><div>=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D</div><di=
v>=3D=3D=3D QA issues (239) =3D=3D=3D</div><div>{| class=3Dwikitable</div><=
div>!| Count<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">=
		</span>||Issue</div><div>|-</div><div>||0<span class=3D"gmail-Apple-tab-s=
pan" style=3D"white-space:pre">	</span>||already-stripped</div><div>|-</div=
><div>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</=
span>||build-deps</div><div>|-</div><div>||0<span class=3D"gmail-Apple-tab-=
span" style=3D"white-space:pre">	</span>||compile-host-path</div><div>|-</d=
iv><div>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	=
</span>||installed-vs-shipped</div><div>|-</div><div>||0<span class=3D"gmai=
l-Apple-tab-span" style=3D"white-space:pre">	</span>||invalid-pkgconfig</di=
v><div>|-</div><div>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-=
space:pre">	</span>||ldflags</div><div>|-</div><div>||0<span class=3D"gmail=
-Apple-tab-span" style=3D"white-space:pre">	</span>||libdir</div><div>|-</d=
iv><div>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	=
</span>||pkgname</div><div>|-</div><div>||0<span class=3D"gmail-Apple-tab-s=
pan" style=3D"white-space:pre">	</span>||symlink-to-sysroot</div><div>|-</d=
iv><div>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	=
</span>||unknown-configure-option</div><div>|-</div><div>||232<span class=
=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>||version-going=
-backwards</div><div>|-</div><div>||2<span class=3D"gmail-Apple-tab-span" s=
tyle=3D"white-space:pre">	</span>||file-rdeps</div><div>|-</div><div>||2<sp=
an class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>||host-=
user-contaminated</div><div>|-</div><div>||3<span class=3D"gmail-Apple-tab-=
span" style=3D"white-space:pre">	</span>||textrel</div><div>|}</div><div><b=
r></div><div><br></div><div><br></div><div>=3D=3D=3D Incorrect PACKAGE_ARCH=
 or sstate signatures (4) =3D=3D=3D</div><div><br></div><div>Complete log: =
<a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatu=
res.20170827_050201.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/ro=
cko/log.signatures.20170827_050201.log/</a></div><div>=C2=A0 =C2=A0 * ERROR=
: 4 issues were found in these recipes: android-tools libmodule-build-perl<=
/div><div><br></div><div>=C2=A0 =C2=A0 * ERROR: 1 errors found in signature=
s.qemux86.do_package_write_ipk.sigdata.log</div><div>=C2=A0 =C2=A0 * ERROR:=
 1 errors found in signatures.qemuarm.do_configure.sigdata.log</div><div>=
=C2=A0 =C2=A0 * ERROR: 1 errors found in signatures.qemuarm.do_populate_sys=
root.sigdata.log</div><div>=C2=A0 =C2=A0 * ERROR: 1 errors found in signatu=
res.qemuarm.do_package_write_ipk.sigdata.log</div><div><br></div><div>=C2=
=A0 =C2=A0 * ERROR: android-tools different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemux86</div><div>=C2=A0 =C2=A0 * =
ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1503846121/signatures.qemux86.do_package_write_ipk.sigdata.log</div><di=
v>=C2=A0 =C2=A0 * ERROR: libmodule-build-perl different signature for task =
do_configure.sigdata between qemux86copy and qemuarm</div><div>=C2=A0 =C2=
=A0 * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1503846121/signatures.qemuarm.do_configure.sigdata.log</div><div>=
=C2=A0 =C2=A0 * ERROR: libmodule-build-perl different signature for task do=
_populate_sysroot.sigdata between qemux86copy and qemuarm</div><div>=C2=A0 =
=C2=A0 * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc=
/sstate-diff/1503846121/signatures.qemuarm.do_populate_sysroot.sigdata.log<=
/div><div>=C2=A0 =C2=A0 * ERROR: libmodule-build-perl different signature f=
or task do_package_write_ipk.sigdata between qemux86copy and qemuarm</div><=
div>=C2=A0 =C2=A0 * ERROR: 1 errors found in /home/jenkins/oe/world/shr-cor=
e/tmp-glibc/sstate-diff/1503846121/signatures.qemuarm.do_package_write_ipk.=
sigdata.log</div><div>=C2=A0 =C2=A0 * ERROR: 4 issues were found in these r=
ecipes: android-tools libmodule-build-perl</div><div><br></div><div><br></d=
iv><div>PNBLACKLISTs:</div><div>openembedded-core/:</div><div>meta-browser:=
</div><div>meta-openembedded:</div><div>meta-networking/recipes-support/lks=
ctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools] ?=3D &quot;${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;BROK=
EN: fails to link against sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;=
</div><div>meta-qt5:</div><div>meta-smartphone:</div><div>meta-webos-ports:=
</div><div>PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-v=
irtualiazation which isn&#39;t included in my world builds&quot;</div><div>=
PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;</div><div>PNBLACKLIST[bigbuckbunny-480p] =3D &quo=
t;big and doesn&#39;t really need to be tested so much&quot;</div><div>PNBL=
ACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to be =
tested so much&quot;</div><div>PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big=
 and doesn&#39;t really need to be tested so much&quot;</div><div>PNBLACKLI=
ST[tearsofsteel-1080p] =3D &quot;big and doesn&#39;t really need to be test=
ed so much&quot;</div><div>PNBLACKLIST[build-appliance-image] =3D &quot;tri=
es to include whole downloads directory in /home/builder/poky :/&quot;</div=
><div><br></div><div><br></div><div>QA issues by type:</div><div>count: 0<s=
pan class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>issue:=
 already-stripped</div><div><br></div><div><br></div><div>count: 0<span cla=
ss=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>issue: libdir=
</div><div><br></div><div><br></div><div>count: 3<span class=3D"gmail-Apple=
-tab-span" style=3D"white-space:pre">	</span>issue: textrel</div><div>chrom=
ium-54.0.2810.2: ELF binary &#39;/tmp/work/i586-oe-linux/chromium/54.0.2810=
.2-r0/packages-split/chromium/usr/bin/chromium/chrome&#39; has relocations =
in .text [textrel]</div><div>chromium-wayland-53.0.2785.143: ELF binary &#3=
9;/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/=
chromium-wayland/usr/bin/chromium/chrome&#39; has relocations in .text [tex=
trel]</div><div>corosync-2.4.2: ELF binary &#39;/tmp/work/core2-64-oe-linux=
/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync&#39; has reloc=
ations in .text [textrel]</div><div><br></div><div><br></div><div>count: 0<=
span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>issue=
: build-deps</div><div><br></div><div><br></div><div>count: 2<span class=3D=
"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>issue: file-rdeps<=
/div><div>corosync-2.4.2: /usr/share/corosync/corosync contained in package=
 corosync requires /tmp/hosttools/bash, but no providers found in RDEPENDS_=
corosync? [file-rdeps]</div><div>corosync-2.4.2: /usr/share/corosync/corosy=
nc-notifyd contained in package corosync requires /tmp/hosttools/bash, but =
no providers found in RDEPENDS_corosync? [file-rdeps]</div><div><br></div><=
div><br></div><div>count: 232<span class=3D"gmail-Apple-tab-span" style=3D"=
white-space:pre">	</span>issue: version-going-backwards</div><div>abiword-3=
.0.2: Package version for package abiword-clipart went backwards which woul=
d break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-ba=
ckwards]</div><div>abiword-3.0.2: Package version for package abiword-dbg w=
ent backwards which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2=
-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package version f=
or package abiword-dev went backwards which would break package feeds from =
(0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-=
3.0.2: Package version for package abiword-doc went backwards which would b=
reak package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backw=
ards]</div><div>abiword-3.0.2: Package version for package abiword-locale w=
ent backwards which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2=
-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package version f=
or package abiword-meta went backwards which would break package feeds from=
 (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword=
-3.0.2: Package version for package abiword-plugin-applix went backwards wh=
ich would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-=
going-backwards]</div><div>abiword-3.0.2: Package version for package abiwo=
rd-plugin-babelfish went backwards which would break package feeds from (0:=
3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0=
.2: Package version for package abiword-plugin-bmp went backwards which wou=
ld break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-b=
ackwards]</div><div>abiword-3.0.2: Package version for package abiword-plug=
in-clarisworks went backwards which would break package feeds from (0:3.0.2=
-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: P=
ackage version for package abiword-plugin-collab went backwards which would=
 break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-bac=
kwards]</div><div>abiword-3.0.2: Package version for package abiword-plugin=
-command went backwards which would break package feeds from (0:3.0.2-r0.6 =
to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package=
 version for package abiword-plugin-docbook went backwards which would brea=
k package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backward=
s]</div><div>abiword-3.0.2: Package version for package abiword-plugin-eml =
went backwards which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.=
2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package version =
for package abiword-plugin-epub went backwards which would break package fe=
eds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div=
>abiword-3.0.2: Package version for package abiword-plugin-freetranslation =
went backwards which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.=
2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package version =
for package abiword-plugin-garble went backwards which would break package =
feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><d=
iv>abiword-3.0.2: Package version for package abiword-plugin-gdict went bac=
kwards which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) =
[version-going-backwards]</div><div>abiword-3.0.2: Package version for pack=
age abiword-plugin-gimp went backwards which would break package feeds from=
 (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword=
-3.0.2: Package version for package abiword-plugin-google went backwards wh=
ich would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-=
going-backwards]</div><div>abiword-3.0.2: Package version for package abiwo=
rd-plugin-hancom went backwards which would break package feeds from (0:3.0=
.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2:=
 Package version for package abiword-plugin-hrtext went backwards which wou=
ld break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-b=
ackwards]</div><div>abiword-3.0.2: Package version for package abiword-plug=
in-iscii went backwards which would break package feeds from (0:3.0.2-r0.6 =
to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package=
 version for package abiword-plugin-kword went backwards which would break =
package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]=
</div><div>abiword-3.0.2: Package version for package abiword-plugin-latex =
went backwards which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.=
2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package version =
for package abiword-plugin-loadbindings went backwards which would break pa=
ckage feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</=
div><div>abiword-3.0.2: Package version for package abiword-plugin-mathview=
 went backwards which would break package feeds from (0:3.0.2-r0.6 to 0:3.0=
.2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package version=
 for package abiword-plugin-mht went backwards which would break package fe=
eds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div=
>abiword-3.0.2: Package version for package abiword-plugin-mif went backwar=
ds which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [ver=
sion-going-backwards]</div><div>abiword-3.0.2: Package version for package =
abiword-plugin-mswrite went backwards which would break package feeds from =
(0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-=
3.0.2: Package version for package abiword-plugin-opendocument went backwar=
ds which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [ver=
sion-going-backwards]</div><div>abiword-3.0.2: Package version for package =
abiword-plugin-openwriter went backwards which would break package feeds fr=
om (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiwo=
rd-3.0.2: Package version for package abiword-plugin-openxml went backwards=
 which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [versi=
on-going-backwards]</div><div>abiword-3.0.2: Package version for package ab=
iword-plugin-opml went backwards which would break package feeds from (0:3.=
0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2=
: Package version for package abiword-plugin-paint went backwards which wou=
ld break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-b=
ackwards]</div><div>abiword-3.0.2: Package version for package abiword-plug=
in-passepartout went backwards which would break package feeds from (0:3.0.=
2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: =
Package version for package abiword-plugin-pdb went backwards which would b=
reak package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backw=
ards]</div><div>abiword-3.0.2: Package version for package abiword-plugin-p=
df went backwards which would break package feeds from (0:3.0.2-r0.6 to 0:3=
.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package versi=
on for package abiword-plugin-presentation went backwards which would break=
 package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards=
]</div><div>abiword-3.0.2: Package version for package abiword-plugin-s5 we=
nt backwards which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-=
r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package version fo=
r package abiword-plugin-sdw went backwards which would break package feeds=
 from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>ab=
iword-3.0.2: Package version for package abiword-plugin-t602 went backwards=
 which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [versi=
on-going-backwards]</div><div>abiword-3.0.2: Package version for package ab=
iword-plugin-urldict went backwards which would break package feeds from (0=
:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.=
0.2: Package version for package abiword-plugin-wikipedia went backwards wh=
ich would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-=
going-backwards]</div><div>abiword-3.0.2: Package version for package abiwo=
rd-plugin-wml went backwards which would break package feeds from (0:3.0.2-=
r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Pa=
ckage version for package abiword-plugin-xslfo went backwards which would b=
reak package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backw=
ards]</div><div>abiword-3.0.2: Package version for package abiword-staticde=
v went backwards which would break package feeds from (0:3.0.2-r0.6 to 0:3.=
0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0.2: Package versio=
n for package abiword-strings went backwards which would break package feed=
s from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>a=
biword-3.0.2: Package version for package abiword-systemprofiles went backw=
ards which would break package feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [v=
ersion-going-backwards]</div><div>abiword-3.0.2: Package version for packag=
e abiword-templates went backwards which would break package feeds from (0:=
3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</div><div>abiword-3.0=
.2: Package version for package abiword went backwards which would break pa=
ckage feeds from (0:3.0.2-r0.6 to 0:3.0.2-r0.0) [version-going-backwards]</=
div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package da=
tes-dbg went backwards which would break package feeds from (0:0.4.11+git0+=
c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwards]=
</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package =
dates-dev went backwards which would break package feeds from (0:0.4.11+git=
0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backward=
s]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for packag=
e dates-doc went backwards which would break package feeds from (0:0.4.11+g=
it0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwa=
rds]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for pack=
age dates-locale-ca went backwards which would break package feeds from (0:=
0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-goin=
g-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version =
for package dates-locale-cs went backwards which would break package feeds =
from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [vers=
ion-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package =
version for package dates-locale-da went backwards which would break packag=
e feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.=
0) [version-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: =
Package version for package dates-locale-de went backwards which would brea=
k package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30f=
a321-r9.0) [version-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e3=
0fa321: Package version for package dates-locale-el went backwards which wo=
uld break package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git=
0+c8e30fa321-r9.0) [version-going-backwards]</div><div>dates-0.4.11+gitAUTO=
INC+c8e30fa321: Package version for package dates-locale-en-gb went backwar=
ds which would break package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0=
:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwards]</div><div>dates-0.4=
.11+gitAUTOINC+c8e30fa321: Package version for package dates-locale-es went=
 backwards which would break package feeds from (0:0.4.11+git0+c8e30fa321-r=
9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwards]</div><div>d=
ates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-locale=
-et went backwards which would break package feeds from (0:0.4.11+git0+c8e3=
0fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwards]</di=
v><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package date=
s-locale-eu went backwards which would break package feeds from (0:0.4.11+g=
it0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwa=
rds]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for pack=
age dates-locale-fi went backwards which would break package feeds from (0:=
0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-goin=
g-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version =
for package dates-locale-fr went backwards which would break package feeds =
from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [vers=
ion-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package =
version for package dates-locale-gl went backwards which would break packag=
e feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.=
0) [version-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: =
Package version for package dates-locale-he went backwards which would brea=
k package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30f=
a321-r9.0) [version-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e3=
0fa321: Package version for package dates-locale-hu went backwards which wo=
uld break package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git=
0+c8e30fa321-r9.0) [version-going-backwards]</div><div>dates-0.4.11+gitAUTO=
INC+c8e30fa321: Package version for package dates-locale-id went backwards =
which would break package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.=
4.11+git0+c8e30fa321-r9.0) [version-going-backwards]</div><div>dates-0.4.11=
+gitAUTOINC+c8e30fa321: Package version for package dates-locale-it went ba=
ckwards which would break package feeds from (0:0.4.11+git0+c8e30fa321-r9.9=
 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwards]</div><div>date=
s-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-locale-ja=
 went backwards which would break package feeds from (0:0.4.11+git0+c8e30fa=
321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwards]</div><=
div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-l=
ocale-ko went backwards which would break package feeds from (0:0.4.11+git0=
+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwards=
]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package=
 dates-locale-nb went backwards which would break package feeds from (0:0.4=
.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-b=
ackwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for=
 package dates-locale-nl went backwards which would break package feeds fro=
m (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version=
-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package ver=
sion for package dates-locale-pa went backwards which would break package f=
eeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) =
[version-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Pac=
kage version for package dates-locale-pl went backwards which would break p=
ackage feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa32=
1-r9.0) [version-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa=
321: Package version for package dates-locale-pt-br went backwards which wo=
uld break package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git=
0+c8e30fa321-r9.0) [version-going-backwards]</div><div>dates-0.4.11+gitAUTO=
INC+c8e30fa321: Package version for package dates-locale-ro went backwards =
which would break package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.=
4.11+git0+c8e30fa321-r9.0) [version-going-backwards]</div><div>dates-0.4.11=
+gitAUTOINC+c8e30fa321: Package version for package dates-locale-ru went ba=
ckwards which would break package feeds from (0:0.4.11+git0+c8e30fa321-r9.9=
 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwards]</div><div>date=
s-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-locale-sk=
 went backwards which would break package feeds from (0:0.4.11+git0+c8e30fa=
321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwards]</div><=
div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package dates-l=
ocale-sl went backwards which would break package feeds from (0:0.4.11+git0=
+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-backwards=
]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for package=
 dates-locale-sv went backwards which would break package feeds from (0:0.4=
.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version-going-b=
ackwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package version for=
 package dates-locale-th went backwards which would break package feeds fro=
m (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.0) [version=
-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: Package ver=
sion for package dates-locale-zh-cn went backwards which would break packag=
e feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e30fa321-r9.=
0) [version-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c8e30fa321: =
Package version for package dates-locale-zh-tw went backwards which would b=
reak package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+git0+c8e=
30fa321-r9.0) [version-going-backwards]</div><div>dates-0.4.11+gitAUTOINC+c=
8e30fa321: Package version for package dates-staticdev went backwards which=
 would break package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+=
git0+c8e30fa321-r9.0) [version-going-backwards]</div><div>dates-0.4.11+gitA=
UTOINC+c8e30fa321: Package version for package dates went backwards which w=
ould break package feeds from (0:0.4.11+git0+c8e30fa321-r9.9 to 0:0.4.11+gi=
t0+c8e30fa321-r9.0) [version-going-backwards]</div><div>evolution-data-serv=
er-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-=
server-dbg went backwards which would break package feeds from (0:3.2.3+git=
0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backward=
s]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package ver=
sion for package evolution-data-server-dev went backwards which would break=
 package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74e=
c4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gi=
tAUTOINC+a9e4e74ec4: Package version for package evolution-data-server-doc =
went backwards which would break package feeds from (0:3.2.3+git0+a9e4e74ec=
4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><di=
v>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for pa=
ckage evolution-data-server-locale-am went backwards which would break pack=
age feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0=
.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTO=
INC+a9e4e74ec4: Package version for package evolution-data-server-locale-ar=
 went backwards which would break package feeds from (0:3.2.3+git0+a9e4e74e=
c4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><d=
iv>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for p=
ackage evolution-data-server-locale-ast went backwards which would break pa=
ckage feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-=
r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAU=
TOINC+a9e4e74ec4: Package version for package evolution-data-server-locale-=
as went backwards which would break package feeds from (0:3.2.3+git0+a9e4e7=
4ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div>=
<div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-az went backwards which would break p=
ackage feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4=
-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitA=
UTOINC+a9e4e74ec4: Package version for package evolution-data-server-locale=
-be went backwards which would break package feeds from (0:3.2.3+git0+a9e4e=
74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div=
><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version fo=
r package evolution-data-server-locale-bg went backwards which would break =
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec=
4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+git=
AUTOINC+a9e4e74ec4: Package version for package evolution-data-server-local=
e-bn-in went backwards which would break package feeds from (0:3.2.3+git0+a=
9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]<=
/div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package versio=
n for package evolution-data-server-locale-bn went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3=
+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-server-l=
ocale-bs went backwards which would break package feeds from (0:3.2.3+git0+=
a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]=
</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package versi=
on for package evolution-data-server-locale-ca+valencia went backwards whic=
h would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+=
git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-se=
rver-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-dat=
a-server-locale-ca went backwards which would break package feeds from (0:3=
.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-=
backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Pac=
kage version for package evolution-data-server-locale-cs went backwards whi=
ch would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3=
+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-s=
erver-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-da=
ta-server-locale-cy went backwards which would break package feeds from (0:=
3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going=
-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Pa=
ckage version for package evolution-data-server-locale-da went backwards wh=
ich would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.=
3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-=
server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-d=
ata-server-locale-de went backwards which would break package feeds from (0=
:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goin=
g-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: P=
ackage version for package evolution-data-server-locale-dz went backwards w=
hich would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2=
.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data=
-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-=
data-server-locale-el went backwards which would break package feeds from (=
0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goi=
ng-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: =
Package version for package evolution-data-server-locale-en-au went backwar=
ds which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0=
:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-=
data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolut=
ion-data-server-locale-en-ca went backwards which would break package feeds=
 from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [vers=
ion-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e=
74ec4: Package version for package evolution-data-server-locale-en-gb went =
backwards which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.=
10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evo=
lution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package=
 evolution-data-server-locale-en+shaw went backwards which would break pack=
age feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0=
.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTO=
INC+a9e4e74ec4: Package version for package evolution-data-server-locale-eo=
 went backwards which would break package feeds from (0:3.2.3+git0+a9e4e74e=
c4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><d=
iv>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for p=
ackage evolution-data-server-locale-es went backwards which would break pac=
kage feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r=
0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUT=
OINC+a9e4e74ec4: Package version for package evolution-data-server-locale-e=
t went backwards which would break package feeds from (0:3.2.3+git0+a9e4e74=
ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><=
div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for =
package evolution-data-server-locale-eu went backwards which would break pa=
ckage feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-=
r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAU=
TOINC+a9e4e74ec4: Package version for package evolution-data-server-locale-=
fa went backwards which would break package feeds from (0:3.2.3+git0+a9e4e7=
4ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div>=
<div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-fi went backwards which would break p=
ackage feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4=
-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitA=
UTOINC+a9e4e74ec4: Package version for package evolution-data-server-locale=
-fr went backwards which would break package feeds from (0:3.2.3+git0+a9e4e=
74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div=
><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version fo=
r package evolution-data-server-locale-ga went backwards which would break =
package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec=
4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+git=
AUTOINC+a9e4e74ec4: Package version for package evolution-data-server-local=
e-gl went backwards which would break package feeds from (0:3.2.3+git0+a9e4=
e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</di=
v><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version f=
or package evolution-data-server-locale-gu went backwards which would break=
 package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74e=
c4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gi=
tAUTOINC+a9e4e74ec4: Package version for package evolution-data-server-loca=
le-he went backwards which would break package feeds from (0:3.2.3+git0+a9e=
4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</d=
iv><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version =
for package evolution-data-server-locale-hi went backwards which would brea=
k package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74=
ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+g=
itAUTOINC+a9e4e74ec4: Package version for package evolution-data-server-loc=
ale-hr went backwards which would break package feeds from (0:3.2.3+git0+a9=
e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</=
div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version=
 for package evolution-data-server-locale-hu went backwards which would bre=
ak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e7=
4ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+=
gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-server-lo=
cale-id went backwards which would break package feeds from (0:3.2.3+git0+a=
9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]<=
/div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package versio=
n for package evolution-data-server-locale-is went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3=
+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-server-l=
ocale-it went backwards which would break package feeds from (0:3.2.3+git0+=
a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]=
</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package versi=
on for package evolution-data-server-locale-ja went backwards which would b=
reak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4=
e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.=
3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-server-=
locale-ka went backwards which would break package feeds from (0:3.2.3+git0=
+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards=
]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package vers=
ion for package evolution-data-server-locale-kn went backwards which would =
break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e=
4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2=
.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-server=
-locale-ko went backwards which would break package feeds from (0:3.2.3+git=
0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backward=
s]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package ver=
sion for package evolution-data-server-locale-ku went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.=
2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-serve=
r-locale-lt went backwards which would break package feeds from (0:3.2.3+gi=
t0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwar=
ds]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package ve=
rsion for package evolution-data-server-locale-lv went backwards which woul=
d break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a=
9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3=
.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-serv=
er-locale-mai went backwards which would break package feeds from (0:3.2.3+=
git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backw=
ards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package =
version for package evolution-data-server-locale-mk went backwards which wo=
uld break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0=
+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server=
-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-se=
rver-locale-ml went backwards which would break package feeds from (0:3.2.3=
+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-back=
wards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package=
 version for package evolution-data-server-locale-mn went backwards which w=
ould break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git=
0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-serve=
r-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-s=
erver-locale-mr went backwards which would break package feeds from (0:3.2.=
3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-bac=
kwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Packag=
e version for package evolution-data-server-locale-ms went backwards which =
would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+gi=
t0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-serv=
er-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-=
server-locale-nb went backwards which would break package feeds from (0:3.2=
.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-ba=
ckwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Packa=
ge version for package evolution-data-server-locale-ne went backwards which=
 would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+g=
it0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-ser=
ver-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data=
-server-locale-nl went backwards which would break package feeds from (0:3.=
2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-b=
ackwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Pack=
age version for package evolution-data-server-locale-nn went backwards whic=
h would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+=
git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-se=
rver-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-dat=
a-server-locale-oc went backwards which would break package feeds from (0:3=
.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-=
backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Pac=
kage version for package evolution-data-server-locale-or went backwards whi=
ch would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3=
+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-s=
erver-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-da=
ta-server-locale-pa went backwards which would break package feeds from (0:=
3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going=
-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Pa=
ckage version for package evolution-data-server-locale-pl went backwards wh=
ich would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.=
3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-=
server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-d=
ata-server-locale-pt-br went backwards which would break package feeds from=
 (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-g=
oing-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4=
: Package version for package evolution-data-server-locale-pt went backward=
s which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:=
3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-d=
ata-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evoluti=
on-data-server-locale-ro went backwards which would break package feeds fro=
m (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-=
going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec=
4: Package version for package evolution-data-server-locale-ru went backwar=
ds which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0=
:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-=
data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolut=
ion-data-server-locale-rw went backwards which would break package feeds fr=
om (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version=
-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74e=
c4: Package version for package evolution-data-server-locale-si went backwa=
rds which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to =
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution=
-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolu=
tion-data-server-locale-sk went backwards which would break package feeds f=
rom (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [versio=
n-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74=
ec4: Package version for package evolution-data-server-locale-sl went backw=
ards which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to=
 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolutio=
n-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evol=
ution-data-server-locale-sq went backwards which would break package feeds =
from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [versi=
on-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e7=
4ec4: Package version for package evolution-data-server-locale-sr+latin wen=
t backwards which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r=
0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>e=
volution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for packa=
ge evolution-data-server-locale-sr went backwards which would break package=
 feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0)=
 [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC=
+a9e4e74ec4: Package version for package evolution-data-server-locale-sv we=
nt backwards which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-=
r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>=
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for pack=
age evolution-data-server-locale-ta went backwards which would break packag=
e feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0=
) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOIN=
C+a9e4e74ec4: Package version for package evolution-data-server-locale-te w=
ent backwards which would break package feeds from (0:3.2.3+git0+a9e4e74ec4=
-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div=
>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for pac=
kage evolution-data-server-locale-th went backwards which would break packa=
ge feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.=
0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOI=
NC+a9e4e74ec4: Package version for package evolution-data-server-locale-tr =
went backwards which would break package feeds from (0:3.2.3+git0+a9e4e74ec=
4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><di=
v>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for pa=
ckage evolution-data-server-locale-ug went backwards which would break pack=
age feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0=
.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTO=
INC+a9e4e74ec4: Package version for package evolution-data-server-locale-uk=
 went backwards which would break package feeds from (0:3.2.3+git0+a9e4e74e=
c4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><d=
iv>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for p=
ackage evolution-data-server-locale-vi went backwards which would break pac=
kage feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r=
0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUT=
OINC+a9e4e74ec4: Package version for package evolution-data-server-locale-w=
a went backwards which would break package feeds from (0:3.2.3+git0+a9e4e74=
ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><=
div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for =
package evolution-data-server-locale-xh went backwards which would break pa=
ckage feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-=
r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAU=
TOINC+a9e4e74ec4: Package version for package evolution-data-server-locale-=
zh-cn went backwards which would break package feeds from (0:3.2.3+git0+a9e=
4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</d=
iv><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version =
for package evolution-data-server-locale-zh-hk went backwards which would b=
reak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4=
e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.=
3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-server-=
locale-zh-tw went backwards which would break package feeds from (0:3.2.3+g=
it0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwa=
rds]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package v=
ersion for package evolution-data-server-staticdev went backwards which wou=
ld break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+=
a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-server-=
3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package evolution-data-ser=
ver went backwards which would break package feeds from (0:3.2.3+git0+a9e4e=
74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div=
><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version fo=
r package libcamel-dev went backwards which would break package feeds from =
(0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-go=
ing-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4:=
 Package version for package libcamel went backwards which would break pack=
age feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0=
.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTO=
INC+a9e4e74ec4: Package version for package libebook-dev went backwards whi=
ch would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3=
+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-s=
erver-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package libebook wen=
t backwards which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r=
0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>e=
volution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for packa=
ge libecal-dev went backwards which would break package feeds from (0:3.2.3=
+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-back=
wards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package=
 version for package libecal went backwards which would break package feeds=
 from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [vers=
ion-going-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e=
74ec4: Package version for package libedata-book-dev went backwards which w=
ould break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git=
0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolution-data-serve=
r-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package libedata-book we=
nt backwards which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-=
r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>=
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for pack=
age libedata-cal-dev went backwards which would break package feeds from (0=
:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goin=
g-backwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: P=
ackage version for package libedata-cal went backwards which would break pa=
ckage feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-=
r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAU=
TOINC+a9e4e74ec4: Package version for package libedataserver-dev went backw=
ards which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to=
 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>evolutio=
n-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for package libe=
dataserverui-dev went backwards which would break package feeds from (0:3.2=
.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-ba=
ckwards]</div><div>evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Packa=
ge version for package libedataserverui went backwards which would break pa=
ckage feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3.2.3+git0+a9e4e74ec4-=
r0.0) [version-going-backwards]</div><div>evolution-data-server-3.2.3+gitAU=
TOINC+a9e4e74ec4: Package version for package libedataserver went backwards=
 which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.10 to 0:3=
.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]</div><div>libmodule-bu=
ild-perl-0.4224: Package version for package libmodule-build-perl-dbg went =
backwards which would break package feeds from (0:0.4224-r0.1 to 0:0.4224-r=
0.0) [version-going-backwards]</div><div>libmodule-build-perl-0.4224: Packa=
ge version for package libmodule-build-perl-dev went backwards which would =
break package feeds from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-ba=
ckwards]</div><div>libmodule-build-perl-0.4224: Package version for package=
 libmodule-build-perl-doc went backwards which would break package feeds fr=
om (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]</div><div>lib=
module-build-perl-0.4224: Package version for package libmodule-build-perl-=
locale went backwards which would break package feeds from (0:0.4224-r0.1 t=
o 0:0.4224-r0.0) [version-going-backwards]</div><div>libmodule-build-perl-0=
.4224: Package version for package libmodule-build-perl-staticdev went back=
wards which would break package feeds from (0:0.4224-r0.1 to 0:0.4224-r0.0)=
 [version-going-backwards]</div><div>libmodule-build-perl-0.4224: Package v=
ersion for package libmodule-build-perl went backwards which would break pa=
ckage feeds from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]=
</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for=
 package qtremoteobjects-dbg went backwards which would break package feeds=
 from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0) [versi=
on-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: =
Package version for package qtremoteobjects-dbg went backwards which would =
break package feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b=
101884-r0.0) [version-going-backwards]</div><div>qtremoteobjects-5.9.0+gitA=
UTOINC+ae0b101884: Package version for package qtremoteobjects-dev went bac=
kwards which would break package feeds from (0:5.9.0+git0+ae0b101884-r0.2 t=
o 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards]</div><div>qtremot=
eobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package qtremoteo=
bjects-dev went backwards which would break package feeds from (0:5.9.0+git=
0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards=
]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version fo=
r package qtremoteobjects-doc went backwards which would break package feed=
s from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0) [vers=
ion-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884:=
 Package version for package qtremoteobjects-doc went backwards which would=
 break package feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0=
b101884-r0.0) [version-going-backwards]</div><div>qtremoteobjects-5.9.0+git=
AUTOINC+ae0b101884: Package version for package qtremoteobjects-examples-db=
g went backwards which would break package feeds from (0:5.9.0+git0+ae0b101=
884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards]</div><d=
iv>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package=
 qtremoteobjects-examples-dbg went backwards which would break package feed=
s from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0) [vers=
ion-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884:=
 Package version for package qtremoteobjects-examples-dev went backwards wh=
ich would break package feeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0=
+git0+ae0b101884-r0.0) [version-going-backwards]</div><div>qtremoteobjects-=
5.9.0+gitAUTOINC+ae0b101884: Package version for package qtremoteobjects-ex=
amples-dev went backwards which would break package feeds from (0:5.9.0+git=
0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards=
]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version fo=
r package qtremoteobjects-examples-staticdev went backwards which would bre=
ak package feeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101=
884-r0.0) [version-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTO=
INC+ae0b101884: Package version for package qtremoteobjects-examples-static=
dev went backwards which would break package feeds from (0:5.9.0+git0+ae0b1=
01884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards]</div>=
<div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for packa=
ge qtremoteobjects-examples went backwards which would break package feeds =
from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0) [versio=
n-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: P=
ackage version for package qtremoteobjects-examples went backwards which wo=
uld break package feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+=
ae0b101884-r0.0) [version-going-backwards]</div><div>qtremoteobjects-5.9.0+=
gitAUTOINC+ae0b101884: Package version for package qtremoteobjects-locale w=
ent backwards which would break package feeds from (0:5.9.0+git0+ae0b101884=
-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards]</div><div>=
qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package qt=
remoteobjects-locale went backwards which would break package feeds from (0=
:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going=
-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package =
version for package qtremoteobjects-mkspecs went backwards which would brea=
k package feeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b1018=
84-r0.0) [version-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOI=
NC+ae0b101884: Package version for package qtremoteobjects-mkspecs went bac=
kwards which would break package feeds from (0:5.9.0+git0+ae0b101884-r0.3 t=
o 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards]</div><div>qtremot=
eobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package qtremoteo=
bjects-plugins-dbg went backwards which would break package feeds from (0:5=
.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-b=
ackwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package ve=
rsion for package qtremoteobjects-plugins-dbg went backwards which would br=
eak package feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b10=
1884-r0.0) [version-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUT=
OINC+ae0b101884: Package version for package qtremoteobjects-plugins went b=
ackwards which would break package feeds from (0:5.9.0+git0+ae0b101884-r0.2=
 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards]</div><div>qtrem=
oteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package qtremot=
eobjects-plugins went backwards which would break package feeds from (0:5.9=
.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-bac=
kwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package vers=
ion for package qtremoteobjects-qmldesigner went backwards which would brea=
k package feeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b1018=
84-r0.0) [version-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOI=
NC+ae0b101884: Package version for package qtremoteobjects-qmldesigner went=
 backwards which would break package feeds from (0:5.9.0+git0+ae0b101884-r0=
.3 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards]</div><div>qtr=
emoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for package qtrem=
oteobjects-qmlplugins-dbg went backwards which would break package feeds fr=
om (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0) [version-=
going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Pac=
kage version for package qtremoteobjects-qmlplugins-dbg went backwards whic=
h would break package feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+g=
it0+ae0b101884-r0.0) [version-going-backwards]</div><div>qtremoteobjects-5.=
9.0+gitAUTOINC+ae0b101884: Package version for package qtremoteobjects-qmlp=
lugins went backwards which would break package feeds from (0:5.9.0+git0+ae=
0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards]</d=
iv><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for pa=
ckage qtremoteobjects-qmlplugins went backwards which would break package f=
eeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0) [v=
ersion-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b1018=
84: Package version for package qtremoteobjects-staticdev went backwards wh=
ich would break package feeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0=
+git0+ae0b101884-r0.0) [version-going-backwards]</div><div>qtremoteobjects-=
5.9.0+gitAUTOINC+ae0b101884: Package version for package qtremoteobjects-st=
aticdev went backwards which would break package feeds from (0:5.9.0+git0+a=
e0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards]</=
div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for p=
ackage qtremoteobjects-tools-dbg went backwards which would break package f=
eeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0) [v=
ersion-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b1018=
84: Package version for package qtremoteobjects-tools-dbg went backwards wh=
ich would break package feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0=
+git0+ae0b101884-r0.0) [version-going-backwards]</div><div>qtremoteobjects-=
5.9.0+gitAUTOINC+ae0b101884: Package version for package qtremoteobjects-to=
ols went backwards which would break package feeds from (0:5.9.0+git0+ae0b1=
01884-r0.2 to 0:5.9.0+git0+ae0b101884-r0.0) [version-going-backwards]</div>=
<div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Package version for packa=
ge qtremoteobjects-tools went backwards which would break package feeds fro=
m (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+git0+ae0b101884-r0.0) [version-g=
oing-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+ae0b101884: Pack=
age version for package qtremoteobjects went backwards which would break pa=
ckage feeds from (0:5.9.0+git0+ae0b101884-r0.2 to 0:5.9.0+git0+ae0b101884-r=
0.0) [version-going-backwards]</div><div>qtremoteobjects-5.9.0+gitAUTOINC+a=
e0b101884: Package version for package qtremoteobjects went backwards which=
 would break package feeds from (0:5.9.0+git0+ae0b101884-r0.3 to 0:5.9.0+gi=
t0+ae0b101884-r0.0) [version-going-backwards]</div><div><br></div><div><br>=
</div><div>count: 2<span class=3D"gmail-Apple-tab-span" style=3D"white-spac=
e:pre">	</span>issue: host-user-contaminated</div><div>qt5-creator-3.5.1: q=
t5-creator: /qt5-creator/usr/lib/qt5/qtcreator/plugins/libIos.so is owned b=
y uid 3004, which is the same as the user running bitbake. This may be due =
to host contamination [host-user-contaminated]</div><div>qt5-creator-3.5.1:=
 qt5-creator: /qt5-creator/usr/lib/qt5/qtcreator/plugins/libQmlProjectManag=
er.so is owned by uid 3004, which is the same as the user running bitbake. =
This may be due to host contamination [host-user-contaminated]</div><div><b=
r></div><div><br></div><div>count: 0<span class=3D"gmail-Apple-tab-span" st=
yle=3D"white-space:pre">	</span>issue: installed-vs-shipped</div><div><br><=
/div><div><br></div><div>count: 0<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>issue: unknown-configure-option</div><div><br>=
</div><div><br></div><div>count: 0<span class=3D"gmail-Apple-tab-span" styl=
e=3D"white-space:pre">	</span>issue: symlink-to-sysroot</div><div><br></div=
><div><br></div><div>count: 0<span class=3D"gmail-Apple-tab-span" style=3D"=
white-space:pre">	</span>issue: invalid-pkgconfig</div><div><br></div><div>=
<br></div><div>count: 0<span class=3D"gmail-Apple-tab-span" style=3D"white-=
space:pre">	</span>issue: pkgname</div><div><br></div><div><br></div><div>c=
ount: 0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</sp=
an>issue: ldflags</div><div><br></div><div><br></div><div>count: 0<span cla=
ss=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>issue: compil=
e-host-path</div><div><br></div><div><br></div><div><br></div><div>=3D=3D T=
ested changes (not included in master yet) - bitbake =3D=3D</div><div>lates=
t upstream commit:=C2=A0</div><div>8a60106 main: Attempt to gain bitbake.lo=
ck rather than just waiting</div><div>not included in master yet:=C2=A0</di=
v><div>a064963 world-image: add extra target</div><div><br></div><div>=3D=
=3D Tested changes (not included in master yet) - openembedded-core =3D=3D<=
/div><div>latest upstream commit:=C2=A0</div><div>a8b89b3 default-providers=
: Add entries for pkgconfig (due to pkg-conf being added)</div><div>not inc=
luded in master yet:=C2=A0</div><div>338cc89 report-error: Allow to upload =
reports automatically</div><div>f492b98 buildhistory.bbclass: metadata-revs=
 show repo parent</div><div>eb590e9 metadata-revs: provide more information=
</div><div>7860d90 qemux86: Add identical qemux86copy variant for tests</di=
v><div>9fdb66a reproducible_build.bbclass: initial support for binary repro=
ducibility</div><div>097476c cpio: provide cpio-replacement-native</div><di=
v>c3b689d image_types.bbclass: improve cpio image reproducibility</div><div=
>cbd025c rootfs-postcommands.bbclass: support binary reproducibility</div><=
div>c0f57c9 insane.bbclass: write QA issues to log file only when they are =
in ERROR_QA or WARN_QA</div><div><br></div><div>=3D=3D Tested changes (not =
included in master yet) - meta-openembedded =3D=3D</div><div>latest upstrea=
m commit:=C2=A0</div><div>ac2a6d2 json-spirit: Add -latomic to LDFLAGS</div=
><div>not included in master yet:=C2=A0</div><div>6ff499b dnsmasq: disable =
the service by default</div><div>ca0e943 rdate: Fix build with hardening</d=
iv><div>7e3d8e4 strongswan: Include stdint.h for uintptr_t</div><div>217431=
e netkit-rpc: Fix build with hardening flags</div><div>f3819cc netkit-telne=
t: Fix build with hardening</div><div>048e071 ncftp: Upgrade to 3.2.6</div>=
<div>61495a9 autofs: Add build dependency on libnsl2</div><div>96e606d open=
hpi: Fix build on 64bit platforms e.g. aarch64</div><div>7feddb1 security_f=
lags.inc: Delete</div><div>a4723a6 pptp-linux: Upgrade to 1.9.0</div><div>a=
b4774e ebtables: replace ebtables-save perl script with bash rewrite</div><=
div>3a96b76 pimd: Upgrade to 2.3.2</div><div>aa43496 igmpproxy: Include mis=
sing sys/tupes.h and define _GNU_SOURCE</div><div>92bc7d2 rdate: Define log=
wtmp if libc !=3D glibc</div><div>a04b53f netkit-ftp: Include sys/types.h f=
or u_long definition</div><div>feb1653 postfix: Disable nis support on musl=
</div><div>93ee634 zeroconf: Fix build with musl</div><div>163c868 netperf:=
 change SRC_URI to git repository</div><div>4c2b4c4 ippool: Fix build error=
s found with hardening flags</div><div>5ebba48 openflow: Fix build with mus=
l</div><div>610e392 xl2tpd: Update to 1.3.9</div><div>53982a0 c-ares: updat=
e 1.12.0 -&gt; 1.13.0</div><div>b101101 radvd: 2.14 -&gt; 2.17</div><div>9a=
7309d libesmtp: Fix config.h define for snprintf detection</div><div>b9b2b0=
1 drbd: Add recipe</div><div>b7b27a5 net-snmp: fix engineBoots value on SIG=
HUP</div><div>f8559af openl2tp: add LGPL-2.1 license</div><div>ce8ed9a open=
l2tp: add init script and systemd support</div><div>4f97a6c ntop: add new r=
ecipe</div><div>21479a9 libtdb: update 1.3.12 -&gt; 1.3.14</div><div>d946a4=
2 ndisc6: Upgrade to 1.0.3</div><div>f3dd13e memcached: Update to 1.5.0</di=
v><div>3436c8e tcpdump: remove unnecessary patch</div><div>209a90c squid: A=
dd missing dependencies on openssl expat and libxml2</div><div>5061e4f post=
fix: Upgrade to 3.2.2</div><div>33dff9b mpv: Update to version 0.26.0.</div=
><div>cc37aef python3-blivet: add recipe 2.2.0</div><div>ad94afe python3-bl=
ivetgui: add recipe 2.1.5</div><div>47fb79b librcf: Add -latomic to LDFLAGS=
</div><div>6599b98 upower: update 0.99.4 -&gt; 0.99.5</div><div>b720216 gea=
ny: update 1.30.1 -&gt; 1.31</div><div>29805cb geany-plugins: update 1.30 -=
&gt; 1.31</div><div>c94d8e7 python-wrapt: update to version 1.10.11</div><d=
iv>69a7670 python-cmd2: update to version 0.7.6</div><div>353a2ab python-sq=
lalchemy: update to version 1.1.13</div><div>363c33c python-pytest: update =
to version 3.2.1</div><div>38c6ecb python-pyro4: update to version 4.61</di=
v><div>07c7d83 php: move to version 7.1.8 from 7.1.7</div><div>03eaf98 gsoa=
p: Upgrade to 2.8.51</div><div>16a43c3 caps: Mark ARCH empty</div><div>5d25=
280 mailcap: upgrade to 2.1.48</div><div>17dbbb3 mailx: Force mailx to buil=
d with openssl10</div><div>ac85ad1 php: disable this version by default</di=
v><div>7b9dfb7 freeradius: Upgrade to 3.0.15</div><div>4978e89 tcpdump: upd=
ate to 4.9.1 to fix CVE-2017-11108</div><div>a99294b vlock: add new recipe<=
/div><div>1e2f4b9 fontforge: update to 20170731 to fix CVEs</div><div>5567b=
2a wireshark: 2.2.7 -&gt; 2.2.8</div><div>632f250 start-stop-daemon: Only c=
reate a link in ${base_sbindir} if necessary</div><div>d8811b9 python-chard=
et: Extend to native and nativesdk</div><div>ebd41b0 openobex: disable buil=
ding documentation</div><div>ac15d80 openwsman: rename to 2.6.3</div><div>d=
a135d6 iproute2: add bbappend for supporting tipc tool</div><div>cebccb3 ti=
pcutils: add runtime dependency for iproute2-tipc</div><div>f920d63 mariadb=
: 5.5.55 -&gt; 5.5.57</div><div>64ee547 rsyslog: fix CVE-2017-12588</div><d=
iv>cc02e10 rsyslog: install logrotate configuration file into correct locat=
ion</div><div>56d6e0a libvpx: upgrade to 1.6.1</div><div>a4ee06b quagga: up=
date to 1.2.1</div><div>961abc1 gd: update to 2.2.4</div><div>cb686c3 efiva=
r: Upgrade to 0.31</div><div>3706ca2 openvpn: 2.4.2 -&gt; 2.4.3</div><div>d=
e9860c python*-ptyprocess: add v0.5.2</div><div>fab2dd5 python*-pexpect: ad=
d v4.2.1</div><div>543455e ipsec-tools: fix CVE-2016-10396</div><div>6c775f=
9 multipath-tools: add bash to RDEPENDS</div><div>5141a9b python3-pykicksta=
rt: tweak shebang to python3</div><div>52f0eb1 xmlrpc-c: add perl to RDEPEN=
DS</div><div>92d6a0f phpmyadmin: upgrade to 4.7.3</div><div>3716024 pcsc-li=
te: Update to 1.8.22</div><div>d3af646 python-requests: Update to version 2=
.18.4</div><div>e3057cc sthttpd: update to 2.27.1</div><div>c9f10ab glibmm:=
 fix perl path</div><div>3a8e526 postgresql: update to 9.4.13</div><div>4c2=
ea5a Dhrystone: add recipe 2.1</div><div>c2a4bdf makedumpfile: update to 1.=
6.2</div><div>6ce999e mozjs: customize HOST_CFLAGS</div><div>f3e09bd adduse=
r: use get_perl_version instead of PERLVERSION</div><div>a17cffb iperf3: 3.=
1.3 -&gt; 3.2</div><div>40916b0 webmin: add systemd service file</div><div>=
598c29c python-markupsafe: Extend to build native version too</div><div>a7f=
2d3a vim: update to 8.0.0983</div><div>9756937 python-m2crypto: Upgrade to =
0.26.0</div><div>87f7ea5 gnulib: upgrade to 2017-08-20.18</div><div>0c7c8fb=
 collectd: 5.7.1 -&gt; 5.7.2</div><div>54b071b netcf: upgrade to latest 0.2=
.8</div><div>0c0ef1d tftp-hpa: add systemd unit files</div><div>d1f41a0 gpe=
rftools: fixup HOMEPAGE</div><div>8f5ed1d openconnect: fix parallel compila=
tion failure</div><div>5d15b1c gnome-keyring: Fix compatibility with gcr 3 =
in oe-core</div><div>863d51e openconnect: upgrade to 7.08</div><div>4dd9884=
 gflags: add runtime dependency on bash</div><div>f3fc0cc logcheck: update =
to 1.3.18 and move to meta-perl</div><div>3815615 python-pycrypto: Security=
 fix CVE-2013-7459</div><div>3d85015 logwarn: set correct paths and add mis=
sing dependency</div><div>c2dbb9b openldap: fix native LDFLAGS build error<=
/div><div>166bf62 xorg-fonts-100dpi: unblacklist recipe</div><div>a60ac1c r=
ecipes: remove blacklisted recipes</div><div>69529c6 meta-ruby: remove this=
 now pretty empty layer</div><div>61e8314 meta-efl: remove this now pretty =
empty layer</div><div>07ed328 meta-systemd: remove this now pretty empty la=
yer</div><div>7b0f2ca meta-gpe: remove this now pretty empty layer</div><di=
v>73eccec imagemagick: 7.0.5 -&gt; 7.0.6_9</div><div>524e123 libmodule-buil=
d-perl: upgrade to v0.4224 and fix qa error</div><div>05db9b0 enscript ndis=
c6: specify target location of perl</div><div>51c6073 python*-pylint: upgra=
de to v1.7.2 and fix qa error</div><div>75ba188 python*-astroid: use SPDX c=
ompatible license identifier</div><div>5332d4f mpich: Define PERL variable =
and pass to configure</div><div>5c2bbb5 wireguard-tools: Add bash to rdeps<=
/div><div>3b00593 enscript: Define PERL variable</div><div>9773412 udevil: =
Add missing rdep on bash</div><div>ac8a952 libbonobo: Pass PERL_PATH to do_=
configure</div><div>bbcaa21 openl2tp: Add bash to rdeps</div><div>2e5566d p=
ython-paho-mqtt: licensing improvements</div><div>535065f python-paho-mqtt:=
 fix downloading during do_compile</div><div>cd3949d libhugetlbfs: Define H=
UGETLB_LDSCRIPT_PATH</div><div>1a7fdc6 efibootmgr: Upgrade to 0.15</div><di=
v>c814630 efivar: Fix build with clang</div><div>155a8a1 evolution-data-ser=
ver: Fix build with clang</div><div>aeabfe1 wvstreams: Fix parallel build</=
div><div>f7c8d6b squid: Disable format-truncation warning only with gcc</di=
v><div>95ba434 squid: Fix QA errors about wrong perl interpreter</div><div>=
4fb1f38 libreport: fix typo of SRC_URI</div><div>652998f python-html5lib: a=
dd Python3 support</div><div>a6fbb22 python-webencodings: add Python3 suppo=
rt</div><div>da14eb2 python-beautifulsoup4: add new recipe for both python2=
 and python3</div><div>c01288b multipath-tools: RDEPEND on bash</div><div>c=
a1e184 wireguard: Upgrade to 20170810 snapshot</div><div><br></div><div>=3D=
=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D</div><div=
>latest upstream commit:=C2=A0</div><div>8960831 qwt-qt5.inc: fix QA warnin=
g</div><div>not included in master yet:=C2=A0</div><div>6e9892a qtbase: add=
 ptest</div><div>d53382f qt5-ptest: fix build with yocto &lt; 2.3 (pyro)</d=
iv><div>9042969 qtbase: Fix ptests with clang</div><div>0b41b62 qtbase: Use=
 sched_yield instead of pthread_yield</div><div>17d94b7 quazip: update to 0=
.7.3 and add missing metadata</div><div>3963daa qtwebkit: Backport a patch =
to fix build with icu-59</div><div>7efcea9 qt3d: Fix build with clang</div>=
<div>c74e5b8 qtbase: remove qtbase-native from DEPENDS</div><div>1619723 gs=
treamer1.0-plugins-bad: add qt5 packageconfig</div><div>d82317c qtbase: ref=
resh the patches</div><div>246ec7b qtwebengine: refresh patches</div><div>1=
42f888 qt3d: refresh patches</div><div>3522d3d qtbase: fix Krogoth build re=
gression from efa8aaf</div><div>d9f4b6e meta-toolchain-qt5: don&#39;t rely =
on COREBASE/LICENSE</div><div>209e7e6 qtwebengine: disable SECURITY_STRINGF=
ORMAT to fix the build</div><div>648f7b0 qtbase, qtgraphicaleffect, qtmulti=
media, qtscript, qtlocation, qtwayland: disable gold to work around binutil=
s bug</div><div>969f1f8 Upgrade to Qt 5.9.0</div><div>a0b2220 qtwebengine: =
add a fix for building demobrowser without printing support</div><div>2d14d=
99 qt: refresh remaining patches and add links to meta-qt5 repos</div><div>=
9c7507e qt: upgrade to latest revision in 5.9 branch</div><div>b7ae79a qtwe=
bengine: fix build with glibc-2.26</div><div>c4c70e7 qtwebengine: update 00=
04-Force-host-toolchain-configuration.patch</div><div>2684299 qtwebengine: =
add patch for long paths</div><div><br></div><div>=3D=3D Tested changes (no=
t included in master yet) - meta-browser =3D=3D</div><div>latest upstream c=
ommit:=C2=A0</div><div>08576b0 Merge pull request #58 from kraj/kraj/master=
</div><div>not included in master yet:=C2=A0</div><div>f9c357c gnome-settin=
gs-daemon: remove the bbappend for removed recipe</div></div></div>

--001a11425a32554ae20557cc3e02--
