Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id C0D6478235;
	Tue, 22 Aug 2017 13:18:39 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id a47so11086936wra.0;
	Tue, 22 Aug 2017 06:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=nsISRMKkciC53Tv5dNChMx3+QEftu2xDtrzwK88IuZA=;
	b=VAeqYFfkBrLNMR2NudkuNzou2Xx+VBsOqcjjA5t7qc6giMqs4DrYxn3XSDodboJWS/
	V2u0T5rq4euBe/7+g49DwtvIWjYsV6+Fsz3tQfYqwyT4SWFac6I9Qy0yS2IfGLml5D1e
	SPx2nocdlqitg1rRDLKr5q2YLCzdCsOBREzQyaTjFUh0a0hF1iaziRVpM7s5bTrFEkFj
	dHaRLh7ecJDw3Yxf5a6ZxaFa9OzHmidBML0Azt0K8GEJyNc9Od/hMa9VGc2X9ZJz/Shj
	EQ48JQxzcYBTAgDxKTbadpS59WkvmoDCePtoQIvmVmELSF5yaTDsvrp50NfYWAiGYNs1
	wH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=nsISRMKkciC53Tv5dNChMx3+QEftu2xDtrzwK88IuZA=;
	b=eNxLCoi5ULdHhlDczzJSyQaiR/4474W0PoudfNI6W5IiMFBrdOo4YtOj+sG2a0PBv8
	+S2NX0x0nuNRDKXSi/VrXclZRouaO3wFvw+B00ZNe1ylElV6qm3pMVMdtqgrtzL7q30L
	dqcTmWSOFYNMP6PS2E2zMIrRcz9OKHDtPrbpM+M+xBAmcsoanOw06/nsGr4wHtGuxrxA
	utLrumGQf64wFsyhePoFIp2iWOUSybBD6fvw7lUNVlFWciBDG9mJKK043mFpYB3+RPrI
	hZ+GqacufyM96CeFNsDmTzczoG63CtjpDCpA4Wm78NYNzlqI1IpdJIRighBgHB8O7H3E
	vbMg==
X-Gm-Message-State: AHYfb5iZ/YZIG1RNZA8/TRlhnau8Wnw5HU7P7XeeYeaku5T2ZD6/3Cz2
	Mcifwcj5dOivQD05
X-Received: by 10.223.150.77 with SMTP id c13mr435834wra.85.1503407919460;
	Tue, 22 Aug 2017 06:18:39 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 40sm7818674wrz.8.2017.08.22.06.18.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 Aug 2017 06:18:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Aug 2017 15:20:22 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170822132022.GA3308@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-08-19
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
X-List-Received-Date: Tue, 22 Aug 2017 13:18:40 -0000
X-Groupsio-MsgNum: 101806
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Openssl was reverted back to 1.0 version being default, so there is
fewer errors now, but there was also a fix for package.bbclass:
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/14112=
7.html
which causes many do_package_qa tasks to fail.

Please help by sending fixes for issues it found.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!|Signatures		  !!colspan=
=3D'14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||=09
|-
||2017-08-19	||17	||21	||21	||0	||0		||0		||5		||0		||25		||28485		||2		||0=
		||0		||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-08-19 =3D=3D

INFO: jenkins-job.sh-1.8.25 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170822_023550.log

=3D=3D=3D common (15) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.=
bb:do_package_qa
    * meta-openembedded/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb=
:do_package_qa
    * meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.26.=
bb:do_package_qa
    * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguard-=
tools_0.0.20170517.bb:do_package_qa
    * meta-openembedded/meta-networking/recipes-support/ndisc6/ndisc6_1.0.3=
=2Ebb:do_package_qa
    * meta-openembedded/meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb:do_p=
ackage_qa
    * meta-openembedded/meta-oe/recipes-devtools/mpich/mpich_3.2.bb:do_pack=
age_qa
    * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb=
:do_package_qa
    * meta-openembedded/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb=
:do_package_qa
    * meta-openembedded/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb:d=
o_package_qa
    * meta-openembedded/meta-perl/recipes-perl/libmodule/libmodule-build-pe=
rl_0.31.bb:do_package_qa
    * meta-openembedded/meta-python/recipes-devtools/python/python3-pylint_=
1.6.5.bb:do_package_qa
    * meta-openembedded/meta-python/recipes-devtools/python/python-matplotl=
ib_1.1.0.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/ubx-utils_git.bb:do_pac=
kage_qa

=3D=3D=3D common-x86 (5) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.b=
b:do_package_qa
    * meta-openembedded/meta-oe/recipes-support/multipath-tools/multipath-t=
ools_0.7.1.bb:do_package_qa
    * meta-openembedded/meta-python/recipes-extended/python-pykickstart/pyt=
hon3-pykickstart_2.35.bb:do_package_qa
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/numptyphysics_svn.bb:do=
_package_qa

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb:do_=
compile
    * meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb:do=
_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_c=
ompile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_=
git.bb:do_compile

=3D=3D=3D Number of failed tasks (59) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 17	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/=
log.world.qemuarm.20170820_231852.log/ || http://errors.yoctoproject.org/Er=
rors/Build/45276/
|-
|| qemux86 	|| 21	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/=
log.world.qemux86.20170820_161131.log/ || http://errors.yoctoproject.org/Er=
rors/Build/45273/
|-
|| qemux86_64 	|| 21	 || http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.world.qemux86-64.20170819_113439.log/ || http://errors.yoctoproject.=
org/Errors/Build/44950/
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (28517) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
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
||25	||file-rdeps
|-
||28485	||version-going-backwards
|-
||2	||host-user-contaminated
|-
||5	||textrel
|}



ncorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170820_125905.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-qt5:
meta-smartphone:
meta-webos-ports:
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation w=
hich isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads di=
rectory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 5	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has re=
locations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 25	issue: file-rdeps
corosync-2.4.2: /usr/share/corosync/corosync-notifyd contained in package c=
orosync requires /tmp/hosttools/bash, but no providers found in RDEPENDS_co=
rosync? [file-rdeps]
enscript-1.6.6: /usr/bin/diffpp contained in package enscript requires /tmp=
/hosttools/perl, but no providers found in RDEPENDS_enscript? [file-rdeps]
enscript-1.6.6: /usr/bin/sliceprint contained in package enscript requires =
/tmp/hosttools/perl, but no providers found in RDEPENDS_enscript? [file-rde=
ps]
glibmm-2.50.1: /usr/lib/glibmm-2.4/proc/generate_wrap_init.pl contained in =
package glibmm-dev requires /tmp/hosttools/perl, but no providers found in =
RDEPENDS_glibmm-dev? [file-rdeps]
glibmm-2.50.1: /usr/lib/glibmm-2.4/proc/gmmproc contained in package glibmm=
-dev requires /tmp/hosttools/perl, but no providers found in RDEPENDS_glibm=
m-dev? [file-rdeps]
libbonobo-2.32.1: /usr/bin/bonobo-slay contained in package libbonobo-bin r=
equires /tmp/hosttools/perl, but no providers found in RDEPENDS_libbonobo-b=
in? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/armv5te-oe-linux-gnueabi/libmodule-build-=
perl/0.31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no pr=
oviders found in RDEPENDS_libmodule-build-perl? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/core2-64-oe-linux/libmodule-build-perl/0.=
31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no providers=
 found in RDEPENDS_libmodule-build-perl? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/i586-oe-linux/libmodule-build-perl/0.31-r=
0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no providers fou=
nd in RDEPENDS_libmodule-build-perl? [file-rdeps]
logwarn-1.0.14: /usr/lib/nagios/plugins/check_logwarn contained in package =
logwarn-nagios requires /tmp/hosttools/bash, but no providers found in RDEP=
ENDS_logwarn-nagios? [file-rdeps]
mpich-3.2: /usr/bin/parkill contained in package mpich requires /tmp/hostto=
ols/perl, but no providers found in RDEPENDS_mpich? [file-rdeps]
multipath-tools-0.7.1: /sbin/mpathconf contained in package multipath-tools=
 requires /bin/bash, but no providers found in RDEPENDS_multipath-tools? [f=
ile-rdeps]
ndisc6-1.0.3: /usr/bin/dnssort contained in package ndisc6-misc requires /t=
mp/hosttools/perl, but no providers found in RDEPENDS_ndisc6-misc? [file-rd=
eps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in=
 package numptyphysics requires /usr/bin/perl, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
python3-pykickstart-2.35: /usr/bin/ksvalidator contained in package python3=
-pykickstart requires /usr/bin/python, but no providers found in RDEPENDS_p=
ython3-pykickstart? [file-rdeps]
python3-pylint-1.6.5: /usr/lib/python3.5/site-packages/pylint/test/data/asc=
ript contained in package python3-pylint requires /usr/bin/python, but no p=
roviders found in RDEPENDS_python3-pylint? [file-rdeps]
squid-3.5.26: /usr/libexec/basic_db_auth contained in package squid require=
s /tmp/work/core2-64-oe-linux/squid/3.5.26-r0/recipe-sysroot-native/usr/bin=
/perl-native/perl, but no providers found in RDEPENDS_squid? [file-rdeps]
squid-3.5.26: /usr/libexec/ext_sql_session_acl contained in package squid r=
equires /tmp/work/i586-oe-linux/squid/3.5.26-r0/recipe-sysroot-native/usr/b=
in/perl-native/perl, but no providers found in RDEPENDS_squid? [file-rdeps]
squid-3.5.26: /usr/libexec/ext_wbinfo_group_acl contained in package squid =
requires /tmp/work/armv5te-oe-linux-gnueabi/squid/3.5.26-r0/recipe-sysroot-=
native/usr/bin/perl-native/perl, but no providers found in RDEPENDS_squid? =
[file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/download1.py contained in =
package ubx-utils requires /usr/bin/python, but no providers found in RDEPE=
NDS_ubx-utils? [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]
udevil-0.4.4: /usr/bin/devmon contained in package udevil requires /bin/bas=
h, but no providers found in RDEPENDS_udevil? [file-rdeps]
wireguard-tools-0.0.20170517: /usr/bin/wg-quick contained in package wiregu=
ard-tools requires /bin/bash, but no providers found in RDEPENDS_wireguard-=
tools? [file-rdeps]
xmlrpc-c-1.31.0: /usr/bin/xml-rpc-api2txt contained in package xmlrpc-c req=
uires /usr/bin/perl, but no providers found in RDEPENDS_xmlrpc-c? [file-rde=
ps]


count: 28485	issue: version-going-backwards

=2E.. skip 28485 lines ...

count: 2	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-en-zw/usr/lib/loc=
ale/en_ZW/LC_COLLATE is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ht-ht/usr/lib/loc=
ale/ht_HT/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
8d4c120 process: Increase server startup timeout
not included in master yet:=20
98712f3 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
5c9ef07 devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK inst=
allation.
not included in master yet:=20
a415cfe report-error: Allow to upload reports automatically
d9eea5f buildhistory.bbclass: metadata-revs show repo parent
1f9c035 metadata-revs: provide more information
92116d6 qemux86: Add identical qemux86copy variant for tests
d5cc447 insane.bbclass: write QA issues to log file only when thei are in E=
RROR_QA or WARN_QA
9c793c2 reproducible_build.bbclass: initial support for binary reproducibil=
ity
a959f10 cpio: provide cpio-replacement-native
9cde9ca image_types.bbclass: improve cpio image reproducibility
8d30221 rootfs-postcommands.bbclass: support binary reproducibility
de14d4a python2.7: improve reproducibility

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
ac2a6d2 json-spirit: Add -latomic to LDFLAGS
not included in master yet:=20
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
92bc7d2 rdate: Define logwtmp if libc !=3D glibc
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
f6b5f24 python-m2crypto: Upgrade to 0.26.0
c125af6 mailcap: upgrade to 2.1.48
31795c0 mailx: Force mailx to build with openssl10
c02dc52 php: disable this version by default
4f5f3ac freeradius: Upgrade to 3.0.15
0fe2b13 tcpdump: update to 4.9.1 to fix CVE-2017-11108
0679c35 logcheck: update to 1.3.18
d8004fb vlock: add new recipe
0b81e48 fontforge: update to 20170731 to fix CVEs
c569b76 wireshark: 2.2.7 -> 2.2.8
2d8bbac start-stop-daemon: Only create a link in ${base_sbindir} if necessa=
ry
0aaf380 python-chardet: Extend to native and nativesdk
77f5db2 openobex: disable building documentation
be8da28 openwsman: rename to 2.6.3
b726d5b iproute2: add bbappend for supporting tipc tool
6ee56b3 tipcutils: add runtime dependency for iproute2-tipc
1e068a1 mariadb: 5.5.55 -> 5.5.57
32edfea rsyslog: fix CVE-2017-12588
84c2374 rsyslog: install logrotate configuration file into correct location
2408c0b libvpx: upgrade to 1.6.1
13d6ee0 quagga: update to 1.2.1
3dd4951 gd: update to 2.2.4
4b089dd pcsc-lite: Update tp 1.8.22
5699e55 efivar: Upgrade to 0.31
6c4d66d openvpn: 2.4.2 -> 2.4.3
fa90221 python*-ptyprocess: add v0.5.2
1824182 python*-pexpect: add v4.2.1
13fef51 rsyslog: CVE-2015-3243
1eb720c ipsec-tools: fix CVE-2016-10396
d2834e6 multipath-tools: add bash to RDEPENDS
f5eef2a python3-pykickstart: tweak shebang to python3
590284c xmlrpc-c: add perl to RDEPENDS
4c41502 phpmyadmin: upgrade to 4.7.3
01778eb recipes: remove blacklisted recipes
d363145 Revert "python-m2crypto: Upgrade to 0.26.0"

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
8960831 qwt-qt5.inc: fix QA warning
not included in master yet:=20
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
648f7b0 qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation, qtwa=
yland: disable gold to work around binutils bug

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:=20
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
954d85a enyo-1.0: Bump SRCREV
not included in master yet:=20
a13d81f README: update to depend on master branches
ab5b4f5 connman: Rename bbappend to match new version from oe-core
e22f511 ofono: Rename bbappend to match new version from oe-core
da156e6 glib-2.0: Rename bbappend to match new version from oe-core
f4c2a70 opkg: Rename bbappend to match new version from oe-core
60c7d1e alsa-utils: Rename bbappend to match new version from oe-core
ac8a47f alsa-lib: Rename bbappend to match new version from oe-core
8b71446 alsa-lib: Remove 0001-ucm-fix-handling-of-config-files-when-file-ty=
pe-is-n.patch
b344ec0 bluez: switch from bluez4 to bluez5
b41a113 systemd: update persistent-storage-rule-mmc-partname.patch to apply=
 on 234 version
a4a801d glib-2.0: Rename bbappend to match new version from oe-core
c76eff3 WIP: Update patches for QT 5.9
a3c40d4 Temp Patch 1
5cacb6e Update recipe
f06d0db Try without the setKeyboardFocus patch
b451ae1 qtwebkit-chromium: Update patches for 56-based
42ada57 Update patch for palmservicebridge
75ae0f6 Updates for QT 5.9 Upgrade
89d74bd Remove patches for testing and use latest from upstream

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
1fe2b3b android-system-image-tenderloin: update Android image
not included in master yet:=20
e468a34 meta-shr, meta-fso: remove blacklisted recipes
9529399 ubx-utils: fix file-rdeps QA
22727fb numptyphysics: fix file-rdeps QA

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWZwvlQAKCRA3VSO3ZXaA
HIBPAJ4nzivXgX3F58lQ3PIiOG7JEbO1CACbBiHvhJo3iE1Z2tsSGzh61sJ/7RQ=
=yRlj
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
