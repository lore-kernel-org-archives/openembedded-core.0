Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DBEA71A0F;
	Sat, 26 Aug 2017 20:57:33 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id s199so1178771vke.2;
	Sat, 26 Aug 2017 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IZcWS6huUBmrWDgVpLqhANmfrwZwSJFnl35r2wmdYgM=;
	b=GWzQEzKDJU9U4XNZmNZuYlCesiPtCkIrkNsOuPgxAT+Dkqw+cd4Yp4gzPlmFJ3u2mX
	c6qMjo1p3QFUtngtTgqVg07hS7aiU3yzoD8rt6ohlXYEzyO5kO12WsTnTGPbwSvukoSJ
	PP4slkcxAU1EBLndinCMpptqzFPVjgEKmSQmdsJUbmKDVoXlzRaYAJ5dvKXEgdPhWYR3
	UO7i9wfgNaNyfZU02n2y4TTY3gEKf2rEAa7H0v28v0/fa1ryL0xnLf2ETG7hslM3FMK7
	Iy90v6QbN4Yqh2Z5S+J4Xub6Fjsbwc146ZG2FJt75aZetnHFgBYM0jBDM3Ue/ogsRbis
	TKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IZcWS6huUBmrWDgVpLqhANmfrwZwSJFnl35r2wmdYgM=;
	b=ODBRhGLNaFQPgH4/CsDWKpv0y7RgbGKZLVBYMjfIODNl9Ks2LPvYzIeDQdEcGMjcYr
	Hjyiqi9nugYyN2eHIU6edXY+zn5wkcFarAIdz96bdcAfV8V70ymKk4VzQ3QfEvKY99tR
	GxTAAu6eDfubXdnZ0mWNVquoYqjya6y0d9URpRqQQyWnjVetqqnKd/5IHrdVWLr/b9Nh
	CrrvikUfN5l+EmGOzNqhFKlGLtwBVHm+ZudQghZG/slGnPpm0w+iAc1EqH8NiV1+2Mzz
	WnAR4ukgw0kq1xx8juCXwzAZrPxSQvNypYM27aLxJrU68xNF/lAx5k98KTJbvQb3g+yJ
	vujA==
X-Gm-Message-State: AHYfb5ilUK9jrZW+wbDY/3E7dp3Pb10l15Fj+TukNPCwLHhgYU7qgL8U
	oyT2/oDFwAbqQ1wkl2hcNYWZkbe1Kw==
X-Received: by 10.31.5.9 with SMTP id 9mr1482315vkf.79.1503781054165; Sat, 26
	Aug 2017 13:57:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Sat, 26 Aug 2017 13:57:33 -0700 (PDT)
In-Reply-To: <CA+chaQeNiTRKYY5KOOfpj4o8zk=biTiQFTgRY=ORtampc1o0Zw@mail.gmail.com>
References: <CA+chaQeNiTRKYY5KOOfpj4o8zk=biTiQFTgRY=ORtampc1o0Zw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 26 Aug 2017 16:57:33 -0400
Message-ID: <CADkTA4Mu9cAxn611n80i+Ws3g=n5qXqFYTvLS+Ahjb3V00Qk7A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-08-24
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
X-List-Received-Date: Sat, 26 Aug 2017 20:57:34 -0000
Content-Type: multipart/alternative; boundary="001a1143f2728dbac60557ae4ff1"

--001a1143f2728dbac60557ae4ff1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2017 at 1:59 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Issues in meta-qt5 caused by security_flags.inc were fixed in this round,=
 for next round I'll test fixed 5.9.0 upgrade and then final 5.9.2 upgrade.
>
>
> Thanks for fixes for QA issues, few more are included in next round.
>
>
> Hopefully we'll get back to clean state before Rocko is released.
>
>
> This build already includes fewer layers, on 09-01 I'll remove them from =
the repositories as well.
>
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date		     !!colspan=3D'3'|Failed tasks			    !!|Signatures		  !!colspa=
n=3D'14'|QA !!Comment
> |-
> ||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	|=
|textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-co=
ntaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-s=
ysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||=09
> |-
>
> ||2017-08-24	||17	||16	||10	||1	||0		||0		||5		||0		||15		||33		||1		||0	=
	||0		||0		||0		||0		||0		||0		||=09
> |}
>
> =3D=3D Failed tasks 2017-08-24 =3D=3D
>
> INFO: jenkins-job.sh-1.8.27 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/rocko/log.report.20170826_075513.log
>
> =3D=3D=3D common (7) =3D=3D=3D
>     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compil=
e
>     * meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.2=
6.bb:do_package_qa
>     * meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscs=
itarget_1.4.20.3+svn502.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguar=
d-module_0.0.20170517.bb:do_compile
>
>
khem had mentioned wiregard to me on IRC, I'll have a look at this early
this week.


>     * meta-openembedded/meta-networking/recipes-support/ndisc6/ndisc6_1.0=
.3.bb:do_package_qa
>     * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4.2.=
bb:do_package_qa
>     * meta-openembedded/meta-python/recipes-devtools/python/python-matplo=
tlib_1.1.0.bb:do_compile
>
> =3D=3D=3D common-x86 (1) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxgues=
tdrivers_5.1.18.bb:do_compile
>
>
And he mentioned this as well. I'll also have a look at it early in the
week.

Bruce


>
> =3D=3D=3D qemuarm (10) =3D=3D=3D
>     * meta-openembedded/meta-filesystems/recipes-utils/udevil/udevil_0.4.=
4.bb:do_package_qa
>     * meta-openembedded/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.=
bb:do_package_qa
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyr=
ing_2.32.1.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/mpich/mpich_3.2.bb:do_pa=
ckage_qa
>     * meta-openembedded/meta-oe/recipes-extended/enscript/enscript_1.6.6.=
bb:do_package_qa
>     * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb:d=
o_compile
>     * meta-openembedded/meta-perl/recipes-perl/libmodule/libmodule-build-=
perl_0.31.bb:do_package_qa
>     * meta-openembedded/meta-python/recipes-devtools/python/python3-pylin=
t_1.6.5.bb:do_package_qa
>     * meta-openembedded/meta-python/recipes-devtools/python/python-m2cryp=
to_0.26.0.bb:do_compile
>
> =3D=3D=3D qemux86 (2) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb=
:do_package_qa
>     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do=
_compile
>
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-serve=
r_git.bb:do_compile
>
> =3D=3D=3D Number of failed tasks (43) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 17	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemuarm.20170824_055549.log/ ||
> |-
> || qemux86 	|| 16	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86.20170823_180314.log/ || http://errors.yoctoproject.org/=
Errors/Build/45639/
> |-
> || qemux86_64 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world/r=
ocko/log.world.qemux86-64.20170824_211230.log/ || http://errors.yoctoprojec=
t.org/Errors/Build/45730/
> |}
>
> =3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D
>
> =3D=3D=3D QA issues (54) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
>
> |-
> ||0	||already-stripped
> |-
> ||0	||build-deps
> |-
> ||0	||compile-host-path
> |-
> ||0	||installed-vs-shipped
> |-
> ||0	||invalid-pkgconfig
> |-
> ||0	||ldflags
> |-
> ||0	||libdir
> |-
> ||0	||pkgname
> |-
> ||0	||symlink-to-sysroot
> |-
> ||0	||unknown-configure-option
> |-
> ||15	||file-rdeps
> |-
> ||1	||host-user-contaminated
> |-
> ||33	||version-going-backwards
> |-
> ||5	||textrel
> |}
>
>
>
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (1) =3D=3D=3D
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.si=
gnatures.20170824_173753.log/
>     * ERROR: 1 issues were found in these recipes: android-tools
>
>     * ERROR: 1 errors found in signatures.qemux86.do_package_write_ipk.si=
gdata.log
>
>     * ERROR: android-tools different signature for task do_package_write_=
ipk.sigdata between qemux86copy and qemux86
>     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/=
sstate-diff/1503632273/signatures.qemux86.do_package_write_ipk.sigdata.log
>     * ERROR: 1 issues were found in these recipes: android-tools
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLA=
CKLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-g=
old', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-qt5:
> meta-smartphone:
> meta-webos-ports:
> PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation=
 which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be te=
sted so much"
> PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be tes=
ted so much"
> PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be te=
sted so much"
> PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads =
directory in /home/builder/poky :/"
>
>
> QA issues by type:
> count: 0	issue: already-stripped
>
>
> count: 0	issue: libdir
>
>
> count: 5	issue: textrel
> chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.2=
810.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations i=
n .text [textrel]
> chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chrom=
ium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromi=
um/chrome' has relocations in .text [textrel]
> corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0=
/packages-split/corosync/usr/sbin/corosync' has relocations in .text [textr=
el]
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x26=
4/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has =
relocations in .text [textrel]
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x26=
4/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148=
' has relocations in .text [textrel]
>
>
> count: 0	issue: build-deps
>
>
> count: 15	issue: file-rdeps
> corosync-2.4.2: /usr/share/corosync/corosync contained in package corosyn=
c requires /tmp/hosttools/bash, but no providers found in RDEPENDS_corosync=
? [file-rdeps]
> corosync-2.4.2: /usr/share/corosync/corosync-notifyd contained in package=
 corosync requires /tmp/hosttools/bash, but no providers found in RDEPENDS_=
corosync? [file-rdeps]
> enscript-1.6.6: /usr/bin/diffpp contained in package enscript requires /t=
mp/hosttools/perl, but no providers found in RDEPENDS_enscript? [file-rdeps=
]
> enscript-1.6.6: /usr/bin/sliceprint contained in package enscript require=
s /tmp/hosttools/perl, but no providers found in RDEPENDS_enscript? [file-r=
deps]
> libbonobo-2.32.1: /usr/bin/bonobo-slay contained in package libbonobo-bin=
 requires /tmp/hosttools/perl, but no providers found in RDEPENDS_libbonobo=
-bin? [file-rdeps]
> libmodule-build-perl-0.31: /usr/bin/config_data contained in package libm=
odule-build-perl requires /tmp/work/armv5te-oe-linux-gnueabi/libmodule-buil=
d-perl/0.31-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no =
providers found in RDEPENDS_libmodule-build-perl? [file-rdeps]
> libmodule-build-perl-0.31: /usr/bin/config_data contained in package libm=
odule-build-perl requires /tmp/work/i586-oe-linux/libmodule-build-perl/0.31=
-r0/recipe-sysroot-native/usr/bin/perl-native/perl.real, but no providers f=
ound in RDEPENDS_libmodule-build-perl? [file-rdeps]
> logwarn-1.0.14: /usr/lib/nagios/plugins/check_logwarn contained in packag=
e logwarn-nagios requires /tmp/hosttools/bash, but no providers found in RD=
EPENDS_logwarn-nagios? [file-rdeps]
> mpich-3.2: /usr/bin/parkill contained in package mpich requires /tmp/host=
tools/perl, but no providers found in RDEPENDS_mpich? [file-rdeps]
> ndisc6-1.0.3: /usr/bin/dnssort contained in package ndisc6-misc requires =
/tmp/hosttools/perl, but no providers found in RDEPENDS_ndisc6-misc? [file-=
rdeps]
> python3-pylint-1.6.5: /usr/lib/python3.5/site-packages/pylint/test/data/a=
script contained in package python3-pylint requires /usr/bin/python, but no=
 providers found in RDEPENDS_python3-pylint? [file-rdeps]
> squid-3.5.26: /usr/libexec/basic_db_auth contained in package squid requi=
res /tmp/work/armv5te-oe-linux-gnueabi/squid/3.5.26-r0/recipe-sysroot-nativ=
e/usr/bin/perl-native/perl, but no providers found in RDEPENDS_squid? [file=
-rdeps]
> squid-3.5.26: /usr/libexec/ext_delayer_acl contained in package squid req=
uires /tmp/work/i586-oe-linux/squid/3.5.26-r0/recipe-sysroot-native/usr/bin=
/perl-native/perl, but no providers found in RDEPENDS_squid? [file-rdeps]
> squid-3.5.26: /usr/libexec/ext_wbinfo_group_acl contained in package squi=
d requires /tmp/work/core2-64-oe-linux/squid/3.5.26-r0/recipe-sysroot-nativ=
e/usr/bin/perl-native/perl, but no providers found in RDEPENDS_squid? [file=
-rdeps]
> udevil-0.4.4: /usr/bin/devmon contained in package udevil requires /bin/b=
ash, but no providers found in RDEPENDS_udevil? [file-rdeps]
>
>
> count: 33	issue: version-going-backwards
> logcheck-1.3.17: Package version for package logcheck-dbg went backwards =
which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [vers=
ion-going-backwards]
> logcheck-1.3.17: Package version for package logcheck-dev went backwards =
which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [vers=
ion-going-backwards]
> logcheck-1.3.17: Package version for package logcheck-doc went backwards =
which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [vers=
ion-going-backwards]
> logcheck-1.3.17: Package version for package logcheck-locale went backwar=
ds which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [v=
ersion-going-backwards]
> logcheck-1.3.17: Package version for package logcheck-staticdev went back=
wards which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2)=
 [version-going-backwards]
> logcheck-1.3.17: Package version for package logcheck went backwards whic=
h would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [version-=
going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-dbg went backwards which would break package feeds from =
(0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_15d257f=
d92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-dev went backwards which would break package feeds from =
(0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_15d257f=
d92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-doc went backwards which would break package feeds from =
(0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_15d257f=
d92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-examples-dbg went backwards which would break package fe=
eds from (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7d=
b_15d257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-examples-dev went backwards which would break package fe=
eds from (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7d=
b_15d257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-examples-staticdev went backwards which would break pack=
age feeds from (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d74=
0d6a7db_15d257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-examples went backwards which would break package feeds =
from (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_15=
d257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-locale went backwards which would break package feeds fr=
om (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_15d2=
57fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-mkspecs went backwards which would break package feeds f=
rom (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_15d=
257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-plugins-dbg went backwards which would break package fee=
ds from (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db=
_15d257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-plugins went backwards which would break package feeds f=
rom (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_15d=
257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-qmldesigner went backwards which would break package fee=
ds from (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db=
_15d257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-qmlplugins-dbg went backwards which would break package =
feeds from (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a=
7db_15d257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-qmlplugins went backwards which would break package feed=
s from (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_=
15d257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-staticdev went backwards which would break package feeds=
 from (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_1=
5d257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-tools-dbg went backwards which would break package feeds=
 from (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_1=
5d257fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine-tools went backwards which would break package feeds fro=
m (0:5.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_15d25=
7fd92-r0.0) [version-going-backwards]
> qtwebengine-5.8.0+gitAUTOINC+d740d6a7db_15d257fd92: Package version for p=
ackage qtwebengine went backwards which would break package feeds from (0:5=
.8.0+git0+d740d6a7db_15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_15d257fd92-=
r0.0) [version-going-backwards]
> serial-forward-1.1+gitrAUTOINC+00dbec2636: Package version for package se=
rial-forward-dbg went backwards which would break package feeds from (1:1.1=
+gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going-backw=
ards]
> serial-forward-1.1+gitrAUTOINC+00dbec2636: Package version for package se=
rial-forward-dev went backwards which would break package feeds from (1:1.1=
+gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going-backw=
ards]
> serial-forward-1.1+gitrAUTOINC+00dbec2636: Package version for package se=
rial-forward-doc went backwards which would break package feeds from (1:1.1=
+gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going-backw=
ards]
> serial-forward-1.1+gitrAUTOINC+00dbec2636: Package version for package se=
rial-forward-locale went backwards which would break package feeds from (1:=
1.1+gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going-ba=
ckwards]
> serial-forward-1.1+gitrAUTOINC+00dbec2636: Package version for package se=
rial-forward-staticdev went backwards which would break package feeds from =
(1:1.1+gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going=
-backwards]
> serial-forward-1.1+gitrAUTOINC+00dbec2636: Package version for package se=
rial-forward went backwards which would break package feeds from (1:1.1+git=
r0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going-backwards=
]
> xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi-dbg =
went backwards which would break package feeds from (0:1.0-r0.6 to 0:1.0-r0=
.0) [version-going-backwards]
> xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi-dev =
went backwards which would break package feeds from (0:1.0-r0.6 to 0:1.0-r0=
.0) [version-going-backwards]
> xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi went=
 backwards which would break package feeds from (0:1.0-r0.6 to 0:1.0-r0.0) =
[version-going-backwards]
>
>
> count: 1	issue: host-user-contaminated
> glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-ae/usr/lib/l=
ocale/ar_AE/LC_COLLATE is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
>
>
> count: 0	issue: installed-vs-shipped
>
>
> count: 0	issue: unknown-configure-option
>
>
> count: 0	issue: symlink-to-sysroot
>
>
> count: 0	issue: invalid-pkgconfig
>
>
> count: 0	issue: pkgname
>
>
> count: 0	issue: ldflags
>
>
> count: 0	issue: compile-host-path
>
>
>
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> latest upstream commit:
> 8a60106 main: Attempt to gain bitbake.lock rather than just waiting
> not included in master yet:
> a064963 world-image: add extra target
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
>
> latest upstream commit:
> a8b89b3 default-providers: Add entries for pkgconfig (due to pkg-conf bei=
ng added)
> not included in master yet:
> 338cc89 report-error: Allow to upload reports automatically
> f492b98 buildhistory.bbclass: metadata-revs show repo parent
> eb590e9 metadata-revs: provide more information
> 7860d90 qemux86: Add identical qemux86copy variant for tests
> 9fdb66a reproducible_build.bbclass: initial support for binary reproducib=
ility
> 097476c cpio: provide cpio-replacement-native
> c3b689d image_types.bbclass: improve cpio image reproducibility
> cbd025c rootfs-postcommands.bbclass: support binary reproducibility
> c0f57c9 insane.bbclass: write QA issues to log file only when they are in=
 ERROR_QA or WARN_QA
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
>
> latest upstream commit:
> ac2a6d2 json-spirit: Add -latomic to LDFLAGS
> not included in master yet:
> 6ff499b dnsmasq: disable the service by default
> ca0e943 rdate: Fix build with hardening
> 7e3d8e4 strongswan: Include stdint.h for uintptr_t
> 217431e netkit-rpc: Fix build with hardening flags
> f3819cc netkit-telnet: Fix build with hardening
> 048e071 ncftp: Upgrade to 3.2.6
> 61495a9 autofs: Add build dependency on libnsl2
> 96e606d openhpi: Fix build on 64bit platforms e.g. aarch64
> 7feddb1 security_flags.inc: Delete
> a4723a6 pptp-linux: Upgrade to 1.9.0
> ab4774e ebtables: replace ebtables-save perl script with bash rewrite
> 3a96b76 pimd: Upgrade to 2.3.2
> aa43496 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
> 92bc7d2 rdate: Define logwtmp if libc !=3D glibc
> a04b53f netkit-ftp: Include sys/types.h for u_long definition
> feb1653 postfix: Disable nis support on musl
> 93ee634 zeroconf: Fix build with musl
> 163c868 netperf: change SRC_URI to git repository
> 4c2b4c4 ippool: Fix build errors found with hardening flags
> 5ebba48 openflow: Fix build with musl
> 610e392 xl2tpd: Update to 1.3.9
> 53982a0 c-ares: update 1.12.0 -> 1.13.0
> b101101 radvd: 2.14 -> 2.17
> 9a7309d libesmtp: Fix config.h define for snprintf detection
> b9b2b01 drbd: Add recipe
> b7b27a5 net-snmp: fix engineBoots value on SIGHUP
> f8559af openl2tp: add LGPL-2.1 license
> ce8ed9a openl2tp: add init script and systemd support
> 4f97a6c ntop: add new recipe
> 21479a9 libtdb: update 1.3.12 -> 1.3.14
> d946a42 ndisc6: Upgrade to 1.0.3
> f3dd13e memcached: Update to 1.5.0
> 3436c8e tcpdump: remove unnecessary patch
> 209a90c squid: Add missing dependencies on openssl expat and libxml2
> 5061e4f postfix: Upgrade to 3.2.2
> 33dff9b mpv: Update to version 0.26.0.
> cc37aef python3-blivet: add recipe 2.2.0
> ad94afe python3-blivetgui: add recipe 2.1.5
> 47fb79b librcf: Add -latomic to LDFLAGS
> 6599b98 upower: update 0.99.4 -> 0.99.5
> b720216 geany: update 1.30.1 -> 1.31
> 29805cb geany-plugins: update 1.30 -> 1.31
> c94d8e7 python-wrapt: update to version 1.10.11
> 69a7670 python-cmd2: update to version 0.7.6
> 353a2ab python-sqlalchemy: update to version 1.1.13
> 363c33c python-pytest: update to version 3.2.1
> 38c6ecb python-pyro4: update to version 4.61
> 07c7d83 php: move to version 7.1.8 from 7.1.7
> 03eaf98 gsoap: Upgrade to 2.8.51
> 16a43c3 caps: Mark ARCH empty
> 5d25280 mailcap: upgrade to 2.1.48
> 17dbbb3 mailx: Force mailx to build with openssl10
> ac85ad1 php: disable this version by default
> 7b9dfb7 freeradius: Upgrade to 3.0.15
> 4978e89 tcpdump: update to 4.9.1 to fix CVE-2017-11108
> a99294b vlock: add new recipe
> 1e2f4b9 fontforge: update to 20170731 to fix CVEs
> 5567b2a wireshark: 2.2.7 -> 2.2.8
> 632f250 start-stop-daemon: Only create a link in ${base_sbindir} if neces=
sary
> d8811b9 python-chardet: Extend to native and nativesdk
> ebd41b0 openobex: disable building documentation
> ac15d80 openwsman: rename to 2.6.3
> da135d6 iproute2: add bbappend for supporting tipc tool
> cebccb3 tipcutils: add runtime dependency for iproute2-tipc
> f920d63 mariadb: 5.5.55 -> 5.5.57
> 64ee547 rsyslog: fix CVE-2017-12588
> cc02e10 rsyslog: install logrotate configuration file into correct locati=
on
> 56d6e0a libvpx: upgrade to 1.6.1
> a4ee06b quagga: update to 1.2.1
> 961abc1 gd: update to 2.2.4
> cb686c3 efivar: Upgrade to 0.31
> 3706ca2 openvpn: 2.4.2 -> 2.4.3
> de9860c python*-ptyprocess: add v0.5.2
> fab2dd5 python*-pexpect: add v4.2.1
> 543455e ipsec-tools: fix CVE-2016-10396
> 6c775f9 multipath-tools: add bash to RDEPENDS
> 5141a9b python3-pykickstart: tweak shebang to python3
> 52f0eb1 xmlrpc-c: add perl to RDEPENDS
> 92d6a0f phpmyadmin: upgrade to 4.7.3
> 3716024 pcsc-lite: Update to 1.8.22
> d3af646 python-requests: Update to version 2.18.4
> e3057cc sthttpd: update to 2.27.1
> c9f10ab glibmm: fix perl path
> 3a8e526 postgresql: update to 9.4.13
> 4c2ea5a Dhrystone: add recipe 2.1
> c2a4bdf makedumpfile: update to 1.6.2
> 6ce999e mozjs: customize HOST_CFLAGS
> f3e09bd adduser: use get_perl_version instead of PERLVERSION
> a17cffb iperf3: 3.1.3 -> 3.2
> 40916b0 webmin: add systemd service file
> 598c29c python-markupsafe: Extend to build native version too
> a7f2d3a vim: update to 8.0.0983
> 9756937 python-m2crypto: Upgrade to 0.26.0
> 87f7ea5 gnulib: upgrade to 2017-08-20.18
> 0c7c8fb collectd: 5.7.1 -> 5.7.2
> 54b071b netcf: upgrade to latest 0.2.8
> 0c0ef1d tftp-hpa: add systemd unit files
> d1f41a0 gperftools: fixup HOMEPAGE
> 8f5ed1d openconnect: fix parallel compilation failure
> 5d15b1c gnome-keyring: Fix compatibility with gcr 3 in oe-core
> 863d51e openconnect: upgrade to 7.08
> 4dd9884 gflags: add runtime dependency on bash
> f3fc0cc logcheck: update to 1.3.18 and move to meta-perl
> 3815615 python-pycrypto: Security fix CVE-2013-7459
> 3d85015 logwarn: set correct paths and add missing dependency
> c2dbb9b openldap: fix native LDFLAGS build error
> 166bf62 xorg-fonts-100dpi: unblacklist recipe
> a60ac1c recipes: remove blacklisted recipes
> 69529c6 meta-ruby: remove this now pretty empty layer
> 61e8314 meta-efl: remove this now pretty empty layer
> 07ed328 meta-systemd: remove this now pretty empty layer
> 7b0f2ca meta-gpe: remove this now pretty empty layer
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:
> 8960831 qwt-qt5.inc: fix QA warning
> not included in master yet:
> 6e9892a qtbase: add ptest
> d53382f qt5-ptest: fix build with yocto < 2.3 (pyro)
> 9042969 qtbase: Fix ptests with clang
> 0b41b62 qtbase: Use sched_yield instead of pthread_yield
> 17d94b7 quazip: update to 0.7.3 and add missing metadata
> 3963daa qtwebkit: Backport a patch to fix build with icu-59
> 7efcea9 qt3d: Fix build with clang
> c74e5b8 qtbase: remove qtbase-native from DEPENDS
> 1619723 gstreamer1.0-plugins-bad: add qt5 packageconfig
> d82317c qtbase: refresh the patches
> 246ec7b qtwebengine: refresh patches
> 142f888 qt3d: refresh patches
> 3522d3d qtbase: fix Krogoth build regression from efa8aaf
> d9f4b6e meta-toolchain-qt5: don't rely on COREBASE/LICENSE
> 209e7e6 qtwebengine: disable SECURITY_STRINGFORMAT to fix the build
> 648f7b0 qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation, qt=
wayland: disable gold to work around binutils bug
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
> latest upstream commit:
> 08576b0 Merge pull request #58 from kraj/kraj/master
> not included in master yet:
> f9c357c gnome-settings-daemon: remove the bbappend for removed recipe
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143f2728dbac60557ae4ff1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Aug 26, 2017 at 1:59 PM, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><pre id=3D"m_-7211149901424225004gmail-out" class=3D"m_-7211149901424225=
004gmail-console-output" style=3D"box-sizing:border-box;white-space:pre-wra=
p;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51)=
;font-size:14px"><pre style=3D"box-sizing:border-box;white-space:pre-wrap;w=
ord-wrap:break-word;margin-top:0px;margin-bottom:0px">Issues in meta-qt5 ca=
used by security_flags.inc were fixed in this round, for next round I&#39;l=
l test fixed 5.9.0 upgrade and then final 5.9.2 upgrade.</pre><pre style=3D=
"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top=
:0px;margin-bottom:0px"><br></pre><pre style=3D"box-sizing:border-box;white=
-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px">Than=
ks for fixes for QA issues, few more are included in next round.</pre><pre =
style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;ma=
rgin-top:0px;margin-bottom:0px"><br></pre><pre style=3D"box-sizing:border-b=
ox;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0=
px">Hopefully we&#39;ll get back to clean state before Rocko is released.</=
pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:brea=
k-word;margin-top:0px;margin-bottom:0px"><br></pre><pre style=3D"box-sizing=
:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin=
-bottom:0px">This build already includes fewer layers, on 09-01 I&#39;ll re=
move them from the repositories as well.</pre><pre style=3D"box-sizing:bord=
er-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bott=
om:0px"><br></pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;=
word-wrap:break-word;margin-top:0px;margin-bottom:0px"><a href=3D"http://ww=
w.openembedded.org/wiki/Bitbake_World_Status" style=3D"box-sizing:border-bo=
x;word-wrap:break-word;color:rgb(92,53,102)" target=3D"_blank">http://www.o=
penembedded.org/<wbr>wiki/Bitbake_World_Status</a>

=3D=3D Number of issues - stats =3D=3D
{| class=3D&#39;wikitable&#39;
!|Date		     !!colspan=3D&#39;3&#39;|Failed tasks			    !!|Signatures		  !!=
colspan=3D&#39;14&#39;|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||=09
|-
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">||2017-08-24	||17	||16	||10	||1	=
||0		||0		||5		||0		||15		||33		||1		||0		||0		||0		||0		||0		||0		||0		||=
=09
|}

=3D=3D Failed tasks 2017-08-24 =3D=3D

INFO: jenkins-job.sh-1.8.27 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170826_075513.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" t=
arget=3D"_blank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/=
log.<wbr>report.20170826_075513.log</a>

=3D=3D=3D common (7) =3D=3D=3D
    * meta-browser/recipes-mozilla/<wbr>firefox/firefox_45.9.0esr.bb:d<wbr>=
o_compile
    * meta-openembedded/meta-<wbr>networking/recipes-daemons/<wbr>squid/squ=
id_3.5.26.bb:do_<wbr>package_qa
    * meta-openembedded/meta-<wbr>networking/recipes-extended/<wbr>iscsitar=
get/iscsitarget_1.4.<wbr>20.3+svn502.bb:do_compile
    * meta-openembedded/meta-<wbr>networking/recipes-kernel/<wbr>wireguard/=
wireguard-module_0.<wbr>0.20170517.bb:do_compile</pre></pre></div></blockqu=
ote><div><br></div><div>khem had mentioned wiregard to me on IRC, I&#39;ll =
have a look at this early this week.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr"><pre id=3D"m_-7211149901424225004gmail-out"=
 class=3D"m_-7211149901424225004gmail-console-output" style=3D"box-sizing:b=
order-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-b=
ottom:0px;color:rgb(51,51,51);font-size:14px"><pre style=3D"box-sizing:bord=
er-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bott=
om:0px">    * meta-openembedded/meta-<wbr>networking/recipes-support/<wbr>n=
disc6/ndisc6_1.0.3.bb:do_<wbr>package_qa
    * meta-openembedded/meta-oe/<wbr>recipes-extended/corosync/<wbr>corosyn=
c_2.4.2.bb:do_package_<wbr>qa
    * meta-openembedded/meta-python/<wbr>recipes-devtools/python/<wbr>pytho=
n-matplotlib_1.1.0.bb:do_<wbr>compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/<wbr>recipes-support/<wbr>vboxguestdrivers/=
<wbr>vboxguestdrivers_5.1.18.bb:do_<wbr>compile</pre></pre></div></blockquo=
te><div><br></div><div>And he mentioned this as well. I&#39;ll also have a =
look at it early in the week.</div><div><br></div><div>Bruce</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><pre id=3D"m_-7211=
149901424225004gmail-out" class=3D"m_-7211149901424225004gmail-console-outp=
ut" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-wor=
d;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><pre=
 style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;m=
argin-top:0px;margin-bottom:0px">
=3D=3D=3D qemuarm (10) =3D=3D=3D
    * meta-openembedded/meta-<wbr>filesystems/recipes-utils/<wbr>udevil/ude=
vil_0.4.4.bb:do_<wbr>package_qa
    * meta-openembedded/meta-gnome/<wbr>recipes-gnome/bonobo/<wbr>libbonobo=
_2.32.1.bb:do_<wbr>package_qa
    * meta-openembedded/meta-gnome/<wbr>recipes-gnome/gnome-keyring/<wbr>gn=
ome-keyring_2.32.1.bb:do_<wbr>compile
    * meta-openembedded/meta-oe/<wbr>recipes-devtools/android-<wbr>tools/an=
droid-tools_5.1.1.r37.<wbr>bb:do_compile
    * meta-openembedded/meta-oe/<wbr>recipes-devtools/mpich/mpich_<wbr>3.2.=
bb:do_package_qa
    * meta-openembedded/meta-oe/<wbr>recipes-extended/enscript/<wbr>enscrip=
t_1.6.6.bb:do_package_<wbr>qa
    * meta-openembedded/meta-oe/<wbr>recipes-support/mysql/mariadb_<wbr>5.5=
.57.bb:do_compile
    * meta-openembedded/meta-perl/<wbr>recipes-perl/libmodule/<wbr>libmodul=
e-build-perl_0.31.bb:d<wbr>o_package_qa
    * meta-openembedded/meta-python/<wbr>recipes-devtools/python/<wbr>pytho=
n3-pylint_1.6.5.bb:do_<wbr>package_qa
    * meta-openembedded/meta-python/<wbr>recipes-devtools/python/<wbr>pytho=
n-m2crypto_0.26.0.bb:do_<wbr>compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/<wbr>recipes-support/logwarn/<wbr>logwarn_1=
.0.14.bb:do_package_<wbr>qa
    * meta-openembedded/meta-oe/<wbr>recipes-support/mongodb/<wbr>mongodb_g=
it.bb:do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-gnome/<wbr>recipes-gnome/eds/evolution-<wbr>da=
ta-server_git.bb:do_compile

=3D=3D=3D Number of failed tasks (43) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 17	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/rocko/log.world.qemuarm.20170824_055549.log/" style=3D"box-sizing:bord=
er-box;word-wrap:break-word;color:rgb(92,53,102)" target=3D"_blank">http://=
logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemuarm.2=
0170824_055549.<wbr>log/</a> ||=20
|-
|| qemux86 	|| 16	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/rocko/log.world.qemux86.20170823_180314.log/" style=3D"box-sizing:bord=
er-box;word-wrap:break-word;color:rgb(92,53,102)" target=3D"_blank">http://=
logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemux86.2=
0170823_180314.<wbr>log/</a> || <a href=3D"http://errors.yoctoproject.org/E=
rrors/Build/45639/" style=3D"box-sizing:border-box;word-wrap:break-word;col=
or:rgb(92,53,102)" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Er=
rors/Build/45639/</a>
|-
|| qemux86_64 	|| 10	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/o=
e/world/rocko/log.world.qemux86-64.20170824_211230.log/" style=3D"box-sizin=
g:border-box;word-wrap:break-word;color:rgb(92,53,102)" target=3D"_blank">h=
ttp://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qem=
ux86-64.20170824_<wbr>211230.log/</a> || <a href=3D"http://errors.yoctoproj=
ect.org/Errors/Build/45730/" style=3D"box-sizing:border-box;word-wrap:break=
-word;color:rgb(92,53,102)" target=3D"_blank">http://errors.yoctoproject.<w=
br>org/Errors/Build/45730/</a>
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (54) =3D=3D=3D
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
||15	||file-rdeps
|-
||1	||host-user-contaminated
|-
||33	||version-going-backwards
|-
||5	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (1) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170824_173753.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)" target=3D"_blank">http://logs.nslu2-=
linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>signatures.20170824_173753=
.<wbr>log/</a>
    * ERROR: 1 issues were found in these recipes: android-tools

    * ERROR: 1 errors found in signatures.qemux86.do_package_<wbr>write_ipk=
.sigdata.log

    * ERROR: android-tools different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-<wbr>core/tmp-gli=
bc/sstate-diff/<wbr>1503632273/signatures.qemux86.<wbr>do_package_write_ipk=
.sigdata.<wbr>log
    * ERROR: 1 issues were found in these recipes: android-tools


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-<wbr>support/lksctp-tools/lksctp-<wbr>tools_1.0.17.=
bb:PNBLACKLIST[<wbr>lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DIST=
RO_<wbr>FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link ag=
ainst sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;
meta-qt5:
meta-smartphone:
meta-webos-ports:
PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtualiazat=
ion which isn&#39;t included in my world builds&quot;
PNBLACKLIST[bigbuckbunny-<wbr>1080p] =3D &quot;big and doesn&#39;t really n=
eed to be tested so much&quot;
PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[tearsofsteel-<wbr>1080p] =3D &quot;big and doesn&#39;t really n=
eed to be tested so much&quot;
PNBLACKLIST[build-appliance-<wbr>image] =3D &quot;tries to include whole do=
wnloads directory in /home/builder/poky :/&quot;


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 5	issue: textrel
chromium-54.0.2810.2: ELF binary &#39;/tmp/work/i586-oe-linux/<wbr>chromium=
/54.0.2810.2-r0/<wbr>packages-split/chromium/usr/<wbr>bin/chromium/chrome&#=
39; has relocations in .text [textrel]
chromium-wayland-53.0.2785.<wbr>143: ELF binary &#39;/tmp/work/i586-oe-linu=
x/<wbr>chromium-wayland/53.0.2785.<wbr>143-r0/packages-split/<wbr>chromium-=
wayland/usr/bin/<wbr>chromium/chrome&#39; has relocations in .text [textrel=
]
corosync-2.4.2: ELF binary &#39;/tmp/work/core2-64-oe-linux/<wbr>corosync/2=
.4.2-r0/packages-<wbr>split/corosync/usr/sbin/<wbr>corosync&#39; has reloca=
tions in .text [textrel]
x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-li=
nux/x264/<wbr>r2731+gitAUTOINC+2b741f81e5-<wbr>r0/packages-split/x264-bin/<=
wbr>usr/bin/x264&#39; has relocations in .text [textrel]
x264-r2731+gitAUTOINC+<wbr>2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-li=
nux/x264/<wbr>r2731+gitAUTOINC+2b741f81e5-<wbr>r0/packages-split/x264/usr/<=
wbr>lib/libx264.so.148&#39; has relocations in .text [textrel]


count: 0	issue: build-deps


count: 15	issue: file-rdeps
corosync-2.4.2: /usr/share/corosync/corosync contained in package corosync =
requires /tmp/hosttools/bash, but no providers found in RDEPENDS_corosync? =
[file-rdeps]
corosync-2.4.2: /usr/share/corosync/corosync-<wbr>notifyd contained in pack=
age corosync requires /tmp/hosttools/bash, but no providers found in RDEPEN=
DS_corosync? [file-rdeps]
enscript-1.6.6: /usr/bin/diffpp contained in package enscript requires /tmp=
/hosttools/perl, but no providers found in RDEPENDS_enscript? [file-rdeps]
enscript-1.6.6: /usr/bin/sliceprint contained in package enscript requires =
/tmp/hosttools/perl, but no providers found in RDEPENDS_enscript? [file-rde=
ps]
libbonobo-2.32.1: /usr/bin/bonobo-slay contained in package libbonobo-bin r=
equires /tmp/hosttools/perl, but no providers found in RDEPENDS_libbonobo-b=
in? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/armv5te-oe-linux-<wbr>gnueabi/libmodule-b=
uild-perl/<wbr>0.31-r0/recipe-sysroot-native/<wbr>usr/bin/perl-native/perl.=
real, but no providers found in RDEPENDS_libmodule-build-perl? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/work/i586-oe-linux/<wbr>libmodule-build-perl/0=
.31-r0/<wbr>recipe-sysroot-native/usr/bin/<wbr>perl-native/perl.real, but n=
o providers found in RDEPENDS_libmodule-build-perl? [file-rdeps]
logwarn-1.0.14: /usr/lib/nagios/plugins/check_<wbr>logwarn contained in pac=
kage logwarn-nagios requires /tmp/hosttools/bash, but no providers found in=
 RDEPENDS_logwarn-nagios? [file-rdeps]
mpich-3.2: /usr/bin/parkill contained in package mpich requires /tmp/hostto=
ols/perl, but no providers found in RDEPENDS_mpich? [file-rdeps]
ndisc6-1.0.3: /usr/bin/dnssort contained in package ndisc6-misc requires /t=
mp/hosttools/perl, but no providers found in RDEPENDS_ndisc6-misc? [file-rd=
eps]
python3-pylint-1.6.5: /usr/lib/python3.5/site-<wbr>packages/pylint/test/dat=
a/<wbr>ascript contained in package python3-pylint requires /usr/bin/python=
, but no providers found in RDEPENDS_python3-pylint? [file-rdeps]
squid-3.5.26: /usr/libexec/basic_db_auth contained in package squid require=
s /tmp/work/armv5te-oe-linux-<wbr>gnueabi/squid/3.5.26-r0/<wbr>recipe-sysro=
ot-native/usr/bin/<wbr>perl-native/perl, but no providers found in RDEPENDS=
_squid? [file-rdeps]
squid-3.5.26: /usr/libexec/ext_delayer_acl contained in package squid requi=
res /tmp/work/i586-oe-linux/squid/<wbr>3.5.26-r0/recipe-sysroot-<wbr>native=
/usr/bin/perl-native/<wbr>perl, but no providers found in RDEPENDS_squid? [=
file-rdeps]
squid-3.5.26: /usr/libexec/ext_wbinfo_group_<wbr>acl contained in package s=
quid requires /tmp/work/core2-64-oe-linux/<wbr>squid/3.5.26-r0/recipe-<wbr>=
sysroot-native/usr/bin/perl-<wbr>native/perl, but no providers found in RDE=
PENDS_squid? [file-rdeps]
udevil-0.4.4: /usr/bin/devmon contained in package udevil requires /bin/bas=
h, but no providers found in RDEPENDS_udevil? [file-rdeps]


count: 33	issue: version-going-backwards
logcheck-1.3.17: Package version for package logcheck-dbg went backwards wh=
ich would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [versio=
n-going-backwards]
logcheck-1.3.17: Package version for package logcheck-dev went backwards wh=
ich would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [versio=
n-going-backwards]
logcheck-1.3.17: Package version for package logcheck-doc went backwards wh=
ich would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [versio=
n-going-backwards]
logcheck-1.3.17: Package version for package logcheck-locale went backwards=
 which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [ver=
sion-going-backwards]
logcheck-1.3.17: Package version for package logcheck-staticdev went backwa=
rds which would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [=
version-going-backwards]
logcheck-1.3.17: Package version for package logcheck went backwards which =
would break package feeds from (0:1.3.18-r0.0 to 0:1.3.17-r0.2) [version-go=
ing-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-dbg went backwards which would break package feeds fr=
om (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db=
_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-dev went backwards which would break package feeds fr=
om (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db=
_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-doc went backwards which would break package feeds fr=
om (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db=
_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-examples-dbg went backwards which would break package=
 feeds from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d=
740d6a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-examples-dev went backwards which would break package=
 feeds from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d=
740d6a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-examples-staticdev went backwards which would break p=
ackage feeds from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+=
git0+d740d6a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-examples went backwards which would break package fee=
ds from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740d=
6a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-locale went backwards which would break package feeds=
 from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a=
7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-mkspecs went backwards which would break package feed=
s from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740d6=
a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-plugins-dbg went backwards which would break package =
feeds from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d7=
40d6a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-plugins went backwards which would break package feed=
s from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740d6=
a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-qmldesigner went backwards which would break package =
feeds from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d7=
40d6a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-qmlplugins-dbg went backwards which would break packa=
ge feeds from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0=
+d740d6a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-qmlplugins went backwards which would break package f=
eeds from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d74=
0d6a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-staticdev went backwards which would break package fe=
eds from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740=
d6a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-tools-dbg went backwards which would break package fe=
eds from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740=
d6a7db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine-tools went backwards which would break package feeds =
from (0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7=
db_<wbr>15d257fd92-r0.0) [version-going-backwards]
qtwebengine-5.8.0+gitAUTOINC+<wbr>d740d6a7db_15d257fd92: Package version fo=
r package qtwebengine went backwards which would break package feeds from (=
0:5.8.0+git0+d740d6a7db_<wbr>15d257fd92-r0.4 to 0:5.8.0+git0+d740d6a7db_<wb=
r>15d257fd92-r0.0) [version-going-backwards]
serial-forward-1.1+<wbr>gitrAUTOINC+00dbec2636: Package version for package=
 serial-forward-dbg went backwards which would break package feeds from (1:=
1.1+gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going-ba=
ckwards]
serial-forward-1.1+<wbr>gitrAUTOINC+00dbec2636: Package version for package=
 serial-forward-dev went backwards which would break package feeds from (1:=
1.1+gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going-ba=
ckwards]
serial-forward-1.1+<wbr>gitrAUTOINC+00dbec2636: Package version for package=
 serial-forward-doc went backwards which would break package feeds from (1:=
1.1+gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going-ba=
ckwards]
serial-forward-1.1+<wbr>gitrAUTOINC+00dbec2636: Package version for package=
 serial-forward-locale went backwards which would break package feeds from =
(1:1.1+gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going=
-backwards]
serial-forward-1.1+<wbr>gitrAUTOINC+00dbec2636: Package version for package=
 serial-forward-staticdev went backwards which would break package feeds fr=
om (1:1.1+gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-go=
ing-backwards]
serial-forward-1.1+<wbr>gitrAUTOINC+00dbec2636: Package version for package=
 serial-forward went backwards which would break package feeds from (1:1.1+=
gitr0+2725c6c18c-r0.1 to 0:1.1+gitr0+00dbec2636-r0.0) [version-going-backwa=
rds]
xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi-dbg we=
nt backwards which would break package feeds from (0:1.0-r0.6 to 0:1.0-r0.0=
) [version-going-backwards]
xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi-dev we=
nt backwards which would break package feeds from (0:1.0-r0.6 to 0:1.0-r0.0=
) [version-going-backwards]
xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi went b=
ackwards which would break package feeds from (0:1.0-r0.6 to 0:1.0-r0.0) [v=
ersion-going-backwards]


count: 1	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-<wbr>ae/usr/li=
b/locale/ar_AE/LC_<wbr>COLLATE is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
8a60106 main: Attempt to gain bitbake.lock rather than just waiting
not included in master yet:=20
a064963 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
a8b89b3 default-providers: Add entries for pkgconfig (due to pkg-conf being=
 added)
not included in master yet:=20
338cc89 report-error: Allow to upload reports automatically
f492b98 buildhistory.bbclass: metadata-revs show repo parent
eb590e9 metadata-revs: provide more information
7860d90 qemux86: Add identical qemux86copy variant for tests
9fdb66a reproducible_build.bbclass: initial support for binary reproducibil=
ity
097476c cpio: provide cpio-replacement-native
c3b689d image_types.bbclass: improve cpio image reproducibility
cbd025c rootfs-postcommands.bbclass: support binary reproducibility
c0f57c9 insane.bbclass: write QA issues to log file only when they are in E=
RROR_QA or WARN_QA

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
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
53982a0 c-ares: update 1.12.0 -&gt; 1.13.0
b101101 radvd: 2.14 -&gt; 2.17
9a7309d libesmtp: Fix config.h define for snprintf detection
b9b2b01 drbd: Add recipe
b7b27a5 net-snmp: fix engineBoots value on SIGHUP
f8559af openl2tp: add LGPL-2.1 license
ce8ed9a openl2tp: add init script and systemd support
4f97a6c ntop: add new recipe
21479a9 libtdb: update 1.3.12 -&gt; 1.3.14
d946a42 ndisc6: Upgrade to 1.0.3
f3dd13e memcached: Update to 1.5.0
3436c8e tcpdump: remove unnecessary patch
209a90c squid: Add missing dependencies on openssl expat and libxml2
5061e4f postfix: Upgrade to 3.2.2
33dff9b mpv: Update to version 0.26.0.
cc37aef python3-blivet: add recipe 2.2.0
ad94afe python3-blivetgui: add recipe 2.1.5
47fb79b librcf: Add -latomic to LDFLAGS
6599b98 upower: update 0.99.4 -&gt; 0.99.5
b720216 geany: update 1.30.1 -&gt; 1.31
29805cb geany-plugins: update 1.30 -&gt; 1.31
c94d8e7 python-wrapt: update to version 1.10.11
69a7670 python-cmd2: update to version 0.7.6
353a2ab python-sqlalchemy: update to version 1.1.13
363c33c python-pytest: update to version 3.2.1
38c6ecb python-pyro4: update to version 4.61
07c7d83 php: move to version 7.1.8 from 7.1.7
03eaf98 gsoap: Upgrade to 2.8.51
16a43c3 caps: Mark ARCH empty
5d25280 mailcap: upgrade to 2.1.48
17dbbb3 mailx: Force mailx to build with openssl10
ac85ad1 php: disable this version by default
7b9dfb7 freeradius: Upgrade to 3.0.15
4978e89 tcpdump: update to 4.9.1 to fix CVE-2017-11108
a99294b vlock: add new recipe
1e2f4b9 fontforge: update to 20170731 to fix CVEs
5567b2a wireshark: 2.2.7 -&gt; 2.2.8
632f250 start-stop-daemon: Only create a link in ${base_sbindir} if necessa=
ry
d8811b9 python-chardet: Extend to native and nativesdk
ebd41b0 openobex: disable building documentation
ac15d80 openwsman: rename to 2.6.3
da135d6 iproute2: add bbappend for supporting tipc tool
cebccb3 tipcutils: add runtime dependency for iproute2-tipc
f920d63 mariadb: 5.5.55 -&gt; 5.5.57
64ee547 rsyslog: fix CVE-2017-12588
cc02e10 rsyslog: install logrotate configuration file into correct location
56d6e0a libvpx: upgrade to 1.6.1
a4ee06b quagga: update to 1.2.1
961abc1 gd: update to 2.2.4
cb686c3 efivar: Upgrade to 0.31
3706ca2 openvpn: 2.4.2 -&gt; 2.4.3
de9860c python*-ptyprocess: add v0.5.2
fab2dd5 python*-pexpect: add v4.2.1
543455e ipsec-tools: fix CVE-2016-10396
6c775f9 multipath-tools: add bash to RDEPENDS
5141a9b python3-pykickstart: tweak shebang to python3
52f0eb1 xmlrpc-c: add perl to RDEPENDS
92d6a0f phpmyadmin: upgrade to 4.7.3
3716024 pcsc-lite: Update to 1.8.22
d3af646 python-requests: Update to version 2.18.4
e3057cc sthttpd: update to 2.27.1
c9f10ab glibmm: fix perl path
3a8e526 postgresql: update to 9.4.13
4c2ea5a Dhrystone: add recipe 2.1
c2a4bdf makedumpfile: update to 1.6.2
6ce999e mozjs: customize HOST_CFLAGS
f3e09bd adduser: use get_perl_version instead of PERLVERSION
a17cffb iperf3: 3.1.3 -&gt; 3.2
40916b0 webmin: add systemd service file
598c29c python-markupsafe: Extend to build native version too
a7f2d3a vim: update to 8.0.0983
9756937 python-m2crypto: Upgrade to 0.26.0
87f7ea5 gnulib: upgrade to 2017-08-20.18
0c7c8fb collectd: 5.7.1 -&gt; 5.7.2
54b071b netcf: upgrade to latest 0.2.8
0c0ef1d tftp-hpa: add systemd unit files
d1f41a0 gperftools: fixup HOMEPAGE
8f5ed1d openconnect: fix parallel compilation failure
5d15b1c gnome-keyring: Fix compatibility with gcr 3 in oe-core
863d51e openconnect: upgrade to 7.08
4dd9884 gflags: add runtime dependency on bash
f3fc0cc logcheck: update to 1.3.18 and move to meta-perl
3815615 python-pycrypto: Security fix CVE-2013-7459
3d85015 logwarn: set correct paths and add missing dependency
c2dbb9b openldap: fix native LDFLAGS build error
166bf62 xorg-fonts-100dpi: unblacklist recipe
a60ac1c recipes: remove blacklisted recipes
69529c6 meta-ruby: remove this now pretty empty layer
61e8314 meta-efl: remove this now pretty empty layer
07ed328 meta-systemd: remove this now pretty empty layer
7b0f2ca meta-gpe: remove this now pretty empty layer

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
8960831 qwt-qt5.inc: fix QA warning
not included in master yet:=20
6e9892a qtbase: add ptest
d53382f qt5-ptest: fix build with yocto &lt; 2.3 (pyro)
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
d9f4b6e meta-toolchain-qt5: don&#39;t rely on COREBASE/LICENSE
209e7e6 qtwebengine: disable SECURITY_STRINGFORMAT to fix the build
648f7b0 qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation, qtwa=
yland: disable gold to work around binutils bug

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:=20
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe
</pre><div><br></div></pre></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--001a1143f2728dbac60557ae4ff1--
