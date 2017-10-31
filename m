Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 686C36069C;
	Tue, 31 Oct 2017 20:58:17 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id a69so341299lfe.5;
	Tue, 31 Oct 2017 13:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=rjohMvMdbQBDMLVmZiuKdKpGSkEcQDKaaeG52eGgJzE=;
	b=d26iIfU3pirh4lT93A4KUq7GHbL0BjC62MQO/oqo6Su8uYqji9BbRsYe4NB+NsE4Ic
	ep/dByIt2kUEBY5FWOxzA+h/lCBe9nEuGI1IB0A/LrAhEB1IXtyPoAJ4KO7H2KKfWtb6
	91tXMmX3zBIeKAOD2GxCMwAll/XHBuMSsObJJ8qrFmidMmk4w7JUzEYutS2i+i5hWvAH
	bZolgUf6xwBR8c1xymYd78Kip9AEGdS6Nnz4AetHDQPPC3s6oKGhQp8c2c9MQWbpl8ib
	ORKuZL+1IC/EMj9HN0+cIu2S3IDlrHysVIyQWEnUIB+FcssrByEe6uRem1wNKCUDPpQT
	xH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=rjohMvMdbQBDMLVmZiuKdKpGSkEcQDKaaeG52eGgJzE=;
	b=Shx8I22DpngtWyxaxk4AqodovkETow/AUhEMYXysI1QsW+tc1bVYqwhMMyWRUtPl5n
	B/FeqijKC4wsUxYPR2en5oyRR3AdWC1pMRMngGEmxpHu//hdndJt0x+/IBnbSCO9LqfC
	ss3m/cw7WLQkLnqD1nWER6e1y2BeCQuc2VLc5wD1GgRzUX5bRO49gw/ZzXTNqgs5QXtI
	slyUjzs6Zt08QUy1W6LQ6O2+RQOfYWVLHN+W4nDtRM2JVfqC4QIGzSWMXsGx5AlFV23l
	WwrdXbfrFEc2WEupm9uIQEVaCdjd544zAT/rZdZsrqkEkNY2NnhOUuPwHfjeZEuUwxzi
	OjvQ==
X-Gm-Message-State: AMCzsaVyNuovLdAe2hJx84bUWHRgGzroOMcMv2Y+qx0ha8cInAAGsJA8
	zItqStoVJi1V0aVAOeFxTxxAmlF+1jXRZBDmZqd0/Q==
X-Google-Smtp-Source: ABhQp+QEMpXLCKeCLZAk+k0mYn9rm5xPsc8Tv0zsqrgufv8ubajXKQE1v0iokLeJ7YxVdJhrRk4Fo+5qXiLDg+1Y2bI=
X-Received: by 10.46.43.205 with SMTP id r74mr1482790ljr.159.1509483497693;
	Tue, 31 Oct 2017 13:58:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.20.69 with HTTP; Tue, 31 Oct 2017 13:58:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 31 Oct 2017 21:58:17 +0100
Message-ID: <CA+chaQfyBb2rioOqS1C5+e_sq3XdaxP0ge-Jt6Km5BsjHfHyTA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-10-31
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
X-List-Received-Date: Tue, 31 Oct 2017 20:58:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c1c1660aca8b7055cde039c"

--94eb2c1c1660aca8b7055cde039c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

With 2 pending patches from Khem to build systemd with musl:

62c7c98 systemd: Fix build on musl
de68252 systemd: Fix build with musl/mips64

the qemux86+musl build was able to progress much further and fewer
ERROR messages were shown. Basically only uim recipe now depends on
glibc and fails to be included in build queue:


Summary: There were 55 ERROR messages shown, returning a non-zero exit code=
.


Parsing of 2356 .bb files complete (2355 cached, 1 parsed). 3228
targets, 48 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'glibc-gconv-euc-jp' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/u=
im/uim_1.8.6.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'glibc-gconv-euc-jp' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glibc-gconv-euc-jp']
NOTE: Runtime target 'uim-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['uim-dev', 'glibc-gconv-euc-j=
p']
NOTE: Runtime target 'uim' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['uim', 'glibc-gconv-euc-jp']
NOTE: Runtime target 'libuim0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libuim0', 'glibc-gconv-euc-j=
p']
ERROR: Nothing RPROVIDES 'glibc-utils' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/u=
im/uim_1.8.6.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'glibc-utils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glibc-utils']


Some logs weren't uploaded to the
http://logs.nslu2-linux.org/buildlogs
<http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171031_0=
95148.log>
because it run out of disk space again.


http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'4'|Failed tasks			    !!|Signatures	=09
!!colspan=3D'15'|QA !!Comment
|-
||		||qemuarm	||qemuarm64	||qemux86	||qemux86_64	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-=
going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-c=
onfigure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflag=
s	||compile-host-path	||qa_pseudo	||
|-

||2017-10-30	||2	||6	||26	||1	||0	||0		||0		||1		||0		||0		||28		||2		||0		=
||0		||0		||0		||0		||0		||0		||158		||
|}

=3D=3D Failed tasks 2017-10-30 =3D=3D

INFO: jenkins-job.sh-1.8.39 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171031_09=
5148.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_pac=
kage_qa

=3D=3D=3D qemuarm64 (5) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:do_comp=
ile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.=
bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc=
_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-kli=
bc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_=
compile

=3D=3D=3D qemux86 (26) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.=
1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.1=
7.07.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3=
.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rs=
h_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit=
-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit=
-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.50.=
9.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8=
beta5.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/open-isns/open-isns=
_0.97.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_compil=
e
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumpe=
r_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb:=
do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-systemd=
_234.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-systemd_=
234.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-boo=
tchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_co=
mpile
    * openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_g=
it.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-bad_1.12.2.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package=
_qa

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa

=3D=3D=3D Number of failed tasks (35) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.2017=
1030_061538.log/
||
|-
|| qemuarm64 	|| 6	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm64.20=
171030_165541.log/
|| http://errors.yoctoproject.org/Errors/Build/47895/
|-
|| qemux86 	|| 26	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.2017=
1030_061543.log/
|| http://errors.yoctoproject.org/Errors/Build/47880/
|-
|| qemux86_64 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.2=
0171030_191803.log/
|| http://errors.yoctoproject.org/Errors/Build/47897/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (189) =3D=3D=3D
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
||158	||qa_pseudo
|-
||1	||textrel
|-
||28	||version-going-backwards
|-
||2	||host-user-contaminated
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20171031_072554.log/


    * ERROR: Nothing RPROVIDES 'glibc-utils' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/u=
im/uim_1.8.6.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy
in /home/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'glibc-utils' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/u=
im/uim_1.8.6.bb
RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in
/home/jenkins/oe/world/shr-core/tmp-glibc/stamps


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


count: 1	issue: textrel
corosync-2.4.2: ELF binary
'/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin=
/corosync'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 28	issue: version-going-backwards
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.14 to 0:1.0-r3.13)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.14 to 0:1.0-r3.13)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.14 to 0:1.0-r3.13)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.14 to 0:1.0-r13.13)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]



count: 2	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ms-my/usr/lib/locale/ms_MY/LC_COLLATE is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-quz-pe/usr/lib/locale/quz_PE/LC_NAME is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 158	issue: qa_pseudo
bluez5-5.46: This
/work/aarch64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
bluez5-5.46: This
/work/armv5te-oe-linux-gnueabi/bluez5/5.46-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
bluez5-5.46: This
/work/core2-64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
cairo-1.14.10: This
/work/core2-64-oe-linux/cairo/1.14.10-r0/pseudo/pseudo.log indicates
24 errors [qa_pseudo]
collectd-5.7.2: This
/work/aarch64-oe-linux/collectd/5.7.2-r0/pseudo/pseudo.log indicates
17 errors [qa_pseudo]
collectd-5.7.2: This
/work/armv5te-oe-linux-gnueabi/collectd/5.7.2-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
dhcpcd-6.11.3: This
/work/aarch64-oe-linux/dhcpcd/6.11.3-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/aarch64-oe-linux/gobject-introspection/1.52.1-r0/pseudo/pseudo.log
indicates 24 errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/armv5te-oe-linux-gnueabi/gobject-introspection/1.52.1-r0/pseudo/pseud=
o.log
indicates 20 errors [qa_pseudo]
gobject-introspection-1.52.1: This
/work/core2-64-oe-linux/gobject-introspection/1.52.1-r0/pseudo/pseudo.log
indicates 19 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This
/work/aarch64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo=
.log
indicates 10 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This
/work/armv5te-oe-linux-gnueabi/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseud=
o/pseudo.log
indicates 12 errors [qa_pseudo]
libatasmart-0.19: This
/work/aarch64-oe-linux/libatasmart/0.19-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
libatasmart-0.19: This
/work/core2-64-oe-linux/libatasmart/0.19-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/aarch64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo=
/pseudo.log
indicates 11 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r=
0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This
/work/core2-64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseud=
o/pseudo.log
indicates 11 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/aarch64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseu=
do.log
indicates 11 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/armv5te-oe-linux-gnueabi/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pse=
udo/pseudo.log
indicates 13 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This
/work/core2-64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pse=
udo.log
indicates 13 errors [qa_pseudo]
librepo-1.7.20+gitAUTOINC+e1137cbbda: This
/work/aarch64-oe-linux/librepo/1.7.20+gitAUTOINC+e1137cbbda-r0/pseudo/pseud=
o.log
indicates 10 errors [qa_pseudo]
libvncserver-0.9.11: This
/work/aarch64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
libvncserver-0.9.11: This
/work/armv5te-oe-linux-gnueabi/libvncserver/0.9.11-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
libvncserver-0.9.11: This
/work/core2-64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
libwmf-0.2.8.4: This
/work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates
13 errors [qa_pseudo]
libxml-sax-writer-perl-0.57: This
/work/core2-64-oe-linux/libxml-sax-writer-perl/0.57-r0/pseudo/pseudo.log
indicates 8 errors [qa_pseudo]
lirc-0.9.4d: This
/work/aarch64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
lirc-0.9.4d: This
/work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
lirc-0.9.4d: This
/work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
lvm2-2.02.171: This
/work/core2-64-oe-linux/lvm2/2.02.171-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/aarch64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0=
/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/armv5te-oe-linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b=
10de1-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This
/work/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r=
0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This
/work/aarch64-oe-linux/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/p=
seudo/pseudo.log
indicates 18 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This
/work/core2-64-oe-linux/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/=
pseudo/pseudo.log
indicates 27 errors [qa_pseudo]
mc-4.8.19: This /work/core2-64-oe-linux/mc/4.8.19-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/aarch64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates
11 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
ofono-1.20: This
/work/aarch64-oe-linux/ofono/1.20-r0/pseudo/pseudo.log indicates 16
errors [qa_pseudo]
ofono-1.20: This
/work/armv5te-oe-linux-gnueabi/ofono/1.20-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a=
4:
This /work/aarch64-oe-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62=
e20676a_34e4206aef_fccf7cd6a4-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a=
4:
This /work/core2-64-oe-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a6=
2e20676a_34e4206aef_fccf7cd6a4-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
openhpi-3.6.1: This
/work/armv5te-oe-linux-gnueabi/openhpi/3.6.1-r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
openhpi-3.6.1: This
/work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.log indicates
14 errors [qa_pseudo]
openipmi-2.0.24: This
/work/core2-64-oe-linux/openipmi/2.0.24-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
opensaf-5.17.07: This
/work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates
16 errors [qa_pseudo]
opensaf-5.17.07: This
/work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pseudo/pseudo.log
indicates 20 errors [qa_pseudo]
opensaf-5.17.07: This
/work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates
20 errors [qa_pseudo]
pcmanfm-1.2.5: This
/work/aarch64-oe-linux/pcmanfm/1.2.5-r0/pseudo/pseudo.log indicates 4
errors [qa_pseudo]
puzzles-0.0+gitAUTOINC+8dfe5cec31: This
/work/core2-64-oe-linux/puzzles/1_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseud=
o.log
indicates 18 errors [qa_pseudo]
python3-dbus-1.2.4: This
/work/aarch64-oe-linux/python3-dbus/1.2.4-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
python3-simplejson-3.11.1: This
/work/armv5te-oe-linux-gnueabi/python3-simplejson/3.11.1-r0/pseudo/pseudo.l=
og
indicates 8 errors [qa_pseudo]
qemu-2.10.0: This
/work/core2-64-oe-linux/qemu/2.10.0-r0/pseudo/pseudo.log indicates 12
errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/aarch64-oe-linux/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.lo=
g
indicates 17 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This
/work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/p=
seudo.log
indicates 14 errors [qa_pseudo]
qt5-creator-3.5.1: This
/work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.1-r0/pseudo/pseudo.log
indicates 20 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This
/work/aarch64-oe-linux/qtbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.=
log
indicates 211 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This
/work/armv5te-oe-linux-gnueabi/qtbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo=
/pseudo.log
indicates 14 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This
/work/core2-64-oe-linux/qtbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo=
.log
indicates 16 errors [qa_pseudo]
qtcanvas3d-5.9.2+gitAUTOINC+a1aee8ecbe: This
/work/aarch64-oe-linux/qtcanvas3d/5.9.2+gitAUTOINC+a1aee8ecbe-r0/pseudo/pse=
udo.log
indicates 11 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/aarch64-oe-linux/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseud=
o.log
indicates 10 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/armv5te-oe-linux-gnueabi/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseu=
do/pseudo.log
indicates 12 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This
/work/core2-64-oe-linux/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseu=
do.log
indicates 13 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/aarch64-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo=
/pseudo.log
indicates 14 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/armv5te-oe-linux-gnueabi/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r=
0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This
/work/core2-64-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseud=
o/pseudo.log
indicates 13 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This
/work/aarch64-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/ps=
eudo.log
indicates 11 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This
/work/armv5te-oe-linux-gnueabi/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/p=
seudo/pseudo.log
indicates 24 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This
/work/core2-64-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/p=
seudo.log
indicates 21 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/aarch64-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/=
pseudo.log
indicates 17 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/armv5te-oe-linux-gnueabi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0=
/pseudo/pseudo.log
indicates 42 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This
/work/core2-64-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo=
/pseudo.log
indicates 21 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/aarch64-oe-linux/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseu=
do.log
indicates 11 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/armv5te-oe-linux-gnueabi/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pse=
udo/pseudo.log
indicates 14 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This
/work/core2-64-oe-linux/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pse=
udo.log
indicates 13 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/aarch64-oe-linux/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseu=
do.log
indicates 11 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/armv5te-oe-linux-gnueabi/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pse=
udo/pseudo.log
indicates 12 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This
/work/core2-64-oe-linux/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pse=
udo.log
indicates 15 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/aarch64-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0=
/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/armv5te-oe-linux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633=
072fc-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This
/work/core2-64-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r=
0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/aarch64-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/p=
seudo.log
indicates 11 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/armv5te-oe-linux-gnueabi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/=
pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This
/work/core2-64-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/=
pseudo.log
indicates 13 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This
/work/aarch64-oe-linux/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/=
pseudo.log
indicates 5 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This
/work/armv5te-oe-linux-gnueabi/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0=
/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This
/work/core2-64-oe-linux/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo=
/pseudo.log
indicates 13 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/aarch64-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseud=
o.log
indicates 18 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/armv5te-oe-linux-gnueabi/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseu=
do/pseudo.log
indicates 26 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This
/work/core2-64-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseu=
do.log
indicates 19 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/aarch64-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseu=
do/pseudo.log
indicates 11 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/armv5te-oe-linux-gnueabi/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f=
-r0/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This
/work/core2-64-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pse=
udo/pseudo.log
indicates 14 errors [qa_pseudo]
qtquickcontrols-5.9.2+gitAUTOINC+8476f8fff7: This
/work/core2-64-oe-linux/qtquickcontrols/5.9.2+gitAUTOINC+8476f8fff7-r0/pseu=
do/pseudo.log
indicates 16 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/aarch64-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseud=
o/pseudo.log
indicates 11 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/armv5te-oe-linux-gnueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-=
r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This
/work/core2-64-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseu=
do/pseudo.log
indicates 13 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This
/work/aarch64-oe-linux/qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseud=
o.log
indicates 11 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This
/work/armv5e-oe-linux-gnueabi/qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseud=
o/pseudo.log
indicates 13 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This
/work/core2-64-oe-linux/qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseu=
do.log
indicates 19 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/armv5te-oe-linux-gnueabi/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseud=
o/pseudo.log
indicates 13 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This
/work/core2-64-oe-linux/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseud=
o.log
indicates 13 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/aarch64-oe-linux/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseu=
do.log
indicates 13 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/armv5te-oe-linux-gnueabi/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pse=
udo/pseudo.log
indicates 15 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This
/work/core2-64-oe-linux/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pse=
udo.log
indicates 15 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This
/work/armv5te-oe-linux-gnueabi/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/p=
seudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This
/work/core2-64-oe-linux/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/p=
seudo.log
indicates 13 errors [qa_pseudo]

qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This
/work/aarch64-oe-linux/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/p=
seudo.log
indicates 5 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This
/work/armv5te-oe-linux-gnueabi/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/=
pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This
/work/core2-64-oe-linux/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/=
pseudo.log
indicates 7 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This
/work/aarch64-oe-linux/qtsvg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.l=
og
indicates 15 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This
/work/armv5te-oe-linux-gnueabi/qtsvg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/=
pseudo.log
indicates 17 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This
/work/core2-64-oe-linux/qtsvg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.=
log
indicates 13 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/aarch64-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseu=
do.log
indicates 11 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/armv5te-oe-linux-gnueabi/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pse=
udo/pseudo.log
indicates 12 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This
/work/core2-64-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pse=
udo.log
indicates 14 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/aarch64-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo=
.log
indicates 12 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/armv5te-oe-linux-gnueabi/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseud=
o/pseudo.log
indicates 15 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This
/work/core2-64-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseud=
o.log
indicates 12 errors [qa_pseudo]
qttranslations-5.9.2+gitAUTOINC+325a90e07e: This
/work/core2-64-oe-linux/qttranslations/5.9.2+gitAUTOINC+325a90e07e-r0/pseud=
o/pseudo.log
indicates 6 errors [qa_pseudo]
qtvirtualkeyboard-5.9.2+gitAUTOINC+87218c4e68: This
/work/aarch64-oe-linux/qtvirtualkeyboard/5.9.2+gitAUTOINC+87218c4e68-r0/pse=
udo/pseudo.log
indicates 10 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This
/work/aarch64-oe-linux/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseu=
do.log
indicates 18 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This
/work/armv5te-oe-linux-gnueabi/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pse=
udo/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/aarch64-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/p=
seudo.log
indicates 11 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This
/work/armv5te-oe-linux-gnueabi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/=
pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/aarch64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r=
0/pseudo/pseudo.log
indicates 11 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This
/work/core2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-=
r0/pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/aarch64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseud=
o.log
indicates 12 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/armv5e-oe-linux-gnueabi/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseud=
o/pseudo.log
indicates 13 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This
/work/core2-64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseu=
do.log
indicates 14 errors [qa_pseudo]
qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This
/work/core2-64-oe-linux/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/ps=
eudo/pseudo.log
indicates 12 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/aarch64-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/p=
seudo.log
indicates 11 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/armv5te-oe-linux-gnueabi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/=
pseudo/pseudo.log
indicates 14 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This
/work/core2-64-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/=
pseudo.log
indicates 14 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/aarch64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseu=
do.log
indicates 12 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This
/work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pse=
udo.log
indicates 7 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This
/work/aarch64-oe-linux/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/ps=
eudo.log
indicates 11 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This
/work/armv5te-oe-linux-gnueabi/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/p=
seudo/pseudo.log
indicates 8 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This
/work/core2-64-oe-linux/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/p=
seudo.log
indicates 7 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/armv5te-oe-linux-gnueabi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0=
/pseudo/pseudo.log
indicates 13 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This
/work/core2-64-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo=
/pseudo.log
indicates 14 errors [qa_pseudo]
rpm-4.13.90+gitAUTOINC+a8e51b3bb0: This
/work/armv5te-oe-linux-gnueabi/rpm/1_4.13.90+gitAUTOINC+a8e51b3bb0-r0/pseud=
o/pseudo.log
indicates 12 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseudo/pseudo.log
indicates 17 errors [qa_pseudo]
rsyslog-8.29.0: This
/work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates
10 errors [qa_pseudo]
settings-daemon-0.0.2: This
/work/aarch64-oe-linux/settings-daemon/0.0.2-r0/pseudo/pseudo.log
indicates 10 errors [qa_pseudo]
strace-4.18: This
/work/aarch64-oe-linux/strace/4.18-r0/pseudo/pseudo.log indicates 10
errors [qa_pseudo]
strace-4.18: This
/work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
tunctl-1.5: This
/work/aarch64-oe-linux/tunctl/1.5-r0/pseudo/pseudo.log indicates 8
errors [qa_pseudo]
upower-0.99.5: This
/work/core2-64-oe-linux/upower/0.99.5-r0/pseudo/pseudo.log indicates
16 errors [qa_pseudo]
vlc-2.2.2: This /work/core2-64-oe-linux/vlc/2.2.2-r0/pseudo/pseudo.log
indicates 12 errors [qa_pseudo]
weston-2.0.0: This
/work/aarch64-oe-linux/weston/2.0.0-r0/pseudo/pseudo.log indicates 16
errors [qa_pseudo]
xfce4-appfinder-4.12.0: This
/work/core2-64-oe-linux/xfce4-appfinder/4.12.0-r0/pseudo/pseudo.log
indicates 18 errors [qa_pseudo]
xfce4-places-plugin-1.7.0: This
/work/core2-64-oe-linux/xfce4-places-plugin/1.7.0-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]
xfce4-sensors-plugin-1.2.97: This
/work/armv5te-oe-linux-gnueabi/xfce4-sensors-plugin/1.2.97-r0/pseudo/pseudo=
.log
indicates 12 errors [qa_pseudo]
xfce4-weather-plugin-0.8.9: This
/work/core2-64-oe-linux/xfce4-weather-plugin/0.8.9-r0/pseudo/pseudo.log
indicates 18 errors [qa_pseudo]
zbar-0.10: This /work/aarch64-oe-linux/zbar/0.10-r0/pseudo/pseudo.log
indicates 16 errors [qa_pseudo]



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
62c7c98 systemd: Fix build on musl
de68252 systemd: Fix build with musl/mips64

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D

latest upstream commit:
5d6d21e libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
not included in master yet:
ebcef48 bridge-utils: modify the AR to cross toolchain

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:
d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
not included in master yet:
197811b qtwebengine: make test suite succeed

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:
26d5066 firefox: fix build failures
not included in master yet:
6773bf9 meta: drop ${COREBASE}/LICENSE references

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D REPORT STOP =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

sending incremental file list

--94eb2c1c1660aca8b7055cde039c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre style=3D"box-sizing:border-box;white-space:pre-wrap;w=
ord-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fo=
nt-size:14px">With 2 pending patches from Khem to build systemd with musl:<=
/pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:bre=
ak-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px=
">62c7c98 systemd: Fix build on musl
de68252 systemd: Fix build with musl/mips64</pre><pre style=3D"box-sizing:b=
order-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px;color:rgb(51,51,51);font-size:14px">the qemux86+musl build was ab=
le to progress much further and fewer ERROR messages were shown. Basically =
only uim recipe now depends on glibc and fails to be included in build queu=
e:</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:=
break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:1=
4px"><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;whi=
te-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px"><b=
r></pre><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;=
white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px"=
>Summary: There were 55 ERROR messages shown, returning a non-zero exit cod=
e.</pre><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;=
white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px"=
><br></pre><pre class=3D"gmail-console-output" style=3D"box-sizing:border-b=
ox;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0=
px"><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;whit=
e-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px">Par=
sing of 2356 .bb files complete (2355 cached, 1 parsed). 3228 targets, 48 s=
kipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES &#39;glibc-gconv-euc-jp&#39; (but /home/jenkins/oe=
/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/<a href=3D"ht=
tp://uim_1.8.6.bb">uim_1.8.6.bb</a> RDEPENDS on or otherwise requires it)
NOTE: Runtime target &#39;glibc-gconv-euc-jp&#39; is unbuildable, removing.=
..
Missing or unbuildable dependency chain was: [&#39;glibc-gconv-euc-jp&#39;]
NOTE: Runtime target &#39;uim-dev&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;uim-dev&#39;, &#39;glibc=
-gconv-euc-jp&#39;]
NOTE: Runtime target &#39;uim&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;uim&#39;, &#39;glibc-gco=
nv-euc-jp&#39;]
NOTE: Runtime target &#39;libuim0&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;libuim0&#39;, &#39;glibc=
-gconv-euc-jp&#39;]
ERROR: Nothing RPROVIDES &#39;glibc-utils&#39; (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/<a href=3D"http://ui=
m_1.8.6.bb">uim_1.8.6.bb</a> RDEPENDS on or otherwise requires it)
NOTE: Runtime target &#39;glibc-utils&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;glibc-utils&#39;]</pre><=
/pre><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;whi=
te-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px"><b=
r></pre></pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word=
-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-=
size:14px">Some logs weren&#39;t uploaded to the <a href=3D"http://logs.nsl=
u2-linux.org/buildlogs/oe/world/rocko/log.report.20171031_095148.log" style=
=3D"font-family:arial,sans-serif;color:rgb(92,53,102);box-sizing:border-box=
;word-wrap:break-word">http://logs.nslu2-linux.org/buildlogs</a> because it=
 run out of disk space again.</pre><pre style=3D"box-sizing:border-box;whit=
e-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;colo=
r:rgb(51,51,51);font-size:14px"><br></pre><pre style=3D"box-sizing:border-b=
ox;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0=
px;color:rgb(51,51,51);font-size:14px"><pre id=3D"gmail-out" class=3D"gmail=
-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-w=
rap:break-word;margin-top:0px;margin-bottom:0px"><pre style=3D"box-sizing:b=
order-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px"><a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status=
" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)"=
>http://www.openembedded.org/wiki/Bitbake_World_Status</a>

=3D=3D Number of issues - stats =3D=3D
{| class=3D&#39;wikitable&#39;
!|Date		     !!colspan=3D&#39;4&#39;|Failed tasks			    !!|Signatures		  !!=
colspan=3D&#39;15&#39;|QA !!Comment
|-
||		||qemuarm	||qemuarm64	||qemux86	||qemux86_64	||all 	||already-stripped	=
||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||ho=
st-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||sy=
mlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-pat=
h	||qa_pseudo	||=09
|-
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">||2017-10-30	||2	||6	||26	||1	||=
0	||0		||0		||1		||0		||0		||28		||2		||0		||0		||0		||0		||0		||0		||0		||=
158		||=09
|}

=3D=3D Failed tasks 2017-10-30 =3D=3D

INFO: jenkins-job.sh-1.8.39 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171031_095148.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171031_095=
148.log</a>

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_pac=
kage_qa

=3D=3D=3D qemuarm64 (5) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:do_comp=
ile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.=
bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc=
_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-kli=
bc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_=
compile

=3D=3D=3D qemux86 (26) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.=
1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.1=
7.07.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3=
.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rs=
h_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit=
-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit=
-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.50.=
9.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8=
beta5.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/open-isns/open-isns=
_0.97.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_compil=
e
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_comp=
ile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumpe=
r_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb:=
do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-systemd=
_234.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-systemd_=
234.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-boo=
tchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_co=
mpile
    * openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_g=
it.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-bad_1.12.2.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package=
_qa

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa

=3D=3D=3D Number of failed tasks (35) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20171030_061538.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20171030_061538.log/</a> ||=20
|-
|| qemuarm64 	|| 6	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/=
world/rocko/log.world.qemuarm64.20171030_165541.log/" style=3D"box-sizing:b=
order-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linu=
x.org/buildlogs/oe/world/rocko/log.world.qemuarm64.20171030_165541.log/</a>=
 || <a href=3D"http://errors.yoctoproject.org/Errors/Build/47895/" style=3D=
"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://er=
rors.yoctoproject.org/Errors/Build/47895/</a>
|-
|| qemux86 	|| 26	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/rocko/log.world.qemux86.20171030_061543.log/" style=3D"box-sizing:bord=
er-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.o=
rg/buildlogs/oe/world/rocko/log.world.qemux86.20171030_061543.log/</a> || <=
a href=3D"http://errors.yoctoproject.org/Errors/Build/47880/" style=3D"box-=
sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.=
yoctoproject.org/Errors/Build/47880/</a>
|-
|| qemux86_64 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20171030_191803.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171030_191803.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/47897/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/47897/</a>
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">=3D=3D=3D QA issues (189) =3D=3D=
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
||158	||qa_pseudo
|-
||1	||textrel
|-
||28	||version-going-backwards
|-
||2	||host-user-contaminated
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20171031_072554.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20171031_072554.log/</a>


    * ERROR: Nothing RPROVIDES &#39;glibc-utils&#39; (but /home/jenkins/oe/=
world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/<a href=3D"htt=
p://uim_1.8.6.bb">uim_1.8.6.bb</a> RDEPENDS on or otherwise requires it)
    * ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buil=
dable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /ho=
me/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES &#39;glibc-utils&#39; (but /home/jenkins/oe/=
world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/<a href=3D"htt=
p://uim_1.8.6.bb">uim_1.8.6.bb</a> RDEPENDS on or otherwise requires it)
    * ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buil=
dable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/j=
enkins/oe/world/shr-core/tmp-glibc/stamps


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


count: 1	issue: textrel
corosync-2.4.2: ELF binary &#39;/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync&#39; has relocations in .text [tex=
trel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 28	issue: version-going-backwards
packagegroup-core-tools-debug-1.0: Package version for package packagegroup=
-core-tools-debug-dbg went backwards which would break package feeds from (=
0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package packagegroup=
-core-tools-debug-dev went backwards which would break package feeds from (=
0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package packagegroup=
-core-tools-debug-ptest went backwards which would break package feeds from=
 (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package packagegroup=
-core-tools-debug went backwards which would break package feeds from (0:1.=
0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-dbg went backwards which would break package feeds from (0:1.0-r13.=
14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-debug-dbg went backwards which would break package feeds from (0:1.=
0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-debug-dev went backwards which would break package feeds from (0:1.=
0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-debug-ptest went backwards which would break package feeds from (0:=
1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-debug went backwards which would break package feeds from (0:1.0-r1=
3.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-dev went backwards which would break package feeds from (0:1.0-r13.=
14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-extended-dbg went backwards which would break package feeds from (0=
:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-extended-dev went backwards which would break package feeds from (0=
:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-extended-ptest went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-extended went backwards which would break package feeds from (0:1.0=
-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-graphics-dbg went backwards which would break package feeds from (0=
:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-graphics-dev went backwards which would break package feeds from (0=
:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-graphics-ptest went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-graphics went backwards which would break package feeds from (0:1.0=
-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-host-tools-dbg went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-host-tools-dev went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-host-tools-ptest went backwards which would break package feeds fro=
m (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-host-tools went backwards which would break package feeds from (0:1=
.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-ptest went backwards which would break package feeds from (0:1.0-r1=
3.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-sdk-dbg went backwards which would break package feeds from (0:1.0-=
r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-sdk-dev went backwards which would break package feeds from (0:1.0-=
r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-sdk-ptest went backwards which would break package feeds from (0:1.=
0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-sdk went backwards which would break package feeds from (0:1.0-r13.=
14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted went backwards which would break package feeds from (0:1.0-r13.14 t=
o 0:1.0-r13.13) [version-going-backwards]


</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 2	issue: host-user-contam=
inated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ms-my/usr/lib/loc=
ale/ms_MY/LC_COLLATE is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-quz-pe/usr/lib/lo=
cale/quz_PE/LC_NAME is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated=
]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 158	issue: qa_pseudo
bluez5-5.46: This /work/aarch64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
bluez5-5.46: This /work/armv5te-oe-linux-gnueabi/bluez5/5.46-r0/pseudo/pseu=
do.log indicates 17 errors [qa_pseudo]
bluez5-5.46: This /work/core2-64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log =
indicates 10 errors [qa_pseudo]
cairo-1.14.10: This /work/core2-64-oe-linux/cairo/1.14.10-r0/pseudo/pseudo.=
log indicates 24 errors [qa_pseudo]
collectd-5.7.2: This /work/aarch64-oe-linux/collectd/5.7.2-r0/pseudo/pseudo=
.log indicates 17 errors [qa_pseudo]
collectd-5.7.2: This /work/armv5te-oe-linux-gnueabi/collectd/5.7.2-r0/pseud=
o/pseudo.log indicates 13 errors [qa_pseudo]
dhcpcd-6.11.3: This /work/aarch64-oe-linux/dhcpcd/6.11.3-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/aarch64-oe-linux/gobject-introspec=
tion/1.52.1-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/armv5te-oe-linux-gnueabi/gobject-i=
ntrospection/1.52.1-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/core2-64-oe-linux/gobject-introspe=
ction/1.52.1-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/aarch64-oe-linux/lcdproc/0.=
5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors [qa_pseu=
do]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/lc=
dproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
libatasmart-0.19: This /work/aarch64-oe-linux/libatasmart/0.19-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
libatasmart-0.19: This /work/core2-64-oe-linux/libatasmart/0.19-r0/pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linux/lib=
connman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 11 e=
rrors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux-gnu=
eabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indica=
tes 11 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/li=
bconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 11 =
errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/aarch64-oe-linux/libqofon=
o/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 11 errors [qa_=
pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueabi/=
libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 err=
ors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/libqofo=
no/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 errors [qa=
_pseudo]
librepo-1.7.20+gitAUTOINC+e1137cbbda: This /work/aarch64-oe-linux/librepo/1=
.7.20+gitAUTOINC+e1137cbbda-r0/pseudo/pseudo.log indicates 10 errors [qa_ps=
eudo]
libvncserver-0.9.11: This /work/aarch64-oe-linux/libvncserver/0.9.11-r0/pse=
udo/pseudo.log indicates 11 errors [qa_pseudo]
libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9.1=
1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/ps=
eudo/pseudo.log indicates 13 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseud=
o.log indicates 13 errors [qa_pseudo]
libxml-sax-writer-perl-0.57: This /work/core2-64-oe-linux/libxml-sax-writer=
-perl/0.57-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
lirc-0.9.4d: This /work/aarch64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseu=
do.log indicates 13 errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log =
indicates 12 errors [qa_pseudo]
lvm2-2.02.171: This /work/core2-64-oe-linux/lvm2/2.02.171-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/aarch64-oe-li=
nux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log =
indicates 11 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-li=
nux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe-l=
inux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log=
 indicates 12 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/aarch64-oe-linu=
x/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log indi=
cates 18 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/core2-64-oe-lin=
ux/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log ind=
icates 27 errors [qa_pseudo]
mc-4.8.19: This /work/core2-64-oe-linux/mc/4.8.19-r0/pseudo/pseudo.log indi=
cates 12 errors [qa_pseudo]
net-snmp-5.7.3: This /work/aarch64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo=
.log indicates 11 errors [qa_pseudo]
net-snmp-5.7.3: This /work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseud=
o/pseudo.log indicates 13 errors [qa_pseudo]
net-snmp-5.7.3: This /work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
ofono-1.20: This /work/aarch64-oe-linux/ofono/1.20-r0/pseudo/pseudo.log ind=
icates 16 errors [qa_pseudo]
ofono-1.20: This /work/armv5te-oe-linux-gnueabi/ofono/1.20-r0/pseudo/pseudo=
.log indicates 16 errors [qa_pseudo]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a=
4: This /work/aarch64-oe-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_=
a62e20676a_34e4206aef_fccf7cd6a4-r0/pseudo/pseudo.log indicates 16 errors [=
qa_pseudo]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a=
4: This /work/core2-64-oe-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed=
_a62e20676a_34e4206aef_fccf7cd6a4-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
openhpi-3.6.1: This /work/armv5te-oe-linux-gnueabi/openhpi/3.6.1-r0/pseudo/=
pseudo.log indicates 14 errors [qa_pseudo]
openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.=
log indicates 14 errors [qa_pseudo]
openipmi-2.0.24: This /work/core2-64-oe-linux/openipmi/2.0.24-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
opensaf-5.17.07: This /work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/pseu=
do.log indicates 16 errors [qa_pseudo]
opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pse=
udo/pseudo.log indicates 20 errors [qa_pseudo]
opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pse=
udo.log indicates 20 errors [qa_pseudo]
pcmanfm-1.2.5: This /work/aarch64-oe-linux/pcmanfm/1.2.5-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
puzzles-0.0+gitAUTOINC+8dfe5cec31: This /work/core2-64-oe-linux/puzzles/1_0=
.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.log indicates 18 errors [qa_pseud=
o]
python3-dbus-1.2.4: This /work/aarch64-oe-linux/python3-dbus/1.2.4-r0/pseud=
o/pseudo.log indicates 10 errors [qa_pseudo]
python3-simplejson-3.11.1: This /work/armv5te-oe-linux-gnueabi/python3-simp=
lejson/3.11.1-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
qemu-2.10.0: This /work/core2-64-oe-linux/qemu/2.10.0-r0/pseudo/pseudo.log =
indicates 12 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/aarch64-oe-linux/qt3d/5.9.2+gi=
tAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/armv5te-oe-linux-gnueabi/qt3d/=
5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 14 errors [qa_ps=
eudo]
qt5-creator-3.5.1: This /work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.1-r0=
/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/aarch64-oe-linux/qtbase/5.9.=
2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 211 errors [qa_pseud=
o]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/armv5te-oe-linux-gnueabi/qtb=
ase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 14 errors [q=
a_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/core2-64-oe-linux/qtbase/5.9=
.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 16 errors [qa_pseud=
o]
qtcanvas3d-5.9.2+gitAUTOINC+a1aee8ecbe: This /work/aarch64-oe-linux/qtcanva=
s3d/5.9.2+gitAUTOINC+a1aee8ecbe-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/aarch64-oe-linux/qtcharts/=
5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 10 errors [qa_ps=
eudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/armv5te-oe-linux-gnueabi/q=
tcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 12 error=
s [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/core2-64-oe-linux/qtcharts=
/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 13 errors [qa_p=
seudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/aarch64-oe-linux/qtc=
onnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates 14 e=
rrors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/armv5te-oe-linux-gnu=
eabi/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indica=
tes 14 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/core2-64-oe-linux/qt=
connectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates 13 =
errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/aarch64-oe-linux/qtdata=
vis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/armv5te-oe-linux-gnueab=
i/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 24=
 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/core2-64-oe-linux/qtdat=
avis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 21 errors=
 [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/aarch64-oe-linux/qtde=
clarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 17 err=
ors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/armv5te-oe-linux-gnue=
abi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicate=
s 42 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/core2-64-oe-linux/qtd=
eclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 21 er=
rors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/aarch64-oe-linux/qtengini=
o/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 errors [qa_=
pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnueabi/=
qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 14 err=
ors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/core2-64-oe-linux/qtengin=
io/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 13 errors [qa=
_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/aarch64-oe-linux/qtgamepa=
d/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 11 errors [qa_=
pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/armv5te-oe-linux-gnueabi/=
qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/core2-64-oe-linux/qtgamep=
ad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 15 errors [qa=
_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/aarch64-oe-li=
nux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log =
indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/armv5te-oe-li=
nux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/core2-64-oe-l=
inux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log=
 indicates 13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/aarch64-oe-linux/qtmul=
timedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/armv5te-oe-linux-gnuea=
bi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates =
13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/core2-64-oe-linux/qtmu=
ltimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 13 erro=
rs [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/aarch64-oe-linux/qtne=
tworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 5 erro=
rs [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/armv5te-oe-linux-gnue=
abi/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicate=
s 13 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/core2-64-oe-linux/qtn=
etworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 13 er=
rors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/aarch64-oe-linux/qtquick1/=
5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 18 errors [qa_ps=
eudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/armv5te-oe-linux-gnueabi/q=
tquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 26 error=
s [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/core2-64-oe-linux/qtquick1=
/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 19 errors [qa_p=
seudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/aarch64-oe-linux/q=
tquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicates =
11 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/armv5te-oe-linux-g=
nueabi/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log in=
dicates 13 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/core2-64-oe-linux/=
qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicates=
 14 errors [qa_pseudo]
qtquickcontrols-5.9.2+gitAUTOINC+8476f8fff7: This /work/core2-64-oe-linux/q=
tquickcontrols/5.9.2+gitAUTOINC+8476f8fff7-r0/pseudo/pseudo.log indicates 1=
6 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/aarch64-oe-linux/qt=
remoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates 11=
 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/armv5te-oe-linux-gn=
ueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indi=
cates 12 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/core2-64-oe-linux/q=
tremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates 1=
3 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/aarch64-oe-linux/qtscript/=
5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 11 errors [qa_ps=
eudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/armv5e-oe-linux-gnueabi/qt=
script/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 13 errors=
 [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/core2-64-oe-linux/qtscript=
/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 19 errors [qa_p=
seudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/armv5te-oe-linux-gnueabi/qt=
scxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 errors =
[qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/core2-64-oe-linux/qtscxml/5=
.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 errors [qa_pse=
udo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/aarch64-oe-linux/qtsensor=
s/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 13 errors [qa_=
pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/armv5te-oe-linux-gnueabi/=
qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 15 err=
ors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/core2-64-oe-linux/qtsenso=
rs/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 15 errors [qa=
_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/armv5te-oe-linux-gnueab=
i/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 12=
 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/core2-64-oe-linux/qtser=
ialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 13 errors=
 [qa_pseudo]
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">qtserialport-5.9.2+gitAUTOINC+cb=
9ade8bea: This /work/aarch64-oe-linux/qtserialport/5.9.2+gitAUTOINC+cb9ade8=
bea-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/armv5te-oe-linux-gnuea=
bi/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates =
7 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/core2-64-oe-linux/qtse=
rialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 7 error=
s [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/aarch64-oe-linux/qtsvg/5.9.2+=
gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/armv5te-oe-linux-gnueabi/qtsv=
g/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 17 errors [qa_=
pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/core2-64-oe-linux/qtsvg/5.9.2=
+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/aarch64-oe-linux/qtsystem=
s/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 11 errors [qa_=
pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/armv5te-oe-linux-gnueabi/=
qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/core2-64-oe-linux/qtsyste=
ms/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 14 errors [qa=
_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/aarch64-oe-linux/qttools/5.=
9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 12 errors [qa_pseu=
do]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/armv5te-oe-linux-gnueabi/qt=
tools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 15 errors =
[qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/core2-64-oe-linux/qttools/5=
.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 12 errors [qa_pse=
udo]
qttranslations-5.9.2+gitAUTOINC+325a90e07e: This /work/core2-64-oe-linux/qt=
translations/5.9.2+gitAUTOINC+325a90e07e-r0/pseudo/pseudo.log indicates 6 e=
rrors [qa_pseudo]
qtvirtualkeyboard-5.9.2+gitAUTOINC+87218c4e68: This /work/aarch64-oe-linux/=
qtvirtualkeyboard/5.9.2+gitAUTOINC+87218c4e68-r0/pseudo/pseudo.log indicate=
s 10 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/aarch64-oe-linux/qtwaylan=
d/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 18 errors [qa_=
pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/armv5te-oe-linux-gnueabi/=
qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 13 err=
ors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/aarch64-oe-linux/qtweb=
channel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/armv5te-oe-linux-gnuea=
bi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates =
12 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/aarch64-oe-l=
inux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.lo=
g indicates 11 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/core2-64-oe-=
linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.l=
og indicates 14 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/aarch64-oe-linux/qtwebkit/=
5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 12 errors [qa_ps=
eudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueabi/qt=
webkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 13 errors=
 [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwebkit=
/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 14 errors [qa_p=
seudo]
qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This /work/core2-64-oe-linux=
/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicat=
es 12 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/aarch64-oe-linux/qtweb=
sockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/armv5te-oe-linux-gnuea=
bi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates =
14 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/core2-64-oe-linux/qtwe=
bsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 14 erro=
rs [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/aarch64-oe-linux/qtwebvie=
w/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 12 errors [qa_=
pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/core2-64-oe-linux/qtwebvi=
ew/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 7 errors [qa_=
pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/aarch64-oe-linux/qtx11e=
xtras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/armv5te-oe-linux-gnueab=
i/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 8 =
errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/core2-64-oe-linux/qtx11=
extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 7 errors =
[qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/armv5te-oe-linux-gnue=
abi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicate=
s 13 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/core2-64-oe-linux/qtx=
mlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 14 er=
rors [qa_pseudo]
rpm-4.13.90+gitAUTOINC+a8e51b3bb0: This /work/armv5te-oe-linux-gnueabi/rpm/=
1_4.13.90+gitAUTOINC+a8e51b3bb0-r0/pseudo/pseudo.log indicates 12 errors [q=
a_pseudo]
rsyslog-8.29.0: This /work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo=
.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseud=
o/pseudo.log indicates 17 errors [qa_pseudo]
rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
settings-daemon-0.0.2: This /work/aarch64-oe-linux/settings-daemon/0.0.2-r0=
/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
strace-4.18: This /work/aarch64-oe-linux/strace/4.18-r0/pseudo/pseudo.log i=
ndicates 10 errors [qa_pseudo]
strace-4.18: This /work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
tunctl-1.5: This /work/aarch64-oe-linux/tunctl/1.5-r0/pseudo/pseudo.log ind=
icates 8 errors [qa_pseudo]
upower-0.99.5: This /work/core2-64-oe-linux/upower/0.99.5-r0/pseudo/pseudo.=
log indicates 16 errors [qa_pseudo]
vlc-2.2.2: This /work/core2-64-oe-linux/vlc/2.2.2-r0/pseudo/pseudo.log indi=
cates 12 errors [qa_pseudo]
weston-2.0.0: This /work/aarch64-oe-linux/weston/2.0.0-r0/pseudo/pseudo.log=
 indicates 16 errors [qa_pseudo]
xfce4-appfinder-4.12.0: This /work/core2-64-oe-linux/xfce4-appfinder/4.12.0=
-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
xfce4-places-plugin-1.7.0: This /work/core2-64-oe-linux/xfce4-places-plugin=
/1.7.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xfce4-sensors-plugin-1.2.97: This /work/armv5te-oe-linux-gnueabi/xfce4-sens=
ors-plugin/1.2.97-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xfce4-weather-plugin-0.8.9: This /work/core2-64-oe-linux/xfce4-weather-plug=
in/0.8.9-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
zbar-0.10: This /work/aarch64-oe-linux/zbar/0.10-r0/pseudo/pseudo.log indic=
ates 16 errors [qa_pseudo]



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
62c7c98 systemd: Fix build on musl
de68252 systemd: Fix build with musl/mips64

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
5d6d21e libreport: fix Nothing RPROVIDES &#39;lib32-python3-libreport&#39;
not included in master yet:=20
ebcef48 bridge-utils: modify the AR to cross toolchain

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
not included in master yet:=20
197811b qtwebengine: make test suite succeed

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
26d5066 firefox: fix build failures
not included in master yet:=20
6773bf9 meta: drop ${COREBASE}/LICENSE references

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D REPORT STOP =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">sending incremental file list</p=
re></pre></pre></div>

--94eb2c1c1660aca8b7055cde039c--
