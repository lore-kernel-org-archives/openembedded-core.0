Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 492D47807B;
	Tue,  5 Sep 2017 12:27:43 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id o22so6759109vke.1;
	Tue, 05 Sep 2017 05:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Yg58h5cJL2SI5eRarmcPVEtVCtYY9Ph6p2RQthL/l+0=;
	b=IZzpqIeakVMzryn4cvxIiwAkEdMU0N3AvPrZJxstHkrSE2kfE+q5UzSodO073ugYjv
	u47UX7uzk2mRz+jYVfZmWfNDrz+MTp3OYumZgZVp97QnoZ+F/t9g0e2vsBhaeOxautOY
	TtzeP70qgDJsr6ES7Xk4L6GedNtDIkbDzR1/SRlYiVBHQI0up5iAGNzkHMiXJbXL8Jem
	9bayiDnrJrPSmKUmJP4NvWaxkmUXYgeJBJ2KBcYLlh3u5cZb7QG5LcVfYmbICUq3w2yN
	oTRqLSBIjjsS+2SHiF+AUdBXVQ/ojD4gqXYMAhFQy+BRCVszErhXA5UnZGcb00p/SZ66
	M0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Yg58h5cJL2SI5eRarmcPVEtVCtYY9Ph6p2RQthL/l+0=;
	b=nw3CsB/wibUPiIFwU9u9ztow8W7+EHPIVHqGnELOLA8xzJuiCy4mLtlMUSEPlzMxDk
	ipBtk5BI1D8Y0p6cQBCyRD+GDtp5pMZMxhJHbPgC1rhV2jq7tWXUC88vTql1fH8+pd5y
	SQXiG4s+YW48clkrFY0ydd3Ejy5tpAvprcxgOesGLDba8kFb8kN1pJWtJz8bYby0xkkl
	l3pYRRPcs6uOqf8grnJVr5BxV+giVYcDMHJH5X/bUbNuf12/c2bE+hx9X4JsLysAjV4Q
	hYsPccNdtBFK+cAk6hqreMojLZ1Au8N9bHn+ouaIkVZolq0zRGpX9IBLad5mFSh1Dcsq
	wKkw==
X-Gm-Message-State: AHPjjUhXCoktrkI5mdSJyhglTrOa0256TQngGb61o01gNad77RMWcr4E
	1ba3JtBosS24aHHkgfOq7EToaFD8gXJa
X-Google-Smtp-Source: ADKCNb6IkmWCkNhfQvo4I1FHh28T1nmnPGiJO8QEBMNwD5PsmXry1OGGxt1wumqiYru84N5HYT2t0hH0BWzLImysZyk=
X-Received: by 10.31.224.134 with SMTP id x128mr1927330vkg.1.1504614460740;
	Tue, 05 Sep 2017 05:27:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Tue, 5 Sep 2017 05:27:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 5 Sep 2017 14:27:40 +0200
Message-ID: <CA+chaQc0LHs+h3ABA4hVHWmC4a4zeNCPmOd6buEko3LXrfhGSQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-09-03
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
X-List-Received-Date: Tue, 05 Sep 2017 12:27:45 -0000
Content-Type: multipart/alternative; boundary="94eb2c07afe274dd560558705acb"

--94eb2c07afe274dd560558705acb
Content-Type: text/plain; charset="UTF-8"

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
||2017-09-03 ||3 ||3 ||2 ||0 ||0 ||0 ||5 ||0 ||0 ||415 ||2 ||0 ||0 ||0 ||0
||0 ||0 ||0 ||
|}

== Failed tasks 2017-09-03 ==

INFO: jenkins-job.sh-1.8.28 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170905_020831.log

=== common (2) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    *
meta-openembedded/meta-networking/recipes-support/ndisc6/ndisc6_git.bb:
do_fetch

=== common-x86 (0) ===

=== qemuarm (1) ===
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile

=== qemux86 (1) ===
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:
do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (8) ===
{| class=wikitable
|-
|| qemuarm || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170902_204951.log/
|| http://errors.yoctoproject.org/Errors/Build/46191/
|-
|| qemux86 || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170902_204951.log/
|| http://errors.yoctoproject.org/Errors/Build/46193/
|-
|| qemux86_64 || 2 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170903_234031.log/
|| http://errors.yoctoproject.org/Errors/Build/46223/
|}

=== PNBLACKLISTs (4) ===

=== QA issues (422) ===
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
||2 ||host-user-contaminated
|-
||415 ||version-going-backwards
|-
||5 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170903_195055.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[smbnetfs]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring]
?= "This version conflicts with gcr from oe-core - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
link against sctp_connectx symbol", '', d)}"
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb:PNBLACKLIST[system-setup-keyboard]
?= "Depends on blacklisted system-config-keyboard-native - the recipe will
be removed on 2017-09-01 unless the issue is fixed"
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


count: 415 issue: version-going-backwards
gedit-2.30.4: Package version for package gedit-dbg went backwards which
would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-dev went backwards which
would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-doc went backwards which
would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-af went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-am went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ar went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ast went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-as went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-az went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-be+latin went
backwards which would break package feeds from (0:2.30.4-r2.4 to
0:2.30.4-r2.0) [version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-be went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-bg went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-bn-in went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-bn went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-br went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-bs went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ca+valencia went
backwards which would break package feeds from (0:2.30.4-r2.4 to
0:2.30.4-r2.0) [version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ca went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-crh went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-cs went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-cy went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-da went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-de went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-dz went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-el went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-en-ca went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-en-gb went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-en+shaw went
backwards which would break package feeds from (0:2.30.4-r2.4 to
0:2.30.4-r2.0) [version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-eo went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-es went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-et went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-eu went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-fa went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-fi went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-fr went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ga went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-gl went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-gu went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-he went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-hi went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-hr went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-hu went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-hy went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-id went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-is went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-it went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ja went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ka went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-kk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-kn went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ko went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ku went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-la went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-lt went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-lv went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mai went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mg went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mi went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ml went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mn went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-mr went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ms went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-nb went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-nds went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ne went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-nl went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-nn went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-oc went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-or went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-pa went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-pl went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ps went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-pt-br went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-pt went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ro went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ru went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-rw went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-si went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sl went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sq went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sr+latin went
backwards which would break package feeds from (0:2.30.4-r2.4 to
0:2.30.4-r2.0) [version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sr went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-sv went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-ta went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-te went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-th went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-tk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-tr went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-uk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-vi went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-wa went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-xh went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-zh-cn went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-zh-hk went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-locale-zh-tw went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit-staticdev went backwards
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gedit-2.30.4: Package version for package gedit went backwards which would
break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-dbg went backwards which
would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-dev went backwards which
would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-doc went backwards which
would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-az went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-cs went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-da went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-de went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-en-gb went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-es went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-eu went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-fi went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-fr went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-hu went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-id went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-is went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-it went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-ja went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-nl went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-pa went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-pl went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-pt-br went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-ro went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-ru went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-rw went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-sk went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-sr went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-sv went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-uk went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-vi went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-zh-cn went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-locale-zh-tw went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2-staticdev went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gphoto2-2.5.8: Package version for package gphoto2 went backwards which
would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-bash-completion went
backwards which would break package feeds from (0:1.32.1-r0.4 to
0:1.32.1-r0.0) [version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-dbg went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-dev went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfsd-ftp went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-doc went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfsd-sftp went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfsd-trash went backwards which
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-af went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ar went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ast went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-as went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-be+latin went
backwards which would break package feeds from (0:1.32.1-r0.4 to
0:1.32.1-r0.0) [version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-be went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-bg went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-bn-in went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-bn went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-bs went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ca+valencia went
backwards which would break package feeds from (0:1.32.1-r0.4 to
0:1.32.1-r0.0) [version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ca went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-cs went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-da went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-de went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-el went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-en-gb went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-en+shaw went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-eo went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-es went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-et went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-eu went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-fa went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-fi went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-fr went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-fur went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ga went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-gl went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-gu went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-he went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-hi went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-hu went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-id went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-it went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ja went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-kk went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-kn went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ko went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ku went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-lt went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-lv went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-mai went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-mk went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ml went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-mr went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-nb went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-nds went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-nl went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-nn went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-oc went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-or went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-pa went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-pl went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-pt-br went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-pt went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ro went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ru went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sk went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sl went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sq went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sr+latin went
backwards which would break package feeds from (0:1.32.1-r0.4 to
0:1.32.1-r0.0) [version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sr went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-sv went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ta went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-te went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-tg went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-th went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-tr went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-ug went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-uk went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-vi went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-zh-cn went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-zh-hk went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-locale-zh-tw went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs-staticdev went backwards
which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
gvfs-1.32.1: Package version for package gvfs went backwards which would
break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-bin went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-camlibs went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-dbg went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-dev went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-doc went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-cs went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-da went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-de went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-es went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-eu went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-fi went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-fr went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-hu went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-it went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-ja went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-nl went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-pl went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-pt-br went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-ru went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-sk went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-sr went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-sv went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-uk went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-vi went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-zh-cn went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-locale-zh-tw went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2-staticdev went
backwards which would break package feeds from (0:2.5.8-r0.3 to
0:2.5.8-r0.0) [version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphoto2 went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
libgphoto2-2.5.8: Package version for package libgphotoport went backwards
which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-dbg went backwards which would
break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-dev went backwards which would
break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-doc went backwards which would
break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-af went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ar went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-bg went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-bn-in went backwards
which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ca went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-cs went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-da went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-de went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-el went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-es went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-et went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-eu went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-fa went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-fi went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-fr went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-gl went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-he went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-hr went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-hu went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-id went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-it went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ja went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ko went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-lt went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ml went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ms went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-nb went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-nl went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-nn went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-pl went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ps went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-pt-br went backwards
which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-pt went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ru went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-sk went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-sl went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-sr went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-sv went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-tr went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-uk went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ur-pk went backwards
which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-ur went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-vi went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-zh-cn went backwards
which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-locale-zh-tw went backwards
which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm-staticdev went backwards which
would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
lxdm-0.5.3: Package version for package lxdm went backwards which would
break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dbg went backwards which would
break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dbg went backwards which would
break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dbg went backwards which would
break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dev went backwards which would
break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dev went backwards which would
break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-dev went backwards which would
break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-doc went backwards which would
break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-doc went backwards which would
break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-doc went backwards which would
break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-locale went backwards which
would break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-locale went backwards which
would break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-locale went backwards which
would break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-staticdev went backwards which
would break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-staticdev went backwards which
would break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop-staticdev went backwards which
would break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop went backwards which would
break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop went backwards which would
break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0)
[version-going-backwards]
ntop-5.0.1: Package version for package ntop went backwards which would
break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-aruco-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-aruco went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-bgsegm-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-bgsegm went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-bioinspired-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-bioinspired went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-calib3d-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-calib3d went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ccalib-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ccalib went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-core-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-core went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-dpm-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-dpm went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-face-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-face went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-features2d-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-features2d went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-flann-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-flann went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-fuzzy-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-fuzzy went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-highgui-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-highgui went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-imgcodecs-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-imgcodecs went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-img-hash-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-img-hash went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-imgproc-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-imgproc went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-line-descriptor-dev went backwards
which would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-line-descriptor went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ml-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ml went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-objdetect-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-objdetect went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-optflow-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-optflow went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-phase-unwrapping-dev went backwards
which would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-phase-unwrapping went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-photo-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-photo went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-plot-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-plot went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-reg-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-reg went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-rgbd-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-rgbd went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-saliency-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-saliency went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-shape-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-shape went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-stereo-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-stereo went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-stitching-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-stitching went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-structured-light-dev went backwards
which would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-structured-light went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-superres-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-superres went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-surface-matching-dev went backwards
which would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-surface-matching went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-tracking-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-tracking went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ts-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ts went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-video-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-videoio-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-videoio went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-videostab-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-videostab went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-video went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xfeatures2d-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xfeatures2d went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ximgproc-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-ximgproc went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xobjdetect-dev went backwards which
would break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xobjdetect went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xphoto-dev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package libopencv-xphoto went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-apps went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-dbg went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-dev went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-doc went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-locale went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-samples went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv-staticdev went backwards which would
break package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package opencv went backwards which would break package
feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:
Package version for package python3-opencv went backwards which would break
package feeds from
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dbg went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dbg went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dev went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-dev went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-doc went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-doc went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-locale went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-locale went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-ptest went backwards which
would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-ptest went backwards which
would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-staticdev went backwards
which would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu-staticdev went backwards
which would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu went backwards which would
break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)
[version-going-backwards]
qemu-2.10.0: Package version for package qemu went backwards which would
break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)
[version-going-backwards]


count: 2 issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-en-gb/usr/lib/locale/en_GB/LC_MEASUREMENT is owned
by uid 3004, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-nn-no.iso-8859-1/usr/lib/locale/nn_NO.ISO-8859-1/LC_MEASUREMENT
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
7234f33 cooker: Ensure parseConfiguration clears parsecache_valid
not included in master yet:
3ca419d world-image: add extra target
1e4c0af fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
dd75644 insane.bbclass: Warn if ${COREBASE}/LICENSE is used
not included in master yet:
ba0ece9 report-error: Allow to upload reports automatically
91ce1d7 buildhistory.bbclass: metadata-revs show repo parent
63337cc metadata-revs: provide more information
99c01ed qemux86: Add identical qemux86copy variant for tests
95364c1 reproducible_build.bbclass: initial support for binary
reproducibility
a03b5e3 cpio: provide cpio-replacement-native
51748e3 image_types.bbclass: improve cpio image reproducibility
6e998e7 rootfs-postcommands.bbclass: support binary reproducibility
61b23db insane.bbclass: write QA issues to log file only when they are in
ERROR_QA or WARN_QA
781b774 sstate.bbclass: Do not cause build failures due to setscene errors

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
e5681e1 layer.conf: remove FREESMARTPHONE_GIT variable
not included in master yet:
10bace9 dnsmasq: disable the service by default
4f93985 rdate: Fix build with hardening
e5c886b strongswan: Include stdint.h for uintptr_t
4677c6a netkit-rpc: Fix build with hardening flags
c8efb3c netkit-telnet: Fix build with hardening
76662d3 ncftp: Upgrade to 3.2.6
53c064f autofs: Add build dependency on libnsl2
8e943f5 openhpi: Fix build on 64bit platforms e.g. aarch64
da43327 security_flags.inc: Delete
2194ffc pptp-linux: Upgrade to 1.9.0
3426784 ebtables: replace ebtables-save perl script with bash rewrite
a9a8724 pimd: Upgrade to 2.3.2
f131a95 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
e7c14f4 rdate: Define logwtmp if libc != glibc
ec9e308 netkit-ftp: Include sys/types.h for u_long definition
066a9c7 postfix: Disable nis support on musl
8da3ce9 zeroconf: Fix build with musl
9c2d01f ippool: Fix build errors found with hardening flags
fff054d openflow: Fix build with musl
25d61ba xl2tpd: Update to 1.3.9
51b1378 c-ares: update 1.12.0 -> 1.13.0
f636b27 radvd: 2.14 -> 2.17
82bf544 libesmtp: Fix config.h define for snprintf detection
4cb7315 drbd: Add recipe
6aa8077 net-snmp: fix engineBoots value on SIGHUP
b270230 openl2tp: add LGPL-2.1 license
fb9b74b openl2tp: add init script and systemd support
4d7fd49 ntop: add new recipe
650c226 libtdb: update 1.3.12 -> 1.3.14
bc2ecf9 ndisc6: Upgrade to 1.0.3
60b2801 memcached: Update to 1.5.0
ab22cc4 tcpdump: remove unnecessary patch
424e6e6 squid: Add missing dependencies on openssl expat and libxml2
07e09c6 postfix: Upgrade to 3.2.2
8ef3e24 freeradius: Upgrade to 3.0.15
37e3ccd tcpdump: update to 4.9.1 to fix CVE-2017-11108
ebff0aa wireshark: 2.2.7 -> 2.2.8
d95f6b1 krb5: fix CVE-2017-11368
4b71e13 quagga: update to 1.2.1
346ae75 openvpn: 2.4.2 -> 2.4.3
d1cf702 ipsec-tools: fix CVE-2016-10396
1b793a9 netcf: upgrade to latest 0.2.8
87377c8 tftp-hpa: add systemd unit files
b04d96c openconnect: fix parallel compilation failure
20c367e openconnect: upgrade to 7.08
6b1cd36 ndisc6: specify target location of perl
053e2cd wireguard-tools: Add bash to rdeps
e4a15f9 openl2tp: Add bash to rdeps
42116f6 squid: Disable format-truncation warning only with gcc
2cb8fcb squid: Fix QA errors about wrong perl interpreter
08f0852 wireguard: Upgrade to 20170810 snapshot
ba3a771 ippool: Fix build errors found by clang
ba00b39 iscsitarget: Fix kernel with new 4.12+ kernel
3267d6d postfix: Fix build with security flags and clang
e8f4c41 openhpi: Fix build with clang+c++11
64030b1 openhpi: Fix ptest compile failures due to narrowing warnings with
clang
96f8322 tcpreplay: upgrade to 4.2.6
78433db tftp-hpa: Fix PIE build with clang
d2e0096 samba: 4.6.5 -> 4.6.7
1fc6436 wolfssl: upgrade to 3.12.0
c6bf516 netperf: upgrade to 2.7.0+ with git version
2624ca3 json-spirit: link to libatomic
907da25 librcf: link to libatomic
33f5af8 ntop: Fix build with musl
02ac394 corosync: Fix build with musl
88d3bbf netkit-rwho: Fix build with musl
ec4305b netkit-tftp: Fix build with musl
6d3a59a serial-forward: Fix build with hardening+musl
f71212d gsoap: Fix build with musl
7b54903 libpwquality: fix do_qa_configure issue
5171cff drbd-utils: only rmmod if DRBD is a module
b022240 libgphoto2: Copy Makefile.in.in from gettext-native
ef87d81 lxdm: Copy Makefile.in.in from gettext-native
a541332 ndisc6: Fix build with clang and update to latest on git
88b25b5 mosquitto: add from meta-intel-iot-middleware and update
264cc34 paho-mqtt-c: add recipe from meta-intel-iot-middleware and update
55934c2 iptraf-ng: Add new recipe
0308d95 sblim-sfcb: Fix build with musl
65a1f34 libmtp: fix build issue
109e1e2 libexecinfo: fix complie issue
dafc329 pmtools: use update-alternatives for acpixtract
e91e2c3 openjpeg: upgrade to 2.2.0
0160874 vpnc: Reduce lifetime value to widely-compatible value
2ecb705 pam-ssh-agent-auth: Get newer version of config.sub and
config.guess scripts
9f94216 python-matplotlib: Upgrade to 2.0.2
24dab55 wireshark: update to 2.2.9

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2684299 qtwebengine: add patch for long paths
not included in master yet:

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet:

--94eb2c07afe274dd560558705acb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><a href=3D"http://www.openembedded.org/wiki/Bitbake_W=
orld_Status">http://www.openembedded.org/wiki/Bitbake_World_Status</a></div=
><div><br></div><div>=3D=3D Number of issues - stats =3D=3D</div><div>{| cl=
ass=3D&#39;wikitable&#39;</div><div>!|Date<span style=3D"white-space:pre">	=
	</span> =C2=A0 =C2=A0 !!colspan=3D&#39;3&#39;|Failed tasks<span style=3D"w=
hite-space:pre">			</span> =C2=A0 =C2=A0!!|Signatures<span style=3D"white-s=
pace:pre">		</span> =C2=A0!!colspan=3D&#39;14&#39;|QA !!Comment</div><div>|=
-</div><div>||<span style=3D"white-space:pre">		</span>||qemuarm<span style=
=3D"white-space:pre">	</span>||qemux86<span style=3D"white-space:pre">	</sp=
an>||qemux86_64<span style=3D"white-space:pre">	</span>||all <span style=3D=
"white-space:pre">	</span>||already-stripped<span style=3D"white-space:pre"=
>	</span>||libdir<span style=3D"white-space:pre">	</span>||textrel<span sty=
le=3D"white-space:pre">	</span>||build-deps<span style=3D"white-space:pre">=
	</span>||file-rdeps<span style=3D"white-space:pre">	</span>||version-going=
-backwards<span style=3D"white-space:pre">	</span>||host-user-contaminated<=
span style=3D"white-space:pre">	</span>||installed-vs-shipped<span style=3D=
"white-space:pre">	</span>||unknown-configure-option<span style=3D"white-sp=
ace:pre">	</span>||symlink-to-sysroot<span style=3D"white-space:pre">	</spa=
n>||invalid-pkgconfig<span style=3D"white-space:pre">	</span>||pkgname<span=
 style=3D"white-space:pre">	</span>||ldflags<span style=3D"white-space:pre"=
>	</span>||compile-host-path<span style=3D"white-space:pre">	</span>||<span=
 style=3D"white-space:pre">	</span></div><div>|-</div><div>||2017-09-03<spa=
n style=3D"white-space:pre">	</span>||3<span style=3D"white-space:pre">	</s=
pan>||3<span style=3D"white-space:pre">	</span>||2<span style=3D"white-spac=
e:pre">	</span>||0<span style=3D"white-space:pre">	</span>||0<span style=3D=
"white-space:pre">		</span>||0<span style=3D"white-space:pre">		</span>||5<=
span style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">=
		</span>||0<span style=3D"white-space:pre">		</span>||415<span style=3D"wh=
ite-space:pre">		</span>||2<span style=3D"white-space:pre">		</span>||0<spa=
n style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		<=
/span>||0<span style=3D"white-space:pre">		</span>||0<span style=3D"white-s=
pace:pre">		</span>||0<span style=3D"white-space:pre">		</span>||0<span sty=
le=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		</span=
>||<span style=3D"white-space:pre">	</span></div><div>|}</div><div><br></di=
v><div>=3D=3D Failed tasks 2017-09-03 =3D=3D</div><div><br></div><div>INFO:=
 jenkins-job.sh-1.8.28 Complete log available at <a href=3D"http://logs.nsl=
u2-linux.org/buildlogs/oe/world/rocko/log.report.20170905_020831.log">http:=
//logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170905_020831.=
log</a></div><div><br></div><div>=3D=3D=3D common (2) =3D=3D=3D</div><div>=
=C2=A0 =C2=A0 * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:d=
o_compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-networking/recip=
es-support/ndisc6/ndisc6_git.bb:do_fetch</div><div><br></div><div>=3D=3D=3D=
 common-x86 (0) =3D=3D=3D</div><div><br></div><div>=3D=3D=3D qemuarm (1) =
=3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-devto=
ols/android-tools/android-tools_5.1.1.r37.bb:do_compile</div><div><br></div=
><div>=3D=3D=3D qemux86 (1) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openem=
bedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_compile</div><div>=
<br></div><div>=3D=3D=3D qemux86_64 (0) =3D=3D=3D</div><div><br></div><div>=
=3D=3D=3D Number of failed tasks (8) =3D=3D=3D</div><div>{| class=3Dwikitab=
le</div><div>|-</div><div>|| qemuarm <span style=3D"white-space:pre">	</spa=
n>|| 3<span style=3D"white-space:pre">	</span> || <a href=3D"http://logs.ns=
lu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170902_204951.lo=
g/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.=
20170902_204951.log/</a> || <a href=3D"http://errors.yoctoproject.org/Error=
s/Build/46191/">http://errors.yoctoproject.org/Errors/Build/46191/</a></div=
><div>|-</div><div>|| qemux86 <span style=3D"white-space:pre">	</span>|| 3<=
span style=3D"white-space:pre">	</span> || <a href=3D"http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170902_204951.log/">htt=
p://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.2017090=
2_204951.log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build=
/46193/">http://errors.yoctoproject.org/Errors/Build/46193/</a></div><div>|=
-</div><div>|| qemux86_64 <span style=3D"white-space:pre">	</span>|| 2<span=
 style=3D"white-space:pre">	</span> || <a href=3D"http://logs.nslu2-linux.o=
rg/buildlogs/oe/world/rocko/log.world.qemux86-64.20170903_234031.log/">http=
://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170=
903_234031.log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Bui=
ld/46223/">http://errors.yoctoproject.org/Errors/Build/46223/</a></div><div=
>|}</div><div><br></div><div>=3D=3D=3D PNBLACKLISTs (4) =3D=3D=3D</div><div=
><br></div><div>=3D=3D=3D QA issues (422) =3D=3D=3D</div><div>{| class=3Dwi=
kitable</div><div>!| Count<span style=3D"white-space:pre">		</span>||Issue<=
/div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||already=
-stripped</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span=
>||build-deps</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</=
span>||compile-host-path</div><div>|-</div><div>||0<span style=3D"white-spa=
ce:pre">	</span>||file-rdeps</div><div>|-</div><div>||0<span style=3D"white=
-space:pre">	</span>||installed-vs-shipped</div><div>|-</div><div>||0<span =
style=3D"white-space:pre">	</span>||invalid-pkgconfig</div><div>|-</div><di=
v>||0<span style=3D"white-space:pre">	</span>||ldflags</div><div>|-</div><d=
iv>||0<span style=3D"white-space:pre">	</span>||libdir</div><div>|-</div><d=
iv>||0<span style=3D"white-space:pre">	</span>||pkgname</div><div>|-</div><=
div>||0<span style=3D"white-space:pre">	</span>||symlink-to-sysroot</div><d=
iv>|-</div><div>||0<span style=3D"white-space:pre">	</span>||unknown-config=
ure-option</div><div>|-</div><div>||2<span style=3D"white-space:pre">	</spa=
n>||host-user-contaminated</div><div>|-</div><div>||415<span style=3D"white=
-space:pre">	</span>||version-going-backwards</div><div>|-</div><div>||5<sp=
an style=3D"white-space:pre">	</span>||textrel</div><div>|}</div><div><br><=
/div><div><br></div><div><br></div><div>=3D=3D=3D Incorrect PACKAGE_ARCH or=
 sstate signatures (0) =3D=3D=3D</div><div><br></div><div>Complete log: <a =
href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures=
.20170903_195055.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko=
/log.signatures.20170903_195055.log/</a></div><div><br></div><div>No issues=
 detected</div><div><br></div><div><br></div><div>PNBLACKLISTs:</div><div>o=
penembedded-core/:</div><div>meta-browser:</div><div>meta-openembedded:</di=
v><div>meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLAC=
KLIST[smbnetfs] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors=
.yoctoproject.org/Errors/Details/132827/">http://errors.yoctoproject.org/Er=
rors/Details/132827/</a> - the recipe will be removed on 2017-09-01 unless =
the issue is fixed&quot;</div><div>meta-gnome/recipes-gnome/gnome-keyring/g=
nome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring] ?=3D &quot;This version c=
onflicts with gcr from oe-core - the recipe will be removed on 2017-09-01 u=
nless the issue is fixed&quot;</div><div>meta-networking/recipes-support/lk=
sctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools] ?=3D &quot;${@b=
b.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;BRO=
KEN: fails to link against sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot=
;</div><div>meta-oe/recipes-support/system-setup-keyboard/system-setup-keyb=
oard_0.8.8.bb:PNBLACKLIST[system-setup-keyboard] ?=3D &quot;Depends on blac=
klisted system-config-keyboard-native - the recipe will be removed on 2017-=
09-01 unless the issue is fixed&quot;</div><div>meta-qt5:</div><div>PNBLACK=
LIST[android-system] =3D &quot;depends on lxc from meta-virtualiazation whi=
ch isn&#39;t included in my world builds&quot;</div><div>PNBLACKLIST[bigbuc=
kbunny-1080p] =3D &quot;big and doesn&#39;t really need to be tested so muc=
h&quot;</div><div>PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#3=
9;t really need to be tested so much&quot;</div><div>PNBLACKLIST[bigbuckbun=
ny-720p] =3D &quot;big and doesn&#39;t really need to be tested so much&quo=
t;</div><div>PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t r=
eally need to be tested so much&quot;</div><div>PNBLACKLIST[tearsofsteel-10=
80p] =3D &quot;big and doesn&#39;t really need to be tested so much&quot;</=
div><div>PNBLACKLIST[build-appliance-image] =3D &quot;tries to include whol=
e downloads directory in /home/builder/poky :/&quot;</div><div><br></div><d=
iv><br></div><div>QA issues by type:</div><div>count: 0<span style=3D"white=
-space:pre">	</span>issue: already-stripped</div><div><br></div><div><br></=
div><div>count: 0<span style=3D"white-space:pre">	</span>issue: libdir</div=
><div><br></div><div><br></div><div>count: 5<span style=3D"white-space:pre"=
>	</span>issue: textrel</div><div>chromium-54.0.2810.2: ELF binary &#39;/tm=
p/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bi=
n/chromium/chrome&#39; has relocations in .text [textrel]</div><div>chromiu=
m-wayland-53.0.2785.143: ELF binary &#39;/tmp/work/i586-oe-linux/chromium-w=
ayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/ch=
rome&#39; has relocations in .text [textrel]</div><div>corosync-2.4.2: ELF =
binary &#39;/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/co=
rosync/usr/sbin/corosync&#39; has relocations in .text [textrel]</div><div>=
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-linux/x=
264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264&#39=
; has relocations in .text [textrel]</div><div>x264-r2731+gitAUTOINC+2b741f=
81e5: ELF binary &#39;/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f8=
1e5-r0/packages-split/x264/usr/lib/libx264.so.148&#39; has relocations in .=
text [textrel]</div><div><br></div><div><br></div><div>count: 0<span style=
=3D"white-space:pre">	</span>issue: build-deps</div><div><br></div><div><br=
></div><div>count: 0<span style=3D"white-space:pre">	</span>issue: file-rde=
ps</div><div><br></div><div><br></div><div>count: 415<span style=3D"white-s=
pace:pre">	</span>issue: version-going-backwards</div><div>gedit-2.30.4: Pa=
ckage version for package gedit-dbg went backwards which would break packag=
e feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</di=
v><div>gedit-2.30.4: Package version for package gedit-dev went backwards w=
hich would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [versi=
on-going-backwards]</div><div>gedit-2.30.4: Package version for package ged=
it-doc went backwards which would break package feeds from (0:2.30.4-r2.4 t=
o 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package =
version for package gedit-locale-af went backwards which would break packag=
e feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</di=
v><div>gedit-2.30.4: Package version for package gedit-locale-am went backw=
ards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) =
[version-going-backwards]</div><div>gedit-2.30.4: Package version for packa=
ge gedit-locale-ar went backwards which would break package feeds from (0:2=
.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30=
.4: Package version for package gedit-locale-ast went backwards which would=
 break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-b=
ackwards]</div><div>gedit-2.30.4: Package version for package gedit-locale-=
as went backwards which would break package feeds from (0:2.30.4-r2.4 to 0:=
2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package vers=
ion for package gedit-locale-az went backwards which would break package fe=
eds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><d=
iv>gedit-2.30.4: Package version for package gedit-locale-be+latin went bac=
kwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0=
) [version-going-backwards]</div><div>gedit-2.30.4: Package version for pac=
kage gedit-locale-be went backwards which would break package feeds from (0=
:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.=
30.4: Package version for package gedit-locale-bg went backwards which woul=
d break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-=
backwards]</div><div>gedit-2.30.4: Package version for package gedit-locale=
-bn-in went backwards which would break package feeds from (0:2.30.4-r2.4 t=
o 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package =
version for package gedit-locale-bn went backwards which would break packag=
e feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</di=
v><div>gedit-2.30.4: Package version for package gedit-locale-br went backw=
ards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) =
[version-going-backwards]</div><div>gedit-2.30.4: Package version for packa=
ge gedit-locale-bs went backwards which would break package feeds from (0:2=
.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30=
.4: Package version for package gedit-locale-ca+valencia went backwards whi=
ch would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version=
-going-backwards]</div><div>gedit-2.30.4: Package version for package gedit=
-locale-ca went backwards which would break package feeds from (0:2.30.4-r2=
.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Pack=
age version for package gedit-locale-crh went backwards which would break p=
ackage feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards=
]</div><div>gedit-2.30.4: Package version for package gedit-locale-cs went =
backwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r=
2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package version for =
package gedit-locale-cy went backwards which would break package feeds from=
 (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit=
-2.30.4: Package version for package gedit-locale-da went backwards which w=
ould break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-goi=
ng-backwards]</div><div>gedit-2.30.4: Package version for package gedit-loc=
ale-de went backwards which would break package feeds from (0:2.30.4-r2.4 t=
o 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package =
version for package gedit-locale-dz went backwards which would break packag=
e feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</di=
v><div>gedit-2.30.4: Package version for package gedit-locale-el went backw=
ards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) =
[version-going-backwards]</div><div>gedit-2.30.4: Package version for packa=
ge gedit-locale-en-ca went backwards which would break package feeds from (=
0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2=
.30.4: Package version for package gedit-locale-en-gb went backwards which =
would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-go=
ing-backwards]</div><div>gedit-2.30.4: Package version for package gedit-lo=
cale-en+shaw went backwards which would break package feeds from (0:2.30.4-=
r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Pa=
ckage version for package gedit-locale-eo went backwards which would break =
package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backward=
s]</div><div>gedit-2.30.4: Package version for package gedit-locale-es went=
 backwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-=
r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package version for=
 package gedit-locale-et went backwards which would break package feeds fro=
m (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedi=
t-2.30.4: Package version for package gedit-locale-eu went backwards which =
would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-go=
ing-backwards]</div><div>gedit-2.30.4: Package version for package gedit-lo=
cale-fa went backwards which would break package feeds from (0:2.30.4-r2.4 =
to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package=
 version for package gedit-locale-fi went backwards which would break packa=
ge feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</d=
iv><div>gedit-2.30.4: Package version for package gedit-locale-fr went back=
wards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0)=
 [version-going-backwards]</div><div>gedit-2.30.4: Package version for pack=
age gedit-locale-ga went backwards which would break package feeds from (0:=
2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.3=
0.4: Package version for package gedit-locale-gl went backwards which would=
 break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-b=
ackwards]</div><div>gedit-2.30.4: Package version for package gedit-locale-=
gu went backwards which would break package feeds from (0:2.30.4-r2.4 to 0:=
2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package vers=
ion for package gedit-locale-he went backwards which would break package fe=
eds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><d=
iv>gedit-2.30.4: Package version for package gedit-locale-hi went backwards=
 which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [ver=
sion-going-backwards]</div><div>gedit-2.30.4: Package version for package g=
edit-locale-hr went backwards which would break package feeds from (0:2.30.=
4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: =
Package version for package gedit-locale-hu went backwards which would brea=
k package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwa=
rds]</div><div>gedit-2.30.4: Package version for package gedit-locale-hy we=
nt backwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.=
4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package version f=
or package gedit-locale-id went backwards which would break package feeds f=
rom (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>ge=
dit-2.30.4: Package version for package gedit-locale-is went backwards whic=
h would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-=
going-backwards]</div><div>gedit-2.30.4: Package version for package gedit-=
locale-it went backwards which would break package feeds from (0:2.30.4-r2.=
4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Packa=
ge version for package gedit-locale-ja went backwards which would break pac=
kage feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]<=
/div><div>gedit-2.30.4: Package version for package gedit-locale-ka went ba=
ckwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.=
0) [version-going-backwards]</div><div>gedit-2.30.4: Package version for pa=
ckage gedit-locale-kk went backwards which would break package feeds from (=
0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2=
.30.4: Package version for package gedit-locale-kn went backwards which wou=
ld break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going=
-backwards]</div><div>gedit-2.30.4: Package version for package gedit-local=
e-ko went backwards which would break package feeds from (0:2.30.4-r2.4 to =
0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package ve=
rsion for package gedit-locale-ku went backwards which would break package =
feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div>=
<div>gedit-2.30.4: Package version for package gedit-locale-la went backwar=
ds which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [v=
ersion-going-backwards]</div><div>gedit-2.30.4: Package version for package=
 gedit-locale-lt went backwards which would break package feeds from (0:2.3=
0.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4=
: Package version for package gedit-locale-lv went backwards which would br=
eak package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-back=
wards]</div><div>gedit-2.30.4: Package version for package gedit-locale-mai=
 went backwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.=
30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package versio=
n for package gedit-locale-mg went backwards which would break package feed=
s from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div=
>gedit-2.30.4: Package version for package gedit-locale-mi went backwards w=
hich would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [versi=
on-going-backwards]</div><div>gedit-2.30.4: Package version for package ged=
it-locale-mk went backwards which would break package feeds from (0:2.30.4-=
r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Pa=
ckage version for package gedit-locale-ml went backwards which would break =
package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backward=
s]</div><div>gedit-2.30.4: Package version for package gedit-locale-mn went=
 backwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-=
r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package version for=
 package gedit-locale-mr went backwards which would break package feeds fro=
m (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedi=
t-2.30.4: Package version for package gedit-locale-ms went backwards which =
would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-go=
ing-backwards]</div><div>gedit-2.30.4: Package version for package gedit-lo=
cale-nb went backwards which would break package feeds from (0:2.30.4-r2.4 =
to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package=
 version for package gedit-locale-nds went backwards which would break pack=
age feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</=
div><div>gedit-2.30.4: Package version for package gedit-locale-ne went bac=
kwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0=
) [version-going-backwards]</div><div>gedit-2.30.4: Package version for pac=
kage gedit-locale-nl went backwards which would break package feeds from (0=
:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.=
30.4: Package version for package gedit-locale-nn went backwards which woul=
d break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-=
backwards]</div><div>gedit-2.30.4: Package version for package gedit-locale=
-oc went backwards which would break package feeds from (0:2.30.4-r2.4 to 0=
:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package ver=
sion for package gedit-locale-or went backwards which would break package f=
eeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><=
div>gedit-2.30.4: Package version for package gedit-locale-pa went backward=
s which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [ve=
rsion-going-backwards]</div><div>gedit-2.30.4: Package version for package =
gedit-locale-pl went backwards which would break package feeds from (0:2.30=
.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4:=
 Package version for package gedit-locale-ps went backwards which would bre=
ak package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backw=
ards]</div><div>gedit-2.30.4: Package version for package gedit-locale-pt-b=
r went backwards which would break package feeds from (0:2.30.4-r2.4 to 0:2=
.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package versi=
on for package gedit-locale-pt went backwards which would break package fee=
ds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><di=
v>gedit-2.30.4: Package version for package gedit-locale-ro went backwards =
which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [vers=
ion-going-backwards]</div><div>gedit-2.30.4: Package version for package ge=
dit-locale-ru went backwards which would break package feeds from (0:2.30.4=
-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: P=
ackage version for package gedit-locale-rw went backwards which would break=
 package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwar=
ds]</div><div>gedit-2.30.4: Package version for package gedit-locale-si wen=
t backwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4=
-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package version fo=
r package gedit-locale-sk went backwards which would break package feeds fr=
om (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>ged=
it-2.30.4: Package version for package gedit-locale-sl went backwards which=
 would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-g=
oing-backwards]</div><div>gedit-2.30.4: Package version for package gedit-l=
ocale-sq went backwards which would break package feeds from (0:2.30.4-r2.4=
 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Packag=
e version for package gedit-locale-sr+latin went backwards which would brea=
k package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwa=
rds]</div><div>gedit-2.30.4: Package version for package gedit-locale-sr we=
nt backwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.=
4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package version f=
or package gedit-locale-sv went backwards which would break package feeds f=
rom (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>ge=
dit-2.30.4: Package version for package gedit-locale-ta went backwards whic=
h would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-=
going-backwards]</div><div>gedit-2.30.4: Package version for package gedit-=
locale-te went backwards which would break package feeds from (0:2.30.4-r2.=
4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Packa=
ge version for package gedit-locale-th went backwards which would break pac=
kage feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]<=
/div><div>gedit-2.30.4: Package version for package gedit-locale-tk went ba=
ckwards which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.=
0) [version-going-backwards]</div><div>gedit-2.30.4: Package version for pa=
ckage gedit-locale-tr went backwards which would break package feeds from (=
0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2=
.30.4: Package version for package gedit-locale-uk went backwards which wou=
ld break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going=
-backwards]</div><div>gedit-2.30.4: Package version for package gedit-local=
e-vi went backwards which would break package feeds from (0:2.30.4-r2.4 to =
0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Package ve=
rsion for package gedit-locale-wa went backwards which would break package =
feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div>=
<div>gedit-2.30.4: Package version for package gedit-locale-xh went backwar=
ds which would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [v=
ersion-going-backwards]</div><div>gedit-2.30.4: Package version for package=
 gedit-locale-zh-cn went backwards which would break package feeds from (0:=
2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.3=
0.4: Package version for package gedit-locale-zh-hk went backwards which wo=
uld break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-goin=
g-backwards]</div><div>gedit-2.30.4: Package version for package gedit-loca=
le-zh-tw went backwards which would break package feeds from (0:2.30.4-r2.4=
 to 0:2.30.4-r2.0) [version-going-backwards]</div><div>gedit-2.30.4: Packag=
e version for package gedit-staticdev went backwards which would break pack=
age feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version-going-backwards]</=
div><div>gedit-2.30.4: Package version for package gedit went backwards whi=
ch would break package feeds from (0:2.30.4-r2.4 to 0:2.30.4-r2.0) [version=
-going-backwards]</div><div>gphoto2-2.5.8: Package version for package gpho=
to2-dbg went backwards which would break package feeds from (0:2.5.8-r0.3 t=
o 0:2.5.8-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Package =
version for package gphoto2-dev went backwards which would break package fe=
eds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div=
>gphoto2-2.5.8: Package version for package gphoto2-doc went backwards whic=
h would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-go=
ing-backwards]</div><div>gphoto2-2.5.8: Package version for package gphoto2=
-locale-az went backwards which would break package feeds from (0:2.5.8-r0.=
3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Packa=
ge version for package gphoto2-locale-cs went backwards which would break p=
ackage feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]<=
/div><div>gphoto2-2.5.8: Package version for package gphoto2-locale-da went=
 backwards which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0=
.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Package version for =
package gphoto2-locale-de went backwards which would break package feeds fr=
om (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>gphot=
o2-2.5.8: Package version for package gphoto2-locale-en-gb went backwards w=
hich would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version=
-going-backwards]</div><div>gphoto2-2.5.8: Package version for package gpho=
to2-locale-es went backwards which would break package feeds from (0:2.5.8-=
r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Pa=
ckage version for package gphoto2-locale-eu went backwards which would brea=
k package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backward=
s]</div><div>gphoto2-2.5.8: Package version for package gphoto2-locale-fi w=
ent backwards which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8=
-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Package version f=
or package gphoto2-locale-fr went backwards which would break package feeds=
 from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>gp=
hoto2-2.5.8: Package version for package gphoto2-locale-hu went backwards w=
hich would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version=
-going-backwards]</div><div>gphoto2-2.5.8: Package version for package gpho=
to2-locale-id went backwards which would break package feeds from (0:2.5.8-=
r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Pa=
ckage version for package gphoto2-locale-is went backwards which would brea=
k package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backward=
s]</div><div>gphoto2-2.5.8: Package version for package gphoto2-locale-it w=
ent backwards which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8=
-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Package version f=
or package gphoto2-locale-ja went backwards which would break package feeds=
 from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>gp=
hoto2-2.5.8: Package version for package gphoto2-locale-nl went backwards w=
hich would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version=
-going-backwards]</div><div>gphoto2-2.5.8: Package version for package gpho=
to2-locale-pa went backwards which would break package feeds from (0:2.5.8-=
r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Pa=
ckage version for package gphoto2-locale-pl went backwards which would brea=
k package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backward=
s]</div><div>gphoto2-2.5.8: Package version for package gphoto2-locale-pt-b=
r went backwards which would break package feeds from (0:2.5.8-r0.3 to 0:2.=
5.8-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Package versio=
n for package gphoto2-locale-ro went backwards which would break package fe=
eds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div=
>gphoto2-2.5.8: Package version for package gphoto2-locale-ru went backward=
s which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [vers=
ion-going-backwards]</div><div>gphoto2-2.5.8: Package version for package g=
photo2-locale-rw went backwards which would break package feeds from (0:2.5=
.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8:=
 Package version for package gphoto2-locale-sk went backwards which would b=
reak package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backw=
ards]</div><div>gphoto2-2.5.8: Package version for package gphoto2-locale-s=
r went backwards which would break package feeds from (0:2.5.8-r0.3 to 0:2.=
5.8-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Package versio=
n for package gphoto2-locale-sv went backwards which would break package fe=
eds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div=
>gphoto2-2.5.8: Package version for package gphoto2-locale-uk went backward=
s which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [vers=
ion-going-backwards]</div><div>gphoto2-2.5.8: Package version for package g=
photo2-locale-vi went backwards which would break package feeds from (0:2.5=
.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8:=
 Package version for package gphoto2-locale-zh-cn went backwards which woul=
d break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-ba=
ckwards]</div><div>gphoto2-2.5.8: Package version for package gphoto2-local=
e-zh-tw went backwards which would break package feeds from (0:2.5.8-r0.3 t=
o 0:2.5.8-r0.0) [version-going-backwards]</div><div>gphoto2-2.5.8: Package =
version for package gphoto2-staticdev went backwards which would break pack=
age feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</di=
v><div>gphoto2-2.5.8: Package version for package gphoto2 went backwards wh=
ich would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-=
going-backwards]</div><div>gvfs-1.32.1: Package version for package gvfs-ba=
sh-completion went backwards which would break package feeds from (0:1.32.1=
-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Pa=
ckage version for package gvfs-dbg went backwards which would break package=
 feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div=
><div>gvfs-1.32.1: Package version for package gvfs-dev went backwards whic=
h would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-=
going-backwards]</div><div>gvfs-1.32.1: Package version for package gvfsd-f=
tp went backwards which would break package feeds from (0:1.32.1-r0.4 to 0:=
1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package versi=
on for package gvfs-doc went backwards which would break package feeds from=
 (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-=
1.32.1: Package version for package gvfsd-sftp went backwards which would b=
reak package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-bac=
kwards]</div><div>gvfs-1.32.1: Package version for package gvfsd-trash went=
 backwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-=
r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package version for =
package gvfs-locale-af went backwards which would break package feeds from =
(0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1=
.32.1: Package version for package gvfs-locale-ar went backwards which woul=
d break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-=
backwards]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-a=
st went backwards which would break package feeds from (0:1.32.1-r0.4 to 0:=
1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package versi=
on for package gvfs-locale-as went backwards which would break package feed=
s from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div=
>gvfs-1.32.1: Package version for package gvfs-locale-be+latin went backwar=
ds which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [v=
ersion-going-backwards]</div><div>gvfs-1.32.1: Package version for package =
gvfs-locale-be went backwards which would break package feeds from (0:1.32.=
1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: P=
ackage version for package gvfs-locale-bg went backwards which would break =
package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backward=
s]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-bn-in wen=
t backwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1=
-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package version for=
 package gvfs-locale-bn went backwards which would break package feeds from=
 (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-=
1.32.1: Package version for package gvfs-locale-bs went backwards which wou=
ld break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going=
-backwards]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-=
ca+valencia went backwards which would break package feeds from (0:1.32.1-r=
0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Pack=
age version for package gvfs-locale-ca went backwards which would break pac=
kage feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]<=
/div><div>gvfs-1.32.1: Package version for package gvfs-locale-cs went back=
wards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0)=
 [version-going-backwards]</div><div>gvfs-1.32.1: Package version for packa=
ge gvfs-locale-da went backwards which would break package feeds from (0:1.=
32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1=
: Package version for package gvfs-locale-de went backwards which would bre=
ak package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backw=
ards]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-el wen=
t backwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1=
-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package version for=
 package gvfs-locale-en-gb went backwards which would break package feeds f=
rom (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gv=
fs-1.32.1: Package version for package gvfs-locale-en+shaw went backwards w=
hich would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [versi=
on-going-backwards]</div><div>gvfs-1.32.1: Package version for package gvfs=
-locale-eo went backwards which would break package feeds from (0:1.32.1-r0=
.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Packa=
ge version for package gvfs-locale-es went backwards which would break pack=
age feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</=
div><div>gvfs-1.32.1: Package version for package gvfs-locale-et went backw=
ards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) =
[version-going-backwards]</div><div>gvfs-1.32.1: Package version for packag=
e gvfs-locale-eu went backwards which would break package feeds from (0:1.3=
2.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1:=
 Package version for package gvfs-locale-fa went backwards which would brea=
k package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwa=
rds]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-fi went=
 backwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-=
r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package version for =
package gvfs-locale-fr went backwards which would break package feeds from =
(0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1=
.32.1: Package version for package gvfs-locale-fur went backwards which wou=
ld break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going=
-backwards]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-=
ga went backwards which would break package feeds from (0:1.32.1-r0.4 to 0:=
1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package versi=
on for package gvfs-locale-gl went backwards which would break package feed=
s from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div=
>gvfs-1.32.1: Package version for package gvfs-locale-gu went backwards whi=
ch would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version=
-going-backwards]</div><div>gvfs-1.32.1: Package version for package gvfs-l=
ocale-he went backwards which would break package feeds from (0:1.32.1-r0.4=
 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package=
 version for package gvfs-locale-hi went backwards which would break packag=
e feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</di=
v><div>gvfs-1.32.1: Package version for package gvfs-locale-hu went backwar=
ds which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [v=
ersion-going-backwards]</div><div>gvfs-1.32.1: Package version for package =
gvfs-locale-id went backwards which would break package feeds from (0:1.32.=
1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: P=
ackage version for package gvfs-locale-it went backwards which would break =
package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backward=
s]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-ja went b=
ackwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0=
.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package version for pa=
ckage gvfs-locale-kk went backwards which would break package feeds from (0=
:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.3=
2.1: Package version for package gvfs-locale-kn went backwards which would =
break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-ba=
ckwards]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-ko =
went backwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.3=
2.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package version =
for package gvfs-locale-ku went backwards which would break package feeds f=
rom (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gv=
fs-1.32.1: Package version for package gvfs-locale-lt went backwards which =
would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-go=
ing-backwards]</div><div>gvfs-1.32.1: Package version for package gvfs-loca=
le-lv went backwards which would break package feeds from (0:1.32.1-r0.4 to=
 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package ve=
rsion for package gvfs-locale-mai went backwards which would break package =
feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div>=
<div>gvfs-1.32.1: Package version for package gvfs-locale-mk went backwards=
 which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [ver=
sion-going-backwards]</div><div>gvfs-1.32.1: Package version for package gv=
fs-locale-ml went backwards which would break package feeds from (0:1.32.1-=
r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Pac=
kage version for package gvfs-locale-mr went backwards which would break pa=
ckage feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]=
</div><div>gvfs-1.32.1: Package version for package gvfs-locale-nb went bac=
kwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0=
) [version-going-backwards]</div><div>gvfs-1.32.1: Package version for pack=
age gvfs-locale-nds went backwards which would break package feeds from (0:=
1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32=
.1: Package version for package gvfs-locale-nl went backwards which would b=
reak package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-bac=
kwards]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-nn w=
ent backwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32=
.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package version f=
or package gvfs-locale-oc went backwards which would break package feeds fr=
om (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvf=
s-1.32.1: Package version for package gvfs-locale-or went backwards which w=
ould break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-goi=
ng-backwards]</div><div>gvfs-1.32.1: Package version for package gvfs-local=
e-pa went backwards which would break package feeds from (0:1.32.1-r0.4 to =
0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package ver=
sion for package gvfs-locale-pl went backwards which would break package fe=
eds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><d=
iv>gvfs-1.32.1: Package version for package gvfs-locale-pt-br went backward=
s which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [ve=
rsion-going-backwards]</div><div>gvfs-1.32.1: Package version for package g=
vfs-locale-pt went backwards which would break package feeds from (0:1.32.1=
-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Pa=
ckage version for package gvfs-locale-ro went backwards which would break p=
ackage feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards=
]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-ru went ba=
ckwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.=
0) [version-going-backwards]</div><div>gvfs-1.32.1: Package version for pac=
kage gvfs-locale-sk went backwards which would break package feeds from (0:=
1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32=
.1: Package version for package gvfs-locale-sl went backwards which would b=
reak package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-bac=
kwards]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-sq w=
ent backwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32=
.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package version f=
or package gvfs-locale-sr+latin went backwards which would break package fe=
eds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><d=
iv>gvfs-1.32.1: Package version for package gvfs-locale-sr went backwards w=
hich would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [versi=
on-going-backwards]</div><div>gvfs-1.32.1: Package version for package gvfs=
-locale-sv went backwards which would break package feeds from (0:1.32.1-r0=
.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Packa=
ge version for package gvfs-locale-ta went backwards which would break pack=
age feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</=
div><div>gvfs-1.32.1: Package version for package gvfs-locale-te went backw=
ards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) =
[version-going-backwards]</div><div>gvfs-1.32.1: Package version for packag=
e gvfs-locale-tg went backwards which would break package feeds from (0:1.3=
2.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1:=
 Package version for package gvfs-locale-th went backwards which would brea=
k package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwa=
rds]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-tr went=
 backwards which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-=
r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package version for =
package gvfs-locale-ug went backwards which would break package feeds from =
(0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1=
.32.1: Package version for package gvfs-locale-uk went backwards which woul=
d break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-=
backwards]</div><div>gvfs-1.32.1: Package version for package gvfs-locale-v=
i went backwards which would break package feeds from (0:1.32.1-r0.4 to 0:1=
.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1: Package versio=
n for package gvfs-locale-zh-cn went backwards which would break package fe=
eds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><d=
iv>gvfs-1.32.1: Package version for package gvfs-locale-zh-hk went backward=
s which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [ve=
rsion-going-backwards]</div><div>gvfs-1.32.1: Package version for package g=
vfs-locale-zh-tw went backwards which would break package feeds from (0:1.3=
2.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwards]</div><div>gvfs-1.32.1:=
 Package version for package gvfs-staticdev went backwards which would brea=
k package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [version-going-backwa=
rds]</div><div>gvfs-1.32.1: Package version for package gvfs went backwards=
 which would break package feeds from (0:1.32.1-r0.4 to 0:1.32.1-r0.0) [ver=
sion-going-backwards]</div><div>libgphoto2-2.5.8: Package version for packa=
ge libgphoto2-bin went backwards which would break package feeds from (0:2.=
5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto2-2.=
5.8: Package version for package libgphoto2-camlibs went backwards which wo=
uld break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-=
backwards]</div><div>libgphoto2-2.5.8: Package version for package libgphot=
o2-dbg went backwards which would break package feeds from (0:2.5.8-r0.3 to=
 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto2-2.5.8: Packag=
e version for package libgphoto2-dev went backwards which would break packa=
ge feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div=
><div>libgphoto2-2.5.8: Package version for package libgphoto2-doc went bac=
kwards which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) =
[version-going-backwards]</div><div>libgphoto2-2.5.8: Package version for p=
ackage libgphoto2-locale-cs went backwards which would break package feeds =
from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>lib=
gphoto2-2.5.8: Package version for package libgphoto2-locale-da went backwa=
rds which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [ve=
rsion-going-backwards]</div><div>libgphoto2-2.5.8: Package version for pack=
age libgphoto2-locale-de went backwards which would break package feeds fro=
m (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgph=
oto2-2.5.8: Package version for package libgphoto2-locale-es went backwards=
 which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [versi=
on-going-backwards]</div><div>libgphoto2-2.5.8: Package version for package=
 libgphoto2-locale-eu went backwards which would break package feeds from (=
0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto=
2-2.5.8: Package version for package libgphoto2-locale-fi went backwards wh=
ich would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-=
going-backwards]</div><div>libgphoto2-2.5.8: Package version for package li=
bgphoto2-locale-fr went backwards which would break package feeds from (0:2=
.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto2-2=
.5.8: Package version for package libgphoto2-locale-hu went backwards which=
 would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-goi=
ng-backwards]</div><div>libgphoto2-2.5.8: Package version for package libgp=
hoto2-locale-it went backwards which would break package feeds from (0:2.5.=
8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto2-2.5.=
8: Package version for package libgphoto2-locale-ja went backwards which wo=
uld break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-=
backwards]</div><div>libgphoto2-2.5.8: Package version for package libgphot=
o2-locale-nl went backwards which would break package feeds from (0:2.5.8-r=
0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto2-2.5.8: =
Package version for package libgphoto2-locale-pl went backwards which would=
 break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-bac=
kwards]</div><div>libgphoto2-2.5.8: Package version for package libgphoto2-=
locale-pt-br went backwards which would break package feeds from (0:2.5.8-r=
0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto2-2.5.8: =
Package version for package libgphoto2-locale-ru went backwards which would=
 break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-bac=
kwards]</div><div>libgphoto2-2.5.8: Package version for package libgphoto2-=
locale-sk went backwards which would break package feeds from (0:2.5.8-r0.3=
 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto2-2.5.8: Pac=
kage version for package libgphoto2-locale-sr went backwards which would br=
eak package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwa=
rds]</div><div>libgphoto2-2.5.8: Package version for package libgphoto2-loc=
ale-sv went backwards which would break package feeds from (0:2.5.8-r0.3 to=
 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto2-2.5.8: Packag=
e version for package libgphoto2-locale-uk went backwards which would break=
 package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards=
]</div><div>libgphoto2-2.5.8: Package version for package libgphoto2-locale=
-vi went backwards which would break package feeds from (0:2.5.8-r0.3 to 0:=
2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto2-2.5.8: Package v=
ersion for package libgphoto2-locale-zh-cn went backwards which would break=
 package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards=
]</div><div>libgphoto2-2.5.8: Package version for package libgphoto2-locale=
-zh-tw went backwards which would break package feeds from (0:2.5.8-r0.3 to=
 0:2.5.8-r0.0) [version-going-backwards]</div><div>libgphoto2-2.5.8: Packag=
e version for package libgphoto2-staticdev went backwards which would break=
 package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards=
]</div><div>libgphoto2-2.5.8: Package version for package libgphoto2 went b=
ackwards which would break package feeds from (0:2.5.8-r0.3 to 0:2.5.8-r0.0=
) [version-going-backwards]</div><div>libgphoto2-2.5.8: Package version for=
 package libgphotoport went backwards which would break package feeds from =
(0:2.5.8-r0.3 to 0:2.5.8-r0.0) [version-going-backwards]</div><div>lxdm-0.5=
.3: Package version for package lxdm-dbg went backwards which would break p=
ackage feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]<=
/div><div>lxdm-0.5.3: Package version for package lxdm-dev went backwards w=
hich would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version=
-going-backwards]</div><div>lxdm-0.5.3: Package version for package lxdm-do=
c went backwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.=
5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package version f=
or package lxdm-locale-af went backwards which would break package feeds fr=
om (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-=
0.5.3: Package version for package lxdm-locale-ar went backwards which woul=
d break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-ba=
ckwards]</div><div>lxdm-0.5.3: Package version for package lxdm-locale-bg w=
ent backwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3=
-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package version for =
package lxdm-locale-bn-in went backwards which would break package feeds fr=
om (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-=
0.5.3: Package version for package lxdm-locale-ca went backwards which woul=
d break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-ba=
ckwards]</div><div>lxdm-0.5.3: Package version for package lxdm-locale-cs w=
ent backwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3=
-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package version for =
package lxdm-locale-da went backwards which would break package feeds from =
(1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5=
.3: Package version for package lxdm-locale-de went backwards which would b=
reak package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backw=
ards]</div><div>lxdm-0.5.3: Package version for package lxdm-locale-el went=
 backwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0=
.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package version for pac=
kage lxdm-locale-es went backwards which would break package feeds from (1:=
0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3:=
 Package version for package lxdm-locale-et went backwards which would brea=
k package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backward=
s]</div><div>lxdm-0.5.3: Package version for package lxdm-locale-eu went ba=
ckwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)=
 [version-going-backwards]</div><div>lxdm-0.5.3: Package version for packag=
e lxdm-locale-fa went backwards which would break package feeds from (1:0.5=
.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Pa=
ckage version for package lxdm-locale-fi went backwards which would break p=
ackage feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]<=
/div><div>lxdm-0.5.3: Package version for package lxdm-locale-fr went backw=
ards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [v=
ersion-going-backwards]</div><div>lxdm-0.5.3: Package version for package l=
xdm-locale-gl went backwards which would break package feeds from (1:0.5.3-=
r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Packa=
ge version for package lxdm-locale-he went backwards which would break pack=
age feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</di=
v><div>lxdm-0.5.3: Package version for package lxdm-locale-hr went backward=
s which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [vers=
ion-going-backwards]</div><div>lxdm-0.5.3: Package version for package lxdm=
-locale-hu went backwards which would break package feeds from (1:0.5.3-r0.=
4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package =
version for package lxdm-locale-id went backwards which would break package=
 feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><=
div>lxdm-0.5.3: Package version for package lxdm-locale-it went backwards w=
hich would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version=
-going-backwards]</div><div>lxdm-0.5.3: Package version for package lxdm-lo=
cale-ja went backwards which would break package feeds from (1:0.5.3-r0.4 t=
o 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package ver=
sion for package lxdm-locale-ko went backwards which would break package fe=
eds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div=
>lxdm-0.5.3: Package version for package lxdm-locale-lt went backwards whic=
h would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-go=
ing-backwards]</div><div>lxdm-0.5.3: Package version for package lxdm-local=
e-ml went backwards which would break package feeds from (1:0.5.3-r0.4 to 1=
:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package versio=
n for package lxdm-locale-ms went backwards which would break package feeds=
 from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lx=
dm-0.5.3: Package version for package lxdm-locale-nb went backwards which w=
ould break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going=
-backwards]</div><div>lxdm-0.5.3: Package version for package lxdm-locale-n=
l went backwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.=
5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package version f=
or package lxdm-locale-nn went backwards which would break package feeds fr=
om (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-=
0.5.3: Package version for package lxdm-locale-pl went backwards which woul=
d break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-ba=
ckwards]</div><div>lxdm-0.5.3: Package version for package lxdm-locale-ps w=
ent backwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3=
-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package version for =
package lxdm-locale-pt-br went backwards which would break package feeds fr=
om (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-=
0.5.3: Package version for package lxdm-locale-pt went backwards which woul=
d break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-ba=
ckwards]</div><div>lxdm-0.5.3: Package version for package lxdm-locale-ru w=
ent backwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3=
-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package version for =
package lxdm-locale-sk went backwards which would break package feeds from =
(1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5=
.3: Package version for package lxdm-locale-sl went backwards which would b=
reak package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backw=
ards]</div><div>lxdm-0.5.3: Package version for package lxdm-locale-sr went=
 backwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0=
.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package version for pac=
kage lxdm-locale-sv went backwards which would break package feeds from (1:=
0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3:=
 Package version for package lxdm-locale-tr went backwards which would brea=
k package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backward=
s]</div><div>lxdm-0.5.3: Package version for package lxdm-locale-uk went ba=
ckwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)=
 [version-going-backwards]</div><div>lxdm-0.5.3: Package version for packag=
e lxdm-locale-ur-pk went backwards which would break package feeds from (1:=
0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3:=
 Package version for package lxdm-locale-ur went backwards which would brea=
k package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backward=
s]</div><div>lxdm-0.5.3: Package version for package lxdm-locale-vi went ba=
ckwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0)=
 [version-going-backwards]</div><div>lxdm-0.5.3: Package version for packag=
e lxdm-locale-zh-cn went backwards which would break package feeds from (1:=
0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>lxdm-0.5.3:=
 Package version for package lxdm-locale-zh-tw went backwards which would b=
reak package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0.0) [version-going-backw=
ards]</div><div>lxdm-0.5.3: Package version for package lxdm-staticdev went=
 backwards which would break package feeds from (1:0.5.3-r0.4 to 1:0.5.3-r0=
.0) [version-going-backwards]</div><div>lxdm-0.5.3: Package version for pac=
kage lxdm went backwards which would break package feeds from (1:0.5.3-r0.4=
 to 1:0.5.3-r0.0) [version-going-backwards]</div><div>ntop-5.0.1: Package v=
ersion for package ntop-dbg went backwards which would break package feeds =
from (0:5.0.1-r0.3 to 0:5.0.1-r0.0) [version-going-backwards]</div><div>nto=
p-5.0.1: Package version for package ntop-dbg went backwards which would br=
eak package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0) [version-going-backwa=
rds]</div><div>ntop-5.0.1: Package version for package ntop-dbg went backwa=
rds which would break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0) [ve=
rsion-going-backwards]</div><div>ntop-5.0.1: Package version for package nt=
op-dev went backwards which would break package feeds from (0:5.0.1-r0.3 to=
 0:5.0.1-r0.0) [version-going-backwards]</div><div>ntop-5.0.1: Package vers=
ion for package ntop-dev went backwards which would break package feeds fro=
m (0:5.0.1-r0.4 to 0:5.0.1-r0.0) [version-going-backwards]</div><div>ntop-5=
.0.1: Package version for package ntop-dev went backwards which would break=
 package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0) [version-going-backwards=
]</div><div>ntop-5.0.1: Package version for package ntop-doc went backwards=
 which would break package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0) [versi=
on-going-backwards]</div><div>ntop-5.0.1: Package version for package ntop-=
doc went backwards which would break package feeds from (0:5.0.1-r0.4 to 0:=
5.0.1-r0.0) [version-going-backwards]</div><div>ntop-5.0.1: Package version=
 for package ntop-doc went backwards which would break package feeds from (=
0:5.0.1-r0.6 to 0:5.0.1-r0.0) [version-going-backwards]</div><div>ntop-5.0.=
1: Package version for package ntop-locale went backwards which would break=
 package feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0) [version-going-backwards=
]</div><div>ntop-5.0.1: Package version for package ntop-locale went backwa=
rds which would break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0) [ve=
rsion-going-backwards]</div><div>ntop-5.0.1: Package version for package nt=
op-locale went backwards which would break package feeds from (0:5.0.1-r0.6=
 to 0:5.0.1-r0.0) [version-going-backwards]</div><div>ntop-5.0.1: Package v=
ersion for package ntop-staticdev went backwards which would break package =
feeds from (0:5.0.1-r0.3 to 0:5.0.1-r0.0) [version-going-backwards]</div><d=
iv>ntop-5.0.1: Package version for package ntop-staticdev went backwards wh=
ich would break package feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0) [version-=
going-backwards]</div><div>ntop-5.0.1: Package version for package ntop-sta=
ticdev went backwards which would break package feeds from (0:5.0.1-r0.6 to=
 0:5.0.1-r0.0) [version-going-backwards]</div><div>ntop-5.0.1: Package vers=
ion for package ntop went backwards which would break package feeds from (0=
:5.0.1-r0.3 to 0:5.0.1-r0.0) [version-going-backwards]</div><div>ntop-5.0.1=
: Package version for package ntop went backwards which would break package=
 feeds from (0:5.0.1-r0.4 to 0:5.0.1-r0.0) [version-going-backwards]</div><=
div>ntop-5.0.1: Package version for package ntop went backwards which would=
 break package feeds from (0:5.0.1-r0.6 to 0:5.0.1-r0.0) [version-going-bac=
kwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34=
e4206aef_fccf7cd6a4: Package version for package libopencv-aruco-dev went b=
ackwards which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b=
22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b2=
2ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><=
div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7=
cd6a4: Package version for package libopencv-aruco went backwards which wou=
ld break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34=
e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e=
4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+git=
AUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package ver=
sion for package libopencv-bgsegm-dev went backwards which would break pack=
age feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf=
7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7=
cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27=
a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for pack=
age libopencv-bgsegm went backwards which would break package feeds from (0=
:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:=
3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [vers=
ion-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_=
a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-bio=
inspired-dev went backwards which would break package feeds from (0:3.3+git=
0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0=
+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-goin=
g-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e2067=
6a_34e4206aef_fccf7cd6a4: Package version for package libopencv-bioinspired=
 went backwards which would break package feeds from (0:3.3+git0+87c27a074d=
_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_=
2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]=
</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206ae=
f_fccf7cd6a4: Package version for package libopencv-calib3d-dev went backwa=
rds which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_=
a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a=
62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>o=
pencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4=
: Package version for package libopencv-calib3d went backwards which would =
break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e42=
06aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e420=
6aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUT=
OINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package versio=
n for package libopencv-ccalib-dev went backwards which would break package=
 feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd=
6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6=
a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a07=
4d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package=
 libopencv-ccalib went backwards which would break package feeds from (0:3.=
3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3=
+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version=
-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62=
e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-core-d=
ev went backwards which would break package feeds from (0:3.3+git0+87c27a07=
4d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074=
d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backward=
s]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206=
aef_fccf7cd6a4: Package version for package libopencv-core went backwards w=
hich would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e2=
0676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20=
676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv=
-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Pac=
kage version for package libopencv-dpm-dev went backwards which would break=
 package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef=
_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_=
fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+=
87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for=
 package libopencv-dpm went backwards which would break package feeds from =
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to =
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [ve=
rsion-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22e=
d_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-f=
ace-dev went backwards which would break package feeds from (0:3.3+git0+87c=
27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c2=
7a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-bac=
kwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34=
e4206aef_fccf7cd6a4: Package version for package libopencv-face went backwa=
rds which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_=
a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a=
62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>o=
pencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4=
: Package version for package libopencv-features2d-dev went backwards which=
 would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676=
a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a=
_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3=
+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package=
 version for package libopencv-features2d went backwards which would break =
package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_=
fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_f=
ccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+8=
7c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for =
package libopencv-flann-dev went backwards which would break package feeds =
from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.=
6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0=
) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d=
1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libope=
ncv-flann went backwards which would break package feeds from (0:3.3+git0+8=
7c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87=
c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-b=
ackwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_=
34e4206aef_fccf7cd6a4: Package version for package libopencv-fuzzy-dev went=
 backwards which would break package feeds from (0:3.3+git0+87c27a074d_2a9d=
1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1=
b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div=
><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fcc=
f7cd6a4: Package version for package libopencv-fuzzy went backwards which w=
ould break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_=
34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_3=
4e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+g=
itAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package v=
ersion for package libopencv-highgui-dev went backwards which would break p=
ackage feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_f=
ccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fc=
cf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87=
c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for p=
ackage libopencv-highgui went backwards which would break package feeds fro=
m (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 t=
o 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [=
version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b2=
2ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv=
-imgcodecs-dev went backwards which would break package feeds from (0:3.3+g=
it0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+gi=
t0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-go=
ing-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20=
676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-imgcodecs=
 went backwards which would break package feeds from (0:3.3+git0+87c27a074d=
_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_=
2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]=
</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206ae=
f_fccf7cd6a4: Package version for package libopencv-img-hash-dev went backw=
ards which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed=
_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_=
a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>=
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a=
4: Package version for package libopencv-img-hash went backwards which woul=
d break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e=
4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4=
206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitA=
UTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package vers=
ion for package libopencv-imgproc-dev went backwards which would break pack=
age feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf=
7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7=
cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27=
a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for pack=
age libopencv-imgproc went backwards which would break package feeds from (=
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0=
:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [ver=
sion-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed=
_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-li=
ne-descriptor-dev went backwards which would break package feeds from (0:3.=
3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3=
+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version=
-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62=
e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-line-d=
escriptor went backwards which would break package feeds from (0:3.3+git0+8=
7c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87=
c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-b=
ackwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_=
34e4206aef_fccf7cd6a4: Package version for package libopencv-ml-dev went ba=
ckwards which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b2=
2ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22=
ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><d=
iv>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7c=
d6a4: Package version for package libopencv-ml went backwards which would b=
reak package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e420=
6aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206=
aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTO=
INC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version=
 for package libopencv-objdetect-dev went backwards which would break packa=
ge feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7=
cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7c=
d6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a=
074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for packa=
ge libopencv-objdetect went backwards which would break package feeds from =
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to =
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [ve=
rsion-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22e=
d_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-o=
ptflow-dev went backwards which would break package feeds from (0:3.3+git0+=
87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+8=
7c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-=
backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a=
_34e4206aef_fccf7cd6a4: Package version for package libopencv-optflow went =
backwards which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1=
b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b=
22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div>=
<div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf=
7cd6a4: Package version for package libopencv-phase-unwrapping-dev went bac=
kwards which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22=
ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22e=
d_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><di=
v>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd=
6a4: Package version for package libopencv-phase-unwrapping went backwards =
which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e=
20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e2=
0676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>openc=
v-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Pa=
ckage version for package libopencv-photo-dev went backwards which would br=
eak package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206=
aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206a=
ef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOI=
NC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version =
for package libopencv-photo went backwards which would break package feeds =
from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.=
6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0=
) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d=
1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libope=
ncv-plot-dev went backwards which would break package feeds from (0:3.3+git=
0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0=
+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-goin=
g-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e2067=
6a_34e4206aef_fccf7cd6a4: Package version for package libopencv-plot went b=
ackwards which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b=
22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b2=
2ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><=
div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7=
cd6a4: Package version for package libopencv-reg-dev went backwards which w=
ould break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_=
34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_3=
4e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+g=
itAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package v=
ersion for package libopencv-reg went backwards which would break package f=
eeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a=
4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4=
-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d=
_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package l=
ibopencv-rgbd-dev went backwards which would break package feeds from (0:3.=
3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3=
+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version=
-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62=
e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-rgbd w=
ent backwards which would break package feeds from (0:3.3+git0+87c27a074d_2=
a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a=
9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</=
div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_=
fccf7cd6a4: Package version for package libopencv-saliency-dev went backwar=
ds which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a=
62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a6=
2e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>op=
encv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:=
 Package version for package libopencv-saliency went backwards which would =
break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e42=
06aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e420=
6aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUT=
OINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package versio=
n for package libopencv-shape-dev went backwards which would break package =
feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6=
a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a=
4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074=
d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package =
libopencv-shape went backwards which would break package feeds from (0:3.3+=
git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+g=
it0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-g=
oing-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e2=
0676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-stereo-d=
ev went backwards which would break package feeds from (0:3.3+git0+87c27a07=
4d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074=
d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backward=
s]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206=
aef_fccf7cd6a4: Package version for package libopencv-stereo went backwards=
 which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62=
e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e=
20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>open=
cv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: P=
ackage version for package libopencv-stitching-dev went backwards which wou=
ld break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34=
e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e=
4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+git=
AUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package ver=
sion for package libopencv-stitching went backwards which would break packa=
ge feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7=
cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7c=
d6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a=
074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for packa=
ge libopencv-structured-light-dev went backwards which would break package =
feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6=
a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a=
4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074=
d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package =
libopencv-structured-light went backwards which would break package feeds f=
rom (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6=
 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0)=
 [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1=
b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libopen=
cv-superres-dev went backwards which would break package feeds from (0:3.3+=
git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+g=
it0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-g=
oing-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e2=
0676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-superres=
 went backwards which would break package feeds from (0:3.3+git0+87c27a074d=
_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_=
2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]=
</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206ae=
f_fccf7cd6a4: Package version for package libopencv-surface-matching-dev we=
nt backwards which would break package feeds from (0:3.3+git0+87c27a074d_2a=
9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9=
d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</d=
iv><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_f=
ccf7cd6a4: Package version for package libopencv-surface-matching went back=
wards which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22e=
d_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed=
_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div=
>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6=
a4: Package version for package libopencv-tracking-dev went backwards which=
 would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676=
a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a=
_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3=
+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package=
 version for package libopencv-tracking went backwards which would break pa=
ckage feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fc=
cf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fcc=
f7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c=
27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for pa=
ckage libopencv-ts-dev went backwards which would break package feeds from =
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to =
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [ve=
rsion-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22e=
d_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-t=
s went backwards which would break package feeds from (0:3.3+git0+87c27a074=
d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d=
_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards=
]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206a=
ef_fccf7cd6a4: Package version for package libopencv-video-dev went backwar=
ds which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a=
62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a6=
2e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>op=
encv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4:=
 Package version for package libopencv-videoio-dev went backwards which wou=
ld break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34=
e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e=
4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+git=
AUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package ver=
sion for package libopencv-videoio went backwards which would break package=
 feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd=
6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6=
a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a07=
4d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package=
 libopencv-videostab-dev went backwards which would break package feeds fro=
m (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 t=
o 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [=
version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b2=
2ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv=
-videostab went backwards which would break package feeds from (0:3.3+git0+=
87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+8=
7c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-=
backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a=
_34e4206aef_fccf7cd6a4: Package version for package libopencv-video went ba=
ckwards which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b2=
2ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22=
ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><d=
iv>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7c=
d6a4: Package version for package libopencv-xfeatures2d-dev went backwards =
which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e=
20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e2=
0676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>openc=
v-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Pa=
ckage version for package libopencv-xfeatures2d went backwards which would =
break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e42=
06aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e420=
6aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUT=
OINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package versio=
n for package libopencv-ximgproc-dev went backwards which would break packa=
ge feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7=
cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7c=
d6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a=
074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for packa=
ge libopencv-ximgproc went backwards which would break package feeds from (=
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0=
:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [ver=
sion-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed=
_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package libopencv-xo=
bjdetect-dev went backwards which would break package feeds from (0:3.3+git=
0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0=
+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-goin=
g-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e2067=
6a_34e4206aef_fccf7cd6a4: Package version for package libopencv-xobjdetect =
went backwards which would break package feeds from (0:3.3+git0+87c27a074d_=
2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2=
a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]<=
/div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef=
_fccf7cd6a4: Package version for package libopencv-xphoto-dev went backward=
s which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a6=
2e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62=
e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>ope=
ncv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: =
Package version for package libopencv-xphoto went backwards which would bre=
ak package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206a=
ef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206ae=
f_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOIN=
C+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version f=
or package opencv-apps went backwards which would break package feeds from =
(0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to =
0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [ve=
rsion-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22e=
d_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package opencv-dbg =
went backwards which would break package feeds from (0:3.3+git0+87c27a074d_=
2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2=
a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]<=
/div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef=
_fccf7cd6a4: Package version for package opencv-dev went backwards which wo=
uld break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_3=
4e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34=
e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gi=
tAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package ve=
rsion for package opencv-doc went backwards which would break package feeds=
 from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0=
.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.=
0) [version-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9=
d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package version for package openc=
v-locale went backwards which would break package feeds from (0:3.3+git0+87=
c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c=
27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-ba=
ckwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_3=
4e4206aef_fccf7cd6a4: Package version for package opencv-samples went backw=
ards which would break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed=
_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_=
a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>=
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a=
4: Package version for package opencv-staticdev went backwards which would =
break package feeds from (0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e42=
06aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e420=
6aef_fccf7cd6a4-r0.0) [version-going-backwards]</div><div>opencv-3.3+gitAUT=
OINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: Package versio=
n for package opencv went backwards which would break package feeds from (0=
:3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:=
3.3+git0+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [vers=
ion-going-backwards]</div><div>opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_=
a62e20676a_34e4206aef_fccf7cd6a4: Package version for package python3-openc=
v went backwards which would break package feeds from (0:3.3+git0+87c27a074=
d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.6 to 0:3.3+git0+87c27a074d=
_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0.0) [version-going-backwards=
]</div><div>qemu-2.10.0: Package version for package qemu-dbg went backward=
s which would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0)=
 [version-going-backwards]</div><div>qemu-2.10.0: Package version for packa=
ge qemu-dbg went backwards which would break package feeds from (0:2.10.0-r=
c2-r0.1 to 0:2.10.0-r0.0) [version-going-backwards]</div><div>qemu-2.10.0: =
Package version for package qemu-dev went backwards which would break packa=
ge feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0) [version-going-backwards=
]</div><div>qemu-2.10.0: Package version for package qemu-dev went backward=
s which would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0)=
 [version-going-backwards]</div><div>qemu-2.10.0: Package version for packa=
ge qemu-doc went backwards which would break package feeds from (0:2.10.0-r=
c2-r0.0 to 0:2.10.0-r0.0) [version-going-backwards]</div><div>qemu-2.10.0: =
Package version for package qemu-doc went backwards which would break packa=
ge feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0) [version-going-backwards=
]</div><div>qemu-2.10.0: Package version for package qemu-locale went backw=
ards which would break package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0=
.0) [version-going-backwards]</div><div>qemu-2.10.0: Package version for pa=
ckage qemu-locale went backwards which would break package feeds from (0:2.=
10.0-rc2-r0.1 to 0:2.10.0-r0.0) [version-going-backwards]</div><div>qemu-2.=
10.0: Package version for package qemu-ptest went backwards which would bre=
ak package feeds from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0) [version-going-b=
ackwards]</div><div>qemu-2.10.0: Package version for package qemu-ptest wen=
t backwards which would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.=
10.0-r0.0) [version-going-backwards]</div><div>qemu-2.10.0: Package version=
 for package qemu-staticdev went backwards which would break package feeds =
from (0:2.10.0-rc2-r0.0 to 0:2.10.0-r0.0) [version-going-backwards]</div><d=
iv>qemu-2.10.0: Package version for package qemu-staticdev went backwards w=
hich would break package feeds from (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0) [v=
ersion-going-backwards]</div><div>qemu-2.10.0: Package version for package =
qemu went backwards which would break package feeds from (0:2.10.0-rc2-r0.0=
 to 0:2.10.0-r0.0) [version-going-backwards]</div><div>qemu-2.10.0: Package=
 version for package qemu went backwards which would break package feeds fr=
om (0:2.10.0-rc2-r0.1 to 0:2.10.0-r0.0) [version-going-backwards]</div><div=
><br></div><div><br></div><div>count: 2<span style=3D"white-space:pre">	</s=
pan>issue: host-user-contaminated</div><div>glibc-locale-2.26: glibc-locale=
: /glibc-binary-localedata-en-gb/usr/lib/locale/en_GB/LC_MEASUREMENT is own=
ed by uid 3004, which is the same as the user running bitbake. This may be =
due to host contamination [host-user-contaminated]</div><div>glibc-locale-2=
.26: glibc-locale: /glibc-binary-localedata-nn-no.iso-8859-1/usr/lib/locale=
/nn_NO.ISO-8859-1/LC_MEASUREMENT is owned by uid 3004, which is the same as=
 the user running bitbake. This may be due to host contamination [host-user=
-contaminated]</div><div><br></div><div><br></div><div>count: 0<span style=
=3D"white-space:pre">	</span>issue: installed-vs-shipped</div><div><br></di=
v><div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>issue=
: unknown-configure-option</div><div><br></div><div><br></div><div>count: 0=
<span style=3D"white-space:pre">	</span>issue: symlink-to-sysroot</div><div=
><br></div><div><br></div><div>count: 0<span style=3D"white-space:pre">	</s=
pan>issue: invalid-pkgconfig</div><div><br></div><div><br></div><div>count:=
 0<span style=3D"white-space:pre">	</span>issue: pkgname</div><div><br></di=
v><div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>issue=
: ldflags</div><div><br></div><div><br></div><div>count: 0<span style=3D"wh=
ite-space:pre">	</span>issue: compile-host-path</div><div><br></div><div><b=
r></div><div><br></div><div>=3D=3D Tested changes (not included in master y=
et) - bitbake =3D=3D</div><div>latest upstream commit:=C2=A0</div><div>7234=
f33 cooker: Ensure parseConfiguration clears parsecache_valid</div><div>not=
 included in master yet:=C2=A0</div><div>3ca419d world-image: add extra tar=
get</div><div>1e4c0af fetch2: Allow Fetch.download() to warn instead of err=
or</div><div><br></div><div>=3D=3D Tested changes (not included in master y=
et) - openembedded-core =3D=3D</div><div>latest upstream commit:=C2=A0</div=
><div>dd75644 insane.bbclass: Warn if ${COREBASE}/LICENSE is used</div><div=
>not included in master yet:=C2=A0</div><div>ba0ece9 report-error: Allow to=
 upload reports automatically</div><div>91ce1d7 buildhistory.bbclass: metad=
ata-revs show repo parent</div><div>63337cc metadata-revs: provide more inf=
ormation</div><div>99c01ed qemux86: Add identical qemux86copy variant for t=
ests</div><div>95364c1 reproducible_build.bbclass: initial support for bina=
ry reproducibility</div><div>a03b5e3 cpio: provide cpio-replacement-native<=
/div><div>51748e3 image_types.bbclass: improve cpio image reproducibility</=
div><div>6e998e7 rootfs-postcommands.bbclass: support binary reproducibilit=
y</div><div>61b23db insane.bbclass: write QA issues to log file only when t=
hey are in ERROR_QA or WARN_QA</div><div>781b774 sstate.bbclass: Do not cau=
se build failures due to setscene errors</div><div><br></div><div>=3D=3D Te=
sted changes (not included in master yet) - meta-openembedded =3D=3D</div><=
div>latest upstream commit:=C2=A0</div><div>e5681e1 layer.conf: remove FREE=
SMARTPHONE_GIT variable</div><div>not included in master yet:=C2=A0</div><d=
iv>10bace9 dnsmasq: disable the service by default</div><div>4f93985 rdate:=
 Fix build with hardening</div><div>e5c886b strongswan: Include stdint.h fo=
r uintptr_t</div><div>4677c6a netkit-rpc: Fix build with hardening flags</d=
iv><div>c8efb3c netkit-telnet: Fix build with hardening</div><div>76662d3 n=
cftp: Upgrade to 3.2.6</div><div>53c064f autofs: Add build dependency on li=
bnsl2</div><div>8e943f5 openhpi: Fix build on 64bit platforms e.g. aarch64<=
/div><div>da43327 security_flags.inc: Delete</div><div>2194ffc pptp-linux: =
Upgrade to 1.9.0</div><div>3426784 ebtables: replace ebtables-save perl scr=
ipt with bash rewrite</div><div>a9a8724 pimd: Upgrade to 2.3.2</div><div>f1=
31a95 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE</div><d=
iv>e7c14f4 rdate: Define logwtmp if libc !=3D glibc</div><div>ec9e308 netki=
t-ftp: Include sys/types.h for u_long definition</div><div>066a9c7 postfix:=
 Disable nis support on musl</div><div>8da3ce9 zeroconf: Fix build with mus=
l</div><div>9c2d01f ippool: Fix build errors found with hardening flags</di=
v><div>fff054d openflow: Fix build with musl</div><div>25d61ba xl2tpd: Upda=
te to 1.3.9</div><div>51b1378 c-ares: update 1.12.0 -&gt; 1.13.0</div><div>=
f636b27 radvd: 2.14 -&gt; 2.17</div><div>82bf544 libesmtp: Fix config.h def=
ine for snprintf detection</div><div>4cb7315 drbd: Add recipe</div><div>6aa=
8077 net-snmp: fix engineBoots value on SIGHUP</div><div>b270230 openl2tp: =
add LGPL-2.1 license</div><div>fb9b74b openl2tp: add init script and system=
d support</div><div>4d7fd49 ntop: add new recipe</div><div>650c226 libtdb: =
update 1.3.12 -&gt; 1.3.14</div><div>bc2ecf9 ndisc6: Upgrade to 1.0.3</div>=
<div>60b2801 memcached: Update to 1.5.0</div><div>ab22cc4 tcpdump: remove u=
nnecessary patch</div><div>424e6e6 squid: Add missing dependencies on opens=
sl expat and libxml2</div><div>07e09c6 postfix: Upgrade to 3.2.2</div><div>=
8ef3e24 freeradius: Upgrade to 3.0.15</div><div>37e3ccd tcpdump: update to =
4.9.1 to fix CVE-2017-11108</div><div>ebff0aa wireshark: 2.2.7 -&gt; 2.2.8<=
/div><div>d95f6b1 krb5: fix CVE-2017-11368</div><div>4b71e13 quagga: update=
 to 1.2.1</div><div>346ae75 openvpn: 2.4.2 -&gt; 2.4.3</div><div>d1cf702 ip=
sec-tools: fix CVE-2016-10396</div><div>1b793a9 netcf: upgrade to latest 0.=
2.8</div><div>87377c8 tftp-hpa: add systemd unit files</div><div>b04d96c op=
enconnect: fix parallel compilation failure</div><div>20c367e openconnect: =
upgrade to 7.08</div><div>6b1cd36 ndisc6: specify target location of perl</=
div><div>053e2cd wireguard-tools: Add bash to rdeps</div><div>e4a15f9 openl=
2tp: Add bash to rdeps</div><div>42116f6 squid: Disable format-truncation w=
arning only with gcc</div><div>2cb8fcb squid: Fix QA errors about wrong per=
l interpreter</div><div>08f0852 wireguard: Upgrade to 20170810 snapshot</di=
v><div>ba3a771 ippool: Fix build errors found by clang</div><div>ba00b39 is=
csitarget: Fix kernel with new 4.12+ kernel</div><div>3267d6d postfix: Fix =
build with security flags and clang</div><div>e8f4c41 openhpi: Fix build wi=
th clang+c++11</div><div>64030b1 openhpi: Fix ptest compile failures due to=
 narrowing warnings with clang</div><div>96f8322 tcpreplay: upgrade to 4.2.=
6</div><div>78433db tftp-hpa: Fix PIE build with clang</div><div>d2e0096 sa=
mba: 4.6.5 -&gt; 4.6.7</div><div>1fc6436 wolfssl: upgrade to 3.12.0</div><d=
iv>c6bf516 netperf: upgrade to 2.7.0+ with git version</div><div>2624ca3 js=
on-spirit: link to libatomic</div><div>907da25 librcf: link to libatomic</d=
iv><div>33f5af8 ntop: Fix build with musl</div><div>02ac394 corosync: Fix b=
uild with musl</div><div>88d3bbf netkit-rwho: Fix build with musl</div><div=
>ec4305b netkit-tftp: Fix build with musl</div><div>6d3a59a serial-forward:=
 Fix build with hardening+musl</div><div>f71212d gsoap: Fix build with musl=
</div><div>7b54903 libpwquality: fix do_qa_configure issue</div><div>5171cf=
f drbd-utils: only rmmod if DRBD is a module</div><div>b022240 libgphoto2: =
Copy <a href=3D"http://Makefile.in.in">Makefile.in.in</a> from gettext-nati=
ve</div><div>ef87d81 lxdm: Copy <a href=3D"http://Makefile.in.in">Makefile.=
in.in</a> from gettext-native</div><div>a541332 ndisc6: Fix build with clan=
g and update to latest on git</div><div>88b25b5 mosquitto: add from meta-in=
tel-iot-middleware and update</div><div>264cc34 paho-mqtt-c: add recipe fro=
m meta-intel-iot-middleware and update</div><div>55934c2 iptraf-ng: Add new=
 recipe</div><div>0308d95 sblim-sfcb: Fix build with musl</div><div>65a1f34=
 libmtp: fix build issue</div><div>109e1e2 libexecinfo: fix complie issue</=
div><div>dafc329 pmtools: use update-alternatives for acpixtract</div><div>=
e91e2c3 openjpeg: upgrade to 2.2.0</div><div>0160874 vpnc: Reduce lifetime =
value to widely-compatible value</div><div>2ecb705 pam-ssh-agent-auth: Get =
newer version of config.sub and config.guess scripts</div><div>9f94216 pyth=
on-matplotlib: Upgrade to 2.0.2</div><div>24dab55 wireshark: update to 2.2.=
9</div><div><br></div><div>=3D=3D Tested changes (not included in master ye=
t) - meta-qt5 =3D=3D</div><div>latest upstream commit:=C2=A0</div><div>2684=
299 qtwebengine: add patch for long paths</div><div>not included in master =
yet:=C2=A0</div><div><br></div><div>=3D=3D Tested changes (not included in =
master yet) - meta-browser =3D=3D</div><div>latest upstream commit:=C2=A0</=
div><div>972cab7 gnome-settings-daemon: remove the bbappend for removed rec=
ipe</div><div>not included in master yet:=C2=A0</div></div>

--94eb2c07afe274dd560558705acb--
