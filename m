Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3B21C7822A;
	Sun, 29 Oct 2017 14:03:05 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id b9so11509452wmh.0;
	Sun, 29 Oct 2017 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=jPaxnvX4FHylW+DetsEAfl/nP7Ik+10JYtGAP1HOxmU=;
	b=liXmCNs8q2iwS+L2JouwSWQCAUNTOo0A/ayStDcDn+MUxspq2/96spSYBHkvYAf3gM
	+YsXvlC7o1mTehi7VDcUsesNwGNu9rUm/MqyrpqWavNFHKFZGK1pXc7TchD8TWvFmipL
	7KjjABEnDm8KGrzIBVIJPwdYBZj8vmmJV2cMx1f06XZW4Zt77QqBhNVlPeRfuVTwjPlP
	3ammDdeUJD4YU9heP+RsX66NTpXkDo/t4b+EQpR/JaYHrhgTws4FleUxoiYzyZkt3Tlo
	sqXUJeA8VNu7YHU8HXjHFeZ1KzmOadr26FGicV9+qKFBoLpaT82Z5RQELGATBfqz3Wa7
	SkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jPaxnvX4FHylW+DetsEAfl/nP7Ik+10JYtGAP1HOxmU=;
	b=WvQhdgg4yh8SBTTGnhzGx0BUoOEngE1GaEG9EOR8x6IbhgZHSicYwBW4ShnbfNk+0z
	aXg92a1rslRRBjyLsftxRkPqx24mqxtf0j2+PhsVGCvhSMW8xnvyMW/CcOzYubwkzJS1
	osja4cm3hkeR8ADXtR/9HLcwB4asY5xJCFBYcsg+gdPrvN0fosDc7hsQNOH3znxxBosb
	yF41y5ikvXxnUmRaCPG/dTAsOZ2Y0MYDUDh/K4ER8dzaaVpjQAXbdD1h6xU5aPt/P4PP
	rvxzlNMeLHeT7zL5+c5p/hCNlqfOBqv3ShoHtmagN7wf65+wzy8WkkSmFinx2lTDNK8x
	tjhg==
X-Gm-Message-State: AMCzsaVCY5J5VPHF9Xm+lJ/KRgt6ZK8WzR0GTskw1YL4/vQH4jTLj8Oa
	ccrqFe4o4cP9CKhYAZT9Ky0MP11Ef0APARrF0cKVew==
X-Google-Smtp-Source: ABhQp+Tvu+EvDabDQCPAQdQ1gCMAi/eK2KGV52eWdXYZgrGXNL7Me/5iF5LN7MkD11pZA20Y3RLx3CkgZl2YlZDMyjA=
X-Received: by 10.28.58.81 with SMTP id h78mr1618378wma.10.1509285785431; Sun,
	29 Oct 2017 07:03:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Sun, 29 Oct 2017 07:03:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 29 Oct 2017 15:03:04 +0100
Message-ID: <CA+chaQeH4D1Kds-zGmFvFroueyjVRsHfg1KFbQaK8pPOsjjpBA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-10-27
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
X-List-Received-Date: Sun, 29 Oct 2017 14:03:07 -0000
Content-Type: multipart/alternative; boundary="001a1148d7081af63b055caffba7"

--001a1148d7081af63b055caffba7
Content-Type: text/plain; charset="UTF-8"

This is first report which includes qemuarm64 MACHINE.

Next one will use musl for qemux86 build (other MACHINEs will continue to
use default glibc).

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date      !!colspan='4'|Failed tasks     !!|Signatures
!!colspan='15'|QA !!Comment
|-
|| ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all ||already-stripped
||libdir ||textrel ||build-deps ||file-rdeps ||version-going-backwards
||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option
||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
||compile-host-path ||qa_pseudo ||
|-
||2017-10-27 ||4 ||7 ||1 ||1 ||0 ||0 ||0 ||3 ||0 ||0 ||0 ||5 ||0 ||0 ||0 ||0
||0 ||0 ||0 ||83 ||
|}

== Failed tasks 2017-10-27 ==

INFO: jenkins-job.sh-1.8.39 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171029_035859.log

=== common (0) ===

=== common-x86 (0) ===

=== qemuarm (4) ===
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_package_qa
    * meta-qt5/recipes-qt/qt5/qtscript_git.bb:do_package_qa
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:
do_package_qa

=== qemuarm64 (6) ===
    * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:
do_compile
    *
meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:
do_compile
    *
meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:
do_install
    *
meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:
do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtquickcontrols2_git.bb:do_package_qa

=== qemux86 (1) ===
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:
do_package_qa

=== qemux86_64 (1) ===
    *
meta-openembedded/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb:
do_package_qa

=== Number of failed tasks (13) ===
{| class=wikitable
|-
|| qemuarm || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171027_092326.log/
|| http://errors.yoctoproject.org/Errors/Build/47783/
|-
|| qemuarm64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm64.20171028_211559.log/
|| http://errors.yoctoproject.org/Errors/Build/47836/
|-
|| qemux86 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171027_091257.log/
|| http://errors.yoctoproject.org/Errors/Build/47784/
|-
|| qemux86_64 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171027_133824.log/
|| http://errors.yoctoproject.org/Errors/Build/47787/
|}

=== PNBLACKLISTs (1) ===
=== QA issues (91) ===
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
||0 ||version-going-backwards
|-
||3 ||textrel
|-
||5 ||host-user-contaminated
|-
||83 ||qa_pseudo
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20171028_203040.log/

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


count: 3 issue: textrel
corosync-2.4.2: ELF binary
'/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 0 issue: file-rdeps


count: 0 issue: version-going-backwards


count: 5 issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ms-my/usr/lib/locale/ms_MY/LC_COLLATE is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-quz-pe/usr/lib/locale/quz_PE/LC_NAME is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: qtbase:
/qtbase-dev/usr/lib/cmake/Qt5Gui/Qt5Gui_QJpegPlugin.cmake is owned by uid
3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: qtquickcontrols2:
/qtquickcontrols2-qmlplugins/usr/lib/qt5/qml/QtQuick/Controls.2/Material/qmldir
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: qtscript:
/qtscript-mkspecs/usr/lib/qt5/mkspecs/modules/qt_lib_script.pri is owned by
uid 3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path


count: 83 issue: qa_pseudo
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/core2-64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/i586-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/armv5te-oe-linux-gnueabi/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/core2-64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/i586-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/armv5te-oe-linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/i586-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This
/work/armv5te-oe-linux-gnueabi/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
python3-smmap-0.9.0: This
/work/core2-64-oe-linux/python3-smmap/0.9.0-r0/pseudo/pseudo.log indicates
8 errors [qa_pseudo]
python-vobject-0.9.5: This
/work/core2-64-oe-linux/python-vobject/0.9.5-r0/pseudo/pseudo.log indicates
8 errors [qa_pseudo]
qsiv-1.1: This /work/i586-oe-linux/qsiv/1.1-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log
indicates 18 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/core2-64-oe-linux/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/i586-oe-linux/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qt5-creator-3.5.1: This
/work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qt5-creator-3.5.1: This
/work/core2-64-oe-linux/qt5-creator/3.5.1-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
qt5nmapcarousedemo-1.0: This
/work/core2-64-oe-linux/qt5nmapcarousedemo/1.0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/armv5te-oe-linux-gnueabi/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/core2-64-oe-linux/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/i586-oe-linux/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/armv5te-oe-linux-gnueabi/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/core2-64-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/i586-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This
/work/armv5te-oe-linux-gnueabi/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This
/work/i586-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/armv5te-oe-linux-gnueabi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/core2-64-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log
indicates 20 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/i586-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log
indicates 25 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/armv5te-oe-linux-gnueabi/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/core2-64-oe-linux/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/i586-oe-linux/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/armv5te-oe-linux-gnueabi/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log
indicates 18 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/core2-64-oe-linux/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/i586-oe-linux/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/armv5te-oe-linux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/core2-64-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/i586-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/armv5te-oe-linux-gnueabi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/core2-64-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/i586-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/core2-64-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log
indicates 19 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/i586-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log
indicates 20 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/armv5te-oe-linux-gnueabi/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/core2-64-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/i586-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/armv5te-oe-linux-gnueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/core2-64-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/i586-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/armv5te-oe-linux-gnueabi/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/core2-64-oe-linux/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/i586-oe-linux/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/armv5te-oe-linux-gnueabi/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/core2-64-oe-linux/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log
indicates 15 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/i586-oe-linux/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/armv5te-oe-linux-gnueabi/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/core2-64-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log
indicates 15 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/i586-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/armv5te-oe-linux-gnueabi/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/core2-64-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/i586-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This
/work/armv5te-oe-linux-gnueabi/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This
/work/core2-64-oe-linux/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This
/work/i586-oe-linux/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/armv5te-oe-linux-gnueabi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/core2-64-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/i586-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/aarch64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/core2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/i586-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/armv5e-oe-linux-gnueabi/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/core2-64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/i586-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/armv5te-oe-linux-gnueabi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/core2-64-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log
indicates 19 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/i586-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log
indicates 18 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/aarch64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/i586-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/armv5te-oe-linux-gnueabi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/core2-64-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/i586-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
be393f2 toaster/highlight.pack.js: Fix corrupted file
not included in master yet:
3fba1ad world-image: add extra target
c7c01bf fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
3b413a8 README.qemu: qemuppc64 is not supported
not included in master yet:
3ff8d67 report-error: Allow to upload reports automatically
c7e8c96 buildhistory.bbclass: metadata-revs show repo parent
e2c9020 metadata-revs: provide more information
cd6556e qemux86: Add identical qemux86copy variant for tests
347a734 reproducible_build.bbclass: initial support for binary
reproducibility
625d2bc cpio: provide cpio-replacement-native
ce7ca36 image_types.bbclass: improve cpio image reproducibility
fea2911 rootfs-postcommands.bbclass: support binary reproducibility
981e97a sstate.bbclass: Do not cause build failures due to setscene errors
b53517c insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
f829dbd libsdl2: allow to build native and nativesdk
5c05822 libdrm: allow to build native and nativesdk
95faa5e nativesdk-mesa,mesa-native: add new recipe to build small part of
mesa
bd4c162 libepoxy: add support for native(sdk)
3092b61 libjpeg-turbo: provide nativesdk version
5471ea7 virglrenderer: add new recipe
8c4c3fc virglrenderer: fix target build
81e5bc3 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
c37486d insane.bbclass: use package_qa_handle_error for do_qa_pseudo

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
5d6d21e libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
not included in master yet:
ebcef48 bridge-utils: modify the AR to cross toolchain

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
not included in master yet:
197811b qtwebengine: make test suite succeed

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
26d5066 firefox: fix build failures
not included in master yet:
6773bf9 meta: drop ${COREBASE}/LICENSE references

--001a1148d7081af63b055caffba7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>This is first report which includes qe=
muarm64 MACHINE.</div><div><br></div><div>Next one will use musl for qemux8=
6 build (other MACHINEs will continue to use default glibc).</div><div><br>=
</div><div><a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status=
">http://www.openembedded.org/wiki/Bitbake_World_Status</a></div><div><br><=
/div><div>=3D=3D Number of issues - stats =3D=3D</div><div>{| class=3D&#39;=
wikitable&#39;</div><div>!|Date<span style=3D"white-space:pre">		</span>=C2=
=A0 =C2=A0 =C2=A0!!colspan=3D&#39;4&#39;|Failed tasks<span style=3D"white-s=
pace:pre">			</span>=C2=A0 =C2=A0 !!|Signatures<span style=3D"white-space:p=
re">		</span>=C2=A0 !!colspan=3D&#39;15&#39;|QA !!Comment</div><div>|-</div=
><div>||<span style=3D"white-space:pre">		</span>||qemuarm<span style=3D"wh=
ite-space:pre">	</span>||qemuarm64<span style=3D"white-space:pre">	</span>|=
|qemux86<span style=3D"white-space:pre">	</span>||qemux86_64<span style=3D"=
white-space:pre">	</span>||all <span style=3D"white-space:pre">	</span>||al=
ready-stripped<span style=3D"white-space:pre">	</span>||libdir<span style=
=3D"white-space:pre">	</span>||textrel<span style=3D"white-space:pre">	</sp=
an>||build-deps<span style=3D"white-space:pre">	</span>||file-rdeps<span st=
yle=3D"white-space:pre">	</span>||version-going-backwards<span style=3D"whi=
te-space:pre">	</span>||host-user-contaminated<span style=3D"white-space:pr=
e">	</span>||installed-vs-shipped<span style=3D"white-space:pre">	</span>||=
unknown-configure-option<span style=3D"white-space:pre">	</span>||symlink-t=
o-sysroot<span style=3D"white-space:pre">	</span>||invalid-pkgconfig<span s=
tyle=3D"white-space:pre">	</span>||pkgname<span style=3D"white-space:pre">	=
</span>||ldflags<span style=3D"white-space:pre">	</span>||compile-host-path=
<span style=3D"white-space:pre">	</span>||qa_pseudo<span style=3D"white-spa=
ce:pre">	</span>||<span style=3D"white-space:pre">	</span></div><div>|-</di=
v><div>||2017-10-27<span style=3D"white-space:pre">	</span>||4<span style=
=3D"white-space:pre">	</span>||7<span style=3D"white-space:pre">	</span>||1=
<span style=3D"white-space:pre">	</span>||1<span style=3D"white-space:pre">=
	</span>||0<span style=3D"white-space:pre">	</span>||0<span style=3D"white-=
space:pre">		</span>||0<span style=3D"white-space:pre">		</span>||3<span st=
yle=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		</spa=
n>||0<span style=3D"white-space:pre">		</span>||0<span style=3D"white-space=
:pre">		</span>||5<span style=3D"white-space:pre">		</span>||0<span style=
=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		</span>|=
|0<span style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pr=
e">		</span>||0<span style=3D"white-space:pre">		</span>||0<span style=3D"w=
hite-space:pre">		</span>||0<span style=3D"white-space:pre">		</span>||83<s=
pan style=3D"white-space:pre">		</span>||<span style=3D"white-space:pre">	<=
/span></div><div>|}</div><div><br></div><div>=3D=3D Failed tasks 2017-10-27=
 =3D=3D</div><div><br></div><div>INFO: jenkins-job.sh-1.8.39 Complete log a=
vailable at <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko=
/log.report.20171029_035859.log">http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/rocko/log.report.20171029_035859.log</a></div><div><br></div><div>=3D=
=3D=3D common (0) =3D=3D=3D</div><div><br></div><div>=3D=3D=3D common-x86 (=
0) =3D=3D=3D</div><div><br></div><div>=3D=3D=3D qemuarm (4) =3D=3D=3D</div>=
<div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-devtools/android-too=
ls/android-tools_5.1.1.r37.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-qt5=
/recipes-qt/qt5/qtbase_git.bb:do_package_qa</div><div>=C2=A0 =C2=A0 * meta-=
qt5/recipes-qt/qt5/qtscript_git.bb:do_package_qa</div><div>=C2=A0 =C2=A0 * =
openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_package_q=
a</div><div><br></div><div>=3D=3D=3D qemuarm64 (6) =3D=3D=3D</div><div>=C2=
=A0 =C2=A0 * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:=
do_compile</div><div>=C2=A0 =C2=A0 * meta-browser/recipes-browser/chromium/=
chromium-wayland_53.0.2785.143.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta=
-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:=
do_install</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-initramfs/recip=
es-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure</div><div>=C2=A0 =
=C2=A0 * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:=
do_compile</div><div>=C2=A0 =C2=A0 * meta-qt5/recipes-qt/qt5/qtquickcontrol=
s2_git.bb:do_package_qa</div><div><br></div><div>=3D=3D=3D qemux86 (1) =3D=
=3D=3D</div><div>=C2=A0 =C2=A0 * openembedded-core/meta/recipes-multimedia/=
x264/x264_git.bb:do_package_qa</div><div><br></div><div>=3D=3D=3D qemux86_6=
4 (1) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-networking=
/recipes-extended/corosync/corosync_2.4.2.bb:do_package_qa</div><div><br></=
div><div>=3D=3D=3D Number of failed tasks (13) =3D=3D=3D</div><div>{| class=
=3Dwikitable</div><div>|-</div><div>|| qemuarm <span style=3D"white-space:p=
re">	</span>|| 4<span style=3D"white-space:pre">	</span> || <a href=3D"http=
://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171027=
_092326.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.worl=
d.qemuarm.20171027_092326.log/</a> || <a href=3D"http://errors.yoctoproject=
.org/Errors/Build/47783/">http://errors.yoctoproject.org/Errors/Build/47783=
/</a></div><div>|-</div><div>|| qemuarm64 <span style=3D"white-space:pre">	=
</span>|| 7<span style=3D"white-space:pre">	</span> || <a href=3D"http://lo=
gs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm64.20171028_21=
1559.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.q=
emuarm64.20171028_211559.log/</a> || <a href=3D"http://errors.yoctoproject.=
org/Errors/Build/47836/">http://errors.yoctoproject.org/Errors/Build/47836/=
</a></div><div>|-</div><div>|| qemux86 <span style=3D"white-space:pre">	</s=
pan>|| 1<span style=3D"white-space:pre">	</span> || <a href=3D"http://logs.=
nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171027_091257.=
log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux8=
6.20171027_091257.log/</a> || <a href=3D"http://errors.yoctoproject.org/Err=
ors/Build/47784/">http://errors.yoctoproject.org/Errors/Build/47784/</a></d=
iv><div>|-</div><div>|| qemux86_64 <span style=3D"white-space:pre">	</span>=
|| 1<span style=3D"white-space:pre">	</span> || <a href=3D"http://logs.nslu=
2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171027_133824.l=
og/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86=
-64.20171027_133824.log/</a> || <a href=3D"http://errors.yoctoproject.org/E=
rrors/Build/47787/">http://errors.yoctoproject.org/Errors/Build/47787/</a><=
/div><div>|}</div><div><br></div><div>=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D<=
/div><div>=3D=3D=3D QA issues (91) =3D=3D=3D</div><div>{| class=3Dwikitable=
</div><div>!| Count<span style=3D"white-space:pre">		</span>||Issue</div><d=
iv>|-</div><div>||0<span style=3D"white-space:pre">	</span>||already-stripp=
ed</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||buil=
d-deps</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||=
compile-host-path</div><div>|-</div><div>||0<span style=3D"white-space:pre"=
>	</span>||file-rdeps</div><div>|-</div><div>||0<span style=3D"white-space:=
pre">	</span>||installed-vs-shipped</div><div>|-</div><div>||0<span style=
=3D"white-space:pre">	</span>||invalid-pkgconfig</div><div>|-</div><div>||0=
<span style=3D"white-space:pre">	</span>||ldflags</div><div>|-</div><div>||=
0<span style=3D"white-space:pre">	</span>||libdir</div><div>|-</div><div>||=
0<span style=3D"white-space:pre">	</span>||pkgname</div><div>|-</div><div>|=
|0<span style=3D"white-space:pre">	</span>||symlink-to-sysroot</div><div>|-=
</div><div>||0<span style=3D"white-space:pre">	</span>||unknown-configure-o=
ption</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||v=
ersion-going-backwards</div><div>|-</div><div>||3<span style=3D"white-space=
:pre">	</span>||textrel</div><div>|-</div><div>||5<span style=3D"white-spac=
e:pre">	</span>||host-user-contaminated</div><div>|-</div><div>||83<span st=
yle=3D"white-space:pre">	</span>||qa_pseudo</div><div>|}</div><div><br></di=
v><div><br></div><div><br></div><div>=3D=3D=3D Incorrect PACKAGE_ARCH or ss=
tate signatures (0) =3D=3D=3D</div><div><br></div><div>Complete log: <a hre=
f=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20=
171028_203040.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/lo=
g.signatures.20171028_203040.log/</a></div><div><br></div><div>No issues de=
tected</div><div><br></div><div><br></div><div>PNBLACKLISTs:</div><div>open=
embedded-core/:</div><div>meta-browser:</div><div>meta-openembedded:</div><=
div>meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNB=
LACKLIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_conne=
ctx symbol&quot;, &#39;&#39;, d)}&quot;</div><div>meta-qt5:</div><div>PNBLA=
CKLIST[android-system] =3D &quot;depends on lxc from meta-virtualiazation w=
hich isn&#39;t included in my world builds&quot;</div><div>PNBLACKLIST[bigb=
uckbunny-1080p] =3D &quot;big and doesn&#39;t really need to be tested so m=
uch&quot;</div><div>PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&=
#39;t really need to be tested so much&quot;</div><div>PNBLACKLIST[bigbuckb=
unny-720p] =3D &quot;big and doesn&#39;t really need to be tested so much&q=
uot;</div><div>PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t=
 really need to be tested so much&quot;</div><div>PNBLACKLIST[tearsofsteel-=
1080p] =3D &quot;big and doesn&#39;t really need to be tested so much&quot;=
</div><div>PNBLACKLIST[build-appliance-image] =3D &quot;tries to include wh=
ole downloads directory in /home/builder/poky :/&quot;</div><div><br></div>=
<div><br></div><div>QA issues by type:</div><div>count: 0<span style=3D"whi=
te-space:pre">	</span>issue: already-stripped</div><div><br></div><div><br>=
</div><div>count: 0<span style=3D"white-space:pre">	</span>issue: libdir</d=
iv><div><br></div><div><br></div><div>count: 3<span style=3D"white-space:pr=
e">	</span>issue: textrel</div><div>corosync-2.4.2: ELF binary &#39;/work/c=
ore2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosyn=
c&#39; has relocations in .text [textrel]</div><div>x264-r2731+gitAUTOINC+2=
b741f81e5: ELF binary &#39;/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f=
81e5-r0/packages-split/x264-bin/usr/bin/x264&#39; has relocations in .text =
[textrel]</div><div>x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/work=
/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/=
lib/libx264.so.148&#39; has relocations in .text [textrel]</div><div><br></=
div><div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>iss=
ue: build-deps</div><div><br></div><div><br></div><div>count: 0<span style=
=3D"white-space:pre">	</span>issue: file-rdeps</div><div><br></div><div><br=
></div><div>count: 0<span style=3D"white-space:pre">	</span>issue: version-=
going-backwards</div><div><br></div><div><br></div><div>count: 5<span style=
=3D"white-space:pre">	</span>issue: host-user-contaminated</div><div>glibc-=
locale-2.26: glibc-locale: /glibc-binary-localedata-ms-my/usr/lib/locale/ms=
_MY/LC_COLLATE is owned by uid 3004, which is the same as the user running =
bitbake. This may be due to host contamination [host-user-contaminated]</di=
v><div>glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-quz-pe/usr=
/lib/locale/quz_PE/LC_NAME is owned by uid 3004, which is the same as the u=
ser running bitbake. This may be due to host contamination [host-user-conta=
minated]</div><div>qtbase-5.9.2+gitAUTOINC+ec16ba393b: qtbase: /qtbase-dev/=
usr/lib/cmake/Qt5Gui/Qt5Gui_QJpegPlugin.cmake is owned by uid 3004, which i=
s the same as the user running bitbake. This may be due to host contaminati=
on [host-user-contaminated]</div><div>qtquickcontrols2-5.9.2+gitAUTOINC+871=
d8e8e2f: qtquickcontrols2: /qtquickcontrols2-qmlplugins/usr/lib/qt5/qml/QtQ=
uick/Controls.2/Material/qmldir is owned by uid 3004, which is the same as =
the user running bitbake. This may be due to host contamination [host-user-=
contaminated]</div><div>qtscript-5.9.2+gitAUTOINC+08b74f4f30: qtscript: /qt=
script-mkspecs/usr/lib/qt5/mkspecs/modules/qt_lib_script.pri is owned by ui=
d 3004, which is the same as the user running bitbake. This may be due to h=
ost contamination [host-user-contaminated]</div><div><br></div><div><br></d=
iv><div>count: 0<span style=3D"white-space:pre">	</span>issue: installed-vs=
-shipped</div><div><br></div><div><br></div><div>count: 0<span style=3D"whi=
te-space:pre">	</span>issue: unknown-configure-option</div><div><br></div><=
div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>issue: s=
ymlink-to-sysroot</div><div><br></div><div><br></div><div>count: 0<span sty=
le=3D"white-space:pre">	</span>issue: invalid-pkgconfig</div><div><br></div=
><div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>issue:=
 pkgname</div><div><br></div><div><br></div><div>count: 0<span style=3D"whi=
te-space:pre">	</span>issue: ldflags</div><div><br></div><div><br></div><di=
v>count: 0<span style=3D"white-space:pre">	</span>issue: compile-host-path<=
/div><div><br></div><div><br></div><div>count: 83<span style=3D"white-space=
:pre">	</span>issue: qa_pseudo</div><div>libconnman-qt5-1.2.4+gitAUTOINC+9d=
98e12ed6: This /work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.2.4+gitAUTOI=
NC+9d98e12ed6-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]</div><di=
v>libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/=
libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 1=
3 errors [qa_pseudo]</div><div>libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: =
This /work/i586-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseu=
do/pseudo.log indicates 13 errors [qa_pseudo]</div><div>libqofono-0.92+gitr=
AUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueabi/libqofono/0.92+gitr=
AUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]</di=
v><div>libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/=
libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 17 err=
ors [qa_pseudo]</div><div>libqofono-0.92+gitrAUTOINC+6916cd030b: This /work=
/i586-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log i=
ndicates 13 errors [qa_pseudo]</div><div>maliit-framework-qt5-0.99.0+gitAUT=
OINC+60b1b10de1: This /work/armv5te-oe-linux-gnueabi/maliit-framework-qt5/0=
.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 12 errors [qa_ps=
eudo]</div><div>maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /wo=
rk/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/p=
seudo/pseudo.log indicates 11 errors [qa_pseudo]</div><div>maliit-framework=
-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/i586-oe-linux/maliit-framewor=
k-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 10 errors=
 [qa_pseudo]</div><div>maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: Thi=
s /work/armv5te-oe-linux-gnueabi/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a34=
85926-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]</div><div>python=
3-smmap-0.9.0: This /work/core2-64-oe-linux/python3-smmap/0.9.0-r0/pseudo/p=
seudo.log indicates 8 errors [qa_pseudo]</div><div>python-vobject-0.9.5: Th=
is /work/core2-64-oe-linux/python-vobject/0.9.5-r0/pseudo/pseudo.log indica=
tes 8 errors [qa_pseudo]</div><div>qsiv-1.1: This /work/i586-oe-linux/qsiv/=
1.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>qt3d-5.9.=
2+gitAUTOINC+143b721249: This /work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+git=
AUTOINC+143b721249-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]</di=
v><div>qt3d-5.9.2+gitAUTOINC+143b721249: This /work/core2-64-oe-linux/qt3d/=
5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 12 errors [qa_ps=
eudo]</div><div>qt3d-5.9.2+gitAUTOINC+143b721249: This /work/i586-oe-linux/=
qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 13 errors [=
qa_pseudo]</div><div>qt5-creator-3.5.1: This /work/armv5te-oe-linux-gnueabi=
/qt5-creator/3.5.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</di=
v><div>qt5-creator-3.5.1: This /work/core2-64-oe-linux/qt5-creator/3.5.1-r0=
/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</div><div>qt5nmapcarouse=
demo-1.0: This /work/core2-64-oe-linux/qt5nmapcarousedemo/1.0-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]</div><div>qtcharts-5.9.2+gitAUTOINC=
+e3af14e916: This /work/armv5te-oe-linux-gnueabi/qtcharts/5.9.2+gitAUTOINC+=
e3af14e916-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]</div><div>q=
tcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/core2-64-oe-linux/qtcharts/=
5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 13 errors [qa_ps=
eudo]</div><div>qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/i586-oe-li=
nux/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 13 =
errors [qa_pseudo]</div><div>qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: Th=
is /work/armv5te-oe-linux-gnueabi/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb844=
0-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]</div><div>qtconnecti=
vity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/core2-64-oe-linux/qtconnectivi=
ty/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates 13 errors [qa=
_pseudo]</div><div>qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/i=
586-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.lo=
g indicates 13 errors [qa_pseudo]</div><div>qtdatavis3d-5.9.2+gitAUTOINC+83=
29a8fb28: This /work/armv5te-oe-linux-gnueabi/qtdatavis3d/5.9.2+gitAUTOINC+=
8329a8fb28-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]</div><div>q=
tdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/i586-oe-linux/qtdatavis3=
d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 12 errors [qa_=
pseudo]</div><div>qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/arm=
v5te-oe-linux-gnueabi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/p=
seudo.log indicates 17 errors [qa_pseudo]</div><div>qtdeclarative-5.9.2+git=
AUTOINC+32218c3243: This /work/core2-64-oe-linux/qtdeclarative/5.9.2+gitAUT=
OINC+32218c3243-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]</div><=
div>qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/i586-oe-linux/qtd=
eclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 25 er=
rors [qa_pseudo]</div><div>qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /wor=
k/armv5te-oe-linux-gnueabi/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/=
pseudo.log indicates 13 errors [qa_pseudo]</div><div>qtenginio-5.9.2+gitAUT=
OINC+23603a3b08: This /work/core2-64-oe-linux/qtenginio/5.9.2+gitAUTOINC+23=
603a3b08-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]</div><div>qte=
nginio-5.9.2+gitAUTOINC+23603a3b08: This /work/i586-oe-linux/qtenginio/5.9.=
2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo=
]</div><div>qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/armv5te-oe-li=
nux-gnueabi/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indi=
cates 18 errors [qa_pseudo]</div><div>qtgamepad-5.9.2+gitAUTOINC+167566d228=
: This /work/core2-64-oe-linux/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]</div><div>qtgamepad-5.9.2+gi=
tAUTOINC+167566d228: This /work/i586-oe-linux/qtgamepad/5.9.2+gitAUTOINC+16=
7566d228-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]</div><div>qtl=
ocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/armv5te-oe-linux=
-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo=
.log indicates 11 errors [qa_pseudo]</div><div>qtlocation-5.9.2+gitAUTOINC+=
d919f47308_1c633072fc: This /work/core2-64-oe-linux/qtlocation/5.9.2+gitAUT=
OINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log indicates 12 errors [qa_pse=
udo]</div><div>qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /wor=
k/i586-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo=
/pseudo.log indicates 13 errors [qa_pseudo]</div><div>qtmultimedia-5.9.2+gi=
tAUTOINC+1e2702e86d: This /work/armv5te-oe-linux-gnueabi/qtmultimedia/5.9.2=
+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]=
</div><div>qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/core2-64-oe=
-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indica=
tes 13 errors [qa_pseudo]</div><div>qtmultimedia-5.9.2+gitAUTOINC+1e2702e86=
d: This /work/i586-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>qtquick1-5.9.2+git=
AUTOINC+9bf0edd9bd: This /work/core2-64-oe-linux/qtquick1/5.9.2+gitAUTOINC+=
9bf0edd9bd-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]</div><div>q=
tquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/i586-oe-linux/qtquick1/5.9.=
2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo=
]</div><div>qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/armv5t=
e-oe-linux-gnueabi/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/p=
seudo.log indicates 11 errors [qa_pseudo]</div><div>qtquickcontrols2-5.9.2+=
gitAUTOINC+871d8e8e2f: This /work/core2-64-oe-linux/qtquickcontrols2/5.9.2+=
gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]<=
/div><div>qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/i586-oe-=
linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log ind=
icates 13 errors [qa_pseudo]</div><div>qtremoteobjects-5.9.2+gitAUTOINC+6e0=
341bc87: This /work/armv5te-oe-linux-gnueabi/qtremoteobjects/5.9.2+gitAUTOI=
NC+6e0341bc87-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]</div><di=
v>qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/core2-64-oe-linux=
/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates=
 13 errors [qa_pseudo]</div><div>qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc8=
7: This /work/i586-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/=
pseudo/pseudo.log indicates 13 errors [qa_pseudo]</div><div>qtscxml-5.9.2+g=
itAUTOINC+3caae998c8: This /work/armv5te-oe-linux-gnueabi/qtscxml/5.9.2+git=
AUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]</di=
v><div>qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/core2-64-oe-linux/qt=
scxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 errors =
[qa_pseudo]</div><div>qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/i586-=
oe-linux/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates=
 13 errors [qa_pseudo]</div><div>qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: Thi=
s /work/armv5te-oe-linux-gnueabi/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/p=
seudo/pseudo.log indicates 13 errors [qa_pseudo]</div><div>qtsensors-5.9.2+=
gitAUTOINC+c273f2e5c8: This /work/core2-64-oe-linux/qtsensors/5.9.2+gitAUTO=
INC+c273f2e5c8-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]</div><d=
iv>qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/i586-oe-linux/qtsensor=
s/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 14 errors [qa_=
pseudo]</div><div>qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/armv5te=
-oe-linux-gnueabi/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]</div><div>qtsystems-5.9.2+gitAUTOINC+9c20=
4e05ae: This /work/core2-64-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-=
r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]</div><div>qtsystems-5.=
9.2+gitAUTOINC+9c204e05ae: This /work/i586-oe-linux/qtsystems/5.9.2+gitAUTO=
INC+9c204e05ae-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><d=
iv>qttools-5.9.2+gitAUTOINC+90a701032e: This /work/armv5te-oe-linux-gnueabi=
/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 11 erro=
rs [qa_pseudo]</div><div>qttools-5.9.2+gitAUTOINC+90a701032e: This /work/co=
re2-64-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log in=
dicates 13 errors [qa_pseudo]</div><div>qttools-5.9.2+gitAUTOINC+90a701032e=
: This /work/i586-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]</div><div>qtwayland-5.9.2+gitAUTOI=
NC+d483ed2927: This /work/armv5te-oe-linux-gnueabi/qtwayland/5.9.2+gitAUTOI=
NC+d483ed2927-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><di=
v>qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/core2-64-oe-linux/qtway=
land/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 13 errors [=
qa_pseudo]</div><div>qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/i586=
-oe-linux/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indica=
tes 13 errors [qa_pseudo]</div><div>qtwebchannel-5.9.2+gitAUTOINC+61a638663=
c: This /work/armv5te-oe-linux-gnueabi/qtwebchannel/5.9.2+gitAUTOINC+61a638=
663c-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</div><div>qtwebch=
annel-5.9.2+gitAUTOINC+61a638663c: This /work/core2-64-oe-linux/qtwebchanne=
l/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 13 errors [qa_=
pseudo]</div><div>qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/i586=
-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log ind=
icates 13 errors [qa_pseudo]</div><div>qtwebengine-5.9.2+gitAUTOINC+c11c2c8=
981_cfe8c60903: This /work/aarch64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c1=
1c2c8981_cfe8c60903-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]</d=
iv><div>qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/core=
2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/=
pseudo.log indicates 12 errors [qa_pseudo]</div><div>qtwebengine-5.9.2+gitA=
UTOINC+c11c2c8981_cfe8c60903: This /work/i586-oe-linux/qtwebengine/5.9.2+gi=
tAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log indicates 12 errors [qa=
_pseudo]</div><div>qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/armv5e-=
oe-linux-gnueabi/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log =
indicates 13 errors [qa_pseudo]</div><div>qtwebkit-5.9.2+gitAUTOINC+97c4a80=
a12: This /work/core2-64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/p=
seudo/pseudo.log indicates 13 errors [qa_pseudo]</div><div>qtwebkit-5.9.2+g=
itAUTOINC+97c4a80a12: This /work/i586-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97=
c4a80a12-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]</div><div>qtw=
ebsockets-5.9.2+gitAUTOINC+492981b932: This /work/armv5te-oe-linux-gnueabi/=
qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 16 =
errors [qa_pseudo]</div><div>qtwebsockets-5.9.2+gitAUTOINC+492981b932: This=
 /work/core2-64-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo=
/pseudo.log indicates 19 errors [qa_pseudo]</div><div>qtwebsockets-5.9.2+gi=
tAUTOINC+492981b932: This /work/i586-oe-linux/qtwebsockets/5.9.2+gitAUTOINC=
+492981b932-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]</div><div>=
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/aarch64-oe-linux/qtwebvie=
w/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 14 errors [qa_=
pseudo]</div><div>qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/core2-6=
4-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indic=
ates 7 errors [qa_pseudo]</div><div>qtwebview-5.9.2+gitAUTOINC+ec640efd1d: =
This /work/i586-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/ps=
eudo.log indicates 7 errors [qa_pseudo]</div><div>qtxmlpatterns-5.9.2+gitAU=
TOINC+8d7e1e0ec0: This /work/armv5te-oe-linux-gnueabi/qtxmlpatterns/5.9.2+g=
itAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</=
div><div>qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/core2-64-oe-=
linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]</div><div>qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0e=
c0: This /work/i586-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/p=
seudo/pseudo.log indicates 16 errors [qa_pseudo]</div><div><br></div><div><=
br></div><div><br></div><div>This git log matches with the metadata as seen=
 by qemuarm build.</div><div>In some cases qemux86 and qemux86-64 builds ar=
e built with slightly</div><div>different metadata, you can see the exact v=
ersion near the top of each</div><div>log.world.qemu* files linked from the=
 report</div><div><br></div><div>=3D=3D Tested changes (not included in mas=
ter yet) - bitbake =3D=3D</div><div>latest upstream commit:=C2=A0</div><div=
>be393f2 toaster/highlight.pack.js: Fix corrupted file</div><div>not includ=
ed in master yet:=C2=A0</div><div>3fba1ad world-image: add extra target</di=
v><div>c7c01bf fetch2: Allow Fetch.download() to warn instead of error</div=
><div><br></div><div>=3D=3D Tested changes (not included in master yet) - o=
penembedded-core =3D=3D</div><div>latest upstream commit:=C2=A0</div><div>3=
b413a8 README.qemu: qemuppc64 is not supported</div><div>not included in ma=
ster yet:=C2=A0</div><div>3ff8d67 report-error: Allow to upload reports aut=
omatically</div><div>c7e8c96 buildhistory.bbclass: metadata-revs show repo =
parent</div><div>e2c9020 metadata-revs: provide more information</div><div>=
cd6556e qemux86: Add identical qemux86copy variant for tests</div><div>347a=
734 reproducible_build.bbclass: initial support for binary reproducibility<=
/div><div>625d2bc cpio: provide cpio-replacement-native</div><div>ce7ca36 i=
mage_types.bbclass: improve cpio image reproducibility</div><div>fea2911 ro=
otfs-postcommands.bbclass: support binary reproducibility</div><div>981e97a=
 sstate.bbclass: Do not cause build failures due to setscene errors</div><d=
iv>b53517c insane.bbclass: Add do_qa_pseudo function to check for common er=
rors listed in pseudo.log</div><div>f829dbd libsdl2: allow to build native =
and nativesdk</div><div>5c05822 libdrm: allow to build native and nativesdk=
</div><div>95faa5e nativesdk-mesa,mesa-native: add new recipe to build smal=
l part of mesa</div><div>bd4c162 libepoxy: add support for native(sdk)</div=
><div>3092b61 libjpeg-turbo: provide nativesdk version</div><div>5471ea7 vi=
rglrenderer: add new recipe</div><div>8c4c3fc virglrenderer: fix target bui=
ld</div><div>81e5bc3 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and s=
pice</div><div>c37486d insane.bbclass: use package_qa_handle_error for do_q=
a_pseudo</div><div><br></div><div>=3D=3D Tested changes (not included in ma=
ster yet) - meta-openembedded =3D=3D</div><div>latest upstream commit:=C2=
=A0</div><div>5d6d21e libreport: fix Nothing RPROVIDES &#39;lib32-python3-l=
ibreport&#39;</div><div>not included in master yet:=C2=A0</div><div>ebcef48=
 bridge-utils: modify the AR to cross toolchain</div><div><br></div><div>=
=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D</div><=
div>latest upstream commit:=C2=A0</div><div>d87335a qt5-ptest.inc: fix qtxm=
lpatterns:do_install_ptest out-of-order call</div><div>not included in mast=
er yet:=C2=A0</div><div>197811b qtwebengine: make test suite succeed</div><=
div><br></div><div>=3D=3D Tested changes (not included in master yet) - met=
a-browser =3D=3D</div><div>latest upstream commit:=C2=A0</div><div>26d5066 =
firefox: fix build failures</div><div>not included in master yet:=C2=A0</di=
v><div>6773bf9 meta: drop ${COREBASE}/LICENSE references</div><div><br></di=
v></div>

--001a1148d7081af63b055caffba7--
