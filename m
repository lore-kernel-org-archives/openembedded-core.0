Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B455371C27;
	Fri, 22 Sep 2017 20:18:16 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r136so6768036wmf.2;
	Fri, 22 Sep 2017 13:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=lT+6EI8qv1iGzj6XzItkqwumAwuDZfmggnRoFGJGOno=;
	b=MTUS7DxhKy5n8h7AcP2m/R1gUllJ3BYal2iJvzXfg/vwsAsnTfCW+p0kp7SuUvWz9g
	gSxLpNrnttnB6HV3YtLoRAU2zFAssgWFGvHR8CVH/YcXAz/noyiRPSxf/arGfny17OdP
	XpBFbDnedTyz7veOWLvH3XKxvV11RG91Ycev1MdmquupavijBeMzFFf/r/26O1gvNRuk
	H4JHd4kERjlUbXSgw7dTwCf5RtoPHQ0kotJiONBeAqo3Dz/E8+AXReYlFlFCtk2XlxRj
	aY+qLrLQPPxoEjcC295tFH7eexlRJ3Uvwo2/zaCW4StloZZiJmW11RSzFF+RukzMiRaO
	K5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=lT+6EI8qv1iGzj6XzItkqwumAwuDZfmggnRoFGJGOno=;
	b=aNSwy4kELr4LoJScldX1XseXZvEjOK+N2KmBmbb3Onj/x2hAFLK1x7bYWUTo/Y+xlY
	Pwp+/hxgdw9VhJ3jrEseitD+cwCdEJWASEskXkAutJE2X+2VEdnF0WxqdLxt+ewcGwaV
	3Kumh+kv5x9vDu/ghB1vyRHPAisP4+fgtXJd91Ce5XCUaCdBFCHW2BJtRYytJwlDmYIj
	lyP4VDZAKTeheNG2iroktlJkQydCVrFnqsRBtO/SWeuMrOL49tYtNj2jMWQHthKU5lHX
	EQpkKm1eovwLzEl9j0m8Ka3Nbsyh+ZhTm9/nym3DkqDP+zRY9gN8ds98c1atK2zDr1kb
	8sjg==
X-Gm-Message-State: AHPjjUihIZy/Kk/LGww3Om/Jz3qPev6Ap9W3+rF8kxZuwIHo5boGjdaG
	lVJdzN0WxOyNxGZCLZFdPcF10JZh8ulMIRKZH03x3g==
X-Google-Smtp-Source: AOwi7QC0jcwe2E/Ij8rLgJDQmBsYGrPKlX5snDScUDuyTgw8y0RP9Rgtoslwm0KYB+2cazcEQO96BKgrewBF657I7Rk=
X-Received: by 10.28.58.66 with SMTP id h63mr4975861wma.10.1506111496787; Fri,
	22 Sep 2017 13:18:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Fri, 22 Sep 2017 13:18:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Sep 2017 22:18:16 +0200
Message-ID: <CA+chaQcYLg1+qH0fZB1tG-OO1z_BWCejAUx1mp+F+sv318t-Zg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-09-21
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
X-List-Received-Date: Fri, 22 Sep 2017 20:18:17 -0000
Content-Type: multipart/alternative; boundary="001a1148fc74c230b80559cce877"

--001a1148fc74c230b80559cce877
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The qemux86-64 failures (except mongodb do_patch) are caused by rpcgen
removal from HOSTTOOLs, will drop that change from next run, but it
also means that latest Gentoo glibc (drops rpc support) cannot be used
for OE builds anymore.


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
||2017-09-21	||1	||1	||8	||0	||0		||0		||1		||0		||0		||18		||1		||0		||0		=
||0		||0		||0		||0		||0		||0		||
|}

=3D=3D Failed tasks 2017-09-21 =3D=3D

INFO: jenkins-job.sh-1.8.31 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170922_10=
1357.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/spice/spice_git.bb:=
do_compile

=3D=3D=3D qemux86_64 (8) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.=
6.7.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/autofs/autofs_5.1.2=
.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/ippool/ippool_1.3.b=
b:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/openl2tp/openl2tp=
_1.8.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_p=
atch
    * meta-openembedded/meta-oe/recipes-support/open-vm-tools/open-vm-tools=
_10.1.5.bb:do_compile
    * openembedded-core/meta/recipes-extended/quota/quota_4.03.bb:do_config=
ure

=3D=3D=3D Number of failed tasks (10) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.2017=
0920_111859.log/
|| http://errors.yoctoproject.org/Errors/Build/46963/
|-
|| qemux86 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.2017=
0920_134145.log/
|| http://errors.yoctoproject.org/Errors/Build/46969/
|-
|| qemux86_64 	|| 8	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.2=
0170921_051533.log/
|| http://errors.yoctoproject.org/Errors/Build/47079/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (20) =3D=3D=3D
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
||0	||qa_pseudo
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||18	||version-going-backwards
|-
||1	||host-user-contaminated
|-
||1	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170920_133416.log/

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


count: 1	issue: textrel
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/=
sbin/corosync'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 18	issue: version-going-backwards
firefox-45.9.0esr: Package version for package firefox-dbg went
backwards which would break package feeds from (0:45.9.0esr-r0.4 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-dbg went
backwards which would break package feeds from (0:45.9.0esr-r0.6 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-dev went
backwards which would break package feeds from (0:45.9.0esr-r0.4 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-dev went
backwards which would break package feeds from (0:45.9.0esr-r0.6 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-doc went
backwards which would break package feeds from (0:45.9.0esr-r0.4 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-doc went
backwards which would break package feeds from (0:45.9.0esr-r0.6 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-locale went
backwards which would break package feeds from (0:45.9.0esr-r0.4 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-locale went
backwards which would break package feeds from (0:45.9.0esr-r0.6 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-staticdev went
backwards which would break package feeds from (0:45.9.0esr-r0.4 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-staticdev went
backwards which would break package feeds from (0:45.9.0esr-r0.6 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox went backwards
which would break package feeds from (0:45.9.0esr-r0.4 to
0:45.9.0esr-r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox went backwards
which would break package feeds from (0:45.9.0esr-r0.6 to
0:45.9.0esr-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package
python-m2crypto-dbg went backwards which would break package feeds
from (0:0.26.0-r0.4 to 0:0.25.1-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package
python-m2crypto-dev went backwards which would break package feeds
from (0:0.26.0-r0.4 to 0:0.25.1-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package
python-m2crypto-doc went backwards which would break package feeds
from (0:0.26.0-r0.4 to 0:0.25.1-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package
python-m2crypto-locale went backwards which would break package feeds
from (0:0.26.0-r0.4 to 0:0.25.1-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package
python-m2crypto-staticdev went backwards which would break package
feeds from (0:0.26.0-r0.4 to 0:0.25.1-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto
went backwards which would break package feeds from (0:0.26.0-r0.4 to
0:0.25.1-r0.0) [version-going-backwards]


count: 1	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-tpi-pg/usr/lib/locale/tpi_PG/LC_PAPER is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 0	issue: qa_pseudo



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:
9c0f6e8 toaster: allow dots in user path names
not included in master yet:
eeae3de world-image: add extra target
90597c4 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:
cbc396d gawk: Enable native building
not included in master yet:
977a7a1 pseudo: use epoll API on Linux
133a219 pseudo: Add fcntl fix
1c59303 report-error: Allow to upload reports automatically
4260204 buildhistory.bbclass: metadata-revs show repo parent
16d5c4d metadata-revs: provide more information
e003f70 qemux86: Add identical qemux86copy variant for tests
521c5b5 reproducible_build.bbclass: initial support for binary reproducibil=
ity
d079293 cpio: provide cpio-replacement-native
f242038 image_types.bbclass: improve cpio image reproducibility
a2da05c rootfs-postcommands.bbclass: support binary reproducibility
6a34765 sstate.bbclass: Do not cause build failures due to setscene errors
3ca8737 u-boot-fw-utils: Fix cross and target builds
757e420 insane.bbclass: Add do_qa_pseudo function to check for common
errors listed in pseudo.log
c4d5856 libsdl2: allow to build native and nativesdk
6a00014 libdrm: allow to build native and nativesdk
a506409 nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
ca36d46 libepoxy: add support for native(sdk)
9f8dda7 libjpeg-turbo: provide nativesdk version
257b7f0 virglrenderer: add new recipe
efc0f84 virglrenderer: fix target build
6aa61c2 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
f500827 WIP: qemu: enable sdl2 virglrenderer gtk+ spice

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:
4496cb4 poco: update to 1.7.9
not included in master yet:
a4af523 dnsmasq: disable the service by default
6d8b06b openconnect: fix parallel compilation failure
908a4bf autofs: Fix build with musl
45ecc47 yp-tools: Upgrade to 4.2.2
5a9e5ed vim: Remove xfce vim bbappend
daf5049 ipvsadm: Add HOMEPAGE info into recipe file.
b5c46e9 tcpdump: update to 4.9.2 to fix CVEs
46205a6 networkmanager: Add HOMEPAGE info into recipe file.
3f97954 samba: Add HOMEPAGE info into recipe file.
8ba0327 squid: upgrade to 3.5.27
a925fd0 iproute2: Move tipc enablement to oe-core
a93ee86 libmnl: Move to oe-core
a4be10f drbd-utils: remove
0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is-a-module.patch
698c07f libtdb: Add HOMEPAGE info into recipe file.
502617d stunnel: Add HOMEPAGE info into recipe file.
4cbe878 ypbind-mt: Upgrade to 2.4
f3b4d5f openhpi: Fix build with musl
55ef66f python-pyparsing: add support for native build
9b22f14 celt051: import from meta-cloud-services
3f33fdf celt051: make ogg support optional
1519e0b spice: import from meta-cloud-services
aaf226d spice: fix dependency on python-pyparsing, add support for native(s=
dk)
1a02cab spice: fix build with FORTIFY_SOURCES already defined in native gcc
fb48c40 spice: upgrade to 0.13.90 version
454200f librelp: upgrade from 1.2.12 to 1.2.14
eb09ef1 rsyslog: update from 8.22 to 8.29
0dfa06d openwsman: Fix build with musl
49e20fd breakpad: Upgrade to latest master
212ec8b nginx: update development version to 1.13.5
850906f python-sqlalchemy: update to version 1.1.14
e1549f0 python-pyasn1: update to version 0.3.4
6c97af4 python-django: update to version 1.11.5
fe6bb4e python-pytest-runner: update to version 2.12.1
569d90c python-jsonpointer: update to version 1.12
3a34306 python-pymongo: update to version 3.5.1
03a989e python-pymisp: update to version 2.4.79
4844d1b opensaf: Upgrade to 5.17.07
e27fc2e android-tools: Fix build with musl
a1ef6db autoconf-archive: Delete ( moved to oe-core )
74bd71e python-pybind11: update to version 2.2.1
f8bbd8c python-ndg-httpsclient: update to version 0.4.3
b3da00f python-babel: update to version 2.5.0
fb272ac python-cython: update to version 0.26.1
458cb8d imagemagick: 7.0.6-9 -> 7.0.7-1
3837bc6 eventlog: Add HOMEPAGE info into recipe file.
0f4dde2 fbset: Add HOMEPAGE info into recipe file.
c8f1d3a ipc-run: Add HOMEPAGE info into recipe file.
248b566 libhtml-parser-perl: Add HOMEPAGE info into recipe file.
3df7412 libnet-dns-perl: Add HOMEPAGE info into recipe file.
7ed027f python-redis: update to version 2.10.6
b2b8cf4 python-pyopenssl: update to version 17.3.0
4007fb2 python-xlrd: update to version 1.1.0
c8d2705 python-psutil: update to version 5.3.1
6c5c4ca python-cffi: update to version 1.10.0
a77b32f python-six: update to version 1.11.0
88cec83 python-aws-iot-device-sdk-python: update to version 1.2.0
574cb93 python-pymongo: split the package into bson and original pymongo pa=
ckage
f661b5d python-pyro4: update to version 4.62
1e7f8bd python-lxml: update to version 4.0.0
b8d7eda Revert "python-m2crypto: Upgrade to 0.26.0"

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:
743b3b9 qtbase-native: Force use of built-in pcre
not included in master yet:
8f3a5f6 meta: drop a useless file
d4b0f7e qtdeclarative: Add HOMEPAGE info into recipe file.
2d9d82a qtquick1: Add HOMEPAGE info into recipe file.
be83a60 qtscript: Add HOMEPAGE info into recipe file.
ba25889 qtsvg: Add HOMEPAGE info into recipe file.
6818910 qttools: Add HOMEPAGE info into recipe file.
f00f79b qtxmlpatterns: Add HOMEPAGE info into recipe file.

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:
678706c chromium: hide textrel QA issues which are there for ages
not included in master yet:
777a7cd firefox: fix build failures

--001a1148fc74c230b80559cce877
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bo=
ttom:0px;color:rgb(51,51,51);font-size:14px">The qemux86-64 failures (excep=
t mongodb do_patch) are caused by rpcgen removal from HOSTTOOLs, will drop =
that change from next run, but it also means that latest Gentoo glibc (drop=
s rpc support) cannot be used for OE builds anymore.</pre><pre class=3D"gma=
il-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word=
-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-=
size:14px"><br></pre><pre class=3D"gmail-console-output" style=3D"box-sizin=
g:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margi=
n-bottom:0px;color:rgb(51,51,51);font-size:14px"><a href=3D"http://www.open=
embedded.org/wiki/Bitbake_World_Status" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://www.openembedded.org/wiki/Bit=
bake_World_Status</a>

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
||2017-09-21	||1	||1	||8	||0	||0		||0		||1		||0		||0		||18		||1		||0		||0		=
||0		||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-09-21 =3D=3D

INFO: jenkins-job.sh-1.8.31 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170922_101357.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170922_101=
357.log</a>

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/spice/spice_git.bb:=
do_compile

=3D=3D=3D qemux86_64 (8) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.=
6.7.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/autofs/autofs_5.1.2=
.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/ippool/ippool_1.3.b=
b:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/openl2tp/openl2tp=
_1.8.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_p=
atch
    * meta-openembedded/meta-oe/recipes-support/open-vm-tools/open-vm-tools=
_10.1.5.bb:do_compile
    * openembedded-core/meta/recipes-extended/quota/quota_4.03.bb:do_config=
ure

=3D=3D=3D Number of failed tasks (10) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170920_111859.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170920_111859.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/46963/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/46963/</a>
|-
|| qemux86 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170920_134145.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170920_134145.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/46969/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/46969/</a>
|-
|| qemux86_64 	|| 8	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170921_051533.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170921_051533.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/47079/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/47079/</a>
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (20) =3D=3D=3D
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
||0	||qa_pseudo
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||18	||version-going-backwards
|-
||1	||host-user-contaminated
|-
||1	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170920_133416.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170920_133416.log/</a>

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


count: 1	issue: textrel
corosync-2.4.2: ELF binary &#39;/tmp/work/core2-64-oe-linux/corosync/2.4.2-=
r0/packages-split/corosync/usr/sbin/corosync&#39; has relocations in .text =
[textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 18	issue: version-going-backwards
firefox-45.9.0esr: Package version for package firefox-dbg went backwards w=
hich would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-r0.0) =
[version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-dbg went backwards w=
hich would break package feeds from (0:45.9.0esr-r0.6 to 0:45.9.0esr-r0.0) =
[version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-dev went backwards w=
hich would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-r0.0) =
[version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-dev went backwards w=
hich would break package feeds from (0:45.9.0esr-r0.6 to 0:45.9.0esr-r0.0) =
[version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-doc went backwards w=
hich would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-r0.0) =
[version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-doc went backwards w=
hich would break package feeds from (0:45.9.0esr-r0.6 to 0:45.9.0esr-r0.0) =
[version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-locale went backward=
s which would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-r0.=
0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-locale went backward=
s which would break package feeds from (0:45.9.0esr-r0.6 to 0:45.9.0esr-r0.=
0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-staticdev went backw=
ards which would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-=
r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox-staticdev went backw=
ards which would break package feeds from (0:45.9.0esr-r0.6 to 0:45.9.0esr-=
r0.0) [version-going-backwards]
firefox-45.9.0esr: Package version for package firefox went backwards which=
 would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-r0.0) [ver=
sion-going-backwards]
firefox-45.9.0esr: Package version for package firefox went backwards which=
 would break package feeds from (0:45.9.0esr-r0.6 to 0:45.9.0esr-r0.0) [ver=
sion-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto-dbg wen=
t backwards which would break package feeds from (0:0.26.0-r0.4 to 0:0.25.1=
-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto-dev wen=
t backwards which would break package feeds from (0:0.26.0-r0.4 to 0:0.25.1=
-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto-doc wen=
t backwards which would break package feeds from (0:0.26.0-r0.4 to 0:0.25.1=
-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto-locale =
went backwards which would break package feeds from (0:0.26.0-r0.4 to 0:0.2=
5.1-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto-staticd=
ev went backwards which would break package feeds from (0:0.26.0-r0.4 to 0:=
0.25.1-r0.0) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto went ba=
ckwards which would break package feeds from (0:0.26.0-r0.4 to 0:0.25.1-r0.=
0) [version-going-backwards]


count: 1	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-tpi-pg/usr/lib/lo=
cale/tpi_PG/LC_PAPER is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 0	issue: qa_pseudo



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
9c0f6e8 toaster: allow dots in user path names
not included in master yet:=20
eeae3de world-image: add extra target
90597c4 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
cbc396d gawk: Enable native building
not included in master yet:=20
977a7a1 pseudo: use epoll API on Linux
133a219 pseudo: Add fcntl fix
1c59303 report-error: Allow to upload reports automatically
4260204 buildhistory.bbclass: metadata-revs show repo parent
16d5c4d metadata-revs: provide more information
e003f70 qemux86: Add identical qemux86copy variant for tests
521c5b5 reproducible_build.bbclass: initial support for binary reproducibil=
ity
d079293 cpio: provide cpio-replacement-native
f242038 image_types.bbclass: improve cpio image reproducibility
a2da05c rootfs-postcommands.bbclass: support binary reproducibility
6a34765 sstate.bbclass: Do not cause build failures due to setscene errors
3ca8737 u-boot-fw-utils: Fix cross and target builds
757e420 insane.bbclass: Add do_qa_pseudo function to check for common error=
s listed in pseudo.log
c4d5856 libsdl2: allow to build native and nativesdk
6a00014 libdrm: allow to build native and nativesdk
a506409 nativesdk-mesa,mesa-native: add new recipe to build small part of m=
esa
ca36d46 libepoxy: add support for native(sdk)
9f8dda7 libjpeg-turbo: provide nativesdk version
257b7f0 virglrenderer: add new recipe
efc0f84 virglrenderer: fix target build
6aa61c2 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
f500827 WIP: qemu: enable sdl2 virglrenderer gtk+ spice

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
4496cb4 poco: update to 1.7.9
not included in master yet:=20
a4af523 dnsmasq: disable the service by default
6d8b06b openconnect: fix parallel compilation failure
908a4bf autofs: Fix build with musl
45ecc47 yp-tools: Upgrade to 4.2.2
5a9e5ed vim: Remove xfce vim bbappend
daf5049 ipvsadm: Add HOMEPAGE info into recipe file.
b5c46e9 tcpdump: update to 4.9.2 to fix CVEs
46205a6 networkmanager: Add HOMEPAGE info into recipe file.
3f97954 samba: Add HOMEPAGE info into recipe file.
8ba0327 squid: upgrade to 3.5.27
a925fd0 iproute2: Move tipc enablement to oe-core
a93ee86 libmnl: Move to oe-core
a4be10f drbd-utils: remove 0001-drbd-8.4.4-drbd-tools-only-rmmod-if-DRBD-is=
-a-module.patch
698c07f libtdb: Add HOMEPAGE info into recipe file.
502617d stunnel: Add HOMEPAGE info into recipe file.
4cbe878 ypbind-mt: Upgrade to 2.4
f3b4d5f openhpi: Fix build with musl
55ef66f python-pyparsing: add support for native build
9b22f14 celt051: import from meta-cloud-services
3f33fdf celt051: make ogg support optional
1519e0b spice: import from meta-cloud-services
aaf226d spice: fix dependency on python-pyparsing, add support for native(s=
dk)
1a02cab spice: fix build with FORTIFY_SOURCES already defined in native gcc
fb48c40 spice: upgrade to 0.13.90 version
454200f librelp: upgrade from 1.2.12 to 1.2.14
eb09ef1 rsyslog: update from 8.22 to 8.29
0dfa06d openwsman: Fix build with musl
49e20fd breakpad: Upgrade to latest master
212ec8b nginx: update development version to 1.13.5
850906f python-sqlalchemy: update to version 1.1.14
e1549f0 python-pyasn1: update to version 0.3.4
6c97af4 python-django: update to version 1.11.5
fe6bb4e python-pytest-runner: update to version 2.12.1
569d90c python-jsonpointer: update to version 1.12
3a34306 python-pymongo: update to version 3.5.1
03a989e python-pymisp: update to version 2.4.79
4844d1b opensaf: Upgrade to 5.17.07
e27fc2e android-tools: Fix build with musl
a1ef6db autoconf-archive: Delete ( moved to oe-core )
74bd71e python-pybind11: update to version 2.2.1
f8bbd8c python-ndg-httpsclient: update to version 0.4.3
b3da00f python-babel: update to version 2.5.0
fb272ac python-cython: update to version 0.26.1
458cb8d imagemagick: 7.0.6-9 -&gt; 7.0.7-1
3837bc6 eventlog: Add HOMEPAGE info into recipe file.
0f4dde2 fbset: Add HOMEPAGE info into recipe file.
c8f1d3a ipc-run: Add HOMEPAGE info into recipe file.
248b566 libhtml-parser-perl: Add HOMEPAGE info into recipe file.
3df7412 libnet-dns-perl: Add HOMEPAGE info into recipe file.
7ed027f python-redis: update to version 2.10.6
b2b8cf4 python-pyopenssl: update to version 17.3.0
4007fb2 python-xlrd: update to version 1.1.0
c8d2705 python-psutil: update to version 5.3.1
6c5c4ca python-cffi: update to version 1.10.0
a77b32f python-six: update to version 1.11.0
88cec83 python-aws-iot-device-sdk-python: update to version 1.2.0
574cb93 python-pymongo: split the package into bson and original pymongo pa=
ckage
f661b5d python-pyro4: update to version 4.62
1e7f8bd python-lxml: update to version 4.0.0
b8d7eda Revert &quot;python-m2crypto: Upgrade to 0.26.0&quot;

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
743b3b9 qtbase-native: Force use of built-in pcre
not included in master yet:=20
8f3a5f6 meta: drop a useless file
d4b0f7e qtdeclarative: Add HOMEPAGE info into recipe file.
2d9d82a qtquick1: Add HOMEPAGE info into recipe file.
be83a60 qtscript: Add HOMEPAGE info into recipe file.
ba25889 qtsvg: Add HOMEPAGE info into recipe file.
6818910 qttools: Add HOMEPAGE info into recipe file.
f00f79b qtxmlpatterns: Add HOMEPAGE info into recipe file.

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
678706c chromium: hide textrel QA issues which are there for ages
not included in master yet:=20
777a7cd firefox: fix build failures<br></pre></div>

--001a1148fc74c230b80559cce877--
