Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id B352F60616;
	Wed,  4 Oct 2017 14:46:34 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id o44so7019847wrf.11;
	Wed, 04 Oct 2017 07:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Pa4EeUkExWGCUbQRHp0Sptk+/Oy7XozoDm5x9n6YSks=;
	b=sSMOGorXdaLPR83IlnapBdSTfsa2qbydh3iJCTE32TSoig2nt12uVnDLi0iU827KV7
	FEkXLM48FHgZ604y6sxu3RBDIzRwkBV1qDD4wq36dvqbyLJaFKO0GpaQdEYu9WsWs5qS
	e50ZkdYfHBoKueTOriCOx9BRHlEJsBdRxGMK593W+zgxydpRsX3MJqsM1RxRk3eXkdPm
	WzJlJCSUvkbYlYp6XthAmdjFMz8r0qr+0lzo2ddOUlWFbyvgK7uc55KvDyofPPbaPT1r
	/CxJ50PivLlcS+T4qzArbXNCIvgnghX4pHjlM4HSOOrmF7TjBeAfhXRPQaoTWejYYA8y
	oBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Pa4EeUkExWGCUbQRHp0Sptk+/Oy7XozoDm5x9n6YSks=;
	b=hTrFGY1oQC5FBRg0ssdBhu6dVBbI4fqVp+0rS9ARxMp/M+95rI8N3k+gNDUbp9ELK2
	jdKRUQkmYrfWzibQdsPh7/FZ8yPFSOFgbOdQBZtKqi0rbnfdauhCcu/iDk3PyHnZFpPy
	k+AwnZoxdx/gCAL+AXGcm1CU0qWkJJRqpVVG3jyJ/WFXkrhFzwhMaMHszwJTf8GbRgCE
	uFtjNBDN06LmnTSVhcdHv7hdvRFBNpxPRAVUz8lxJ+xrEI41tPXPSAPZhJTLuc/JZnkp
	SbTAgZYrGpgEXzPomqTzLWH5ZbG7K2RqTSnAHy4hJO13cVOVftaCgfBWDDXh4McMWIC7
	1AZA==
X-Gm-Message-State: AMCzsaVlmcD2Awm20GLnN3pOVTNuBf2b2YrEu/96pyhHrxQ6Dzg8x6d/
	h6RoBIqRqVIZb3xgnnDG9//2pURwHNhJFY1H23LncA==
X-Google-Smtp-Source: AOwi7QCzTY0wGNCyLRUAYOfg7hsBBhakIhHZL/jhfLpBkWb+SaHnKIcea/Np2qlugXvTthrCKNtzZtDZofpOPUdDYbQ=
X-Received: by 10.223.134.68 with SMTP id 4mr7022019wrw.67.1507128394709; Wed,
	04 Oct 2017 07:46:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Wed, 4 Oct 2017 07:46:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Oct 2017 16:46:33 +0200
Message-ID: <CA+chaQcfoTb=1j0cXaEUms5KPXJRhqTMLNJjqxXZD4UirpZowg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-10-04
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
X-List-Received-Date: Wed, 04 Oct 2017 14:46:35 -0000
Content-Type: multipart/alternative; boundary="001a1149243a990198055ab9ac87"

--001a1149243a990198055ab9ac87
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

||2017-10-04	||3	||3	||1	||0	||0		||0		||3		||0		||0		||0		||4		||0		||0		|=
|0		||0		||0		||0		||0		||8		||
|}

=3D=3D Failed tasks 2017-10-04 =3D=3D

INFO: jenkins-job.sh-1.8.34 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171004_04=
4548.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_package_q=
a
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_pac=
kage_qa

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/spice/spice_git.bb:=
do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package=
_qa

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa

=3D=3D=3D Number of failed tasks (7) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.2017=
1003_234707.log/
|| http://errors.yoctoproject.org/Errors/Build/47291/
|-
|| qemux86 	|| 3	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.2017=
1003_234422.log/
|| http://errors.yoctoproject.org/Errors/Build/47292/
|-
|| qemux86_64 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.2=
0171004_020534.log/
|| http://errors.yoctoproject.org/Errors/Build/47293/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (15) =3D=3D=3D
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
||3	||textrel
|-
||4	||host-user-contaminated
|-
||8	||qa_pseudo
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20171004_020458.log/

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


count: 4	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-ar-iq/usr/lib/locale/ar_IQ/LC_MESSAGES/SYS_LC_MESS=
AGES
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-et-ee.iso-8859-1/usr/lib/locale/et_EE.ISO-8859-1/L=
C_MEASUREMENT
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-sq-al.iso-8859-1/usr/lib/locale/sq_AL.ISO-8859-1/L=
C_CTYPE
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
libqofono: /libqofono-tests/usr/lib/libqofono-qt5/tests/tst_qofonocallbarri=
ng
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 8	issue: qa_pseudo
initramfs-debug-1.0: This
/work/all-oe-linux/initramfs-debug/1.0-r0/pseudo/pseudo.log indicates
12 errors [qa_pseudo]
python3-pylint-1.7.4: This
/work/armv5te-oe-linux-gnueabi/python3-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python3-pylint-1.7.4: This
/work/core2-64-oe-linux/python3-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This
/work/i586-oe-linux/python3-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 5 errors [qa_pseudo]
python-cython-0.27.1: This
/work/armv5te-oe-linux-gnueabi/python-cython/0.27.1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-pylint-1.7.4: This
/work/armv5te-oe-linux-gnueabi/python-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python-pylint-1.7.4: This
/work/core2-64-oe-linux/python-pylint/1.7.4-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This
/work/i586-oe-linux/python-pylint/1.7.4-r0/pseudo/pseudo.log indicates
6 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D

latest upstream commit:
41ba3c8 bitbake-user-manual: Updated kernel version in PREFERRED_VERSION ex=
ample
not included in master yet:
147593d world-image: add extra target
0cb0324 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:
abf2e95 systemd-serialtty: allow empty package
not included in master yet:
1daab8f report-error: Allow to upload reports automatically
f77002f buildhistory.bbclass: metadata-revs show repo parent
8139c3f metadata-revs: provide more information
a26f1b3 qemux86: Add identical qemux86copy variant for tests
7ca7da5 reproducible_build.bbclass: initial support for binary reproducibil=
ity
2bdaf82 cpio: provide cpio-replacement-native
0bc2b1f image_types.bbclass: improve cpio image reproducibility
da2afb7 rootfs-postcommands.bbclass: support binary reproducibility
27111ba sstate.bbclass: Do not cause build failures due to setscene errors
8115a0f insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
b153922 libsdl2: allow to build native and nativesdk
732eb73 libdrm: allow to build native and nativesdk
03ffddc nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
8a402d0 libepoxy: add support for native(sdk)
e276f90 libjpeg-turbo: provide nativesdk version
b3490e2 virglrenderer: add new recipe
e30aae5 virglrenderer: fix target build
a4e5b3b qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
673fd3e insane.bbclass: use package_qa_handle_error for do_qa_pseudo
d3e6447 goarch.bbclass: rework mips architecture checks

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D

latest upstream commit:
06e8aa6 mongodb: Fix build on aarch64
not included in master yet:
d43e7f0 dnsmasq: disable the service by default
35fdc5f openconnect: fix parallel compilation failure
c6696d2 squid: upgrade to 3.5.27
c65fd63 iproute2: Move tipc enablement to oe-core
730ef46 libmnl: Move to oe-core
45dc97f drbd-utils: remove
0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
7d1cd57 yp-tools: Ignore cpp warnings as errors
215f41a openl2tp: Fix build with musl/libtirpc
4dbc1b6 network-manager-applet: Disable gobject-introspection on musl
7f96b6f spice: import from meta-cloud-services
84c252f spice: fix dependency on python-pyparsing, add support for native(s=
dk)
2885a99 spice: fix build with FORTIFY_SOURCES already defined in native gcc
61aa979 spice: upgrade to 0.13.90 version
6ad85e1 lvm2: refactoring code to disable package config thin-provisioning-=
tools
90bc559 net-snmp: check that executable is used before testing for existanc=
e
0a8e819 protobuf: Upgrade to 3.4.1
b618e82 c-ares: Build native version
0de24fd python-futures: Build native version
e9206ff python-cython: update to version 0.27
a6704fd python-babel: update to version 2.5.1
d3902a5 python-pytest: update to version 3.2.2
e9640bc python-pyasn1: update to version 0.3.6
9449560 python-zopeinterface: update to version 4.4.3
8160646 python-parse-type: update to version 0.4.1
5261ed2 ebtables: Add HOMEPAGE info into recipe file.
ada03cf libol: Add HOMEPAGE info into recipe file.
3f3c378 python-can: update to version 2.0.0b1
fc47027 python-pyfirmata: move in from meta-intel-iot-middleware and upgrad=
e
c378b91 lldpd: Update to version 0.9.8
cde0106 uftrace: update version to 0.8
7de1e22 mongodb: Pass computed endian variable
e8fac96 meta-webserver: update the layer.conf to include the openembedded-l=
ayer
fa9e77f libauthen-radius-perl: move recipe to meta-networking
36b42fc meta-perl: update layer.conf to include openembedded-layer
4485ec1 phoronix-test-suite: Upgrade from v6.6.1 to v7.4.0
1c37941 python-m2crypto: Upgrade to 0.26.4
86051f6 ubi-utils-klibc: Update to 1.5.2 release of mtd-utils
1d079cf klibc.bbclass: Pass TUNE_CCARGS in flags
5199993 gperftools: Enable on mips
f981704 mraa: move recipe from meta-refkit-core
ae03674 upm: add recipe from meta-refkit-core
2226c50 dnsmasq: upgrade to 2.78
8931657 Add python pandas recipes
28ed1fe leveldb: fix parallel build II
e958da1 python-pylint: update to version 1.7.4
021d128 python-cython: update to version 0.27.1
525b090 python-flask-sqlalchemy: update to version 2.3.0
83dd3c2 python-parse-type: update to version 0.4.2
3d0a18e python-twisted: update to version 17.9.0
4bd7810 python-grpcio-tools: update to version 1.6.3
49854c1 initramfs-debug: replace deprecated license file
901f9e3 initramfs-kexecboot-image: replace deprecated license file
4e8593b breakpad: fix typo ( minidump_cpu_arm.h -> minidump_cpu_arm64.h )
b4aa944 klibc: Pass Optimization with KLIBCOPTFLAGS
0421eaf usbredir: add new recipe
ffb4d90 libopus: add native and nativesdk

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

--001a1149243a990198055ab9ac87
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
eak-word;margin-top:0px;margin-bottom:0px">||2017-10-04	||3	||3	||1	||0	||0=
		||0		||3		||0		||0		||0		||4		||0		||0		||0		||0		||0		||0		||0		||8		||=
=09
|}

=3D=3D Failed tasks 2017-10-04 =3D=3D

INFO: jenkins-job.sh-1.8.34 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171004_044548.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171004_044=
548.log</a>

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_package_q=
a
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_pac=
kage_qa

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/spice/spice_git.bb:=
do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package=
_qa

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_=
2.4.2.bb:do_package_qa

=3D=3D=3D Number of failed tasks (7) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20171003_234707.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20171003_234707.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/47291/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/47291/</a>
|-
|| qemux86 	|| 3	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20171003_234422.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20171003_234422.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/47292/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/47292/</a>
|-
|| qemux86_64 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20171004_020534.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171004_020534.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/47293/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/47293/</a>
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">=3D=3D=3D QA issues (15) =3D=3D=
=3D
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
||3	||textrel
|-
||4	||host-user-contaminated
|-
||8	||qa_pseudo
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20171004_020458.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20171004_020458.log/</a>

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


count: 0	issue: version-going-backwards


count: 4	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-iq/usr/lib/loc=
ale/ar_IQ/LC_MESSAGES/SYS_LC_MESSAGES is owned by uid 3004, which is the sa=
me as the user running bitbake. This may be due to host contamination [host=
-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-et-ee.iso-8859-1/=
usr/lib/locale/et_EE.ISO-8859-1/LC_MEASUREMENT is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-sq-al.iso-8859-1/=
usr/lib/locale/sq_AL.ISO-8859-1/LC_CTYPE is owned by uid 3004, which is the=
 same as the user running bitbake. This may be due to host contamination [h=
ost-user-contaminated]
libqofono: /libqofono-tests/usr/lib/libqofono-qt5/tests/tst_qofonocallbarri=
ng is owned by uid 3004, which is the same as the user running bitbake. Thi=
s may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 8	issue: qa_pseudo
initramfs-debug-1.0: This /work/all-oe-linux/initramfs-debug/1.0-r0/pseudo/=
pseudo.log indicates 12 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/armv5te-oe-linux-gnueabi/python3-pylint/1.=
7.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/core2-64-oe-linux/python3-pylint/1.7.4-r0/=
pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/i586-oe-linux/python3-pylint/1.7.4-r0/pseu=
do/pseudo.log indicates 5 errors [qa_pseudo]
python-cython-0.27.1: This /work/armv5te-oe-linux-gnueabi/python-cython/0.2=
7.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.7.4: This /work/armv5te-oe-linux-gnueabi/python-pylint/1.7.=
4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.7.4: This /work/core2-64-oe-linux/python-pylint/1.7.4-r0/ps=
eudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.7.4: This /work/i586-oe-linux/python-pylint/1.7.4-r0/pseudo=
/pseudo.log indicates 6 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
41ba3c8 bitbake-user-manual: Updated kernel version in PREFERRED_VERSION ex=
ample
not included in master yet:=20
147593d world-image: add extra target
0cb0324 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
abf2e95 systemd-serialtty: allow empty package
not included in master yet:=20
1daab8f report-error: Allow to upload reports automatically
f77002f buildhistory.bbclass: metadata-revs show repo parent
8139c3f metadata-revs: provide more information
a26f1b3 qemux86: Add identical qemux86copy variant for tests
7ca7da5 reproducible_build.bbclass: initial support for binary reproducibil=
ity
2bdaf82 cpio: provide cpio-replacement-native
0bc2b1f image_types.bbclass: improve cpio image reproducibility
da2afb7 rootfs-postcommands.bbclass: support binary reproducibility
27111ba sstate.bbclass: Do not cause build failures due to setscene errors
8115a0f insane.bbclass: Add do_qa_pseudo function to check for common error=
s listed in pseudo.log
b153922 libsdl2: allow to build native and nativesdk
732eb73 libdrm: allow to build native and nativesdk
03ffddc nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
8a402d0 libepoxy: add support for native(sdk)
e276f90 libjpeg-turbo: provide nativesdk version
b3490e2 virglrenderer: add new recipe
e30aae5 virglrenderer: fix target build
a4e5b3b qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
673fd3e insane.bbclass: use package_qa_handle_error for do_qa_pseudo
d3e6447 goarch.bbclass: rework mips architecture checks

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
06e8aa6 mongodb: Fix build on aarch64
not included in master yet:=20
d43e7f0 dnsmasq: disable the service by default
35fdc5f openconnect: fix parallel compilation failure
c6696d2 squid: upgrade to 3.5.27
c65fd63 iproute2: Move tipc enablement to oe-core
730ef46 libmnl: Move to oe-core
45dc97f drbd-utils: remove 0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is=
-a-module.patch
7d1cd57 yp-tools: Ignore cpp warnings as errors
215f41a openl2tp: Fix build with musl/libtirpc
4dbc1b6 network-manager-applet: Disable gobject-introspection on musl
7f96b6f spice: import from meta-cloud-services
84c252f spice: fix dependency on python-pyparsing, add support for native(s=
dk)
2885a99 spice: fix build with FORTIFY_SOURCES already defined in native gcc
61aa979 spice: upgrade to 0.13.90 version
6ad85e1 lvm2: refactoring code to disable package config thin-provisioning-=
tools
90bc559 net-snmp: check that executable is used before testing for existanc=
e
0a8e819 protobuf: Upgrade to 3.4.1
b618e82 c-ares: Build native version
0de24fd python-futures: Build native version
e9206ff python-cython: update to version 0.27
a6704fd python-babel: update to version 2.5.1
d3902a5 python-pytest: update to version 3.2.2
e9640bc python-pyasn1: update to version 0.3.6
9449560 python-zopeinterface: update to version 4.4.3
8160646 python-parse-type: update to version 0.4.1
5261ed2 ebtables: Add HOMEPAGE info into recipe file.
ada03cf libol: Add HOMEPAGE info into recipe file.
3f3c378 python-can: update to version 2.0.0b1
fc47027 python-pyfirmata: move in from meta-intel-iot-middleware and upgrad=
e
c378b91 lldpd: Update to version 0.9.8
cde0106 uftrace: update version to 0.8
7de1e22 mongodb: Pass computed endian variable
e8fac96 meta-webserver: update the layer.conf to include the openembedded-l=
ayer
fa9e77f libauthen-radius-perl: move recipe to meta-networking
36b42fc meta-perl: update layer.conf to include openembedded-layer
4485ec1 phoronix-test-suite: Upgrade from v6.6.1 to v7.4.0
1c37941 python-m2crypto: Upgrade to 0.26.4
86051f6 ubi-utils-klibc: Update to 1.5.2 release of mtd-utils
1d079cf klibc.bbclass: Pass TUNE_CCARGS in flags
5199993 gperftools: Enable on mips
f981704 mraa: move recipe from meta-refkit-core
ae03674 upm: add recipe from meta-refkit-core
2226c50 dnsmasq: upgrade to 2.78
8931657 Add python pandas recipes
28ed1fe leveldb: fix parallel build II
e958da1 python-pylint: update to version 1.7.4
021d128 python-cython: update to version 0.27.1
525b090 python-flask-sqlalchemy: update to version 2.3.0
83dd3c2 python-parse-type: update to version 0.4.2
3d0a18e python-twisted: update to version 17.9.0
4bd7810 python-grpcio-tools: update to version 1.6.3
49854c1 initramfs-debug: replace deprecated license file
901f9e3 initramfs-kexecboot-image: replace deprecated license file
4e8593b breakpad: fix typo ( minidump_cpu_arm.h -&gt; minidump_cpu_arm64.h =
)
b4aa944 klibc: Pass Optimization with KLIBCOPTFLAGS
0421eaf usbredir: add new recipe
ffb4d90 libopus: add native and nativesdk

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
f00f79b qtxmlpatterns: Add HOMEPAGE info into recipe file.
not included in master yet:=20
2e6fb62 qt5: add missing commercial license

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
26d5066 firefox: fix build failures
not included in master yet:=20
6773bf9 meta: drop ${COREBASE}/LICENSE references</pre></pre></div>

--001a1149243a990198055ab9ac87--
