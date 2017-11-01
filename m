Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8B76A71C9F;
	Wed,  1 Nov 2017 09:59:03 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id g90so1460215wrd.6;
	Wed, 01 Nov 2017 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bzniGJ4WsiEwedUMmBeMQagfVm7mYI14oxtsDG9uX1U=;
	b=j42UpIy05TRSYoYKhXdQ2arloWCdsr11TQSqwrEx8v7WwPnJmKUC0f2isU7KaSf2Qu
	RoTkm+s4exb7FwtFRkxkXRKI4gOFIIp9ySmpSQ7ZIbeCO3rPH8eSgxTVjA/ipDhNmE9u
	2WHhWxfKMMztvZivaRPKP4UkL181rOu8uJzq/ZomLrEjPM+0/qhXSAlFY5maYPhQ3pRS
	Gu2z5ALfejvIiujCy60m5n93/y+8ovd7FTu5X5VVnflSOJvXcp/CBX+dt65PZv71AAPZ
	rfMO60NjHFlvOTLy2VN/POmav2WI8Z77i7SawT+1I7sojuUgAnPCNC9Z6P9UrjmBz8dY
	Tpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bzniGJ4WsiEwedUMmBeMQagfVm7mYI14oxtsDG9uX1U=;
	b=qi31VDcO+N3feHesDYgL+zRWTpOicQly08QStlJuArl84m3ydL+l8ILaIoBJwdT81f
	MsjWzwyyYjfvfLkMYVKGEz9K24+BjCsmtVIRfRYV6RZkttN066BNQSA/T/gSme2+1Rm3
	Q9i6RJ2LU/H/cjQ0VUx66Y6OFZPtyixt0EjtAWKAvnWM1IR+OJeh14/WndkTAy2WOja7
	LgSyI8FcDf8TpWq22hqr6bLEFpbxiXva6B6KaiZbMqAJHVydVaIrYRSjv/JN06HQpsc1
	DkMeQ9q+WTLLebSAZN9h7xxp9dTxEM1Rw8PxZTyCCRPkhUPudyzA10oCW6UV0uIJAc1f
	AIdQ==
X-Gm-Message-State: AMCzsaXs8TVnFxw/8jGVCfEJFivvIFRgVS/5h3LkfAhKoVH72IDl6HEA
	HaZ7+XAEvDG+xSnPp9WzVlXWeEknuYqaRmnOL6Q=
X-Google-Smtp-Source: ABhQp+QhwK6ULKbbR8SLNkBcORvmcXJfmw61w1b7T3v/IyoF/dgPsaU0x0B35bO2E7xsjT6OzPfgrEYrVZAPzuXbAxM=
X-Received: by 10.223.143.51 with SMTP id p48mr4122629wrb.104.1509530343900;
	Wed, 01 Nov 2017 02:59:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Wed, 1 Nov 2017 02:59:03 -0700 (PDT)
In-Reply-To: <7e59a3d8-bc02-b265-a7db-fef8a8d6dfe5@gmail.com>
References: <CA+chaQfyBb2rioOqS1C5+e_sq3XdaxP0ge-Jt6Km5BsjHfHyTA@mail.gmail.com>
	<7e59a3d8-bc02-b265-a7db-fef8a8d6dfe5@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 1 Nov 2017 10:59:03 +0100
Message-ID: <CA+chaQez_M=emSm836CswCvKP2KyzXh6JKXp_CeqSc68j8iAqA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-10-31
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
X-List-Received-Date: Wed, 01 Nov 2017 09:59:04 -0000
Content-Type: multipart/alternative; boundary="f403045d5cfaed0be1055ce8eb0a"

--f403045d5cfaed0be1055ce8eb0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

I'll leave this question to Khem, this was my just 2nd build with musl,
Khem is doing musl builds for very long time and fixing all the issue he
finds, maybe some of the issues detected in world builds already have fixes
in Khem's queue.

Regards,

On Wed, Nov 1, 2017 at 5:53 AM, akuster808 <akuster808@gmail.com> wrote:

> Martin,
>
> On 10/31/2017 01:58 PM, Martin Jansa wrote:
>
> With 2 pending patches from Khem to build systemd with musl:
>
> 62c7c98 systemd: Fix build on musl
> de68252 systemd: Fix build with musl/mips64
>
> the qemux86+musl build was able to progress much further and fewer ERROR =
messages were shown. Basically only uim recipe now depends on glibc and fai=
ls to be included in build queue:
>
>
> Are we going to blacklist the recipes failing via musl? is there
> blacklisting by TCLIB?
>
> - armin
>
> Summary: There were 55 ERROR messages shown, returning a non-zero exit co=
de.
>
> Parsing of 2356 .bb files complete (2355 cached, 1 parsed). 3228 targets,=
 48 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'glibc-gconv-euc-jp' (but /home/jenkins/oe/world=
/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPEN=
DS on or otherwise requires it)
> NOTE: Runtime target 'glibc-gconv-euc-jp' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['glibc-gconv-euc-jp']
> NOTE: Runtime target 'uim-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['uim-dev', 'glibc-gconv-euc=
-jp']
> NOTE: Runtime target 'uim' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['uim', 'glibc-gconv-euc-jp'=
]
> NOTE: Runtime target 'libuim0' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['libuim0', 'glibc-gconv-euc=
-jp']
> ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPENDS on o=
r otherwise requires it)
> NOTE: Runtime target 'glibc-utils' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['glibc-utils']
>
> Some logs weren't uploaded to the http://logs.nslu2-linux.org/buildlogs <=
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171031_09=
5148.log> because it run out of disk space again.
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date		     !!colspan=3D'4'|Failed tasks			    !!|Signatures		  !!colspa=
n=3D'15'|QA !!Comment
> |-
> ||		||qemuarm	||qemuarm64	||qemux86	||qemux86_64	||all 	||already-strippe=
d	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||=
host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||=
symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-p=
ath	||qa_pseudo	||=09
> |-
>
> ||2017-10-30	||2	||6	||26	||1	||0	||0		||0		||1		||0		||0		||28		||2		||0=
		||0		||0		||0		||0		||0		||0		||158		||=09
> |}
>
> =3D=3D Failed tasks 2017-10-30 =3D=3D
>
> INFO: jenkins-job.sh-1.8.39 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/rocko/log.report.20171031_095148.log
>
> =3D=3D=3D common (0) =3D=3D=3D
>
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>
> =3D=3D=3D qemuarm (2) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to=
ols_5.1.1.r37.bb:do_compile
>     * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_p=
ackage_qa
>
> =3D=3D=3D qemuarm64 (5) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:do_co=
mpile
>     * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.14=
3.bb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-kli=
bc_1.5.2.bb:do_install
>     * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-k=
libc_2.0.2.bb:do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:d=
o_compile
>
> =3D=3D=3D qemux86 (26) =3D=3D=3D
>     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compil=
e
>     * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_=
6.1.5.bb:do_package
>     * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5=
.17.07.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0=
.3.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-=
rsh_0.17.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netk=
it-rusers_0.17.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netk=
it-telnet_0.17.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.5=
0.9.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1=
.8beta5.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-support/open-isns/open-is=
ns_0.97.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlb=
fs_git.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_=
compile
>     * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.b=
b:do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_comp=
ile
>     * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredum=
per_2.0.0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.b=
b:do_compile
>     * meta-openembedded/meta-python/recipes-devtools/python/python3-syste=
md_234.bb:do_compile
>     * meta-openembedded/meta-python/recipes-devtools/python/python-system=
d_234.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
>     * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-b=
ootchart_231.bb:do_compile
>     * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_=
compile
>     * openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer=
_git.bb:do_compile
>     * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.12.2.bb:do_compile
>     * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_packa=
ge_qa
>
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * meta-openembedded/meta-networking/recipes-extended/corosync/corosyn=
c_2.4.2.bb:do_package_qa
>
> =3D=3D=3D Number of failed tasks (35) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko=
/log.world.qemuarm.20171030_061538.log/ ||
> |-
> || qemuarm64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.world.qemuarm64.20171030_165541.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/47895/
> |-
> || qemux86 	|| 26	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86.20171030_061543.log/ || http://errors.yoctoproject.org/=
Errors/Build/47880/
> |-
> || qemux86_64 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/ro=
cko/log.world.qemux86-64.20171030_191803.log/ || http://errors.yoctoproject=
.org/Errors/Build/47897/
> |}
>
> =3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D
>
> =3D=3D=3D QA issues (189) =3D=3D=3D
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
> ||0	||file-rdeps
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
> ||158	||qa_pseudo
> |-
> ||1	||textrel
> |-
> ||28	||version-going-backwards
> |-
> ||2	||host-user-contaminated
> |}
>
>
>
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.si=
gnatures.20171031_072554.log/
>
>
>     * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPEND=
S on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy in /=
home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>     * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPEND=
S on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable =
providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in /home=
/jenkins/oe/world/shr-core/tmp-glibc/stamps
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLA=
CKLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-g=
old', " <$%7B@bb.utils.contains('DISTRO_FEATURES','ld-is-gold',>BROKEN: fai=
ls to link against sctp_connectx symbol", '', d)}"
> meta-qt5:
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
> count: 1	issue: textrel
> corosync-2.4.2: ELF binary '/work/core2-64-oe-linux/corosync/2.4.2-r0/pac=
kages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
>
>
> count: 0	issue: build-deps
>
>
> count: 0	issue: file-rdeps
>
>
> count: 28	issue: version-going-backwards
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug-dbg went backwards which would break package feeds from=
 (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug-dev went backwards which would break package feeds from=
 (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug-ptest went backwards which would break package feeds fr=
om (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
> packagegroup-core-tools-debug-1.0: Package version for package packagegro=
up-core-tools-debug went backwards which would break package feeds from (0:=
1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-dbg went backwards which would break package feeds from (0:1.0-r1=
3.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug-dbg went backwards which would break package feeds from (0:=
1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug-dev went backwards which would break package feeds from (0:=
1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug-ptest went backwards which would break package feeds from (=
0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-debug went backwards which would break package feeds from (0:1.0-=
r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-dev went backwards which would break package feeds from (0:1.0-r1=
3.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended-dbg went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended-dev went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended-ptest went backwards which would break package feeds fro=
m (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-extended went backwards which would break package feeds from (0:1=
.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics-dbg went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics-dev went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics-ptest went backwards which would break package feeds fro=
m (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-graphics went backwards which would break package feeds from (0:1=
.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools-dbg went backwards which would break package feeds fro=
m (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools-dev went backwards which would break package feeds fro=
m (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools-ptest went backwards which would break package feeds f=
rom (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-host-tools went backwards which would break package feeds from (0=
:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-ptest went backwards which would break package feeds from (0:1.0-=
r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk-dbg went backwards which would break package feeds from (0:1.=
0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk-dev went backwards which would break package feeds from (0:1.=
0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk-ptest went backwards which would break package feeds from (0:=
1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted-sdk went backwards which would break package feeds from (0:1.0-r1=
3.14 to 0:1.0-r13.13) [version-going-backwards]
> packagegroup-self-hosted-1.0: Package version for package packagegroup-se=
lf-hosted went backwards which would break package feeds from (0:1.0-r13.14=
 to 0:1.0-r13.13) [version-going-backwards]
>
>
>
> count: 2	issue: host-user-contaminated
> glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ms-my/usr/lib/l=
ocale/ms_MY/LC_COLLATE is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
> glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-quz-pe/usr/lib/=
locale/quz_PE/LC_NAME is owned by uid 3004, which is the same as the user r=
unning bitbake. This may be due to host contamination [host-user-contaminat=
ed]
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
> count: 158	issue: qa_pseudo
> bluez5-5.46: This /work/aarch64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
> bluez5-5.46: This /work/armv5te-oe-linux-gnueabi/bluez5/5.46-r0/pseudo/ps=
eudo.log indicates 17 errors [qa_pseudo]
> bluez5-5.46: This /work/core2-64-oe-linux/bluez5/5.46-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
> cairo-1.14.10: This /work/core2-64-oe-linux/cairo/1.14.10-r0/pseudo/pseud=
o.log indicates 24 errors [qa_pseudo]
> collectd-5.7.2: This /work/aarch64-oe-linux/collectd/5.7.2-r0/pseudo/pseu=
do.log indicates 17 errors [qa_pseudo]
> collectd-5.7.2: This /work/armv5te-oe-linux-gnueabi/collectd/5.7.2-r0/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]
> dhcpcd-6.11.3: This /work/aarch64-oe-linux/dhcpcd/6.11.3-r0/pseudo/pseudo=
.log indicates 10 errors [qa_pseudo]
> gobject-introspection-1.52.1: This /work/aarch64-oe-linux/gobject-introsp=
ection/1.52.1-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
> gobject-introspection-1.52.1: This /work/armv5te-oe-linux-gnueabi/gobject=
-introspection/1.52.1-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
> gobject-introspection-1.52.1: This /work/core2-64-oe-linux/gobject-intros=
pection/1.52.1-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
> lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/aarch64-oe-linux/lcdproc/=
0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors [qa_ps=
eudo]
> lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/=
lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 error=
s [qa_pseudo]
> libatasmart-0.19: This /work/aarch64-oe-linux/libatasmart/0.19-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
> libatasmart-0.19: This /work/core2-64-oe-linux/libatasmart/0.19-r0/pseudo=
/pseudo.log indicates 12 errors [qa_pseudo]
> libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linux/l=
ibconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 11=
 errors [qa_pseudo]
> libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux-g=
nueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indi=
cates 11 errors [qa_pseudo]
> libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/=
libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 1=
1 errors [qa_pseudo]
> libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/aarch64-oe-linux/libqof=
ono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
> libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueab=
i/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 e=
rrors [qa_pseudo]
> libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/libqo=
fono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 errors [=
qa_pseudo]
> librepo-1.7.20+gitAUTOINC+e1137cbbda: This /work/aarch64-oe-linux/librepo=
/1.7.20+gitAUTOINC+e1137cbbda-r0/pseudo/pseudo.log indicates 10 errors [qa_=
pseudo]
> libvncserver-0.9.11: This /work/aarch64-oe-linux/libvncserver/0.9.11-r0/p=
seudo/pseudo.log indicates 11 errors [qa_pseudo]
> libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9=
.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
> libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/=
pseudo/pseudo.log indicates 13 errors [qa_pseudo]
> libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pse=
udo.log indicates 13 errors [qa_pseudo]
> libxml-sax-writer-perl-0.57: This /work/core2-64-oe-linux/libxml-sax-writ=
er-perl/0.57-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
> lirc-0.9.4d: This /work/aarch64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
> lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]
> lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]
> lvm2-2.02.171: This /work/core2-64-oe-linux/lvm2/2.02.171-r0/pseudo/pseud=
o.log indicates 10 errors [qa_pseudo]
> maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/aarch64-oe-=
linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.lo=
g indicates 11 errors [qa_pseudo]
> maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-=
linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
> maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe=
-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.l=
og indicates 12 errors [qa_pseudo]
> maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/aarch64-oe-li=
nux/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log in=
dicates 18 errors [qa_pseudo]
> maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/core2-64-oe-l=
inux/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log i=
ndicates 27 errors [qa_pseudo]
> mc-4.8.19: This /work/core2-64-oe-linux/mc/4.8.19-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
> net-snmp-5.7.3: This /work/aarch64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
> net-snmp-5.7.3: This /work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]
> net-snmp-5.7.3: This /work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
> ofono-1.20: This /work/aarch64-oe-linux/ofono/1.20-r0/pseudo/pseudo.log i=
ndicates 16 errors [qa_pseudo]
> ofono-1.20: This /work/armv5te-oe-linux-gnueabi/ofono/1.20-r0/pseudo/pseu=
do.log indicates 16 errors [qa_pseudo]
> opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd=
6a4: This /work/aarch64-oe-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22e=
d_a62e20676a_34e4206aef_fccf7cd6a4-r0/pseudo/pseudo.log indicates 16 errors=
 [qa_pseudo]
> opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd=
6a4: This /work/core2-64-oe-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22=
ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/pseudo/pseudo.log indicates 12 error=
s [qa_pseudo]
> openhpi-3.6.1: This /work/armv5te-oe-linux-gnueabi/openhpi/3.6.1-r0/pseud=
o/pseudo.log indicates 14 errors [qa_pseudo]
> openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseud=
o.log indicates 14 errors [qa_pseudo]
> openipmi-2.0.24: This /work/core2-64-oe-linux/openipmi/2.0.24-r0/pseudo/p=
seudo.log indicates 10 errors [qa_pseudo]
> opensaf-5.17.07: This /work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/ps=
eudo.log indicates 16 errors [qa_pseudo]
> opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/p=
seudo/pseudo.log indicates 20 errors [qa_pseudo]
> opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/p=
seudo.log indicates 20 errors [qa_pseudo]
> pcmanfm-1.2.5: This /work/aarch64-oe-linux/pcmanfm/1.2.5-r0/pseudo/pseudo=
.log indicates 4 errors [qa_pseudo]
> puzzles-0.0+gitAUTOINC+8dfe5cec31: This /work/core2-64-oe-linux/puzzles/1=
_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.log indicates 18 errors [qa_pse=
udo]
> python3-dbus-1.2.4: This /work/aarch64-oe-linux/python3-dbus/1.2.4-r0/pse=
udo/pseudo.log indicates 10 errors [qa_pseudo]
> python3-simplejson-3.11.1: This /work/armv5te-oe-linux-gnueabi/python3-si=
mplejson/3.11.1-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
> qemu-2.10.0: This /work/core2-64-oe-linux/qemu/2.10.0-r0/pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]
> qt3d-5.9.2+gitAUTOINC+143b721249: This /work/aarch64-oe-linux/qt3d/5.9.2+=
gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
> qt3d-5.9.2+gitAUTOINC+143b721249: This /work/armv5te-oe-linux-gnueabi/qt3=
d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 14 errors [qa_=
pseudo]
> qt5-creator-3.5.1: This /work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.1-=
r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
> qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/aarch64-oe-linux/qtbase/5.=
9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 211 errors [qa_pse=
udo]
> qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/armv5te-oe-linux-gnueabi/q=
tbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 14 errors =
[qa_pseudo]
> qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/core2-64-oe-linux/qtbase/5=
.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 16 errors [qa_pse=
udo]
> qtcanvas3d-5.9.2+gitAUTOINC+a1aee8ecbe: This /work/aarch64-oe-linux/qtcan=
vas3d/5.9.2+gitAUTOINC+a1aee8ecbe-r0/pseudo/pseudo.log indicates 11 errors =
[qa_pseudo]
> qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/aarch64-oe-linux/qtchart=
s/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 10 errors [qa_=
pseudo]
> qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/armv5te-oe-linux-gnueabi=
/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 12 err=
ors [qa_pseudo]
> qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/core2-64-oe-linux/qtchar=
ts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 13 errors [qa=
_pseudo]
> qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/aarch64-oe-linux/q=
tconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates 14=
 errors [qa_pseudo]
> qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/armv5te-oe-linux-g=
nueabi/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indi=
cates 14 errors [qa_pseudo]
> qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/core2-64-oe-linux/=
qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates 1=
3 errors [qa_pseudo]
> qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/aarch64-oe-linux/qtda=
tavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
> qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/armv5te-oe-linux-gnue=
abi/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates =
24 errors [qa_pseudo]
> qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/core2-64-oe-linux/qtd=
atavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 21 erro=
rs [qa_pseudo]
> qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/aarch64-oe-linux/qt=
declarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 17 e=
rrors [qa_pseudo]
> qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/armv5te-oe-linux-gn=
ueabi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indica=
tes 42 errors [qa_pseudo]
> qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/core2-64-oe-linux/q=
tdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 21 =
errors [qa_pseudo]
> qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/aarch64-oe-linux/qtengi=
nio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
> qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnueab=
i/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 14 e=
rrors [qa_pseudo]
> qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/core2-64-oe-linux/qteng=
inio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 13 errors [=
qa_pseudo]
> qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/aarch64-oe-linux/qtgame=
pad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
> qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/armv5te-oe-linux-gnueab=
i/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 12 e=
rrors [qa_pseudo]
> qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/core2-64-oe-linux/qtgam=
epad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 15 errors [=
qa_pseudo]
> qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/aarch64-oe-=
linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]
> qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/armv5te-oe-=
linux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
> qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/core2-64-oe=
-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.l=
og indicates 13 errors [qa_pseudo]
> qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/aarch64-oe-linux/qtm=
ultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
> qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/armv5te-oe-linux-gnu=
eabi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicate=
s 13 errors [qa_pseudo]
> qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/core2-64-oe-linux/qt=
multimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 13 er=
rors [qa_pseudo]
> qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/aarch64-oe-linux/qt=
networkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 5 er=
rors [qa_pseudo]
> qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/armv5te-oe-linux-gn=
ueabi/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indica=
tes 13 errors [qa_pseudo]
> qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/core2-64-oe-linux/q=
tnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 13 =
errors [qa_pseudo]
> qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/aarch64-oe-linux/qtquick=
1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 18 errors [qa_=
pseudo]
> qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/armv5te-oe-linux-gnueabi=
/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 26 err=
ors [qa_pseudo]
> qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/core2-64-oe-linux/qtquic=
k1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 19 errors [qa=
_pseudo]
> qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/aarch64-oe-linux=
/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicate=
s 11 errors [qa_pseudo]
> qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/armv5te-oe-linux=
-gnueabi/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log =
indicates 13 errors [qa_pseudo]
> qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/core2-64-oe-linu=
x/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicat=
es 14 errors [qa_pseudo]
> qtquickcontrols-5.9.2+gitAUTOINC+8476f8fff7: This /work/core2-64-oe-linux=
/qtquickcontrols/5.9.2+gitAUTOINC+8476f8fff7-r0/pseudo/pseudo.log indicates=
 16 errors [qa_pseudo]
> qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/aarch64-oe-linux/=
qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates =
11 errors [qa_pseudo]
> qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/armv5te-oe-linux-=
gnueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
> qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/core2-64-oe-linux=
/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates=
 13 errors [qa_pseudo]
> qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/aarch64-oe-linux/qtscrip=
t/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 11 errors [qa_=
pseudo]
> qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/armv5e-oe-linux-gnueabi/=
qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 13 erro=
rs [qa_pseudo]
> qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/core2-64-oe-linux/qtscri=
pt/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 19 errors [qa=
_pseudo]
> qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/armv5te-oe-linux-gnueabi/=
qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
> qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/core2-64-oe-linux/qtscxml=
/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 errors [qa_p=
seudo]
> qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/aarch64-oe-linux/qtsens=
ors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 13 errors [q=
a_pseudo]
> qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/armv5te-oe-linux-gnueab=
i/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 15 e=
rrors [qa_pseudo]
> qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/core2-64-oe-linux/qtsen=
sors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 15 errors [=
qa_pseudo]
> qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/armv5te-oe-linux-gnue=
abi/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates =
12 errors [qa_pseudo]
> qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/core2-64-oe-linux/qts=
erialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 13 erro=
rs [qa_pseudo]
>
> qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/aarch64-oe-linux/qts=
erialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 5 erro=
rs [qa_pseudo]
> qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/armv5te-oe-linux-gnu=
eabi/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicate=
s 7 errors [qa_pseudo]
> qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/core2-64-oe-linux/qt=
serialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 7 err=
ors [qa_pseudo]
> qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/aarch64-oe-linux/qtsvg/5.9.=
2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo=
]
> qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/armv5te-oe-linux-gnueabi/qt=
svg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 17 errors [q=
a_pseudo]
> qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/core2-64-oe-linux/qtsvg/5.9=
.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 13 errors [qa_pseud=
o]
> qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/aarch64-oe-linux/qtsyst=
ems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 11 errors [q=
a_pseudo]
> qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/armv5te-oe-linux-gnueab=
i/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 12 e=
rrors [qa_pseudo]
> qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/core2-64-oe-linux/qtsys=
tems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 14 errors [=
qa_pseudo]
> qttools-5.9.2+gitAUTOINC+90a701032e: This /work/aarch64-oe-linux/qttools/=
5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 12 errors [qa_ps=
eudo]
> qttools-5.9.2+gitAUTOINC+90a701032e: This /work/armv5te-oe-linux-gnueabi/=
qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 15 error=
s [qa_pseudo]
> qttools-5.9.2+gitAUTOINC+90a701032e: This /work/core2-64-oe-linux/qttools=
/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 12 errors [qa_p=
seudo]
> qttranslations-5.9.2+gitAUTOINC+325a90e07e: This /work/core2-64-oe-linux/=
qttranslations/5.9.2+gitAUTOINC+325a90e07e-r0/pseudo/pseudo.log indicates 6=
 errors [qa_pseudo]
> qtvirtualkeyboard-5.9.2+gitAUTOINC+87218c4e68: This /work/aarch64-oe-linu=
x/qtvirtualkeyboard/5.9.2+gitAUTOINC+87218c4e68-r0/pseudo/pseudo.log indica=
tes 10 errors [qa_pseudo]
> qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/aarch64-oe-linux/qtwayl=
and/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 18 errors [q=
a_pseudo]
> qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/armv5te-oe-linux-gnueab=
i/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 13 e=
rrors [qa_pseudo]
> qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/aarch64-oe-linux/qtw=
ebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
> qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/armv5te-oe-linux-gnu=
eabi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicate=
s 12 errors [qa_pseudo]
> qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/aarch64-oe=
-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.=
log indicates 11 errors [qa_pseudo]
> qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/core2-64-o=
e-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo=
.log indicates 14 errors [qa_pseudo]
> qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/aarch64-oe-linux/qtwebki=
t/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 12 errors [qa_=
pseudo]
> qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueabi/=
qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 13 erro=
rs [qa_pseudo]
> qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwebk=
it/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 14 errors [qa=
_pseudo]
> qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This /work/core2-64-oe-lin=
ux/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indic=
ates 12 errors [qa_pseudo]
> qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/aarch64-oe-linux/qtw=
ebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 11 err=
ors [qa_pseudo]
> qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/armv5te-oe-linux-gnu=
eabi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicate=
s 14 errors [qa_pseudo]
> qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/core2-64-oe-linux/qt=
websockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 14 er=
rors [qa_pseudo]
> qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/aarch64-oe-linux/qtwebv=
iew/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 12 errors [q=
a_pseudo]
> qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/core2-64-oe-linux/qtweb=
view/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 7 errors [q=
a_pseudo]
> qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/aarch64-oe-linux/qtx1=
1extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 11 error=
s [qa_pseudo]
> qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/armv5te-oe-linux-gnue=
abi/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates =
8 errors [qa_pseudo]
> qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/core2-64-oe-linux/qtx=
11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 7 error=
s [qa_pseudo]
> qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/armv5te-oe-linux-gn=
ueabi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indica=
tes 13 errors [qa_pseudo]
> qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/core2-64-oe-linux/q=
txmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 14 =
errors [qa_pseudo]
> rpm-4.13.90+gitAUTOINC+a8e51b3bb0: This /work/armv5te-oe-linux-gnueabi/rp=
m/1_4.13.90+gitAUTOINC+a8e51b3bb0-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
> rsyslog-8.29.0: This /work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseu=
do.log indicates 10 errors [qa_pseudo]
> rsyslog-8.29.0: This /work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pse=
udo/pseudo.log indicates 17 errors [qa_pseudo]
> rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
> settings-daemon-0.0.2: This /work/aarch64-oe-linux/settings-daemon/0.0.2-=
r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
> strace-4.18: This /work/aarch64-oe-linux/strace/4.18-r0/pseudo/pseudo.log=
 indicates 10 errors [qa_pseudo]
> strace-4.18: This /work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
> tunctl-1.5: This /work/aarch64-oe-linux/tunctl/1.5-r0/pseudo/pseudo.log i=
ndicates 8 errors [qa_pseudo]
> upower-0.99.5: This /work/core2-64-oe-linux/upower/0.99.5-r0/pseudo/pseud=
o.log indicates 16 errors [qa_pseudo]
> vlc-2.2.2: This /work/core2-64-oe-linux/vlc/2.2.2-r0/pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
> weston-2.0.0: This /work/aarch64-oe-linux/weston/2.0.0-r0/pseudo/pseudo.l=
og indicates 16 errors [qa_pseudo]
> xfce4-appfinder-4.12.0: This /work/core2-64-oe-linux/xfce4-appfinder/4.12=
.0-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
> xfce4-places-plugin-1.7.0: This /work/core2-64-oe-linux/xfce4-places-plug=
in/1.7.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
> xfce4-sensors-plugin-1.2.97: This /work/armv5te-oe-linux-gnueabi/xfce4-se=
nsors-plugin/1.2.97-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> xfce4-weather-plugin-0.8.9: This /work/core2-64-oe-linux/xfce4-weather-pl=
ugin/0.8.9-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
> zbar-0.10: This /work/aarch64-oe-linux/zbar/0.10-r0/pseudo/pseudo.log ind=
icates 16 errors [qa_pseudo]
>
>
>
> This git log matches with the metadata as seen by qemuarm build.
> In some cases qemux86 and qemux86-64 builds are built with slightly
> different metadata, you can see the exact version near the top of each
> log.world.qemu* files linked from the report
>
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> latest upstream commit:
> be393f2 toaster/highlight.pack.js: Fix corrupted file
> not included in master yet:
> 3fba1ad world-image: add extra target
> c7c01bf fetch2: Allow Fetch.download() to warn instead of error
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
>
> latest upstream commit:
> 3b413a8 README.qemu: qemuppc64 is not supported
> not included in master yet:
> 3ff8d67 report-error: Allow to upload reports automatically
> c7e8c96 buildhistory.bbclass: metadata-revs show repo parent
> e2c9020 metadata-revs: provide more information
> cd6556e qemux86: Add identical qemux86copy variant for tests
> 347a734 reproducible_build.bbclass: initial support for binary reproducib=
ility
> 625d2bc cpio: provide cpio-replacement-native
> ce7ca36 image_types.bbclass: improve cpio image reproducibility
> fea2911 rootfs-postcommands.bbclass: support binary reproducibility
> 981e97a sstate.bbclass: Do not cause build failures due to setscene error=
s
> b53517c insane.bbclass: Add do_qa_pseudo function to check for common err=
ors listed in pseudo.log
> f829dbd libsdl2: allow to build native and nativesdk
> 5c05822 libdrm: allow to build native and nativesdk
> 95faa5e nativesdk-mesa,mesa-native: add new recipe to build small part of=
 mesa
> bd4c162 libepoxy: add support for native(sdk)
> 3092b61 libjpeg-turbo: provide nativesdk version
> 5471ea7 virglrenderer: add new recipe
> 8c4c3fc virglrenderer: fix target build
> 81e5bc3 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
> c37486d insane.bbclass: use package_qa_handle_error for do_qa_pseudo
> 62c7c98 systemd: Fix build on musl
> de68252 systemd: Fix build with musl/mips64
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
>
> latest upstream commit:
> 5d6d21e libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
> not included in master yet:
> ebcef48 bridge-utils: modify the AR to cross toolchain
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:
> d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order ca=
ll
> not included in master yet:
> 197811b qtwebengine: make test suite succeed
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
> latest upstream commit:
> 26d5066 firefox: fix build failures
> not included in master yet:
> 6773bf9 meta: drop ${COREBASE}/LICENSE references
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D REPORT STOP =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> sending incremental file list
>
>
>
>
>

--f403045d5cfaed0be1055ce8eb0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Armin,</div><div><br></div>I&#39;ll leave this que=
stion to Khem, this was my just 2nd build with musl, Khem is doing musl bui=
lds for very long time and fixing all the issue he finds, maybe some of the=
 issues detected in world builds already have fixes in Khem&#39;s queue.<di=
v><br></div><div>Regards,</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Wed, Nov 1, 2017 at 5:53 AM, akuster808 <span dir=3D=
"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster=
808@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Martin,<br>
    </p><span class=3D"">
    <br>
    <div class=3D"m_5769434083185138288moz-cite-prefix">On 10/31/2017 01:58=
 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:=
break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:1=
4px">With 2 pending patches from Khem to build systemd with musl:</pre>
        <pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:=
break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:1=
4px">62c7c98 systemd: Fix build on musl
de68252 systemd: Fix build with musl/mips64</pre>
        <pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:=
break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:1=
4px">the qemux86+musl build was able to progress much further and fewer ERR=
OR messages were shown. Basically only uim recipe now depends on glibc and =
fails to be included in build queue:</pre>
      </div>
    </blockquote>
    <br></span>
    Are we going to blacklist the recipes failing via musl? is there
    blacklisting by TCLIB?<br>
    <br>
    - armin<div><div class=3D"h5"><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:=
break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:1=
4px"><pre class=3D"m_5769434083185138288gmail-console-output" style=3D"box-=
sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;=
margin-bottom:0px"></pre><pre class=3D"m_5769434083185138288gmail-console-o=
utput" style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-=
word;margin-top:0px;margin-bottom:0px">Summary: There were 55 ERROR message=
s shown, returning a non-zero exit code.</pre><pre class=3D"m_5769434083185=
138288gmail-console-output" style=3D"box-sizing:border-box;white-space:pre-=
wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px"></pre><pre clas=
s=3D"m_5769434083185138288gmail-console-output" style=3D"box-sizing:border-=
box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:=
0px"><pre class=3D"m_5769434083185138288gmail-console-output" style=3D"box-=
sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;=
margin-bottom:0px">Parsing of 2356 .bb files complete (2355 cached, 1 parse=
d). 3228 targets, 48 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES &#39;glibc-gconv-euc-jp&#39; (but /home/jenkins/oe=
/world/shr-<wbr>core/meta-openembedded/meta-<wbr>oe/recipes-support/uim/<a =
href=3D"http://uim_1.8.6.bb" target=3D"_blank">uim_1.<wbr>8.6.bb</a> RDEPEN=
DS on or otherwise requires it)
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
shr-<wbr>core/meta-openembedded/meta-<wbr>oe/recipes-support/uim/<a href=3D=
"http://uim_1.8.6.bb" target=3D"_blank">uim_1.<wbr>8.6.bb</a> RDEPENDS on o=
r otherwise requires it)
NOTE: Runtime target &#39;glibc-utils&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;glibc-utils&#39;]</pre><=
/pre><pre class=3D"m_5769434083185138288gmail-console-output" style=3D"box-=
sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;=
margin-bottom:0px"></pre></pre>
        <pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:=
break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:1=
4px">Some logs weren&#39;t uploaded to the <a href=3D"http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20171031_095148.log" style=3D"fo=
nt-family:arial,sans-serif;color:rgb(92,53,102);box-sizing:border-box;word-=
wrap:break-word" target=3D"_blank">http://logs.nslu2-linux.org/<wbr>buildlo=
gs</a> because it run out of disk space again.</pre>
        <pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:=
break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:1=
4px"></pre>
        <pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:=
break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:1=
4px"><pre id=3D"m_5769434083185138288gmail-out" class=3D"m_5769434083185138=
288gmail-console-output" style=3D"box-sizing:border-box;white-space:pre-wra=
p;word-wrap:break-word;margin-top:0px;margin-bottom:0px"><pre style=3D"box-=
sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;=
margin-bottom:0px"><a href=3D"http://www.openembedded.org/wiki/Bitbake_Worl=
d_Status" style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,=
53,102)" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/Bitbake_Wo=
rld_Status</a>

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
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" t=
arget=3D"_blank">http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/=
log.<wbr>report.20171031_095148.log</a>

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/<wbr>recipes-devtools/android-<wbr>tools/an=
droid-tools_5.1.1.r37.<wbr>bb:do_compile
    * openembedded-core/meta/<wbr>recipes-core/glibc/glibc-<wbr>locale_2.26=
.bb:do_package_qa

=3D=3D=3D qemuarm64 (5) =3D=3D=3D
    * meta-browser/recipes-browser/<wbr>chromium/chromium_54.0.2810.2.<wbr>=
bb:do_compile
    * meta-browser/recipes-browser/<wbr>chromium/chromium-wayland_53.<wbr>0=
.2785.143.bb:do_compile
    * meta-openembedded/meta-<wbr>initramfs/recipes-devtools/<wbr>mtd/ubi-u=
tils-klibc_1.5.2.bb:d<wbr>o_install
    * meta-openembedded/meta-<wbr>initramfs/recipes-kernel/<wbr>kexec/kexec=
-tools-klibc_2.0.2.<wbr>bb:do_configure
    * meta-openembedded/meta-oe/<wbr>recipes-devtools/luajit/<wbr>luajit_2.=
0.5.bb:do_compile

=3D=3D=3D qemux86 (26) =3D=3D=3D
    * meta-browser/recipes-mozilla/<wbr>firefox/firefox_45.9.0esr.bb:d<wbr>=
o_compile
    * meta-openembedded/meta-<wbr>networking/recipes-<wbr>connectivity/rdis=
t/rdist_6.1.<wbr>5.bb:do_package
    * meta-openembedded/meta-<wbr>networking/recipes-daemons/<wbr>opensaf/o=
pensaf_5.17.07.bb:do_<wbr>compile
    * meta-openembedded/meta-<wbr>networking/recipes-daemons/<wbr>vsftpd/vs=
ftpd_3.0.3.bb:do_<wbr>compile
    * meta-openembedded/meta-<wbr>networking/recipes-netkit/<wbr>netkit-rsh=
/<a href=3D"http://netkit-rsh_0.17.bb">netkit-rsh_0.17.bb</a>:<wbr>do_compi=
le
    * meta-openembedded/meta-<wbr>networking/recipes-netkit/<wbr>netkit-rus=
ers/netkit-rusers_0.<wbr>17.bb:do_compile
    * meta-openembedded/meta-<wbr>networking/recipes-netkit/<wbr>netkit-tel=
net/netkit-telnet_0.<wbr>17.bb:do_configure
    * meta-openembedded/meta-<wbr>networking/recipes-protocols/<wbr>mdns/md=
ns_765.50.9.bb:do_<wbr>compile
    * meta-openembedded/meta-<wbr>networking/recipes-protocols/<wbr>tsocks/=
tsocks_1.8beta5.bb:do_<wbr>compile
    * meta-openembedded/meta-<wbr>networking/recipes-support/<wbr>open-isns=
/open-isns_0.97.bb:do<wbr>_compile
    * meta-openembedded/meta-oe/<wbr>recipes-benchmark/<wbr>libhugetlbfs/li=
bhugetlbfs_git.<wbr>bb:do_compile
    * meta-openembedded/meta-oe/<wbr>recipes-connectivity/umip/<wbr>umip_1.=
0.bb:do_compile
    * meta-openembedded/meta-oe/<wbr>recipes-connectivity/wvdial/<wbr>wvdia=
l_1.61.bb:do_compile
    * meta-openembedded/meta-oe/<wbr>recipes-devtools/pm-qa/pm-qa_<wbr>git.=
bb:do_compile
    * meta-openembedded/meta-oe/<wbr>recipes-extended/mraa/mraa_<wbr>git.bb=
:do_compile
    * meta-openembedded/meta-oe/<wbr>recipes-kernel/crash/crash_7.<wbr>1.9.=
bb:do_compile
    * meta-openembedded/meta-oe/<wbr>recipes-kernel/minicoredumper/<wbr>min=
icoredumper_2.0.0.bb:do_<wbr>compile
    * meta-openembedded/meta-oe/<wbr>recipes-multimedia/alsa/alsa-<wbr>oss_=
1.0.17.bb:do_compile
    * meta-openembedded/meta-python/<wbr>recipes-devtools/python/<wbr>pytho=
n3-systemd_234.bb:do_<wbr>compile
    * meta-openembedded/meta-python/<wbr>recipes-devtools/python/<wbr>pytho=
n-systemd_234.bb:do_<wbr>compile
    * meta-qt5/recipes-qt/qt5/<wbr>qtlocation_git.bb:do_compile
    * openembedded-core/meta/<wbr>recipes-devtools/systemd-<wbr>bootchart/s=
ystemd-bootchart_<wbr>231.bb:do_compile
    * openembedded-core/meta/<wbr>recipes-graphics/cogl/cogl-1.<wbr>0_1.22.=
2.bb:do_compile
    * openembedded-core/meta/<wbr>recipes-graphics/<wbr>virglrenderer/virgl=
renderer_<wbr>git.bb:do_compile
    * openembedded-core/meta/<wbr>recipes-multimedia/gstreamer/<wbr>gstream=
er1.0-plugins-bad_1.12.<wbr>2.bb:do_compile
    * openembedded-core/meta/<wbr>recipes-multimedia/x264/x264_<wbr>git.bb:=
do_package_qa

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-<wbr>networking/recipes-extended/<wbr>corosync=
/corosync_2.4.2.bb:do_<wbr>package_qa

=3D=3D=3D Number of failed tasks (35) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20171030_061538.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)" target=3D"_blank">http://l=
ogs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemuarm.20=
171030_061538.<wbr>log/</a> ||=20
|-
|| qemuarm64 	|| 6	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/=
world/rocko/log.world.qemuarm64.20171030_165541.log/" style=3D"box-sizing:b=
order-box;word-wrap:break-word;color:rgb(92,53,102)" target=3D"_blank">http=
://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemuar=
m64.20171030_<wbr>165541.log/</a> || <a href=3D"http://errors.yoctoproject.=
org/Errors/Build/47895/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)" target=3D"_blank">http://errors.yoctoproject.<wbr>o=
rg/Errors/Build/47895/</a>
|-
|| qemux86 	|| 26	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/w=
orld/rocko/log.world.qemux86.20171030_061543.log/" style=3D"box-sizing:bord=
er-box;word-wrap:break-word;color:rgb(92,53,102)" target=3D"_blank">http://=
logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemux86.2=
0171030_061543.<wbr>log/</a> || <a href=3D"http://errors.yoctoproject.org/E=
rrors/Build/47880/" style=3D"box-sizing:border-box;word-wrap:break-word;col=
or:rgb(92,53,102)" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Er=
rors/Build/47880/</a>
|-
|| qemux86_64 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20171030_191803.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)" target=3D"_blank">ht=
tp://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>world.qemu=
x86-64.20171030_<wbr>191803.log/</a> || <a href=3D"http://errors.yoctoproje=
ct.org/Errors/Build/47897/" style=3D"box-sizing:border-box;word-wrap:break-=
word;color:rgb(92,53,102)" target=3D"_blank">http://errors.yoctoproject.<wb=
r>org/Errors/Build/47897/</a>
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
-wrap:break-word;color:rgb(92,53,102)" target=3D"_blank">http://logs.nslu2-=
linux.org/<wbr>buildlogs/oe/world/rocko/log.<wbr>signatures.20171031_072554=
.<wbr>log/</a>


    * ERROR: Nothing RPROVIDES &#39;glibc-utils&#39; (but /home/jenkins/oe/=
world/shr-<wbr>core/meta-openembedded/meta-<wbr>oe/recipes-support/uim/<a h=
ref=3D"http://uim_1.8.6.bb" target=3D"_blank">uim_1.<wbr>8.6.bb</a> RDEPEND=
S on or otherwise requires it)
    * ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buil=
dable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /ho=
me/jenkins/oe/world/shr-<wbr>core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES &#39;glibc-utils&#39; (but /home/jenkins/oe/=
world/shr-<wbr>core/meta-openembedded/meta-<wbr>oe/recipes-support/uim/<a h=
ref=3D"http://uim_1.8.6.bb" target=3D"_blank">uim_1.<wbr>8.6.bb</a> RDEPEND=
S on or otherwise requires it)
    * ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buil=
dable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/j=
enkins/oe/world/shr-<wbr>core/tmp-glibc/stamps


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-<wbr>support/lksctp-tools/lksctp-<wbr>tools_1.0.17.=
bb:PNBLACKLIST[<wbr>lksctp-tools] ?=3D <a class=3D"m_5769434083185138288moz=
-txt-link-rfc2396E" href=3D"mailto:$%7B@bb.utils.contains(&#39;DISTRO_FEATU=
RES&#39;,&#39;ld-is-gold&#39;," target=3D"_blank">&quot;${@bb.utils.contain=
s(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;</a>BROKEN: f=
ails to link against sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;
meta-qt5:
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


count: 1	issue: textrel
corosync-2.4.2: ELF binary &#39;/work/core2-64-oe-linux/<wbr>corosync/2.4.2=
-r0/packages-<wbr>split/corosync/usr/sbin/<wbr>corosync&#39; has relocation=
s in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 28	issue: version-going-backwards
packagegroup-core-tools-debug-<wbr>1.0: Package version for package package=
group-core-tools-debug-<wbr>dbg went backwards which would break package fe=
eds from (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
packagegroup-core-tools-debug-<wbr>1.0: Package version for package package=
group-core-tools-debug-<wbr>dev went backwards which would break package fe=
eds from (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
packagegroup-core-tools-debug-<wbr>1.0: Package version for package package=
group-core-tools-debug-<wbr>ptest went backwards which would break package =
feeds from (0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
packagegroup-core-tools-debug-<wbr>1.0: Package version for package package=
group-core-tools-debug went backwards which would break package feeds from =
(0:1.0-r3.14 to 0:1.0-r3.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-dbg went backwards which would break package feeds from (0:1.0-r13.=
14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>debug-dbg went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>debug-dev went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>debug-ptest went backwards which would break package feeds fro=
m (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-debug went backwards which would break package feeds from (0:1.0-r1=
3.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-dev went backwards which would break package feeds from (0:1.0-r13.=
14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>extended-dbg went backwards which would break package feeds fr=
om (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>extended-dev went backwards which would break package feeds fr=
om (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>extended-ptest went backwards which would break package feeds =
from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>extended went backwards which would break package feeds from (=
0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>graphics-dbg went backwards which would break package feeds fr=
om (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>graphics-dev went backwards which would break package feeds fr=
om (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>graphics-ptest went backwards which would break package feeds =
from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-<wbr>graphics went backwards which would break package feeds from (=
0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-host-<wbr>tools-dbg went backwards which would break package feeds =
from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-host-<wbr>tools-dev went backwards which would break package feeds =
from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-host-<wbr>tools-ptest went backwards which would break package feed=
s from (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-host-<wbr>tools went backwards which would break package feeds from=
 (0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-ptest went backwards which would break package feeds from (0:1.0-r1=
3.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-sdk-<wbr>dbg went backwards which would break package feeds from (0=
:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-sdk-<wbr>dev went backwards which would break package feeds from (0=
:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-sdk-<wbr>ptest went backwards which would break package feeds from =
(0:1.0-r13.14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted-sdk went backwards which would break package feeds from (0:1.0-r13.=
14 to 0:1.0-r13.13) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self=
-hosted went backwards which would break package feeds from (0:1.0-r13.14 t=
o 0:1.0-r13.13) [version-going-backwards]


</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">count: 2	issue: host-user-contam=
inated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ms-<wbr>my/usr/li=
b/locale/ms_MY/LC_<wbr>COLLATE is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-quz-<wbr>pe/usr/l=
ib/locale/quz_PE/LC_<wbr>NAME is owned by uid 3004, which is the same as th=
e user running bitbake. This may be due to host contamination [host-user-co=
ntaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 158	issue: qa_pseudo
bluez5-5.46: This /work/aarch64-oe-linux/bluez5/<wbr>5.46-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
bluez5-5.46: This /work/armv5te-oe-linux-<wbr>gnueabi/bluez5/5.46-r0/pseudo=
/<wbr>pseudo.log indicates 17 errors [qa_pseudo]
bluez5-5.46: This /work/core2-64-oe-linux/<wbr>bluez5/5.46-r0/pseudo/pseudo=
.<wbr>log indicates 10 errors [qa_pseudo]
cairo-1.14.10: This /work/core2-64-oe-linux/cairo/<wbr>1.14.10-r0/pseudo/ps=
eudo.log indicates 24 errors [qa_pseudo]
collectd-5.7.2: This /work/aarch64-oe-linux/<wbr>collectd/5.7.2-r0/pseudo/<=
wbr>pseudo.log indicates 17 errors [qa_pseudo]
collectd-5.7.2: This /work/armv5te-oe-linux-<wbr>gnueabi/collectd/5.7.2-r0/=
<wbr>pseudo/pseudo.log indicates 13 errors [qa_pseudo]
dhcpcd-6.11.3: This /work/aarch64-oe-linux/dhcpcd/<wbr>6.11.3-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/aarch64-oe-linux/<wbr>gobject-intr=
ospection/1.52.1-<wbr>r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/armv5te-oe-linux-<wbr>gnueabi/gobj=
ect-introspection/<wbr>1.52.1-r0/pseudo/pseudo.log indicates 20 errors [qa_=
pseudo]
gobject-introspection-1.52.1: This /work/core2-64-oe-linux/<wbr>gobject-int=
rospection/1.52.1-<wbr>r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+<wbr>f5156e2e41: This /work/aarch64-oe-linux/<wbr>=
lcdproc/0.5.8+gitAUTOINC+<wbr>f5156e2e41-r0/pseudo/pseudo.<wbr>log indicate=
s 10 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+<wbr>f5156e2e41: This /work/armv5te-oe-linux-<wbr>=
gnueabi/lcdproc/0.5.8+<wbr>gitAUTOINC+f5156e2e41-r0/<wbr>pseudo/pseudo.log =
indicates 12 errors [qa_pseudo]
libatasmart-0.19: This /work/aarch64-oe-linux/<wbr>libatasmart/0.19-r0/pseu=
do/<wbr>pseudo.log indicates 10 errors [qa_pseudo]
libatasmart-0.19: This /work/core2-64-oe-linux/<wbr>libatasmart/0.19-r0/pse=
udo/<wbr>pseudo.log indicates 12 errors [qa_pseudo]
libconnman-qt5-1.2.4+<wbr>gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linu=
x/<wbr>libconnman-qt5/1.2.4+<wbr>gitAUTOINC+9d98e12ed6-r0/<wbr>pseudo/pseud=
o.log indicates 11 errors [qa_pseudo]
libconnman-qt5-1.2.4+<wbr>gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linu=
x-<wbr>gnueabi/libconnman-qt5/1.2.4+<wbr>gitAUTOINC+9d98e12ed6-r0/<wbr>pseu=
do/pseudo.log indicates 11 errors [qa_pseudo]
libconnman-qt5-1.2.4+<wbr>gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-lin=
ux/<wbr>libconnman-qt5/1.2.4+<wbr>gitAUTOINC+9d98e12ed6-r0/<wbr>pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+<wbr>6916cd030b: This /work/aarch64-oe-linux/<wb=
r>libqofono/0.92+gitrAUTOINC+<wbr>6916cd030b-r0/pseudo/pseudo.<wbr>log indi=
cates 11 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+<wbr>6916cd030b: This /work/armv5te-oe-linux-<wb=
r>gnueabi/libqofono/0.92+<wbr>gitrAUTOINC+6916cd030b-r0/<wbr>pseudo/pseudo.=
log indicates 13 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+<wbr>6916cd030b: This /work/core2-64-oe-linux/<w=
br>libqofono/0.92+gitrAUTOINC+<wbr>6916cd030b-r0/pseudo/pseudo.<wbr>log ind=
icates 13 errors [qa_pseudo]
librepo-1.7.20+gitAUTOINC+<wbr>e1137cbbda: This /work/aarch64-oe-linux/<wbr=
>librepo/1.7.20+gitAUTOINC+<wbr>e1137cbbda-r0/pseudo/pseudo.<wbr>log indica=
tes 10 errors [qa_pseudo]
libvncserver-0.9.11: This /work/aarch64-oe-linux/<wbr>libvncserver/0.9.11-r=
0/pseudo/<wbr>pseudo.log indicates 11 errors [qa_pseudo]
libvncserver-0.9.11: This /work/armv5te-oe-linux-<wbr>gnueabi/libvncserver/=
0.9.11-<wbr>r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libvncserver-0.9.11: This /work/core2-64-oe-linux/<wbr>libvncserver/0.9.11-=
r0/pseudo/<wbr>pseudo.log indicates 13 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/core2-64-oe-linux/<wbr>libwmf/0.2.8.4-r3/pseudo/=
<wbr>pseudo.log indicates 13 errors [qa_pseudo]
libxml-sax-writer-perl-0.57: This /work/core2-64-oe-linux/<wbr>libxml-sax-w=
riter-perl/0.57-<wbr>r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
lirc-0.9.4d: This /work/aarch64-oe-linux/lirc/0.<wbr>9.4d-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/armv5te-oe-linux-<wbr>gnueabi/lirc/0.9.4d-r0/pseudo=
/<wbr>pseudo.log indicates 13 errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/<wbr>0.9.4d-r0/pseudo/pseudo=
.log indicates 12 errors [qa_pseudo]
lvm2-2.02.171: This /work/core2-64-oe-linux/lvm2/<wbr>2.02.171-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+<wbr>gitAUTOINC+60b1b10de1: This /work/aarch64-=
oe-linux/maliit-<wbr>framework-qt5/0.99.0+<wbr>gitAUTOINC+60b1b10de1-r0/<wb=
r>pseudo/pseudo.log indicates 11 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+<wbr>gitAUTOINC+60b1b10de1: This /work/armv5te-=
oe-linux-<wbr>gnueabi/maliit-framework-qt5/<wbr>0.99.0+gitAUTOINC+60b1b10de=
1-<wbr>r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+<wbr>gitAUTOINC+60b1b10de1: This /work/core2-64=
-oe-linux/<wbr>maliit-framework-qt5/0.99.0+<wbr>gitAUTOINC+60b1b10de1-r0/<w=
br>pseudo/pseudo.log indicates 12 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+<wbr>gitAUTOINC+c6a3485926: This /work/aarch64-oe=
-linux/maliit-<wbr>plugins-qt5/0.99.0+gitAUTOINC+<wbr>c6a3485926-r0/pseudo/=
pseudo.<wbr>log indicates 18 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+<wbr>gitAUTOINC+c6a3485926: This /work/core2-64-o=
e-linux/<wbr>maliit-plugins-qt5/0.99.0+<wbr>gitAUTOINC+c6a3485926-r0/<wbr>p=
seudo/pseudo.log indicates 27 errors [qa_pseudo]
mc-4.8.19: This /work/core2-64-oe-linux/mc/4.<wbr>8.19-r0/pseudo/pseudo.log=
 indicates 12 errors [qa_pseudo]
net-snmp-5.7.3: This /work/aarch64-oe-linux/net-<wbr>snmp/5.7.3-r0/pseudo/p=
seudo.<wbr>log indicates 11 errors [qa_pseudo]
net-snmp-5.7.3: This /work/armv5te-oe-linux-<wbr>gnueabi/net-snmp/5.7.3-r0/=
<wbr>pseudo/pseudo.log indicates 13 errors [qa_pseudo]
net-snmp-5.7.3: This /work/core2-64-oe-linux/net-<wbr>snmp/5.7.3-r0/pseudo/=
pseudo.<wbr>log indicates 12 errors [qa_pseudo]
ofono-1.20: This /work/aarch64-oe-linux/ofono/<wbr>1.20-r0/pseudo/pseudo.lo=
g indicates 16 errors [qa_pseudo]
ofono-1.20: This /work/armv5te-oe-linux-<wbr>gnueabi/ofono/1.20-r0/pseudo/<=
wbr>pseudo.log indicates 16 errors [qa_pseudo]
opencv-3.3+gitAUTOINC+<wbr>87c27a074d_2a9d1b22ed_<wbr>a62e20676a_34e4206aef=
_<wbr>fccf7cd6a4: This /work/aarch64-oe-linux/opencv/<wbr>3.3+gitAUTOINC+87=
c27a074d_<wbr>2a9d1b22ed_a62e20676a_<wbr>34e4206aef_fccf7cd6a4-r0/<wbr>pseu=
do/pseudo.log indicates 16 errors [qa_pseudo]
opencv-3.3+gitAUTOINC+<wbr>87c27a074d_2a9d1b22ed_<wbr>a62e20676a_34e4206aef=
_<wbr>fccf7cd6a4: This /work/core2-64-oe-linux/<wbr>opencv/3.3+gitAUTOINC+<=
wbr>87c27a074d_2a9d1b22ed_<wbr>a62e20676a_34e4206aef_<wbr>fccf7cd6a4-r0/pse=
udo/pseudo.<wbr>log indicates 12 errors [qa_pseudo]
openhpi-3.6.1: This /work/armv5te-oe-linux-<wbr>gnueabi/openhpi/3.6.1-r0/<w=
br>pseudo/pseudo.log indicates 14 errors [qa_pseudo]
openhpi-3.6.1: This /work/core2-64-oe-linux/<wbr>openhpi/3.6.1-r0/pseudo/<w=
br>pseudo.log indicates 14 errors [qa_pseudo]
openipmi-2.0.24: This /work/core2-64-oe-linux/<wbr>openipmi/2.0.24-r0/pseud=
o/<wbr>pseudo.log indicates 10 errors [qa_pseudo]
opensaf-5.17.07: This /work/aarch64-oe-linux/<wbr>opensaf/5.17.07-r0/pseudo=
/<wbr>pseudo.log indicates 16 errors [qa_pseudo]
opensaf-5.17.07: This /work/armv5te-oe-linux-<wbr>gnueabi/opensaf/5.17.07-r=
0/<wbr>pseudo/pseudo.log indicates 20 errors [qa_pseudo]
opensaf-5.17.07: This /work/core2-64-oe-linux/<wbr>opensaf/5.17.07-r0/pseud=
o/<wbr>pseudo.log indicates 20 errors [qa_pseudo]
pcmanfm-1.2.5: This /work/aarch64-oe-linux/<wbr>pcmanfm/1.2.5-r0/pseudo/<wb=
r>pseudo.log indicates 4 errors [qa_pseudo]
puzzles-0.0+gitAUTOINC+<wbr>8dfe5cec31: This /work/core2-64-oe-linux/<wbr>p=
uzzles/1_0.0+gitAUTOINC+<wbr>8dfe5cec31-r0/pseudo/pseudo.<wbr>log indicates=
 18 errors [qa_pseudo]
python3-dbus-1.2.4: This /work/aarch64-oe-linux/<wbr>python3-dbus/1.2.4-r0/=
pseudo/<wbr>pseudo.log indicates 10 errors [qa_pseudo]
python3-simplejson-3.11.1: This /work/armv5te-oe-linux-<wbr>gnueabi/python3=
-simplejson/3.<wbr>11.1-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
qemu-2.10.0: This /work/core2-64-oe-linux/qemu/<wbr>2.10.0-r0/pseudo/pseudo=
.log indicates 12 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+<wbr>143b721249: This /work/aarch64-oe-linux/qt3d/5.<=
wbr>9.2+gitAUTOINC+143b721249-r0/<wbr>pseudo/pseudo.log indicates 17 errors=
 [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+<wbr>143b721249: This /work/armv5te-oe-linux-<wbr>gnu=
eabi/qt3d/5.9.2+gitAUTOINC+<wbr>143b721249-r0/pseudo/pseudo.<wbr>log indica=
tes 14 errors [qa_pseudo]
qt5-creator-3.5.1: This /work/armv5te-oe-linux-<wbr>gnueabi/qt5-creator/3.5=
.1-r0/<wbr>pseudo/pseudo.log indicates 20 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+<wbr>ec16ba393b: This /work/aarch64-oe-linux/qtbase=
/<wbr>5.9.2+gitAUTOINC+ec16ba393b-<wbr>r0/pseudo/pseudo.log indicates 211 e=
rrors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+<wbr>ec16ba393b: This /work/armv5te-oe-linux-<wbr>g=
nueabi/qtbase/5.9.2+<wbr>gitAUTOINC+ec16ba393b-r0/<wbr>pseudo/pseudo.log in=
dicates 14 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+<wbr>ec16ba393b: This /work/core2-64-oe-linux/<wbr>=
qtbase/5.9.2+gitAUTOINC+<wbr>ec16ba393b-r0/pseudo/pseudo.<wbr>log indicates=
 16 errors [qa_pseudo]
qtcanvas3d-5.9.2+gitAUTOINC+<wbr>a1aee8ecbe: This /work/aarch64-oe-linux/<w=
br>qtcanvas3d/5.9.2+gitAUTOINC+<wbr>a1aee8ecbe-r0/pseudo/pseudo.<wbr>log in=
dicates 11 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+<wbr>e3af14e916: This /work/aarch64-oe-linux/<wbr=
>qtcharts/5.9.2+gitAUTOINC+<wbr>e3af14e916-r0/pseudo/pseudo.<wbr>log indica=
tes 10 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+<wbr>e3af14e916: This /work/armv5te-oe-linux-<wbr=
>gnueabi/qtcharts/5.9.2+<wbr>gitAUTOINC+e3af14e916-r0/<wbr>pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+<wbr>e3af14e916: This /work/core2-64-oe-linux/<wb=
r>qtcharts/5.9.2+gitAUTOINC+<wbr>e3af14e916-r0/pseudo/pseudo.<wbr>log indic=
ates 13 errors [qa_pseudo]
qtconnectivity-5.9.2+<wbr>gitAUTOINC+6b3bdb8440: This /work/aarch64-oe-linu=
x/<wbr>qtconnectivity/5.9.2+<wbr>gitAUTOINC+6b3bdb8440-r0/<wbr>pseudo/pseud=
o.log indicates 14 errors [qa_pseudo]
qtconnectivity-5.9.2+<wbr>gitAUTOINC+6b3bdb8440: This /work/armv5te-oe-linu=
x-<wbr>gnueabi/qtconnectivity/5.9.2+<wbr>gitAUTOINC+6b3bdb8440-r0/<wbr>pseu=
do/pseudo.log indicates 14 errors [qa_pseudo]
qtconnectivity-5.9.2+<wbr>gitAUTOINC+6b3bdb8440: This /work/core2-64-oe-lin=
ux/<wbr>qtconnectivity/5.9.2+<wbr>gitAUTOINC+6b3bdb8440-r0/<wbr>pseudo/pseu=
do.log indicates 13 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+<wbr>8329a8fb28: This /work/aarch64-oe-linux/<=
wbr>qtdatavis3d/5.9.2+gitAUTOINC+<wbr>8329a8fb28-r0/pseudo/pseudo.<wbr>log =
indicates 11 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+<wbr>8329a8fb28: This /work/armv5te-oe-linux-<=
wbr>gnueabi/qtdatavis3d/5.9.2+<wbr>gitAUTOINC+8329a8fb28-r0/<wbr>pseudo/pse=
udo.log indicates 24 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+<wbr>8329a8fb28: This /work/core2-64-oe-linux/=
<wbr>qtdatavis3d/5.9.2+gitAUTOINC+<wbr>8329a8fb28-r0/pseudo/pseudo.<wbr>log=
 indicates 21 errors [qa_pseudo]
qtdeclarative-5.9.2+<wbr>gitAUTOINC+32218c3243: This /work/aarch64-oe-linux=
/<wbr>qtdeclarative/5.9.2+<wbr>gitAUTOINC+32218c3243-r0/<wbr>pseudo/pseudo.=
log indicates 17 errors [qa_pseudo]
qtdeclarative-5.9.2+<wbr>gitAUTOINC+32218c3243: This /work/armv5te-oe-linux=
-<wbr>gnueabi/qtdeclarative/5.9.2+<wbr>gitAUTOINC+32218c3243-r0/<wbr>pseudo=
/pseudo.log indicates 42 errors [qa_pseudo]
qtdeclarative-5.9.2+<wbr>gitAUTOINC+32218c3243: This /work/core2-64-oe-linu=
x/<wbr>qtdeclarative/5.9.2+<wbr>gitAUTOINC+32218c3243-r0/<wbr>pseudo/pseudo=
.log indicates 21 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+<wbr>23603a3b08: This /work/aarch64-oe-linux/<wb=
r>qtenginio/5.9.2+gitAUTOINC+<wbr>23603a3b08-r0/pseudo/pseudo.<wbr>log indi=
cates 11 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+<wbr>23603a3b08: This /work/armv5te-oe-linux-<wb=
r>gnueabi/qtenginio/5.9.2+<wbr>gitAUTOINC+23603a3b08-r0/<wbr>pseudo/pseudo.=
log indicates 14 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+<wbr>23603a3b08: This /work/core2-64-oe-linux/<w=
br>qtenginio/5.9.2+gitAUTOINC+<wbr>23603a3b08-r0/pseudo/pseudo.<wbr>log ind=
icates 13 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+<wbr>167566d228: This /work/aarch64-oe-linux/<wb=
r>qtgamepad/5.9.2+gitAUTOINC+<wbr>167566d228-r0/pseudo/pseudo.<wbr>log indi=
cates 11 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+<wbr>167566d228: This /work/armv5te-oe-linux-<wb=
r>gnueabi/qtgamepad/5.9.2+<wbr>gitAUTOINC+167566d228-r0/<wbr>pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+<wbr>167566d228: This /work/core2-64-oe-linux/<w=
br>qtgamepad/5.9.2+gitAUTOINC+<wbr>167566d228-r0/pseudo/pseudo.<wbr>log ind=
icates 15 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+<wbr>d919f47308_1c633072fc: This /work/aarch64-=
oe-linux/<wbr>qtlocation/5.9.2+gitAUTOINC+<wbr>d919f47308_1c633072fc-r0/<wb=
r>pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+<wbr>d919f47308_1c633072fc: This /work/armv5te-=
oe-linux-<wbr>gnueabi/qtlocation/5.9.2+<wbr>gitAUTOINC+d919f47308_<wbr>1c63=
3072fc-r0/pseudo/pseudo.<wbr>log indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+<wbr>d919f47308_1c633072fc: This /work/core2-64=
-oe-linux/<wbr>qtlocation/5.9.2+gitAUTOINC+<wbr>d919f47308_1c633072fc-r0/<w=
br>pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+<wbr>1e2702e86d: This /work/aarch64-oe-linux/=
<wbr>qtmultimedia/5.9.2+gitAUTOINC+<wbr>1e2702e86d-r0/pseudo/pseudo.<wbr>lo=
g indicates 11 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+<wbr>1e2702e86d: This /work/armv5te-oe-linux-=
<wbr>gnueabi/qtmultimedia/5.9.2+<wbr>gitAUTOINC+1e2702e86d-r0/<wbr>pseudo/p=
seudo.log indicates 13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+<wbr>1e2702e86d: This /work/core2-64-oe-linux=
/<wbr>qtmultimedia/5.9.2+gitAUTOINC+<wbr>1e2702e86d-r0/pseudo/pseudo.<wbr>l=
og indicates 13 errors [qa_pseudo]
qtnetworkauth-5.9.2+<wbr>gitAUTOINC+47b80ecae6: This /work/aarch64-oe-linux=
/<wbr>qtnetworkauth/5.9.2+<wbr>gitAUTOINC+47b80ecae6-r0/<wbr>pseudo/pseudo.=
log indicates 5 errors [qa_pseudo]
qtnetworkauth-5.9.2+<wbr>gitAUTOINC+47b80ecae6: This /work/armv5te-oe-linux=
-<wbr>gnueabi/qtnetworkauth/5.9.2+<wbr>gitAUTOINC+47b80ecae6-r0/<wbr>pseudo=
/pseudo.log indicates 13 errors [qa_pseudo]
qtnetworkauth-5.9.2+<wbr>gitAUTOINC+47b80ecae6: This /work/core2-64-oe-linu=
x/<wbr>qtnetworkauth/5.9.2+<wbr>gitAUTOINC+47b80ecae6-r0/<wbr>pseudo/pseudo=
.log indicates 13 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+<wbr>9bf0edd9bd: This /work/aarch64-oe-linux/<wbr=
>qtquick1/5.9.2+gitAUTOINC+<wbr>9bf0edd9bd-r0/pseudo/pseudo.<wbr>log indica=
tes 18 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+<wbr>9bf0edd9bd: This /work/armv5te-oe-linux-<wbr=
>gnueabi/qtquick1/5.9.2+<wbr>gitAUTOINC+9bf0edd9bd-r0/<wbr>pseudo/pseudo.lo=
g indicates 26 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+<wbr>9bf0edd9bd: This /work/core2-64-oe-linux/<wb=
r>qtquick1/5.9.2+gitAUTOINC+<wbr>9bf0edd9bd-r0/pseudo/pseudo.<wbr>log indic=
ates 19 errors [qa_pseudo]
qtquickcontrols2-5.9.2+<wbr>gitAUTOINC+871d8e8e2f: This /work/aarch64-oe-li=
nux/<wbr>qtquickcontrols2/5.9.2+<wbr>gitAUTOINC+871d8e8e2f-r0/<wbr>pseudo/p=
seudo.log indicates 11 errors [qa_pseudo]
qtquickcontrols2-5.9.2+<wbr>gitAUTOINC+871d8e8e2f: This /work/armv5te-oe-li=
nux-<wbr>gnueabi/qtquickcontrols2/5.9.<wbr>2+gitAUTOINC+871d8e8e2f-r0/<wbr>=
pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.9.2+<wbr>gitAUTOINC+871d8e8e2f: This /work/core2-64-oe-l=
inux/<wbr>qtquickcontrols2/5.9.2+<wbr>gitAUTOINC+871d8e8e2f-r0/<wbr>pseudo/=
pseudo.log indicates 14 errors [qa_pseudo]
qtquickcontrols-5.9.2+<wbr>gitAUTOINC+8476f8fff7: This /work/core2-64-oe-li=
nux/<wbr>qtquickcontrols/5.9.2+<wbr>gitAUTOINC+8476f8fff7-r0/<wbr>pseudo/ps=
eudo.log indicates 16 errors [qa_pseudo]
qtremoteobjects-5.9.2+<wbr>gitAUTOINC+6e0341bc87: This /work/aarch64-oe-lin=
ux/<wbr>qtremoteobjects/5.9.2+<wbr>gitAUTOINC+6e0341bc87-r0/<wbr>pseudo/pse=
udo.log indicates 11 errors [qa_pseudo]
qtremoteobjects-5.9.2+<wbr>gitAUTOINC+6e0341bc87: This /work/armv5te-oe-lin=
ux-<wbr>gnueabi/qtremoteobjects/5.9.2+<wbr>gitAUTOINC+6e0341bc87-r0/<wbr>ps=
eudo/pseudo.log indicates 12 errors [qa_pseudo]
qtremoteobjects-5.9.2+<wbr>gitAUTOINC+6e0341bc87: This /work/core2-64-oe-li=
nux/<wbr>qtremoteobjects/5.9.2+<wbr>gitAUTOINC+6e0341bc87-r0/<wbr>pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+<wbr>08b74f4f30: This /work/aarch64-oe-linux/<wbr=
>qtscript/5.9.2+gitAUTOINC+<wbr>08b74f4f30-r0/pseudo/pseudo.<wbr>log indica=
tes 11 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+<wbr>08b74f4f30: This /work/armv5e-oe-linux-gnuea=
bi/<wbr>qtscript/5.9.2+gitAUTOINC+<wbr>08b74f4f30-r0/pseudo/pseudo.<wbr>log=
 indicates 13 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+<wbr>08b74f4f30: This /work/core2-64-oe-linux/<wb=
r>qtscript/5.9.2+gitAUTOINC+<wbr>08b74f4f30-r0/pseudo/pseudo.<wbr>log indic=
ates 19 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+<wbr>3caae998c8: This /work/armv5te-oe-linux-<wbr>=
gnueabi/qtscxml/5.9.2+<wbr>gitAUTOINC+3caae998c8-r0/<wbr>pseudo/pseudo.log =
indicates 13 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+<wbr>3caae998c8: This /work/core2-64-oe-linux/<wbr=
>qtscxml/5.9.2+gitAUTOINC+<wbr>3caae998c8-r0/pseudo/pseudo.<wbr>log indicat=
es 13 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+<wbr>c273f2e5c8: This /work/aarch64-oe-linux/<wb=
r>qtsensors/5.9.2+gitAUTOINC+<wbr>c273f2e5c8-r0/pseudo/pseudo.<wbr>log indi=
cates 13 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+<wbr>c273f2e5c8: This /work/armv5te-oe-linux-<wb=
r>gnueabi/qtsensors/5.9.2+<wbr>gitAUTOINC+c273f2e5c8-r0/<wbr>pseudo/pseudo.=
log indicates 15 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+<wbr>c273f2e5c8: This /work/core2-64-oe-linux/<w=
br>qtsensors/5.9.2+gitAUTOINC+<wbr>c273f2e5c8-r0/pseudo/pseudo.<wbr>log ind=
icates 15 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+<wbr>ce5a3ced5e: This /work/armv5te-oe-linux-<=
wbr>gnueabi/qtserialbus/5.9.2+<wbr>gitAUTOINC+ce5a3ced5e-r0/<wbr>pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+<wbr>ce5a3ced5e: This /work/core2-64-oe-linux/=
<wbr>qtserialbus/5.9.2+gitAUTOINC+<wbr>ce5a3ced5e-r0/pseudo/pseudo.<wbr>log=
 indicates 13 errors [qa_pseudo]
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">qtserialport-5.9.2+gitAUTOINC+<w=
br>cb9ade8bea: This /work/aarch64-oe-linux/<wbr>qtserialport/5.9.2+gitAUTOI=
NC+<wbr>cb9ade8bea-r0/pseudo/pseudo.<wbr>log indicates 5 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+<wbr>cb9ade8bea: This /work/armv5te-oe-linux-=
<wbr>gnueabi/qtserialport/5.9.2+<wbr>gitAUTOINC+cb9ade8bea-r0/<wbr>pseudo/p=
seudo.log indicates 7 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+<wbr>cb9ade8bea: This /work/core2-64-oe-linux=
/<wbr>qtserialport/5.9.2+gitAUTOINC+<wbr>cb9ade8bea-r0/pseudo/pseudo.<wbr>l=
og indicates 7 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+<wbr>bdcd7a9744: This /work/aarch64-oe-linux/qtsvg/<=
wbr>5.9.2+gitAUTOINC+bdcd7a9744-<wbr>r0/pseudo/pseudo.log indicates 15 erro=
rs [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+<wbr>bdcd7a9744: This /work/armv5te-oe-linux-<wbr>gn=
ueabi/qtsvg/5.9.2+<wbr>gitAUTOINC+bdcd7a9744-r0/<wbr>pseudo/pseudo.log indi=
cates 17 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+<wbr>bdcd7a9744: This /work/core2-64-oe-linux/qtsvg/=
<wbr>5.9.2+gitAUTOINC+bdcd7a9744-<wbr>r0/pseudo/pseudo.log indicates 13 err=
ors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+<wbr>9c204e05ae: This /work/aarch64-oe-linux/<wb=
r>qtsystems/5.9.2+gitAUTOINC+<wbr>9c204e05ae-r0/pseudo/pseudo.<wbr>log indi=
cates 11 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+<wbr>9c204e05ae: This /work/armv5te-oe-linux-<wb=
r>gnueabi/qtsystems/5.9.2+<wbr>gitAUTOINC+9c204e05ae-r0/<wbr>pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+<wbr>9c204e05ae: This /work/core2-64-oe-linux/<w=
br>qtsystems/5.9.2+gitAUTOINC+<wbr>9c204e05ae-r0/pseudo/pseudo.<wbr>log ind=
icates 14 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+<wbr>90a701032e: This /work/aarch64-oe-linux/<wbr>=
qttools/5.9.2+gitAUTOINC+<wbr>90a701032e-r0/pseudo/pseudo.<wbr>log indicate=
s 12 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+<wbr>90a701032e: This /work/armv5te-oe-linux-<wbr>=
gnueabi/qttools/5.9.2+<wbr>gitAUTOINC+90a701032e-r0/<wbr>pseudo/pseudo.log =
indicates 15 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+<wbr>90a701032e: This /work/core2-64-oe-linux/<wbr=
>qttools/5.9.2+gitAUTOINC+<wbr>90a701032e-r0/pseudo/pseudo.<wbr>log indicat=
es 12 errors [qa_pseudo]
qttranslations-5.9.2+<wbr>gitAUTOINC+325a90e07e: This /work/core2-64-oe-lin=
ux/<wbr>qttranslations/5.9.2+<wbr>gitAUTOINC+325a90e07e-r0/<wbr>pseudo/pseu=
do.log indicates 6 errors [qa_pseudo]
qtvirtualkeyboard-5.9.2+<wbr>gitAUTOINC+87218c4e68: This /work/aarch64-oe-l=
inux/<wbr>qtvirtualkeyboard/5.9.2+<wbr>gitAUTOINC+87218c4e68-r0/<wbr>pseudo=
/pseudo.log indicates 10 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+<wbr>d483ed2927: This /work/aarch64-oe-linux/<wb=
r>qtwayland/5.9.2+gitAUTOINC+<wbr>d483ed2927-r0/pseudo/pseudo.<wbr>log indi=
cates 18 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+<wbr>d483ed2927: This /work/armv5te-oe-linux-<wb=
r>gnueabi/qtwayland/5.9.2+<wbr>gitAUTOINC+d483ed2927-r0/<wbr>pseudo/pseudo.=
log indicates 13 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+<wbr>61a638663c: This /work/aarch64-oe-linux/=
<wbr>qtwebchannel/5.9.2+gitAUTOINC+<wbr>61a638663c-r0/pseudo/pseudo.<wbr>lo=
g indicates 11 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+<wbr>61a638663c: This /work/armv5te-oe-linux-=
<wbr>gnueabi/qtwebchannel/5.9.2+<wbr>gitAUTOINC+61a638663c-r0/<wbr>pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+<wbr>c11c2c8981_cfe8c60903: This /work/aarch64=
-oe-linux/<wbr>qtwebengine/5.9.2+gitAUTOINC+<wbr>c11c2c8981_cfe8c60903-r0/<=
wbr>pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+<wbr>c11c2c8981_cfe8c60903: This /work/core2-6=
4-oe-linux/<wbr>qtwebengine/5.9.2+gitAUTOINC+<wbr>c11c2c8981_cfe8c60903-r0/=
<wbr>pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+<wbr>97c4a80a12: This /work/aarch64-oe-linux/<wbr=
>qtwebkit/5.9.2+gitAUTOINC+<wbr>97c4a80a12-r0/pseudo/pseudo.<wbr>log indica=
tes 12 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+<wbr>97c4a80a12: This /work/armv5e-oe-linux-gnuea=
bi/<wbr>qtwebkit/5.9.2+gitAUTOINC+<wbr>97c4a80a12-r0/pseudo/pseudo.<wbr>log=
 indicates 13 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+<wbr>97c4a80a12: This /work/core2-64-oe-linux/<wb=
r>qtwebkit/5.9.2+gitAUTOINC+<wbr>97c4a80a12-r0/pseudo/pseudo.<wbr>log indic=
ates 14 errors [qa_pseudo]
qtwebkit-examples-5.9.2+<wbr>gitAUTOINC+a24c780b60: This /work/core2-64-oe-=
linux/<wbr>qtwebkit-examples/5.9.2+<wbr>gitAUTOINC+a24c780b60-r0/<wbr>pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+<wbr>492981b932: This /work/aarch64-oe-linux/=
<wbr>qtwebsockets/5.9.2+gitAUTOINC+<wbr>492981b932-r0/pseudo/pseudo.<wbr>lo=
g indicates 11 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+<wbr>492981b932: This /work/armv5te-oe-linux-=
<wbr>gnueabi/qtwebsockets/5.9.2+<wbr>gitAUTOINC+492981b932-r0/<wbr>pseudo/p=
seudo.log indicates 14 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+<wbr>492981b932: This /work/core2-64-oe-linux=
/<wbr>qtwebsockets/5.9.2+gitAUTOINC+<wbr>492981b932-r0/pseudo/pseudo.<wbr>l=
og indicates 14 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+<wbr>ec640efd1d: This /work/aarch64-oe-linux/<wb=
r>qtwebview/5.9.2+gitAUTOINC+<wbr>ec640efd1d-r0/pseudo/pseudo.<wbr>log indi=
cates 12 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+<wbr>ec640efd1d: This /work/core2-64-oe-linux/<w=
br>qtwebview/5.9.2+gitAUTOINC+<wbr>ec640efd1d-r0/pseudo/pseudo.<wbr>log ind=
icates 7 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+<wbr>160435b0eb: This /work/aarch64-oe-linux/<=
wbr>qtx11extras/5.9.2+gitAUTOINC+<wbr>160435b0eb-r0/pseudo/pseudo.<wbr>log =
indicates 11 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+<wbr>160435b0eb: This /work/armv5te-oe-linux-<=
wbr>gnueabi/qtx11extras/5.9.2+<wbr>gitAUTOINC+160435b0eb-r0/<wbr>pseudo/pse=
udo.log indicates 8 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+<wbr>160435b0eb: This /work/core2-64-oe-linux/=
<wbr>qtx11extras/5.9.2+gitAUTOINC+<wbr>160435b0eb-r0/pseudo/pseudo.<wbr>log=
 indicates 7 errors [qa_pseudo]
qtxmlpatterns-5.9.2+<wbr>gitAUTOINC+8d7e1e0ec0: This /work/armv5te-oe-linux=
-<wbr>gnueabi/qtxmlpatterns/5.9.2+<wbr>gitAUTOINC+8d7e1e0ec0-r0/<wbr>pseudo=
/pseudo.log indicates 13 errors [qa_pseudo]
qtxmlpatterns-5.9.2+<wbr>gitAUTOINC+8d7e1e0ec0: This /work/core2-64-oe-linu=
x/<wbr>qtxmlpatterns/5.9.2+<wbr>gitAUTOINC+8d7e1e0ec0-r0/<wbr>pseudo/pseudo=
.log indicates 14 errors [qa_pseudo]
rpm-4.13.90+gitAUTOINC+<wbr>a8e51b3bb0: This /work/armv5te-oe-linux-<wbr>gn=
ueabi/rpm/1_4.13.90+<wbr>gitAUTOINC+a8e51b3bb0-r0/<wbr>pseudo/pseudo.log in=
dicates 12 errors [qa_pseudo]
rsyslog-8.29.0: This /work/aarch64-oe-linux/<wbr>rsyslog/8.29.0-r0/pseudo/<=
wbr>pseudo.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/armv5te-oe-linux-<wbr>gnueabi/rsyslog/8.29.0-r0/=
<wbr>pseudo/pseudo.log indicates 17 errors [qa_pseudo]
rsyslog-8.29.0: This /work/core2-64-oe-linux/<wbr>rsyslog/8.29.0-r0/pseudo/=
<wbr>pseudo.log indicates 10 errors [qa_pseudo]
settings-daemon-0.0.2: This /work/aarch64-oe-linux/<wbr>settings-daemon/0.0=
.2-r0/<wbr>pseudo/pseudo.log indicates 10 errors [qa_pseudo]
strace-4.18: This /work/aarch64-oe-linux/strace/<wbr>4.18-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
strace-4.18: This /work/armv5te-oe-linux-<wbr>gnueabi/strace/4.18-r0/pseudo=
/<wbr>pseudo.log indicates 12 errors [qa_pseudo]
tunctl-1.5: This /work/aarch64-oe-linux/tunctl/<wbr>1.5-r0/pseudo/pseudo.lo=
g indicates 8 errors [qa_pseudo]
upower-0.99.5: This /work/core2-64-oe-linux/<wbr>upower/0.99.5-r0/pseudo/<w=
br>pseudo.log indicates 16 errors [qa_pseudo]
vlc-2.2.2: This /work/core2-64-oe-linux/vlc/2.<wbr>2.2-r0/pseudo/pseudo.log=
 indicates 12 errors [qa_pseudo]
weston-2.0.0: This /work/aarch64-oe-linux/weston/<wbr>2.0.0-r0/pseudo/pseud=
o.log indicates 16 errors [qa_pseudo]
xfce4-appfinder-4.12.0: This /work/core2-64-oe-linux/xfce4-<wbr>appfinder/4=
.12.0-r0/pseudo/<wbr>pseudo.log indicates 18 errors [qa_pseudo]
xfce4-places-plugin-1.7.0: This /work/core2-64-oe-linux/xfce4-<wbr>places-p=
lugin/1.7.0-r0/pseudo/<wbr>pseudo.log indicates 16 errors [qa_pseudo]
xfce4-sensors-plugin-1.2.97: This /work/armv5te-oe-linux-<wbr>gnueabi/xfce4=
-sensors-plugin/<wbr>1.2.97-r0/pseudo/pseudo.log indicates 12 errors [qa_ps=
eudo]
xfce4-weather-plugin-0.8.9: This /work/core2-64-oe-linux/xfce4-<wbr>weather=
-plugin/0.8.9-r0/<wbr>pseudo/pseudo.log indicates 18 errors [qa_pseudo]
zbar-0.10: This /work/aarch64-oe-linux/zbar/0.<wbr>10-r0/pseudo/pseudo.log =
indicates 16 errors [qa_pseudo]



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
re></pre></pre>
      </div>
      <br>
      <fieldset class=3D"m_5769434083185138288mimeAttachmentHeader"></field=
set>
      <br>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--f403045d5cfaed0be1055ce8eb0a--
