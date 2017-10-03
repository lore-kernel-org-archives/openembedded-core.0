Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1B98371993;
	Tue,  3 Oct 2017 19:12:29 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id k62so7103323wrc.9;
	Tue, 03 Oct 2017 12:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=tfHpnfIyWt1ZtOdQhJUx9NsbtB/6J6MNmk3XwtbtiiA=;
	b=d2XZtQ4GRchg84eBgiIooMkSjKtTOoPHDYmlv9n38jndhjM63vAbE48wbxjcMVLPr/
	LDXzu//jrPIELEZu0nvBbynfcKOac+ONA5WGFnA9GF9pRK2PdLwtzIuweNnmp7xmaR+u
	/HrnINbHnlN41OKRU5X5RKwX5bEA7SdRPWD5b5S77XdZHoV7OggdytLpgShNs57M1BrT
	mLDvm/nXu+v52qDry3iJR6Z5c9Nqh5TM6RSMhxjenJOBCMC8ggsEHR/qSUZoMboBDQsB
	WXOb9hzrm4LqTiaSx0z53HTGhhGrImgT2rC++6nqj5tI7xkFfx/xQu5fjxay0U9ZJhRs
	CQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=tfHpnfIyWt1ZtOdQhJUx9NsbtB/6J6MNmk3XwtbtiiA=;
	b=X1+WZGE8VNcWh9BP4ZaSUEys+PE9s6+rg4xAbanZFP2TX8EJ0s7BI+EzVBxU1DS+HI
	ro2bewJ8QyoaNG7ZcPSFV1loRgYBDodzmb5RzpHD2LXlU3kySkwKQRLHbTOrZFTrDPb9
	nehlxLvlnyGkHTDG0tjLYpDVibjKkdtmNjbIr1ntoBTbqbapYzYu21PCL/bKYCqvL+Xc
	Bl6TtRIJB0/NC/NKLgE4LoF4md4w/IbO3FgfPOYMkTHdLUjbcyIZ9WFOWNzMfEM6Kl2t
	uife3QvvG457sQAihwCWV+KxZLV577N+M+igxatnpJ3ekxhxa4EaozCWJDWF9Pl+9J7N
	ZwJg==
X-Gm-Message-State: AMCzsaWgJTaETnn84IgOjxxo8Ii8mPOGHq4qbwazqceCQaut50qJ/KFN
	gGCYCNmCGiNCB6k21Vju1hBwI5pCMcBAjfY7RbNcJg==
X-Google-Smtp-Source: AOwi7QB0OWUTJR1XRDzOEUwCirYy+Y+/wBJrMsfLFg2Dz3neVe7p2m83jjvZCIPurkeOkpg2uA9FvXU5pCeohz8jZvM=
X-Received: by 10.223.143.56 with SMTP id p53mr1701990wrb.179.1507057950197;
	Tue, 03 Oct 2017 12:12:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 3 Oct 2017 12:12:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Oct 2017 21:12:29 +0200
Message-ID: <CA+chaQenC8s9PzDGM2cAhNT6pL86JPa8pKj+bqHRxnZbaJK-Dw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-10-03
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
X-List-Received-Date: Tue, 03 Oct 2017 19:12:30 -0000
Content-Type: multipart/alternative; boundary="f403045d5898c70dbf055aa9456d"

--f403045d5898c70dbf055aa9456d
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
||2017-10-03 ||4 ||6 ||1 ||0 ||0 ||0 ||3 ||0 ||0 ||0 ||4 ||0 ||0 ||0 ||0 ||0
||0 ||0 ||9 ||
|}

== Failed tasks 2017-10-03 ==

INFO: jenkins-job.sh-1.8.34 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171003_091118.log

=== common (0) ===

=== common-x86 (0) ===

=== qemuarm (4) ===
    *
meta-openembedded/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb:
do_package
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
|| qemuarm || 4 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171002_025816.log/
|| http://errors.yoctoproject.org/Errors/Build/47273/
|-
|| qemux86 || 6 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171002_025820.log/
|| http://errors.yoctoproject.org/Errors/Build/47271/
http://errors.yoctoproject.org/Errors/Build/47272/
http://errors.yoctoproject.org/Errors/Build/47274/
|-
|| qemux86_64 || 1 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171003_050236.log/
|| http://errors.yoctoproject.org/Errors/Build/47282/
|}

=== PNBLACKLISTs (1) ===

=== QA issues (16) ===
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
||4 ||host-user-contaminated
|-
||9 ||qa_pseudo
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20171002_063718.log/

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
libqofono:
/libqofono-tests/usr/lib/libqofono-qt5/tests/tst_qofonocallbarring is owned
by uid 3004, which is the same as the user running bitbake. This may be due
to host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path


count: 9 issue: qa_pseudo
collectd-5.7.2: This
/work/i586-oe-linux/collectd/5.7.2-r0/pseudo/pseudo.log indicates 10 errors
[qa_pseudo]
net-snmp-5.7.3: This
/work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseudo/pseudo.log
indicates 7 errors [qa_pseudo]
net-snmp-5.7.3: This
/work/i586-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates 5 errors
[qa_pseudo]
openhpi-3.6.1: This
/work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 5
errors [qa_pseudo]
openhpi-3.6.1: This /work/i586-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.log
indicates 6 errors [qa_pseudo]
python3-pandas-0.20.3: This
/work/core2-64-oe-linux/python3-pandas/0.20.3-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
python-pyfirmata-1.0.3: This
/work/core2-64-oe-linux/python-pyfirmata/1.0.3-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]
pywbem-0.8.0: This
/work/core2-64-oe-linux/pywbem/0.8.0-r0/pseudo/pseudo.log indicates 6
errors [qa_pseudo]
upm-1.3.0-gitAUTOINC+106b6c7062: This
/work/core2-64-oe-linux/upm/1.3.0-gitAUTOINC+106b6c7062-r0/pseudo/pseudo.log
indicates 4 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
41ba3c8 bitbake-user-manual: Updated kernel version in PREFERRED_VERSION
example
not included in master yet:
147593d world-image: add extra target
0cb0324 fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
abf2e95 systemd-serialtty: allow empty package
not included in master yet:
1daab8f report-error: Allow to upload reports automatically
f77002f buildhistory.bbclass: metadata-revs show repo parent
8139c3f metadata-revs: provide more information
a26f1b3 qemux86: Add identical qemux86copy variant for tests
7ca7da5 reproducible_build.bbclass: initial support for binary
reproducibility
2bdaf82 cpio: provide cpio-replacement-native
0bc2b1f image_types.bbclass: improve cpio image reproducibility
da2afb7 rootfs-postcommands.bbclass: support binary reproducibility
27111ba sstate.bbclass: Do not cause build failures due to setscene errors
8115a0f insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
b153922 libsdl2: allow to build native and nativesdk
732eb73 libdrm: allow to build native and nativesdk
03ffddc nativesdk-mesa,mesa-native: add new recipe to build small part of
mesa
8a402d0 libepoxy: add support for native(sdk)
e276f90 libjpeg-turbo: provide nativesdk version
b3490e2 virglrenderer: add new recipe
e30aae5 virglrenderer: fix target build
a4e5b3b qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
673fd3e insane.bbclass: use package_qa_handle_error for do_qa_pseudo
d3e6447 goarch.bbclass: rework mips architecture checks

== Tested changes (not included in master yet) - meta-openembedded ==
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
84c252f spice: fix dependency on python-pyparsing, add support for
native(sdk)
2885a99 spice: fix build with FORTIFY_SOURCES already defined in native gcc
61aa979 spice: upgrade to 0.13.90 version
6ad85e1 lvm2: refactoring code to disable package config
thin-provisioning-tools
90bc559 net-snmp: check that executable is used before testing for existance
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
57aa510 mraa: move recipe from meta-refkit-core
df598ff upm: add recipe from meta-refkit-core
d0c1472 python-pyfirmata: move in from meta-intel-iot-middleware and upgrade
285f659 lldpd: Update to version 0.9.8
2404285 uftrace: update version to 0.8
6ddf4cb mkinitcpio: add new recipe
5b8bf36 mongodb: Pass computed endian variable
28e4467 meta-webserver: update the layer.conf to include the
openembedded-layer
99e9163 libauthen-radius-perl: move recipe to meta-networking
a6c929a meta-perl: update layer.conf to include openembedded-layer
05e5a4a phoronix-test-suite: Upgrade from v6.6.1 to v7.4.0
f1b7a74 Revert "python-m2crypto: Upgrade to 0.26.0"
c16ee49 usbredir: add new recipe
420e3f1 libopus: add native and nativesdk

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
f00f79b qtxmlpatterns: Add HOMEPAGE info into recipe file.
not included in master yet:
2e6fb62 qt5: add missing commercial license

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
26d5066 firefox: fix build failures
not included in master yet:
6773bf9 meta: drop ${COREBASE}/LICENSE references

--f403045d5898c70dbf055aa9456d
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
ce:pre">	</span></div><div>|-</div><div>||2017-10-03<span style=3D"white-sp=
ace:pre">	</span>||4<span style=3D"white-space:pre">	</span>||6<span style=
=3D"white-space:pre">	</span>||1<span style=3D"white-space:pre">	</span>||0=
<span style=3D"white-space:pre">	</span>||0<span style=3D"white-space:pre">=
		</span>||0<span style=3D"white-space:pre">		</span>||3<span style=3D"whit=
e-space:pre">		</span>||0<span style=3D"white-space:pre">		</span>||0<span =
style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		</s=
pan>||4<span style=3D"white-space:pre">		</span>||0<span style=3D"white-spa=
ce:pre">		</span>||0<span style=3D"white-space:pre">		</span>||0<span style=
=3D"white-space:pre">		</span>||0<span style=3D"white-space:pre">		</span>|=
|0<span style=3D"white-space:pre">		</span>||0<span style=3D"white-space:pr=
e">		</span>||0<span style=3D"white-space:pre">		</span>||9<span style=3D"w=
hite-space:pre">		</span>||<span style=3D"white-space:pre">	</span></div><d=
iv>|}</div><div><br></div><div>=3D=3D Failed tasks 2017-10-03 =3D=3D</div><=
div><br></div><div>INFO: jenkins-job.sh-1.8.34 Complete log available at <a=
 href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20=
171003_091118.log">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log=
.report.20171003_091118.log</a></div><div><br></div><div>=3D=3D=3D common (=
0) =3D=3D=3D</div><div><br></div><div>=3D=3D=3D common-x86 (0) =3D=3D=3D</d=
iv><div><br></div><div>=3D=3D=3D qemuarm (4) =3D=3D=3D</div><div>=C2=A0 =C2=
=A0 * meta-openembedded/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcp=
io_git.bb:do_package</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/re=
cipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile</div><di=
v>=C2=A0 =C2=A0 * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:=
do_package_qa</div><div>=C2=A0 =C2=A0 * openembedded-core/meta/recipes-core=
/glibc/glibc-locale_2.26.bb:do_package_qa</div><div><br></div><div>=3D=3D=
=3D qemux86 (2) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-=
networking/recipes-support/spice/spice_git.bb:do_compile</div><div>=C2=A0 =
=C2=A0 * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_pack=
age_qa</div><div><br></div><div>=3D=3D=3D qemux86_64 (1) =3D=3D=3D</div><di=
v>=C2=A0 =C2=A0 * meta-openembedded/meta-networking/recipes-extended/corosy=
nc/corosync_2.4.2.bb:do_package_qa</div><div><br></div><div>=3D=3D=3D Numbe=
r of failed tasks (11) =3D=3D=3D</div><div>{| class=3Dwikitable</div><div>|=
-</div><div>|| qemuarm <span style=3D"white-space:pre">	</span>|| 4<span st=
yle=3D"white-space:pre">	</span> || <a href=3D"http://logs.nslu2-linux.org/=
buildlogs/oe/world/rocko/log.world.qemuarm.20171002_025816.log/">http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171002_02581=
6.log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/47273/=
">http://errors.yoctoproject.org/Errors/Build/47273/</a></div><div>|-</div>=
<div>|| qemux86 <span style=3D"white-space:pre">	</span>|| 6<span style=3D"=
white-space:pre">	</span> || <a href=3D"http://logs.nslu2-linux.org/buildlo=
gs/oe/world/rocko/log.world.qemux86.20171002_025820.log/">http://logs.nslu2=
-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171002_025820.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/47271/">http:=
//errors.yoctoproject.org/Errors/Build/47271/</a></div><div><a href=3D"http=
://errors.yoctoproject.org/Errors/Build/47272/">http://errors.yoctoproject.=
org/Errors/Build/47272/</a></div><div><a href=3D"http://errors.yoctoproject=
.org/Errors/Build/47274/">http://errors.yoctoproject.org/Errors/Build/47274=
/</a></div><div>|-</div><div>|| qemux86_64 <span style=3D"white-space:pre">=
	</span>|| 1<span style=3D"white-space:pre">	</span> || <a href=3D"http://l=
ogs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171003_=
050236.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world=
.qemux86-64.20171003_050236.log/</a> || <a href=3D"http://errors.yoctoproje=
ct.org/Errors/Build/47282/">http://errors.yoctoproject.org/Errors/Build/472=
82/</a></div><div>|}</div><div><br></div><div>=3D=3D=3D PNBLACKLISTs (1) =
=3D=3D=3D</div><div><br></div><div>=3D=3D=3D QA issues (16) =3D=3D=3D</div>=
<div>{| class=3Dwikitable</div><div>!| Count<span style=3D"white-space:pre"=
>		</span>||Issue</div><div>|-</div><div>||0<span style=3D"white-space:pre"=
>	</span>||already-stripped</div><div>|-</div><div>||0<span style=3D"white-=
space:pre">	</span>||build-deps</div><div>|-</div><div>||0<span style=3D"wh=
ite-space:pre">	</span>||compile-host-path</div><div>|-</div><div>||0<span =
style=3D"white-space:pre">	</span>||file-rdeps</div><div>|-</div><div>||0<s=
pan style=3D"white-space:pre">	</span>||installed-vs-shipped</div><div>|-</=
div><div>||0<span style=3D"white-space:pre">	</span>||invalid-pkgconfig</di=
v><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||ldflags</d=
iv><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||libdir</d=
iv><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||pkgname</=
div><div>|-</div><div>||0<span style=3D"white-space:pre">	</span>||symlink-=
to-sysroot</div><div>|-</div><div>||0<span style=3D"white-space:pre">	</spa=
n>||unknown-configure-option</div><div>|-</div><div>||0<span style=3D"white=
-space:pre">	</span>||version-going-backwards</div><div>|-</div><div>||3<sp=
an style=3D"white-space:pre">	</span>||textrel</div><div>|-</div><div>||4<s=
pan style=3D"white-space:pre">	</span>||host-user-contaminated</div><div>|-=
</div><div>||9<span style=3D"white-space:pre">	</span>||qa_pseudo</div><div=
>|}</div><div><br></div><div><br></div><div><br></div><div>=3D=3D=3D Incorr=
ect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D</div><div><br></div><di=
v>Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/r=
ocko/log.signatures.20171002_063718.log/">http://logs.nslu2-linux.org/build=
logs/oe/world/rocko/log.signatures.20171002_063718.log/</a></div><div><br><=
/div><div>No issues detected</div><div><br></div><div><br></div><div>PNBLAC=
KLISTs:</div><div>openembedded-core/:</div><div>meta-browser:</div><div>met=
a-openembedded:</div><div>meta-networking/recipes-support/lksctp-tools/lksc=
tp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools] ?=3D &quot;${@bb.utils.contain=
s(&#39;DISTRO_FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to l=
ink against sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;</div><div>met=
a-qt5:</div><div>PNBLACKLIST[android-system] =3D &quot;depends on lxc from =
meta-virtualiazation which isn&#39;t included in my world builds&quot;</div=
><div>PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and doesn&#39;t really =
need to be tested so much&quot;</div><div>PNBLACKLIST[bigbuckbunny-480p] =
=3D &quot;big and doesn&#39;t really need to be tested so much&quot;</div><=
div>PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really nee=
d to be tested so much&quot;</div><div>PNBLACKLIST[bigbuckbunny-720p] =3D &=
quot;big and doesn&#39;t really need to be tested so much&quot;</div><div>P=
NBLACKLIST[tearsofsteel-1080p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;</div><div>PNBLACKLIST[build-appliance-image] =3D &=
quot;tries to include whole downloads directory in /home/builder/poky :/&qu=
ot;</div><div><br></div><div><br></div><div>QA issues by type:</div><div>co=
unt: 0<span style=3D"white-space:pre">	</span>issue: already-stripped</div>=
<div><br></div><div><br></div><div>count: 0<span style=3D"white-space:pre">=
	</span>issue: libdir</div><div><br></div><div><br></div><div>count: 3<span=
 style=3D"white-space:pre">	</span>issue: textrel</div><div>corosync-2.4.2:=
 ELF binary &#39;/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/c=
orosync/usr/sbin/corosync&#39; has relocations in .text [textrel]</div><div=
>x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/work/i586-oe-linux/x264=
/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264&#39; h=
as relocations in .text [textrel]</div><div>x264-r2731+gitAUTOINC+2b741f81e=
5: ELF binary &#39;/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/=
packages-split/x264/usr/lib/libx264.so.148&#39; has relocations in .text [t=
extrel]</div><div><br></div><div><br></div><div>count: 0<span style=3D"whit=
e-space:pre">	</span>issue: build-deps</div><div><br></div><div><br></div><=
div>count: 0<span style=3D"white-space:pre">	</span>issue: file-rdeps</div>=
<div><br></div><div><br></div><div>count: 0<span style=3D"white-space:pre">=
	</span>issue: version-going-backwards</div><div><br></div><div><br></div><=
div>count: 4<span style=3D"white-space:pre">	</span>issue: host-user-contam=
inated</div><div>glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-=
ar-iq/usr/lib/locale/ar_IQ/LC_MESSAGES/SYS_LC_MESSAGES is owned by uid 3004=
, which is the same as the user running bitbake. This may be due to host co=
ntamination [host-user-contaminated]</div><div>glibc-locale-2.26: glibc-loc=
ale: /glibc-binary-localedata-et-ee.iso-8859-1/usr/lib/locale/et_EE.ISO-885=
9-1/LC_MEASUREMENT is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]=
</div><div>glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-sq-al.=
iso-8859-1/usr/lib/locale/sq_AL.ISO-8859-1/LC_CTYPE is owned by uid 3004, w=
hich is the same as the user running bitbake. This may be due to host conta=
mination [host-user-contaminated]</div><div>libqofono: /libqofono-tests/usr=
/lib/libqofono-qt5/tests/tst_qofonocallbarring is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]</div><div><br></div><div><br></div><div>count:=
 0<span style=3D"white-space:pre">	</span>issue: installed-vs-shipped</div>=
<div><br></div><div><br></div><div>count: 0<span style=3D"white-space:pre">=
	</span>issue: unknown-configure-option</div><div><br></div><div><br></div>=
<div>count: 0<span style=3D"white-space:pre">	</span>issue: symlink-to-sysr=
oot</div><div><br></div><div><br></div><div>count: 0<span style=3D"white-sp=
ace:pre">	</span>issue: invalid-pkgconfig</div><div><br></div><div><br></di=
v><div>count: 0<span style=3D"white-space:pre">	</span>issue: pkgname</div>=
<div><br></div><div><br></div><div>count: 0<span style=3D"white-space:pre">=
	</span>issue: ldflags</div><div><br></div><div><br></div><div>count: 0<spa=
n style=3D"white-space:pre">	</span>issue: compile-host-path</div><div><br>=
</div><div><br></div><div>count: 9<span style=3D"white-space:pre">	</span>i=
ssue: qa_pseudo</div><div>collectd-5.7.2: This /work/i586-oe-linux/collectd=
/5.7.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]</div><div>net-s=
nmp-5.7.3: This /work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseudo/pse=
udo.log indicates 7 errors [qa_pseudo]</div><div>net-snmp-5.7.3: This /work=
/i586-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates 5 errors [qa_p=
seudo]</div><div>openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-=
r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]</div><div>openhpi-3.6.1=
: This /work/i586-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 6 e=
rrors [qa_pseudo]</div><div>python3-pandas-0.20.3: This /work/core2-64-oe-l=
inux/python3-pandas/0.20.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseu=
do]</div><div>python-pyfirmata-1.0.3: This /work/core2-64-oe-linux/python-p=
yfirmata/1.0.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]</div><di=
v>pywbem-0.8.0: This /work/core2-64-oe-linux/pywbem/0.8.0-r0/pseudo/pseudo.=
log indicates 6 errors [qa_pseudo]</div><div>upm-1.3.0-gitAUTOINC+106b6c706=
2: This /work/core2-64-oe-linux/upm/1.3.0-gitAUTOINC+106b6c7062-r0/pseudo/p=
seudo.log indicates 4 errors [qa_pseudo]</div><div><br></div><div><br></div=
><div><br></div><div>This git log matches with the metadata as seen by qemu=
arm build.</div><div>In some cases qemux86 and qemux86-64 builds are built =
with slightly</div><div>different metadata, you can see the exact version n=
ear the top of each</div><div>log.world.qemu* files linked from the report<=
/div><div><br></div><div>=3D=3D Tested changes (not included in master yet)=
 - bitbake =3D=3D</div><div>latest upstream commit:=C2=A0</div><div>41ba3c8=
 bitbake-user-manual: Updated kernel version in PREFERRED_VERSION example</=
div><div>not included in master yet:=C2=A0</div><div>147593d world-image: a=
dd extra target</div><div>0cb0324 fetch2: Allow Fetch.download() to warn in=
stead of error</div><div><br></div><div>=3D=3D Tested changes (not included=
 in master yet) - openembedded-core =3D=3D</div><div>latest upstream commit=
:=C2=A0</div><div>abf2e95 systemd-serialtty: allow empty package</div><div>=
not included in master yet:=C2=A0</div><div>1daab8f report-error: Allow to =
upload reports automatically</div><div>f77002f buildhistory.bbclass: metada=
ta-revs show repo parent</div><div>8139c3f metadata-revs: provide more info=
rmation</div><div>a26f1b3 qemux86: Add identical qemux86copy variant for te=
sts</div><div>7ca7da5 reproducible_build.bbclass: initial support for binar=
y reproducibility</div><div>2bdaf82 cpio: provide cpio-replacement-native</=
div><div>0bc2b1f image_types.bbclass: improve cpio image reproducibility</d=
iv><div>da2afb7 rootfs-postcommands.bbclass: support binary reproducibility=
</div><div>27111ba sstate.bbclass: Do not cause build failures due to setsc=
ene errors</div><div>8115a0f insane.bbclass: Add do_qa_pseudo function to c=
heck for common errors listed in pseudo.log</div><div>b153922 libsdl2: allo=
w to build native and nativesdk</div><div>732eb73 libdrm: allow to build na=
tive and nativesdk</div><div>03ffddc nativesdk-mesa,mesa-native: add new re=
cipe to build small part of mesa</div><div>8a402d0 libepoxy: add support fo=
r native(sdk)</div><div>e276f90 libjpeg-turbo: provide nativesdk version</d=
iv><div>b3490e2 virglrenderer: add new recipe</div><div>e30aae5 virglrender=
er: fix target build</div><div>a4e5b3b qemu: add PACKAGECONFIG for virtglre=
nderer, sdl2 and spice</div><div>673fd3e insane.bbclass: use package_qa_han=
dle_error for do_qa_pseudo</div><div>d3e6447 goarch.bbclass: rework mips ar=
chitecture checks</div><div><br></div><div>=3D=3D Tested changes (not inclu=
ded in master yet) - meta-openembedded =3D=3D</div><div>latest upstream com=
mit:=C2=A0</div><div>06e8aa6 mongodb: Fix build on aarch64</div><div>not in=
cluded in master yet:=C2=A0</div><div>d43e7f0 dnsmasq: disable the service =
by default</div><div>35fdc5f openconnect: fix parallel compilation failure<=
/div><div>c6696d2 squid: upgrade to 3.5.27</div><div>c65fd63 iproute2: Move=
 tipc enablement to oe-core</div><div>730ef46 libmnl: Move to oe-core</div>=
<div>45dc97f drbd-utils: remove 0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DR=
BD-is-a-module.patch</div><div>7d1cd57 yp-tools: Ignore cpp warnings as err=
ors</div><div>215f41a openl2tp: Fix build with musl/libtirpc</div><div>4dbc=
1b6 network-manager-applet: Disable gobject-introspection on musl</div><div=
>7f96b6f spice: import from meta-cloud-services</div><div>84c252f spice: fi=
x dependency on python-pyparsing, add support for native(sdk)</div><div>288=
5a99 spice: fix build with FORTIFY_SOURCES already defined in native gcc</d=
iv><div>61aa979 spice: upgrade to 0.13.90 version</div><div>6ad85e1 lvm2: r=
efactoring code to disable package config thin-provisioning-tools</div><div=
>90bc559 net-snmp: check that executable is used before testing for existan=
ce</div><div>0a8e819 protobuf: Upgrade to 3.4.1</div><div>b618e82 c-ares: B=
uild native version</div><div>0de24fd python-futures: Build native version<=
/div><div>e9206ff python-cython: update to version 0.27</div><div>a6704fd p=
ython-babel: update to version 2.5.1</div><div>d3902a5 python-pytest: updat=
e to version 3.2.2</div><div>e9640bc python-pyasn1: update to version 0.3.6=
</div><div>9449560 python-zopeinterface: update to version 4.4.3</div><div>=
8160646 python-parse-type: update to version 0.4.1</div><div>5261ed2 ebtabl=
es: Add HOMEPAGE info into recipe file.</div><div>ada03cf libol: Add HOMEPA=
GE info into recipe file.</div><div>3f3c378 python-can: update to version 2=
.0.0b1</div><div>57aa510 mraa: move recipe from meta-refkit-core</div><div>=
df598ff upm: add recipe from meta-refkit-core</div><div>d0c1472 python-pyfi=
rmata: move in from meta-intel-iot-middleware and upgrade</div><div>285f659=
 lldpd: Update to version 0.9.8</div><div>2404285 uftrace: update version t=
o 0.8</div><div>6ddf4cb mkinitcpio: add new recipe</div><div>5b8bf36 mongod=
b: Pass computed endian variable</div><div>28e4467 meta-webserver: update t=
he layer.conf to include the openembedded-layer</div><div>99e9163 libauthen=
-radius-perl: move recipe to meta-networking</div><div>a6c929a meta-perl: u=
pdate layer.conf to include openembedded-layer</div><div>05e5a4a phoronix-t=
est-suite: Upgrade from v6.6.1 to v7.4.0</div><div>f1b7a74 Revert &quot;pyt=
hon-m2crypto: Upgrade to 0.26.0&quot;</div><div>c16ee49 usbredir: add new r=
ecipe</div><div>420e3f1 libopus: add native and nativesdk</div><div><br></d=
iv><div>=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=
=3D</div><div>latest upstream commit:=C2=A0</div><div>f00f79b qtxmlpatterns=
: Add HOMEPAGE info into recipe file.</div><div>not included in master yet:=
=C2=A0</div><div>2e6fb62 qt5: add missing commercial license</div><div><br>=
</div><div>=3D=3D Tested changes (not included in master yet) - meta-browse=
r =3D=3D</div><div>latest upstream commit:=C2=A0</div><div>26d5066 firefox:=
 fix build failures</div><div>not included in master yet:=C2=A0</div><div>6=
773bf9 meta: drop ${COREBASE}/LICENSE references</div></div>

--f403045d5898c70dbf055aa9456d--
