Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1D060938;
	Fri, 13 Oct 2017 02:15:46 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id k4so17854447wmc.1;
	Thu, 12 Oct 2017 19:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=BQjD7OYHxN0nRqumDneqSaU43adsBAn23jPi4jX66k4=;
	b=jtTtdN2PdPOj64wiHzbN2wN9X9QCfKFEZ08lxuEv+J9oieV2FI3mXJgjUOWPR1cJl7
	bX4MrAB/xnHKcBoZpkrB3s1AbcQQ9KVRDP63UholBlYB1pyer7ZZ1e7JqlTK+92ghwpx
	zLOCXw+SfrE8vkMIST8rQHD89ssBahqojRESLDYBuxXqLtv706UcTH2umfs9o+NUaXYD
	7SReYg384cu7V014+KECLus4snjR/PgIKXst4+Aa+EnNIXxpB5FSY1fA/q+vSCvdsPCl
	r+uNlSuKog2rKD0QeSt1/Bc99mGX176gYPvqLbuEfPigUyksl1Wb1xZbrhnUzndO80H4
	r6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=BQjD7OYHxN0nRqumDneqSaU43adsBAn23jPi4jX66k4=;
	b=heFZcFT+kksJxMqvRJaw+ZzSHDqQj+K9sSJTO7Fr+3XWBqkSrA4a9/TrWabV3TsvL+
	+vlleKcFgOQ58EdlQqU/BBZ0lz5KpuEn825A8gAGJ5Hbm5b/tgbjk7TxtoTCht2jAwVR
	56cOFLQIxty4i0PsJvBw4EEHfK2APdbLzFNz0uT0wVQEHUy8ZSY1sGZRX00g5terpbFk
	Ojy5tZk//dUIPGrD0YoaMLn+khMQ/jje4N/I47Q9ImGaeFk0fxnRhRTudCAbmo9IYdt6
	7ckzyF/IYWd65jjipXkg0y4NIONDgjbpIVtD/nY4/var6xAsDiHlMQXIHg99IEC478wB
	dLzg==
X-Gm-Message-State: AMCzsaVXDcyy63P0CuxldUxQynxpTg6Ajx2IqBkuq4ipNOkoeCKYkacB
	rvWDaqaex6G6tVfvbfdybOs2FIZgo2wbV2sXtb2nSw==
X-Google-Smtp-Source: AOwi7QByDSNsi19K0MldnKhQNGNHbv4BIH0eOCHIrSBbU1w7CvNp5g8zPxncWwjD3Cq3yM3bv8pT484yCfLTuaWNwf0=
X-Received: by 10.223.143.56 with SMTP id p53mr3379406wrb.179.1507860946728;
	Thu, 12 Oct 2017 19:15:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Thu, 12 Oct 2017 19:15:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Oct 2017 04:15:46 +0200
Message-ID: <CA+chaQcta5VggF9_Js36JHYGeOTCSYTzQAMxUofyBZwF07Y6KQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-10-10
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
X-List-Received-Date: Fri, 13 Oct 2017 02:15:48 -0000
Content-Type: multipart/alternative; boundary="f403045d589819bdaa055b643c9f"

--f403045d589819bdaa055b643c9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!|Signatures	=09
!!colspan=3D'15'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-=
going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-c=
onfigure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflag=
s	||compile-host-path	||qa_pseudo	||
|-

||2017-10-10	||7	||8	||3	||0	||0		||0		||3		||0		||0		||0		||5		||0		||0		|=
|0		||0		||0		||0		||0		||366		||
|}

=3D=3D Failed tasks 2017-10-10 =3D=3D

INFO: jenkins-job.sh-1.8.34 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171012_16=
1223.log

=3D=3D=3D common (1) =3D=3D=3D
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_pac=
kage_qa

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (6) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb:do_=
compile
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_compile_ptest_base
    * meta-qt5/recipes-qt/qt5/qtquick1_git.bb:do_compile_ptest_base
    * meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_compile_ptest_base

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/spice/spice_git.bb:=
do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package=
_qa

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb:do_package_qa

=3D=3D=3D Number of failed tasks (18) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 7	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.2017=
1010_225937.log/
|| http://errors.yoctoproject.org/Errors/Build/47456/
|-
|| qemux86 	|| 8	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.2017=
1011_084917.log/
|| http://errors.yoctoproject.org/Errors/Build/47459/
|-
|| qemux86_64 	|| 3	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.2=
0171010_012728.log/
|| http://errors.yoctoproject.org/Errors/Build/47451/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (374) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue

|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||366	||qa_pseudo
|-
||3	||textrel
|-
||5	||host-user-contaminated
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20171009_201722.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools]
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-qt5:
PNBLACKLIST[android-system] =3D "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be
tested so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be
tested so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads
directory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 3	issue: textrel
corosync-2.4.2: ELF binary
'/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin=
/corosync'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x26=
4-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x26=
4/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps



count: 0	issue: version-going-backwards


count: 5	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-aa-er+saaho/usr/lib/locale/aa_ER@saaho/LC_PAPER
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ar-dz/usr/lib/locale/ar_DZ/LC_PAPER is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ar-kw.iso-8859-6/usr/lib/locale/ar_KW.ISO-8859-6/L=
C_PAPER
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-sq-al.iso-8859-1/usr/lib/locale/sq_AL.ISO-8859-1/L=
C_MEASUREMENT
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtwayland-5.9.2+gitAUTOINC+7f70da6a64: qtwayland:
/qtwayland-dev/usr/lib/cmake/Qt5WaylandClient/Qt5WaylandClient_QWaylandIviS=
hellIntegrationPlugin.cmake
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 366	issue: qa_pseudo
acl-2.2.52: This
/work/armv5te-oe-linux-gnueabi/acl/2.2.52-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
acl-2.2.52: This
/work/core2-64-oe-linux/acl/2.2.52-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
acl-2.2.52: This /work/i586-oe-linux/acl/2.2.52-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
alsa-oss-1.0.17: This
/work/core2-64-oe-linux/alsa-oss/1.0.17-r1/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
apache2-2.4.27: This
/work/armv5te-oe-linux-gnueabi/apache2/2.4.27-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
apache2-2.4.27: This
/work/core2-64-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.log indicates
5 errors [qa_pseudo]
apache2-2.4.27: This
/work/i586-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
apmd-3.2.2-15: This
/work/i586-oe-linux/apmd/3.2.2-15-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
aspell-0.60.6.1: This
/work/armv5e-oe-linux-gnueabi/aspell/0.60.6.1-r1/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
attr-2.4.47: This
/work/armv5te-oe-linux-gnueabi/attr/2.4.47-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
autofs-5.1.2: This
/work/armv5te-oe-linux-gnueabi/autofs/5.1.2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
avahi-ui-0.6.32: This
/work/i586-oe-linux/avahi-ui/0.6.32-r0/pseudo/pseudo.log indicates 18
errors [qa_pseudo]
base-passwd-3.5.29: This
/work/armv5te-oe-linux-gnueabi/base-passwd/3.5.29-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
binutils-2.29: This
/work/core2-64-oe-linux/binutils/2.29-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
blktrace-1.1.0+gitAUTOINC+43fc870ce0: This
/work/armv5te-oe-linux-gnueabi/blktrace/1.1.0+gitAUTOINC+43fc870ce0-r0/pseu=
do/pseudo.log
indicates 10 errors [qa_pseudo]
bluez5-5.46: This
/work/core2-64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
bluez5-5.46: This /work/i586-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
bmap-tools-3.4: This
/work/armv5te-oe-linux-gnueabi/bmap-tools/3.4-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
bootchart2-0.14.8: This
/work/i586-oe-linux/bootchart2/0.14.8-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
busybox-1.24.1: This
/work/i586-oe-linux/busybox/1.24.1-r0/pseudo/pseudo.log indicates 8
errors [qa_pseudo]
can-utils-0.0+gitrAUTOINC+4c8fb05cb4: This
/work/armv5te-oe-linux-gnueabi/can-utils/0.0+gitrAUTOINC+4c8fb05cb4-r0/pseu=
do/pseudo.log
indicates 10 errors [qa_pseudo]
cdparanoia-10.2: This
/work/armv5te-oe-linux-gnueabi/cdparanoia/10.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
chrony-2.4: This
/work/armv5te-oe-linux-gnueabi/chrony/2.4-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
chrony-2.4: This
/work/core2-64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
ckermit-302: This /work/i586-oe-linux/ckermit/302-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
connman-1.34: This
/work/armv5te-oe-linux-gnueabi/connman/1.34-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
conntrack-tools-1.4.4: This
/work/armv5te-oe-linux-gnueabi/conntrack-tools/1.4.4-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
conntrack-tools-1.4.4: This
/work/core2-64-oe-linux/conntrack-tools/1.4.4-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
corosync-2.4.2: This
/work/armv5te-oe-linux-gnueabi/corosync/2.4.2-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
corosync-2.4.2: This
/work/core2-64-oe-linux/corosync/2.4.2-r0/pseudo/pseudo.log indicates
16 errors [qa_pseudo]
cups-2.2.4: This
/work/armv5te-oe-linux-gnueabi/cups/2.2.4-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
curlpp-0.8.1: This
/work/i586-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
daemontools-0.76: This
/work/i586-oe-linux/daemontools/0.76-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
dfu-util-0.9: This
/work/armv5te-oe-linux-gnueabi/dfu-util/0.9-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This
/work/armv5te-oe-linux-gnueabi/dhcp/4.3.6-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This
/work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
dhcp-4.3.6: This /work/i586-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
docbook-xml-dtd4-4.5: This
/work/all-oe-linux/docbook-xml-dtd4/4.5-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
dovecot-2.2.29: This
/work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
dovecot-2.2.29: This
/work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates
11 errors [qa_pseudo]
dovecot-2.2.29: This
/work/i586-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 14
errors [qa_pseudo]
ebtables-2.0.10-4: This
/work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-r4/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This
/work/core2-64-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This
/work/i586-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
eglinfo-fb-1.0.0: This
/work/i586-oe-linux/eglinfo-fb/1.0.0-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
espeak-1.48.04: This
/work/core2-64-oe-linux/espeak/1.48.04-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
evtest-1.33+AUTOINC+ab140a2dab: This
/work/i586-oe-linux/evtest/1.33+AUTOINC+ab140a2dab-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
expat-2.2.3: This
/work/armv5te-oe-linux-gnueabi/expat/2.2.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
f2fs-tools-1.8.0: This
/work/armv5te-oe-linux-gnueabi/f2fs-tools/1.8.0-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
firefox-l10n-ff-45.9.0esr: This
/work/all-oe-linux/firefox-l10n-ff/45.9.0esr-r3/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
flac-1.3.2: This /work/i586-oe-linux/flac/1.3.2-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
flatbuffers-1.7.1: This
/work/i586-oe-linux/flatbuffers/1.7.1-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
fuse-2.9.7: This /work/i586-oe-linux/fuse/2.9.7-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This
/work/armv5te-oe-linux-gnueabi/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/=
pseudo.log
indicates 4 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This
/work/i586-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
gawk-4.1.4: This
/work/armv5te-oe-linux-gnueabi/gawk/4.1.4-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
gawk-4.1.4: This /work/i586-oe-linux/gawk/4.1.4-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
gd-2.2.4: This /work/core2-64-oe-linux/gd/2.2.4-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
gdb-8.0: This /work/armv5te-oe-linux-gnueabi/gdb/8.0-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
giflib-5.1.4: This
/work/armv5te-oe-linux-gnueabi/giflib/5.1.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
git-2.13.3: This
/work/core2-64-oe-linux/git/2.13.3-r0/pseudo/pseudo.log indicates 8
errors [qa_pseudo]
glade-3.20.0: This
/work/i586-oe-linux/glade/3.20.0-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
glib-2.0-2.52.3: This
/work/i586-oe-linux/glib-2.0/1_2.52.3-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
glibc-2.26: This
/work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pseudo.log
indicates 23 errors [qa_pseudo]
glibc-2.26: This
/work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
glibc-2.26: This /work/i586-oe-linux/glibc/2.26-r0/pseudo/pseudo.log
indicates 563 errors [qa_pseudo]
glibc-locale-2.26: This
/work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
glibc-locale-2.26: This
/work/core2-64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
glibc-locale-2.26: This
/work/i586-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
glib-networking-2.50.0: This
/work/i586-oe-linux/glib-networking/2.50.0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
gnupg-2.2.0: This
/work/armv5te-oe-linux-gnueabi/gnupg/2.2.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
go-1.9: This /work/armv5e-oe-linux-gnueabi/go/1.9-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/core2-64-oe-linux/gobject-introspection/1.52.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/i586-oe-linux/gobject-introspection/1.52.1-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
gptfdisk-1.0.3: This
/work/armv5te-oe-linux-gnueabi/gptfdisk/1.0.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
gtkmm-2.24.5: This
/work/armv5te-oe-linux-gnueabi/gtkmm/2.24.5-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
hplip-3.12.6: This
/work/core2-64-oe-linux/hplip/3.12.6-r1/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
icon-slicer-0.3: This
/work/i586-oe-linux/icon-slicer/0.3-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
icu-59.1: This /work/armv5e-oe-linux-gnueabi/icu/59.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
icu-59.1: This /work/core2-64-oe-linux/icu/59.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
icu-59.1: This /work/i586-oe-linux/icu/59.1-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
inetutils-1.9.4: This
/work/armv5te-oe-linux-gnueabi/inetutils/1.9.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
init-ifupdown-1.0: This
/work/qemux86-oe-linux/init-ifupdown/1.0-r7/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
iotop-0.6: This
/work/armv5te-oe-linux-gnueabi/iotop/0.6-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
iotop-0.6: This /work/i586-oe-linux/iotop/0.6-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
iperf3-3.2: This /work/i586-oe-linux/iperf3/3.2-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
ipsec-tools-0.8.2: This
/work/qemux86_64-oe-linux/ipsec-tools/0.8.2-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
iputils-s20151218: This
/work/i586-oe-linux/iputils/s20151218-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
iscsitarget-1.4.20.3+svn502: This
/work/qemux86_64-oe-linux/iscsitarget/1.4.20.3+svn502-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
jack-1.9.10+gitAUTOINC+2d1d323505: This
/work/i586-oe-linux/jack/1.9.10+gitAUTOINC+2d1d323505-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
kconfig-frontends-4.11.0.1: This
/work/armv5te-oe-linux-gnueabi/kconfig-frontends/4.11.0.1-r0/pseudo/pseudo.=
log
indicates 4 errors [qa_pseudo]
konkretcmpi-0.9.2: This
/work/core2-64-oe-linux/konkretcmpi/0.9.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This
/work/armv5te-oe-linux-gnueabi/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseud=
o/pseudo.log
indicates 4 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This
/work/core2-64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseud=
o.log
indicates 4 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This
/work/i586-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.lo=
g
indicates 6 errors [qa_pseudo]
less-487: This /work/armv5te-oe-linux-gnueabi/less/487-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libatasmart-0.19: This
/work/armv5te-oe-linux-gnueabi/libatasmart/0.19-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
libatasmart-0.19: This
/work/core2-64-oe-linux/libatasmart/0.19-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
libatomic-ops-7.6.0+gitAUTOINC+73c60c5ef1: This
/work/core2-64-oe-linux/libatomic-ops/7.6.0+gitAUTOINC+73c60c5ef1-r0/pseudo=
/pseudo.log
indicates 16 errors [qa_pseudo]
libbsd-0.8.6: This
/work/core2-64-oe-linux/libbsd/0.8.6-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
libcanberra-0.30: This
/work/i586-oe-linux/libcanberra/0.30-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
libconnman-qt5-1.1.10+gitAUTOINC+4d6def3053: This
/work/core2-64-oe-linux/libconnman-qt5/1.1.10+gitAUTOINC+4d6def3053-r0/pseu=
do/pseudo.log
indicates 6 errors [qa_pseudo]
libencode-perl-2.83: This
/work/armv5te-oe-linux-gnueabi/libencode-perl/2.83-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libfastjson-0.99.4: This
/work/core2-64-oe-linux/libfastjson/0.99.4-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libiec61883-1.2.0: This
/work/armv5te-oe-linux-gnueabi/libiec61883/1.2.0-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
libldb-1.1.29: This
/work/core2-64-oe-linux/libldb/1.1.29-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
libldb-1.1.29: This
/work/i586-oe-linux/libldb/1.1.29-r0/pseudo/pseudo.log indicates 13
errors [qa_pseudo]
libmms-0.6.4: This
/work/armv5te-oe-linux-gnueabi/libmms/0.6.4-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
libpciaccess-0.13.5: This
/work/core2-64-oe-linux/libpciaccess/0.13.5-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libqofono-0.87+gitrAUTOINC+54435de3be: This
/work/core2-64-oe-linux/libqofono/0.87+gitrAUTOINC+54435de3be-r0/pseudo/pse=
udo.log
indicates 6 errors [qa_pseudo]
librsvg-2.40.18: This
/work/i586-oe-linux/librsvg/2.40.18-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
libsombok3-2.4.0: This
/work/i586-oe-linux/libsombok3/2.4.0-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
libuser-0.62: This
/work/i586-oe-linux/libuser/0.62-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
libvncserver-0.9.11: This
/work/armv5te-oe-linux-gnueabi/libvncserver/0.9.11-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
libvncserver-0.9.11: This
/work/core2-64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
libvncserver-0.9.11: This
/work/i586-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
libwmf-0.2.8.4: This
/work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
libwmf-0.2.8.4: This
/work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
libwnck3-3.20.1: This
/work/core2-64-oe-linux/libwnck3/3.20.1-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
libxcursor-1.1.14: This
/work/core2-64-oe-linux/libxcursor/1_1.1.14-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libxml2-2.9.4: This
/work/armv5te-oe-linux-gnueabi/libxml2/2.9.4-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libxml2-2.9.4: This
/work/core2-64-oe-linux/libxml2/2.9.4-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
libxml2-2.9.4: This
/work/i586-oe-linux/libxml2/2.9.4-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
libxml-perl-0.08: This
/work/i586-oe-linux/libxml-perl/0.08-r3/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
linux-atm-2.5.2: This
/work/qemux86-oe-linux/linux-atm/2.5.2-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_16de014967: This
/work/qemux86_64-oe-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_16de014=
967-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_16de014967: This
/work/qemux86-oe-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_16de014967=
-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_67b62d8d7b: This
/work/qemuarm-oe-linux-gnueabi/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_67=
b62d8d7b-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
lirc-0.9.4d: This
/work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
lirc-0.9.4d: This
/work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
lirc-0.9.4d: This /work/i586-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
llvm-5.0: This /work/i586-oe-linux/llvm/5.0-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
lmbench-3.0-a9: This
/work/armv5te-oe-linux-gnueabi/lmbench/3.0-a9-r2/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
lockfile-progs-0.1.17: This
/work/armv5te-oe-linux-gnueabi/lockfile-progs/0.1.17-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
log4cpp-1.1.2: This
/work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This
/work/core2-64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
log4cpp-1.1.2: This
/work/i586-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
logrotate-3.12.3: This
/work/i586-oe-linux/logrotate/3.12.3-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
lowpan-tools-0.3.1+gitAUTOINC+38f42dbfce: This
/work/core2-64-oe-linux/lowpan-tools/0.3.1+gitAUTOINC+38f42dbfce-r0/pseudo/=
pseudo.log
indicates 4 errors [qa_pseudo]
lprng-3.8.C: This
/work/core2-64-oe-linux/lprng/3.8.C-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
lttng-tools-2.9.5: This
/work/i586-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
lvm2-2.02.171: This
/work/armv5te-oe-linux-gnueabi/lvm2/2.02.171-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
lvm2-2.02.171: This
/work/core2-64-oe-linux/lvm2/2.02.171-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r=
0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
mariadb-5.5.57: This
/work/armv5e-oe-linux-gnueabi/mariadb/5.5.57-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
matchbox-keyboard-0.1.1: This
/work/core2-64-oe-linux/matchbox-keyboard/0.1.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mc-4.8.19: This
/work/armv5te-oe-linux-gnueabi/mc/4.8.19-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
meson-0.40.1: This
/work/armv5te-oe-linux-gnueabi/meson/0.40.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
meson-0.40.1: This
/work/core2-64-oe-linux/meson/0.40.1-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
minicoredumper-2.0.0: This
/work/i586-oe-linux/minicoredumper/2.0.0-r0+gitAUTOINC+cdc1faf121/pseudo/ps=
eudo.log
indicates 12 errors [qa_pseudo]
mongodb-3.4.6+gitAUTOINC+c55eb86ef4: This
/work/i586-oe-linux/mongodb/3.4.6+gitAUTOINC+c55eb86ef4-r0/pseudo/pseudo.lo=
g
indicates 12 errors [qa_pseudo]
mosquitto-1.4.14: This
/work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This
/work/core2-64-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This
/work/i586-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
mozilla-devscripts-0.30: This
/work/armv5te-oe-linux-gnueabi/mozilla-devscripts/0.30-r1/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mozilla-devscripts-0.30: This
/work/core2-64-oe-linux/mozilla-devscripts/0.30-r1/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mpich-3.2: This
/work/armv5te-oe-linux-gnueabi/mpich/3.2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mpich-3.2: This /work/core2-64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mpich-3.2: This /work/i586-oe-linux/mpich/3.2-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
multipath-tools-0.7.1: This
/work/armv5e-oe-linux-gnueabi/multipath-tools/0.7.1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
nana-2.5: This /work/core2-64-oe-linux/nana/2.5-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
netcat-0.7.1: This
/work/armv5te-oe-linux-gnueabi/netcat/0.7.1-r3/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates
5 errors [qa_pseudo]
nginx-1.12.1: This
/work/armv5te-oe-linux-gnueabi/nginx/1.12.1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
nginx-1.12.1: This
/work/core2-64-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
nginx-1.12.1: This
/work/i586-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
nss-3.31.1: This
/work/armv5te-oe-linux-gnueabi/nss/3.31.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
ntp-4.2.8p10: This
/work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
ntp-4.2.8p10: This
/work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
ntp-4.2.8p10: This
/work/i586-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
onboard-1.4.1: This
/work/core2-64-oe-linux/onboard/1.4.1-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
onig-5.9.6: This
/work/armv5te-oe-linux-gnueabi/onig/5.9.6-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
openipmi-2.0.24: This
/work/core2-64-oe-linux/openipmi/2.0.24-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
opensaf-5.17.07: This
/work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pseudo/pseudo.log
indicates 15 errors [qa_pseudo]
opensaf-5.17.07: This
/work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates
16 errors [qa_pseudo]
opensaf-5.17.07: This
/work/i586-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 17
errors [qa_pseudo]
openssh-7.5p1: This
/work/armv5te-oe-linux-gnueabi/openssh/7.5p1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
openssh-7.5p1: This
/work/core2-64-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.log indicates
17 errors [qa_pseudo]
openssh-7.5p1: This
/work/i586-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
opus-tools-0.1.8: This
/work/i586-oe-linux/opus-tools/0.1.8-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
ossp-uuid-1.6.2: This
/work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
ossp-uuid-1.6.2: This
/work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates
5 errors [qa_pseudo]
ossp-uuid-1.6.2: This
/work/i586-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 14
errors [qa_pseudo]
packagegroup-core-x11-xserver-1.0: This
/work/qemux86_64-oe-linux/packagegroup-core-x11-xserver/1.0-r40/pseudo/pseu=
do.log
indicates 10 errors [qa_pseudo]
pango-1.40.6: This
/work/core2-64-oe-linux/pango/1.40.6-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
perf-1.0: This /work/qemuarm-oe-linux-gnueabi/perf/1.0-r9/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
perl-5.24.1: This
/work/armv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
perl-5.24.1: This
/work/core2-64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
perl-5.24.1: This /work/i586-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
php-7.1.9: This
/work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux/php/7.1.9-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
phpmyadmin-4.7.3: This
/work/all-oe-linux/phpmyadmin/4.7.3-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
pm-qa-0.5.2: This
/work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/pseudo.log
indicates 35 errors [qa_pseudo]
pm-qa-0.5.2: This
/work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 42
errors [qa_pseudo]
pm-qa-0.5.2: This /work/i586-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log
indicates 43 errors [qa_pseudo]
portaudio-v19-v190600: This
/work/armv5te-oe-linux-gnueabi/portaudio-v19/v190600-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
portaudio-v19-v190600: This
/work/core2-64-oe-linux/portaudio-v19/v190600-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
postfix-3.2.2: This
/work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
postfix-3.2.2: This
/work/i586-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
postgresql-9.4.13: This
/work/armv5e-oe-linux-gnueabi/postgresql/9.4.13-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
postgresql-9.4.13: This
/work/core2-64-oe-linux/postgresql/9.4.13-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
postgresql-9.4.13: This
/work/i586-oe-linux/postgresql/9.4.13-r0/pseudo/pseudo.log indicates
14 errors [qa_pseudo]
procps-3.3.12: This
/work/i586-oe-linux/procps/3.3.12-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
proftpd-1.3.6: This
/work/core2-64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
proftpd-1.3.6: This
/work/i586-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 14
errors [qa_pseudo]
puzzles-0.0+gitAUTOINC+8dfe5cec31: This
/work/i586-oe-linux/puzzles/1_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.lo=
g
indicates 12 errors [qa_pseudo]
python-2.7.13: This
/work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
python-2.7.13: This
/work/i586-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
python3-3.5.3: This
/work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
python3-3.5.3: This
/work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates
5 errors [qa_pseudo]
python3-3.5.3: This
/work/i586-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
python3-babel-2.5.1: This
/work/armv5te-oe-linux-gnueabi/python3-babel/2.5.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-chardet-3.0.4: This
/work/i586-oe-linux/python3-chardet/3.0.4-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python3-coverage-4.4.1: This
/work/armv5te-oe-linux-gnueabi/python3-coverage/4.4.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
python3-coverage-4.4.1: This
/work/core2-64-oe-linux/python3-coverage/4.4.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-cryptography-2.0.3: This
/work/core2-64-oe-linux/python3-cryptography/2.0.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
python3-cython-0.27.1: This
/work/core2-64-oe-linux/python3-cython/0.27.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-docutils-0.14: This
/work/armv5te-oe-linux-gnueabi/python3-docutils/0.14-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-isort-4.2.15: This
/work/armv5te-oe-linux-gnueabi/python3-isort/4.2.15-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-ndg-httpsclient-0.4.3: This
/work/armv5te-oe-linux-gnueabi/python3-ndg-httpsclient/0.4.3-r0/pseudo/pseu=
do.log
indicates 4 errors [qa_pseudo]
python3-nose-1.3.7: This
/work/i586-oe-linux/python3-nose/1.3.7-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
python3-ntplib-0.3.3: This
/work/i586-oe-linux/python3-ntplib/0.3.3-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
python3-pandas-0.20.3: This
/work/core2-64-oe-linux/python3-pandas/0.20.3-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pip-9.0.1: This
/work/core2-64-oe-linux/python3-pip/9.0.1-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
python3-pykickstart-2.35: This
/work/armv5te-oe-linux-gnueabi/python3-pykickstart/2.35-r0/pseudo/pseudo.lo=
g
indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This
/work/armv5te-oe-linux-gnueabi/python3-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This
/work/core2-64-oe-linux/python3-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This
/work/i586-oe-linux/python3-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python3-serpent-1.23: This
/work/i586-oe-linux/python3-serpent/1.23-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
python3-simplejson-3.11.1: This
/work/armv5te-oe-linux-gnueabi/python3-simplejson/3.11.1-r0/pseudo/pseudo.l=
og
indicates 10 errors [qa_pseudo]
python3-xlrd-1.1.0: This
/work/core2-64-oe-linux/python3-xlrd/1.1.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-asn1crypto-0.23.0: This
/work/i586-oe-linux/python-asn1crypto/0.23.0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
python-cpuset-1.5.7: This
/work/armv5te-oe-linux-gnueabi/python-cpuset/1.5.7-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-cson-git: This
/work/i586-oe-linux/python-cson/git-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
python-django-1.11.5: This
/work/i586-oe-linux/python-django/1.11.5-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
python-epydoc-3.0.1: This
/work/armv5te-oe-linux-gnueabi/python-epydoc/3.0.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
python-gevent-1.2.2: This
/work/core2-64-oe-linux/python-gevent/1.2.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
python-imaging-1.1.7: This
/work/armv5te-oe-linux-gnueabi/python-imaging/1.1.7-r5/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
python-jsonpatch-1.16: This
/work/core2-64-oe-linux/python-jsonpatch/1.16-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-jsonpatch-1.16: This
/work/i586-oe-linux/python-jsonpatch/1.16-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-netaddr-0.7.19: This
/work/core2-64-oe-linux/python-netaddr/0.7.19-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-nose-1.3.7: This
/work/i586-oe-linux/python-nose/1.3.7-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
python-numeric-24.2: This
/work/armv5te-oe-linux-gnueabi/python-numeric/24.2-ml3/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pandas-0.20.3: This
/work/i586-oe-linux/python-pandas/0.20.3-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-pylint-1.7.4: This
/work/armv5te-oe-linux-gnueabi/python-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This
/work/core2-64-oe-linux/python-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This
/work/i586-oe-linux/python-pylint/1.7.4-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
python-pyro4-4.62: This
/work/armv5te-oe-linux-gnueabi/python-pyro4/4.62-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
python-pyro4-4.62: This
/work/core2-64-oe-linux/python-pyro4/4.62-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pyserial-3.4: This
/work/armv5te-oe-linux-gnueabi/python-pyserial/3.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pytest-3.2.2: This
/work/armv5te-oe-linux-gnueabi/python-pytest/3.2.2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pytest-3.2.2: This
/work/i586-oe-linux/python-pytest/3.2.2-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
python-scons-2.5.1: This
/work/armv5te-oe-linux-gnueabi/python-scons/2.5.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-scons-2.5.1: This
/work/core2-64-oe-linux/python-scons/2.5.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-setuptools-36.2.7: This
/work/core2-64-oe-linux/python-setuptools/36.2.7-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-snakefood-1.4: This
/work/i586-oe-linux/python-snakefood/1.4-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-snimpy-0.8.11: This
/work/i586-oe-linux/python-snimpy/0.8.11-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-twisted-17.9.0: This
/work/armv5te-oe-linux-gnueabi/python-twisted/17.9.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-twisted-17.9.0: This
/work/i586-oe-linux/python-twisted/17.9.0-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
python-urllib3-1.22: This
/work/armv5te-oe-linux-gnueabi/python-urllib3/1.22-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-vobject-0.9.5: This
/work/armv5te-oe-linux-gnueabi/python-vobject/0.9.5-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-xlrd-1.1.0: This
/work/core2-64-oe-linux/python-xlrd/1.1.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-yappi-0.98: This
/work/armv5te-oe-linux-gnueabi/python-yappi/0.98-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
pywbem-0.8.0: This
/work/armv5te-oe-linux-gnueabi/pywbem/0.8.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
qemu-2.10.0: This
/work/core2-64-oe-linux/qemu/2.10.0-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+9d8c9ada16: This
/work/core2-64-oe-linux/qt3d/5.9.2+gitAUTOINC+9d8c9ada16-r0/pseudo/pseudo.l=
og
indicates 5 errors [qa_pseudo]
qt5-plugin-generic-vboxtouch-1.1.3+gitrAUTOINC+d613ad1cc6: This
/work/i586-oe-linux/qt5-plugin-generic-vboxtouch/1.1.3+gitrAUTOINC+d613ad1c=
c6-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+73573fce29: This
/work/armv5te-oe-linux-gnueabi/qtbase/5.9.2+gitAUTOINC+73573fce29-r0/pseudo=
/pseudo.log
indicates 709 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+73573fce29: This
/work/core2-64-oe-linux/qtbase/5.9.2+gitAUTOINC+73573fce29-r0/pseudo/pseudo=
.log
indicates 5 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+73573fce29: This
/work/i586-oe-linux/qtbase/5.9.2+gitAUTOINC+73573fce29-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+1f47b1a7ae: This
/work/core2-64-oe-linux/qtcharts/5.9.2+gitAUTOINC+1f47b1a7ae-r0/pseudo/pseu=
do.log
indicates 5 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+94cc2b914a: This
/work/core2-64-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+94cc2b914a-r0/pseud=
o/pseudo.log
indicates 5 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+3f8ae713df: This
/work/core2-64-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+3f8ae713df-r0/pseudo/p=
seudo.log
indicates 5 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: This
/work/core2-64-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+7c45b035b9-r0/pseudo=
/pseudo.log
indicates 14 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+0555cf73c8: This
/work/core2-64-oe-linux/qtenginio/5.9.2+gitAUTOINC+0555cf73c8-r0/pseudo/pse=
udo.log
indicates 5 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+1fc40deed6: This
/work/core2-64-oe-linux/qtgamepad/5.9.2+gitAUTOINC+1fc40deed6-r0/pseudo/pse=
udo.log
indicates 5 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+c832af7897_9ecbe3642f: This
/work/core2-64-oe-linux/qtlocation/5.9.2+gitAUTOINC+c832af7897_9ecbe3642f-r=
0/pseudo/pseudo.log
indicates 79 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+343e281f0e: This
/work/core2-64-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+343e281f0e-r0/pseudo/=
pseudo.log
indicates 6 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365: This
/work/armv5te-oe-linux-gnueabi/qtnetworkauth/5.9.2+gitAUTOINC+3d93f64365-r0=
/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365: This
/work/core2-64-oe-linux/qtnetworkauth/5.9.2+gitAUTOINC+3d93f64365-r0/pseudo=
/pseudo.log
indicates 4 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365: This
/work/i586-oe-linux/qtnetworkauth/5.9.2+gitAUTOINC+3d93f64365-r0/pseudo/pse=
udo.log
indicates 7 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/core2-64-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseu=
do.log
indicates 11 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+63f2f55462: This
/work/core2-64-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+63f2f55462-r0/pse=
udo/pseudo.log
indicates 5 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/core2-64-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseu=
do/pseudo.log
indicates 12 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+86ee61734e: This
/work/armv5e-oe-linux-gnueabi/qtscript/5.9.2+gitAUTOINC+86ee61734e-r0/pseud=
o/pseudo.log
indicates 4 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+86ee61734e: This
/work/core2-64-oe-linux/qtscript/5.9.2+gitAUTOINC+86ee61734e-r0/pseudo/pseu=
do.log
indicates 5 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+86ee61734e: This
/work/i586-oe-linux/qtscript/5.9.2+gitAUTOINC+86ee61734e-r0/pseudo/pseudo.l=
og
indicates 9 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+a1dff1a11a: This
/work/core2-64-oe-linux/qtscxml/5.9.2+gitAUTOINC+a1dff1a11a-r0/pseudo/pseud=
o.log
indicates 5 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+1673dbed00: This
/work/core2-64-oe-linux/qtsensors/5.9.2+gitAUTOINC+1673dbed00-r0/pseudo/pse=
udo.log
indicates 5 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+1d37c357c8: This
/work/armv5te-oe-linux-gnueabi/qtserialbus/5.9.2+gitAUTOINC+1d37c357c8-r0/p=
seudo/pseudo.log
indicates 4 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+1d37c357c8: This
/work/core2-64-oe-linux/qtserialbus/5.9.2+gitAUTOINC+1d37c357c8-r0/pseudo/p=
seudo.log
indicates 5 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+1d37c357c8: This
/work/i586-oe-linux/qtserialbus/5.9.2+gitAUTOINC+1d37c357c8-r0/pseudo/pseud=
o.log
indicates 8 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+93b539140c: This
/work/armv5te-oe-linux-gnueabi/qtserialport/5.9.2+gitAUTOINC+93b539140c-r0/=
pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+93b539140c: This
/work/core2-64-oe-linux/qtserialport/5.9.2+gitAUTOINC+93b539140c-r0/pseudo/=
pseudo.log
indicates 5 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+93b539140c: This
/work/i586-oe-linux/qtserialport/5.9.2+gitAUTOINC+93b539140c-r0/pseudo/pseu=
do.log
indicates 7 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+0fcd016066: This
/work/armv5te-oe-linux-gnueabi/qtsvg/5.9.2+gitAUTOINC+0fcd016066-r0/pseudo/=
pseudo.log
indicates 7 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+0fcd016066: This
/work/core2-64-oe-linux/qtsvg/5.9.2+gitAUTOINC+0fcd016066-r0/pseudo/pseudo.=
log
indicates 5 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+0fcd016066: This
/work/i586-oe-linux/qtsvg/5.9.2+gitAUTOINC+0fcd016066-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+f364358a81: This
/work/core2-64-oe-linux/qtsystems/5.9.2+gitAUTOINC+f364358a81-r0/pseudo/pse=
udo.log
indicates 6 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+fdc5749b56: This
/work/core2-64-oe-linux/qttools/5.9.2+gitAUTOINC+fdc5749b56-r0/pseudo/pseud=
o.log
indicates 5 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+7f70da6a64: This
/work/core2-64-oe-linux/qtwayland/5.9.2+gitAUTOINC+7f70da6a64-r0/pseudo/pse=
udo.log
indicates 5 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+b5229df6a0: This
/work/core2-64-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+b5229df6a0-r0/pseudo/=
pseudo.log
indicates 5 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54: This
/work/core2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54-=
r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/core2-64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseu=
do.log
indicates 5 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+fb71c823a7: This
/work/core2-64-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+fb71c823a7-r0/pseudo/=
pseudo.log
indicates 5 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+e4016a67bb: This
/work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOINC+e4016a67bb-r0/pseudo/pse=
udo.log
indicates 5 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+f65d50eb06: This
/work/armv5te-oe-linux-gnueabi/qtx11extras/5.9.2+gitAUTOINC+f65d50eb06-r0/p=
seudo/pseudo.log
indicates 6 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+f65d50eb06: This
/work/core2-64-oe-linux/qtx11extras/5.9.2+gitAUTOINC+f65d50eb06-r0/pseudo/p=
seudo.log
indicates 5 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+fcfa824402: This
/work/core2-64-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+fcfa824402-r0/pseudo=
/pseudo.log
indicates 4 errors [qa_pseudo]
quagga-1.2.1: This
/work/armv5te-oe-linux-gnueabi/quagga/1.2.1-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
quagga-1.2.1: This
/work/i586-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.log indicates 15
errors [qa_pseudo]
radvd-2.17: This
/work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 7
errors [qa_pseudo]
radvd-2.17: This /work/i586-oe-linux/radvd/2.17-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
readline-7.0: This
/work/armv5te-oe-linux-gnueabi/readline/7.0-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
rsync-3.1.2: This /work/i586-oe-linux/rsync/3.1.2-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/i586-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
samba-4.6.7: This
/work/core2-64-oe-linux/samba/4.6.7-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
satyr-0.23: This
/work/armv5te-oe-linux-gnueabi/satyr/0.23-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
sblim-sfcb-1.4.9: This
/work/i586-oe-linux/sblim-sfcb/1.4.9-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
sblim-sfcc-2.2.8: This
/work/armv5te-oe-linux-gnueabi/sblim-sfcc/2.2.8-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
scsirastools-1.6.6: This
/work/i586-oe-linux/scsirastools/1.6.6-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
sed-4.2.2: This
/work/armv5te-oe-linux-gnueabi/sed/4.2.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
sg3-utils-1.42: This
/work/i586-oe-linux/sg3-utils/1.42-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
shadow-4.2.1: This
/work/i586-oe-linux/shadow/4.2.1-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
slang-2.3.1a: This
/work/core2-64-oe-linux/slang/2.3.1a-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
snort-2.9.7.5: This
/work/armv5te-oe-linux-gnueabi/snort/2.9.7.5-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
speexdsp-1.2rc3: This
/work/core2-64-oe-linux/speexdsp/1.2rc3-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
sqlite3-3.20.0: This
/work/core2-64-oe-linux/sqlite3/3_3.20.0-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
squid-3.5.27: This
/work/armv5te-oe-linux-gnueabi/squid/3.5.27-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
squid-3.5.27: This
/work/core2-64-oe-linux/squid/3.5.27-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
squid-3.5.27: This
/work/i586-oe-linux/squid/3.5.27-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
sthttpd-2.27.1: This
/work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
sthttpd-2.27.1: This
/work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
strace-4.18: This
/work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
strace-4.18: This
/work/core2-64-oe-linux/strace/4.18-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
strace-4.18: This /work/i586-oe-linux/strace/4.18-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
tcl-8.6.7: This
/work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
tcl-8.6.7: This /work/i586-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
telepathy-python-0.15.19: This
/work/core2-64-oe-linux/telepathy-python/0.15.19-r6/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
tftp-hpa-5.2: This
/work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
tipcutils-2.2.0+gitAUTOINC+7ab2211b87: This
/work/qemux86_64-oe-linux/tipcutils/2.2.0+gitAUTOINC+7ab2211b87-r0/pseudo/p=
seudo.log
indicates 10 errors [qa_pseudo]
tomoyo-tools-2.5.0: This
/work/i586-oe-linux/tomoyo-tools/2.5.0-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
ttf-gentium-1.02: This
/work/all-oe-linux/ttf-gentium/1.02-r8/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
ubi-utils-klibc-1.5.2: This
/work/armv5te-oe-linux-gnueabi/ubi-utils-klibc/1.5.2-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
udisks-1.0.5: This
/work/armv5te-oe-linux-gnueabi/udisks/1.0.5-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
ufw-0.33: This /work/armv5te-oe-linux-gnueabi/ufw/0.33-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
upm-1.3.0-gitAUTOINC+106b6c7062: This
/work/armv5te-oe-linux-gnueabi/upm/1.3.0-gitAUTOINC+106b6c7062-r0/pseudo/ps=
eudo.log
indicates 10 errors [qa_pseudo]
usbredir-0.7.1+gitAUTOINC+39aa3c69f6: This
/work/core2-64-oe-linux/usbredir/0.7.1+gitAUTOINC+39aa3c69f6-r0/pseudo/pseu=
do.log
indicates 10 errors [qa_pseudo]
vte-0.48.3: This /work/i586-oe-linux/vte/0.48.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
weston-init-1.0: This
/work/all-oe-linux/weston-init/1.0-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: This
/work/all-oe-linux/xcursor-transparent-theme/0.1.1+gitAUTOINC+23c8af5ba4-r0=
/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
xdelta3-3.0.11: This
/work/i586-oe-linux/xdelta3/3.0.11-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
xf86-input-evdev-2.10.5: This
/work/i586-oe-linux/xf86-input-evdev/2_2.10.5-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
xf86-input-mouse-1.9.2: This
/work/core2-64-oe-linux/xf86-input-mouse/2_1.9.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
xfce4-hotcorner-plugin-0.0.2: This
/work/i586-oe-linux/xfce4-hotcorner-plugin/0.0.2-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
xwd-1.0.6: This /work/i586-oe-linux/xwd/1.0.6-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
xz-5.2.3: This /work/armv5te-oe-linux-gnueabi/xz/5.2.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
xz-5.2.3: This /work/i586-oe-linux/xz/5.2.3-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
ypbind-mt-2.4: This
/work/i586-oe-linux/ypbind-mt/2.4-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
zlog-1.2.12+gitAUTOINC+13904dab28: This
/work/core2-64-oe-linux/zlog/1.2.12+gitAUTOINC+13904dab28-r0/pseudo/pseudo.=
log
indicates 10 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:
28249c4 README: new readme file including main aspects of the project
not included in master yet:
3d4315c world-image: add extra target
839bccc fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D

latest upstream commit:
8ca61a5 bitbake.conf: add tools required by testimage to HOSTTOOLS conditio=
nally
not included in master yet:
d28c0cb report-error: Allow to upload reports automatically
ebe6522 buildhistory.bbclass: metadata-revs show repo parent
78735b9 metadata-revs: provide more information
a48bb4c qemux86: Add identical qemux86copy variant for tests
582876d reproducible_build.bbclass: initial support for binary reproducibil=
ity
8cde606 cpio: provide cpio-replacement-native
fa4e167 image_types.bbclass: improve cpio image reproducibility
bd99eff rootfs-postcommands.bbclass: support binary reproducibility
446dffa sstate.bbclass: Do not cause build failures due to setscene errors
caba1c2 insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
633940b libsdl2: allow to build native and nativesdk
d2a2d29 libdrm: allow to build native and nativesdk
e407568 nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
aa6ce39 libepoxy: add support for native(sdk)
11acf2e libjpeg-turbo: provide nativesdk version
b58f07d virglrenderer: add new recipe
f00aa03 virglrenderer: fix target build
b19c402 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
fbb4feb insane.bbclass: use package_qa_handle_error for do_qa_pseudo

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:
5c9a4a0 network-manager-applet: Disable gobject-introspection on musl
not included in master yet:
a3324b8 dnsmasq: disable the service by default
981436f openconnect: fix parallel compilation failure
d217c1b squid: upgrade to 3.5.27
9dead9a iproute2: Move tipc enablement to oe-core
78cd01b libmnl: Move to oe-core
e96fe1b drbd-utils: remove
0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
764ced9 yp-tools: Ignore cpp warnings as errors
5079d37 openl2tp: Fix build with musl/libtirpc
db1db07 spice: import from meta-cloud-services
13b5f46 spice: fix dependency on python-pyparsing, add support for native(s=
dk)
f160ead spice: fix build with FORTIFY_SOURCES already defined in native gcc
ed85de1 spice: upgrade to 0.13.90 version
4d865c9 net-snmp: check that executable is used before testing for existanc=
e
a07dbac c-ares: Build native version
7097be1 ebtables: Add HOMEPAGE info into recipe file.
9c31bed lldpd: Update to version 0.9.8
3f27b4f libauthen-radius-perl: move recipe to meta-networking
aeed5ea dnsmasq: upgrade to 2.78
2952679 python3-protobuf: add python3 version
3d72f4d python3-ujson: support Python 3
3ed87fc mdns: move from meta-intel-iot-middleware
4054ef0 Recipe for Nghttp2: HTTP/2 C Library.
99e45c6 meta-oe/conf/layer.conf: Remove "id" from HOSTTOOLS
0cf389b python-twisted: remove empty lore subpackage
aaeacc6 rocksdb: add version 5.8
a6efaf9 python-pytest: fix egg version of package
7cfd93b python-asn1crypto: add new package
0b9fb68 Fix gpsd Yocto pyro build for read only rootfs
a6031b4 netkit-rsh: correct the file attribute
1a7e825 usbredir: add new recipe
3cbacd5 libopus: add native and nativesdk

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:
f00f79b qtxmlpatterns: Add HOMEPAGE info into recipe file.
not included in master yet:
2e6fb62 qt5: add missing commercial license

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D

latest upstream commit:
26d5066 firefox: fix build failures
not included in master yet:
6773bf9 meta: drop ${COREBASE}/LICENSE references

--f403045d589819bdaa055b643c9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre id=3D"gmail-out" class=3D"gmail-console-output" style=
=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-=
top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><pre style=3D=
"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top=
:0px;margin-bottom:0px"><a href=3D"http://www.openembedded.org/wiki/Bitbake=
_World_Status" style=3D"box-sizing:border-box;word-wrap:break-word;color:rg=
b(92,53,102)">http://www.openembedded.org/wiki/Bitbake_World_Status</a>

=3D=3D Number of issues - stats =3D=3D
{| class=3D&#39;wikitable&#39;
!|Date		     !!colspan=3D&#39;3&#39;|Failed tasks			    !!|Signatures		  !!=
colspan=3D&#39;15&#39;|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||qa_pseud=
o	||=09
|-
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">||2017-10-10	||7	||8	||3	||0	||0=
		||0		||3		||0		||0		||0		||5		||0		||0		||0		||0		||0		||0		||0		||366		|=
|=09
|}

=3D=3D Failed tasks 2017-10-10 =3D=3D

INFO: jenkins-job.sh-1.8.34 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171012_161223.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171012_161=
223.log</a>

=3D=3D=3D common (1) =3D=3D=3D
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_pac=
kage_qa

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (6) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb:do_=
compile
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_compile_ptest_base
    * meta-qt5/recipes-qt/qt5/qtquick1_git.bb:do_compile_ptest_base
    * meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_compile_ptest_base

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/spice/spice_git.bb:=
do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package=
_qa

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb:do_package_qa

=3D=3D=3D Number of failed tasks (18) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 7	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20171010_225937.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20171010_225937.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/47456/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/47456/</a>
|-
|| qemux86 	|| 8	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20171011_084917.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20171011_084917.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/47459/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/47459/</a>
|-
|| qemux86_64 	|| 3	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20171010_012728.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171010_012728.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/47451/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/47451/</a>
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">=3D=3D=3D QA issues (374) =3D=3D=
=3D
{| class=3Dwikitable
!| Count		||Issue
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||366	||qa_pseudo
|-
||3	||textrel
|-
||5	||host-user-contaminated
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20171009_201722.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20171009_201722.log/</a>

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)}&quot;
meta-qt5:
PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtualiazat=
ion which isn&#39;t included in my world builds&quot;
PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[tearsofsteel-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[build-appliance-image] =3D &quot;tries to include whole downloa=
ds directory in /home/builder/poky :/&quot;


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 3	issue: textrel
corosync-2.4.2: ELF binary &#39;/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync&#39; has relocations in .text [tex=
trel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264&#39; ha=
s relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148&#=
39; has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 0	issue: version-going-ba=
ckwards


count: 5	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-aa-er+saaho/usr/l=
ib/locale/aa_ER@saaho/LC_PAPER is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-dz/usr/lib/loc=
ale/ar_DZ/LC_PAPER is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-kw.iso-8859-6/=
usr/lib/locale/ar_KW.ISO-8859-6/LC_PAPER is owned by uid 3004, which is the=
 same as the user running bitbake. This may be due to host contamination [h=
ost-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-sq-al.iso-8859-1/=
usr/lib/locale/sq_AL.ISO-8859-1/LC_MEASUREMENT is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]
qtwayland-5.9.2+gitAUTOINC+7f70da6a64: qtwayland: /qtwayland-dev/usr/lib/cm=
ake/Qt5WaylandClient/Qt5WaylandClient_QWaylandIviShellIntegrationPlugin.cma=
ke is owned by uid 3004, which is the same as the user running bitbake. Thi=
s may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 366	issue: qa_pseudo
acl-2.2.52: This /work/armv5te-oe-linux-gnueabi/acl/2.2.52-r0/pseudo/pseudo=
.log indicates 4 errors [qa_pseudo]
acl-2.2.52: This /work/core2-64-oe-linux/acl/2.2.52-r0/pseudo/pseudo.log in=
dicates 4 errors [qa_pseudo]
acl-2.2.52: This /work/i586-oe-linux/acl/2.2.52-r0/pseudo/pseudo.log indica=
tes 4 errors [qa_pseudo]
alsa-oss-1.0.17: This /work/core2-64-oe-linux/alsa-oss/1.0.17-r1/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
apache2-2.4.27: This /work/armv5te-oe-linux-gnueabi/apache2/2.4.27-r0/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
apache2-2.4.27: This /work/core2-64-oe-linux/apache2/2.4.27-r0/pseudo/pseud=
o.log indicates 5 errors [qa_pseudo]
apache2-2.4.27: This /work/i586-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.lo=
g indicates 7 errors [qa_pseudo]
apmd-3.2.2-15: This /work/i586-oe-linux/apmd/3.2.2-15-r0/pseudo/pseudo.log =
indicates 12 errors [qa_pseudo]
aspell-0.60.6.1: This /work/armv5e-oe-linux-gnueabi/aspell/0.60.6.1-r1/pseu=
do/pseudo.log indicates 10 errors [qa_pseudo]
attr-2.4.47: This /work/armv5te-oe-linux-gnueabi/attr/2.4.47-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
autofs-5.1.2: This /work/armv5te-oe-linux-gnueabi/autofs/5.1.2-r0/pseudo/ps=
eudo.log indicates 4 errors [qa_pseudo]
avahi-ui-0.6.32: This /work/i586-oe-linux/avahi-ui/0.6.32-r0/pseudo/pseudo.=
log indicates 18 errors [qa_pseudo]
base-passwd-3.5.29: This /work/armv5te-oe-linux-gnueabi/base-passwd/3.5.29-=
r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
binutils-2.29: This /work/core2-64-oe-linux/binutils/2.29-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
blktrace-1.1.0+gitAUTOINC+43fc870ce0: This /work/armv5te-oe-linux-gnueabi/b=
lktrace/1.1.0+gitAUTOINC+43fc870ce0-r0/pseudo/pseudo.log indicates 10 error=
s [qa_pseudo]
bluez5-5.46: This /work/core2-64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
bluez5-5.46: This /work/i586-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log indi=
cates 5 errors [qa_pseudo]
bmap-tools-3.4: This /work/armv5te-oe-linux-gnueabi/bmap-tools/3.4-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
bootchart2-0.14.8: This /work/i586-oe-linux/bootchart2/0.14.8-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
busybox-1.24.1: This /work/i586-oe-linux/busybox/1.24.1-r0/pseudo/pseudo.lo=
g indicates 8 errors [qa_pseudo]
can-utils-0.0+gitrAUTOINC+4c8fb05cb4: This /work/armv5te-oe-linux-gnueabi/c=
an-utils/0.0+gitrAUTOINC+4c8fb05cb4-r0/pseudo/pseudo.log indicates 10 error=
s [qa_pseudo]
cdparanoia-10.2: This /work/armv5te-oe-linux-gnueabi/cdparanoia/10.2-r0/pse=
udo/pseudo.log indicates 10 errors [qa_pseudo]
chrony-2.4: This /work/armv5te-oe-linux-gnueabi/chrony/2.4-r0/pseudo/pseudo=
.log indicates 5 errors [qa_pseudo]
chrony-2.4: This /work/core2-64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log in=
dicates 4 errors [qa_pseudo]
ckermit-302: This /work/i586-oe-linux/ckermit/302-r0/pseudo/pseudo.log indi=
cates 12 errors [qa_pseudo]
connman-1.34: This /work/armv5te-oe-linux-gnueabi/connman/1.34-r0/pseudo/ps=
eudo.log indicates 4 errors [qa_pseudo]
conntrack-tools-1.4.4: This /work/armv5te-oe-linux-gnueabi/conntrack-tools/=
1.4.4-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
conntrack-tools-1.4.4: This /work/core2-64-oe-linux/conntrack-tools/1.4.4-r=
0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
corosync-2.4.2: This /work/armv5te-oe-linux-gnueabi/corosync/2.4.2-r0/pseud=
o/pseudo.log indicates 16 errors [qa_pseudo]
corosync-2.4.2: This /work/core2-64-oe-linux/corosync/2.4.2-r0/pseudo/pseud=
o.log indicates 16 errors [qa_pseudo]
cups-2.2.4: This /work/armv5te-oe-linux-gnueabi/cups/2.2.4-r0/pseudo/pseudo=
.log indicates 16 errors [qa_pseudo]
curlpp-0.8.1: This /work/i586-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log in=
dicates 7 errors [qa_pseudo]
daemontools-0.76: This /work/i586-oe-linux/daemontools/0.76-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
dfu-util-0.9: This /work/armv5te-oe-linux-gnueabi/dfu-util/0.9-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/armv5te-oe-linux-gnueabi/dhcp/4.3.6-r0/pseudo/pseudo=
.log indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log in=
dicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/i586-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]
docbook-xml-dtd4-4.5: This /work/all-oe-linux/docbook-xml-dtd4/4.5-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
dovecot-2.2.29: This /work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/pseud=
o/pseudo.log indicates 11 errors [qa_pseudo]
dovecot-2.2.29: This /work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/pseud=
o.log indicates 11 errors [qa_pseudo]
dovecot-2.2.29: This /work/i586-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.lo=
g indicates 14 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-r4=
/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/core2-64-oe-linux/ebtables/2.0.10-4-r4/pseudo=
/pseudo.log indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/i586-oe-linux/ebtables/2.0.10-4-r4/pseudo/pse=
udo.log indicates 7 errors [qa_pseudo]
eglinfo-fb-1.0.0: This /work/i586-oe-linux/eglinfo-fb/1.0.0-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
espeak-1.48.04: This /work/core2-64-oe-linux/espeak/1.48.04-r0/pseudo/pseud=
o.log indicates 4 errors [qa_pseudo]
evtest-1.33+AUTOINC+ab140a2dab: This /work/i586-oe-linux/evtest/1.33+AUTOIN=
C+ab140a2dab-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
expat-2.2.3: This /work/armv5te-oe-linux-gnueabi/expat/2.2.3-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
f2fs-tools-1.8.0: This /work/armv5te-oe-linux-gnueabi/f2fs-tools/1.8.0-r0/p=
seudo/pseudo.log indicates 10 errors [qa_pseudo]
firefox-l10n-ff-45.9.0esr: This /work/all-oe-linux/firefox-l10n-ff/45.9.0es=
r-r3/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
flac-1.3.2: This /work/i586-oe-linux/flac/1.3.2-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]
flatbuffers-1.7.1: This /work/i586-oe-linux/flatbuffers/1.7.1-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
fuse-2.9.7: This /work/i586-oe-linux/fuse/2.9.7-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/armv5te-oe-linux-gnueabi/gate=
one/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_p=
seudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/i586-oe-linux/gateone/1.2+git=
AUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
gawk-4.1.4: This /work/armv5te-oe-linux-gnueabi/gawk/4.1.4-r0/pseudo/pseudo=
.log indicates 5 errors [qa_pseudo]
gawk-4.1.4: This /work/i586-oe-linux/gawk/4.1.4-r0/pseudo/pseudo.log indica=
tes 10 errors [qa_pseudo]
gd-2.2.4: This /work/core2-64-oe-linux/gd/2.2.4-r0/pseudo/pseudo.log indica=
tes 10 errors [qa_pseudo]
gdb-8.0: This /work/armv5te-oe-linux-gnueabi/gdb/8.0-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
giflib-5.1.4: This /work/armv5te-oe-linux-gnueabi/giflib/5.1.4-r0/pseudo/ps=
eudo.log indicates 4 errors [qa_pseudo]
git-2.13.3: This /work/core2-64-oe-linux/git/2.13.3-r0/pseudo/pseudo.log in=
dicates 8 errors [qa_pseudo]
glade-3.20.0: This /work/i586-oe-linux/glade/3.20.0-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
glib-2.0-2.52.3: This /work/i586-oe-linux/glib-2.0/1_2.52.3-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
glibc-2.26: This /work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pseudo.=
log indicates 23 errors [qa_pseudo]
glibc-2.26: This /work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log in=
dicates 6 errors [qa_pseudo]
glibc-2.26: This /work/i586-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indica=
tes 563 errors [qa_pseudo]
glibc-locale-2.26: This /work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/=
pseudo/pseudo.log indicates 5 errors [qa_pseudo]
glibc-locale-2.26: This /work/core2-64-oe-linux/glibc-locale/2.26-r0/pseudo=
/pseudo.log indicates 16 errors [qa_pseudo]
glibc-locale-2.26: This /work/i586-oe-linux/glibc-locale/2.26-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
glib-networking-2.50.0: This /work/i586-oe-linux/glib-networking/2.50.0-r0/=
pseudo/pseudo.log indicates 12 errors [qa_pseudo]
gnupg-2.2.0: This /work/armv5te-oe-linux-gnueabi/gnupg/2.2.0-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
go-1.9: This /work/armv5e-oe-linux-gnueabi/go/1.9-r0/pseudo/pseudo.log indi=
cates 10 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/core2-64-oe-linux/gobject-introspe=
ction/1.52.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/i586-oe-linux/gobject-introspectio=
n/1.52.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
gptfdisk-1.0.3: This /work/armv5te-oe-linux-gnueabi/gptfdisk/1.0.3-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
gtkmm-2.24.5: This /work/armv5te-oe-linux-gnueabi/gtkmm/2.24.5-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
hplip-3.12.6: This /work/core2-64-oe-linux/hplip/3.12.6-r1/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
icon-slicer-0.3: This /work/i586-oe-linux/icon-slicer/0.3-r0/pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
icu-59.1: This /work/armv5e-oe-linux-gnueabi/icu/59.1-r0/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]
icu-59.1: This /work/core2-64-oe-linux/icu/59.1-r0/pseudo/pseudo.log indica=
tes 5 errors [qa_pseudo]
icu-59.1: This /work/i586-oe-linux/icu/59.1-r0/pseudo/pseudo.log indicates =
7 errors [qa_pseudo]
inetutils-1.9.4: This /work/armv5te-oe-linux-gnueabi/inetutils/1.9.4-r0/pse=
udo/pseudo.log indicates 4 errors [qa_pseudo]
init-ifupdown-1.0: This /work/qemux86-oe-linux/init-ifupdown/1.0-r7/pseudo/=
pseudo.log indicates 6 errors [qa_pseudo]
iotop-0.6: This /work/armv5te-oe-linux-gnueabi/iotop/0.6-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
iotop-0.6: This /work/i586-oe-linux/iotop/0.6-r0/pseudo/pseudo.log indicate=
s 6 errors [qa_pseudo]
iperf3-3.2: This /work/i586-oe-linux/iperf3/3.2-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]
ipsec-tools-0.8.2: This /work/qemux86_64-oe-linux/ipsec-tools/0.8.2-r0/pseu=
do/pseudo.log indicates 11 errors [qa_pseudo]
iputils-s20151218: This /work/i586-oe-linux/iputils/s20151218-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
iscsitarget-1.4.20.3+svn502: This /work/qemux86_64-oe-linux/iscsitarget/<a =
href=3D"http://1.4.20.3">1.4.20.3</a>+svn502-r0/pseudo/pseudo.log indicates=
 10 errors [qa_pseudo]
jack-1.9.10+gitAUTOINC+2d1d323505: This /work/i586-oe-linux/jack/1.9.10+git=
AUTOINC+2d1d323505-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
kconfig-frontends-4.11.0.1: This /work/armv5te-oe-linux-gnueabi/kconfig-fro=
ntends/4.11.0.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
konkretcmpi-0.9.2: This /work/core2-64-oe-linux/konkretcmpi/0.9.2-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/lc=
dproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 4 errors [=
qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/core2-64-oe-linux/lcdproc/0=
.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 4 errors [qa_pseu=
do]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/i586-oe-linux/lcdproc/0.5.8=
+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
less-487: This /work/armv5te-oe-linux-gnueabi/less/487-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
libatasmart-0.19: This /work/armv5te-oe-linux-gnueabi/libatasmart/0.19-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
libatasmart-0.19: This /work/core2-64-oe-linux/libatasmart/0.19-r0/pseudo/p=
seudo.log indicates 4 errors [qa_pseudo]
libatomic-ops-7.6.0+gitAUTOINC+73c60c5ef1: This /work/core2-64-oe-linux/lib=
atomic-ops/7.6.0+gitAUTOINC+73c60c5ef1-r0/pseudo/pseudo.log indicates 16 er=
rors [qa_pseudo]
libbsd-0.8.6: This /work/core2-64-oe-linux/libbsd/0.8.6-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
libcanberra-0.30: This /work/i586-oe-linux/libcanberra/0.30-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
libconnman-qt5-1.1.10+gitAUTOINC+4d6def3053: This /work/core2-64-oe-linux/l=
ibconnman-qt5/1.1.10+gitAUTOINC+4d6def3053-r0/pseudo/pseudo.log indicates 6=
 errors [qa_pseudo]
libencode-perl-2.83: This /work/armv5te-oe-linux-gnueabi/libencode-perl/2.8=
3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libfastjson-0.99.4: This /work/core2-64-oe-linux/libfastjson/0.99.4-r0/pseu=
do/pseudo.log indicates 10 errors [qa_pseudo]
libiec61883-1.2.0: This /work/armv5te-oe-linux-gnueabi/libiec61883/1.2.0-r0=
/pseudo/pseudo.log indicates 9 errors [qa_pseudo]
libldb-1.1.29: This /work/core2-64-oe-linux/libldb/1.1.29-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
libldb-1.1.29: This /work/i586-oe-linux/libldb/1.1.29-r0/pseudo/pseudo.log =
indicates 13 errors [qa_pseudo]
libmms-0.6.4: This /work/armv5te-oe-linux-gnueabi/libmms/0.6.4-r0/pseudo/ps=
eudo.log indicates 9 errors [qa_pseudo]
libpciaccess-0.13.5: This /work/core2-64-oe-linux/libpciaccess/0.13.5-r0/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
libqofono-0.87+gitrAUTOINC+54435de3be: This /work/core2-64-oe-linux/libqofo=
no/0.87+gitrAUTOINC+54435de3be-r0/pseudo/pseudo.log indicates 6 errors [qa_=
pseudo]
librsvg-2.40.18: This /work/i586-oe-linux/librsvg/2.40.18-r0/pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
libsombok3-2.4.0: This /work/i586-oe-linux/libsombok3/2.4.0-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
libuser-0.62: This /work/i586-oe-linux/libuser/0.62-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9.1=
1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/ps=
eudo/pseudo.log indicates 5 errors [qa_pseudo]
libvncserver-0.9.11: This /work/i586-oe-linux/libvncserver/0.9.11-r0/pseudo=
/pseudo.log indicates 6 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseud=
o.log indicates 4 errors [qa_pseudo]
libwnck3-3.20.1: This /work/core2-64-oe-linux/libwnck3/3.20.1-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
libxcursor-1.1.14: This /work/core2-64-oe-linux/libxcursor/1_1.1.14-r0/pseu=
do/pseudo.log indicates 10 errors [qa_pseudo]
libxml2-2.9.4: This /work/armv5te-oe-linux-gnueabi/libxml2/2.9.4-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
libxml2-2.9.4: This /work/core2-64-oe-linux/libxml2/2.9.4-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
libxml2-2.9.4: This /work/i586-oe-linux/libxml2/2.9.4-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
libxml-perl-0.08: This /work/i586-oe-linux/libxml-perl/0.08-r3/pseudo/pseud=
o.log indicates 11 errors [qa_pseudo]
linux-atm-2.5.2: This /work/qemux86-oe-linux/linux-atm/2.5.2-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_16de014967: This /work/qemux86_64=
-oe-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_16de014967-r0/pseudo/ps=
eudo.log indicates 4 errors [qa_pseudo]
linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_16de014967: This /work/qemux86-oe=
-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_16de014967-r0/pseudo/pseud=
o.log indicates 4 errors [qa_pseudo]
linux-yocto-4.12.12+gitAUTOINC+eda4d18ce4_67b62d8d7b: This /work/qemuarm-oe=
-linux-gnueabi/linux-yocto/4.12.12+gitAUTOINC+eda4d18ce4_67b62d8d7b-r0/pseu=
do/pseudo.log indicates 6 errors [qa_pseudo]
lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
lirc-0.9.4d: This /work/i586-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indi=
cates 6 errors [qa_pseudo]
llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indica=
tes 11 errors [qa_pseudo]
llvm-5.0: This /work/i586-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indicates =
8 errors [qa_pseudo]
lmbench-3.0-a9: This /work/armv5te-oe-linux-gnueabi/lmbench/3.0-a9-r2/pseud=
o/pseudo.log indicates 4 errors [qa_pseudo]
lockfile-progs-0.1.17: This /work/armv5te-oe-linux-gnueabi/lockfile-progs/0=
.1.17-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
log4cpp-1.1.2: This /work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseudo/=
pseudo.log indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This /work/core2-64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
log4cpp-1.1.2: This /work/i586-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log =
indicates 7 errors [qa_pseudo]
logrotate-3.12.3: This /work/i586-oe-linux/logrotate/3.12.3-r0/pseudo/pseud=
o.log indicates 6 errors [qa_pseudo]
lowpan-tools-0.3.1+gitAUTOINC+38f42dbfce: This /work/core2-64-oe-linux/lowp=
an-tools/0.3.1+gitAUTOINC+38f42dbfce-r0/pseudo/pseudo.log indicates 4 error=
s [qa_pseudo]
lprng-3.8.C: This /work/core2-64-oe-linux/lprng/3.8.C-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/i586-oe-linux/lttng-tools/2.9.5-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
lvm2-2.02.171: This /work/armv5te-oe-linux-gnueabi/lvm2/2.02.171-r0/pseudo/=
pseudo.log indicates 4 errors [qa_pseudo]
lvm2-2.02.171: This /work/core2-64-oe-linux/lvm2/2.02.171-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe-l=
inux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log=
 indicates 6 errors [qa_pseudo]
mariadb-5.5.57: This /work/armv5e-oe-linux-gnueabi/mariadb/5.5.57-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
matchbox-keyboard-0.1.1: This /work/core2-64-oe-linux/matchbox-keyboard/0.1=
.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mc-4.8.19: This /work/armv5te-oe-linux-gnueabi/mc/4.8.19-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
meson-0.40.1: This /work/armv5te-oe-linux-gnueabi/meson/0.40.1-r0/pseudo/ps=
eudo.log indicates 4 errors [qa_pseudo]
meson-0.40.1: This /work/core2-64-oe-linux/meson/0.40.1-r0/pseudo/pseudo.lo=
g indicates 4 errors [qa_pseudo]
minicoredumper-2.0.0: This /work/i586-oe-linux/minicoredumper/2.0.0-r0+gitA=
UTOINC+cdc1faf121/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mongodb-3.4.6+gitAUTOINC+c55eb86ef4: This /work/i586-oe-linux/mongodb/3.4.6=
+gitAUTOINC+c55eb86ef4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mosquitto-1.4.14: This /work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/core2-64-oe-linux/mosquitto/1.4.14-r0/pseudo/p=
seudo.log indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/i586-oe-linux/mosquitto/1.4.14-r0/pseudo/pseud=
o.log indicates 6 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/armv5te-oe-linux-gnueabi/mozilla-devscr=
ipts/0.30-r1/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/core2-64-oe-linux/mozilla-devscripts/0.=
30-r1/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mpich-3.2: This /work/armv5te-oe-linux-gnueabi/mpich/3.2-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
mpich-3.2: This /work/core2-64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log indi=
cates 4 errors [qa_pseudo]
mpich-3.2: This /work/i586-oe-linux/mpich/3.2-r0/pseudo/pseudo.log indicate=
s 6 errors [qa_pseudo]
multipath-tools-0.7.1: This /work/armv5e-oe-linux-gnueabi/multipath-tools/0=
.7.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
nana-2.5: This /work/core2-64-oe-linux/nana/2.5-r0/pseudo/pseudo.log indica=
tes 10 errors [qa_pseudo]
netcat-0.7.1: This /work/armv5te-oe-linux-gnueabi/netcat/0.7.1-r3/pseudo/ps=
eudo.log indicates 4 errors [qa_pseudo]
net-snmp-5.7.3: This /work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
net-snmp-5.7.3: This /work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseud=
o.log indicates 5 errors [qa_pseudo]
nginx-1.12.1: This /work/armv5te-oe-linux-gnueabi/nginx/1.12.1-r0/pseudo/ps=
eudo.log indicates 6 errors [qa_pseudo]
nginx-1.12.1: This /work/core2-64-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.lo=
g indicates 11 errors [qa_pseudo]
nginx-1.12.1: This /work/i586-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.log in=
dicates 7 errors [qa_pseudo]
nss-3.31.1: This /work/armv5te-oe-linux-gnueabi/nss/3.31.1-r0/pseudo/pseudo=
.log indicates 5 errors [qa_pseudo]
ntp-4.2.8p10: This /work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseudo/ps=
eudo.log indicates 11 errors [qa_pseudo]
ntp-4.2.8p10: This /work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.lo=
g indicates 11 errors [qa_pseudo]
ntp-4.2.8p10: This /work/i586-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
onboard-1.4.1: This /work/core2-64-oe-linux/onboard/1.4.1-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
onig-5.9.6: This /work/armv5te-oe-linux-gnueabi/onig/5.9.6-r0/pseudo/pseudo=
.log indicates 10 errors [qa_pseudo]
openipmi-2.0.24: This /work/core2-64-oe-linux/openipmi/2.0.24-r0/pseudo/pse=
udo.log indicates 4 errors [qa_pseudo]
opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pse=
udo/pseudo.log indicates 15 errors [qa_pseudo]
opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pse=
udo.log indicates 16 errors [qa_pseudo]
opensaf-5.17.07: This /work/i586-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.=
log indicates 17 errors [qa_pseudo]
openssh-7.5p1: This /work/armv5te-oe-linux-gnueabi/openssh/7.5p1-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
openssh-7.5p1: This /work/core2-64-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.=
log indicates 17 errors [qa_pseudo]
openssh-7.5p1: This /work/i586-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.log =
indicates 12 errors [qa_pseudo]
opus-tools-0.1.8: This /work/i586-oe-linux/opus-tools/0.1.8-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/pse=
udo/pseudo.log indicates 4 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pse=
udo.log indicates 5 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/i586-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.=
log indicates 14 errors [qa_pseudo]
packagegroup-core-x11-xserver-1.0: This /work/qemux86_64-oe-linux/packagegr=
oup-core-x11-xserver/1.0-r40/pseudo/pseudo.log indicates 10 errors [qa_pseu=
do]
pango-1.40.6: This /work/core2-64-oe-linux/pango/1.40.6-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
perf-1.0: This /work/qemuarm-oe-linux-gnueabi/perf/1.0-r9/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
perl-5.24.1: This /work/armv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/pseu=
do.log indicates 5 errors [qa_pseudo]
perl-5.24.1: This /work/core2-64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
perl-5.24.1: This /work/i586-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indi=
cates 4 errors [qa_pseudo]
php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.lo=
g indicates 6 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indi=
cates 12 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicate=
s 8 errors [qa_pseudo]
phpmyadmin-4.7.3: This /work/all-oe-linux/phpmyadmin/4.7.3-r0/pseudo/pseudo=
.log indicates 4 errors [qa_pseudo]
pm-qa-0.5.2: This /work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/pseu=
do.log indicates 35 errors [qa_pseudo]
pm-qa-0.5.2: This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log =
indicates 42 errors [qa_pseudo]
pm-qa-0.5.2: This /work/i586-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indi=
cates 43 errors [qa_pseudo]
portaudio-v19-v190600: This /work/armv5te-oe-linux-gnueabi/portaudio-v19/v1=
90600-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
portaudio-v19-v190600: This /work/core2-64-oe-linux/portaudio-v19/v190600-r=
0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
postfix-3.2.2: This /work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pseudo/=
pseudo.log indicates 11 errors [qa_pseudo]
postfix-3.2.2: This /work/i586-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log =
indicates 12 errors [qa_pseudo]
postgresql-9.4.13: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.13-r0/=
pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postgresql-9.4.13: This /work/core2-64-oe-linux/postgresql/9.4.13-r0/pseudo=
/pseudo.log indicates 11 errors [qa_pseudo]
postgresql-9.4.13: This /work/i586-oe-linux/postgresql/9.4.13-r0/pseudo/pse=
udo.log indicates 14 errors [qa_pseudo]
procps-3.3.12: This /work/i586-oe-linux/procps/3.3.12-r0/pseudo/pseudo.log =
indicates 6 errors [qa_pseudo]
proftpd-1.3.6: This /work/core2-64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
proftpd-1.3.6: This /work/i586-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log =
indicates 14 errors [qa_pseudo]
puzzles-0.0+gitAUTOINC+8dfe5cec31: This /work/i586-oe-linux/puzzles/1_0.0+g=
itAUTOINC+8dfe5cec31-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-2.7.13: This /work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseudo.=
log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/i586-oe-linux/python/2.7.13-r1/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
python3-3.5.3: This /work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/pseud=
o.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/i586-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.lo=
g indicates 7 errors [qa_pseudo]
python3-babel-2.5.1: This /work/armv5te-oe-linux-gnueabi/python3-babel/2.5.=
1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-chardet-3.0.4: This /work/i586-oe-linux/python3-chardet/3.0.4-r0/ps=
eudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-coverage-4.4.1: This /work/armv5te-oe-linux-gnueabi/python3-coverag=
e/4.4.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python3-coverage-4.4.1: This /work/core2-64-oe-linux/python3-coverage/4.4.1=
-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-cryptography-2.0.3: This /work/core2-64-oe-linux/python3-cryptograp=
hy/2.0.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-cython-0.27.1: This /work/core2-64-oe-linux/python3-cython/0.27.1-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-docutils-0.14: This /work/armv5te-oe-linux-gnueabi/python3-docutils=
/0.14-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-isort-4.2.15: This /work/armv5te-oe-linux-gnueabi/python3-isort/4.2=
.15-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-ndg-httpsclient-0.4.3: This /work/armv5te-oe-linux-gnueabi/python3-=
ndg-httpsclient/0.4.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-nose-1.3.7: This /work/i586-oe-linux/python3-nose/1.3.7-r0/pseudo/p=
seudo.log indicates 6 errors [qa_pseudo]
python3-ntplib-0.3.3: This /work/i586-oe-linux/python3-ntplib/0.3.3-r0/pseu=
do/pseudo.log indicates 12 errors [qa_pseudo]
python3-pandas-0.20.3: This /work/core2-64-oe-linux/python3-pandas/0.20.3-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pip-9.0.1: This /work/core2-64-oe-linux/python3-pip/9.0.1-r0/pseudo=
/pseudo.log indicates 7 errors [qa_pseudo]
python3-pykickstart-2.35: This /work/armv5te-oe-linux-gnueabi/python3-pykic=
kstart/2.35-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/armv5te-oe-linux-gnueabi/python3-pylint/1.=
7.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/core2-64-oe-linux/python3-pylint/1.7.4-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/i586-oe-linux/python3-pylint/1.7.4-r0/pseu=
do/pseudo.log indicates 6 errors [qa_pseudo]
python3-serpent-1.23: This /work/i586-oe-linux/python3-serpent/1.23-r0/pseu=
do/pseudo.log indicates 12 errors [qa_pseudo]
python3-simplejson-3.11.1: This /work/armv5te-oe-linux-gnueabi/python3-simp=
lejson/3.11.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-xlrd-1.1.0: This /work/core2-64-oe-linux/python3-xlrd/1.1.0-r0/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
python-asn1crypto-0.23.0: This /work/i586-oe-linux/python-asn1crypto/0.23.0=
-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-cpuset-1.5.7: This /work/armv5te-oe-linux-gnueabi/python-cpuset/1.5.=
7-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-cson-git: This /work/i586-oe-linux/python-cson/git-r0/pseudo/pseudo.=
log indicates 6 errors [qa_pseudo]
python-django-1.11.5: This /work/i586-oe-linux/python-django/1.11.5-r0/pseu=
do/pseudo.log indicates 12 errors [qa_pseudo]
python-epydoc-3.0.1: This /work/armv5te-oe-linux-gnueabi/python-epydoc/3.0.=
1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-gevent-1.2.2: This /work/core2-64-oe-linux/python-gevent/1.2.2-r0/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
python-imaging-1.1.7: This /work/armv5te-oe-linux-gnueabi/python-imaging/1.=
1.7-r5/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
python-jsonpatch-1.16: This /work/core2-64-oe-linux/python-jsonpatch/1.16-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-jsonpatch-1.16: This /work/i586-oe-linux/python-jsonpatch/1.16-r0/ps=
eudo/pseudo.log indicates 6 errors [qa_pseudo]
python-netaddr-0.7.19: This /work/core2-64-oe-linux/python-netaddr/0.7.19-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-nose-1.3.7: This /work/i586-oe-linux/python-nose/1.3.7-r0/pseudo/pse=
udo.log indicates 6 errors [qa_pseudo]
python-numeric-24.2: This /work/armv5te-oe-linux-gnueabi/python-numeric/24.=
2-ml3/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pandas-0.20.3: This /work/i586-oe-linux/python-pandas/0.20.3-r0/pseu=
do/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.7.4: This /work/armv5te-oe-linux-gnueabi/python-pylint/1.7.=
4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This /work/core2-64-oe-linux/python-pylint/1.7.4-r0/ps=
eudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This /work/i586-oe-linux/python-pylint/1.7.4-r0/pseudo=
/pseudo.log indicates 6 errors [qa_pseudo]
python-pyro4-4.62: This /work/armv5te-oe-linux-gnueabi/python-pyro4/4.62-r0=
/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-pyro4-4.62: This /work/core2-64-oe-linux/python-pyro4/4.62-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
python-pyserial-3.4: This /work/armv5te-oe-linux-gnueabi/python-pyserial/3.=
4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pytest-3.2.2: This /work/armv5te-oe-linux-gnueabi/python-pytest/3.2.=
2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pytest-3.2.2: This /work/i586-oe-linux/python-pytest/3.2.2-r0/pseudo=
/pseudo.log indicates 6 errors [qa_pseudo]
python-scons-2.5.1: This /work/armv5te-oe-linux-gnueabi/python-scons/2.5.1-=
r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-scons-2.5.1: This /work/core2-64-oe-linux/python-scons/2.5.1-r0/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
python-setuptools-36.2.7: This /work/core2-64-oe-linux/python-setuptools/36=
.2.7-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-snakefood-1.4: This /work/i586-oe-linux/python-snakefood/1.4-r0/pseu=
do/pseudo.log indicates 6 errors [qa_pseudo]
python-snimpy-0.8.11: This /work/i586-oe-linux/python-snimpy/0.8.11-r0/pseu=
do/pseudo.log indicates 6 errors [qa_pseudo]
python-twisted-17.9.0: This /work/armv5te-oe-linux-gnueabi/python-twisted/1=
7.9.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-twisted-17.9.0: This /work/i586-oe-linux/python-twisted/17.9.0-r0/ps=
eudo/pseudo.log indicates 5 errors [qa_pseudo]
python-urllib3-1.22: This /work/armv5te-oe-linux-gnueabi/python-urllib3/1.2=
2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-vobject-0.9.5: This /work/armv5te-oe-linux-gnueabi/python-vobject/0.=
9.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-xlrd-1.1.0: This /work/core2-64-oe-linux/python-xlrd/1.1.0-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
python-yappi-0.98: This /work/armv5te-oe-linux-gnueabi/python-yappi/0.98-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
pywbem-0.8.0: This /work/armv5te-oe-linux-gnueabi/pywbem/0.8.0-r0/pseudo/ps=
eudo.log indicates 4 errors [qa_pseudo]
qemu-2.10.0: This /work/core2-64-oe-linux/qemu/2.10.0-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+9d8c9ada16: This /work/core2-64-oe-linux/qt3d/5.9.2+g=
itAUTOINC+9d8c9ada16-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
qt5-plugin-generic-vboxtouch-1.1.3+gitrAUTOINC+d613ad1cc6: This /work/i586-=
oe-linux/qt5-plugin-generic-vboxtouch/1.1.3+gitrAUTOINC+d613ad1cc6-r0/pseud=
o/pseudo.log indicates 6 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+73573fce29: This /work/armv5te-oe-linux-gnueabi/qtb=
ase/5.9.2+gitAUTOINC+73573fce29-r0/pseudo/pseudo.log indicates 709 errors [=
qa_pseudo]
qtbase-5.9.2+gitAUTOINC+73573fce29: This /work/core2-64-oe-linux/qtbase/5.9=
.2+gitAUTOINC+73573fce29-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo=
]
qtbase-5.9.2+gitAUTOINC+73573fce29: This /work/i586-oe-linux/qtbase/5.9.2+g=
itAUTOINC+73573fce29-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+1f47b1a7ae: This /work/core2-64-oe-linux/qtcharts=
/5.9.2+gitAUTOINC+1f47b1a7ae-r0/pseudo/pseudo.log indicates 5 errors [qa_ps=
eudo]
qtconnectivity-5.9.2+gitAUTOINC+94cc2b914a: This /work/core2-64-oe-linux/qt=
connectivity/5.9.2+gitAUTOINC+94cc2b914a-r0/pseudo/pseudo.log indicates 5 e=
rrors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+3f8ae713df: This /work/core2-64-oe-linux/qtdat=
avis3d/5.9.2+gitAUTOINC+3f8ae713df-r0/pseudo/pseudo.log indicates 5 errors =
[qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+7c45b035b9: This /work/core2-64-oe-linux/qtd=
eclarative/5.9.2+gitAUTOINC+7c45b035b9-r0/pseudo/pseudo.log indicates 14 er=
rors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+0555cf73c8: This /work/core2-64-oe-linux/qtengin=
io/5.9.2+gitAUTOINC+0555cf73c8-r0/pseudo/pseudo.log indicates 5 errors [qa_=
pseudo]
qtgamepad-5.9.2+gitAUTOINC+1fc40deed6: This /work/core2-64-oe-linux/qtgamep=
ad/5.9.2+gitAUTOINC+1fc40deed6-r0/pseudo/pseudo.log indicates 5 errors [qa_=
pseudo]
qtlocation-5.9.2+gitAUTOINC+c832af7897_9ecbe3642f: This /work/core2-64-oe-l=
inux/qtlocation/5.9.2+gitAUTOINC+c832af7897_9ecbe3642f-r0/pseudo/pseudo.log=
 indicates 79 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+343e281f0e: This /work/core2-64-oe-linux/qtmu=
ltimedia/5.9.2+gitAUTOINC+343e281f0e-r0/pseudo/pseudo.log indicates 6 error=
s [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365: This /work/armv5te-oe-linux-gnue=
abi/qtnetworkauth/5.9.2+gitAUTOINC+3d93f64365-r0/pseudo/pseudo.log indicate=
s 6 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365: This /work/core2-64-oe-linux/qtn=
etworkauth/5.9.2+gitAUTOINC+3d93f64365-r0/pseudo/pseudo.log indicates 4 err=
ors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+3d93f64365: This /work/i586-oe-linux/qtnetwo=
rkauth/5.9.2+gitAUTOINC+3d93f64365-r0/pseudo/pseudo.log indicates 7 errors =
[qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/core2-64-oe-linux/qtquick1=
/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 11 errors [qa_p=
seudo]
qtquickcontrols2-5.9.2+gitAUTOINC+63f2f55462: This /work/core2-64-oe-linux/=
qtquickcontrols2/5.9.2+gitAUTOINC+63f2f55462-r0/pseudo/pseudo.log indicates=
 5 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/core2-64-oe-linux/q=
tremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates 1=
2 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+86ee61734e: This /work/armv5e-oe-linux-gnueabi/qt=
script/5.9.2+gitAUTOINC+86ee61734e-r0/pseudo/pseudo.log indicates 4 errors =
[qa_pseudo]
qtscript-5.9.2+gitAUTOINC+86ee61734e: This /work/core2-64-oe-linux/qtscript=
/5.9.2+gitAUTOINC+86ee61734e-r0/pseudo/pseudo.log indicates 5 errors [qa_ps=
eudo]
qtscript-5.9.2+gitAUTOINC+86ee61734e: This /work/i586-oe-linux/qtscript/5.9=
.2+gitAUTOINC+86ee61734e-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo=
]
qtscxml-5.9.2+gitAUTOINC+a1dff1a11a: This /work/core2-64-oe-linux/qtscxml/5=
.9.2+gitAUTOINC+a1dff1a11a-r0/pseudo/pseudo.log indicates 5 errors [qa_pseu=
do]
qtsensors-5.9.2+gitAUTOINC+1673dbed00: This /work/core2-64-oe-linux/qtsenso=
rs/5.9.2+gitAUTOINC+1673dbed00-r0/pseudo/pseudo.log indicates 5 errors [qa_=
pseudo]
qtserialbus-5.9.2+gitAUTOINC+1d37c357c8: This /work/armv5te-oe-linux-gnueab=
i/qtserialbus/5.9.2+gitAUTOINC+1d37c357c8-r0/pseudo/pseudo.log indicates 4 =
errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+1d37c357c8: This /work/core2-64-oe-linux/qtser=
ialbus/5.9.2+gitAUTOINC+1d37c357c8-r0/pseudo/pseudo.log indicates 5 errors =
[qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+1d37c357c8: This /work/i586-oe-linux/qtserialb=
us/5.9.2+gitAUTOINC+1d37c357c8-r0/pseudo/pseudo.log indicates 8 errors [qa_=
pseudo]
qtserialport-5.9.2+gitAUTOINC+93b539140c: This /work/armv5te-oe-linux-gnuea=
bi/qtserialport/5.9.2+gitAUTOINC+93b539140c-r0/pseudo/pseudo.log indicates =
5 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+93b539140c: This /work/core2-64-oe-linux/qtse=
rialport/5.9.2+gitAUTOINC+93b539140c-r0/pseudo/pseudo.log indicates 5 error=
s [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+93b539140c: This /work/i586-oe-linux/qtserial=
port/5.9.2+gitAUTOINC+93b539140c-r0/pseudo/pseudo.log indicates 7 errors [q=
a_pseudo]
qtsvg-5.9.2+gitAUTOINC+0fcd016066: This /work/armv5te-oe-linux-gnueabi/qtsv=
g/5.9.2+gitAUTOINC+0fcd016066-r0/pseudo/pseudo.log indicates 7 errors [qa_p=
seudo]
qtsvg-5.9.2+gitAUTOINC+0fcd016066: This /work/core2-64-oe-linux/qtsvg/5.9.2=
+gitAUTOINC+0fcd016066-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+0fcd016066: This /work/i586-oe-linux/qtsvg/5.9.2+git=
AUTOINC+0fcd016066-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+f364358a81: This /work/core2-64-oe-linux/qtsyste=
ms/5.9.2+gitAUTOINC+f364358a81-r0/pseudo/pseudo.log indicates 6 errors [qa_=
pseudo]
qttools-5.9.2+gitAUTOINC+fdc5749b56: This /work/core2-64-oe-linux/qttools/5=
.9.2+gitAUTOINC+fdc5749b56-r0/pseudo/pseudo.log indicates 5 errors [qa_pseu=
do]
qtwayland-5.9.2+gitAUTOINC+7f70da6a64: This /work/core2-64-oe-linux/qtwayla=
nd/5.9.2+gitAUTOINC+7f70da6a64-r0/pseudo/pseudo.log indicates 5 errors [qa_=
pseudo]
qtwebchannel-5.9.2+gitAUTOINC+b5229df6a0: This /work/core2-64-oe-linux/qtwe=
bchannel/5.9.2+gitAUTOINC+b5229df6a0-r0/pseudo/pseudo.log indicates 5 error=
s [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54: This /work/core2-64-oe-=
linux/qtwebengine/5.9.2+gitAUTOINC+99f84ffd2c_21508b5b54-r0/pseudo/pseudo.l=
og indicates 5 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwebkit=
/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 5 errors [qa_ps=
eudo]
qtwebsockets-5.9.2+gitAUTOINC+fb71c823a7: This /work/core2-64-oe-linux/qtwe=
bsockets/5.9.2+gitAUTOINC+fb71c823a7-r0/pseudo/pseudo.log indicates 5 error=
s [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+e4016a67bb: This /work/core2-64-oe-linux/qtwebvi=
ew/5.9.2+gitAUTOINC+e4016a67bb-r0/pseudo/pseudo.log indicates 5 errors [qa_=
pseudo]
qtx11extras-5.9.2+gitAUTOINC+f65d50eb06: This /work/armv5te-oe-linux-gnueab=
i/qtx11extras/5.9.2+gitAUTOINC+f65d50eb06-r0/pseudo/pseudo.log indicates 6 =
errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+f65d50eb06: This /work/core2-64-oe-linux/qtx11=
extras/5.9.2+gitAUTOINC+f65d50eb06-r0/pseudo/pseudo.log indicates 5 errors =
[qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+fcfa824402: This /work/core2-64-oe-linux/qtx=
mlpatterns/5.9.2+gitAUTOINC+fcfa824402-r0/pseudo/pseudo.log indicates 4 err=
ors [qa_pseudo]
quagga-1.2.1: This /work/armv5te-oe-linux-gnueabi/quagga/1.2.1-r0/pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]
quagga-1.2.1: This /work/i586-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.log in=
dicates 15 errors [qa_pseudo]
radvd-2.17: This /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log in=
dicates 7 errors [qa_pseudo]
radvd-2.17: This /work/i586-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indica=
tes 7 errors [qa_pseudo]
readline-7.0: This /work/armv5te-oe-linux-gnueabi/readline/7.0-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
rsync-3.1.2: This /work/i586-oe-linux/rsync/3.1.2-r0/pseudo/pseudo.log indi=
cates 12 errors [qa_pseudo]
rsyslog-8.29.0: This /work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseud=
o/pseudo.log indicates 4 errors [qa_pseudo]
rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseud=
o.log indicates 4 errors [qa_pseudo]
rsyslog-8.29.0: This /work/i586-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.lo=
g indicates 4 errors [qa_pseudo]
samba-4.6.7: This /work/core2-64-oe-linux/samba/4.6.7-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
satyr-0.23: This /work/armv5te-oe-linux-gnueabi/satyr/0.23-r0/pseudo/pseudo=
.log indicates 10 errors [qa_pseudo]
sblim-sfcb-1.4.9: This /work/i586-oe-linux/sblim-sfcb/1.4.9-r0/pseudo/pseud=
o.log indicates 6 errors [qa_pseudo]
sblim-sfcc-2.2.8: This /work/armv5te-oe-linux-gnueabi/sblim-sfcc/2.2.8-r0/p=
seudo/pseudo.log indicates 11 errors [qa_pseudo]
scsirastools-1.6.6: This /work/i586-oe-linux/scsirastools/1.6.6-r0/pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
sed-4.2.2: This /work/armv5te-oe-linux-gnueabi/sed/4.2.2-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
sg3-utils-1.42: This /work/i586-oe-linux/sg3-utils/1.42-r0/pseudo/pseudo.lo=
g indicates 6 errors [qa_pseudo]
shadow-4.2.1: This /work/i586-oe-linux/shadow/4.2.1-r0/pseudo/pseudo.log in=
dicates 5 errors [qa_pseudo]
slang-2.3.1a: This /work/core2-64-oe-linux/slang/2.3.1a-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
snort-2.9.7.5: This /work/armv5te-oe-linux-gnueabi/snort/2.9.7.5-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
speexdsp-1.2rc3: This /work/core2-64-oe-linux/speexdsp/1.2rc3-r0/pseudo/pse=
udo.log indicates 4 errors [qa_pseudo]
sqlite3-3.20.0: This /work/core2-64-oe-linux/sqlite3/3_3.20.0-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
squid-3.5.27: This /work/armv5te-oe-linux-gnueabi/squid/3.5.27-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
squid-3.5.27: This /work/core2-64-oe-linux/squid/3.5.27-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
squid-3.5.27: This /work/i586-oe-linux/squid/3.5.27-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
sthttpd-2.27.1: This /work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
sthttpd-2.27.1: This /work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseud=
o.log indicates 4 errors [qa_pseudo]
strace-4.18: This /work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
strace-4.18: This /work/core2-64-oe-linux/strace/4.18-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
strace-4.18: This /work/i586-oe-linux/strace/4.18-r0/pseudo/pseudo.log indi=
cates 7 errors [qa_pseudo]
tcl-8.6.7: This /work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.l=
og indicates 5 errors [qa_pseudo]
tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indi=
cates 6 errors [qa_pseudo]
tcl-8.6.7: This /work/i586-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indicate=
s 8 errors [qa_pseudo]
telepathy-python-0.15.19: This /work/core2-64-oe-linux/telepathy-python/0.1=
5.19-r6/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
tftp-hpa-5.2: This /work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/ps=
eudo.log indicates 5 errors [qa_pseudo]
tipcutils-2.2.0+gitAUTOINC+7ab2211b87: This /work/qemux86_64-oe-linux/tipcu=
tils/2.2.0+gitAUTOINC+7ab2211b87-r0/pseudo/pseudo.log indicates 10 errors [=
qa_pseudo]
tomoyo-tools-2.5.0: This /work/i586-oe-linux/tomoyo-tools/2.5.0-r0/pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
ttf-gentium-1.02: This /work/all-oe-linux/ttf-gentium/1.02-r8/pseudo/pseudo=
.log indicates 10 errors [qa_pseudo]
ubi-utils-klibc-1.5.2: This /work/armv5te-oe-linux-gnueabi/ubi-utils-klibc/=
1.5.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
udisks-1.0.5: This /work/armv5te-oe-linux-gnueabi/udisks/1.0.5-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
ufw-0.33: This /work/armv5te-oe-linux-gnueabi/ufw/0.33-r0/pseudo/pseudo.log=
 indicates 5 errors [qa_pseudo]
upm-1.3.0-gitAUTOINC+106b6c7062: This /work/armv5te-oe-linux-gnueabi/upm/1.=
3.0-gitAUTOINC+106b6c7062-r0/pseudo/pseudo.log indicates 10 errors [qa_pseu=
do]
usbredir-0.7.1+gitAUTOINC+39aa3c69f6: This /work/core2-64-oe-linux/usbredir=
/0.7.1+gitAUTOINC+39aa3c69f6-r0/pseudo/pseudo.log indicates 10 errors [qa_p=
seudo]
vte-0.48.3: This /work/i586-oe-linux/vte/0.48.3-r0/pseudo/pseudo.log indica=
tes 10 errors [qa_pseudo]
weston-init-1.0: This /work/all-oe-linux/weston-init/1.0-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: This /work/all-oe-li=
nux/xcursor-transparent-theme/0.1.1+gitAUTOINC+23c8af5ba4-r0/pseudo/pseudo.=
log indicates 5 errors [qa_pseudo]
xdelta3-3.0.11: This /work/i586-oe-linux/xdelta3/3.0.11-r0/pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]
xf86-input-evdev-2.10.5: This /work/i586-oe-linux/xf86-input-evdev/2_2.10.5=
-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xf86-input-mouse-1.9.2: This /work/core2-64-oe-linux/xf86-input-mouse/2_1.9=
.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xfce4-hotcorner-plugin-0.0.2: This /work/i586-oe-linux/xfce4-hotcorner-plug=
in/0.0.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xwd-1.0.6: This /work/i586-oe-linux/xwd/1.0.6-r0/pseudo/pseudo.log indicate=
s 11 errors [qa_pseudo]
xz-5.2.3: This /work/armv5te-oe-linux-gnueabi/xz/5.2.3-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
xz-5.2.3: This /work/i586-oe-linux/xz/5.2.3-r0/pseudo/pseudo.log indicates =
12 errors [qa_pseudo]
ypbind-mt-2.4: This /work/i586-oe-linux/ypbind-mt/2.4-r0/pseudo/pseudo.log =
indicates 12 errors [qa_pseudo]
zlog-1.2.12+gitAUTOINC+13904dab28: This /work/core2-64-oe-linux/zlog/1.2.12=
+gitAUTOINC+13904dab28-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
28249c4 README: new readme file including main aspects of the project
not included in master yet:=20
3d4315c world-image: add extra target
839bccc fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
8ca61a5 bitbake.conf: add tools required by testimage to HOSTTOOLS conditio=
nally
not included in master yet:=20
d28c0cb report-error: Allow to upload reports automatically
ebe6522 buildhistory.bbclass: metadata-revs show repo parent
78735b9 metadata-revs: provide more information
a48bb4c qemux86: Add identical qemux86copy variant for tests
582876d reproducible_build.bbclass: initial support for binary reproducibil=
ity
8cde606 cpio: provide cpio-replacement-native
fa4e167 image_types.bbclass: improve cpio image reproducibility
bd99eff rootfs-postcommands.bbclass: support binary reproducibility
446dffa sstate.bbclass: Do not cause build failures due to setscene errors
caba1c2 insane.bbclass: Add do_qa_pseudo function to check for common error=
s listed in pseudo.log
633940b libsdl2: allow to build native and nativesdk
d2a2d29 libdrm: allow to build native and nativesdk
e407568 nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
aa6ce39 libepoxy: add support for native(sdk)
11acf2e libjpeg-turbo: provide nativesdk version
b58f07d virglrenderer: add new recipe
f00aa03 virglrenderer: fix target build
b19c402 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
fbb4feb insane.bbclass: use package_qa_handle_error for do_qa_pseudo

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
5c9a4a0 network-manager-applet: Disable gobject-introspection on musl
not included in master yet:=20
a3324b8 dnsmasq: disable the service by default
981436f openconnect: fix parallel compilation failure
d217c1b squid: upgrade to 3.5.27
9dead9a iproute2: Move tipc enablement to oe-core
78cd01b libmnl: Move to oe-core
e96fe1b drbd-utils: remove 0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is=
-a-module.patch
764ced9 yp-tools: Ignore cpp warnings as errors
5079d37 openl2tp: Fix build with musl/libtirpc
db1db07 spice: import from meta-cloud-services
13b5f46 spice: fix dependency on python-pyparsing, add support for native(s=
dk)
f160ead spice: fix build with FORTIFY_SOURCES already defined in native gcc
ed85de1 spice: upgrade to 0.13.90 version
4d865c9 net-snmp: check that executable is used before testing for existanc=
e
a07dbac c-ares: Build native version
7097be1 ebtables: Add HOMEPAGE info into recipe file.
9c31bed lldpd: Update to version 0.9.8
3f27b4f libauthen-radius-perl: move recipe to meta-networking
aeed5ea dnsmasq: upgrade to 2.78
2952679 python3-protobuf: add python3 version
3d72f4d python3-ujson: support Python 3
3ed87fc mdns: move from meta-intel-iot-middleware
4054ef0 Recipe for Nghttp2: HTTP/2 C Library.
99e45c6 meta-oe/conf/layer.conf: Remove &quot;id&quot; from HOSTTOOLS
0cf389b python-twisted: remove empty lore subpackage
aaeacc6 rocksdb: add version 5.8
a6efaf9 python-pytest: fix egg version of package
7cfd93b python-asn1crypto: add new package
0b9fb68 Fix gpsd Yocto pyro build for read only rootfs
a6031b4 netkit-rsh: correct the file attribute
1a7e825 usbredir: add new recipe
3cbacd5 libopus: add native and nativesdk

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
f00f79b qtxmlpatterns: Add HOMEPAGE info into recipe file.
not included in master yet:=20
2e6fb62 qt5: add missing commercial license

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
26d5066 firefox: fix build failures
not included in master yet:=20
6773bf9 meta: drop ${COREBASE}/LICENSE references</pre></pre></div>

--f403045d589819bdaa055b643c9f--
