Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id CFE4071A36;
	Fri, 20 Oct 2017 15:45:36 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id k7so11727286wre.2;
	Fri, 20 Oct 2017 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=5QeAy7eAHMyGSkk5X+afgDA4PQABo6hBqsvEPOg0+ZE=;
	b=Pva/yxNqD79QsudDu9cqOl13xrS8OIe4/T35ERuFPxq4cwhqSuVTnXuCcLV3RyYPns
	QFd/73ByI6qdo2QAIm1N6PEC2Mh5V2DSH9sPImEOw60wvVYEZlzwpg/ux62mi56J1R77
	KQPRIBoFYeQbmDt+TYtXdI5clAXId9+QvGPorRltxX/sf2eKJNMkPBfeMy8g4EAPDzMr
	nA8wxMv+O0Ze+eIgB+YNPS2vc2593flb8ttFmVjmHGgqbX2zF1521mSe7lM3vJuSrqFr
	DaTaAvDj3rInAe69OyLOpLkcX1o//Exg+t9UQytaqzGINpAsebFHevh+INSt/iVVlIel
	pqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=5QeAy7eAHMyGSkk5X+afgDA4PQABo6hBqsvEPOg0+ZE=;
	b=sDLstCSUw4pOXtN79w1AEE4eBsn/o7WbYvv3KykS1vSs6WwogwjnaWPrPKinFs/dp6
	MY56VbMGemXgZJIO/13FwuF2PXt0+NDeKTdvQAjqFO71tpJXFd6Zd/Pjsi7+zKLzOM+s
	udnAtEYy7A4oBPio+wGc2aTZi+SgG01QEBl6oxuW4S9W3kzH5odfDO+aq2GYjFCuZKuq
	3RsYDwuBrknebX6y47/8aVZ3LUXfL7JXae1a3zZuvMZGckYHzVswdwlhlKxpGWS96wef
	4Q0vuoQAmcmXMI41H22vg3ADBjqkaofcgBcDUTHbWX7JGY7sCJsXchQat9OYr8ZUJdJm
	3P2A==
X-Gm-Message-State: AMCzsaXPajghcnKwmXR92ulOX23WovsPjoxbUVQ/nUUEI2Iyv/+yw/nj
	3cGVofCRwsYEtc7jfWuVY1r0uFQ87s1sTvFmMTAnqg==
X-Google-Smtp-Source: ABhQp+Sslf7a6+9Fb9sZJZi0cYzrLvNV7JaMe41m8vJoQKsGse2PSJGojgL0IqGxQvPfoZaCzagcA8aOm8k0jVwMiRQ=
X-Received: by 10.223.155.203 with SMTP id e11mr4630622wrc.104.1508514335770; 
	Fri, 20 Oct 2017 08:45:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Fri, 20 Oct 2017 08:45:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Oct 2017 17:45:35 +0200
Message-ID: <CA+chaQfviOp18fjb_3P80xehGTxAJT7nK5BqKFgMgFpi--jjJQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-10-18
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
X-List-Received-Date: Fri, 20 Oct 2017 15:45:37 -0000
Content-Type: multipart/alternative; boundary="94eb2c1b4f141f4dff055bfc5d39"

--94eb2c1b4f141f4dff055bfc5d39
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

||2017-10-18	||4	||1	||1	||0	||0		||0		||3		||0		||0		||35		||3		||0		||0		=
||0		||0		||0		||0		||0		||385		||
|}

=3D=3D Failed tasks 2017-10-18 =3D=3D

INFO: jenkins-job.sh-1.8.35 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171019_14=
3552.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_package_qa
    * meta-qt5/recipes-qt/qt5/qtscript_git.bb:do_package_qa
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_pac=
kage_qa

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package=
_qa

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa

=3D=3D=3D Number of failed tasks (6) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.2017=
1017_014539.log/
|| http://errors.yoctoproject.org/Errors/Build/47579/
|-
|| qemux86 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.2017=
1017_014539.log/
|| http://errors.yoctoproject.org/Errors/Build/47582/
|-
|| qemux86_64 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.2=
0171018_073541.log/
|| http://errors.yoctoproject.org/Errors/Build/47597/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (426) =3D=3D=3D
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
||35	||version-going-backwards
|-
||385	||qa_pseudo
|-
||3	||host-user-contaminated
|-
||3	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20171018_030715.log/

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


count: 35	issue: version-going-backwards
fluidsynth-1.1.6: Package version for package fluidsynth-bin went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.12) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-bin went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.14) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-dbg went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.12) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-dbg went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.14) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-dev went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.12) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-dev went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.14) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-doc went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.12) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-doc went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.14) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-locale went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.12) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-locale went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.14) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-staticdev
went backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.12) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-staticdev
went backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.14) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.12) [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth went
backwards which would break package feeds from (0:1.1.8-r0.0 to
0:1.1.6-r0.14) [version-going-backwards]
squid-3.5.26: Package version for package squid-dbg went backwards
which would break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4)
[version-going-backwards]
squid-3.5.26: Package version for package squid-dbg went backwards
which would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3)
[version-going-backwards]
squid-3.5.26: Package version for package squid-dbg went backwards
which would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5)
[version-going-backwards]
squid-3.5.26: Package version for package squid-dev went backwards
which would break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4)
[version-going-backwards]
squid-3.5.26: Package version for package squid-dev went backwards
which would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3)
[version-going-backwards]
squid-3.5.26: Package version for package squid-dev went backwards
which would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5)
[version-going-backwards]
squid-3.5.26: Package version for package squid-doc went backwards
which would break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4)
[version-going-backwards]
squid-3.5.26: Package version for package squid-doc went backwards
which would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3)
[version-going-backwards]
squid-3.5.26: Package version for package squid-doc went backwards
which would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5)
[version-going-backwards]
squid-3.5.26: Package version for package squid-locale went backwards
which would break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4)
[version-going-backwards]
squid-3.5.26: Package version for package squid-locale went backwards
which would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3)
[version-going-backwards]
squid-3.5.26: Package version for package squid-locale went backwards
which would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5)
[version-going-backwards]
squid-3.5.26: Package version for package squid-ptest went backwards
which would break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4)
[version-going-backwards]
squid-3.5.26: Package version for package squid-ptest went backwards
which would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3)
[version-going-backwards]
squid-3.5.26: Package version for package squid-ptest went backwards
which would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5)
[version-going-backwards]
squid-3.5.26: Package version for package squid-staticdev went
backwards which would break package feeds from (0:3.5.27-r0.6 to
0:3.5.26-r0.4) [version-going-backwards]
squid-3.5.26: Package version for package squid-staticdev went
backwards which would break package feeds from (0:3.5.27-r0.8 to
0:3.5.26-r0.3) [version-going-backwards]
squid-3.5.26: Package version for package squid-staticdev went
backwards which would break package feeds from (0:3.5.27-r0.8 to
0:3.5.26-r0.5) [version-going-backwards]
squid-3.5.26: Package version for package squid went backwards which
would break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4)
[version-going-backwards]
squid-3.5.26: Package version for package squid went backwards which
would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3)
[version-going-backwards]
squid-3.5.26: Package version for package squid went backwards which
would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5)
[version-going-backwards]


count: 3	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ms-my/usr/lib/locale/ms_MY/LC_COLLATE is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: qtbase:
/qtbase-dev/usr/lib/cmake/Qt5Gui/Qt5Gui_QJpegPlugin.cmake is owned by
uid 3004, which is the same as the user running bitbake. This may be
due to host contamination [host-user-contaminated]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: qtscript:
/qtscript-mkspecs/usr/lib/qt5/mkspecs/modules/qt_lib_script.pri is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option

count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



count: 385	issue: qa_pseudo
abiword-3.0.2: This
/work/core2-64-oe-linux/abiword/3.0.2-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
acl-2.2.52: This
/work/core2-64-oe-linux/acl/2.2.52-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
acl-2.2.52: This /work/i586-oe-linux/acl/2.2.52-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
acpitool-0.5.1: This
/work/core2-64-oe-linux/acpitool/0.5.1-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
adduser-3.116: This
/work/i586-oe-linux/adduser/3.116-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
alsa-tools-1.1.3: This
/work/core2-64-oe-linux/alsa-tools/1.1.3-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
apache2-2.4.27: This
/work/armv5te-oe-linux-gnueabi/apache2/2.4.27-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
apache2-2.4.27: This
/work/core2-64-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]
apache2-2.4.27: This
/work/i586-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
atftp-0.7.1+gitAUTOINC+be3291a18c: This
/work/core2-64-oe-linux/atftp/0.7.1+gitAUTOINC+be3291a18c-r3/pseudo/pseudo.=
log
indicates 10 errors [qa_pseudo]
attr-2.4.47: This
/work/core2-64-oe-linux/attr/2.4.47-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
aufs-util-4.4+gitAUTOINC+89afb1806c: This
/work/i586-oe-linux/aufs-util/4.4+gitAUTOINC+89afb1806c-r0/pseudo/pseudo.lo=
g
indicates 10 errors [qa_pseudo]
autofs-5.1.2: This
/work/core2-64-oe-linux/autofs/5.1.2-r0/pseudo/pseudo.log indicates 16
errors [qa_pseudo]
beecrypt-4.2.1: This
/work/core2-64-oe-linux/beecrypt/4.2.1-r3/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
bluez5-5.46: This
/work/armv5te-oe-linux-gnueabi/bluez5/5.46-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
bluez5-5.46: This
/work/core2-64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
bluez5-5.46: This /work/i586-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
cairo-1.14.10: This
/work/core2-64-oe-linux/cairo/1.14.10-r0/pseudo/pseudo.log indicates
16 errors [qa_pseudo]
cherokee-1.2.104+gitAUTOINC+75f041e225: This
/work/core2-64-oe-linux/cherokee/1.2.104+gitAUTOINC+75f041e225-r0/pseudo/ps=
eudo.log
indicates 10 errors [qa_pseudo]
chrony-2.4: This
/work/armv5te-oe-linux-gnueabi/chrony/2.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
chrony-2.4: This
/work/core2-64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
chrony-2.4: This /work/i586-oe-linux/chrony/2.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
collectd-5.7.2: This
/work/armv5te-oe-linux-gnueabi/collectd/5.7.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
collectd-5.7.2: This
/work/core2-64-oe-linux/collectd/5.7.2-r0/pseudo/pseudo.log indicates
16 errors [qa_pseudo]
conntrack-tools-1.4.4: This
/work/core2-64-oe-linux/conntrack-tools/1.4.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
conntrack-tools-1.4.4: This
/work/i586-oe-linux/conntrack-tools/1.4.4-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
corosync-2.4.2: This
/work/i586-oe-linux/corosync/2.4.2-r0/pseudo/pseudo.log indicates 16
errors [qa_pseudo]
cryptodev-tests-1.9: This
/work/armv5te-oe-linux-gnueabi/cryptodev-tests/1.9-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
curlpp-0.8.1: This
/work/armv5te-oe-linux-gnueabi/curlpp/0.8.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
curlpp-0.8.1: This
/work/core2-64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
curlpp-0.8.1: This
/work/i586-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
cxxtest-4.3: This
/work/armv5te-oe-linux-gnueabi/cxxtest/4.3-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
cxxtest-4.3: This /work/i586-oe-linux/cxxtest/4.3-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
daemontools-0.76: This
/work/core2-64-oe-linux/daemontools/0.76-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This
/work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
dhcp-4.3.6: This /work/i586-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
diffutils-3.6: This
/work/armv5te-oe-linux-gnueabi/diffutils/3.6-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
diffutils-3.6: This
/work/core2-64-oe-linux/diffutils/3.6-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
dlm-4.0.2: This
/work/armv5te-oe-linux-gnueabi/dlm/4.0.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
dnf-2.6.3: This /work/core2-64-oe-linux/dnf/2.6.3-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
dovecot-2.2.29: This
/work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
dovecot-2.2.29: This
/work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates
11 errors [qa_pseudo]
dovecot-2.2.29: This
/work/i586-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
dracut-045+git39c9b67f86145953aa30def9d77c68597a4ccfe8: This
/work/i586-oe-linux/dracut/1_045+git39c9b67f86145953aa30def9d77c68597a4ccfe=
8-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
ebtables-2.0.10-4: This
/work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-r4/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
ebtables-2.0.10-4: This
/work/core2-64-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This
/work/i586-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
espeak-1.48.04: This
/work/armv5te-oe-linux-gnueabi/espeak/1.48.04-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: This
/work/armv5te-oe-linux-gnueabi/evolution-data-server/3.2.3+gitAUTOINC+a9e4e=
74ec4-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
exfat-utils-1.2.3: This
/work/i586-oe-linux/exfat-utils/1.2.3-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
expat-2.2.3: This /work/i586-oe-linux/expat/2.2.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
expect-5.45: This
/work/armv5te-oe-linux-gnueabi/expect/5.45-r1/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
flashrom-0.9.9: This
/work/core2-64-oe-linux/flashrom/0.9.9-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
foomatic-filters-4.0.17: This
/work/i586-oe-linux/foomatic-filters/4.0.17-r1/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
fstests-0.1+gitAUTOINC+e5939ff608: This
/work/core2-64-oe-linux/fstests/0.1+gitAUTOINC+e5939ff608-r0/pseudo/pseudo.=
log
indicates 10 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This
/work/armv5te-oe-linux-gnueabi/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/=
pseudo.log
indicates 4 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This
/work/core2-64-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.=
log
indicates 4 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This
/work/i586-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
geoipupdate-2.4.0: This
/work/armv5te-oe-linux-gnueabi/geoipupdate/2.4.0-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
glib-2.0-2.52.3: This
/work/armv5e-oe-linux-gnueabi/glib-2.0/1_2.52.3-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
glib-2.0-2.52.3: This
/work/i586-oe-linux/glib-2.0/1_2.52.3-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
glibc-2.26: This
/work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
glibc-2.26: This
/work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
glibc-2.26: This /work/i586-oe-linux/glibc/2.26-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
glibc-locale-2.26: This
/work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
glibc-locale-2.26: This
/work/i586-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates
14 errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/armv5te-oe-linux-gnueabi/gobject-introspection/1.52.1-r0/pseudo/pseud=
o.log
indicates 11 errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/core2-64-oe-linux/gobject-introspection/1.52.1-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/i586-oe-linux/gobject-introspection/1.52.1-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
gsettings-desktop-schemas-3.22.0: This
/work/i586-oe-linux/gsettings-desktop-schemas/3.22.0-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
gsoap-2.8.51: This
/work/core2-64-oe-linux/gsoap/2.8.51-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
gstreamer1.0-plugins-good-1.12.2: This
/work/i586-oe-linux/gstreamer1.0-plugins-good/1.12.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
gtk+3-3.22.17: This
/work/core2-64-oe-linux/gtk+3/3.22.17-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
hdparm-9.52: This /work/i586-oe-linux/hdparm/9.52-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
icu-59.1: This /work/armv5e-oe-linux-gnueabi/icu/59.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
icu-59.1: This /work/core2-64-oe-linux/icu/59.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
icu-59.1: This /work/i586-oe-linux/icu/59.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
inetutils-1.9.4: This
/work/i586-oe-linux/inetutils/1.9.4-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
iotop-0.6: This /work/core2-64-oe-linux/iotop/0.6-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
iozone3-465: This
/work/core2-64-oe-linux/iozone3/465-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
iptables-1.6.1: This
/work/core2-64-oe-linux/iptables/1.6.1-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
iscsi-initiator-utils-2.0.874: This
/work/armv5te-oe-linux-gnueabi/iscsi-initiator-utils/2.0.874-r0/pseudo/pseu=
do.log
indicates 16 errors [qa_pseudo]
isomd5sum-1.2.1: This
/work/i586-oe-linux/isomd5sum/1.2.1-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
json-spirit-4.08: This
/work/core2-64-oe-linux/json-spirit/4.08-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
kmscube-git: This /work/i586-oe-linux/kmscube/git-r0/pseudo/pseudo.log
indicates 9 errors [qa_pseudo]
krb5-1.15.1: This
/work/core2-64-oe-linux/krb5/1.15.1-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
l3afpad-0.8.18.1.11+gitAUTOINC+3cdccdc950: This
/work/core2-64-oe-linux/l3afpad/0.8.18.1.11+gitAUTOINC+3cdccdc950-r0/pseudo=
/pseudo.log
indicates 10 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This
/work/armv5te-oe-linux-gnueabi/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseud=
o/pseudo.log
indicates 10 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This
/work/core2-64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseud=
o.log
indicates 11 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This
/work/i586-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.lo=
g
indicates 10 errors [qa_pseudo]
lcov-1.11: This /work/core2-64-oe-linux/lcov/1.11-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
libatasmart-0.19: This
/work/armv5te-oe-linux-gnueabi/libatasmart/0.19-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libatasmart-0.19: This
/work/i586-oe-linux/libatasmart/0.19-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
libburn-1.4.0: This
/work/core2-64-oe-linux/libburn/1.4.0-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
libcanberra-0.30: This
/work/i586-oe-linux/libcanberra/0.30-r0/pseudo/pseudo.log indicates 16
errors [qa_pseudo]
libcdio-0.93: This
/work/core2-64-oe-linux/libcdio/0.93-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r=
0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/core2-64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseud=
o/pseudo.log
indicates 12 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/i586-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/ps=
eudo.log
indicates 11 errors [qa_pseudo]
libgnomecanvas-2.30.3: This
/work/armv5te-oe-linux-gnueabi/libgnomecanvas/2.30.3-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
libhtml-parser-perl-3.72: This
/work/i586-oe-linux/libhtml-parser-perl/3.72-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libmbim-1.14.0: This
/work/armv5te-oe-linux-gnueabi/libmbim/1.14.0-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
libmbim-1.14.0: This
/work/i586-oe-linux/libmbim/1.14.0-r0/pseudo/pseudo.log indicates 16
errors [qa_pseudo]
libmemcached-1.0.18: This
/work/armv5te-oe-linux-gnueabi/libmemcached/1.0.18-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libmemcached-1.0.18: This
/work/i586-oe-linux/libmemcached/1.0.18-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
libmime-types-perl-2.13: This
/work/i586-oe-linux/libmime-types-perl/2.13-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libmodule-runtime-perl-0.015: This
/work/i586-oe-linux/libmodule-runtime-perl/0.015-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libomxil-0.9.3: This
/work/armv5te-oe-linux-gnueabi/libomxil/0.9.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/armv5te-oe-linux-gnueabi/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pse=
udo/pseudo.log
indicates 11 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/core2-64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pse=
udo.log
indicates 10 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/i586-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.=
log
indicates 11 errors [qa_pseudo]
librcf-2.2.0.0: This
/work/core2-64-oe-linux/librcf/2.2.0.0-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
libtasn1-4.12: This
/work/core2-64-oe-linux/libtasn1/4.12-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
libtool-2.4.6: This
/work/armv5te-oe-linux-gnueabi/libtool/2.4.6-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
libtool-cross-2.4.6: This
/work/core2-64-oe-linux/libtool-cross/2.4.6-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This
/work/i586-oe-linux/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
libuser-0.62: This
/work/core2-64-oe-linux/libuser/0.62-r0/pseudo/pseudo.log indicates 16
errors [qa_pseudo]
libvncserver-0.9.11: This
/work/armv5te-oe-linux-gnueabi/libvncserver/0.9.11-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
libvncserver-0.9.11: This
/work/core2-64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
libvncserver-0.9.11: This
/work/i586-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates
11 errors [qa_pseudo]
libwmf-0.2.8.4: This
/work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
libwmf-0.2.8.4: This
/work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates
11 errors [qa_pseudo]
libwmf-0.2.8.4: This
/work/i586-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
libx11-1.6.5: This
/work/core2-64-oe-linux/libx11/1_1.6.5-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
libxscrnsaver-1.2.2: This
/work/armv5te-oe-linux-gnueabi/libxscrnsaver/1_1.2.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This
/work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This
/work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
lirc-0.9.4d: This /work/i586-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
llvm-5.0: This /work/armv5e-oe-linux-gnueabi/llvm/5.0-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
llvm-5.0: This /work/i586-oe-linux/llvm/5.0-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This
/work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This
/work/i586-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
lttng-tools-2.9.5: This
/work/core2-64-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
lttng-tools-2.9.5: This
/work/i586-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
lvm2-2.02.171: This
/work/armv5te-oe-linux-gnueabi/lvm2/2.02.171-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/armv5te-oe-linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b=
10de1-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r=
0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/i586-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/ps=
eudo/pseudo.log
indicates 13 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This
/work/armv5te-oe-linux-gnueabi/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485=
926-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This
/work/i586-oe-linux/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseu=
do/pseudo.log
indicates 17 errors [qa_pseudo]
menulibre-2.1.3: This
/work/armv5te-oe-linux-gnueabi/menulibre/2.1.3-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
meson-0.40.1: This
/work/armv5te-oe-linux-gnueabi/meson/0.40.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
meson-0.40.1: This
/work/core2-64-oe-linux/meson/0.40.1-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
mosquitto-1.4.14: This
/work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This
/work/i586-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
mozilla-devscripts-0.30: This
/work/core2-64-oe-linux/mozilla-devscripts/0.30-r1/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mpd-0.19.21: This /work/i586-oe-linux/mpd/0.19.21-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
mpg123-1.25.6: This
/work/armv5e-oe-linux-gnueabi/mpg123/1.25.6-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
mpich-3.2: This /work/core2-64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
mpich-3.2: This /work/i586-oe-linux/mpich/3.2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
multipath-tools-0.7.1: This
/work/core2-64-oe-linux/multipath-tools/0.7.1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
netdata-1.6.0+gitAUTOINC+f5fa346a18: This
/work/i586-oe-linux/netdata/1.6.0+gitAUTOINC+f5fa346a18-r0/pseudo/pseudo.lo=
g
indicates 10 errors [qa_pseudo]
netkit-rpc-0.17: This
/work/core2-64-oe-linux/netkit-rpc/0.17-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/i586-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
nettle-3.3: This
/work/core2-64-oe-linux/nettle/3.3-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
nginx-1.12.1: This
/work/armv5te-oe-linux-gnueabi/nginx/1.12.1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
nginx-1.12.1: This
/work/core2-64-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.log indicates 13
errors [qa_pseudo]
nginx-1.12.1: This
/work/i586-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
nss-3.31.1: This
/work/core2-64-oe-linux/nss/3.31.1-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
ntp-4.2.8p10: This
/work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
ntp-4.2.8p10: This
/work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
ntp-4.2.8p10: This
/work/i586-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
numactl-2.0.11+gitAUTOINC+ea3a70681c: This
/work/i586-oe-linux/numactl/2.0.11+gitAUTOINC+ea3a70681c-r0/pseudo/pseudo.l=
og
indicates 9 errors [qa_pseudo]
nuttcp-7.2.1: This
/work/armv5te-oe-linux-gnueabi/nuttcp/7.2.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
openflow-1.0+gitAUTOINC+c84f33f09d: This
/work/armv5te-oe-linux-gnueabi/openflow/1.0+gitAUTOINC+c84f33f09d-r0/pseudo=
/pseudo.log
indicates 10 errors [qa_pseudo]
openl2tp-1.8: This
/work/i586-oe-linux/openl2tp/1.8-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
openlmi-tools-0.10.5: This
/work/core2-64-oe-linux/openlmi-tools/0.10.5-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
opensaf-5.17.07: This
/work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pseudo/pseudo.log
indicates 21 errors [qa_pseudo]
opensaf-5.17.07: This
/work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates
13 errors [qa_pseudo]
opensaf-5.17.07: This
/work/i586-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 18
errors [qa_pseudo]
openssh-7.5p1: This
/work/armv5te-oe-linux-gnueabi/openssh/7.5p1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
openssh-7.5p1: This
/work/core2-64-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.log indicates
17 errors [qa_pseudo]
openssh-7.5p1: This
/work/i586-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.log indicates 17
errors [qa_pseudo]
openwsman-2.6.3: This
/work/core2-64-oe-linux/openwsman/2.6.3-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
ossp-uuid-1.6.2: This
/work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
ossp-uuid-1.6.2: This
/work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates
5 errors [qa_pseudo]
ossp-uuid-1.6.2: This
/work/i586-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
pax-utils-1.2.2: This
/work/core2-64-oe-linux/pax-utils/1.2.2-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
pcmanfm-1.2.5: This
/work/armv5te-oe-linux-gnueabi/pcmanfm/1.2.5-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
perf-1.0: This /work/qemux86_64-oe-linux/perf/1.0-r9/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
perl-5.24.1: This
/work/armv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
perl-5.24.1: This
/work/core2-64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
perl-5.24.1: This /work/i586-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
php-7.1.9: This
/work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux/php/7.1.9-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
phytool-1.0.1+gitAUTOINC+3149bfdb4f: This
/work/armv5te-oe-linux-gnueabi/phytool/1.0.1+gitAUTOINC+3149bfdb4f-r0/pseud=
o/pseudo.log
indicates 10 errors [qa_pseudo]
picocom-2.2+gitAUTOINC+deffd18c24: This
/work/i586-oe-linux/picocom/2.2+gitAUTOINC+deffd18c24-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
pm-qa-0.5.2: This
/work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/pseudo.log
indicates 34 errors [qa_pseudo]
pm-qa-0.5.2: This
/work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 30
errors [qa_pseudo]
pm-qa-0.5.2: This /work/i586-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log
indicates 33 errors [qa_pseudo]
pmtools-20130209+gitAUTOINC+3ebe0e54c5: This
/work/core2-64-oe-linux/pmtools/20130209+gitAUTOINC+3ebe0e54c5-r0/pseudo/ps=
eudo.log
indicates 10 errors [qa_pseudo]
pm-utils-1.4.1: This
/work/core2-64-oe-linux/pm-utils/1.4.1-r1/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
pm-utils-1.4.1: This
/work/i586-oe-linux/pm-utils/1.4.1-r1/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
poco-1.7.9: This
/work/armv5te-oe-linux-gnueabi/poco/1.7.9-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
poppler-0.57.0: This
/work/core2-64-oe-linux/poppler/0.57.0-r0/pseudo/pseudo.log indicates
16 errors [qa_pseudo]
portaudio-v19-v190600: This
/work/armv5te-oe-linux-gnueabi/portaudio-v19/v190600-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
portaudio-v19-v190600: This
/work/core2-64-oe-linux/portaudio-v19/v190600-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
postfix-3.2.2: This
/work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
postfix-3.2.2: This
/work/core2-64-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
postfix-3.2.2: This
/work/i586-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
postgresql-9.4.13: This
/work/armv5e-oe-linux-gnueabi/postgresql/9.4.13-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
postgresql-9.4.13: This
/work/core2-64-oe-linux/postgresql/9.4.13-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
postgresql-9.4.13: This
/work/i586-oe-linux/postgresql/9.4.13-r0/pseudo/pseudo.log indicates
11 errors [qa_pseudo]
ppp-2.4.7: This /work/core2-64-oe-linux/ppp/2.4.7-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
proftpd-1.3.6: This
/work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
proftpd-1.3.6: This
/work/i586-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
pxaregs-1.14: This
/work/core2-64-oe-linux/pxaregs/1.14-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
python-2.7.13: This
/work/armv5te-oe-linux-gnueabi/python/2.7.13-r1/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
python-2.7.13: This
/work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
python-2.7.13: This
/work/i586-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
python3-3.5.3: This
/work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates
5 errors [qa_pseudo]
python3-3.5.3: This
/work/i586-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
python3-chardet-3.0.4: This
/work/core2-64-oe-linux/python3-chardet/3.0.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-docutils-0.14: This
/work/core2-64-oe-linux/python3-docutils/0.14-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-flask-0.12.2: This
/work/core2-64-oe-linux/python3-flask/0.12.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
python3-flask-0.12.2: This
/work/i586-oe-linux/python3-flask/0.12.2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pip-9.0.1: This
/work/armv5te-oe-linux-gnueabi/python3-pip/9.0.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pip-9.0.1: This
/work/core2-64-oe-linux/python3-pip/9.0.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This
/work/armv5te-oe-linux-gnueabi/python3-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This
/work/core2-64-oe-linux/python3-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This
/work/i586-oe-linux/python3-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pytest-3.2.2: This
/work/core2-64-oe-linux/python3-pytest/3.2.2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pyudev-0.21.0: This
/work/armv5te-oe-linux-gnueabi/python3-pyudev/0.21.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pyyaml-3.12: This
/work/armv5te-oe-linux-gnueabi/python3-pyyaml/3.12-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
python3-zopeinterface-4.4.3: This
/work/i586-oe-linux/python3-zopeinterface/4.4.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
python-behave-1.2.5: This
/work/armv5te-oe-linux-gnueabi/python-behave/1.2.5-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-behave-1.2.5: This
/work/i586-oe-linux/python-behave/1.2.5-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
python-chardet-3.0.4: This
/work/armv5te-oe-linux-gnueabi/python-chardet/3.0.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-chardet-3.0.4: This
/work/core2-64-oe-linux/python-chardet/3.0.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-cpuset-1.5.7: This
/work/core2-64-oe-linux/python-cpuset/1.5.7-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-django-1.11.5: This
/work/armv5te-oe-linux-gnueabi/python-django/1.11.5-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-docutils-0.14rc2: This
/work/core2-64-oe-linux/python-docutils/0.14rc2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-flask-0.12.2: This
/work/core2-64-oe-linux/python-flask/0.12.2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-humanize-0.5.1: This
/work/i586-oe-linux/python-humanize/0.5.1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
python-imaging-1.1.7: This
/work/core2-64-oe-linux/python-imaging/1.1.7-r5/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-imaging-1.1.7: This
/work/i586-oe-linux/python-imaging/1.1.7-r5/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-jsonschema-2.6.0: This
/work/armv5te-oe-linux-gnueabi/python-jsonschema/2.6.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-nose-1.3.7: This
/work/armv5te-oe-linux-gnueabi/python-nose/1.3.7-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pip-9.0.1: This
/work/armv5te-oe-linux-gnueabi/python-pip/9.0.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pycrypto-2.6.1: This
/work/i586-oe-linux/python-pycrypto/2.6.1-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This
/work/armv5te-oe-linux-gnueabi/python-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
python-pylint-1.7.4: This
/work/core2-64-oe-linux/python-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This
/work/i586-oe-linux/python-pylint/1.7.4-r0/pseudo/pseudo.log indicates
4 errors [qa_pseudo]
python-pysqlite-2.8.3: This
/work/i586-oe-linux/python-pysqlite/2.8.3-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
python-snimpy-0.8.11: This
/work/core2-64-oe-linux/python-snimpy/0.8.11-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-snimpy-0.8.11: This
/work/i586-oe-linux/python-snimpy/0.8.11-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-twisted-17.9.0: This
/work/core2-64-oe-linux/python-twisted/17.9.0-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-vobject-0.9.5: This
/work/i586-oe-linux/python-vobject/0.9.5-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-wcwidth-0.1.7: This
/work/i586-oe-linux/python-wcwidth/0.1.7-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qemu-2.10.0: This
/work/armv5te-oe-linux-gnueabi/qemu/2.10.0-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qemu-2.10.0: This
/work/core2-64-oe-linux/qemu/2.10.0-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
qemu-2.10.0: This /work/i586-oe-linux/qemu/2.10.0-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/p=
seudo.log
indicates 12 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/core2-64-oe-linux/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.l=
og
indicates 30 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/i586-oe-linux/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qt5-creator-3.5.1: This
/work/core2-64-oe-linux/qt5-creator/3.5.1-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qt5-creator-3.5.1: This
/work/i586-oe-linux/qt5-creator/3.5.1-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This
/work/armv5te-oe-linux-gnueabi/qtbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo=
/pseudo.log
indicates 15 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This
/work/core2-64-oe-linux/qtbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo=
.log
indicates 21 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This
/work/i586-oe-linux/qtbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/armv5te-oe-linux-gnueabi/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseu=
do/pseudo.log
indicates 13 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/core2-64-oe-linux/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseu=
do.log
indicates 11 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/armv5te-oe-linux-gnueabi/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r=
0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/i586-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/ps=
eudo.log
indicates 19 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This
/work/armv5te-oe-linux-gnueabi/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/p=
seudo/pseudo.log
indicates 10 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This
/work/core2-64-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/p=
seudo.log
indicates 14 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This
/work/i586-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseud=
o.log
indicates 11 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/armv5te-oe-linux-gnueabi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0=
/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/core2-64-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo=
/pseudo.log
indicates 16 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/i586-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pse=
udo.log
indicates 17 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/armv5te-oe-linux-gnueabi/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pse=
udo/pseudo.log
indicates 11 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/core2-64-oe-linux/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pse=
udo.log
indicates 11 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/i586-oe-linux/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.=
log
indicates 10 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/armv5te-oe-linux-gnueabi/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pse=
udo/pseudo.log
indicates 14 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/i586-oe-linux/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.=
log
indicates 10 errors [qa_pseudo]
qtimageformats-5.9.2+gitAUTOINC+dc6dc3b088: This
/work/core2-64-oe-linux/qtimageformats/5.9.2+gitAUTOINC+dc6dc3b088-r0/pseud=
o/pseudo.log
indicates 16 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/armv5te-oe-linux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633=
072fc-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/core2-64-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r=
0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/i586-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/ps=
eudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/armv5te-oe-linux-gnueabi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/=
pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/core2-64-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/=
pseudo.log
indicates 11 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/i586-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseu=
do.log
indicates 14 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This
/work/armv5te-oe-linux-gnueabi/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0=
/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This
/work/core2-64-oe-linux/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo=
/pseudo.log
indicates 12 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This
/work/i586-oe-linux/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pse=
udo.log
indicates 4 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/armv5te-oe-linux-gnueabi/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseu=
do/pseudo.log
indicates 18 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/core2-64-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseu=
do.log
indicates 17 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/i586-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.l=
og
indicates 40 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/core2-64-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pse=
udo/pseudo.log
indicates 11 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/i586-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/=
pseudo.log
indicates 10 errors [qa_pseudo]
qtquickcontrols-5.9.2+gitAUTOINC+8476f8fff7: This
/work/i586-oe-linux/qtquickcontrols/5.9.2+gitAUTOINC+8476f8fff7-r0/pseudo/p=
seudo.log
indicates 10 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/armv5te-oe-linux-gnueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-=
r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/core2-64-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseu=
do/pseudo.log
indicates 11 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/i586-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/p=
seudo.log
indicates 11 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This
/work/armv5e-oe-linux-gnueabi/qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseud=
o/pseudo.log
indicates 11 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This
/work/core2-64-oe-linux/qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseu=
do.log
indicates 10 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This
/work/i586-oe-linux/qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.l=
og
indicates 10 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/armv5te-oe-linux-gnueabi/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseud=
o/pseudo.log
indicates 12 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/core2-64-oe-linux/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseud=
o.log
indicates 10 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/i586-oe-linux/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.lo=
g
indicates 11 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/armv5te-oe-linux-gnueabi/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pse=
udo/pseudo.log
indicates 11 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/core2-64-oe-linux/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pse=
udo.log
indicates 12 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/i586-oe-linux/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.=
log
indicates 11 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This
/work/armv5te-oe-linux-gnueabi/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/p=
seudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This
/work/core2-64-oe-linux/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/p=
seudo.log
indicates 11 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This
/work/i586-oe-linux/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseud=
o.log
indicates 11 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This
/work/armv5te-oe-linux-gnueabi/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/=
pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This
/work/core2-64-oe-linux/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/=
pseudo.log
indicates 4 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This
/work/i586-oe-linux/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseu=
do.log
indicates 5 errors [qa_pseudo]
qtsmarthome-1.0: This
/work/i586-oe-linux/qtsmarthome/1.0-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This
/work/armv5te-oe-linux-gnueabi/qtsvg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/=
pseudo.log
indicates 11 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This
/work/i586-oe-linux/qtsvg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/armv5te-oe-linux-gnueabi/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pse=
udo/pseudo.log
indicates 11 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/core2-64-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pse=
udo.log
indicates 10 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/i586-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.=
log
indicates 12 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/armv5te-oe-linux-gnueabi/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseud=
o/pseudo.log
indicates 11 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/core2-64-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseud=
o.log
indicates 10 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/i586-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.lo=
g
indicates 11 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This
/work/core2-64-oe-linux/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pse=
udo.log
indicates 14 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This
/work/i586-oe-linux/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.=
log
indicates 11 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/armv5te-oe-linux-gnueabi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/=
pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/core2-64-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/=
pseudo.log
indicates 12 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/i586-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseu=
do.log
indicates 11 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/core2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-=
r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/i586-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/p=
seudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/armv5e-oe-linux-gnueabi/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseud=
o/pseudo.log
indicates 10 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/core2-64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseu=
do.log
indicates 14 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/i586-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.l=
og
indicates 14 errors [qa_pseudo]
qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This
/work/armv5te-oe-linux-gnueabi/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b6=
0-r0/pseudo/pseudo.log
indicates 20 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/armv5te-oe-linux-gnueabi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/=
pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/core2-64-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/=
pseudo.log
indicates 13 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/i586-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseu=
do.log
indicates 13 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pse=
udo.log
indicates 10 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/i586-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.=
log
indicates 11 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This
/work/armv5te-oe-linux-gnueabi/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/p=
seudo/pseudo.log
indicates 5 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This
/work/core2-64-oe-linux/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/p=
seudo.log
indicates 5 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This
/work/i586-oe-linux/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseud=
o.log
indicates 5 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/armv5te-oe-linux-gnueabi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0=
/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/core2-64-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo=
/pseudo.log
indicates 12 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/i586-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pse=
udo.log
indicates 11 errors [qa_pseudo]
quagga-1.2.1: This
/work/armv5te-oe-linux-gnueabi/quagga/1.2.1-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
quagga-1.2.1: This
/work/core2-64-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.log indicates 13
errors [qa_pseudo]
quagga-1.2.1: This
/work/i586-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
quilt-0.65: This /work/i586-oe-linux/quilt/0.65-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
radvd-2.17: This
/work/armv5te-oe-linux-gnueabi/radvd/2.17-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
radvd-2.17: This
/work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
radvd-2.17: This /work/i586-oe-linux/radvd/2.17-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates
17 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/i586-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 17
errors [qa_pseudo]
rt-tests-1.1: This
/work/core2-64-oe-linux/rt-tests/1_1.1-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
sblim-sfcb-1.4.9: This
/work/core2-64-oe-linux/sblim-sfcb/1.4.9-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
sed-4.2.2: This /work/i586-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
shadow-4.2.1: This
/work/core2-64-oe-linux/shadow/4.2.1-r0/pseudo/pseudo.log indicates 11
errors [qa_pseudo]
soci-3.2.2: This
/work/armv5te-oe-linux-gnueabi/soci/3.2.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
squid-3.5.26: This
/work/core2-64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
squid-3.5.26: This
/work/i586-oe-linux/squid/3.5.26-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
sthttpd-2.27.1: This
/work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
sthttpd-2.27.1: This
/work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates
5 errors [qa_pseudo]
sthttpd-2.27.1: This
/work/i586-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
strace-4.18: This
/work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
strace-4.18: This
/work/core2-64-oe-linux/strace/4.18-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
strongswan-5.5.3: This
/work/core2-64-oe-linux/strongswan/5.5.3-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
tcl-8.6.7: This
/work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
tcl-8.6.7: This /work/i586-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
tcp-wrappers-7.6: This
/work/armv5te-oe-linux-gnueabi/tcp-wrappers/7.6-r10/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
tftp-hpa-5.2: This
/work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
tftp-hpa-5.2: This
/work/i586-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
trace-cmd-2.6.1: This
/work/core2-64-oe-linux/trace-cmd/2.6.1-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
ubi-utils-klibc-1.5.2: This
/work/i586-oe-linux/ubi-utils-klibc/1.5.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
ufw-0.33: This /work/armv5te-oe-linux-gnueabi/ufw/0.33-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
ufw-0.33: This /work/core2-64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
usrsctp-git: This /work/i586-oe-linux/usrsctp/git-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
util-linux-2.30: This
/work/i586-oe-linux/util-linux/2.30-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
vlc-2.2.2: This
/work/armv5e-oe-linux-gnueabi/vlc/2.2.2-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
vorbis-tools-1.4.0: This
/work/i586-oe-linux/vorbis-tools/1.4.0-r0/pseudo/pseudo.log indicates
16 errors [qa_pseudo]
webkitgtk-2.16.6: This
/work/armv5e-oe-linux-gnueabi/webkitgtk/2.16.6-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
xf86-video-ati-7.8.0: This
/work/i586-oe-linux/xf86-video-ati/2_7.8.0-r0/pseudo/pseudo.log
indicates 15 errors [qa_pseudo]
xfce4-fsguard-plugin-1.1.0: This
/work/core2-64-oe-linux/xfce4-fsguard-plugin/1.1.0-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
xproto-7.0.31: This
/work/core2-64-oe-linux/xproto/1_7.0.31-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:
be393f2 toaster/highlight.pack.js: Fix corrupted file
not included in master yet:
3fba1ad world-image: add extra target
c7c01bf fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D

latest upstream commit:
3b413a8 README.qemu: qemuppc64 is not supported
not included in master yet:
3ff8d67 report-error: Allow to upload reports automatically
c7e8c96 buildhistory.bbclass: metadata-revs show repo parent
e2c9020 metadata-revs: provide more information
cd6556e qemux86: Add identical qemux86copy variant for tests
347a734 reproducible_build.bbclass: initial support for binary reproducibil=
ity
625d2bc cpio: provide cpio-replacement-native
ce7ca36 image_types.bbclass: improve cpio image reproducibility
fea2911 rootfs-postcommands.bbclass: support binary reproducibility
981e97a sstate.bbclass: Do not cause build failures due to setscene errors
b53517c insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
f829dbd libsdl2: allow to build native and nativesdk
5c05822 libdrm: allow to build native and nativesdk
95faa5e nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
bd4c162 libepoxy: add support for native(sdk)
3092b61 libjpeg-turbo: provide nativesdk version
5471ea7 virglrenderer: add new recipe
8c4c3fc virglrenderer: fix target build
81e5bc3 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
c37486d insane.bbclass: use package_qa_handle_error for do_qa_pseudo

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:
6e3fc5b python-cffi: update to version 1.11.2
not included in master yet:
43f7f64 stress-ng: Add recipe
3b3c43c python3-asn1crypto: add support for Python 3
7e05efb gperftools: Fix build on musl/mips
c187b99 tslib: update project homepage

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:
2c3ef00 qt5: add missing commercial license
not included in master yet:
bbb3044 meta-qt5: Update to 5.9.2 release

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:
26d5066 firefox: fix build failures
not included in master yet:
6773bf9 meta: drop ${COREBASE}/LICENSE references

--94eb2c1b4f141f4dff055bfc5d39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre id=3D"gmail-out" class=3D"gmail-console-output" style=
=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-=
top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><pre style=3D=
"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top=
:0px;margin-bottom:0px"><a href=3D"http://www.openembedded.org/wiki/Bitbake=
_World_Status" style=3D"box-sizing:border-box;word-wrap:break-word;color:rg=
b(92,53,102)"><br class=3D"gmail-Apple-interchange-newline">http://www.open=
embedded.org/wiki/Bitbake_World_Status</a>

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
eak-word;margin-top:0px;margin-bottom:0px">||2017-10-18	||4	||1	||1	||0	||0=
		||0		||3		||0		||0		||35		||3		||0		||0		||0		||0		||0		||0		||0		||385		=
||=09
|}

=3D=3D Failed tasks 2017-10-18 =3D=3D

INFO: jenkins-job.sh-1.8.35 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171019_143552.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171019_143=
552.log</a>

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_package_qa
    * meta-qt5/recipes-qt/qt5/qtscript_git.bb:do_package_qa
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_pac=
kage_qa

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package=
_qa

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa

=3D=3D=3D Number of failed tasks (6) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20171017_014539.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20171017_014539.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/47579/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/47579/</a>
|-
|| qemux86 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20171017_014539.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20171017_014539.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/47582/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/47582/</a>
|-
|| qemux86_64 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20171018_073541.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171018_073541.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/47597/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/47597/</a>
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">=3D=3D=3D QA issues (426) =3D=3D=
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
||35	||version-going-backwards
|-
||385	||qa_pseudo
|-
||3	||host-user-contaminated
|-
||3	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20171018_030715.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20171018_030715.log/</a>

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


</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 35	issue: version-going-backwards
fluidsynth-1.1.6: Package version for package fluidsynth-bin went backwards=
 which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.12) [vers=
ion-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-bin went backwards=
 which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.14) [vers=
ion-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-dbg went backwards=
 which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.12) [vers=
ion-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-dbg went backwards=
 which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.14) [vers=
ion-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-dev went backwards=
 which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.12) [vers=
ion-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-dev went backwards=
 which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.14) [vers=
ion-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-doc went backwards=
 which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.12) [vers=
ion-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-doc went backwards=
 which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.14) [vers=
ion-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-locale went backwa=
rds which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.12) [v=
ersion-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-locale went backwa=
rds which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.14) [v=
ersion-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-staticdev went bac=
kwards which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.12)=
 [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth-staticdev went bac=
kwards which would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.14)=
 [version-going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth went backwards whi=
ch would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.12) [version-=
going-backwards]
fluidsynth-1.1.6: Package version for package fluidsynth went backwards whi=
ch would break package feeds from (0:1.1.8-r0.0 to 0:1.1.6-r0.14) [version-=
going-backwards]
squid-3.5.26: Package version for package squid-dbg went backwards which wo=
uld break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4) [version-goin=
g-backwards]
squid-3.5.26: Package version for package squid-dbg went backwards which wo=
uld break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3) [version-goin=
g-backwards]
squid-3.5.26: Package version for package squid-dbg went backwards which wo=
uld break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5) [version-goin=
g-backwards]
squid-3.5.26: Package version for package squid-dev went backwards which wo=
uld break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4) [version-goin=
g-backwards]
squid-3.5.26: Package version for package squid-dev went backwards which wo=
uld break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3) [version-goin=
g-backwards]
squid-3.5.26: Package version for package squid-dev went backwards which wo=
uld break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5) [version-goin=
g-backwards]
squid-3.5.26: Package version for package squid-doc went backwards which wo=
uld break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4) [version-goin=
g-backwards]
squid-3.5.26: Package version for package squid-doc went backwards which wo=
uld break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3) [version-goin=
g-backwards]
squid-3.5.26: Package version for package squid-doc went backwards which wo=
uld break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5) [version-goin=
g-backwards]
squid-3.5.26: Package version for package squid-locale went backwards which=
 would break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4) [version-g=
oing-backwards]
squid-3.5.26: Package version for package squid-locale went backwards which=
 would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3) [version-g=
oing-backwards]
squid-3.5.26: Package version for package squid-locale went backwards which=
 would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5) [version-g=
oing-backwards]
squid-3.5.26: Package version for package squid-ptest went backwards which =
would break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4) [version-go=
ing-backwards]
squid-3.5.26: Package version for package squid-ptest went backwards which =
would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3) [version-go=
ing-backwards]
squid-3.5.26: Package version for package squid-ptest went backwards which =
would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5) [version-go=
ing-backwards]
squid-3.5.26: Package version for package squid-staticdev went backwards wh=
ich would break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4) [versio=
n-going-backwards]
squid-3.5.26: Package version for package squid-staticdev went backwards wh=
ich would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3) [versio=
n-going-backwards]
squid-3.5.26: Package version for package squid-staticdev went backwards wh=
ich would break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5) [versio=
n-going-backwards]
squid-3.5.26: Package version for package squid went backwards which would =
break package feeds from (0:3.5.27-r0.6 to 0:3.5.26-r0.4) [version-going-ba=
ckwards]
squid-3.5.26: Package version for package squid went backwards which would =
break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.3) [version-going-ba=
ckwards]
squid-3.5.26: Package version for package squid went backwards which would =
break package feeds from (0:3.5.27-r0.8 to 0:3.5.26-r0.5) [version-going-ba=
ckwards]


count: 3	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ms-my/usr/lib/loc=
ale/ms_MY/LC_COLLATE is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: qtbase: /qtbase-dev/usr/lib/cmake/Qt5Gu=
i/Qt5Gui_QJpegPlugin.cmake is owned by uid 3004, which is the same as the u=
ser running bitbake. This may be due to host contamination [host-user-conta=
minated]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: qtscript: /qtscript-mkspecs/usr/lib/q=
t5/mkspecs/modules/qt_lib_script.pri is owned by uid 3004, which is the sam=
e as the user running bitbake. This may be due to host contamination [host-=
user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 0	issue: symlink-to-sysro=
ot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 385	issue: qa_pseudo
abiword-3.0.2: This /work/core2-64-oe-linux/abiword/3.0.2-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
acl-2.2.52: This /work/core2-64-oe-linux/acl/2.2.52-r0/pseudo/pseudo.log in=
dicates 4 errors [qa_pseudo]
acl-2.2.52: This /work/i586-oe-linux/acl/2.2.52-r0/pseudo/pseudo.log indica=
tes 4 errors [qa_pseudo]
acpitool-0.5.1: This /work/core2-64-oe-linux/acpitool/0.5.1-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
adduser-3.116: This /work/i586-oe-linux/adduser/3.116-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
alsa-tools-1.1.3: This /work/core2-64-oe-linux/alsa-tools/1.1.3-r0/pseudo/p=
seudo.log indicates 16 errors [qa_pseudo]
apache2-2.4.27: This /work/armv5te-oe-linux-gnueabi/apache2/2.4.27-r0/pseud=
o/pseudo.log indicates 4 errors [qa_pseudo]
apache2-2.4.27: This /work/core2-64-oe-linux/apache2/2.4.27-r0/pseudo/pseud=
o.log indicates 6 errors [qa_pseudo]
apache2-2.4.27: This /work/i586-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.lo=
g indicates 6 errors [qa_pseudo]
atftp-0.7.1+gitAUTOINC+be3291a18c: This /work/core2-64-oe-linux/atftp/0.7.1=
+gitAUTOINC+be3291a18c-r3/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
attr-2.4.47: This /work/core2-64-oe-linux/attr/2.4.47-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
aufs-util-4.4+gitAUTOINC+89afb1806c: This /work/i586-oe-linux/aufs-util/4.4=
+gitAUTOINC+89afb1806c-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
autofs-5.1.2: This /work/core2-64-oe-linux/autofs/5.1.2-r0/pseudo/pseudo.lo=
g indicates 16 errors [qa_pseudo]
beecrypt-4.2.1: This /work/core2-64-oe-linux/beecrypt/4.2.1-r3/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
bluez5-5.46: This /work/armv5te-oe-linux-gnueabi/bluez5/5.46-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
bluez5-5.46: This /work/core2-64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
bluez5-5.46: This /work/i586-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log indi=
cates 17 errors [qa_pseudo]
cairo-1.14.10: This /work/core2-64-oe-linux/cairo/1.14.10-r0/pseudo/pseudo.=
log indicates 16 errors [qa_pseudo]
cherokee-1.2.104+gitAUTOINC+75f041e225: This /work/core2-64-oe-linux/cherok=
ee/1.2.104+gitAUTOINC+75f041e225-r0/pseudo/pseudo.log indicates 10 errors [=
qa_pseudo]
chrony-2.4: This /work/armv5te-oe-linux-gnueabi/chrony/2.4-r0/pseudo/pseudo=
.log indicates 4 errors [qa_pseudo]
chrony-2.4: This /work/core2-64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log in=
dicates 5 errors [qa_pseudo]
chrony-2.4: This /work/i586-oe-linux/chrony/2.4-r0/pseudo/pseudo.log indica=
tes 4 errors [qa_pseudo]
collectd-5.7.2: This /work/armv5te-oe-linux-gnueabi/collectd/5.7.2-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
collectd-5.7.2: This /work/core2-64-oe-linux/collectd/5.7.2-r0/pseudo/pseud=
o.log indicates 16 errors [qa_pseudo]
conntrack-tools-1.4.4: This /work/core2-64-oe-linux/conntrack-tools/1.4.4-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
conntrack-tools-1.4.4: This /work/i586-oe-linux/conntrack-tools/1.4.4-r0/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
corosync-2.4.2: This /work/i586-oe-linux/corosync/2.4.2-r0/pseudo/pseudo.lo=
g indicates 16 errors [qa_pseudo]
cryptodev-tests-1.9: This /work/armv5te-oe-linux-gnueabi/cryptodev-tests/1.=
9-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
curlpp-0.8.1: This /work/armv5te-oe-linux-gnueabi/curlpp/0.8.1-r0/pseudo/ps=
eudo.log indicates 5 errors [qa_pseudo]
curlpp-0.8.1: This /work/core2-64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.lo=
g indicates 5 errors [qa_pseudo]
curlpp-0.8.1: This /work/i586-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log in=
dicates 5 errors [qa_pseudo]
cxxtest-4.3: This /work/armv5te-oe-linux-gnueabi/cxxtest/4.3-r0/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
cxxtest-4.3: This /work/i586-oe-linux/cxxtest/4.3-r0/pseudo/pseudo.log indi=
cates 5 errors [qa_pseudo]
daemontools-0.76: This /work/core2-64-oe-linux/daemontools/0.76-r0/pseudo/p=
seudo.log indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log in=
dicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/i586-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indica=
tes 10 errors [qa_pseudo]
diffutils-3.6: This /work/armv5te-oe-linux-gnueabi/diffutils/3.6-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
diffutils-3.6: This /work/core2-64-oe-linux/diffutils/3.6-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
dlm-4.0.2: This /work/armv5te-oe-linux-gnueabi/dlm/4.0.2-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
dnf-2.6.3: This /work/core2-64-oe-linux/dnf/2.6.3-r0/pseudo/pseudo.log indi=
cates 4 errors [qa_pseudo]
dovecot-2.2.29: This /work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/pseud=
o/pseudo.log indicates 11 errors [qa_pseudo]
dovecot-2.2.29: This /work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/pseud=
o.log indicates 11 errors [qa_pseudo]
dovecot-2.2.29: This /work/i586-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.lo=
g indicates 11 errors [qa_pseudo]
dracut-045+git39c9b67f86145953aa30def9d77c68597a4ccfe8: This /work/i586-oe-=
linux/dracut/1_045+git39c9b67f86145953aa30def9d77c68597a4ccfe8-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-r4=
/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/core2-64-oe-linux/ebtables/2.0.10-4-r4/pseudo=
/pseudo.log indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/i586-oe-linux/ebtables/2.0.10-4-r4/pseudo/pse=
udo.log indicates 5 errors [qa_pseudo]
espeak-1.48.04: This /work/armv5te-oe-linux-gnueabi/espeak/1.48.04-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: This /work/armv5te-oe-li=
nux-gnueabi/evolution-data-server/3.2.3+gitAUTOINC+a9e4e74ec4-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
exfat-utils-1.2.3: This /work/i586-oe-linux/exfat-utils/1.2.3-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
expat-2.2.3: This /work/i586-oe-linux/expat/2.2.3-r0/pseudo/pseudo.log indi=
cates 10 errors [qa_pseudo]
expect-5.45: This /work/armv5te-oe-linux-gnueabi/expect/5.45-r1/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
flashrom-0.9.9: This /work/core2-64-oe-linux/flashrom/0.9.9-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
foomatic-filters-4.0.17: This /work/i586-oe-linux/foomatic-filters/4.0.17-r=
1/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
fstests-0.1+gitAUTOINC+e5939ff608: This /work/core2-64-oe-linux/fstests/0.1=
+gitAUTOINC+e5939ff608-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/armv5te-oe-linux-gnueabi/gate=
one/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_p=
seudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/core2-64-oe-linux/gateone/1.2=
+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/i586-oe-linux/gateone/1.2+git=
AUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
geoipupdate-2.4.0: This /work/armv5te-oe-linux-gnueabi/geoipupdate/2.4.0-r0=
/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
glib-2.0-2.52.3: This /work/armv5e-oe-linux-gnueabi/glib-2.0/1_2.52.3-r0/ps=
eudo/pseudo.log indicates 16 errors [qa_pseudo]
glib-2.0-2.52.3: This /work/i586-oe-linux/glib-2.0/1_2.52.3-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
glibc-2.26: This /work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
glibc-2.26: This /work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log in=
dicates 6 errors [qa_pseudo]
glibc-2.26: This /work/i586-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indica=
tes 10 errors [qa_pseudo]
glibc-locale-2.26: This /work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/=
pseudo/pseudo.log indicates 7 errors [qa_pseudo]
glibc-locale-2.26: This /work/i586-oe-linux/glibc-locale/2.26-r0/pseudo/pse=
udo.log indicates 14 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/armv5te-oe-linux-gnueabi/gobject-i=
ntrospection/1.52.1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/core2-64-oe-linux/gobject-introspe=
ction/1.52.1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/i586-oe-linux/gobject-introspectio=
n/1.52.1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
gsettings-desktop-schemas-3.22.0: This /work/i586-oe-linux/gsettings-deskto=
p-schemas/3.22.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
gsoap-2.8.51: This /work/core2-64-oe-linux/gsoap/2.8.51-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
gstreamer1.0-plugins-good-1.12.2: This /work/i586-oe-linux/gstreamer1.0-plu=
gins-good/1.12.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
gtk+3-3.22.17: This /work/core2-64-oe-linux/gtk+3/3.22.17-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
hdparm-9.52: This /work/i586-oe-linux/hdparm/9.52-r0/pseudo/pseudo.log indi=
cates 9 errors [qa_pseudo]
icu-59.1: This /work/armv5e-oe-linux-gnueabi/icu/59.1-r0/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]
icu-59.1: This /work/core2-64-oe-linux/icu/59.1-r0/pseudo/pseudo.log indica=
tes 5 errors [qa_pseudo]
icu-59.1: This /work/i586-oe-linux/icu/59.1-r0/pseudo/pseudo.log indicates =
4 errors [qa_pseudo]
inetutils-1.9.4: This /work/i586-oe-linux/inetutils/1.9.4-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
iotop-0.6: This /work/core2-64-oe-linux/iotop/0.6-r0/pseudo/pseudo.log indi=
cates 4 errors [qa_pseudo]
iozone3-465: This /work/core2-64-oe-linux/iozone3/465-r0/pseudo/pseudo.log =
indicates 4 errors [qa_pseudo]
iptables-1.6.1: This /work/core2-64-oe-linux/iptables/1.6.1-r0/pseudo/pseud=
o.log indicates 4 errors [qa_pseudo]
iscsi-initiator-utils-2.0.874: This /work/armv5te-oe-linux-gnueabi/iscsi-in=
itiator-utils/2.0.874-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
isomd5sum-1.2.1: This /work/i586-oe-linux/isomd5sum/1.2.1-r0/pseudo/pseudo.=
log indicates 6 errors [qa_pseudo]
json-spirit-4.08: This /work/core2-64-oe-linux/json-spirit/4.08-r0/pseudo/p=
seudo.log indicates 10 errors [qa_pseudo]
kmscube-git: This /work/i586-oe-linux/kmscube/git-r0/pseudo/pseudo.log indi=
cates 9 errors [qa_pseudo]
krb5-1.15.1: This /work/core2-64-oe-linux/krb5/1.15.1-r0/pseudo/pseudo.log =
indicates 11 errors [qa_pseudo]
l3afpad-0.8.18.1.11+gitAUTOINC+3cdccdc950: This /work/core2-64-oe-linux/l3a=
fpad/0.8.18.1.11+gitAUTOINC+3cdccdc950-r0/pseudo/pseudo.log indicates 10 er=
rors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/lc=
dproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors =
[qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/core2-64-oe-linux/lcdproc/0=
.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 11 errors [qa_pse=
udo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/i586-oe-linux/lcdproc/0.5.8=
+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lcov-1.11: This /work/core2-64-oe-linux/lcov/1.11-r0/pseudo/pseudo.log indi=
cates 12 errors [qa_pseudo]
libatasmart-0.19: This /work/armv5te-oe-linux-gnueabi/libatasmart/0.19-r0/p=
seudo/pseudo.log indicates 10 errors [qa_pseudo]
libatasmart-0.19: This /work/i586-oe-linux/libatasmart/0.19-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
libburn-1.4.0: This /work/core2-64-oe-linux/libburn/1.4.0-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
libcanberra-0.30: This /work/i586-oe-linux/libcanberra/0.30-r0/pseudo/pseud=
o.log indicates 16 errors [qa_pseudo]
libcdio-0.93: This /work/core2-64-oe-linux/libcdio/0.93-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux-gnu=
eabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indica=
tes 6 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/li=
bconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 12 =
errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/i586-oe-linux/libcon=
nman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 11 erro=
rs [qa_pseudo]
libgnomecanvas-2.30.3: This /work/armv5te-oe-linux-gnueabi/libgnomecanvas/2=
.30.3-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
libhtml-parser-perl-3.72: This /work/i586-oe-linux/libhtml-parser-perl/3.72=
-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libmbim-1.14.0: This /work/armv5te-oe-linux-gnueabi/libmbim/1.14.0-r0/pseud=
o/pseudo.log indicates 16 errors [qa_pseudo]
libmbim-1.14.0: This /work/i586-oe-linux/libmbim/1.14.0-r0/pseudo/pseudo.lo=
g indicates 16 errors [qa_pseudo]
libmemcached-1.0.18: This /work/armv5te-oe-linux-gnueabi/libmemcached/1.0.1=
8-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libmemcached-1.0.18: This /work/i586-oe-linux/libmemcached/1.0.18-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
libmime-types-perl-2.13: This /work/i586-oe-linux/libmime-types-perl/2.13-r=
0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libmodule-runtime-perl-0.015: This /work/i586-oe-linux/libmodule-runtime-pe=
rl/0.015-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libomxil-0.9.3: This /work/armv5te-oe-linux-gnueabi/libomxil/0.9.3-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueabi/=
libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/libqofo=
no/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 10 errors [qa=
_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/i586-oe-linux/libqofono/0=
.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 11 errors [qa_pse=
udo]
librcf-2.2.0.0: This /work/core2-64-oe-linux/librcf/2.2.0.0-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
libtasn1-4.12: This /work/core2-64-oe-linux/libtasn1/4.12-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
libtool-2.4.6: This /work/armv5te-oe-linux-gnueabi/libtool/2.4.6-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/core2-64-oe-linux/libtool-cross/2.4.6-r0/ps=
eudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/i586-oe-linux/libtool-cross/2.4.6-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
libuser-0.62: This /work/core2-64-oe-linux/libuser/0.62-r0/pseudo/pseudo.lo=
g indicates 16 errors [qa_pseudo]
libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9.1=
1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/ps=
eudo/pseudo.log indicates 12 errors [qa_pseudo]
libvncserver-0.9.11: This /work/i586-oe-linux/libvncserver/0.9.11-r0/pseudo=
/pseudo.log indicates 11 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pseud=
o/pseudo.log indicates 11 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseud=
o.log indicates 11 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/i586-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.lo=
g indicates 11 errors [qa_pseudo]
libx11-1.6.5: This /work/core2-64-oe-linux/libx11/1_1.6.5-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
libxscrnsaver-1.2.2: This /work/armv5te-oe-linux-gnueabi/libxscrnsaver/1_1.=
2.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/i586-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indi=
cates 10 errors [qa_pseudo]
llvm-5.0: This /work/armv5e-oe-linux-gnueabi/llvm/5.0-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indica=
tes 5 errors [qa_pseudo]
llvm-5.0: This /work/i586-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indicates =
5 errors [qa_pseudo]
log4cpp-1.1.2: This /work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseudo/=
pseudo.log indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This /work/i586-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/core2-64-oe-linux/lttng-tools/2.9.5-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/i586-oe-linux/lttng-tools/2.9.5-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
lvm2-2.02.171: This /work/armv5te-oe-linux-gnueabi/lvm2/2.02.171-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-li=
nux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pse=
udo.log indicates 11 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe-l=
inux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log=
 indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/i586-oe-linux=
/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log ind=
icates 13 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/armv5te-oe-linu=
x-gnueabi/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.=
log indicates 11 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/i586-oe-linux/m=
aliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log indicat=
es 17 errors [qa_pseudo]
menulibre-2.1.3: This /work/armv5te-oe-linux-gnueabi/menulibre/2.1.3-r0/pse=
udo/pseudo.log indicates 4 errors [qa_pseudo]
meson-0.40.1: This /work/armv5te-oe-linux-gnueabi/meson/0.40.1-r0/pseudo/ps=
eudo.log indicates 4 errors [qa_pseudo]
meson-0.40.1: This /work/core2-64-oe-linux/meson/0.40.1-r0/pseudo/pseudo.lo=
g indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/i586-oe-linux/mosquitto/1.4.14-r0/pseudo/pseud=
o.log indicates 4 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/core2-64-oe-linux/mozilla-devscripts/0.=
30-r1/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mpd-0.19.21: This /work/i586-oe-linux/mpd/0.19.21-r0/pseudo/pseudo.log indi=
cates 16 errors [qa_pseudo]
mpg123-1.25.6: This /work/armv5e-oe-linux-gnueabi/mpg123/1.25.6-r0/pseudo/p=
seudo.log indicates 16 errors [qa_pseudo]
mpich-3.2: This /work/core2-64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log indi=
cates 4 errors [qa_pseudo]
mpich-3.2: This /work/i586-oe-linux/mpich/3.2-r0/pseudo/pseudo.log indicate=
s 4 errors [qa_pseudo]
multipath-tools-0.7.1: This /work/core2-64-oe-linux/multipath-tools/0.7.1-r=
0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
netdata-1.6.0+gitAUTOINC+f5fa346a18: This /work/i586-oe-linux/netdata/1.6.0=
+gitAUTOINC+f5fa346a18-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
netkit-rpc-0.17: This /work/core2-64-oe-linux/netkit-rpc/0.17-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
net-snmp-5.7.3: This /work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
net-snmp-5.7.3: This /work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
net-snmp-5.7.3: This /work/i586-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
nettle-3.3: This /work/core2-64-oe-linux/nettle/3.3-r0/pseudo/pseudo.log in=
dicates 10 errors [qa_pseudo]
nginx-1.12.1: This /work/armv5te-oe-linux-gnueabi/nginx/1.12.1-r0/pseudo/ps=
eudo.log indicates 6 errors [qa_pseudo]
nginx-1.12.1: This /work/core2-64-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.lo=
g indicates 13 errors [qa_pseudo]
nginx-1.12.1: This /work/i586-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.log in=
dicates 6 errors [qa_pseudo]
nss-3.31.1: This /work/core2-64-oe-linux/nss/3.31.1-r0/pseudo/pseudo.log in=
dicates 5 errors [qa_pseudo]
ntp-4.2.8p10: This /work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseudo/ps=
eudo.log indicates 11 errors [qa_pseudo]
ntp-4.2.8p10: This /work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.lo=
g indicates 11 errors [qa_pseudo]
ntp-4.2.8p10: This /work/i586-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log in=
dicates 11 errors [qa_pseudo]
numactl-2.0.11+gitAUTOINC+ea3a70681c: This /work/i586-oe-linux/numactl/2.0.=
11+gitAUTOINC+ea3a70681c-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo=
]
nuttcp-7.2.1: This /work/armv5te-oe-linux-gnueabi/nuttcp/7.2.1-r0/pseudo/ps=
eudo.log indicates 4 errors [qa_pseudo]
openflow-1.0+gitAUTOINC+c84f33f09d: This /work/armv5te-oe-linux-gnueabi/ope=
nflow/1.0+gitAUTOINC+c84f33f09d-r0/pseudo/pseudo.log indicates 10 errors [q=
a_pseudo]
openl2tp-1.8: This /work/i586-oe-linux/openl2tp/1.8-r0/pseudo/pseudo.log in=
dicates 10 errors [qa_pseudo]
openlmi-tools-0.10.5: This /work/core2-64-oe-linux/openlmi-tools/0.10.5-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pse=
udo/pseudo.log indicates 21 errors [qa_pseudo]
opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pse=
udo.log indicates 13 errors [qa_pseudo]
opensaf-5.17.07: This /work/i586-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.=
log indicates 18 errors [qa_pseudo]
openssh-7.5p1: This /work/armv5te-oe-linux-gnueabi/openssh/7.5p1-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
openssh-7.5p1: This /work/core2-64-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.=
log indicates 17 errors [qa_pseudo]
openssh-7.5p1: This /work/i586-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.log =
indicates 17 errors [qa_pseudo]
openwsman-2.6.3: This /work/core2-64-oe-linux/openwsman/2.6.3-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/pse=
udo/pseudo.log indicates 4 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pse=
udo.log indicates 5 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/i586-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.=
log indicates 5 errors [qa_pseudo]
pax-utils-1.2.2: This /work/core2-64-oe-linux/pax-utils/1.2.2-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
pcmanfm-1.2.5: This /work/armv5te-oe-linux-gnueabi/pcmanfm/1.2.5-r0/pseudo/=
pseudo.log indicates 4 errors [qa_pseudo]
perf-1.0: This /work/qemux86_64-oe-linux/perf/1.0-r9/pseudo/pseudo.log indi=
cates 10 errors [qa_pseudo]
perl-5.24.1: This /work/armv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/pseu=
do.log indicates 6 errors [qa_pseudo]
perl-5.24.1: This /work/core2-64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]
perl-5.24.1: This /work/i586-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indi=
cates 4 errors [qa_pseudo]
php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indi=
cates 12 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicate=
s 11 errors [qa_pseudo]
phytool-1.0.1+gitAUTOINC+3149bfdb4f: This /work/armv5te-oe-linux-gnueabi/ph=
ytool/1.0.1+gitAUTOINC+3149bfdb4f-r0/pseudo/pseudo.log indicates 10 errors =
[qa_pseudo]
picocom-2.2+gitAUTOINC+deffd18c24: This /work/i586-oe-linux/picocom/2.2+git=
AUTOINC+deffd18c24-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
pm-qa-0.5.2: This /work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/pseu=
do.log indicates 34 errors [qa_pseudo]
pm-qa-0.5.2: This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log =
indicates 30 errors [qa_pseudo]
pm-qa-0.5.2: This /work/i586-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indi=
cates 33 errors [qa_pseudo]
pmtools-20130209+gitAUTOINC+3ebe0e54c5: This /work/core2-64-oe-linux/pmtool=
s/20130209+gitAUTOINC+3ebe0e54c5-r0/pseudo/pseudo.log indicates 10 errors [=
qa_pseudo]
pm-utils-1.4.1: This /work/core2-64-oe-linux/pm-utils/1.4.1-r1/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
pm-utils-1.4.1: This /work/i586-oe-linux/pm-utils/1.4.1-r1/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
poco-1.7.9: This /work/armv5te-oe-linux-gnueabi/poco/1.7.9-r0/pseudo/pseudo=
.log indicates 4 errors [qa_pseudo]
poppler-0.57.0: This /work/core2-64-oe-linux/poppler/0.57.0-r0/pseudo/pseud=
o.log indicates 16 errors [qa_pseudo]
portaudio-v19-v190600: This /work/armv5te-oe-linux-gnueabi/portaudio-v19/v1=
90600-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
portaudio-v19-v190600: This /work/core2-64-oe-linux/portaudio-v19/v190600-r=
0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
postfix-3.2.2: This /work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
postfix-3.2.2: This /work/core2-64-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
postfix-3.2.2: This /work/i586-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
postgresql-9.4.13: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.13-r0/=
pseudo/pseudo.log indicates 11 errors [qa_pseudo]
postgresql-9.4.13: This /work/core2-64-oe-linux/postgresql/9.4.13-r0/pseudo=
/pseudo.log indicates 13 errors [qa_pseudo]
postgresql-9.4.13: This /work/i586-oe-linux/postgresql/9.4.13-r0/pseudo/pse=
udo.log indicates 11 errors [qa_pseudo]
ppp-2.4.7: This /work/core2-64-oe-linux/ppp/2.4.7-r0/pseudo/pseudo.log indi=
cates 10 errors [qa_pseudo]
proftpd-1.3.6: This /work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/pseudo/=
pseudo.log indicates 11 errors [qa_pseudo]
proftpd-1.3.6: This /work/i586-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log =
indicates 12 errors [qa_pseudo]
pxaregs-1.14: This /work/core2-64-oe-linux/pxaregs/1.14-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
python-2.7.13: This /work/armv5te-oe-linux-gnueabi/python/2.7.13-r1/pseudo/=
pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseudo.=
log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/i586-oe-linux/python/2.7.13-r1/pseudo/pseudo.log =
indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/pseud=
o.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/i586-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.lo=
g indicates 5 errors [qa_pseudo]
python3-chardet-3.0.4: This /work/core2-64-oe-linux/python3-chardet/3.0.4-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-docutils-0.14: This /work/core2-64-oe-linux/python3-docutils/0.14-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-flask-0.12.2: This /work/core2-64-oe-linux/python3-flask/0.12.2-r0/=
pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-flask-0.12.2: This /work/i586-oe-linux/python3-flask/0.12.2-r0/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
python3-pip-9.0.1: This /work/armv5te-oe-linux-gnueabi/python3-pip/9.0.1-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pip-9.0.1: This /work/core2-64-oe-linux/python3-pip/9.0.1-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/armv5te-oe-linux-gnueabi/python3-pylint/1.=
7.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/core2-64-oe-linux/python3-pylint/1.7.4-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/i586-oe-linux/python3-pylint/1.7.4-r0/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
python3-pytest-3.2.2: This /work/core2-64-oe-linux/python3-pytest/3.2.2-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pyudev-0.21.0: This /work/armv5te-oe-linux-gnueabi/python3-pyudev/0=
.21.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pyyaml-3.12: This /work/armv5te-oe-linux-gnueabi/python3-pyyaml/3.1=
2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-zopeinterface-4.4.3: This /work/i586-oe-linux/python3-zopeinterface=
/4.4.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-behave-1.2.5: This /work/armv5te-oe-linux-gnueabi/python-behave/1.2.=
5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-behave-1.2.5: This /work/i586-oe-linux/python-behave/1.2.5-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
python-chardet-3.0.4: This /work/armv5te-oe-linux-gnueabi/python-chardet/3.=
0.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-chardet-3.0.4: This /work/core2-64-oe-linux/python-chardet/3.0.4-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-cpuset-1.5.7: This /work/core2-64-oe-linux/python-cpuset/1.5.7-r0/ps=
eudo/pseudo.log indicates 4 errors [qa_pseudo]
python-django-1.11.5: This /work/armv5te-oe-linux-gnueabi/python-django/1.1=
1.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-docutils-0.14rc2: This /work/core2-64-oe-linux/python-docutils/0.14r=
c2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-flask-0.12.2: This /work/core2-64-oe-linux/python-flask/0.12.2-r0/ps=
eudo/pseudo.log indicates 4 errors [qa_pseudo]
python-humanize-0.5.1: This /work/i586-oe-linux/python-humanize/0.5.1-r0/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
python-imaging-1.1.7: This /work/core2-64-oe-linux/python-imaging/1.1.7-r5/=
pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-imaging-1.1.7: This /work/i586-oe-linux/python-imaging/1.1.7-r5/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
python-jsonschema-2.6.0: This /work/armv5te-oe-linux-gnueabi/python-jsonsch=
ema/2.6.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-nose-1.3.7: This /work/armv5te-oe-linux-gnueabi/python-nose/1.3.7-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pip-9.0.1: This /work/armv5te-oe-linux-gnueabi/python-pip/9.0.1-r0/p=
seudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pycrypto-2.6.1: This /work/i586-oe-linux/python-pycrypto/2.6.1-r0/ps=
eudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This /work/armv5te-oe-linux-gnueabi/python-pylint/1.7.=
4-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-pylint-1.7.4: This /work/core2-64-oe-linux/python-pylint/1.7.4-r0/ps=
eudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This /work/i586-oe-linux/python-pylint/1.7.4-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
python-pysqlite-2.8.3: This /work/i586-oe-linux/python-pysqlite/2.8.3-r0/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
python-snimpy-0.8.11: This /work/core2-64-oe-linux/python-snimpy/0.8.11-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-snimpy-0.8.11: This /work/i586-oe-linux/python-snimpy/0.8.11-r0/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
python-twisted-17.9.0: This /work/core2-64-oe-linux/python-twisted/17.9.0-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-vobject-0.9.5: This /work/i586-oe-linux/python-vobject/0.9.5-r0/pseu=
do/pseudo.log indicates 4 errors [qa_pseudo]
python-wcwidth-0.1.7: This /work/i586-oe-linux/python-wcwidth/0.1.7-r0/pseu=
do/pseudo.log indicates 10 errors [qa_pseudo]
qemu-2.10.0: This /work/armv5te-oe-linux-gnueabi/qemu/2.10.0-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
qemu-2.10.0: This /work/core2-64-oe-linux/qemu/2.10.0-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
qemu-2.10.0: This /work/i586-oe-linux/qemu/2.10.0-r0/pseudo/pseudo.log indi=
cates 10 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/armv5te-oe-linux-gnueabi/qt3d/=
5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 12 errors [qa_ps=
eudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/core2-64-oe-linux/qt3d/5.9.2+g=
itAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 30 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/i586-oe-linux/qt3d/5.9.2+gitAU=
TOINC+143b721249-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qt5-creator-3.5.1: This /work/core2-64-oe-linux/qt5-creator/3.5.1-r0/pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
qt5-creator-3.5.1: This /work/i586-oe-linux/qt5-creator/3.5.1-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/armv5te-oe-linux-gnueabi/qtb=
ase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 15 errors [q=
a_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/core2-64-oe-linux/qtbase/5.9=
.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 21 errors [qa_pseud=
o]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/i586-oe-linux/qtbase/5.9.2+g=
itAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/armv5te-oe-linux-gnueabi/q=
tcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/core2-64-oe-linux/qtcharts=
/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 11 errors [qa_p=
seudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/armv5te-oe-linux-gnu=
eabi/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indica=
tes 11 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/i586-oe-linux/qtconn=
ectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates 19 erro=
rs [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/armv5te-oe-linux-gnueab=
i/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 10=
 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/core2-64-oe-linux/qtdat=
avis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 14 errors=
 [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/i586-oe-linux/qtdatavis=
3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 11 errors [qa=
_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/armv5te-oe-linux-gnue=
abi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicate=
s 17 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/core2-64-oe-linux/qtd=
eclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 16 er=
rors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/i586-oe-linux/qtdecla=
rative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 17 errors=
 [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnueabi/=
qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/core2-64-oe-linux/qtengin=
io/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 errors [qa=
_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/i586-oe-linux/qtenginio/5=
.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 10 errors [qa_pse=
udo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/armv5te-oe-linux-gnueabi/=
qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 14 err=
ors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/i586-oe-linux/qtgamepad/5=
.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 10 errors [qa_pse=
udo]
qtimageformats-5.9.2+gitAUTOINC+dc6dc3b088: This /work/core2-64-oe-linux/qt=
imageformats/5.9.2+gitAUTOINC+dc6dc3b088-r0/pseudo/pseudo.log indicates 16 =
errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/armv5te-oe-li=
nux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/core2-64-oe-l=
inux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log=
 indicates 11 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/i586-oe-linux=
/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log ind=
icates 12 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/armv5te-oe-linux-gnuea=
bi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates =
14 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/core2-64-oe-linux/qtmu=
ltimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 11 erro=
rs [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/i586-oe-linux/qtmultim=
edia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 14 errors [=
qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/armv5te-oe-linux-gnue=
abi/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicate=
s 11 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/core2-64-oe-linux/qtn=
etworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 12 er=
rors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/i586-oe-linux/qtnetwo=
rkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 4 errors =
[qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/armv5te-oe-linux-gnueabi/q=
tquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 18 error=
s [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/core2-64-oe-linux/qtquick1=
/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 17 errors [qa_p=
seudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/i586-oe-linux/qtquick1/5.9=
.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 40 errors [qa_pseud=
o]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/core2-64-oe-linux/=
qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicates=
 11 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/i586-oe-linux/qtqu=
ickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicates 10 =
errors [qa_pseudo]
qtquickcontrols-5.9.2+gitAUTOINC+8476f8fff7: This /work/i586-oe-linux/qtqui=
ckcontrols/5.9.2+gitAUTOINC+8476f8fff7-r0/pseudo/pseudo.log indicates 10 er=
rors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/armv5te-oe-linux-gn=
ueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indi=
cates 11 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/core2-64-oe-linux/q=
tremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates 1=
1 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/i586-oe-linux/qtrem=
oteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates 11 er=
rors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/armv5e-oe-linux-gnueabi/qt=
script/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 11 errors=
 [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/core2-64-oe-linux/qtscript=
/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 10 errors [qa_p=
seudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/i586-oe-linux/qtscript/5.9=
.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 10 errors [qa_pseud=
o]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/armv5te-oe-linux-gnueabi/qt=
scxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/core2-64-oe-linux/qtscxml/5=
.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 10 errors [qa_pse=
udo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/i586-oe-linux/qtscxml/5.9.2=
+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/armv5te-oe-linux-gnueabi/=
qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/core2-64-oe-linux/qtsenso=
rs/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 12 errors [qa=
_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/i586-oe-linux/qtsensors/5=
.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 11 errors [qa_pse=
udo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/armv5te-oe-linux-gnueab=
i/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 12=
 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/core2-64-oe-linux/qtser=
ialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 11 errors=
 [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/i586-oe-linux/qtserialb=
us/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 11 errors [qa=
_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/armv5te-oe-linux-gnuea=
bi/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates =
7 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/core2-64-oe-linux/qtse=
rialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 4 error=
s [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/i586-oe-linux/qtserial=
port/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 5 errors [q=
a_pseudo]
qtsmarthome-1.0: This /work/i586-oe-linux/qtsmarthome/1.0-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/armv5te-oe-linux-gnueabi/qtsv=
g/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 11 errors [qa_=
pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/i586-oe-linux/qtsvg/5.9.2+git=
AUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/armv5te-oe-linux-gnueabi/=
qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/core2-64-oe-linux/qtsyste=
ms/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 10 errors [qa=
_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/i586-oe-linux/qtsystems/5=
.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 12 errors [qa_pse=
udo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/armv5te-oe-linux-gnueabi/qt=
tools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/core2-64-oe-linux/qttools/5=
.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 10 errors [qa_pse=
udo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/i586-oe-linux/qttools/5.9.2=
+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/core2-64-oe-linux/qtwayla=
nd/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 14 errors [qa=
_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/i586-oe-linux/qtwayland/5=
.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 11 errors [qa_pse=
udo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/armv5te-oe-linux-gnuea=
bi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates =
11 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/core2-64-oe-linux/qtwe=
bchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 12 erro=
rs [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/i586-oe-linux/qtwebcha=
nnel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 11 errors [=
qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/core2-64-oe-=
linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/i586-oe-linu=
x/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log i=
ndicates 12 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueabi/qt=
webkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 10 errors=
 [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwebkit=
/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 14 errors [qa_p=
seudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/i586-oe-linux/qtwebkit/5.9=
.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 14 errors [qa_pseud=
o]
qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This /work/armv5te-oe-linux-=
gnueabi/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log =
indicates 20 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/armv5te-oe-linux-gnuea=
bi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates =
11 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/core2-64-oe-linux/qtwe=
bsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 13 erro=
rs [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/i586-oe-linux/qtwebsoc=
kets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 13 errors [=
qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/core2-64-oe-linux/qtwebvi=
ew/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 10 errors [qa=
_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/i586-oe-linux/qtwebview/5=
.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 11 errors [qa_pse=
udo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/armv5te-oe-linux-gnueab=
i/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 5 =
errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/core2-64-oe-linux/qtx11=
extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 5 errors =
[qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/i586-oe-linux/qtx11extr=
as/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 5 errors [qa_=
pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/armv5te-oe-linux-gnue=
abi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicate=
s 12 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/core2-64-oe-linux/qtx=
mlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 12 er=
rors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/i586-oe-linux/qtxmlpa=
tterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 11 errors=
 [qa_pseudo]
quagga-1.2.1: This /work/armv5te-oe-linux-gnueabi/quagga/1.2.1-r0/pseudo/ps=
eudo.log indicates 14 errors [qa_pseudo]
quagga-1.2.1: This /work/core2-64-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.lo=
g indicates 13 errors [qa_pseudo]
quagga-1.2.1: This /work/i586-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
quilt-0.65: This /work/i586-oe-linux/quilt/0.65-r0/pseudo/pseudo.log indica=
tes 4 errors [qa_pseudo]
radvd-2.17: This /work/armv5te-oe-linux-gnueabi/radvd/2.17-r0/pseudo/pseudo=
.log indicates 4 errors [qa_pseudo]
radvd-2.17: This /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log in=
dicates 5 errors [qa_pseudo]
radvd-2.17: This /work/i586-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indica=
tes 4 errors [qa_pseudo]
rsyslog-8.29.0: This /work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseud=
o/pseudo.log indicates 17 errors [qa_pseudo]
rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseud=
o.log indicates 17 errors [qa_pseudo]
rsyslog-8.29.0: This /work/i586-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.lo=
g indicates 17 errors [qa_pseudo]
rt-tests-1.1: This /work/core2-64-oe-linux/rt-tests/1_1.1-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
sblim-sfcb-1.4.9: This /work/core2-64-oe-linux/sblim-sfcb/1.4.9-r0/pseudo/p=
seudo.log indicates 4 errors [qa_pseudo]
sed-4.2.2: This /work/i586-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log indicate=
s 4 errors [qa_pseudo]
shadow-4.2.1: This /work/core2-64-oe-linux/shadow/4.2.1-r0/pseudo/pseudo.lo=
g indicates 11 errors [qa_pseudo]
soci-3.2.2: This /work/armv5te-oe-linux-gnueabi/soci/3.2.2-r0/pseudo/pseudo=
.log indicates 10 errors [qa_pseudo]
squid-3.5.26: This /work/core2-64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
squid-3.5.26: This /work/i586-oe-linux/squid/3.5.26-r0/pseudo/pseudo.log in=
dicates 10 errors [qa_pseudo]
sthttpd-2.27.1: This /work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pseud=
o/pseudo.log indicates 5 errors [qa_pseudo]
sthttpd-2.27.1: This /work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseud=
o.log indicates 5 errors [qa_pseudo]
sthttpd-2.27.1: This /work/i586-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.lo=
g indicates 5 errors [qa_pseudo]
strace-4.18: This /work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
strace-4.18: This /work/core2-64-oe-linux/strace/4.18-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
strongswan-5.5.3: This /work/core2-64-oe-linux/strongswan/5.5.3-r0/pseudo/p=
seudo.log indicates 4 errors [qa_pseudo]
tcl-8.6.7: This /work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.l=
og indicates 5 errors [qa_pseudo]
tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indi=
cates 6 errors [qa_pseudo]
tcl-8.6.7: This /work/i586-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indicate=
s 6 errors [qa_pseudo]
tcp-wrappers-7.6: This /work/armv5te-oe-linux-gnueabi/tcp-wrappers/7.6-r10/=
pseudo/pseudo.log indicates 10 errors [qa_pseudo]
tftp-hpa-5.2: This /work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/ps=
eudo.log indicates 5 errors [qa_pseudo]
tftp-hpa-5.2: This /work/i586-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log in=
dicates 5 errors [qa_pseudo]
trace-cmd-2.6.1: This /work/core2-64-oe-linux/trace-cmd/2.6.1-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
ubi-utils-klibc-1.5.2: This /work/i586-oe-linux/ubi-utils-klibc/1.5.2-r0/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
ufw-0.33: This /work/armv5te-oe-linux-gnueabi/ufw/0.33-r0/pseudo/pseudo.log=
 indicates 5 errors [qa_pseudo]
ufw-0.33: This /work/core2-64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indica=
tes 7 errors [qa_pseudo]
usrsctp-git: This /work/i586-oe-linux/usrsctp/git-r0/pseudo/pseudo.log indi=
cates 10 errors [qa_pseudo]
util-linux-2.30: This /work/i586-oe-linux/util-linux/2.30-r0/pseudo/pseudo.=
log indicates 4 errors [qa_pseudo]
vlc-2.2.2: This /work/armv5e-oe-linux-gnueabi/vlc/2.2.2-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
vorbis-tools-1.4.0: This /work/i586-oe-linux/vorbis-tools/1.4.0-r0/pseudo/p=
seudo.log indicates 16 errors [qa_pseudo]
webkitgtk-2.16.6: This /work/armv5e-oe-linux-gnueabi/webkitgtk/2.16.6-r0/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
xf86-video-ati-7.8.0: This /work/i586-oe-linux/xf86-video-ati/2_7.8.0-r0/ps=
eudo/pseudo.log indicates 15 errors [qa_pseudo]
xfce4-fsguard-plugin-1.1.0: This /work/core2-64-oe-linux/xfce4-fsguard-plug=
in/1.1.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xproto-7.0.31: This /work/core2-64-oe-linux/xproto/1_7.0.31-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
be393f2 toaster/highlight.pack.js: Fix corrupted file
not included in master yet:=20
3fba1ad world-image: add extra target
c7c01bf fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
3b413a8 README.qemu: qemuppc64 is not supported
not included in master yet:=20
3ff8d67 report-error: Allow to upload reports automatically
c7e8c96 buildhistory.bbclass: metadata-revs show repo parent
e2c9020 metadata-revs: provide more information
cd6556e qemux86: Add identical qemux86copy variant for tests
347a734 reproducible_build.bbclass: initial support for binary reproducibil=
ity
625d2bc cpio: provide cpio-replacement-native
ce7ca36 image_types.bbclass: improve cpio image reproducibility
fea2911 rootfs-postcommands.bbclass: support binary reproducibility
981e97a sstate.bbclass: Do not cause build failures due to setscene errors
b53517c insane.bbclass: Add do_qa_pseudo function to check for common error=
s listed in pseudo.log
f829dbd libsdl2: allow to build native and nativesdk
5c05822 libdrm: allow to build native and nativesdk
95faa5e nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
bd4c162 libepoxy: add support for native(sdk)
3092b61 libjpeg-turbo: provide nativesdk version
5471ea7 virglrenderer: add new recipe
8c4c3fc virglrenderer: fix target build
81e5bc3 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
c37486d insane.bbclass: use package_qa_handle_error for do_qa_pseudo

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
6e3fc5b python-cffi: update to version 1.11.2
not included in master yet:=20
43f7f64 stress-ng: Add recipe
3b3c43c python3-asn1crypto: add support for Python 3
7e05efb gperftools: Fix build on musl/mips
c187b99 tslib: update project homepage

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
2c3ef00 qt5: add missing commercial license
not included in master yet:=20
bbb3044 meta-qt5: Update to 5.9.2 release

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
26d5066 firefox: fix build failures
not included in master yet:=20
6773bf9 meta: drop ${COREBASE}/LICENSE references</pre></pre></div>

--94eb2c1b4f141f4dff055bfc5d39--
