Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id E621460685;
	Mon,  2 Oct 2017 09:12:16 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id o44so1584686wrf.11;
	Mon, 02 Oct 2017 02:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yU4C0Zqfwa1De19Uzla2z8khQcng/MOJaOyfhYnWsiY=;
	b=nR+MCrJSLllAzjQ1lBDTGVSxtfqwOzpUytcxfe81Q4Q6Gv4yWhaHMPi9uOTWsGXk3j
	WEohafedrRyFgB+s16hCnsqPZ+H455nSUJNL+khTRuzASn7SvqfE1fk9az6n6Oi6fQdl
	/OU1/7E/ZBmnml82lP6TIxsoQX3rnEPgUylq/AccS9cB+m+sg06p56X+GMRgKvVsdTY3
	QavoyJAkdF4NZBhxUWBSGKajSA3tDlOj/BC+qsV9PxklcV8aRvoXy5gZ8iY3N/PFjxmw
	s5eJPuZ2salBKI/8ft1Fndhrwi76NVhV5muZFz3S2V9y/sGVnybY2VBSGnQJyjrMvAyQ
	19PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yU4C0Zqfwa1De19Uzla2z8khQcng/MOJaOyfhYnWsiY=;
	b=ou8MbRl0eYY6wHMmSP1tNFGR1wCR/YILBhho8+HevtsoTeLB15+pVRYAHiUJVOUqi2
	yf+fR+bT4WCc/uPjvqU6u5gQrYbV1EGKCS8nhKTw0dMiODaFaJBlo9uzfPrkeJKPbfv6
	S8TM2IMl9SHVAAa6dscYfEuoMsV9bJWHFtkVpk8EEG0KZzUzBrOPzBa9H1iQV7LffTYo
	I7eyq/mb4rdeVs4vsOzHUl1myw5itJyLgZ8cInK22qPaX+pdQGOS7quo63mSkcq6EJzO
	aLNNx6RyBTXcPaELOdxSd7YzA6WtMjXg/7hQuC/ixZzgmCT0pSm/QZEC7Bb5UViL6xJQ
	1+GQ==
X-Gm-Message-State: AMCzsaUeihFP7LgK5MV9VNGgc4ksB//qOLh8IrLGyAa9Y4wJnSxMWbDo
	AT6VhlW4vEE45h1zzHdvnEn3ZgcI68Y7NY1jpSk7fA==
X-Google-Smtp-Source: AOwi7QBeFs4gtiGqHiS6Aluf0zEzJ7BCotisEpfa6rAXIPohmn9qrScO1109m9ACmq8yRCAJRDjk1Ikc5rI8uC3Yj8I=
X-Received: by 10.223.143.56 with SMTP id p53mr2360709wrb.179.1506935534762;
	Mon, 02 Oct 2017 02:12:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.10 with HTTP; Mon, 2 Oct 2017 02:12:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 2 Oct 2017 11:12:14 +0200
Message-ID: <CA+chaQfWTU7E10rEkZK+hmo3zPBzgWK_px4MdQEKnH_Q5mYFng@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-09-27
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
X-List-Received-Date: Mon, 02 Oct 2017 09:12:17 -0000
Content-Type: multipart/alternative; boundary="f403045d58983fc7f6055a8cc5a6"

--f403045d58983fc7f6055a8cc5a6
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date      !!colspan='3'|Failed tasks     !!|Signatures
!!colspan='15'|QA !!Comment
|-
|| ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped ||libdir
||textrel ||build-deps ||file-rdeps ||version-going-backwards
||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option
||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
||compile-host-path ||qa_pseudo ||
|-
||2017-09-27 ||3 ||6 ||2 ||2 ||0 ||0 ||3 ||0 ||0 ||0 ||4 ||0 ||0 ||0 ||0 ||0
||0 ||0 ||376 ||
|}

== Failed tasks 2017-09-27 ==

INFO: jenkins-job.sh-1.8.31 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171001_085046.log

=== common (0) ===

=== common-x86 (1) ===
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:
do_compile

=== qemuarm (3) ===
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_package_qa
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:
do_package_qa

=== qemux86 (2) ===
    * meta-openembedded/meta-networking/recipes-support/spice/spice_git.bb:
do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:
do_package_qa

=== qemux86_64 (1) ===
    *
meta-openembedded/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb:
do_package_qa

=== Number of failed tasks (11) ===
{| class=wikitable
|-
|| qemuarm || 3 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170926_004402.log/
|| http://errors.yoctoproject.org/Errors/Build/47162/
|-
|| qemux86 || 6 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170926_004401.log/
|| http://errors.yoctoproject.org/Errors/Build/47142/
http://errors.yoctoproject.org/Errors/Build/47145/
http://errors.yoctoproject.org/Errors/Build/47166/
|-
|| qemux86_64 || 2 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170927_070922.log/
|| http://errors.yoctoproject.org/Errors/Build/47181/
|}

=== PNBLACKLISTs (1) ===

=== QA issues (383) ===
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
||376 ||qa_pseudo
|-
||3 ||textrel
|-
||4 ||host-user-contaminated
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (2) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170927_105702.log/
    * ERROR: 2 issues were found in these recipes: go-native

    * ERROR: 1 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 1 errors found in
signatures.qemuarm.do_populate_sysroot.sigdata.log

    * ERROR: go-native different signature for task do_configure.sigdata
between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1506545822/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: go-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1506545822/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 2 issues were found in these recipes: go-native


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


count: 4 issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ar-iq/usr/lib/locale/ar_IQ/LC_MESSAGES/SYS_LC_MESSAGES
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-et-ee.iso-8859-1/usr/lib/locale/et_EE.ISO-8859-1/LC_MEASUREMENT
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-sq-al.iso-8859-1/usr/lib/locale/sq_AL.ISO-8859-1/LC_CTYPE
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
libqofono: /libqofono-tests/usr/lib/libqofono-qt5/tests/tst_qofonocallmeter
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path


count: 376 issue: qa_pseudo
acl-2.2.52: This
/work/armv5te-oe-linux-gnueabi/acl/2.2.52-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
acl-2.2.52: This /work/core2-64-oe-linux/acl/2.2.52-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
alsa-plugins-1.1.4: This
/work/armv5te-oe-linux-gnueabi/alsa-plugins/1.1.4-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
alsa-plugins-1.1.4: This
/work/core2-64-oe-linux/alsa-plugins/1.1.4-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
apache2-2.4.27: This
/work/armv5te-oe-linux-gnueabi/apache2/2.4.27-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
apache2-2.4.27: This
/work/core2-64-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
apache2-2.4.27: This
/work/i586-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.log indicates 7 errors
[qa_pseudo]
aspell-0.60.6.1: This
/work/armv5e-oe-linux-gnueabi/aspell/0.60.6.1-r1/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
attr-2.4.47: This /work/i586-oe-linux/attr/2.4.47-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
aufs-util-4.4+gitAUTOINC+89afb1806c: This
/work/core2-64-oe-linux/aufs-util/4.4+gitAUTOINC+89afb1806c-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
autofs-5.1.2: This
/work/armv5te-oe-linux-gnueabi/autofs/5.1.2-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
avahi-ui-0.6.32: This
/work/i586-oe-linux/avahi-ui/0.6.32-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
bluez5-5.46: This
/work/armv5te-oe-linux-gnueabi/bluez5/5.46-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
bluez5-5.46: This /work/core2-64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
bluez5-5.46: This /work/i586-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
bonnie++-1.03e: This
/work/i586-oe-linux/bonnie++/1.03e-r0/pseudo/pseudo.log indicates 12 errors
[qa_pseudo]
boost-1.64.0: This
/work/armv5e-oe-linux-gnueabi/boost/1.64.0-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
bootchart2-0.14.8: This
/work/i586-oe-linux/bootchart2/0.14.8-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
cantarell-fonts-0.0.24: This
/work/all-oe-linux/cantarell-fonts/0.0.24-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
can-utils-0.0+gitrAUTOINC+4c8fb05cb4: This
/work/armv5te-oe-linux-gnueabi/can-utils/0.0+gitrAUTOINC+4c8fb05cb4-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
canutils-4.0.6: This
/work/i586-oe-linux/canutils/4.0.6-r0/pseudo/pseudo.log indicates 6 errors
[qa_pseudo]
chrony-2.4: This
/work/armv5te-oe-linux-gnueabi/chrony/2.4-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
chrony-2.4: This /work/core2-64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
chrony-2.4: This /work/i586-oe-linux/chrony/2.4-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
console-tools-0.3.2: This
/work/core2-64-oe-linux/console-tools/0.3.2-r8/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
coreutils-8.27: This
/work/armv5te-oe-linux-gnueabi/coreutils/8.27-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
cpufrequtils-008: This
/work/armv5te-oe-linux-gnueabi/cpufrequtils/008-r5/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
cryptodev-module-1.9: This
/work/qemux86-oe-linux/cryptodev-module/1.9-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
ctdb-2.5.6: This
/work/armv5te-oe-linux-gnueabi/ctdb/2.5.6-r0/pseudo/pseudo.log indicates 13
errors [qa_pseudo]
curlpp-0.8.1: This
/work/armv5te-oe-linux-gnueabi/curlpp/0.8.1-r0/pseudo/pseudo.log indicates
7 errors [qa_pseudo]
curlpp-0.8.1: This
/work/core2-64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
curlpp-0.8.1: This /work/i586-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
cwautomacros-20110201: This
/work/i586-oe-linux/cwautomacros/20110201-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
cxxtest-4.3: This /work/core2-64-oe-linux/cxxtest/4.3-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
daemontools-0.76: This
/work/core2-64-oe-linux/daemontools/0.76-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
dbus-test-1.10.20: This
/work/core2-64-oe-linux/dbus-test/1.10.20-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
ddrescue-1.19: This /work/i586-oe-linux/ddrescue/1.19-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
dfu-util-0.9: This
/work/core2-64-oe-linux/dfu-util/0.9-r0/pseudo/pseudo.log indicates 9
errors [qa_pseudo]
dhcp-4.3.6: This
/work/armv5te-oe-linux-gnueabi/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
dhcp-4.3.6: This /work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/i586-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
diffutils-3.6: This
/work/armv5te-oe-linux-gnueabi/diffutils/3.6-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
dmidecode-3.1: This /work/i586-oe-linux/dmidecode/3.1-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
dovecot-2.2.29: This
/work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
dovecot-2.2.29: This
/work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
dovecot-2.2.29: This
/work/i586-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 13 errors
[qa_pseudo]
ebtables-2.0.10-4: This
/work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-r4/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
ebtables-2.0.10-4: This
/work/i586-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
efivar-0.31: This
/work/armv5te-oe-linux-gnueabi/efivar/0.31-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
firefox-l10n-si-45.9.0esr: This
/work/all-oe-linux/firefox-l10n-si/45.9.0esr-r3/pseudo/pseudo.log indicates
16 errors [qa_pseudo]
fontforge-20170731: This
/work/i586-oe-linux/fontforge/20170731-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
frame-2.5.0: This /work/core2-64-oe-linux/frame/2.5.0-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
freeradius-3.0.15: This
/work/i586-oe-linux/freeradius/3.0.15-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
fribidi-0.19.7: This
/work/i586-oe-linux/fribidi/0.19.7-r0/pseudo/pseudo.log indicates 10 errors
[qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This
/work/armv5te-oe-linux-gnueabi/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This
/work/core2-64-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This
/work/i586-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
gegl-0.3.18: This /work/i586-oe-linux/gegl/0.3.18-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
geoip-1.6.9: This /work/i586-oe-linux/geoip/1.6.9-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
gettext-0.19.8.1: This
/work/armv5te-oe-linux-gnueabi/gettext/0.19.8.1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
gettext-0.19.8.1: This
/work/i586-oe-linux/gettext/0.19.8.1-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
git-2.13.3: This /work/core2-64-oe-linux/git/2.13.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
glib-2.0-2.52.3: This
/work/core2-64-oe-linux/glib-2.0/1_2.52.3-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
glibc-2.26: This
/work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pseudo.log indicates 32
errors [qa_pseudo]
glibc-2.26: This /work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
glibc-2.26: This /work/i586-oe-linux/glibc/2.26-r0/pseudo/pseudo.log
indicates 77 errors [qa_pseudo]
glibc-locale-2.26: This
/work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
glibc-locale-2.26: This
/work/core2-64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
glibc-locale-2.26: This
/work/i586-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
gnuplot-5.0.5: This
/work/armv5te-oe-linux-gnueabi/gnuplot/5.0.5-r0/pseudo/pseudo.log indicates
11 errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/armv5te-oe-linux-gnueabi/gobject-introspection/1.52.1-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/core2-64-oe-linux/gobject-introspection/1.52.1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/i586-oe-linux/gobject-introspection/1.52.1-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
gptfdisk-1.0.3: This
/work/i586-oe-linux/gptfdisk/1.0.3-r0/pseudo/pseudo.log indicates 12 errors
[qa_pseudo]
gstreamer-0.10.36: This
/work/i586-oe-linux/gstreamer/0.10.36-r2/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
hiredis-0.13.1: This
/work/core2-64-oe-linux/hiredis/0.13.1-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
icu-59.1: This /work/armv5e-oe-linux-gnueabi/icu/59.1-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
icu-59.1: This /work/core2-64-oe-linux/icu/59.1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
icu-59.1: This /work/i586-oe-linux/icu/59.1-r0/pseudo/pseudo.log indicates
8 errors [qa_pseudo]
iptables-1.6.1: This
/work/core2-64-oe-linux/iptables/1.6.1-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
jack-1.9.10+gitAUTOINC+2d1d323505: This
/work/core2-64-oe-linux/jack/1.9.10+gitAUTOINC+2d1d323505-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
kbd-2.0.4: This /work/core2-64-oe-linux/kbd/2.0.4-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
kexec-tools-2.0.14: This
/work/core2-64-oe-linux/kexec-tools/2.0.14-r1/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
krb5-1.15.1: This /work/core2-64-oe-linux/krb5/1.15.1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This
/work/core2-64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
libatasmart-0.19: This
/work/armv5te-oe-linux-gnueabi/libatasmart/0.19-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
libbsd-0.8.6: This
/work/core2-64-oe-linux/libbsd/0.8.6-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
libconnman-qt5-1.1.10+gitAUTOINC+4d6def3053: This
/work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.1.10+gitAUTOINC+4d6def3053-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
libconnman-qt5-1.1.10+gitAUTOINC+4d6def3053: This
/work/core2-64-oe-linux/libconnman-qt5/1.1.10+gitAUTOINC+4d6def3053-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
libconnman-qt5-1.1.10+gitAUTOINC+4d6def3053: This
/work/i586-oe-linux/libconnman-qt5/1.1.10+gitAUTOINC+4d6def3053-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
libcrypt-openssl-random-perl-0.11: This
/work/core2-64-oe-linux/libcrypt-openssl-random-perl/0.11-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
libdrm-2.4.83: This
/work/armv5te-oe-linux-gnueabi/libdrm/2.4.83-r0/pseudo/pseudo.log indicates
7 errors [qa_pseudo]
libdrm-2.4.83: This /work/i586-oe-linux/libdrm/2.4.83-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
libevdev-1.5.7: This
/work/armv5te-oe-linux-gnueabi/libevdev/1.5.7-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
libgnome-2.32.1: This
/work/i586-oe-linux/libgnome/2.32.1-r2/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
libinput-1.8.1: This
/work/core2-64-oe-linux/libinput/1.8.1-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
liblogging-1.0.5: This
/work/i586-oe-linux/liblogging/1.0.5-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
libotr-4.1.1: This /work/i586-oe-linux/libotr/4.1.1-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
libqofono-0.87+gitrAUTOINC+54435de3be: This
/work/armv5te-oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+54435de3be-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
libqofono-0.87+gitrAUTOINC+54435de3be: This
/work/core2-64-oe-linux/libqofono/0.87+gitrAUTOINC+54435de3be-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
libqofono-0.87+gitrAUTOINC+54435de3be: This
/work/i586-oe-linux/libqofono/0.87+gitrAUTOINC+54435de3be-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
librelp-1.2.14: This
/work/core2-64-oe-linux/librelp/1.2.14-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
libtext-wrapi18n-perl-0.06: This
/work/armv5te-oe-linux-gnueabi/libtext-wrapi18n-perl/0.06-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
libtool-cross-2.4.6: This
/work/armv5te-oe-linux-gnueabi/libtool-cross/2.4.6-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This
/work/i586-oe-linux/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
libusb-compat-0.1.5: This
/work/armv5te-oe-linux-gnueabi/libusb-compat/1_0.1.5-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
libusbg-0.1.0: This
/work/core2-64-oe-linux/libusbg/0.1.0-r0/pseudo/pseudo.log indicates 9
errors [qa_pseudo]
libvncserver-0.9.11: This
/work/armv5te-oe-linux-gnueabi/libvncserver/0.9.11-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
libvncserver-0.9.11: This
/work/core2-64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates
5 errors [qa_pseudo]
libvncserver-0.9.11: This
/work/i586-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
libwmf-0.2.8.4: This
/work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
libwmf-0.2.8.4: This
/work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
libwmf-0.2.8.4: This
/work/i586-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 6 errors
[qa_pseudo]
libxml2-2.9.4: This
/work/core2-64-oe-linux/libxml2/2.9.4-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
libxslt-1.1.29: This
/work/armv5te-oe-linux-gnueabi/libxslt/1.1.29-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
libxxf86vm-1.1.4: This
/work/core2-64-oe-linux/libxxf86vm/1_1.1.4-r0/pseudo/pseudo.log indicates
16 errors [qa_pseudo]
linux-atm-2.5.2: This
/work/qemuarm-oe-linux-gnueabi/linux-atm/2.5.2-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_16de014967: This
/work/qemux86_64-oe-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_16de014967-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_16de014967: This
/work/qemux86-oe-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_16de014967-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_67b62d8d7b: This
/work/qemuarm-oe-linux-gnueabi/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_67b62d8d7b-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
lirc-0.9.4d: This
/work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 9
errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
lirc-0.9.4d: This /work/i586-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
llvm-5.0: This /work/armv5e-oe-linux-gnueabi/llvm/5.0-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
llvm-5.0: This /work/i586-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indicates
7 errors [qa_pseudo]
log4cpp-1.1.2: This
/work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates
7 errors [qa_pseudo]
log4cpp-1.1.2: This
/work/core2-64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
log4cpp-1.1.2: This /work/i586-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
logfsprogs-git: This
/work/i586-oe-linux/logfsprogs/git-r0/pseudo/pseudo.log indicates 12 errors
[qa_pseudo]
lttng-tools-2.9.5: This
/work/armv5te-oe-linux-gnueabi/lttng-tools/2.9.5-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
lttng-tools-2.9.5: This
/work/core2-64-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 17
errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/armv5te-oe-linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/i586-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
mariadb-5.5.57: This
/work/i586-oe-linux/mariadb/5.5.57-r0/pseudo/pseudo.log indicates 11 errors
[qa_pseudo]
mce-inject-git: This
/work/i586-oe-linux/mce-inject/git-r0/pseudo/pseudo.log indicates 12 errors
[qa_pseudo]
md5deep-4.4: This
/work/armv5te-oe-linux-gnueabi/md5deep/4.4-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
memcached-1.5.0: This
/work/core2-64-oe-linux/memcached/1.5.0-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
menulibre-2.1.3: This
/work/armv5te-oe-linux-gnueabi/menulibre/2.1.3-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
mesa-demos-8.3.0: This
/work/armv5te-oe-linux-gnueabi/mesa-demos/8.3.0-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
mosquitto-1.4.14: This
/work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
mosquitto-1.4.14: This
/work/core2-64-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
mosquitto-1.4.14: This
/work/i586-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
mozilla-devscripts-0.30: This
/work/core2-64-oe-linux/mozilla-devscripts/0.30-r1/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mozilla-devscripts-0.30: This
/work/i586-oe-linux/mozilla-devscripts/0.30-r1/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
mpich-3.2: This /work/i586-oe-linux/mpich/3.2-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
nana-2.5: This /work/armv5te-oe-linux-gnueabi/nana/2.5-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
ndisc6-1.0.4+gitAUTOINC+4c794b5512: This
/work/armv5te-oe-linux-gnueabi/ndisc6/1.0.4+gitAUTOINC+4c794b5512-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
net-snmp-5.7.3: This
/work/i586-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates 6 errors
[qa_pseudo]
nettle-3.3: This
/work/armv5te-oe-linux-gnueabi/nettle/3.3-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
nginx-1.12.1: This
/work/core2-64-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
nginx-1.12.1: This /work/i586-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
ntp-4.2.8p10: This
/work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates
13 errors [qa_pseudo]
ntp-4.2.8p10: This
/work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
ntp-4.2.8p10: This /work/i586-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
openconnect-7.08: This
/work/armv5te-oe-linux-gnueabi/openconnect/7.08-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
openhpi-3.6.1: This
/work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
open-isns-0.97: This
/work/core2-64-oe-linux/open-isns/0.97-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
openlmi-tools-0.10.5: This
/work/core2-64-oe-linux/openlmi-tools/0.10.5-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
opensaf-5.17.07: This
/work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pseudo/pseudo.log
indicates 18 errors [qa_pseudo]
opensaf-5.17.07: This
/work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 19
errors [qa_pseudo]
opensaf-5.17.07: This
/work/i586-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 27
errors [qa_pseudo]
opensc-0.16.0: This
/work/armv5te-oe-linux-gnueabi/opensc/0.16.0-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
openssh-7.5p1: This
/work/armv5te-oe-linux-gnueabi/openssh/7.5p1-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
openssh-7.5p1: This
/work/core2-64-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.log indicates 17
errors [qa_pseudo]
openssh-7.5p1: This /work/i586-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
openssl-1.0.2l: This
/work/i586-oe-linux/openssl/1.0.2l-r0/pseudo/pseudo.log indicates 4 errors
[qa_pseudo]
opkg-utils-0.3.5: This
/work/core2-64-oe-linux/opkg-utils/0.3.5-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
os-release-1.0: This /work/all-oe-linux/os-release/1.0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
ossp-uuid-1.6.2: This
/work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
ossp-uuid-1.6.2: This
/work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
ossp-uuid-1.6.2: This
/work/i586-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 7 errors
[qa_pseudo]
packagegroup-core-ssh-openssh-1.0: This
/work/all-oe-linux/packagegroup-core-ssh-openssh/1.0-r1/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
pciutils-3.5.5: This
/work/i586-oe-linux/pciutils/3.5.5-r0/pseudo/pseudo.log indicates 12 errors
[qa_pseudo]
perf-1.0: This /work/qemux86_64-oe-linux/perf/1.0-r9/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
perl-5.24.1: This
/work/armv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
perl-5.24.1: This /work/core2-64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
perl-5.24.1: This /work/i586-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
php-7.1.9: This
/work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.log indicates 8
errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux/php/7.1.9-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
pixz-1.0.6: This /work/i586-oe-linux/pixz/1.0.6-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
pkcs11-helper-1.11: This
/work/armv5te-oe-linux-gnueabi/pkcs11-helper/1.11-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
pm-qa-0.5.2: This
/work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates
45 errors [qa_pseudo]
pm-qa-0.5.2: This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log
indicates 52 errors [qa_pseudo]
pm-qa-0.5.2: This /work/i586-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log
indicates 43 errors [qa_pseudo]
pm-utils-1.4.1: This
/work/i586-oe-linux/pm-utils/1.4.1-r1/pseudo/pseudo.log indicates 12 errors
[qa_pseudo]
poppler-data-0.4.7: This
/work/all-oe-linux/poppler-data/0.4.7-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
portaudio-v19-v190600: This
/work/i586-oe-linux/portaudio-v19/v190600-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
postfix-3.2.2: This
/work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
postfix-3.2.2: This
/work/core2-64-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
postfix-3.2.2: This /work/i586-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
postgresql-9.4.13: This
/work/armv5e-oe-linux-gnueabi/postgresql/9.4.13-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
postgresql-9.4.13: This
/work/core2-64-oe-linux/postgresql/9.4.13-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
postgresql-9.4.13: This
/work/i586-oe-linux/postgresql/9.4.13-r0/pseudo/pseudo.log indicates 14
errors [qa_pseudo]
powertop-2.8: This /work/i586-oe-linux/powertop/2.8-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
procps-3.3.12: This /work/i586-oe-linux/procps/3.3.12-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
proftpd-1.3.6: This
/work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/pseudo/pseudo.log indicates
14 errors [qa_pseudo]
proftpd-1.3.6: This
/work/core2-64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
pure-ftpd-1.0.42: This
/work/armv5te-oe-linux-gnueabi/pure-ftpd/1.0.42-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
puzzles-0.0+gitAUTOINC+8dfe5cec31: This
/work/armv5te-oe-linux-gnueabi/puzzles/1_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
puzzles-0.0+gitAUTOINC+8dfe5cec31: This
/work/i586-oe-linux/puzzles/1_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
pyrtm-0.4.2: This
/work/armv5te-oe-linux-gnueabi/pyrtm/0.4.2-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
python-2.7.13: This
/work/armv5te-oe-linux-gnueabi/python/2.7.13-r1/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
python-2.7.13: This
/work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
python-2.7.13: This /work/i586-oe-linux/python/2.7.13-r1/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
python3-3.5.3: This
/work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
python3-3.5.3: This
/work/i586-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 7 errors
[qa_pseudo]
python3-coverage-4.4.1: This
/work/core2-64-oe-linux/python3-coverage/4.4.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-django-1.11.5: This
/work/core2-64-oe-linux/python3-django/1.11.5-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-django-1.11.5: This
/work/i586-oe-linux/python3-django/1.11.5-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
python3-docutils-0.14: This
/work/armv5te-oe-linux-gnueabi/python3-docutils/0.14-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python3-mako-1.0.7: This
/work/core2-64-oe-linux/python3-mako/1.0.7-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
python3-pip-9.0.1: This
/work/core2-64-oe-linux/python3-pip/9.0.1-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
python3-pip-9.0.1: This
/work/i586-oe-linux/python3-pip/9.0.1-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
python3-psutil-5.3.1: This
/work/armv5te-oe-linux-gnueabi/python3-psutil/5.3.1-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
python3-pylint-1.7.2: This
/work/armv5te-oe-linux-gnueabi/python3-pylint/1.7.2-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python3-pylint-1.7.2: This
/work/core2-64-oe-linux/python3-pylint/1.7.2-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
python3-pylint-1.7.2: This
/work/i586-oe-linux/python3-pylint/1.7.2-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
python3-pyparted-3.10.7+gitAUTOINC+69c4a478e4: This
/work/armv5te-oe-linux-gnueabi/python3-pyparted/3.10.7+gitAUTOINC+69c4a478e4-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-cheetah-2.4.4: This
/work/armv5te-oe-linux-gnueabi/python-cheetah/2.4.4-r3/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-cheetah-2.4.4: This
/work/core2-64-oe-linux/python-cheetah/2.4.4-r3/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
python-cheetah-2.4.4: This
/work/i586-oe-linux/python-cheetah/2.4.4-r3/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
python-cython-0.26.1: This
/work/armv5te-oe-linux-gnueabi/python-cython/0.26.1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-imaging-1.1.7: This
/work/i586-oe-linux/python-imaging/1.1.7-r5/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
python-jsonpatch-1.16: This
/work/armv5te-oe-linux-gnueabi/python-jsonpatch/1.16-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-jsonpointer-1.12: This
/work/i586-oe-linux/python-jsonpointer/1.12-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
python-ndg-httpsclient-0.4.3: This
/work/core2-64-oe-linux/python-ndg-httpsclient/0.4.3-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-numpy-1.13.1: This
/work/core2-64-oe-linux/python-numpy/1.13.1-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
python-pbr-3.1.1: This
/work/armv5te-oe-linux-gnueabi/python-pbr/3.1.1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-pbr-3.1.1: This
/work/i586-oe-linux/python-pbr/3.1.1-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
python-pyflakes-1.2.3: This
/work/i586-oe-linux/python-pyflakes/1.2.3-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
python-pylint-1.7.2: This
/work/armv5te-oe-linux-gnueabi/python-pylint/1.7.2-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-pylint-1.7.2: This
/work/core2-64-oe-linux/python-pylint/1.7.2-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
python-pylint-1.7.2: This
/work/i586-oe-linux/python-pylint/1.7.2-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
python-selectors34-1.2: This
/work/core2-64-oe-linux/python-selectors34/1.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
python-snakefood-1.4: This
/work/armv5te-oe-linux-gnueabi/python-snakefood/1.4-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
python-snakefood-1.4: This
/work/core2-64-oe-linux/python-snakefood/1.4-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
python-snimpy-0.8.11: This
/work/core2-64-oe-linux/python-snimpy/0.8.11-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
python-yappi-0.98: This
/work/i586-oe-linux/python-yappi/0.98-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+9d8c9ada16: This
/work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+9d8c9ada16-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+9d8c9ada16: This
/work/core2-64-oe-linux/qt3d/5.9.2+gitAUTOINC+9d8c9ada16-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+9d8c9ada16: This
/work/i586-oe-linux/qt3d/5.9.2+gitAUTOINC+9d8c9ada16-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
qt5-creator-3.5.1: This
/work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+73573fce29: This
/work/armv5te-oe-linux-gnueabi/qtbase/5.9.2+gitAUTOINC+73573fce29-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+73573fce29: This
/work/core2-64-oe-linux/qtbase/5.9.2+gitAUTOINC+73573fce29-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+73573fce29: This
/work/i586-oe-linux/qtbase/5.9.2+gitAUTOINC+73573fce29-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+1f47b1a7ae: This
/work/armv5te-oe-linux-gnueabi/qtcharts/5.9.2+gitAUTOINC+1f47b1a7ae-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+1f47b1a7ae: This
/work/core2-64-oe-linux/qtcharts/5.9.2+gitAUTOINC+1f47b1a7ae-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+1f47b1a7ae: This
/work/i586-oe-linux/qtcharts/5.9.2+gitAUTOINC+1f47b1a7ae-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+94cc2b914a: This
/work/armv5te-oe-linux-gnueabi/qtconnectivity/5.9.2+gitAUTOINC+94cc2b914a-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+94cc2b914a: This
/work/i586-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+94cc2b914a-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+3f8ae713df: This
/work/core2-64-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+3f8ae713df-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+3f8ae713df: This
/work/i586-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+3f8ae713df-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: This
/work/armv5te-oe-linux-gnueabi/qtdeclarative/5.9.2+gitAUTOINC+7c45b035b9-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: This
/work/core2-64-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+7c45b035b9-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: This
/work/i586-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+7c45b035b9-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+0555cf73c8: This
/work/armv5te-oe-linux-gnueabi/qtenginio/5.9.2+gitAUTOINC+0555cf73c8-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+0555cf73c8: This
/work/i586-oe-linux/qtenginio/5.9.2+gitAUTOINC+0555cf73c8-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+1fc40deed6: This
/work/armv5te-oe-linux-gnueabi/qtgamepad/5.9.2+gitAUTOINC+1fc40deed6-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+1fc40deed6: This
/work/core2-64-oe-linux/qtgamepad/5.9.2+gitAUTOINC+1fc40deed6-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+1fc40deed6: This
/work/i586-oe-linux/qtgamepad/5.9.2+gitAUTOINC+1fc40deed6-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtgraphicaleffects-5.9.2+gitAUTOINC+b6ff12df54: This
/work/core2-64-oe-linux/qtgraphicaleffects/5.9.2+gitAUTOINC+b6ff12df54-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtimageformats-5.9.2+gitAUTOINC+144a3535db: This
/work/core2-64-oe-linux/qtimageformats/5.9.2+gitAUTOINC+144a3535db-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+c832af7897_9ecbe3642f: This
/work/armv5te-oe-linux-gnueabi/qtlocation/5.9.2+gitAUTOINC+c832af7897_9ecbe3642f-r0/pseudo/pseudo.log
indicates 19 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+c832af7897_9ecbe3642f: This
/work/i586-oe-linux/qtlocation/5.9.2+gitAUTOINC+c832af7897_9ecbe3642f-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+343e281f0e: This
/work/armv5te-oe-linux-gnueabi/qtmultimedia/5.9.2+gitAUTOINC+343e281f0e-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+343e281f0e: This
/work/core2-64-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+343e281f0e-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+343e281f0e: This
/work/i586-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+343e281f0e-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365: This
/work/armv5te-oe-linux-gnueabi/qtnetworkauth/5.9.2+gitAUTOINC+3d93f64365-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365: This
/work/core2-64-oe-linux/qtnetworkauth/5.9.2+gitAUTOINC+3d93f64365-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365: This
/work/i586-oe-linux/qtnetworkauth/5.9.2+gitAUTOINC+3d93f64365-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/armv5te-oe-linux-gnueabi/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/core2-64-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/i586-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log
indicates 20 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+63f2f55462: This
/work/armv5te-oe-linux-gnueabi/qtquickcontrols2/5.9.2+gitAUTOINC+63f2f55462-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+63f2f55462: This
/work/core2-64-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+63f2f55462-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+63f2f55462: This
/work/i586-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+63f2f55462-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/armv5te-oe-linux-gnueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/core2-64-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/i586-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+86ee61734e: This
/work/armv5e-oe-linux-gnueabi/qtscript/5.9.2+gitAUTOINC+86ee61734e-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+86ee61734e: This
/work/core2-64-oe-linux/qtscript/5.9.2+gitAUTOINC+86ee61734e-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+86ee61734e: This
/work/i586-oe-linux/qtscript/5.9.2+gitAUTOINC+86ee61734e-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+a1dff1a11a: This
/work/armv5te-oe-linux-gnueabi/qtscxml/5.9.2+gitAUTOINC+a1dff1a11a-r0/pseudo/pseudo.log
indicates 21 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+a1dff1a11a: This
/work/i586-oe-linux/qtscxml/5.9.2+gitAUTOINC+a1dff1a11a-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+1673dbed00: This
/work/armv5te-oe-linux-gnueabi/qtsensors/5.9.2+gitAUTOINC+1673dbed00-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+1673dbed00: This
/work/core2-64-oe-linux/qtsensors/5.9.2+gitAUTOINC+1673dbed00-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+1673dbed00: This
/work/i586-oe-linux/qtsensors/5.9.2+gitAUTOINC+1673dbed00-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+1d37c357c8: This
/work/armv5te-oe-linux-gnueabi/qtserialbus/5.9.2+gitAUTOINC+1d37c357c8-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+1d37c357c8: This
/work/core2-64-oe-linux/qtserialbus/5.9.2+gitAUTOINC+1d37c357c8-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+1d37c357c8: This
/work/i586-oe-linux/qtserialbus/5.9.2+gitAUTOINC+1d37c357c8-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+93b539140c: This
/work/armv5te-oe-linux-gnueabi/qtserialport/5.9.2+gitAUTOINC+93b539140c-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+93b539140c: This
/work/core2-64-oe-linux/qtserialport/5.9.2+gitAUTOINC+93b539140c-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+93b539140c: This
/work/i586-oe-linux/qtserialport/5.9.2+gitAUTOINC+93b539140c-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtsmarthome-1.0: This
/work/i586-oe-linux/qtsmarthome/1.0-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+0fcd016066: This
/work/armv5te-oe-linux-gnueabi/qtsvg/5.9.2+gitAUTOINC+0fcd016066-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+0fcd016066: This
/work/core2-64-oe-linux/qtsvg/5.9.2+gitAUTOINC+0fcd016066-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+0fcd016066: This
/work/i586-oe-linux/qtsvg/5.9.2+gitAUTOINC+0fcd016066-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+f364358a81: This
/work/armv5te-oe-linux-gnueabi/qtsystems/5.9.2+gitAUTOINC+f364358a81-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+f364358a81: This
/work/core2-64-oe-linux/qtsystems/5.9.2+gitAUTOINC+f364358a81-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+f364358a81: This
/work/i586-oe-linux/qtsystems/5.9.2+gitAUTOINC+f364358a81-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+fdc5749b56: This
/work/armv5te-oe-linux-gnueabi/qttools/5.9.2+gitAUTOINC+fdc5749b56-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+fdc5749b56: This
/work/core2-64-oe-linux/qttools/5.9.2+gitAUTOINC+fdc5749b56-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+fdc5749b56: This
/work/i586-oe-linux/qttools/5.9.2+gitAUTOINC+fdc5749b56-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+7f70da6a64: This
/work/armv5te-oe-linux-gnueabi/qtwayland/5.9.2+gitAUTOINC+7f70da6a64-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+7f70da6a64: This
/work/core2-64-oe-linux/qtwayland/5.9.2+gitAUTOINC+7f70da6a64-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+7f70da6a64: This
/work/i586-oe-linux/qtwayland/5.9.2+gitAUTOINC+7f70da6a64-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+b5229df6a0: This
/work/armv5te-oe-linux-gnueabi/qtwebchannel/5.9.2+gitAUTOINC+b5229df6a0-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+b5229df6a0: This
/work/core2-64-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+b5229df6a0-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+b5229df6a0: This
/work/i586-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+b5229df6a0-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54: This
/work/core2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54: This
/work/i586-oe-linux/qtwebengine/5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/armv5e-oe-linux-gnueabi/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/core2-64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/i586-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+fb71c823a7: This
/work/core2-64-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+fb71c823a7-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+fb71c823a7: This
/work/i586-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+fb71c823a7-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+e4016a67bb: This
/work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOINC+e4016a67bb-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+e4016a67bb: This
/work/i586-oe-linux/qtwebview/5.9.2+gitAUTOINC+e4016a67bb-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+f65d50eb06: This
/work/armv5te-oe-linux-gnueabi/qtx11extras/5.9.2+gitAUTOINC+f65d50eb06-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+f65d50eb06: This
/work/core2-64-oe-linux/qtx11extras/5.9.2+gitAUTOINC+f65d50eb06-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+f65d50eb06: This
/work/i586-oe-linux/qtx11extras/5.9.2+gitAUTOINC+f65d50eb06-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+fcfa824402: This
/work/armv5te-oe-linux-gnueabi/qtxmlpatterns/5.9.2+gitAUTOINC+fcfa824402-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+fcfa824402: This
/work/core2-64-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+fcfa824402-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+fcfa824402: This
/work/i586-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+fcfa824402-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
quagga-1.2.1: This
/work/armv5te-oe-linux-gnueabi/quagga/1.2.1-r0/pseudo/pseudo.log indicates
15 errors [qa_pseudo]
rabbitmq-c-0.7.0: This
/work/i586-oe-linux/rabbitmq-c/0.7.0-r0/pseudo/pseudo.log indicates 16
errors [qa_pseudo]
radvd-2.17: This
/work/armv5te-oe-linux-gnueabi/radvd/2.17-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
radvd-2.17: This /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
radvd-2.17: This /work/i586-oe-linux/radvd/2.17-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
ristretto-0.8.2: This
/work/armv5te-oe-linux-gnueabi/ristretto/0.8.2-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/i586-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 4 errors
[qa_pseudo]
ruby-2.4.1: This
/work/armv5te-oe-linux-gnueabi/ruby/2.4.1-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
samba-4.6.7: This /work/core2-64-oe-linux/samba/4.6.7-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
samba-4.6.7: This /work/i586-oe-linux/samba/4.6.7-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
sblim-sfcb-1.4.9: This
/work/i586-oe-linux/sblim-sfcb/1.4.9-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
shadow-4.2.1: This
/work/core2-64-oe-linux/shadow/4.2.1-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
squid-3.5.27: This
/work/armv5te-oe-linux-gnueabi/squid/3.5.27-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
squid-3.5.27: This
/work/core2-64-oe-linux/squid/3.5.27-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
squid-3.5.27: This /work/i586-oe-linux/squid/3.5.27-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
sthttpd-2.27.1: This
/work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
sthttpd-2.27.1: This
/work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
sthttpd-2.27.1: This
/work/i586-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 7 errors
[qa_pseudo]
strace-4.18: This /work/i586-oe-linux/strace/4.18-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
systemd-234: This
/work/core2-64-oe-linux/systemd/1_234-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
systemd-234: This /work/i586-oe-linux/systemd/1_234-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
systemtap-3.1: This
/work/armv5te-oe-linux-gnueabi/systemtap/3.1-r0/pseudo/pseudo.log indicates
8 errors [qa_pseudo]
tcl-8.6.7: This
/work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
tcl-8.6.7: This /work/i586-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
tftp-hpa-5.2: This
/work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates
7 errors [qa_pseudo]
tftp-hpa-5.2: This
/work/core2-64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
tftp-hpa-5.2: This /work/i586-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
tslib-1.1: This
/work/armv5te-oe-linux-gnueabi/tslib/1.1-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
tslib-1.1: This /work/core2-64-oe-linux/tslib/1.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
udisks-1.0.5: This
/work/core2-64-oe-linux/udisks/1.0.5-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
ufw-0.33: This /work/armv5te-oe-linux-gnueabi/ufw/0.33-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
ufw-0.33: This /work/core2-64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
ufw-0.33: This /work/i586-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indicates
9 errors [qa_pseudo]
usermode-1.111: This
/work/i586-oe-linux/usermode/1.111-r0/pseudo/pseudo.log indicates 5 errors
[qa_pseudo]
vblade-22: This /work/i586-oe-linux/vblade/22-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
vlc-2.2.2: This /work/i586-oe-linux/vlc/2.2.2-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
xcb-util-wm-0.4.1: This
/work/i586-oe-linux/xcb-util-wm/0.4.1-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
xdebug-2.5.1: This
/work/core2-64-oe-linux/xdebug/2.5.1-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
xfce4-closebutton-plugin-0.1.0+gitrAUTOINC+02b74f13ad: This
/work/i586-oe-linux/xfce4-closebutton-plugin/0.1.0+gitrAUTOINC+02b74f13ad-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
xfce4-mixer-4.11.0: This
/work/armv5te-oe-linux-gnueabi/xfce4-mixer/4.11.0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
xfce4-power-manager-1.6.0: This
/work/i586-oe-linux/xfce4-power-manager/1.6.0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
xfce4-verve-plugin-1.1.0: This
/work/i586-oe-linux/xfce4-verve-plugin/1.1.0-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
xfwm4-themes-4.10.0: This
/work/i586-oe-linux/xfwm4-themes/4.10.0-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
xserver-xorg-1.19.3: This
/work/i586-oe-linux/xserver-xorg/2_1.19.3-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
xstdcmap-1.0.3: This
/work/armv5te-oe-linux-gnueabi/xstdcmap/1.0.3-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
14c1748 bitbake: lib/bb/utils: fix movefile() copy to dir fallback
not included in master yet:
e5de648 world-image: add extra target
48b5cd7 fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
abf2e95 systemd-serialtty: allow empty package
not included in master yet:
3ee75d8 report-error: Allow to upload reports automatically
879ed00 buildhistory.bbclass: metadata-revs show repo parent
cccf080 metadata-revs: provide more information
fc75188 qemux86: Add identical qemux86copy variant for tests
7d0c173 reproducible_build.bbclass: initial support for binary
reproducibility
f3f1527 cpio: provide cpio-replacement-native
8a4bd30 image_types.bbclass: improve cpio image reproducibility
b8da834 rootfs-postcommands.bbclass: support binary reproducibility
f1abdd3 sstate.bbclass: Do not cause build failures due to setscene errors
a75ad95 insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
d10a3e5 libsdl2: allow to build native and nativesdk
b57559a libdrm: allow to build native and nativesdk
6cd394d nativesdk-mesa,mesa-native: add new recipe to build small part of
mesa
8aca5d0 libepoxy: add support for native(sdk)
6e123ee libjpeg-turbo: provide nativesdk version
98ac18f virglrenderer: add new recipe
c03be15 virglrenderer: fix target build
5f10f7b qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
3e0be80 insane.bbclass: use package_qa_handle_error for do_qa_pseudo

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
f841648 openwsman: Fix build with musl
not included in master yet:
eaea788 dnsmasq: disable the service by default
e57aa88 openconnect: fix parallel compilation failure
058d717 squid: upgrade to 3.5.27
547728b iproute2: Move tipc enablement to oe-core
9ee1828 libmnl: Move to oe-core
940e9f7 drbd-utils: remove
0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
2b2d118 celt051: import from meta-cloud-services
66ffc15 celt051: make ogg support optional
a760ec9 spice: import from meta-cloud-services
8a6bf8b spice: fix dependency on python-pyparsing, add support for
native(sdk)
8f58070 spice: fix build with FORTIFY_SOURCES already defined in native gcc
d607125 spice: upgrade to 0.13.90 version
d9bfb22 mongodb: Fix build on aarch64
fad0b64 leveldb: Fix parallel build
2d0cad4 mongodb: Pass computed endian variable
dcf2f54 yp-tools: Ignore cpp warnings as errors
851fbe5 openl2tp: Fix build with musl/libtirpc
9c618e4 network-manager-applet: Disable gobject-introspection on musl
39c648c toybox: Upgrade to 0.7.4
4f5c368 nbench-byte: Update SRC_URI to fossies.org
887082d breakpad: Fix build with musl/mips
29e2608 Add python3 matplotlib
dbffefc Add python3 cycler
67186da Add python3 pandas
06b5aea rcmd: Fix build with musl
536d82b Revert "python-m2crypto: Upgrade to 0.26.0"

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
f00f79b qtxmlpatterns: Add HOMEPAGE info into recipe file.
not included in master yet:
2e6fb62 qt5: add missing commercial license

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
678706c chromium: hide textrel QA issues which are there for ages
not included in master yet:
777a7cd firefox: fix build failures

--f403045d58983fc7f6055a8cc5a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><a href=3D"http://www.openembedded.org/wiki/Bitbake_W=
orld_Status">http://www.openembedded.org/wiki/Bitbake_World_Status</a></div=
><div><br></div><div>=3D=3D Number of issues - stats =3D=3D</div><div>{| cl=
ass=3D&#39;wikitable&#39;</div><div>!|Date<span style=3D"white-space:pre">	=
	</span>=C2=A0 =C2=A0 =C2=A0!!colspan=3D&#39;3&#39;|Failed tasks<span style=
=3D"white-space:pre">			</span>=C2=A0 =C2=A0 !!|Signatures<span style=3D"wh=
ite-space:pre">		</span>=C2=A0 !!colspan=3D&#39;15&#39;|QA !!Comment</div><=
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
qa_pseudo<span style=3D"white-space:pre">	</span>||<span style=3D"white-spa=
ce:pre">	</span></div><div>|-</div><div>||2017-09-27<span style=3D"white-sp=
ace:pre">	</span>||3<span style=3D"white-space:pre">	</span>||6<span style=
=3D"white-space:pre">	</span>||2<span style=3D"white-space:pre">	</span>||2=
<span style=3D"white-space:pre">	</span>||0<span style=3D"white-space:pre">=
		</span>||0<span style=3D"white-space:pre">		</span>||3<span style=3D"whit=
e-space:pre">		</span>||0<span style=3D"white-space:pre">		</span>||0<span =
style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		</s=
pan>||4<span style=3D"white-space:pre">		</span>||0<span style=3D"white-spa=
ce:pre">		</span>||0<span style=3D"white-space:pre">		</span>||0<span style=
=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		</span>|=
|0<span style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pr=
e">		</span>||0<span style=3D"white-space:pre">		</span>||376<span style=3D=
"white-space:pre">		</span>||<span style=3D"white-space:pre">	</span></div>=
<div>|}</div><div><br></div><div>=3D=3D Failed tasks 2017-09-27 =3D=3D</div=
><div><br></div><div>INFO: jenkins-job.sh-1.8.31 Complete log available at =
<a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.=
20171001_085046.log">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.report.20171001_085046.log</a></div><div><br></div><div>=3D=3D=3D common=
 (0) =3D=3D=3D</div><div><br></div><div>=3D=3D=3D common-x86 (1) =3D=3D=3D<=
/div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-support/mongodb=
/mongodb_git.bb:do_compile</div><div><br></div><div>=3D=3D=3D qemuarm (3) =
=3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-devto=
ols/android-tools/android-tools_5.1.1.r37.bb:do_compile</div><div>=C2=A0 =
=C2=A0 * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_packag=
e_qa</div><div>=C2=A0 =C2=A0 * openembedded-core/meta/recipes-core/glibc/gl=
ibc-locale_2.26.bb:do_package_qa</div><div><br></div><div>=3D=3D=3D qemux86=
 (2) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-networking/=
recipes-support/spice/spice_git.bb:do_compile</div><div>=C2=A0 =C2=A0 * ope=
nembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa</div>=
<div><br></div><div>=3D=3D=3D qemux86_64 (1) =3D=3D=3D</div><div>=C2=A0 =C2=
=A0 * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa</div><div><br></div><div>=3D=3D=3D Number of failed =
tasks (11) =3D=3D=3D</div><div>{| class=3Dwikitable</div><div>|-</div><div>=
|| qemuarm <span style=3D"white-space:pre">	</span>|| 3<span style=3D"white=
-space:pre">	</span> || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemuarm.20170926_004402.log/">http://logs.nslu2-linu=
x.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170926_004402.log/</a> |=
| <a href=3D"http://errors.yoctoproject.org/Errors/Build/47162/">http://err=
ors.yoctoproject.org/Errors/Build/47162/</a></div><div>|-</div><div>|| qemu=
x86 <span style=3D"white-space:pre">	</span>|| 6<span style=3D"white-space:=
pre">	</span> || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/=
rocko/log.world.qemux86.20170926_004401.log/">http://logs.nslu2-linux.org/b=
uildlogs/oe/world/rocko/log.world.qemux86.20170926_004401.log/</a> || <a hr=
ef=3D"http://errors.yoctoproject.org/Errors/Build/47142/">http://errors.yoc=
toproject.org/Errors/Build/47142/</a></div><div><a href=3D"http://errors.yo=
ctoproject.org/Errors/Build/47145/">http://errors.yoctoproject.org/Errors/B=
uild/47145/</a></div><div><a href=3D"http://errors.yoctoproject.org/Errors/=
Build/47166/">http://errors.yoctoproject.org/Errors/Build/47166/</a></div><=
div>|-</div><div>|| qemux86_64 <span style=3D"white-space:pre">	</span>|| 2=
<span style=3D"white-space:pre">	</span> || <a href=3D"http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170927_070922.log/"=
>http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.=
20170927_070922.log/</a> || <a href=3D"http://errors.yoctoproject.org/Error=
s/Build/47181/">http://errors.yoctoproject.org/Errors/Build/47181/</a></div=
><div>|}</div><div><br></div><div>=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D</div=
><div><br></div><div>=3D=3D=3D QA issues (383) =3D=3D=3D</div><div>{| class=
=3Dwikitable</div><div>!| Count<span style=3D"white-space:pre">		</span>||I=
ssue</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||al=
ready-stripped</div><div>|-</div><div>||0<span style=3D"white-space:pre">	<=
/span>||build-deps</div><div>|-</div><div>||0<span style=3D"white-space:pre=
">	</span>||compile-host-path</div><div>|-</div><div>||0<span style=3D"whit=
e-space:pre">	</span>||file-rdeps</div><div>|-</div><div>||0<span style=3D"=
white-space:pre">	</span>||installed-vs-shipped</div><div>|-</div><div>||0<=
span style=3D"white-space:pre">	</span>||invalid-pkgconfig</div><div>|-</di=
v><div>||0<span style=3D"white-space:pre">	</span>||ldflags</div><div>|-</d=
iv><div>||0<span style=3D"white-space:pre">	</span>||libdir</div><div>|-</d=
iv><div>||0<span style=3D"white-space:pre">	</span>||pkgname</div><div>|-</=
div><div>||0<span style=3D"white-space:pre">	</span>||symlink-to-sysroot</d=
iv><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||unknown-c=
onfigure-option</div><div>|-</div><div>||0<span style=3D"white-space:pre">	=
</span>||version-going-backwards</div><div>|-</div><div>||376<span style=3D=
"white-space:pre">	</span>||qa_pseudo</div><div>|-</div><div>||3<span style=
=3D"white-space:pre">	</span>||textrel</div><div>|-</div><div>||4<span styl=
e=3D"white-space:pre">	</span>||host-user-contaminated</div><div>|}</div><d=
iv><br></div><div><br></div><div><br></div><div>=3D=3D=3D Incorrect PACKAGE=
_ARCH or sstate signatures (2) =3D=3D=3D</div><div><br></div><div>Complete =
log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.si=
gnatures.20170927_105702.log/">http://logs.nslu2-linux.org/buildlogs/oe/wor=
ld/rocko/log.signatures.20170927_105702.log/</a></div><div>=C2=A0 =C2=A0 * =
ERROR: 2 issues were found in these recipes: go-native</div><div><br></div>=
<div>=C2=A0 =C2=A0 * ERROR: 1 errors found in signatures.qemuarm.do_configu=
re.sigdata.log</div><div>=C2=A0 =C2=A0 * ERROR: 1 errors found in signature=
s.qemuarm.do_populate_sysroot.sigdata.log</div><div><br></div><div>=C2=A0 =
=C2=A0 * ERROR: go-native different signature for task do_configure.sigdata=
 between qemux86copy and qemuarm</div><div>=C2=A0 =C2=A0 * ERROR: 1 errors =
found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1506545822/s=
ignatures.qemuarm.do_configure.sigdata.log</div><div>=C2=A0 =C2=A0 * ERROR:=
 go-native different signature for task do_populate_sysroot.sigdata between=
 qemux86copy and qemuarm</div><div>=C2=A0 =C2=A0 * ERROR: 1 errors found in=
 /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1506545822/signature=
s.qemuarm.do_populate_sysroot.sigdata.log</div><div>=C2=A0 =C2=A0 * ERROR: =
2 issues were found in these recipes: go-native</div><div><br></div><div><b=
r></div><div>PNBLACKLISTs:</div><div>openembedded-core/:</div><div>meta-bro=
wser:</div><div>meta-openembedded:</div><div>meta-networking/recipes-suppor=
t/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools] ?=3D &quot;=
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ld-is-gold&#39;, &quot=
;BROKEN: fails to link against sctp_connectx symbol&quot;, &#39;&#39;, d)}&=
quot;</div><div>meta-qt5:</div><div>PNBLACKLIST[android-system] =3D &quot;d=
epends on lxc from meta-virtualiazation which isn&#39;t included in my worl=
d builds&quot;</div><div>PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and =
doesn&#39;t really need to be tested so much&quot;</div><div>PNBLACKLIST[bi=
gbuckbunny-480p] =3D &quot;big and doesn&#39;t really need to be tested so =
much&quot;</div><div>PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn=
&#39;t really need to be tested so much&quot;</div><div>PNBLACKLIST[bigbuck=
bunny-720p] =3D &quot;big and doesn&#39;t really need to be tested so much&=
quot;</div><div>PNBLACKLIST[tearsofsteel-1080p] =3D &quot;big and doesn&#39=
;t really need to be tested so much&quot;</div><div>PNBLACKLIST[build-appli=
ance-image] =3D &quot;tries to include whole downloads directory in /home/b=
uilder/poky :/&quot;</div><div><br></div><div><br></div><div>QA issues by t=
ype:</div><div>count: 0<span style=3D"white-space:pre">	</span>issue: alrea=
dy-stripped</div><div><br></div><div><br></div><div>count: 0<span style=3D"=
white-space:pre">	</span>issue: libdir</div><div><br></div><div><br></div><=
div>count: 3<span style=3D"white-space:pre">	</span>issue: textrel</div><di=
v>corosync-2.4.2: ELF binary &#39;/work/core2-64-oe-linux/corosync/2.4.2-r0=
/packages-split/corosync/usr/sbin/corosync&#39; has relocations in .text [t=
extrel]</div><div>x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/work/i=
586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/us=
r/bin/x264&#39; has relocations in .text [textrel]</div><div>x264-r2731+git=
AUTOINC+2b741f81e5: ELF binary &#39;/work/i586-oe-linux/x264/r2731+gitAUTOI=
NC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148&#39; has reloca=
tions in .text [textrel]</div><div><br></div><div><br></div><div>count: 0<s=
pan style=3D"white-space:pre">	</span>issue: build-deps</div><div><br></div=
><div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>issue:=
 file-rdeps</div><div><br></div><div><br></div><div>count: 0<span style=3D"=
white-space:pre">	</span>issue: version-going-backwards</div><div><br></div=
><div><br></div><div>count: 4<span style=3D"white-space:pre">	</span>issue:=
 host-user-contaminated</div><div>glibc-locale-2.26: glibc-locale: /glibc-b=
inary-localedata-ar-iq/usr/lib/locale/ar_IQ/LC_MESSAGES/SYS_LC_MESSAGES is =
owned by uid 3004, which is the same as the user running bitbake. This may =
be due to host contamination [host-user-contaminated]</div><div>glibc-local=
e-2.26: glibc-locale: /glibc-binary-localedata-et-ee.iso-8859-1/usr/lib/loc=
ale/et_EE.ISO-8859-1/LC_MEASUREMENT is owned by uid 3004, which is the same=
 as the user running bitbake. This may be due to host contamination [host-u=
ser-contaminated]</div><div>glibc-locale-2.26: glibc-locale: /glibc-binary-=
localedata-sq-al.iso-8859-1/usr/lib/locale/sq_AL.ISO-8859-1/LC_CTYPE is own=
ed by uid 3004, which is the same as the user running bitbake. This may be =
due to host contamination [host-user-contaminated]</div><div>libqofono: /li=
bqofono-tests/usr/lib/libqofono-qt5/tests/tst_qofonocallmeter is owned by u=
id 3004, which is the same as the user running bitbake. This may be due to =
host contamination [host-user-contaminated]</div><div><br></div><div><br></=
div><div>count: 0<span style=3D"white-space:pre">	</span>issue: installed-v=
s-shipped</div><div><br></div><div><br></div><div>count: 0<span style=3D"wh=
ite-space:pre">	</span>issue: unknown-configure-option</div><div><br></div>=
<div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>issue: =
symlink-to-sysroot</div><div><br></div><div><br></div><div>count: 0<span st=
yle=3D"white-space:pre">	</span>issue: invalid-pkgconfig</div><div><br></di=
v><div><br></div><div>count: 0<span style=3D"white-space:pre">	</span>issue=
: pkgname</div><div><br></div><div><br></div><div>count: 0<span style=3D"wh=
ite-space:pre">	</span>issue: ldflags</div><div><br></div><div><br></div><d=
iv>count: 0<span style=3D"white-space:pre">	</span>issue: compile-host-path=
</div><div><br></div><div><br></div><div>count: 376<span style=3D"white-spa=
ce:pre">	</span>issue: qa_pseudo</div><div>acl-2.2.52: This /work/armv5te-o=
e-linux-gnueabi/acl/2.2.52-r0/pseudo/pseudo.log indicates 10 errors [qa_pse=
udo]</div><div>acl-2.2.52: This /work/core2-64-oe-linux/acl/2.2.52-r0/pseud=
o/pseudo.log indicates 4 errors [qa_pseudo]</div><div>alsa-plugins-1.1.4: T=
his /work/armv5te-oe-linux-gnueabi/alsa-plugins/1.1.4-r0/pseudo/pseudo.log =
indicates 7 errors [qa_pseudo]</div><div>alsa-plugins-1.1.4: This /work/cor=
e2-64-oe-linux/alsa-plugins/1.1.4-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]</div><div>apache2-2.4.27: This /work/armv5te-oe-linux-gnueabi/a=
pache2/2.4.27-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div=
>apache2-2.4.27: This /work/core2-64-oe-linux/apache2/2.4.27-r0/pseudo/pseu=
do.log indicates 5 errors [qa_pseudo]</div><div>apache2-2.4.27: This /work/=
i586-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.log indicates 7 errors [qa_ps=
eudo]</div><div>aspell-0.60.6.1: This /work/armv5e-oe-linux-gnueabi/aspell/=
0.60.6.1-r1/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>att=
r-2.4.47: This /work/i586-oe-linux/attr/2.4.47-r0/pseudo/pseudo.log indicat=
es 10 errors [qa_pseudo]</div><div>aufs-util-4.4+gitAUTOINC+89afb1806c: Thi=
s /work/core2-64-oe-linux/aufs-util/4.4+gitAUTOINC+89afb1806c-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]</div><div>autofs-5.1.2: This /work/=
armv5te-oe-linux-gnueabi/autofs/5.1.2-r0/pseudo/pseudo.log indicates 6 erro=
rs [qa_pseudo]</div><div>avahi-ui-0.6.32: This /work/i586-oe-linux/avahi-ui=
/0.6.32-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>blue=
z5-5.46: This /work/armv5te-oe-linux-gnueabi/bluez5/5.46-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]</div><div>bluez5-5.46: This /work/core2-=
64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]=
</div><div>bluez5-5.46: This /work/i586-oe-linux/bluez5/5.46-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]</div><div>bonnie++-1.03e: This /work/=
i586-oe-linux/bonnie++/1.03e-r0/pseudo/pseudo.log indicates 12 errors [qa_p=
seudo]</div><div>boost-1.64.0: This /work/armv5e-oe-linux-gnueabi/boost/1.6=
4.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</div><div>bootchar=
t2-0.14.8: This /work/i586-oe-linux/bootchart2/0.14.8-r0/pseudo/pseudo.log =
indicates 6 errors [qa_pseudo]</div><div>cantarell-fonts-0.0.24: This /work=
/all-oe-linux/cantarell-fonts/0.0.24-r0/pseudo/pseudo.log indicates 7 error=
s [qa_pseudo]</div><div>can-utils-0.0+gitrAUTOINC+4c8fb05cb4: This /work/ar=
mv5te-oe-linux-gnueabi/can-utils/0.0+gitrAUTOINC+4c8fb05cb4-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]</div><div>canutils-4.0.6: This /work/=
i586-oe-linux/canutils/4.0.6-r0/pseudo/pseudo.log indicates 6 errors [qa_ps=
eudo]</div><div>chrony-2.4: This /work/armv5te-oe-linux-gnueabi/chrony/2.4-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>chrony-2.4: T=
his /work/core2-64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log indicates 4 err=
ors [qa_pseudo]</div><div>chrony-2.4: This /work/i586-oe-linux/chrony/2.4-r=
0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>console-tools-=
0.3.2: This /work/core2-64-oe-linux/console-tools/0.3.2-r8/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]</div><div>coreutils-8.27: This /work/armv=
5te-oe-linux-gnueabi/coreutils/8.27-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]</div><div>cpufrequtils-008: This /work/armv5te-oe-linux-gnuea=
bi/cpufrequtils/008-r5/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</d=
iv><div>cryptodev-module-1.9: This /work/qemux86-oe-linux/cryptodev-module/=
1.9-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>ctdb-2.5.=
6: This /work/armv5te-oe-linux-gnueabi/ctdb/2.5.6-r0/pseudo/pseudo.log indi=
cates 13 errors [qa_pseudo]</div><div>curlpp-0.8.1: This /work/armv5te-oe-l=
inux-gnueabi/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseud=
o]</div><div>curlpp-0.8.1: This /work/core2-64-oe-linux/curlpp/0.8.1-r0/pse=
udo/pseudo.log indicates 5 errors [qa_pseudo]</div><div>curlpp-0.8.1: This =
/work/i586-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 7 errors [q=
a_pseudo]</div><div>cwautomacros-20110201: This /work/i586-oe-linux/cwautom=
acros/20110201-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><d=
iv>cxxtest-4.3: This /work/core2-64-oe-linux/cxxtest/4.3-r0/pseudo/pseudo.l=
og indicates 5 errors [qa_pseudo]</div><div>daemontools-0.76: This /work/co=
re2-64-oe-linux/daemontools/0.76-r0/pseudo/pseudo.log indicates 10 errors [=
qa_pseudo]</div><div>dbus-test-1.10.20: This /work/core2-64-oe-linux/dbus-t=
est/1.10.20-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]</div><div>d=
drescue-1.19: This /work/i586-oe-linux/ddrescue/1.19-r0/pseudo/pseudo.log i=
ndicates 12 errors [qa_pseudo]</div><div>dfu-util-0.9: This /work/core2-64-=
oe-linux/dfu-util/0.9-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]</=
div><div>dhcp-4.3.6: This /work/armv5te-oe-linux-gnueabi/dhcp/4.3.6-r0/pseu=
do/pseudo.log indicates 12 errors [qa_pseudo]</div><div>dhcp-4.3.6: This /w=
ork/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 10 errors [=
qa_pseudo]</div><div>dhcp-4.3.6: This /work/i586-oe-linux/dhcp/4.3.6-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>diffutils-3.6: Thi=
s /work/armv5te-oe-linux-gnueabi/diffutils/3.6-r0/pseudo/pseudo.log indicat=
es 10 errors [qa_pseudo]</div><div>dmidecode-3.1: This /work/i586-oe-linux/=
dmidecode/3.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><di=
v>dovecot-2.2.29: This /work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>dovecot-2.2.29: Th=
is /work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 11=
 errors [qa_pseudo]</div><div>dovecot-2.2.29: This /work/i586-oe-linux/dove=
cot/2.2.29-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]</div><div>e=
btables-2.0.10-4: This /work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-r4/=
pseudo/pseudo.log indicates 13 errors [qa_pseudo]</div><div>ebtables-2.0.10=
-4: This /work/i586-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicat=
es 7 errors [qa_pseudo]</div><div>efivar-0.31: This /work/armv5te-oe-linux-=
gnueabi/efivar/0.31-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</d=
iv><div>firefox-l10n-si-45.9.0esr: This /work/all-oe-linux/firefox-l10n-si/=
45.9.0esr-r3/pseudo/pseudo.log indicates 16 errors [qa_pseudo]</div><div>fo=
ntforge-20170731: This /work/i586-oe-linux/fontforge/20170731-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]</div><div>frame-2.5.0: This /work/c=
ore2-64-oe-linux/frame/2.5.0-r0/pseudo/pseudo.log indicates 10 errors [qa_p=
seudo]</div><div>freeradius-3.0.15: This /work/i586-oe-linux/freeradius/3.0=
.15-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>fribidi-=
0.19.7: This /work/i586-oe-linux/fribidi/0.19.7-r0/pseudo/pseudo.log indica=
tes 10 errors [qa_pseudo]</div><div>gateone-1.2+gitAUTOINC+f7a9be46cb: This=
 /work/armv5te-oe-linux-gnueabi/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]</div><div>gateone-1.2+gitAUTOIN=
C+f7a9be46cb: This /work/core2-64-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46c=
b-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><div>gateone-1.2=
+gitAUTOINC+f7a9be46cb: This /work/i586-oe-linux/gateone/1.2+gitAUTOINC+f7a=
9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>gegl-=
0.3.18: This /work/i586-oe-linux/gegl/0.3.18-r0/pseudo/pseudo.log indicates=
 7 errors [qa_pseudo]</div><div>geoip-1.6.9: This /work/i586-oe-linux/geoip=
/1.6.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>gette=
xt-0.19.8.1: This /work/armv5te-oe-linux-gnueabi/gettext/0.19.8.1-r0/pseudo=
/pseudo.log indicates 6 errors [qa_pseudo]</div><div>gettext-0.19.8.1: This=
 /work/i586-oe-linux/gettext/0.19.8.1-r0/pseudo/pseudo.log indicates 6 erro=
rs [qa_pseudo]</div><div>git-2.13.3: This /work/core2-64-oe-linux/git/2.13.=
3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</div><div>glib-2.0-2=
.52.3: This /work/core2-64-oe-linux/glib-2.0/1_2.52.3-r0/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]</div><div>glibc-2.26: This /work/armv5e-oe-l=
inux-gnueabi/glibc/2.26-r0/pseudo/pseudo.log indicates 32 errors [qa_pseudo=
]</div><div>glibc-2.26: This /work/core2-64-oe-linux/glibc/2.26-r0/pseudo/p=
seudo.log indicates 6 errors [qa_pseudo]</div><div>glibc-2.26: This /work/i=
586-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indicates 77 errors [qa_pseudo=
]</div><div>glibc-locale-2.26: This /work/armv5e-oe-linux-gnueabi/glibc-loc=
ale/2.26-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]</div><div>gli=
bc-locale-2.26: This /work/core2-64-oe-linux/glibc-locale/2.26-r0/pseudo/ps=
eudo.log indicates 11 errors [qa_pseudo]</div><div>glibc-locale-2.26: This =
/work/i586-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]</div><div>gnuplot-5.0.5: This /work/armv5te-oe-linux-gnueab=
i/gnuplot/5.0.5-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]</div><=
div>gobject-introspection-1.52.1: This /work/armv5te-oe-linux-gnueabi/gobje=
ct-introspection/1.52.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]=
</div><div>gobject-introspection-1.52.1: This /work/core2-64-oe-linux/gobje=
ct-introspection/1.52.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]=
</div><div>gobject-introspection-1.52.1: This /work/i586-oe-linux/gobject-i=
ntrospection/1.52.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</di=
v><div>gptfdisk-1.0.3: This /work/i586-oe-linux/gptfdisk/1.0.3-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]</div><div>gstreamer-0.10.36: This =
/work/i586-oe-linux/gstreamer/0.10.36-r2/pseudo/pseudo.log indicates 6 erro=
rs [qa_pseudo]</div><div>hiredis-0.13.1: This /work/core2-64-oe-linux/hired=
is/0.13.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</div><div>ic=
u-59.1: This /work/armv5e-oe-linux-gnueabi/icu/59.1-r0/pseudo/pseudo.log in=
dicates 7 errors [qa_pseudo]</div><div>icu-59.1: This /work/core2-64-oe-lin=
ux/icu/59.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>i=
cu-59.1: This /work/i586-oe-linux/icu/59.1-r0/pseudo/pseudo.log indicates 8=
 errors [qa_pseudo]</div><div>iptables-1.6.1: This /work/core2-64-oe-linux/=
iptables/1.6.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><di=
v>jack-1.9.10+gitAUTOINC+2d1d323505: This /work/core2-64-oe-linux/jack/1.9.=
10+gitAUTOINC+2d1d323505-r0/pseudo/pseudo.log indicates 10 errors [qa_pseud=
o]</div><div>kbd-2.0.4: This /work/core2-64-oe-linux/kbd/2.0.4-r0/pseudo/ps=
eudo.log indicates 5 errors [qa_pseudo]</div><div>kexec-tools-2.0.14: This =
/work/core2-64-oe-linux/kexec-tools/2.0.14-r1/pseudo/pseudo.log indicates 1=
0 errors [qa_pseudo]</div><div>krb5-1.15.1: This /work/core2-64-oe-linux/kr=
b5/1.15.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</div><div>lc=
dproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/core2-64-oe-linux/lcdproc/0.5=
.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo=
]</div><div>libatasmart-0.19: This /work/armv5te-oe-linux-gnueabi/libatasma=
rt/0.19-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>libbs=
d-0.8.6: This /work/core2-64-oe-linux/libbsd/0.8.6-r0/pseudo/pseudo.log ind=
icates 10 errors [qa_pseudo]</div><div>libconnman-qt5-1.1.10+gitAUTOINC+4d6=
def3053: This /work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.1.10+gitAUTOI=
NC+4d6def3053-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]</div><div=
>libconnman-qt5-1.1.10+gitAUTOINC+4d6def3053: This /work/core2-64-oe-linux/=
libconnman-qt5/1.1.10+gitAUTOINC+4d6def3053-r0/pseudo/pseudo.log indicates =
4 errors [qa_pseudo]</div><div>libconnman-qt5-1.1.10+gitAUTOINC+4d6def3053:=
 This /work/i586-oe-linux/libconnman-qt5/1.1.10+gitAUTOINC+4d6def3053-r0/ps=
eudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>libcrypt-openssl-r=
andom-perl-0.11: This /work/core2-64-oe-linux/libcrypt-openssl-random-perl/=
0.11-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]</div><div>libdrm-2=
.4.83: This /work/armv5te-oe-linux-gnueabi/libdrm/2.4.83-r0/pseudo/pseudo.l=
og indicates 7 errors [qa_pseudo]</div><div>libdrm-2.4.83: This /work/i586-=
oe-linux/libdrm/2.4.83-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]=
</div><div>libevdev-1.5.7: This /work/armv5te-oe-linux-gnueabi/libevdev/1.5=
.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>libgnome-=
2.32.1: This /work/i586-oe-linux/libgnome/2.32.1-r2/pseudo/pseudo.log indic=
ates 10 errors [qa_pseudo]</div><div>libinput-1.8.1: This /work/core2-64-oe=
-linux/libinput/1.8.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]<=
/div><div>liblogging-1.0.5: This /work/i586-oe-linux/liblogging/1.0.5-r0/ps=
eudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>libotr-4.1.1: Thi=
s /work/i586-oe-linux/libotr/4.1.1-r0/pseudo/pseudo.log indicates 12 errors=
 [qa_pseudo]</div><div>libqofono-0.87+gitrAUTOINC+54435de3be: This /work/ar=
mv5te-oe-linux-gnueabi/libqofono/0.87+gitrAUTOINC+54435de3be-r0/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]</div><div>libqofono-0.87+gitrAUTOINC=
+54435de3be: This /work/core2-64-oe-linux/libqofono/0.87+gitrAUTOINC+54435d=
e3be-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>libqofon=
o-0.87+gitrAUTOINC+54435de3be: This /work/i586-oe-linux/libqofono/0.87+gitr=
AUTOINC+54435de3be-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]</div=
><div>librelp-1.2.14: This /work/core2-64-oe-linux/librelp/1.2.14-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]</div><div>libtext-wrapi18n-perl=
-0.06: This /work/armv5te-oe-linux-gnueabi/libtext-wrapi18n-perl/0.06-r0/ps=
eudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>libtool-cross-2.4=
.6: This /work/armv5te-oe-linux-gnueabi/libtool-cross/2.4.6-r0/pseudo/pseud=
o.log indicates 4 errors [qa_pseudo]</div><div>libtool-cross-2.4.6: This /w=
ork/i586-oe-linux/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 5 erro=
rs [qa_pseudo]</div><div>libusb-compat-0.1.5: This /work/armv5te-oe-linux-g=
nueabi/libusb-compat/1_0.1.5-r0/pseudo/pseudo.log indicates 12 errors [qa_p=
seudo]</div><div>libusbg-0.1.0: This /work/core2-64-oe-linux/libusbg/0.1.0-=
r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]</div><div>libvncserver-=
0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9.11-r0/pseudo/p=
seudo.log indicates 7 errors [qa_pseudo]</div><div>libvncserver-0.9.11: Thi=
s /work/core2-64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicate=
s 5 errors [qa_pseudo]</div><div>libvncserver-0.9.11: This /work/i586-oe-li=
nux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]=
</div><div>libwmf-0.2.8.4: This /work/armv5te-oe-linux-gnueabi/libwmf/0.2.8=
.4-r3/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>libwmf-0.2=
.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indi=
cates 5 errors [qa_pseudo]</div><div>libwmf-0.2.8.4: This /work/i586-oe-lin=
ux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div>=
<div>libxml2-2.9.4: This /work/core2-64-oe-linux/libxml2/2.9.4-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]</div><div>libxslt-1.1.29: This /wo=
rk/armv5te-oe-linux-gnueabi/libxslt/1.1.29-r0/pseudo/pseudo.log indicates 1=
2 errors [qa_pseudo]</div><div>libxxf86vm-1.1.4: This /work/core2-64-oe-lin=
ux/libxxf86vm/1_1.1.4-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]<=
/div><div>linux-atm-2.5.2: This /work/qemuarm-oe-linux-gnueabi/linux-atm/2.=
5.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>linux-yoc=
to-4.12.12+gitAUTOINC+eda4d18ce4_16de014967: This /work/qemux86_64-oe-linux=
/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_16de014967-r0/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]</div><div>linux-yocto-4.12.12+gitAUTOINC+eda=
4d18ce4_16de014967: This /work/qemux86-oe-linux/linux-yocto/4.12.12+gitAUTO=
INC+eda4d18ce4_16de014967-r0/pseudo/pseudo.log indicates 4 errors [qa_pseud=
o]</div><div>linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_67b62d8d7b: This /wo=
rk/qemuarm-oe-linux-gnueabi/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_67b62=
d8d7b-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><div>lirc-0.=
9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseudo.log =
indicates 9 errors [qa_pseudo]</div><div>lirc-0.9.4d: This /work/core2-64-o=
e-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</di=
v><div>lirc-0.9.4d: This /work/i586-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]</div><div>llvm-5.0: This /work/armv5e-oe-=
linux-gnueabi/llvm/5.0-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]=
</div><div>llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo=
.log indicates 4 errors [qa_pseudo]</div><div>llvm-5.0: This /work/i586-oe-=
linux/llvm/5.0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><di=
v>log4cpp-1.1.2: This /work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseud=
o/pseudo.log indicates 7 errors [qa_pseudo]</div><div>log4cpp-1.1.2: This /=
work/core2-64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 4 error=
s [qa_pseudo]</div><div>log4cpp-1.1.2: This /work/i586-oe-linux/log4cpp/1.1=
.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>logfsprogs=
-git: This /work/i586-oe-linux/logfsprogs/git-r0/pseudo/pseudo.log indicate=
s 12 errors [qa_pseudo]</div><div>lttng-tools-2.9.5: This /work/armv5te-oe-=
linux-gnueabi/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 10 errors [q=
a_pseudo]</div><div>lttng-tools-2.9.5: This /work/core2-64-oe-linux/lttng-t=
ools/2.9.5-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]</div><div>m=
aliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-lin=
ux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseu=
do.log indicates 5 errors [qa_pseudo]</div><div>maliit-framework-qt5-0.99.0=
+gitAUTOINC+60b1b10de1: This /work/core2-64-oe-linux/maliit-framework-qt5/0=
.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 5 errors [qa_pse=
udo]</div><div>maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /wor=
k/i586-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo=
/pseudo.log indicates 6 errors [qa_pseudo]</div><div>mariadb-5.5.57: This /=
work/i586-oe-linux/mariadb/5.5.57-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]</div><div>mce-inject-git: This /work/i586-oe-linux/mce-inject/g=
it-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>md5deep-4=
.4: This /work/armv5te-oe-linux-gnueabi/md5deep/4.4-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]</div><div>memcached-1.5.0: This /work/core2-6=
4-oe-linux/memcached/1.5.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pse=
udo]</div><div>menulibre-2.1.3: This /work/armv5te-oe-linux-gnueabi/menulib=
re/2.1.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>mesa=
-demos-8.3.0: This /work/armv5te-oe-linux-gnueabi/mesa-demos/8.3.0-r0/pseud=
o/pseudo.log indicates 13 errors [qa_pseudo]</div><div>mosquitto-1.4.14: Th=
is /work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0/pseudo/pseudo.log ind=
icates 6 errors [qa_pseudo]</div><div>mosquitto-1.4.14: This /work/core2-64=
-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 11 errors [qa_pse=
udo]</div><div>mosquitto-1.4.14: This /work/i586-oe-linux/mosquitto/1.4.14-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>mozilla-devsc=
ripts-0.30: This /work/core2-64-oe-linux/mozilla-devscripts/0.30-r1/pseudo/=
pseudo.log indicates 4 errors [qa_pseudo]</div><div>mozilla-devscripts-0.30=
: This /work/i586-oe-linux/mozilla-devscripts/0.30-r1/pseudo/pseudo.log ind=
icates 6 errors [qa_pseudo]</div><div>mpich-3.2: This /work/i586-oe-linux/m=
pich/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>nana=
-2.5: This /work/armv5te-oe-linux-gnueabi/nana/2.5-r0/pseudo/pseudo.log ind=
icates 14 errors [qa_pseudo]</div><div>ndisc6-1.0.4+gitAUTOINC+4c794b5512: =
This /work/armv5te-oe-linux-gnueabi/ndisc6/1.0.4+gitAUTOINC+4c794b5512-r0/p=
seudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>net-snmp-5.7.3: T=
his /work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseudo/pseudo.log indi=
cates 6 errors [qa_pseudo]</div><div>net-snmp-5.7.3: This /work/core2-64-oe=
-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]</=
div><div>net-snmp-5.7.3: This /work/i586-oe-linux/net-snmp/5.7.3-r0/pseudo/=
pseudo.log indicates 6 errors [qa_pseudo]</div><div>nettle-3.3: This /work/=
armv5te-oe-linux-gnueabi/nettle/3.3-r0/pseudo/pseudo.log indicates 10 error=
s [qa_pseudo]</div><div>nginx-1.12.1: This /work/core2-64-oe-linux/nginx/1.=
12.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>nginx-1.=
12.1: This /work/i586-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.log indicates =
14 errors [qa_pseudo]</div><div>ntp-4.2.8p10: This /work/armv5te-oe-linux-g=
nueabi/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]</d=
iv><div>ntp-4.2.8p10: This /work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/p=
seudo.log indicates 11 errors [qa_pseudo]</div><div>ntp-4.2.8p10: This /wor=
k/i586-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 13 errors [qa_p=
seudo]</div><div>openconnect-7.08: This /work/armv5te-oe-linux-gnueabi/open=
connect/7.08-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]</div><div=
>openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo=
.log indicates 6 errors [qa_pseudo]</div><div>open-isns-0.97: This /work/co=
re2-64-oe-linux/open-isns/0.97-r0/pseudo/pseudo.log indicates 10 errors [qa=
_pseudo]</div><div>openlmi-tools-0.10.5: This /work/core2-64-oe-linux/openl=
mi-tools/0.10.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><d=
iv>opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/=
pseudo/pseudo.log indicates 18 errors [qa_pseudo]</div><div>opensaf-5.17.07=
: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicat=
es 19 errors [qa_pseudo]</div><div>opensaf-5.17.07: This /work/i586-oe-linu=
x/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 27 errors [qa_pseudo]</div=
><div>opensc-0.16.0: This /work/armv5te-oe-linux-gnueabi/opensc/0.16.0-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>openssh-7.5p1: T=
his /work/armv5te-oe-linux-gnueabi/openssh/7.5p1-r0/pseudo/pseudo.log indic=
ates 12 errors [qa_pseudo]</div><div>openssh-7.5p1: This /work/core2-64-oe-=
linux/openssh/7.5p1-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]</d=
iv><div>openssh-7.5p1: This /work/i586-oe-linux/openssh/7.5p1-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]</div><div>openssl-1.0.2l: This /wor=
k/i586-oe-linux/openssl/1.0.2l-r0/pseudo/pseudo.log indicates 4 errors [qa_=
pseudo]</div><div>opkg-utils-0.3.5: This /work/core2-64-oe-linux/opkg-utils=
/0.3.5-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>os-rel=
ease-1.0: This /work/all-oe-linux/os-release/1.0-r0/pseudo/pseudo.log indic=
ates 12 errors [qa_pseudo]</div><div>ossp-uuid-1.6.2: This /work/armv5te-oe=
-linux-gnueabi/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 7 errors [qa_=
pseudo]</div><div>ossp-uuid-1.6.2: This /work/core2-64-oe-linux/ossp-uuid/1=
.6.2-r2/pseudo/pseudo.log indicates 5 errors [qa_pseudo]</div><div>ossp-uui=
d-1.6.2: This /work/i586-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indi=
cates 7 errors [qa_pseudo]</div><div>packagegroup-core-ssh-openssh-1.0: Thi=
s /work/all-oe-linux/packagegroup-core-ssh-openssh/1.0-r1/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]</div><div>pciutils-3.5.5: This /work/i586-=
oe-linux/pciutils/3.5.5-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo=
]</div><div>perf-1.0: This /work/qemux86_64-oe-linux/perf/1.0-r9/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]</div><div>perl-5.24.1: This /work/a=
rmv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/pseudo.log indicates 5 errors=
 [qa_pseudo]</div><div>perl-5.24.1: This /work/core2-64-oe-linux/perl/5.24.=
1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>perl-5.24.1=
: This /work/i586-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indicates 5 err=
ors [qa_pseudo]</div><div>php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php=
/7.1.9-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]</div><div>php-7.=
1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicates =
6 errors [qa_pseudo]</div><div>php-7.1.9: This /work/i586-oe-linux/php/7.1.=
9-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]</div><div>pixz-1.0.6=
: This /work/i586-oe-linux/pixz/1.0.6-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]</div><div>pkcs11-helper-1.11: This /work/armv5te-oe-linux-g=
nueabi/pkcs11-helper/1.11-r0/pseudo/pseudo.log indicates 12 errors [qa_pseu=
do]</div><div>pm-qa-0.5.2: This /work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-=
r0/pseudo/pseudo.log indicates 45 errors [qa_pseudo]</div><div>pm-qa-0.5.2:=
 This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 52=
 errors [qa_pseudo]</div><div>pm-qa-0.5.2: This /work/i586-oe-linux/pm-qa/0=
.5.2-r0/pseudo/pseudo.log indicates 43 errors [qa_pseudo]</div><div>pm-util=
s-1.4.1: This /work/i586-oe-linux/pm-utils/1.4.1-r1/pseudo/pseudo.log indic=
ates 12 errors [qa_pseudo]</div><div>poppler-data-0.4.7: This /work/all-oe-=
linux/poppler-data/0.4.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseud=
o]</div><div>portaudio-v19-v190600: This /work/i586-oe-linux/portaudio-v19/=
v190600-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>post=
fix-3.2.2: This /work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]</div><div>postfix-3.2.2: This /work/=
core2-64-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log indicates 10 errors [q=
a_pseudo]</div><div>postfix-3.2.2: This /work/i586-oe-linux/postfix/3.2.2-r=
0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>postgresql-9.=
4.13: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.13-r0/pseudo/pseudo=
.log indicates 14 errors [qa_pseudo]</div><div>postgresql-9.4.13: This /wor=
k/core2-64-oe-linux/postgresql/9.4.13-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]</div><div>postgresql-9.4.13: This /work/i586-oe-linux/postg=
resql/9.4.13-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]</div><div=
>powertop-2.8: This /work/i586-oe-linux/powertop/2.8-r0/pseudo/pseudo.log i=
ndicates 12 errors [qa_pseudo]</div><div>procps-3.3.12: This /work/i586-oe-=
linux/procps/3.3.12-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</di=
v><div>proftpd-1.3.6: This /work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/=
pseudo/pseudo.log indicates 14 errors [qa_pseudo]</div><div>proftpd-1.3.6: =
This /work/core2-64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 1=
2 errors [qa_pseudo]</div><div>pure-ftpd-1.0.42: This /work/armv5te-oe-linu=
x-gnueabi/pure-ftpd/1.0.42-r0/pseudo/pseudo.log indicates 12 errors [qa_pse=
udo]</div><div>puzzles-0.0+gitAUTOINC+8dfe5cec31: This /work/armv5te-oe-lin=
ux-gnueabi/puzzles/1_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.log indicat=
es 12 errors [qa_pseudo]</div><div>puzzles-0.0+gitAUTOINC+8dfe5cec31: This =
/work/i586-oe-linux/puzzles/1_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]</div><div>pyrtm-0.4.2: This /work/armv5te=
-oe-linux-gnueabi/pyrtm/0.4.2-r0/pseudo/pseudo.log indicates 6 errors [qa_p=
seudo]</div><div>python-2.7.13: This /work/armv5te-oe-linux-gnueabi/python/=
2.7.13-r1/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><div>python=
-2.7.13: This /work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log in=
dicates 4 errors [qa_pseudo]</div><div>python-2.7.13: This /work/i586-oe-li=
nux/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]</div>=
<div>python3-3.5.3: This /work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/=
pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>python3-3.5.3: T=
his /work/i586-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 7 er=
rors [qa_pseudo]</div><div>python3-coverage-4.4.1: This /work/core2-64-oe-l=
inux/python3-coverage/4.4.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pse=
udo]</div><div>python3-django-1.11.5: This /work/core2-64-oe-linux/python3-=
django/1.11.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><div=
>python3-django-1.11.5: This /work/i586-oe-linux/python3-django/1.11.5-r0/p=
seudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>python3-docutils-=
0.14: This /work/armv5te-oe-linux-gnueabi/python3-docutils/0.14-r0/pseudo/p=
seudo.log indicates 6 errors [qa_pseudo]</div><div>python3-mako-1.0.7: This=
 /work/core2-64-oe-linux/python3-mako/1.0.7-r0/pseudo/pseudo.log indicates =
4 errors [qa_pseudo]</div><div>python3-pip-9.0.1: This /work/core2-64-oe-li=
nux/python3-pip/9.0.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</=
div><div>python3-pip-9.0.1: This /work/i586-oe-linux/python3-pip/9.0.1-r0/p=
seudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>python3-psutil-5.=
3.1: This /work/armv5te-oe-linux-gnueabi/python3-psutil/5.3.1-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]</div><div>python3-pylint-1.7.2: Thi=
s /work/armv5te-oe-linux-gnueabi/python3-pylint/1.7.2-r0/pseudo/pseudo.log =
indicates 6 errors [qa_pseudo]</div><div>python3-pylint-1.7.2: This /work/c=
ore2-64-oe-linux/python3-pylint/1.7.2-r0/pseudo/pseudo.log indicates 4 erro=
rs [qa_pseudo]</div><div>python3-pylint-1.7.2: This /work/i586-oe-linux/pyt=
hon3-pylint/1.7.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div>=
<div>python3-pyparted-3.10.7+gitAUTOINC+69c4a478e4: This /work/armv5te-oe-l=
inux-gnueabi/python3-pyparted/3.10.7+gitAUTOINC+69c4a478e4-r0/pseudo/pseudo=
.log indicates 6 errors [qa_pseudo]</div><div>python-cheetah-2.4.4: This /w=
ork/armv5te-oe-linux-gnueabi/python-cheetah/2.4.4-r3/pseudo/pseudo.log indi=
cates 6 errors [qa_pseudo]</div><div>python-cheetah-2.4.4: This /work/core2=
-64-oe-linux/python-cheetah/2.4.4-r3/pseudo/pseudo.log indicates 4 errors [=
qa_pseudo]</div><div>python-cheetah-2.4.4: This /work/i586-oe-linux/python-=
cheetah/2.4.4-r3/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div=
>python-cython-0.26.1: This /work/armv5te-oe-linux-gnueabi/python-cython/0.=
26.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>python-i=
maging-1.1.7: This /work/i586-oe-linux/python-imaging/1.1.7-r5/pseudo/pseud=
o.log indicates 7 errors [qa_pseudo]</div><div>python-jsonpatch-1.16: This =
/work/armv5te-oe-linux-gnueabi/python-jsonpatch/1.16-r0/pseudo/pseudo.log i=
ndicates 6 errors [qa_pseudo]</div><div>python-jsonpointer-1.12: This /work=
/i586-oe-linux/python-jsonpointer/1.12-r0/pseudo/pseudo.log indicates 6 err=
ors [qa_pseudo]</div><div>python-ndg-httpsclient-0.4.3: This /work/core2-64=
-oe-linux/python-ndg-httpsclient/0.4.3-r0/pseudo/pseudo.log indicates 4 err=
ors [qa_pseudo]</div><div>python-numpy-1.13.1: This /work/core2-64-oe-linux=
/python-numpy/1.13.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</d=
iv><div>python-pbr-3.1.1: This /work/armv5te-oe-linux-gnueabi/python-pbr/3.=
1.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>python-pb=
r-3.1.1: This /work/i586-oe-linux/python-pbr/3.1.1-r0/pseudo/pseudo.log ind=
icates 6 errors [qa_pseudo]</div><div>python-pyflakes-1.2.3: This /work/i58=
6-oe-linux/python-pyflakes/1.2.3-r0/pseudo/pseudo.log indicates 6 errors [q=
a_pseudo]</div><div>python-pylint-1.7.2: This /work/armv5te-oe-linux-gnueab=
i/python-pylint/1.7.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</=
div><div>python-pylint-1.7.2: This /work/core2-64-oe-linux/python-pylint/1.=
7.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><div>python-py=
lint-1.7.2: This /work/i586-oe-linux/python-pylint/1.7.2-r0/pseudo/pseudo.l=
og indicates 6 errors [qa_pseudo]</div><div>python-selectors34-1.2: This /w=
ork/core2-64-oe-linux/python-selectors34/1.2-r0/pseudo/pseudo.log indicates=
 10 errors [qa_pseudo]</div><div>python-snakefood-1.4: This /work/armv5te-o=
e-linux-gnueabi/python-snakefood/1.4-r0/pseudo/pseudo.log indicates 12 erro=
rs [qa_pseudo]</div><div>python-snakefood-1.4: This /work/core2-64-oe-linux=
/python-snakefood/1.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</=
div><div>python-snimpy-0.8.11: This /work/core2-64-oe-linux/python-snimpy/0=
.8.11-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><div>python-=
yappi-0.98: This /work/i586-oe-linux/python-yappi/0.98-r0/pseudo/pseudo.log=
 indicates 6 errors [qa_pseudo]</div><div>qt3d-5.9.2+gitAUTOINC+9d8c9ada16:=
 This /work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+9d8c9ada16-r0/ps=
eudo/pseudo.log indicates 9 errors [qa_pseudo]</div><div>qt3d-5.9.2+gitAUTO=
INC+9d8c9ada16: This /work/core2-64-oe-linux/qt3d/5.9.2+gitAUTOINC+9d8c9ada=
16-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>qt3d-5.9.2=
+gitAUTOINC+9d8c9ada16: This /work/i586-oe-linux/qt3d/5.9.2+gitAUTOINC+9d8c=
9ada16-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]</div><div>qt5-cr=
eator-3.5.1: This /work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.1-r0/pseud=
o/pseudo.log indicates 4 errors [qa_pseudo]</div><div>qtbase-5.9.2+gitAUTOI=
NC+73573fce29: This /work/armv5te-oe-linux-gnueabi/qtbase/5.9.2+gitAUTOINC+=
73573fce29-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qt=
base-5.9.2+gitAUTOINC+73573fce29: This /work/core2-64-oe-linux/qtbase/5.9.2=
+gitAUTOINC+73573fce29-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]=
</div><div>qtbase-5.9.2+gitAUTOINC+73573fce29: This /work/i586-oe-linux/qtb=
ase/5.9.2+gitAUTOINC+73573fce29-r0/pseudo/pseudo.log indicates 9 errors [qa=
_pseudo]</div><div>qtcharts-5.9.2+gitAUTOINC+1f47b1a7ae: This /work/armv5te=
-oe-linux-gnueabi/qtcharts/5.9.2+gitAUTOINC+1f47b1a7ae-r0/pseudo/pseudo.log=
 indicates 7 errors [qa_pseudo]</div><div>qtcharts-5.9.2+gitAUTOINC+1f47b1a=
7ae: This /work/core2-64-oe-linux/qtcharts/5.9.2+gitAUTOINC+1f47b1a7ae-r0/p=
seudo/pseudo.log indicates 5 errors [qa_pseudo]</div><div>qtcharts-5.9.2+gi=
tAUTOINC+1f47b1a7ae: This /work/i586-oe-linux/qtcharts/5.9.2+gitAUTOINC+1f4=
7b1a7ae-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]</div><div>qtco=
nnectivity-5.9.2+gitAUTOINC+94cc2b914a: This /work/armv5te-oe-linux-gnueabi=
/qtconnectivity/5.9.2+gitAUTOINC+94cc2b914a-r0/pseudo/pseudo.log indicates =
11 errors [qa_pseudo]</div><div>qtconnectivity-5.9.2+gitAUTOINC+94cc2b914a:=
 This /work/i586-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+94cc2b914a-r0/pse=
udo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>qtdatavis3d-5.9.2+g=
itAUTOINC+3f8ae713df: This /work/core2-64-oe-linux/qtdatavis3d/5.9.2+gitAUT=
OINC+3f8ae713df-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]</div><d=
iv>qtdatavis3d-5.9.2+gitAUTOINC+3f8ae713df: This /work/i586-oe-linux/qtdata=
vis3d/5.9.2+gitAUTOINC+3f8ae713df-r0/pseudo/pseudo.log indicates 6 errors [=
qa_pseudo]</div><div>qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: This /work/=
armv5te-oe-linux-gnueabi/qtdeclarative/5.9.2+gitAUTOINC+7c45b035b9-r0/pseud=
o/pseudo.log indicates 11 errors [qa_pseudo]</div><div>qtdeclarative-5.9.2+=
gitAUTOINC+7c45b035b9: This /work/core2-64-oe-linux/qtdeclarative/5.9.2+git=
AUTOINC+7c45b035b9-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]</di=
v><div>qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: This /work/i586-oe-linux/=
qtdeclarative/5.9.2+gitAUTOINC+7c45b035b9-r0/pseudo/pseudo.log indicates 12=
 errors [qa_pseudo]</div><div>qtenginio-5.9.2+gitAUTOINC+0555cf73c8: This /=
work/armv5te-oe-linux-gnueabi/qtenginio/5.9.2+gitAUTOINC+0555cf73c8-r0/pseu=
do/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qtenginio-5.9.2+gitA=
UTOINC+0555cf73c8: This /work/i586-oe-linux/qtenginio/5.9.2+gitAUTOINC+0555=
cf73c8-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]</div><div>qtgame=
pad-5.9.2+gitAUTOINC+1fc40deed6: This /work/armv5te-oe-linux-gnueabi/qtgame=
pad/5.9.2+gitAUTOINC+1fc40deed6-r0/pseudo/pseudo.log indicates 6 errors [qa=
_pseudo]</div><div>qtgamepad-5.9.2+gitAUTOINC+1fc40deed6: This /work/core2-=
64-oe-linux/qtgamepad/5.9.2+gitAUTOINC+1fc40deed6-r0/pseudo/pseudo.log indi=
cates 5 errors [qa_pseudo]</div><div>qtgamepad-5.9.2+gitAUTOINC+1fc40deed6:=
 This /work/i586-oe-linux/qtgamepad/5.9.2+gitAUTOINC+1fc40deed6-r0/pseudo/p=
seudo.log indicates 6 errors [qa_pseudo]</div><div>qtgraphicaleffects-5.9.2=
+gitAUTOINC+b6ff12df54: This /work/core2-64-oe-linux/qtgraphicaleffects/5.9=
.2+gitAUTOINC+b6ff12df54-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo=
]</div><div>qtimageformats-5.9.2+gitAUTOINC+144a3535db: This /work/core2-64=
-oe-linux/qtimageformats/5.9.2+gitAUTOINC+144a3535db-r0/pseudo/pseudo.log i=
ndicates 4 errors [qa_pseudo]</div><div>qtlocation-5.9.2+gitAUTOINC+c832af7=
897_9ecbe3642f: This /work/armv5te-oe-linux-gnueabi/qtlocation/5.9.2+gitAUT=
OINC+c832af7897_9ecbe3642f-r0/pseudo/pseudo.log indicates 19 errors [qa_pse=
udo]</div><div>qtlocation-5.9.2+gitAUTOINC+c832af7897_9ecbe3642f: This /wor=
k/i586-oe-linux/qtlocation/5.9.2+gitAUTOINC+c832af7897_9ecbe3642f-r0/pseudo=
/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qtmultimedia-5.9.2+git=
AUTOINC+343e281f0e: This /work/armv5te-oe-linux-gnueabi/qtmultimedia/5.9.2+=
gitAUTOINC+343e281f0e-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</=
div><div>qtmultimedia-5.9.2+gitAUTOINC+343e281f0e: This /work/core2-64-oe-l=
inux/qtmultimedia/5.9.2+gitAUTOINC+343e281f0e-r0/pseudo/pseudo.log indicate=
s 5 errors [qa_pseudo]</div><div>qtmultimedia-5.9.2+gitAUTOINC+343e281f0e: =
This /work/i586-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+343e281f0e-r0/pseudo=
/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qtnetworkauth-5.9.2+gi=
tAUTOINC+3d93f64365: This /work/armv5te-oe-linux-gnueabi/qtnetworkauth/5.9.=
2+gitAUTOINC+3d93f64365-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]=
</div><div>qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365: This /work/core2-64-o=
e-linux/qtnetworkauth/5.9.2+gitAUTOINC+3d93f64365-r0/pseudo/pseudo.log indi=
cates 6 errors [qa_pseudo]</div><div>qtnetworkauth-5.9.2+gitAUTOINC+3d93f64=
365: This /work/i586-oe-linux/qtnetworkauth/5.9.2+gitAUTOINC+3d93f64365-r0/=
pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qtquick1-5.9.2+g=
itAUTOINC+9bf0edd9bd: This /work/armv5te-oe-linux-gnueabi/qtquick1/5.9.2+gi=
tAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]</d=
iv><div>qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/core2-64-oe-linux/=
qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 10 erro=
rs [qa_pseudo]</div><div>qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/i=
586-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indi=
cates 20 errors [qa_pseudo]</div><div>qtquickcontrols2-5.9.2+gitAUTOINC+63f=
2f55462: This /work/armv5te-oe-linux-gnueabi/qtquickcontrols2/5.9.2+gitAUTO=
INC+63f2f55462-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><di=
v>qtquickcontrols2-5.9.2+gitAUTOINC+63f2f55462: This /work/core2-64-oe-linu=
x/qtquickcontrols2/5.9.2+gitAUTOINC+63f2f55462-r0/pseudo/pseudo.log indicat=
es 7 errors [qa_pseudo]</div><div>qtquickcontrols2-5.9.2+gitAUTOINC+63f2f55=
462: This /work/i586-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+63f2f55462-=
r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qtremoteobjec=
ts-5.9.2+gitAUTOINC+6e0341bc87: This /work/armv5te-oe-linux-gnueabi/qtremot=
eobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates 5 error=
s [qa_pseudo]</div><div>qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /=
work/core2-64-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]</div><div>qtremoteobjects-5.9.2=
+gitAUTOINC+6e0341bc87: This /work/i586-oe-linux/qtremoteobjects/5.9.2+gitA=
UTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div>=
<div>qtscript-5.9.2+gitAUTOINC+86ee61734e: This /work/armv5e-oe-linux-gnuea=
bi/qtscript/5.9.2+gitAUTOINC+86ee61734e-r0/pseudo/pseudo.log indicates 7 er=
rors [qa_pseudo]</div><div>qtscript-5.9.2+gitAUTOINC+86ee61734e: This /work=
/core2-64-oe-linux/qtscript/5.9.2+gitAUTOINC+86ee61734e-r0/pseudo/pseudo.lo=
g indicates 8 errors [qa_pseudo]</div><div>qtscript-5.9.2+gitAUTOINC+86ee61=
734e: This /work/i586-oe-linux/qtscript/5.9.2+gitAUTOINC+86ee61734e-r0/pseu=
do/pseudo.log indicates 11 errors [qa_pseudo]</div><div>qtscxml-5.9.2+gitAU=
TOINC+a1dff1a11a: This /work/armv5te-oe-linux-gnueabi/qtscxml/5.9.2+gitAUTO=
INC+a1dff1a11a-r0/pseudo/pseudo.log indicates 21 errors [qa_pseudo]</div><d=
iv>qtscxml-5.9.2+gitAUTOINC+a1dff1a11a: This /work/i586-oe-linux/qtscxml/5.=
9.2+gitAUTOINC+a1dff1a11a-r0/pseudo/pseudo.log indicates 7 errors [qa_pseud=
o]</div><div>qtsensors-5.9.2+gitAUTOINC+1673dbed00: This /work/armv5te-oe-l=
inux-gnueabi/qtsensors/5.9.2+gitAUTOINC+1673dbed00-r0/pseudo/pseudo.log ind=
icates 8 errors [qa_pseudo]</div><div>qtsensors-5.9.2+gitAUTOINC+1673dbed00=
: This /work/core2-64-oe-linux/qtsensors/5.9.2+gitAUTOINC+1673dbed00-r0/pse=
udo/pseudo.log indicates 17 errors [qa_pseudo]</div><div>qtsensors-5.9.2+gi=
tAUTOINC+1673dbed00: This /work/i586-oe-linux/qtsensors/5.9.2+gitAUTOINC+16=
73dbed00-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>qtse=
rialbus-5.9.2+gitAUTOINC+1d37c357c8: This /work/armv5te-oe-linux-gnueabi/qt=
serialbus/5.9.2+gitAUTOINC+1d37c357c8-r0/pseudo/pseudo.log indicates 7 erro=
rs [qa_pseudo]</div><div>qtserialbus-5.9.2+gitAUTOINC+1d37c357c8: This /wor=
k/core2-64-oe-linux/qtserialbus/5.9.2+gitAUTOINC+1d37c357c8-r0/pseudo/pseud=
o.log indicates 4 errors [qa_pseudo]</div><div>qtserialbus-5.9.2+gitAUTOINC=
+1d37c357c8: This /work/i586-oe-linux/qtserialbus/5.9.2+gitAUTOINC+1d37c357=
c8-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qtserialpo=
rt-5.9.2+gitAUTOINC+93b539140c: This /work/armv5te-oe-linux-gnueabi/qtseria=
lport/5.9.2+gitAUTOINC+93b539140c-r0/pseudo/pseudo.log indicates 7 errors [=
qa_pseudo]</div><div>qtserialport-5.9.2+gitAUTOINC+93b539140c: This /work/c=
ore2-64-oe-linux/qtserialport/5.9.2+gitAUTOINC+93b539140c-r0/pseudo/pseudo.=
log indicates 5 errors [qa_pseudo]</div><div>qtserialport-5.9.2+gitAUTOINC+=
93b539140c: This /work/i586-oe-linux/qtserialport/5.9.2+gitAUTOINC+93b53914=
0c-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qtsmarthom=
e-1.0: This /work/i586-oe-linux/qtsmarthome/1.0-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]</div><div>qtsvg-5.9.2+gitAUTOINC+0fcd016066: This=
 /work/armv5te-oe-linux-gnueabi/qtsvg/5.9.2+gitAUTOINC+0fcd016066-r0/pseudo=
/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qtsvg-5.9.2+gitAUTOINC=
+0fcd016066: This /work/core2-64-oe-linux/qtsvg/5.9.2+gitAUTOINC+0fcd016066=
-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]</div><div>qtsvg-5.9.2=
+gitAUTOINC+0fcd016066: This /work/i586-oe-linux/qtsvg/5.9.2+gitAUTOINC+0fc=
d016066-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>qtsys=
tems-5.9.2+gitAUTOINC+f364358a81: This /work/armv5te-oe-linux-gnueabi/qtsys=
tems/5.9.2+gitAUTOINC+f364358a81-r0/pseudo/pseudo.log indicates 8 errors [q=
a_pseudo]</div><div>qtsystems-5.9.2+gitAUTOINC+f364358a81: This /work/core2=
-64-oe-linux/qtsystems/5.9.2+gitAUTOINC+f364358a81-r0/pseudo/pseudo.log ind=
icates 5 errors [qa_pseudo]</div><div>qtsystems-5.9.2+gitAUTOINC+f364358a81=
: This /work/i586-oe-linux/qtsystems/5.9.2+gitAUTOINC+f364358a81-r0/pseudo/=
pseudo.log indicates 7 errors [qa_pseudo]</div><div>qttools-5.9.2+gitAUTOIN=
C+fdc5749b56: This /work/armv5te-oe-linux-gnueabi/qttools/5.9.2+gitAUTOINC+=
fdc5749b56-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><div>qt=
tools-5.9.2+gitAUTOINC+fdc5749b56: This /work/core2-64-oe-linux/qttools/5.9=
.2+gitAUTOINC+fdc5749b56-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo=
]</div><div>qttools-5.9.2+gitAUTOINC+fdc5749b56: This /work/i586-oe-linux/q=
ttools/5.9.2+gitAUTOINC+fdc5749b56-r0/pseudo/pseudo.log indicates 10 errors=
 [qa_pseudo]</div><div>qtwayland-5.9.2+gitAUTOINC+7f70da6a64: This /work/ar=
mv5te-oe-linux-gnueabi/qtwayland/5.9.2+gitAUTOINC+7f70da6a64-r0/pseudo/pseu=
do.log indicates 7 errors [qa_pseudo]</div><div>qtwayland-5.9.2+gitAUTOINC+=
7f70da6a64: This /work/core2-64-oe-linux/qtwayland/5.9.2+gitAUTOINC+7f70da6=
a64-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]</div><div>qtwayland=
-5.9.2+gitAUTOINC+7f70da6a64: This /work/i586-oe-linux/qtwayland/5.9.2+gitA=
UTOINC+7f70da6a64-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div>=
<div>qtwebchannel-5.9.2+gitAUTOINC+b5229df6a0: This /work/armv5te-oe-linux-=
gnueabi/qtwebchannel/5.9.2+gitAUTOINC+b5229df6a0-r0/pseudo/pseudo.log indic=
ates 7 errors [qa_pseudo]</div><div>qtwebchannel-5.9.2+gitAUTOINC+b5229df6a=
0: This /work/core2-64-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+b5229df6a0-r0=
/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>qtwebchannel-5.=
9.2+gitAUTOINC+b5229df6a0: This /work/i586-oe-linux/qtwebchannel/5.9.2+gitA=
UTOINC+b5229df6a0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div>=
<div>qtwebengine-5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54: This /work/core2-6=
4-oe-linux/qtwebengine/5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54-r0/pseudo/pse=
udo.log indicates 4 errors [qa_pseudo]</div><div>qtwebengine-5.9.2+gitAUTOI=
NC+99f84ffd2c_21508b5b54: This /work/i586-oe-linux/qtwebengine/5.9.2+gitAUT=
OINC+99f84ffd2c_21508b5b54-r0/pseudo/pseudo.log indicates 9 errors [qa_pseu=
do]</div><div>qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-li=
nux-gnueabi/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indic=
ates 7 errors [qa_pseudo]</div><div>qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: T=
his /work/core2-64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/=
pseudo.log indicates 5 errors [qa_pseudo]</div><div>qtwebkit-5.9.2+gitAUTOI=
NC+97c4a80a12: This /work/i586-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a1=
2-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]</div><div>qtwebsocket=
s-5.9.2+gitAUTOINC+fb71c823a7: This /work/core2-64-oe-linux/qtwebsockets/5.=
9.2+gitAUTOINC+fb71c823a7-r0/pseudo/pseudo.log indicates 7 errors [qa_pseud=
o]</div><div>qtwebsockets-5.9.2+gitAUTOINC+fb71c823a7: This /work/i586-oe-l=
inux/qtwebsockets/5.9.2+gitAUTOINC+fb71c823a7-r0/pseudo/pseudo.log indicate=
s 7 errors [qa_pseudo]</div><div>qtwebview-5.9.2+gitAUTOINC+e4016a67bb: Thi=
s /work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOINC+e4016a67bb-r0/pseudo/p=
seudo.log indicates 5 errors [qa_pseudo]</div><div>qtwebview-5.9.2+gitAUTOI=
NC+e4016a67bb: This /work/i586-oe-linux/qtwebview/5.9.2+gitAUTOINC+e4016a67=
bb-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qtx11extra=
s-5.9.2+gitAUTOINC+f65d50eb06: This /work/armv5te-oe-linux-gnueabi/qtx11ext=
ras/5.9.2+gitAUTOINC+f65d50eb06-r0/pseudo/pseudo.log indicates 7 errors [qa=
_pseudo]</div><div>qtx11extras-5.9.2+gitAUTOINC+f65d50eb06: This /work/core=
2-64-oe-linux/qtx11extras/5.9.2+gitAUTOINC+f65d50eb06-r0/pseudo/pseudo.log =
indicates 6 errors [qa_pseudo]</div><div>qtx11extras-5.9.2+gitAUTOINC+f65d5=
0eb06: This /work/i586-oe-linux/qtx11extras/5.9.2+gitAUTOINC+f65d50eb06-r0/=
pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>qtxmlpatterns-5.=
9.2+gitAUTOINC+fcfa824402: This /work/armv5te-oe-linux-gnueabi/qtxmlpattern=
s/5.9.2+gitAUTOINC+fcfa824402-r0/pseudo/pseudo.log indicates 4 errors [qa_p=
seudo]</div><div>qtxmlpatterns-5.9.2+gitAUTOINC+fcfa824402: This /work/core=
2-64-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+fcfa824402-r0/pseudo/pseudo.lo=
g indicates 11 errors [qa_pseudo]</div><div>qtxmlpatterns-5.9.2+gitAUTOINC+=
fcfa824402: This /work/i586-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+fcfa824=
402-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]</div><div>quagga-1=
.2.1: This /work/armv5te-oe-linux-gnueabi/quagga/1.2.1-r0/pseudo/pseudo.log=
 indicates 15 errors [qa_pseudo]</div><div>rabbitmq-c-0.7.0: This /work/i58=
6-oe-linux/rabbitmq-c/0.7.0-r0/pseudo/pseudo.log indicates 16 errors [qa_ps=
eudo]</div><div>radvd-2.17: This /work/armv5te-oe-linux-gnueabi/radvd/2.17-=
r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>radvd-2.17: T=
his /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 4 err=
ors [qa_pseudo]</div><div>radvd-2.17: This /work/i586-oe-linux/radvd/2.17-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><div>ristretto-0.8.=
2: This /work/armv5te-oe-linux-gnueabi/ristretto/0.8.2-r0/pseudo/pseudo.log=
 indicates 6 errors [qa_pseudo]</div><div>rsyslog-8.29.0: This /work/armv5t=
e-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 4 errors [=
qa_pseudo]</div><div>rsyslog-8.29.0: This /work/i586-oe-linux/rsyslog/8.29.=
0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><div>ruby-2.4.1:=
 This /work/armv5te-oe-linux-gnueabi/ruby/2.4.1-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]</div><div>samba-4.6.7: This /work/core2-64-oe-lin=
ux/samba/4.6.7-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]</div><di=
v>samba-4.6.7: This /work/i586-oe-linux/samba/4.6.7-r0/pseudo/pseudo.log in=
dicates 4 errors [qa_pseudo]</div><div>sblim-sfcb-1.4.9: This /work/i586-oe=
-linux/sblim-sfcb/1.4.9-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]=
</div><div>shadow-4.2.1: This /work/core2-64-oe-linux/shadow/4.2.1-r0/pseud=
o/pseudo.log indicates 11 errors [qa_pseudo]</div><div>squid-3.5.27: This /=
work/armv5te-oe-linux-gnueabi/squid/3.5.27-r0/pseudo/pseudo.log indicates 1=
2 errors [qa_pseudo]</div><div>squid-3.5.27: This /work/core2-64-oe-linux/s=
quid/3.5.27-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</div><div>=
squid-3.5.27: This /work/i586-oe-linux/squid/3.5.27-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]</div><div>sthttpd-2.27.1: This /work/armv5te-=
oe-linux-gnueabi/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 14 errors [q=
a_pseudo]</div><div>sthttpd-2.27.1: This /work/core2-64-oe-linux/sthttpd/2.=
27.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]</div><div>sthttpd-=
2.27.1: This /work/i586-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indica=
tes 7 errors [qa_pseudo]</div><div>strace-4.18: This /work/i586-oe-linux/st=
race/4.18-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>sys=
temd-234: This /work/core2-64-oe-linux/systemd/1_234-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]</div><div>systemd-234: This /work/i586-oe-li=
nux/systemd/1_234-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</div=
><div>systemtap-3.1: This /work/armv5te-oe-linux-gnueabi/systemtap/3.1-r0/p=
seudo/pseudo.log indicates 8 errors [qa_pseudo]</div><div>tcl-8.6.7: This /=
work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.log indicates 7 er=
rors [qa_pseudo]</div><div>tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.=
7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>tcl-8.6.7: =
This /work/i586-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indicates 7 errors =
[qa_pseudo]</div><div>tftp-hpa-5.2: This /work/armv5te-oe-linux-gnueabi/tft=
p-hpa/5.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><div>tft=
p-hpa-5.2: This /work/core2-64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log i=
ndicates 5 errors [qa_pseudo]</div><div>tftp-hpa-5.2: This /work/i586-oe-li=
nux/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]</div><=
div>tslib-1.1: This /work/armv5te-oe-linux-gnueabi/tslib/1.1-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]</div><div>tslib-1.1: This /work/core2=
-64-oe-linux/tslib/1.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]<=
/div><div>udisks-1.0.5: This /work/core2-64-oe-linux/udisks/1.0.5-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]</div><div>ufw-0.33: This /work/=
armv5te-oe-linux-gnueabi/ufw/0.33-r0/pseudo/pseudo.log indicates 9 errors [=
qa_pseudo]</div><div>ufw-0.33: This /work/core2-64-oe-linux/ufw/0.33-r0/pse=
udo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>ufw-0.33: This /wor=
k/i586-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo=
]</div><div>usermode-1.111: This /work/i586-oe-linux/usermode/1.111-r0/pseu=
do/pseudo.log indicates 5 errors [qa_pseudo]</div><div>vblade-22: This /wor=
k/i586-oe-linux/vblade/22-r0/pseudo/pseudo.log indicates 12 errors [qa_pseu=
do]</div><div>vlc-2.2.2: This /work/i586-oe-linux/vlc/2.2.2-r0/pseudo/pseud=
o.log indicates 6 errors [qa_pseudo]</div><div>xcb-util-wm-0.4.1: This /wor=
k/i586-oe-linux/xcb-util-wm/0.4.1-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]</div><div>xdebug-2.5.1: This /work/core2-64-oe-linux/xdebug/2.5=
.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</div><div>xfce4-clo=
sebutton-plugin-0.1.0+gitrAUTOINC+02b74f13ad: This /work/i586-oe-linux/xfce=
4-closebutton-plugin/0.1.0+gitrAUTOINC+02b74f13ad-r0/pseudo/pseudo.log indi=
cates 7 errors [qa_pseudo]</div><div>xfce4-mixer-4.11.0: This /work/armv5te=
-oe-linux-gnueabi/xfce4-mixer/4.11.0-r0/pseudo/pseudo.log indicates 12 erro=
rs [qa_pseudo]</div><div>xfce4-power-manager-1.6.0: This /work/i586-oe-linu=
x/xfce4-power-manager/1.6.0-r0/pseudo/pseudo.log indicates 12 errors [qa_ps=
eudo]</div><div>xfce4-verve-plugin-1.1.0: This /work/i586-oe-linux/xfce4-ve=
rve-plugin/1.1.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]</div><=
div>xfwm4-themes-4.10.0: This /work/i586-oe-linux/xfwm4-themes/4.10.0-r0/ps=
eudo/pseudo.log indicates 6 errors [qa_pseudo]</div><div>xserver-xorg-1.19.=
3: This /work/i586-oe-linux/xserver-xorg/2_1.19.3-r0/pseudo/pseudo.log indi=
cates 10 errors [qa_pseudo]</div><div>xstdcmap-1.0.3: This /work/armv5te-oe=
-linux-gnueabi/xstdcmap/1.0.3-r0/pseudo/pseudo.log indicates 6 errors [qa_p=
seudo]</div><div><br></div><div><br></div><div><br></div><div>This git log =
matches with the metadata as seen by qemuarm build.</div><div>In some cases=
 qemux86 and qemux86-64 builds are built with slightly</div><div>different =
metadata, you can see the exact version near the top of each</div><div>log.=
world.qemu* files linked from the report</div><div><br></div><div>=3D=3D Te=
sted changes (not included in master yet) - bitbake =3D=3D</div><div>latest=
 upstream commit:=C2=A0</div><div>14c1748 bitbake: lib/bb/utils: fix movefi=
le() copy to dir fallback</div><div>not included in master yet:=C2=A0</div>=
<div>e5de648 world-image: add extra target</div><div>48b5cd7 fetch2: Allow =
Fetch.download() to warn instead of error</div><div><br></div><div>=3D=3D T=
ested changes (not included in master yet) - openembedded-core =3D=3D</div>=
<div>latest upstream commit:=C2=A0</div><div>abf2e95 systemd-serialtty: all=
ow empty package</div><div>not included in master yet:=C2=A0</div><div>3ee7=
5d8 report-error: Allow to upload reports automatically</div><div>879ed00 b=
uildhistory.bbclass: metadata-revs show repo parent</div><div>cccf080 metad=
ata-revs: provide more information</div><div>fc75188 qemux86: Add identical=
 qemux86copy variant for tests</div><div>7d0c173 reproducible_build.bbclass=
: initial support for binary reproducibility</div><div>f3f1527 cpio: provid=
e cpio-replacement-native</div><div>8a4bd30 image_types.bbclass: improve cp=
io image reproducibility</div><div>b8da834 rootfs-postcommands.bbclass: sup=
port binary reproducibility</div><div>f1abdd3 sstate.bbclass: Do not cause =
build failures due to setscene errors</div><div>a75ad95 insane.bbclass: Add=
 do_qa_pseudo function to check for common errors listed in pseudo.log</div=
><div>d10a3e5 libsdl2: allow to build native and nativesdk</div><div>b57559=
a libdrm: allow to build native and nativesdk</div><div>6cd394d nativesdk-m=
esa,mesa-native: add new recipe to build small part of mesa</div><div>8aca5=
d0 libepoxy: add support for native(sdk)</div><div>6e123ee libjpeg-turbo: p=
rovide nativesdk version</div><div>98ac18f virglrenderer: add new recipe</d=
iv><div>c03be15 virglrenderer: fix target build</div><div>5f10f7b qemu: add=
 PACKAGECONFIG for virtglrenderer, sdl2 and spice</div><div>3e0be80 insane.=
bbclass: use package_qa_handle_error for do_qa_pseudo</div><div><br></div><=
div>=3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D</div><div>latest upstream commit:=C2=A0</div><div>f841648 openwsman:=
 Fix build with musl</div><div>not included in master yet:=C2=A0</div><div>=
eaea788 dnsmasq: disable the service by default</div><div>e57aa88 openconne=
ct: fix parallel compilation failure</div><div>058d717 squid: upgrade to 3.=
5.27</div><div>547728b iproute2: Move tipc enablement to oe-core</div><div>=
9ee1828 libmnl: Move to oe-core</div><div>940e9f7 drbd-utils: remove 0001-d=
rbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch</div><div>2b2d118=
 celt051: import from meta-cloud-services</div><div>66ffc15 celt051: make o=
gg support optional</div><div>a760ec9 spice: import from meta-cloud-service=
s</div><div>8a6bf8b spice: fix dependency on python-pyparsing, add support =
for native(sdk)</div><div>8f58070 spice: fix build with FORTIFY_SOURCES alr=
eady defined in native gcc</div><div>d607125 spice: upgrade to 0.13.90 vers=
ion</div><div>d9bfb22 mongodb: Fix build on aarch64</div><div>fad0b64 level=
db: Fix parallel build</div><div>2d0cad4 mongodb: Pass computed endian vari=
able</div><div>dcf2f54 yp-tools: Ignore cpp warnings as errors</div><div>85=
1fbe5 openl2tp: Fix build with musl/libtirpc</div><div>9c618e4 network-mana=
ger-applet: Disable gobject-introspection on musl</div><div>39c648c toybox:=
 Upgrade to 0.7.4</div><div>4f5c368 nbench-byte: Update SRC_URI to <a href=
=3D"http://fossies.org">fossies.org</a></div><div>887082d breakpad: Fix bui=
ld with musl/mips</div><div>29e2608 Add python3 matplotlib</div><div>dbffef=
c Add python3 cycler</div><div>67186da Add python3 pandas</div><div>06b5aea=
 rcmd: Fix build with musl</div><div>536d82b Revert &quot;python-m2crypto: =
Upgrade to 0.26.0&quot;</div><div><br></div><div>=3D=3D Tested changes (not=
 included in master yet) - meta-qt5 =3D=3D</div><div>latest upstream commit=
:=C2=A0</div><div>f00f79b qtxmlpatterns: Add HOMEPAGE info into recipe file=
.</div><div>not included in master yet:=C2=A0</div><div>2e6fb62 qt5: add mi=
ssing commercial license</div><div><br></div><div>=3D=3D Tested changes (no=
t included in master yet) - meta-browser =3D=3D</div><div>latest upstream c=
ommit:=C2=A0</div><div>678706c chromium: hide textrel QA issues which are t=
here for ages</div><div>not included in master yet:=C2=A0</div><div>777a7cd=
 firefox: fix build failures</div></div>

--f403045d58983fc7f6055a8cc5a6--
