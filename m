Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id B025578528;
	Thu,  9 Nov 2017 15:23:48 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id j3so4953635pga.1;
	Thu, 09 Nov 2017 07:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=Y/7cR7mOCdaf79Iys1oXjD22ZsEPbHNNr87RTJ7WxjA=;
	b=jfp8OMWoiQPTQa2CTUwbnGL40Yuh4dDKTOYFZkaLjtBJFi0t077a5VZnE9adTHIsLc
	2iPQwrMrr7t/P0Gr7bNWPKVE64zyZtl97fhagzeB0VpDcs72R5265WLNAjKZCNv4C2GX
	nhKdf02UiS3Ggsjl1XG0Nf7q8uTz/tK3iCIK3u6l3QLyvIrN2hJMxtCBi3v4/0b19NZ3
	l2QXdilNUfuN6Q8vMP2dl30GIrCwuMLsgiRJ/yEzHrw/CwSXvbhY3sEYf2qn8c+IG4YE
	/cT0+Cqgv8PYRzm4XnmRBCeq9Ilx5qJxvL9fj3a2d9GpktTjzszsL98JwWLcroOmc2Gf
	5LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Y/7cR7mOCdaf79Iys1oXjD22ZsEPbHNNr87RTJ7WxjA=;
	b=EnIE3oTQDcpo0YPfKLb/2NgFnGlW8YAG27YElTkoCvnAQfNnrOr8OfkhJYiA64wsIC
	5ejGLBo49e20Hoc35ZsnV1i5/3LP+fvP0Hjokf99CO+/UYbFcLMkxlhGx34/VwZN8dFE
	5bggV9ajFDQFnnPKijzbNwtj1qqQEbiFCgs9+nwTIsnzJ2pa+fpk8vlSVlGjzALmS/QZ
	kt00ZbxEeDot1Mb4vHnMqc9ABpC5+XwQ3sjuafYjHX8PKgFLLJZzfrd2BgRORmnWYFVt
	1LxIFn6bYDM3gu0hdbWOhDlMCDHaoR02D/zH1Av2bcwiq21/8ISyqpHg9m5yedgYT9EO
	86vQ==
X-Gm-Message-State: AJaThX4hTUcrn/ol0kPnS6nSQNeh9LZcIytRaEf6Qjdc/L+W6eI0pBVj
	Pc0WY8mRlBKrMy0RhBGPrr3e8A==
X-Google-Smtp-Source: ABhQp+SFXx/1jQ5+CYWIu0OOF2K3JFqlly74/435cYO+sd4lnxb1TcvRzPDGCjDfY6jyoQkRMGdaIg==
X-Received: by 10.84.235.134 with SMTP id p6mr824773plk.326.1510241029815;
	Thu, 09 Nov 2017 07:23:49 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:1866:ccc1:2b3a:60cc?
	([2601:202:4001:9ea0:1866:ccc1:2b3a:60cc])
	by smtp.gmail.com with ESMTPSA id
	q12sm11808030pgn.56.2017.11.09.07.23.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Nov 2017 07:23:49 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CA+chaQedk4yWUWmG9XkZaAf8XemfxzyTh35TYjdPwjgdpqk5Bw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <eca1b5d8-7998-3ea0-bdaa-17336e5d53b4@gmail.com>
Date: Thu, 9 Nov 2017 07:23:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQedk4yWUWmG9XkZaAf8XemfxzyTh35TYjdPwjgdpqk5Bw@mail.gmail.com>
Subject: Re: State of bitbake world, Failed tasks 2017-11-07
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
X-List-Received-Date: Thu, 09 Nov 2017 15:23:50 -0000
Content-Type: multipart/alternative;
	boundary="------------897542E8F61BDF3B89CD4C19"
Content-Language: en-US

--------------897542E8F61BDF3B89CD4C19
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/08/2017 11:05 AM, Martin Jansa wrote:
> The only change from previous report is slightly newer oe-core and bitb=
ake.
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date		     !!colspan=3D'4'|Failed tasks			    !!|Signatures		  !!cols=
pan=3D'15'|QA !!Comment
> |-
> ||		||qemuarm	||qemuarm64	||qemux86	||qemux86_64	||all 	||already-strip=
ped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backward=
s	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-opt=
ion	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compil=
e-host-path	||qa_pseudo	||=09
> |-
> ||2017-11-07	||3	||6	||28	||2	||0	||0		||0		||1		||0		||0		||0		||1		||=
0		||0		||0		||0		||0		||0		||0		||365		||=09
> |}
>
> =3D=3D Failed tasks 2017-11-07 =3D=3D
>
> INFO: jenkins-job.sh-1.8.39 Complete log available at http://logs.nslu2=
-linux.org/buildlogs/oe/world/rocko/log.report.20171108_081616.log
>
> =3D=3D=3D common (1) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb:=
do_configure
>
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>
> =3D=3D=3D qemuarm (2) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-=
tools_5.1.1.r37.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_package_qa
>
> =3D=3D=3D qemuarm64 (5) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:do_=
compile
>     * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.=
143.bb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-k=
libc_1.5.2.bb:do_install
>     * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools=
-klibc_2.0.2.bb:do_configure

>     * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb=
:do_compile

The Arm64 fix=C2=A0 should be in the 2.1.0 when it releases. The fix is i=
n
LuaJIT-2.1.0-beta3.=C2=A0 I didn't want to backport (beta) it as it may
trigger the need for PE when 2.1.0 officially releases.


>
> =3D=3D=3D qemux86 (27) =3D=3D=3D

>     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_comp=
ile
>     * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdis=
t_6.1.5.bb:do_package
>     * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf=
_5.17.07.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3=
=2E0.3.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netki=
t-rsh_0.17.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/ne=
tkit-rusers_0.17.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/ne=
tkit-telnet_0.17.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765=
=2E50.9.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks=
_1.8beta5.bb:do_compile
>     * meta-openembedded/meta-networking/recipes-support/open-isns/open-=
isns_0.97.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhuget=
lbfs_git.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:d=
o_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61=
=2Ebb:do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_=
compile
>     * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:d=
o_compile
>     * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_=
compile
>     * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicored=
umper_2.0.0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17=
=2Ebb:do_compile
>     * meta-openembedded/meta-python/recipes-devtools/python/python3-sys=
temd_234.bb:do_compile
>     * meta-openembedded/meta-python/recipes-devtools/python/python-syst=
emd_234.bb:do_compile
>     * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
>     * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd=
-bootchart_231.bb:do_compile
>     * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:d=
o_compile
>     * openembedded-core/meta/recipes-graphics/virglrenderer/virglrender=
er_git.bb:do_compile
>     * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-bad_1.12.3.bb:do_compile
>     * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_pac=
kage_qa
>
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * meta-openembedded/meta-networking/recipes-extended/corosync/coros=
ync_2.4.2.bb:do_package_qa
>
> =3D=3D=3D Number of failed tasks (39) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.world.qemuarm.20171106_001137.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/48068/
> |-
> || qemuarm64 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world/r=
ocko/log.world.qemuarm64.20171107_011415.log/ || http://errors.yoctoproje=
ct.org/Errors/Build/48214/
> |-
> || qemux86 	|| 28	 || http://logs.nslu2-linux.org/buildlogs/oe/world/ro=
cko/log.world.qemux86.20171106_001136.log/ || http://errors.yoctoproject.=
org/Errors/Build/48074/
> |-
> || qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/=
rocko/log.world.qemux86-64.20171107_022735.log/ || http://errors.yoctopro=
ject.org/Errors/Build/48213/
> |}
>
> =3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D
>
> =3D=3D=3D QA issues (367) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
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
> ||0	||version-going-backwards
> |-
> ||1	||host-user-contaminated
> |-
> ||1	||textrel
> |-
> ||365	||qa_pseudo
> |}
>
>
>
> =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.=
signatures.20171108_053111.log/
>
>
>     * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/worl=
d/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb <ht=
tp://uim_1.8.6.bb> RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildabl=
e providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy in=
 /home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>     * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/worl=
d/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb <ht=
tp://uim_1.8.6.bb> RDEPENDS on or otherwise requires it)
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildabl=
e providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in /ho=
me/jenkins/oe/world/shr-core/tmp-glibc/stamps
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNB=
LACKLIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-=
is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-qt5:
> PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazati=
on which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be =
tested so much"
> PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be t=
ested so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be t=
ested so much"
> PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be t=
ested so much"
> PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be =
tested so much"
> PNBLACKLIST[build-appliance-image] =3D "tries to include whole download=
s directory in /home/builder/poky :/"
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
> corosync-2.4.2: ELF binary '/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textr=
el]
>
>
> count: 0	issue: build-deps
>
>
> count: 0	issue: file-rdeps
>
>
> count: 0	issue: version-going-backwards
>
>
> count: 1	issue: host-user-contaminated
> qtbase-5.9.2+gitAUTOINC+ec16ba393b: qtbase: /qtbase-mkspecs/usr/lib/qt5=
/mkspecs/modules/qt_lib_testlib_private.pri is owned by uid 3004, which i=
s the same as the user running bitbake. This may be due to host contamina=
tion [host-user-contaminated]
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
> count: 365	issue: qa_pseudo
> alsa-plugins-1.1.4: This /work/core2-64-oe-linux/alsa-plugins/1.1.4-r0/=
pseudo/pseudo.log indicates 18 errors [qa_pseudo]
> apache2-2.4.27: This /work/aarch64-oe-linux/apache2/2.4.27-r0/pseudo/ps=
eudo.log indicates 7 errors [qa_pseudo]
> apache2-2.4.27: This /work/armv5te-oe-linux-gnueabi/apache2/2.4.27-r0/p=
seudo/pseudo.log indicates 7 errors [qa_pseudo]
> apache2-2.4.27: This /work/core2-64-oe-linux/apache2/2.4.27-r0/pseudo/p=
seudo.log indicates 8 errors [qa_pseudo]
> apr-1.6.2: This /work/core2-64-oe-linux/apr/1.6.2-r0/pseudo/pseudo.log =
indicates 12 errors [qa_pseudo]
> apr-util-1.6.0: This /work/aarch64-oe-linux/apr-util/1.6.0-r1/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
> aufs-util-4.4+gitAUTOINC+89afb1806c: This /work/core2-64-oe-linux/aufs-=
util/4.4+gitAUTOINC+89afb1806c-r0/pseudo/pseudo.log indicates 12 errors [=
qa_pseudo]
> autofs-5.1.2: This /work/aarch64-oe-linux/autofs/5.1.2-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
> babeltrace-1.5.3: This /work/aarch64-oe-linux/babeltrace/1.5.3-r0/pseud=
o/pseudo.log indicates 18 errors [qa_pseudo]
> babl-0.1.28: This /work/armv5te-oe-linux-gnueabi/babl/0.1.28-r0/pseudo/=
pseudo.log indicates 12 errors [qa_pseudo]
> bind-9.10.5-P3: This /work/core2-64-oe-linux/bind/9.10.5-P3-r0/pseudo/p=
seudo.log indicates 22 errors [qa_pseudo]
> blktrace-1.1.0+gitAUTOINC+43fc870ce0: This /work/aarch64-oe-linux/blktr=
ace/1.1.0+gitAUTOINC+43fc870ce0-r0/pseudo/pseudo.log indicates 7 errors [=
qa_pseudo]
> bluez5-5.47: This /work/aarch64-oe-linux/bluez5/5.47-r0/pseudo/pseudo.l=
og indicates 10 errors [qa_pseudo]
> bluez5-5.47: This /work/armv5te-oe-linux-gnueabi/bluez5/5.47-r0/pseudo/=
pseudo.log indicates 11 errors [qa_pseudo]
> bluez5-5.47: This /work/core2-64-oe-linux/bluez5/5.47-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
> breakpad-1.0+gitAUTOINC+dea867e76f_ec44c6c167_cb6dd4ef5f_a91633d172_324=
dd166b7: This /work/core2-64-oe-linux/breakpad/1_1.0+gitAUTOINC+dea867e76=
f_ec44c6c167_cb6dd4ef5f_a91633d172_324dd166b7-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]
> bzip2-1.0.6: This /work/armv5te-oe-linux-gnueabi/bzip2/1.0.6-r5/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
> chrony-2.4: This /work/aarch64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log=
 indicates 6 errors [qa_pseudo]
> chrony-2.4: This /work/armv5te-oe-linux-gnueabi/chrony/2.4-r0/pseudo/ps=
eudo.log indicates 6 errors [qa_pseudo]
> chrony-2.4: This /work/core2-64-oe-linux/chrony/2.4-r0/pseudo/pseudo.lo=
g indicates 6 errors [qa_pseudo]
> collectd-5.7.2: This /work/armv5te-oe-linux-gnueabi/collectd/5.7.2-r0/p=
seudo/pseudo.log indicates 20 errors [qa_pseudo]
> connman-gnome-0.7: This /work/aarch64-oe-linux/connman-gnome/0.7-r0/pse=
udo/pseudo.log indicates 18 errors [qa_pseudo]
> conntrack-tools-1.4.4: This /work/armv5te-oe-linux-gnueabi/conntrack-to=
ols/1.4.4-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
> console-tools-0.3.2: This /work/armv5te-oe-linux-gnueabi/console-tools/=
0.3.2-r8/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> coreutils-8.27: This /work/aarch64-oe-linux/coreutils/8.27-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
> ctdb-2.5.6: This /work/aarch64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log=
 indicates 6 errors [qa_pseudo]
> ctdb-2.5.6: This /work/armv5te-oe-linux-gnueabi/ctdb/2.5.6-r0/pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]
> cups-2.2.4: This /work/armv5te-oe-linux-gnueabi/cups/2.2.4-r0/pseudo/ps=
eudo.log indicates 16 errors [qa_pseudo]
> curlpp-0.8.1: This /work/aarch64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo=
=2Elog indicates 7 errors [qa_pseudo]
> curlpp-0.8.1: This /work/core2-64-oe-linux/curlpp/0.8.1-r0/pseudo/pseud=
o.log indicates 7 errors [qa_pseudo]
> dhcp-4.3.6: This /work/aarch64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log=
 indicates 12 errors [qa_pseudo]
> dhcp-4.3.6: This /work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.lo=
g indicates 12 errors [qa_pseudo]
> diffstat-1.61: This /work/core2-64-oe-linux/diffstat/1.61-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
> digitemp-3.7.1+gitAUTOINC+389f67655e: This /work/armv5te-oe-linux-gnuea=
bi/digitemp/3.7.1+gitAUTOINC+389f67655e-r0/pseudo/pseudo.log indicates 12=
 errors [qa_pseudo]
> directfb-examples-1.7.0: This /work/aarch64-oe-linux/directfb-examples/=
1.7.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> distcc-3.2: This /work/core2-64-oe-linux/distcc/3.2-r0/pseudo/pseudo.lo=
g indicates 18 errors [qa_pseudo]
> dmidecode-3.1: This /work/aarch64-oe-linux/dmidecode/3.1-r0/pseudo/pseu=
do.log indicates 6 errors [qa_pseudo]
> dovecot-2.2.29: This /work/aarch64-oe-linux/dovecot/2.2.29-r0/pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]
> dovecot-2.2.29: This /work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/p=
seudo/pseudo.log indicates 14 errors [qa_pseudo]
> dovecot-2.2.29: This /work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
> dracut-045+git39c9b67f86145953aa30def9d77c68597a4ccfe8: This /work/aarc=
h64-oe-linux/dracut/1_045+git39c9b67f86145953aa30def9d77c68597a4ccfe8-r0/=
pseudo/pseudo.log indicates 7 errors [qa_pseudo]
> ebtables-2.0.10-4: This /work/aarch64-oe-linux/ebtables/2.0.10-4-r4/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]
> ebtables-2.0.10-4: This /work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-=
4-r4/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
> ebtables-2.0.10-4: This /work/core2-64-oe-linux/ebtables/2.0.10-4-r4/ps=
eudo/pseudo.log indicates 6 errors [qa_pseudo]
> enca-1.9: This /work/armv5te-oe-linux-gnueabi/enca/1.9-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
> espeak-1.48.04: This /work/core2-64-oe-linux/espeak/1.48.04-r0/pseudo/p=
seudo.log indicates 6 errors [qa_pseudo]
> gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/aarch64-oe-linux/gateone/=
1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pse=
udo]
> gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/core2-64-oe-linux/gateone=
/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_ps=
eudo]
> geoclue-2.4.4: This /work/aarch64-oe-linux/geoclue/2.4.4-r0/pseudo/pseu=
do.log indicates 18 errors [qa_pseudo]
> geoclue-2.4.4: This /work/core2-64-oe-linux/geoclue/2.4.4-r0/pseudo/pse=
udo.log indicates 18 errors [qa_pseudo]
> gimp-2.8.22: This /work/core2-64-oe-linux/gimp/2.8.22-r0/pseudo/pseudo.=
log indicates 24 errors [qa_pseudo]
> git-2.13.3: This /work/armv5te-oe-linux-gnueabi/git/2.13.3-r0/pseudo/ps=
eudo.log indicates 7 errors [qa_pseudo]
> glib-2.0-2.52.3: This /work/armv5e-oe-linux-gnueabi/glib-2.0/1_2.52.3-r=
0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
> glibc-2.26: This /work/aarch64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log=
 indicates 6 errors [qa_pseudo]
> glibc-2.26: This /work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
> glibc-2.26: This /work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.lo=
g indicates 6 errors [qa_pseudo]
> glibc-locale-2.26: This /work/aarch64-oe-linux/glibc-locale/2.26-r0/pse=
udo/pseudo.log indicates 15 errors [qa_pseudo]
> glibc-locale-2.26: This /work/armv5e-oe-linux-gnueabi/glibc-locale/2.26=
-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> gobject-introspection-1.52.1: This /work/aarch64-oe-linux/gobject-intro=
spection/1.52.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
> gobject-introspection-1.52.1: This /work/core2-64-oe-linux/gobject-intr=
ospection/1.52.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
> gstreamer1.0-plugins-base-1.12.3: This /work/aarch64-oe-linux/gstreamer=
1.0-plugins-base/1.12.3-r0/pseudo/pseudo.log indicates 12 errors [qa_pseu=
do]
> icu-59.1: This /work/aarch64-oe-linux/icu/59.1-r0/pseudo/pseudo.log ind=
icates 7 errors [qa_pseudo]
> icu-59.1: This /work/armv5e-oe-linux-gnueabi/icu/59.1-r0/pseudo/pseudo.=
log indicates 6 errors [qa_pseudo]
> icu-59.1: This /work/core2-64-oe-linux/icu/59.1-r0/pseudo/pseudo.log in=
dicates 6 errors [qa_pseudo]
> iotop-0.6: This /work/armv5te-oe-linux-gnueabi/iotop/0.6-r0/pseudo/pseu=
do.log indicates 6 errors [qa_pseudo]
> ippool-1.3: This /work/armv5te-oe-linux-gnueabi/ippool/1.3-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
> ipsec-tools-0.8.2: This /work/qemuarm64-oe-linux/ipsec-tools/0.8.2-r0/p=
seudo/pseudo.log indicates 6 errors [qa_pseudo]
> iptables-1.6.1: This /work/aarch64-oe-linux/iptables/1.6.1-r0/pseudo/ps=
eudo.log indicates 6 errors [qa_pseudo]
> ipvsadm-1.26: This /work/aarch64-oe-linux/ipvsadm/1.26-r0/pseudo/pseudo=
=2Elog indicates 11 errors [qa_pseudo]
> jansson-2.9: This /work/aarch64-oe-linux/jansson/2.9-r0/pseudo/pseudo.l=
og indicates 12 errors [qa_pseudo]
> jansson-2.9: This /work/core2-64-oe-linux/jansson/2.9-r0/pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
> lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/aarch64-oe-linux/lcdpro=
c/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [q=
a_pseudo]
> lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueab=
i/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 e=
rrors [qa_pseudo]
> lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/core2-64-oe-linux/lcdpr=
oc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [=
qa_pseudo]
> leptonica-1.74.4: This /work/core2-64-oe-linux/leptonica/1.74.4-r0/pseu=
do/pseudo.log indicates 12 errors [qa_pseudo]
> libart-lgpl-2.3.21: This /work/armv5te-oe-linux-gnueabi/libart-lgpl/2.3=
=2E21-r2/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linux=
/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicate=
s 8 errors [qa_pseudo]
> libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux=
-gnueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log =
indicates 14 errors [qa_pseudo]
> libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linu=
x/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicat=
es 6 errors [qa_pseudo]
> libevent-2.1.8: This /work/aarch64-oe-linux/libevent/2.1.8-r0/pseudo/ps=
eudo.log indicates 12 errors [qa_pseudo]
> libfontenc-1.1.3: This /work/aarch64-oe-linux/libfontenc/1_1.1.3-r0/pse=
udo/pseudo.log indicates 6 errors [qa_pseudo]
> libhugetlbfs-2.20: This /work/aarch64-oe-linux/libhugetlbfs/1_2.20-r0/p=
seudo/pseudo.log indicates 6 errors [qa_pseudo]
> libice-1.0.9: This /work/aarch64-oe-linux/libice/1_1.0.9-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
> libice-1.0.9: This /work/armv5te-oe-linux-gnueabi/libice/1_1.0.9-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]
> libnetfilter-queue-1.0.2+git981025e103d887fb6a9c9bb49c74ec323108d098: T=
his /work/armv5te-oe-linux-gnueabi/libnetfilter-queue/1.0.2+git981025e103=
d887fb6a9c9bb49c74ec323108d098-r0/pseudo/pseudo.log indicates 12 errors [=
qa_pseudo]
> libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/aarch64-oe-linux/libq=
ofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 14 error=
s [qa_pseudo]
> libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnue=
abi/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates =
20 errors [qa_pseudo]
> libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/lib=
qofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 14 erro=
rs [qa_pseudo]
> libraw1394-2.1.2: This /work/aarch64-oe-linux/libraw1394/2.1.2-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
> libreport-2.9.2: This /work/core2-64-oe-linux/libreport/2.9.2-r0/pseudo=
/pseudo.log indicates 13 errors [qa_pseudo]
> libsrtp-1.5.2: This /work/aarch64-oe-linux/libsrtp/1.5.2-r0/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
> libssh2-1.8.0: This /work/aarch64-oe-linux/libssh2/1.8.0-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
> libtdb-1.3.14: This /work/aarch64-oe-linux/libtdb/1.3.14-r0/pseudo/pseu=
do.log indicates 11 errors [qa_pseudo]
> libtimedate-perl-2.30: This /work/armv5te-oe-linux-gnueabi/libtimedate-=
perl/2.30-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> libtool-cross-2.4.6: This /work/aarch64-oe-linux/libtool-cross/2.4.6-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
> libtool-cross-2.4.6: This /work/armv5te-oe-linux-gnueabi/libtool-cross/=
2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
> libtool-cross-2.4.6: This /work/core2-64-oe-linux/libtool-cross/2.4.6-r=
0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
> libva-utils-1.8.3: This /work/armv5te-oe-linux-gnueabi/libva-utils/1.8.=
3-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
> libvncserver-0.9.11: This /work/aarch64-oe-linux/libvncserver/0.9.11-r0=
/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
> libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0=
=2E9.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
> libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r=
0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
> libwmf-0.2.8.4: This /work/aarch64-oe-linux/libwmf/0.2.8.4-r3/pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]
> libwmf-0.2.8.4: This /work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/p=
seudo/pseudo.log indicates 10 errors [qa_pseudo]
> libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/p=
seudo.log indicates 13 errors [qa_pseudo]
> linux-atm-2.5.2: This /work/qemuarm-oe-linux-gnueabi/linux-atm/2.5.2-r0=
/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> linux-atm-2.5.2: This /work/qemux86_64-oe-linux/linux-atm/2.5.2-r0/pseu=
do/pseudo.log indicates 12 errors [qa_pseudo]
> linux-libc-headers-4.12: This /work/armv5te-oe-linux-gnueabi/linux-libc=
-headers/4.12-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
> lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/=
pseudo.log indicates 12 errors [qa_pseudo]
> lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
> llvm-5.0: This /work/aarch64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log ind=
icates 12 errors [qa_pseudo]
> llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log in=
dicates 7 errors [qa_pseudo]
> log4cpp-1.1.2: This /work/aarch64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseu=
do.log indicates 7 errors [qa_pseudo]
> log4cpp-1.1.2: This /work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pse=
udo/pseudo.log indicates 7 errors [qa_pseudo]
> log4cpp-1.1.2: This /work/core2-64-oe-linux/log4cpp/1.1.2-r0/pseudo/pse=
udo.log indicates 6 errors [qa_pseudo]
> logrotate-3.12.3: This /work/armv5te-oe-linux-gnueabi/logrotate/3.12.3-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> lowpan-tools-0.3.1+gitAUTOINC+38f42dbfce: This /work/aarch64-oe-linux/l=
owpan-tools/0.3.1+gitAUTOINC+38f42dbfce-r0/pseudo/pseudo.log indicates 12=
 errors [qa_pseudo]
> lttng-tools-2.9.5: This /work/aarch64-oe-linux/lttng-tools/2.9.5-r0/pse=
udo/pseudo.log indicates 10 errors [qa_pseudo]
> lttng-tools-2.9.5: This /work/armv5te-oe-linux-gnueabi/lttng-tools/2.9.=
5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
> lttng-tools-2.9.5: This /work/core2-64-oe-linux/lttng-tools/2.9.5-r0/ps=
eudo/pseudo.log indicates 20 errors [qa_pseudo]
> makedevs-1.0.1: This /work/core2-64-oe-linux/makedevs/1.0.1-r0/pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
> maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-o=
e-linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseu=
do/pseudo.log indicates 11 errors [qa_pseudo]
> maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-=
oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
> mariadb-5.5.57: This /work/aarch64-oe-linux/mariadb/5.5.57-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
> mariadb-5.5.57: This /work/armv5e-oe-linux-gnueabi/mariadb/5.5.57-r0/ps=
eudo/pseudo.log indicates 10 errors [qa_pseudo]
> mc-4.8.19: This /work/aarch64-oe-linux/mc/4.8.19-r0/pseudo/pseudo.log i=
ndicates 12 errors [qa_pseudo]
> mc-4.8.19: This /work/armv5te-oe-linux-gnueabi/mc/4.8.19-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
> md5deep-4.4: This /work/aarch64-oe-linux/md5deep/4.4-r0/pseudo/pseudo.l=
og indicates 14 errors [qa_pseudo]
> monkey-1.5.6: This /work/armv5te-oe-linux-gnueabi/monkey/1.5.6-r0/pseud=
o/pseudo.log indicates 12 errors [qa_pseudo]
> mosquitto-1.4.14: This /work/aarch64-oe-linux/mosquitto/1.4.14-r0/pseud=
o/pseudo.log indicates 6 errors [qa_pseudo]
> mosquitto-1.4.14: This /work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> mosquitto-1.4.14: This /work/core2-64-oe-linux/mosquitto/1.4.14-r0/pseu=
do/pseudo.log indicates 6 errors [qa_pseudo]
> mozilla-devscripts-0.30: This /work/aarch64-oe-linux/mozilla-devscripts=
/0.30-r1/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> mozilla-devscripts-0.30: This /work/core2-64-oe-linux/mozilla-devscript=
s/0.30-r1/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> mpich-3.2: This /work/core2-64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log =
indicates 6 errors [qa_pseudo]
> mtd-utils-2.0.0: This /work/aarch64-oe-linux/mtd-utils/2.0.0-r0/pseudo/=
pseudo.log indicates 6 errors [qa_pseudo]
> net-snmp-5.7.3: This /work/aarch64-oe-linux/net-snmp/5.7.3-r0/pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]
> net-snmp-5.7.3: This /work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/p=
seudo/pseudo.log indicates 13 errors [qa_pseudo]
> net-snmp-5.7.3: This /work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/p=
seudo.log indicates 12 errors [qa_pseudo]
> nftables-0.7: This /work/aarch64-oe-linux/nftables/0.7-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
> nginx-1.12.1: This /work/armv5te-oe-linux-gnueabi/nginx/1.12.1-r0/pseud=
o/pseudo.log indicates 6 errors [qa_pseudo]
> nginx-1.12.1: This /work/core2-64-oe-linux/nginx/1.12.1-r0/pseudo/pseud=
o.log indicates 14 errors [qa_pseudo]
> nspr-4.16: This /work/armv5te-oe-linux-gnueabi/nspr/4.16-r0/pseudo/pseu=
do.log indicates 6 errors [qa_pseudo]
> nss-3.31.1: This /work/aarch64-oe-linux/nss/3.31.1-r0/pseudo/pseudo.log=
 indicates 14 errors [qa_pseudo]
> ntfs-3g-ntfsprogs-2017.3.23: This /work/armv5te-oe-linux-gnueabi/ntfs-3=
g-ntfsprogs/2017.3.23-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo=
]
> ntp-4.2.8p10: This /work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseud=
o/pseudo.log indicates 13 errors [qa_pseudo]
> ntp-4.2.8p10: This /work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseud=
o.log indicates 13 errors [qa_pseudo]
> openhpi-3.6.1: This /work/armv5te-oe-linux-gnueabi/openhpi/3.6.1-r0/pse=
udo/pseudo.log indicates 13 errors [qa_pseudo]
> openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pse=
udo.log indicates 14 errors [qa_pseudo]
> openl2tp-1.8: This /work/core2-64-oe-linux/openl2tp/1.8-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
> openldap-2.4.45: This /work/core2-64-oe-linux/openldap/2.4.45-r0/pseudo=
/pseudo.log indicates 6 errors [qa_pseudo]
> opensaf-5.17.07: This /work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/=
pseudo.log indicates 19 errors [qa_pseudo]
> opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0=
/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
> opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo=
/pseudo.log indicates 20 errors [qa_pseudo]
> openssh-7.5p1: This /work/aarch64-oe-linux/openssh/7.5p1-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
> openssh-7.5p1: This /work/core2-64-oe-linux/openssh/7.5p1-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
> ossp-uuid-1.6.2: This /work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2=
/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
> ossp-uuid-1.6.2: This /work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo=
/pseudo.log indicates 7 errors [qa_pseudo]
> perf-1.0: This /work/qemuarm64-oe-linux/perf/1.0-r9/pseudo/pseudo.log i=
ndicates 11 errors [qa_pseudo]
> perf-1.0: This /work/qemuarm-oe-linux-gnueabi/perf/1.0-r9/pseudo/pseudo=
=2Elog indicates 10 errors [qa_pseudo]
> perl-5.24.1: This /work/aarch64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.l=
og indicates 4 errors [qa_pseudo]
> perl-5.24.1: This /work/armv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/=
pseudo.log indicates 5 errors [qa_pseudo]
> perl-5.24.1: This /work/core2-64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.=
log indicates 11 errors [qa_pseudo]
> php-7.1.9: This /work/aarch64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log i=
ndicates 15 errors [qa_pseudo]
> php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseud=
o.log indicates 13 errors [qa_pseudo]
> php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log =
indicates 14 errors [qa_pseudo]
> pidgin-2.12.0: This /work/core2-64-oe-linux/pidgin/2.12.0-r0/pseudo/pse=
udo.log indicates 10 errors [qa_pseudo]
> pm-qa-0.5.2: This /work/aarch64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.l=
og indicates 32 errors [qa_pseudo]
> pm-qa-0.5.2: This /work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/=
pseudo.log indicates 39 errors [qa_pseudo]
> pm-qa-0.5.2: This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.=
log indicates 52 errors [qa_pseudo]
> portaudio-v19-v190600: This /work/aarch64-oe-linux/portaudio-v19/v19060=
0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> portaudio-v19-v190600: This /work/core2-64-oe-linux/portaudio-v19/v1906=
00-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> postfix-3.2.2: This /work/aarch64-oe-linux/postfix/3.2.2-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
> postfix-3.2.2: This /work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pse=
udo/pseudo.log indicates 12 errors [qa_pseudo]
> postfix-3.2.2: This /work/core2-64-oe-linux/postfix/3.2.2-r0/pseudo/pse=
udo.log indicates 12 errors [qa_pseudo]
> postgresql-9.4.14: This /work/aarch64-oe-linux/postgresql/9.4.14-r0/pse=
udo/pseudo.log indicates 14 errors [qa_pseudo]
> postgresql-9.4.14: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.14=
-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
> postgresql-9.4.14: This /work/core2-64-oe-linux/postgresql/9.4.14-r0/ps=
eudo/pseudo.log indicates 13 errors [qa_pseudo]
> ppp-2.4.7: This /work/armv5te-oe-linux-gnueabi/ppp/2.4.7-r0/pseudo/pseu=
do.log indicates 12 errors [qa_pseudo]
> proftpd-1.3.6: This /work/aarch64-oe-linux/proftpd/1.3.6-r0/pseudo/pseu=
do.log indicates 14 errors [qa_pseudo]
> proftpd-1.3.6: This /work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/pse=
udo/pseudo.log indicates 14 errors [qa_pseudo]
> pyrtm-0.4.2: This /work/core2-64-oe-linux/pyrtm/0.4.2-r0/pseudo/pseudo.=
log indicates 6 errors [qa_pseudo]
> python-2.7.13: This /work/aarch64-oe-linux/python/2.7.13-r1/pseudo/pseu=
do.log indicates 4 errors [qa_pseudo]
> python-2.7.13: This /work/armv5te-oe-linux-gnueabi/python/2.7.13-r1/pse=
udo/pseudo.log indicates 4 errors [qa_pseudo]
> python-2.7.13: This /work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pse=
udo.log indicates 5 errors [qa_pseudo]
> python3-3.5.3: This /work/aarch64-oe-linux/python3/3.5.3-r1.0/pseudo/ps=
eudo.log indicates 11 errors [qa_pseudo]
> python3-3.5.3: This /work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/p=
seudo/pseudo.log indicates 7 errors [qa_pseudo]
> python3-3.5.3: This /work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/p=
seudo.log indicates 7 errors [qa_pseudo]
> python3-babel-2.5.1: This /work/armv5te-oe-linux-gnueabi/python3-babel/=
2.5.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-bcrypt-3.1.3: This /work/aarch64-oe-linux/python3-bcrypt/3.1.3-=
r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> python3-beautifulsoup4-4.6.0: This /work/aarch64-oe-linux/python3-beaut=
ifulsoup4/4.6.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> python3-chardet-3.0.4: This /work/aarch64-oe-linux/python3-chardet/3.0.=
4-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
> python3-django-1.11.5: This /work/core2-64-oe-linux/python3-django/1.11=
=2E5-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-flask-0.12.2: This /work/armv5te-oe-linux-gnueabi/python3-flask=
/0.12.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-greenlet-0.4.12: This /work/aarch64-oe-linux/python3-greenlet/0=
=2E4.12-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-ndg-httpsclient-0.4.3: This /work/aarch64-oe-linux/python3-ndg-=
httpsclient/0.4.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-numpy-1.13.3: This /work/armv5te-oe-linux-gnueabi/python3-numpy=
/1.13.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
> python3-pretend-1.0.8: This /work/core2-64-oe-linux/python3-pretend/1.0=
=2E8-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-psutil-5.3.1: This /work/aarch64-oe-linux/python3-psutil/5.3.1-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-ptyprocess-0.5.2: This /work/core2-64-oe-linux/python3-ptyproce=
ss/0.5.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> python3-pylint-1.7.4: This /work/aarch64-oe-linux/python3-pylint/1.7.4-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-pylint-1.7.4: This /work/core2-64-oe-linux/python3-pylint/1.7.4=
-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-pyserial-3.4: This /work/aarch64-oe-linux/python3-pyserial/3.4-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-six-1.11.0: This /work/aarch64-oe-linux/python3-six/1.11.0-r0/p=
seudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-twisted-17.9.0: This /work/aarch64-oe-linux/python3-twisted/17.=
9.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
> python3-twisted-17.9.0: This /work/armv5te-oe-linux-gnueabi/python3-twi=
sted/17.9.0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
> python3-twisted-17.9.0: This /work/core2-64-oe-linux/python3-twisted/17=
=2E9.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python3-webencodings-0.5.1: This /work/aarch64-oe-linux/python3-webenco=
dings/0.5.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-chardet-3.0.4: This /work/aarch64-oe-linux/python-chardet/3.0.4-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-cpuset-1.5.7: This /work/aarch64-oe-linux/python-cpuset/1.5.7-r0=
/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> python-cson-git: This /work/armv5te-oe-linux-gnueabi/python-cson/git-r0=
/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-cython-0.27.1: This /work/armv5te-oe-linux-gnueabi/python-cython=
/0.27.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-django-1.11.5: This /work/core2-64-oe-linux/python-django/1.11.5=
-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-pbr-3.1.1: This /work/core2-64-oe-linux/python-pbr/3.1.1-r0/pseu=
do/pseudo.log indicates 6 errors [qa_pseudo]
> python-pep8-1.7.0: This /work/aarch64-oe-linux/python-pep8/1.7.0-r0/pse=
udo/pseudo.log indicates 6 errors [qa_pseudo]
> python-pylint-1.7.4: This /work/aarch64-oe-linux/python-pylint/1.7.4-r0=
/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-pylint-1.7.4: This /work/armv5te-oe-linux-gnueabi/python-pylint/=
1.7.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-pylint-1.7.4: This /work/core2-64-oe-linux/python-pylint/1.7.4-r=
0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-pyro4-4.62: This /work/aarch64-oe-linux/python-pyro4/4.62-r0/pse=
udo/pseudo.log indicates 6 errors [qa_pseudo]
> python-pyro4-4.62: This /work/armv5te-oe-linux-gnueabi/python-pyro4/4.6=
2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-pyro4-4.62: This /work/core2-64-oe-linux/python-pyro4/4.62-r0/ps=
eudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-pyserial-3.4: This /work/armv5te-oe-linux-gnueabi/python-pyseria=
l/3.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-pyudev-0.21.0: This /work/core2-64-oe-linux/python-pyudev/0.21.0=
-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> python-scons-3.0.0: This /work/core2-64-oe-linux/python-scons/3.0.0-r0/=
pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-unidiff-0.5.4: This /work/aarch64-oe-linux/python-unidiff/0.5.4-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-vobject-0.9.5: This /work/aarch64-oe-linux/python-vobject/0.9.5-=
r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
> python-xlrd-1.1.0: This /work/core2-64-oe-linux/python-xlrd/1.1.0-r0/ps=
eudo/pseudo.log indicates 6 errors [qa_pseudo]
> pywbem-0.8.0: This /work/core2-64-oe-linux/pywbem/0.8.0-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
> qsiv-1.1: This /work/armv5te-oe-linux-gnueabi/qsiv/1.1-r0/pseudo/pseudo=
=2Elog indicates 6 errors [qa_pseudo]
> qt3d-5.9.2+gitAUTOINC+143b721249: This /work/aarch64-oe-linux/qt3d/5.9.=
2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 13 errors [qa_pseu=
do]
> qt3d-5.9.2+gitAUTOINC+143b721249: This /work/armv5te-oe-linux-gnueabi/q=
t3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
> qt3d-5.9.2+gitAUTOINC+143b721249: This /work/core2-64-oe-linux/qt3d/5.9=
=2E2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 13 errors [qa_p=
seudo]
> qt5-creator-3.5.1: This /work/aarch64-oe-linux/qt5-creator/3.5.1-r0/pse=
udo/pseudo.log indicates 19 errors [qa_pseudo]
> qt5-creator-3.5.1: This /work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.=
1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> qt5-creator-3.5.1: This /work/core2-64-oe-linux/qt5-creator/3.5.1-r0/ps=
eudo/pseudo.log indicates 12 errors [qa_pseudo]
> qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/aarch64-oe-linux/qtbase/=
5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 768 errors [qa=
_pseudo]
> qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/armv5te-oe-linux-gnueabi=
/qtbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 13 err=
ors [qa_pseudo]
> qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/core2-64-oe-linux/qtbase=
/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 11 errors [qa=
_pseudo]
> qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/aarch64-oe-linux/qtcha=
rts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 12 errors =
[qa_pseudo]
> qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/armv5te-oe-linux-gnuea=
bi/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 14=
 errors [qa_pseudo]
> qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/core2-64-oe-linux/qtch=
arts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 13 errors=
 [qa_pseudo]
> qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/aarch64-oe-linux=
/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicate=
s 13 errors [qa_pseudo]
> qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/core2-64-oe-linu=
x/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicat=
es 12 errors [qa_pseudo]
> qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/aarch64-oe-linux/qt=
datavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 13 e=
rrors [qa_pseudo]
> qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/core2-64-oe-linux/q=
tdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 13 =
errors [qa_pseudo]
> qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/aarch64-oe-linux/=
qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates =
30 errors [qa_pseudo]
> qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/armv5te-oe-linux-=
gnueabi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log in=
dicates 19 errors [qa_pseudo]
> qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/core2-64-oe-linux=
/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates=
 20 errors [qa_pseudo]
> qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/aarch64-oe-linux/qten=
ginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
> qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnue=
abi/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates =
14 errors [qa_pseudo]
> qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/core2-64-oe-linux/qte=
nginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 10 erro=
rs [qa_pseudo]
> qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/aarch64-oe-linux/qtga=
mepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
> qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/armv5te-oe-linux-gnue=
abi/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates =
13 errors [qa_pseudo]
> qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/core2-64-oe-linux/qtg=
amepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 12 erro=
rs [qa_pseudo]
> qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/aarch64-o=
e-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseud=
o.log indicates 15 errors [qa_pseudo]
> qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/armv5te-o=
e-linux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseu=
do/pseudo.log indicates 12 errors [qa_pseudo]
> qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/core2-64-=
oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseu=
do.log indicates 19 errors [qa_pseudo]
> qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/aarch64-oe-linux/q=
tmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 16=
 errors [qa_pseudo]
> qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/armv5te-oe-linux-g=
nueabi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indi=
cates 13 errors [qa_pseudo]
> qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/core2-64-oe-linux/=
qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 1=
3 errors [qa_pseudo]
> qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/armv5te-oe-linux-=
gnueabi/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log in=
dicates 16 errors [qa_pseudo]
> qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/core2-64-oe-linux=
/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates=
 7 errors [qa_pseudo]
> qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/aarch64-oe-linux/qtqui=
ck1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 19 errors =
[qa_pseudo]
> qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/armv5te-oe-linux-gnuea=
bi/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 31=
 errors [qa_pseudo]
> qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/aarch64-oe-lin=
ux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indi=
cates 13 errors [qa_pseudo]
> qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/armv5te-oe-lin=
ux-gnueabi/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.=
log indicates 13 errors [qa_pseudo]
> qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/core2-64-oe-li=
nux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log ind=
icates 13 errors [qa_pseudo]
> qtquickcontrols-5.9.2+gitAUTOINC+8476f8fff7: This /work/armv5te-oe-linu=
x-gnueabi/qtquickcontrols/5.9.2+gitAUTOINC+8476f8fff7-r0/pseudo/pseudo.lo=
g indicates 13 errors [qa_pseudo]
> qtquickcontrols-5.9.2+gitAUTOINC+8476f8fff7: This /work/core2-64-oe-lin=
ux/qtquickcontrols/5.9.2+gitAUTOINC+8476f8fff7-r0/pseudo/pseudo.log indic=
ates 14 errors [qa_pseudo]
> qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/aarch64-oe-linu=
x/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indica=
tes 14 errors [qa_pseudo]
> qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/armv5te-oe-linu=
x-gnueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.lo=
g indicates 10 errors [qa_pseudo]
> qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/core2-64-oe-lin=
ux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indic=
ates 13 errors [qa_pseudo]
> qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/aarch64-oe-linux/qtscr=
ipt/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 20 errors =
[qa_pseudo]
> qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/armv5e-oe-linux-gnueab=
i/qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 14 =
errors [qa_pseudo]
> qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/core2-64-oe-linux/qtsc=
ript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 13 errors=
 [qa_pseudo]
> qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/armv5te-oe-linux-gnueab=
i/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 e=
rrors [qa_pseudo]
> qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/core2-64-oe-linux/qtscx=
ml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 15 errors [=
qa_pseudo]
> qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/aarch64-oe-linux/qtse=
nsors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
> qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/armv5te-oe-linux-gnue=
abi/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates =
12 errors [qa_pseudo]
> qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/core2-64-oe-linux/qts=
ensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 12 erro=
rs [qa_pseudo]
> qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/aarch64-oe-linux/qt=
serialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 16 e=
rrors [qa_pseudo]
> qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/armv5te-oe-linux-gn=
ueabi/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indica=
tes 12 errors [qa_pseudo]
> qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/core2-64-oe-linux/q=
tserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 14 =
errors [qa_pseudo]
> qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/aarch64-oe-linux/q=
tserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 6 =
errors [qa_pseudo]
> qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/armv5te-oe-linux-g=
nueabi/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indi=
cates 13 errors [qa_pseudo]
> qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/core2-64-oe-linux/=
qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 6=
 errors [qa_pseudo]
> qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/aarch64-oe-linux/qtsvg/5.=
9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 13 errors [qa_ps=
eudo]
> qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/armv5te-oe-linux-gnueabi/=
qtsvg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
> qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/core2-64-oe-linux/qtsvg/5=
=2E9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 15 errors [qa=
_pseudo]
> qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/aarch64-oe-linux/qtsy=
stems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
> qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/armv5te-oe-linux-gnue=
abi/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates =
12 errors [qa_pseudo]
> qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/core2-64-oe-linux/qts=
ystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 11 erro=
rs [qa_pseudo]
> qttools-5.9.2+gitAUTOINC+90a701032e: This /work/aarch64-oe-linux/qttool=
s/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 12 errors [q=
a_pseudo]
> qttools-5.9.2+gitAUTOINC+90a701032e: This /work/armv5te-oe-linux-gnueab=
i/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 17 e=
rrors [qa_pseudo]
> qttools-5.9.2+gitAUTOINC+90a701032e: This /work/core2-64-oe-linux/qttoo=
ls/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 13 errors [=
qa_pseudo]
> qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/aarch64-oe-linux/qtwa=
yland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 13 error=
s [qa_pseudo]
> qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/armv5te-oe-linux-gnue=
abi/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates =
12 errors [qa_pseudo]
> qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/core2-64-oe-linux/qtw=
ayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 14 erro=
rs [qa_pseudo]
> qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/aarch64-oe-linux/q=
twebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 13=
 errors [qa_pseudo]
> qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/armv5te-oe-linux-g=
nueabi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indi=
cates 6 errors [qa_pseudo]
> qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/core2-64-oe-linux/=
qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 7=
 errors [qa_pseudo]
> qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/aarch64-=
oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pse=
udo.log indicates 15 errors [qa_pseudo]
> qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/core2-64=
-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/ps=
eudo.log indicates 14 errors [qa_pseudo]
> qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/aarch64-oe-linux/qtweb=
kit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 13 errors =
[qa_pseudo]
> qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueab=
i/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 14 =
errors [qa_pseudo]
> qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwe=
bkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 12 errors=
 [qa_pseudo]
> qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This /work/aarch64-oe-li=
nux/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log in=
dicates 18 errors [qa_pseudo]
> qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This /work/armv5te-oe-li=
nux-gnueabi/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/pseudo/pseud=
o.log indicates 18 errors [qa_pseudo]
> qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/aarch64-oe-linux/q=
twebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 13=
 errors [qa_pseudo]
> qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/armv5te-oe-linux-g=
nueabi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indi=
cates 13 errors [qa_pseudo]
> qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/core2-64-oe-linux/=
qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 1=
2 errors [qa_pseudo]
> qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/aarch64-oe-linux/qtwe=
bview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 9 errors=
 [qa_pseudo]
> qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/core2-64-oe-linux/qtw=
ebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 9 error=
s [qa_pseudo]
> qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/aarch64-oe-linux/qt=
x11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 7 er=
rors [qa_pseudo]
> qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/armv5te-oe-linux-gn=
ueabi/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indica=
tes 8 errors [qa_pseudo]
> qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/core2-64-oe-linux/q=
tx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 7 e=
rrors [qa_pseudo]
> qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/aarch64-oe-linux/=
qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates =
11 errors [qa_pseudo]
> qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/armv5te-oe-linux-=
gnueabi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log in=
dicates 24 errors [qa_pseudo]
> qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/core2-64-oe-linux=
/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates=
 11 errors [qa_pseudo]
> quagga-1.2.1: This /work/core2-64-oe-linux/quagga/1.2.1-r0/pseudo/pseud=
o.log indicates 14 errors [qa_pseudo]
> rabbitmq-c-0.7.0: This /work/core2-64-oe-linux/rabbitmq-c/0.7.0-r0/pseu=
do/pseudo.log indicates 6 errors [qa_pseudo]
> radvd-2.17: This /work/aarch64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log=
 indicates 5 errors [qa_pseudo]
> radvd-2.17: This /work/armv5te-oe-linux-gnueabi/radvd/2.17-r0/pseudo/ps=
eudo.log indicates 13 errors [qa_pseudo]
> radvd-2.17: This /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.lo=
g indicates 7 errors [qa_pseudo]
> readline-7.0: This /work/core2-64-oe-linux/readline/7.0-r0/pseudo/pseud=
o.log indicates 12 errors [qa_pseudo]
> rsyslog-8.29.0: This /work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/ps=
eudo.log indicates 10 errors [qa_pseudo]
> rsyslog-8.29.0: This /work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/p=
seudo/pseudo.log indicates 11 errors [qa_pseudo]
> rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/p=
seudo.log indicates 10 errors [qa_pseudo]
> ruli-0.36: This /work/armv5te-oe-linux-gnueabi/ruli/0.36-r0/pseudo/pseu=
do.log indicates 16 errors [qa_pseudo]
> rygel-0.34.0: This /work/aarch64-oe-linux/rygel/0.34.0-r0/pseudo/pseudo=
=2Elog indicates 10 errors [qa_pseudo]
> samba-4.6.7: This /work/armv5te-oe-linux-gnueabi/samba/4.6.7-r0/pseudo/=
pseudo.log indicates 10 errors [qa_pseudo]
> samba-4.6.7: This /work/core2-64-oe-linux/samba/4.6.7-r0/pseudo/pseudo.=
log indicates 10 errors [qa_pseudo]
> sbc-1.3: This /work/aarch64-oe-linux/sbc/1.3-r0/pseudo/pseudo.log indic=
ates 6 errors [qa_pseudo]
> screen-4.6.1: This /work/aarch64-oe-linux/screen/4.6.1-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
> sed-4.2.2: This /work/aarch64-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log i=
ndicates 4 errors [qa_pseudo]
> shadow-4.2.1: This /work/core2-64-oe-linux/shadow/4.2.1-r0/pseudo/pseud=
o.log indicates 5 errors [qa_pseudo]
> squid-3.5.26: This /work/aarch64-oe-linux/squid/3.5.26-r0/pseudo/pseudo=
=2Elog indicates 12 errors [qa_pseudo]
> sthttpd-2.27.1: This /work/aarch64-oe-linux/sthttpd/2.27.1-r0/pseudo/ps=
eudo.log indicates 7 errors [qa_pseudo]
> sthttpd-2.27.1: This /work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/p=
seudo/pseudo.log indicates 7 errors [qa_pseudo]
> sthttpd-2.27.1: This /work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/p=
seudo.log indicates 7 errors [qa_pseudo]
> strace-4.18: This /work/aarch64-oe-linux/strace/4.18-r0/pseudo/pseudo.l=
og indicates 13 errors [qa_pseudo]
> strace-4.18: This /work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/=
pseudo.log indicates 13 errors [qa_pseudo]
> strace-4.18: This /work/core2-64-oe-linux/strace/4.18-r0/pseudo/pseudo.=
log indicates 13 errors [qa_pseudo]
> syslog-ng-3.8.1: This /work/aarch64-oe-linux/syslog-ng/3.8.1-r0/pseudo/=
pseudo.log indicates 13 errors [qa_pseudo]
> systemtap-3.1: This /work/aarch64-oe-linux/systemtap/3.1-r0/pseudo/pseu=
do.log indicates 8 errors [qa_pseudo]
> tcl-8.6.7: This /work/aarch64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log i=
ndicates 7 errors [qa_pseudo]
> tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log =
indicates 7 errors [qa_pseudo]
> tftp-hpa-5.2: This /work/aarch64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo=
=2Elog indicates 7 errors [qa_pseudo]
> tftp-hpa-5.2: This /work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseud=
o/pseudo.log indicates 7 errors [qa_pseudo]
> tftp-hpa-5.2: This /work/core2-64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseud=
o.log indicates 7 errors [qa_pseudo]
> udevil-0.4.4: This /work/aarch64-oe-linux/udevil/0.4.4-r0/pseudo/pseudo=
=2Elog indicates 18 errors [qa_pseudo]
> ufw-0.33: This /work/aarch64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log ind=
icates 7 errors [qa_pseudo]
> ufw-0.33: This /work/armv5te-oe-linux-gnueabi/ufw/0.33-r0/pseudo/pseudo=
=2Elog indicates 10 errors [qa_pseudo]
> ufw-0.33: This /work/core2-64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log in=
dicates 8 errors [qa_pseudo]
> util-linux-2.30: This /work/armv5te-oe-linux-gnueabi/util-linux/2.30-r0=
/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
> util-linux-2.30: This /work/core2-64-oe-linux/util-linux/2.30-r0/pseudo=
/pseudo.log indicates 4 errors [qa_pseudo]
> valgrind-3.13.0: This /work/core2-64-oe-linux/valgrind/3.13.0-r0/pseudo=
/pseudo.log indicates 7 errors [qa_pseudo]
> vboxguestdrivers-5.1.26: This /work/qemux86_64-oe-linux/vboxguestdriver=
s/5.1.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> wavpack-4.60.1: This /work/armv5te-oe-linux-gnueabi/wavpack/4.60.1-r0/p=
seudo/pseudo.log indicates 12 errors [qa_pseudo]
> wvdial-1.61: This /work/core2-64-oe-linux/wvdial/1.61-r0/pseudo/pseudo.=
log indicates 12 errors [qa_pseudo]
> xcb-util-keysyms-0.4.0: This /work/aarch64-oe-linux/xcb-util-keysyms/0.=
4.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> xfce4-eyes-plugin-4.4.5: This /work/core2-64-oe-linux/xfce4-eyes-plugin=
/4.4.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
> xfce4-session-4.12.1: This /work/core2-64-oe-linux/xfce4-session/4.12.1=
-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
> xfsprogs-4.12.0: This /work/core2-64-oe-linux/xfsprogs/4.12.0-r0/pseudo=
/pseudo.log indicates 6 errors [qa_pseudo]
> xkeyboard-config-2.21: This /work/aarch64-oe-linux/xkeyboard-config/2.2=
1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
> zeromq-4.1.6: This /work/armv5te-oe-linux-gnueabi/zeromq/4.1.6-r0/pseud=
o/pseudo.log indicates 6 errors [qa_pseudo]
>
>
>
> This git log matches with the metadata as seen by qemuarm build.
> In some cases qemux86 and qemux86-64 builds are built with slightly
> different metadata, you can see the exact version near the top of each
> log.world.qemu* files linked from the report
>
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> latest upstream commit:=20
> cc420f4 tests/fetch: skip network tests the idiomatic way
> not included in master yet:=20
> a51418c world-image: add extra target
> 7096a8d fetch2: Allow Fetch.download() to warn instead of error
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
> latest upstream commit:=20
> 73c6f85 lib/oe/sstatesig: fix wildcard matching wrong task signature fi=
les
> not included in master yet:=20
> 110e503 systemd: Fix build on musl
> 9451a8b systemd: Fix build with musl/mips64
> 37dd08a report-error: Allow to upload reports automatically
> 9c40bfb buildhistory.bbclass: metadata-revs show repo parent
> a72375b metadata-revs: provide more information
> d1a3571 qemux86: Add identical qemux86copy variant for tests
> b985ffd reproducible_build.bbclass: initial support for binary reproduc=
ibility
> dec1252 cpio: provide cpio-replacement-native
> 95bde9d image_types.bbclass: improve cpio image reproducibility
> f239f9e rootfs-postcommands.bbclass: support binary reproducibility
> 3830ead sstate.bbclass: Do not cause build failures due to setscene err=
ors
> c3a5c9a insane.bbclass: Add do_qa_pseudo function to check for common e=
rrors listed in pseudo.log
> 928201f libsdl2: allow to build native and nativesdk
> b3032b4 libdrm: allow to build native and nativesdk
> 82a93f3 nativesdk-mesa,mesa-native: add new recipe to build small part =
of mesa
> 6a58f45 libepoxy: add support for native(sdk)
> c065381 libjpeg-turbo: provide nativesdk version
> 7bcf920 virglrenderer: add new recipe
> c50ff33 virglrenderer: fix target build
> a34ab83 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
> 3a43735 insane.bbclass: use package_qa_handle_error for do_qa_pseudo
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
> latest upstream commit:=20
> 5d6d21e libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
> not included in master yet:=20
> ebcef48 bridge-utils: modify the AR to cross toolchain
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> latest upstream commit:=20
> d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order =
call
> not included in master yet:=20
> 197811b qtwebengine: make test suite succeed
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D=

> latest upstream commit:=20
> 26d5066 firefox: fix build failures
> not included in master yet:=20
> 6773bf9 meta: drop ${COREBASE}/LICENSE references
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D REPORT STO=
P =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
> sending incremental file list
>
>


--------------897542E8F61BDF3B89CD4C19
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/08/2017 11:05 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQedk4yWUWmG9XkZaAf8XemfxzyTh35TYjdPwjgdpqk5Bw@mail.gmail.com">
      <div dir="ltr">
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">The only change from previous report is slightly newer oe-core and bitbake.</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">
</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><a href="http://www.openembedded.org/wiki/Bitbake_World_Status" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://www.openembedded.org/wiki/Bitbake_World_Status</a>

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='4'|Failed tasks			    !!|Signatures		  !!colspan='15'|QA !!Comment
|-
||		||qemuarm	||qemuarm64	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||qa_pseudo	||	
|-
||2017-11-07	||3	||6	||28	||2	||0	||0		||0		||1		||0		||0		||0		||1		||0		||0		||0		||0		||0		||0		||0		||365		||	
|}

== Failed tasks 2017-11-07 ==

INFO: jenkins-job.sh-1.8.39 Complete log available at <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171108_081616.log" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20171108_081616.log</a>

=== common (1) ===
    * meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb:do_configure

=== common-x86 (0) ===

=== qemuarm (2) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_package_qa

=== qemuarm64 (5) ===
    * meta-browser/recipes-browser/chromium/chromium_54.0.2810.2.bb:do_compile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:do_compile
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure</pre>
      </div>
    </blockquote>
    <br>
    <blockquote type="cite"
cite="mid:CA+chaQedk4yWUWmG9XkZaAf8XemfxzyTh35TYjdPwjgdpqk5Bw@mail.gmail.com">
      <div dir="ltr">
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_compile</pre>
      </div>
    </blockquote>
    <br>
    The Arm64 fix  should be in the 2.1.0 when it releases. The fix is
    in LuaJIT-2.1.0-beta3.  I didn't want to backport (beta) it as it
    may trigger the need for PE when 2.1.0 officially releases.<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CA+chaQedk4yWUWmG9XkZaAf8XemfxzyTh35TYjdPwjgdpqk5Bw@mail.gmail.com">
      <div dir="ltr">
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">

=== qemux86 (27) ===</pre>
      </div>
    </blockquote>
    <br>
    <blockquote type="cite"
cite="mid:CA+chaQedk4yWUWmG9XkZaAf8XemfxzyTh35TYjdPwjgdpqk5Bw@mail.gmail.com">
      <div dir="ltr">
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.17.07.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/open-isns/open-isns_0.97.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-systemd_234.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-systemd_234.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_compile
    * openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa

=== qemux86_64 (1) ===
    * meta-openembedded/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb:do_package_qa

=== Number of failed tasks (39) ===
{| class=wikitable
|-
|| qemuarm 	|| 3	 || <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171106_001137.log/" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20171106_001137.log/</a> || <a href="http://errors.yoctoproject.org/Errors/Build/48068/" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://errors.yoctoproject.org/Errors/Build/48068/</a>
|-
|| qemuarm64 	|| 6	 || <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm64.20171107_011415.log/" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm64.20171107_011415.log/</a> || <a href="http://errors.yoctoproject.org/Errors/Build/48214/" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://errors.yoctoproject.org/Errors/Build/48214/</a>
|-
|| qemux86 	|| 28	 || <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171106_001136.log/" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20171106_001136.log/</a> || <a href="http://errors.yoctoproject.org/Errors/Build/48074/" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://errors.yoctoproject.org/Errors/Build/48074/</a>
|-
|| qemux86_64 	|| 2	 || <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171107_022735.log/" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20171107_022735.log/</a> || <a href="http://errors.yoctoproject.org/Errors/Build/48213/" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://errors.yoctoproject.org/Errors/Build/48213/</a>
|}

=== PNBLACKLISTs (1) ===

=== QA issues (367) ===
{| class=wikitable
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
||1	||host-user-contaminated
|-
||1	||textrel
|-
||365	||qa_pseudo
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: <a href="http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20171108_053111.log/" style="box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)" moz-do-not-send="true">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20171108_053111.log/</a>


    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/<a href="http://uim_1.8.6.bb" moz-do-not-send="true">uim_1.8.6.bb</a> RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /home/jenkins/oe/world/shr-core/tmp-glibc/stamps
    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/<a href="http://uim_1.8.6.bb" moz-do-not-send="true">uim_1.8.6.bb</a> RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/jenkins/oe/world/shr-core/tmp-glibc/stamps


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools] ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','ld-is-gold',">"${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "</a>BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-qt5:
PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads directory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 1	issue: textrel
corosync-2.4.2: ELF binary '/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 1	issue: host-user-contaminated
qtbase-5.9.2+gitAUTOINC+ec16ba393b: qtbase: /qtbase-mkspecs/usr/lib/qt5/mkspecs/modules/qt_lib_testlib_private.pri is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 365	issue: qa_pseudo
alsa-plugins-1.1.4: This /work/core2-64-oe-linux/alsa-plugins/1.1.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
apache2-2.4.27: This /work/aarch64-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
apache2-2.4.27: This /work/armv5te-oe-linux-gnueabi/apache2/2.4.27-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
apache2-2.4.27: This /work/core2-64-oe-linux/apache2/2.4.27-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
apr-1.6.2: This /work/core2-64-oe-linux/apr/1.6.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
apr-util-1.6.0: This /work/aarch64-oe-linux/apr-util/1.6.0-r1/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
aufs-util-4.4+gitAUTOINC+89afb1806c: This /work/core2-64-oe-linux/aufs-util/4.4+gitAUTOINC+89afb1806c-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
autofs-5.1.2: This /work/aarch64-oe-linux/autofs/5.1.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
babeltrace-1.5.3: This /work/aarch64-oe-linux/babeltrace/1.5.3-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
babl-0.1.28: This /work/armv5te-oe-linux-gnueabi/babl/0.1.28-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
bind-9.10.5-P3: This /work/core2-64-oe-linux/bind/9.10.5-P3-r0/pseudo/pseudo.log indicates 22 errors [qa_pseudo]
blktrace-1.1.0+gitAUTOINC+43fc870ce0: This /work/aarch64-oe-linux/blktrace/1.1.0+gitAUTOINC+43fc870ce0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
bluez5-5.47: This /work/aarch64-oe-linux/bluez5/5.47-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bluez5-5.47: This /work/armv5te-oe-linux-gnueabi/bluez5/5.47-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
bluez5-5.47: This /work/core2-64-oe-linux/bluez5/5.47-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
breakpad-1.0+gitAUTOINC+dea867e76f_ec44c6c167_cb6dd4ef5f_a91633d172_324dd166b7: This /work/core2-64-oe-linux/breakpad/1_1.0+gitAUTOINC+dea867e76f_ec44c6c167_cb6dd4ef5f_a91633d172_324dd166b7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
bzip2-1.0.6: This /work/armv5te-oe-linux-gnueabi/bzip2/1.0.6-r5/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
chrony-2.4: This /work/aarch64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
chrony-2.4: This /work/armv5te-oe-linux-gnueabi/chrony/2.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
chrony-2.4: This /work/core2-64-oe-linux/chrony/2.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
collectd-5.7.2: This /work/armv5te-oe-linux-gnueabi/collectd/5.7.2-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
connman-gnome-0.7: This /work/aarch64-oe-linux/connman-gnome/0.7-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
conntrack-tools-1.4.4: This /work/armv5te-oe-linux-gnueabi/conntrack-tools/1.4.4-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
console-tools-0.3.2: This /work/armv5te-oe-linux-gnueabi/console-tools/0.3.2-r8/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
coreutils-8.27: This /work/aarch64-oe-linux/coreutils/8.27-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ctdb-2.5.6: This /work/aarch64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ctdb-2.5.6: This /work/armv5te-oe-linux-gnueabi/ctdb/2.5.6-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
cups-2.2.4: This /work/armv5te-oe-linux-gnueabi/cups/2.2.4-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
curlpp-0.8.1: This /work/aarch64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
curlpp-0.8.1: This /work/core2-64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
dhcp-4.3.6: This /work/aarch64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
dhcp-4.3.6: This /work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
diffstat-1.61: This /work/core2-64-oe-linux/diffstat/1.61-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
digitemp-3.7.1+gitAUTOINC+389f67655e: This /work/armv5te-oe-linux-gnueabi/digitemp/3.7.1+gitAUTOINC+389f67655e-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
directfb-examples-1.7.0: This /work/aarch64-oe-linux/directfb-examples/1.7.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
distcc-3.2: This /work/core2-64-oe-linux/distcc/3.2-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
dmidecode-3.1: This /work/aarch64-oe-linux/dmidecode/3.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
dovecot-2.2.29: This /work/aarch64-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
dovecot-2.2.29: This /work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
dovecot-2.2.29: This /work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
dracut-045+git39c9b67f86145953aa30def9d77c68597a4ccfe8: This /work/aarch64-oe-linux/dracut/1_045+git39c9b67f86145953aa30def9d77c68597a4ccfe8-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/aarch64-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/core2-64-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
enca-1.9: This /work/armv5te-oe-linux-gnueabi/enca/1.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
espeak-1.48.04: This /work/core2-64-oe-linux/espeak/1.48.04-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/aarch64-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/core2-64-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
geoclue-2.4.4: This /work/aarch64-oe-linux/geoclue/2.4.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
geoclue-2.4.4: This /work/core2-64-oe-linux/geoclue/2.4.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
gimp-2.8.22: This /work/core2-64-oe-linux/gimp/2.8.22-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
git-2.13.3: This /work/armv5te-oe-linux-gnueabi/git/2.13.3-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
glib-2.0-2.52.3: This /work/armv5e-oe-linux-gnueabi/glib-2.0/1_2.52.3-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
glibc-2.26: This /work/aarch64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
glibc-2.26: This /work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
glibc-2.26: This /work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
glibc-locale-2.26: This /work/aarch64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
glibc-locale-2.26: This /work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/aarch64-oe-linux/gobject-introspection/1.52.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
gobject-introspection-1.52.1: This /work/core2-64-oe-linux/gobject-introspection/1.52.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
gstreamer1.0-plugins-base-1.12.3: This /work/aarch64-oe-linux/gstreamer1.0-plugins-base/1.12.3-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
icu-59.1: This /work/aarch64-oe-linux/icu/59.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
icu-59.1: This /work/armv5e-oe-linux-gnueabi/icu/59.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
icu-59.1: This /work/core2-64-oe-linux/icu/59.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
iotop-0.6: This /work/armv5te-oe-linux-gnueabi/iotop/0.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ippool-1.3: This /work/armv5te-oe-linux-gnueabi/ippool/1.3-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ipsec-tools-0.8.2: This /work/qemuarm64-oe-linux/ipsec-tools/0.8.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
iptables-1.6.1: This /work/aarch64-oe-linux/iptables/1.6.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ipvsadm-1.26: This /work/aarch64-oe-linux/ipvsadm/1.26-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
jansson-2.9: This /work/aarch64-oe-linux/jansson/2.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
jansson-2.9: This /work/core2-64-oe-linux/jansson/2.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/aarch64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/core2-64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
leptonica-1.74.4: This /work/core2-64-oe-linux/leptonica/1.74.4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libart-lgpl-2.3.21: This /work/armv5te-oe-linux-gnueabi/libart-lgpl/2.3.21-r2/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
libevent-2.1.8: This /work/aarch64-oe-linux/libevent/2.1.8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libfontenc-1.1.3: This /work/aarch64-oe-linux/libfontenc/1_1.1.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
libhugetlbfs-2.20: This /work/aarch64-oe-linux/libhugetlbfs/1_2.20-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
libice-1.0.9: This /work/aarch64-oe-linux/libice/1_1.0.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libice-1.0.9: This /work/armv5te-oe-linux-gnueabi/libice/1_1.0.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libnetfilter-queue-1.0.2+git981025e103d887fb6a9c9bb49c74ec323108d098: This /work/armv5te-oe-linux-gnueabi/libnetfilter-queue/1.0.2+git981025e103d887fb6a9c9bb49c74ec323108d098-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/aarch64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueabi/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
libraw1394-2.1.2: This /work/aarch64-oe-linux/libraw1394/2.1.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libreport-2.9.2: This /work/core2-64-oe-linux/libreport/2.9.2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libsrtp-1.5.2: This /work/aarch64-oe-linux/libsrtp/1.5.2-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libssh2-1.8.0: This /work/aarch64-oe-linux/libssh2/1.8.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libtdb-1.3.14: This /work/aarch64-oe-linux/libtdb/1.3.14-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libtimedate-perl-2.30: This /work/armv5te-oe-linux-gnueabi/libtimedate-perl/2.30-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/aarch64-oe-linux/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/armv5te-oe-linux-gnueabi/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/core2-64-oe-linux/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libva-utils-1.8.3: This /work/armv5te-oe-linux-gnueabi/libva-utils/1.8.3-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libvncserver-0.9.11: This /work/aarch64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/aarch64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
linux-atm-2.5.2: This /work/qemuarm-oe-linux-gnueabi/linux-atm/2.5.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
linux-atm-2.5.2: This /work/qemux86_64-oe-linux/linux-atm/2.5.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
linux-libc-headers-4.12: This /work/armv5te-oe-linux-gnueabi/linux-libc-headers/4.12-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
llvm-5.0: This /work/aarch64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
log4cpp-1.1.2: This /work/aarch64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
log4cpp-1.1.2: This /work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
log4cpp-1.1.2: This /work/core2-64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
logrotate-3.12.3: This /work/armv5te-oe-linux-gnueabi/logrotate/3.12.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
lowpan-tools-0.3.1+gitAUTOINC+38f42dbfce: This /work/aarch64-oe-linux/lowpan-tools/0.3.1+gitAUTOINC+38f42dbfce-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/aarch64-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/armv5te-oe-linux-gnueabi/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/core2-64-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
makedevs-1.0.1: This /work/core2-64-oe-linux/makedevs/1.0.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mariadb-5.5.57: This /work/aarch64-oe-linux/mariadb/5.5.57-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
mariadb-5.5.57: This /work/armv5e-oe-linux-gnueabi/mariadb/5.5.57-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
mc-4.8.19: This /work/aarch64-oe-linux/mc/4.8.19-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mc-4.8.19: This /work/armv5te-oe-linux-gnueabi/mc/4.8.19-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
md5deep-4.4: This /work/aarch64-oe-linux/md5deep/4.4-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
monkey-1.5.6: This /work/armv5te-oe-linux-gnueabi/monkey/1.5.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mosquitto-1.4.14: This /work/aarch64-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mosquitto-1.4.14: This /work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mosquitto-1.4.14: This /work/core2-64-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/aarch64-oe-linux/mozilla-devscripts/0.30-r1/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/core2-64-oe-linux/mozilla-devscripts/0.30-r1/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mpich-3.2: This /work/core2-64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mtd-utils-2.0.0: This /work/aarch64-oe-linux/mtd-utils/2.0.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
net-snmp-5.7.3: This /work/aarch64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
net-snmp-5.7.3: This /work/armv5te-oe-linux-gnueabi/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
net-snmp-5.7.3: This /work/core2-64-oe-linux/net-snmp/5.7.3-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
nftables-0.7: This /work/aarch64-oe-linux/nftables/0.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
nginx-1.12.1: This /work/armv5te-oe-linux-gnueabi/nginx/1.12.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
nginx-1.12.1: This /work/core2-64-oe-linux/nginx/1.12.1-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
nspr-4.16: This /work/armv5te-oe-linux-gnueabi/nspr/4.16-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
nss-3.31.1: This /work/aarch64-oe-linux/nss/3.31.1-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
ntfs-3g-ntfsprogs-2017.3.23: This /work/armv5te-oe-linux-gnueabi/ntfs-3g-ntfsprogs/2017.3.23-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ntp-4.2.8p10: This /work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
ntp-4.2.8p10: This /work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
openhpi-3.6.1: This /work/armv5te-oe-linux-gnueabi/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
openl2tp-1.8: This /work/core2-64-oe-linux/openl2tp/1.8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openldap-2.4.45: This /work/core2-64-oe-linux/openldap/2.4.45-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
opensaf-5.17.07: This /work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
openssh-7.5p1: This /work/aarch64-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openssh-7.5p1: This /work/core2-64-oe-linux/openssh/7.5p1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
perf-1.0: This /work/qemuarm64-oe-linux/perf/1.0-r9/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
perf-1.0: This /work/qemuarm-oe-linux-gnueabi/perf/1.0-r9/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
perl-5.24.1: This /work/aarch64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
perl-5.24.1: This /work/armv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
perl-5.24.1: This /work/core2-64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
php-7.1.9: This /work/aarch64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
pidgin-2.12.0: This /work/core2-64-oe-linux/pidgin/2.12.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
pm-qa-0.5.2: This /work/aarch64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 32 errors [qa_pseudo]
pm-qa-0.5.2: This /work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 39 errors [qa_pseudo]
pm-qa-0.5.2: This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 52 errors [qa_pseudo]
portaudio-v19-v190600: This /work/aarch64-oe-linux/portaudio-v19/v190600-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
portaudio-v19-v190600: This /work/core2-64-oe-linux/portaudio-v19/v190600-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postfix-3.2.2: This /work/aarch64-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postfix-3.2.2: This /work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postfix-3.2.2: This /work/core2-64-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postgresql-9.4.14: This /work/aarch64-oe-linux/postgresql/9.4.14-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
postgresql-9.4.14: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.14-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
postgresql-9.4.14: This /work/core2-64-oe-linux/postgresql/9.4.14-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
ppp-2.4.7: This /work/armv5te-oe-linux-gnueabi/ppp/2.4.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
proftpd-1.3.6: This /work/aarch64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
proftpd-1.3.6: This /work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
pyrtm-0.4.2: This /work/core2-64-oe-linux/pyrtm/0.4.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-2.7.13: This /work/aarch64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-2.7.13: This /work/armv5te-oe-linux-gnueabi/python/2.7.13-r1/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-2.7.13: This /work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/aarch64-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
python3-3.5.3: This /work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python3-3.5.3: This /work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python3-babel-2.5.1: This /work/armv5te-oe-linux-gnueabi/python3-babel/2.5.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-bcrypt-3.1.3: This /work/aarch64-oe-linux/python3-bcrypt/3.1.3-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-beautifulsoup4-4.6.0: This /work/aarch64-oe-linux/python3-beautifulsoup4/4.6.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-chardet-3.0.4: This /work/aarch64-oe-linux/python3-chardet/3.0.4-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python3-django-1.11.5: This /work/core2-64-oe-linux/python3-django/1.11.5-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-flask-0.12.2: This /work/armv5te-oe-linux-gnueabi/python3-flask/0.12.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-greenlet-0.4.12: This /work/aarch64-oe-linux/python3-greenlet/0.4.12-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-ndg-httpsclient-0.4.3: This /work/aarch64-oe-linux/python3-ndg-httpsclient/0.4.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-numpy-1.13.3: This /work/armv5te-oe-linux-gnueabi/python3-numpy/1.13.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pretend-1.0.8: This /work/core2-64-oe-linux/python3-pretend/1.0.8-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-psutil-5.3.1: This /work/aarch64-oe-linux/python3-psutil/5.3.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-ptyprocess-0.5.2: This /work/core2-64-oe-linux/python3-ptyprocess/0.5.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/aarch64-oe-linux/python3-pylint/1.7.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pylint-1.7.4: This /work/core2-64-oe-linux/python3-pylint/1.7.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pyserial-3.4: This /work/aarch64-oe-linux/python3-pyserial/3.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-six-1.11.0: This /work/aarch64-oe-linux/python3-six/1.11.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-twisted-17.9.0: This /work/aarch64-oe-linux/python3-twisted/17.9.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-twisted-17.9.0: This /work/armv5te-oe-linux-gnueabi/python3-twisted/17.9.0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python3-twisted-17.9.0: This /work/core2-64-oe-linux/python3-twisted/17.9.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-webencodings-0.5.1: This /work/aarch64-oe-linux/python3-webencodings/0.5.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-chardet-3.0.4: This /work/aarch64-oe-linux/python-chardet/3.0.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-cpuset-1.5.7: This /work/aarch64-oe-linux/python-cpuset/1.5.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-cson-git: This /work/armv5te-oe-linux-gnueabi/python-cson/git-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-cython-0.27.1: This /work/armv5te-oe-linux-gnueabi/python-cython/0.27.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-django-1.11.5: This /work/core2-64-oe-linux/python-django/1.11.5-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pbr-3.1.1: This /work/core2-64-oe-linux/python-pbr/3.1.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pep8-1.7.0: This /work/aarch64-oe-linux/python-pep8/1.7.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.7.4: This /work/aarch64-oe-linux/python-pylint/1.7.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.7.4: This /work/armv5te-oe-linux-gnueabi/python-pylint/1.7.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.7.4: This /work/core2-64-oe-linux/python-pylint/1.7.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pyro4-4.62: This /work/aarch64-oe-linux/python-pyro4/4.62-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pyro4-4.62: This /work/armv5te-oe-linux-gnueabi/python-pyro4/4.62-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pyro4-4.62: This /work/core2-64-oe-linux/python-pyro4/4.62-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pyserial-3.4: This /work/armv5te-oe-linux-gnueabi/python-pyserial/3.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pyudev-0.21.0: This /work/core2-64-oe-linux/python-pyudev/0.21.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-scons-3.0.0: This /work/core2-64-oe-linux/python-scons/3.0.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-unidiff-0.5.4: This /work/aarch64-oe-linux/python-unidiff/0.5.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-vobject-0.9.5: This /work/aarch64-oe-linux/python-vobject/0.9.5-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-xlrd-1.1.0: This /work/core2-64-oe-linux/python-xlrd/1.1.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
pywbem-0.8.0: This /work/core2-64-oe-linux/pywbem/0.8.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qsiv-1.1: This /work/armv5te-oe-linux-gnueabi/qsiv/1.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/aarch64-oe-linux/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/armv5te-oe-linux-gnueabi/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qt3d-5.9.2+gitAUTOINC+143b721249: This /work/core2-64-oe-linux/qt3d/5.9.2+gitAUTOINC+143b721249-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qt5-creator-3.5.1: This /work/aarch64-oe-linux/qt5-creator/3.5.1-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qt5-creator-3.5.1: This /work/armv5te-oe-linux-gnueabi/qt5-creator/3.5.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qt5-creator-3.5.1: This /work/core2-64-oe-linux/qt5-creator/3.5.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/aarch64-oe-linux/qtbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 768 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/armv5te-oe-linux-gnueabi/qtbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtbase-5.9.2+gitAUTOINC+ec16ba393b: This /work/core2-64-oe-linux/qtbase/5.9.2+gitAUTOINC+ec16ba393b-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/aarch64-oe-linux/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/armv5te-oe-linux-gnueabi/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtcharts-5.9.2+gitAUTOINC+e3af14e916: This /work/core2-64-oe-linux/qtcharts/5.9.2+gitAUTOINC+e3af14e916-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/aarch64-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtconnectivity-5.9.2+gitAUTOINC+6b3bdb8440: This /work/core2-64-oe-linux/qtconnectivity/5.9.2+gitAUTOINC+6b3bdb8440-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/aarch64-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtdatavis3d-5.9.2+gitAUTOINC+8329a8fb28: This /work/core2-64-oe-linux/qtdatavis3d/5.9.2+gitAUTOINC+8329a8fb28-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/aarch64-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 30 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/armv5te-oe-linux-gnueabi/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qtdeclarative-5.9.2+gitAUTOINC+32218c3243: This /work/core2-64-oe-linux/qtdeclarative/5.9.2+gitAUTOINC+32218c3243-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/aarch64-oe-linux/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnueabi/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtenginio-5.9.2+gitAUTOINC+23603a3b08: This /work/core2-64-oe-linux/qtenginio/5.9.2+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/aarch64-oe-linux/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/armv5te-oe-linux-gnueabi/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtgamepad-5.9.2+gitAUTOINC+167566d228: This /work/core2-64-oe-linux/qtgamepad/5.9.2+gitAUTOINC+167566d228-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/aarch64-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/armv5te-oe-linux-gnueabi/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtlocation-5.9.2+gitAUTOINC+d919f47308_1c633072fc: This /work/core2-64-oe-linux/qtlocation/5.9.2+gitAUTOINC+d919f47308_1c633072fc-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/aarch64-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/armv5te-oe-linux-gnueabi/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtmultimedia-5.9.2+gitAUTOINC+1e2702e86d: This /work/core2-64-oe-linux/qtmultimedia/5.9.2+gitAUTOINC+1e2702e86d-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/armv5te-oe-linux-gnueabi/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtnetworkauth-5.9.2+gitAUTOINC+47b80ecae6: This /work/core2-64-oe-linux/qtnetworkauth/5.9.2+gitAUTOINC+47b80ecae6-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/aarch64-oe-linux/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: This /work/armv5te-oe-linux-gnueabi/qtquick1/5.9.2+gitAUTOINC+9bf0edd9bd-r0/pseudo/pseudo.log indicates 31 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/aarch64-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/armv5te-oe-linux-gnueabi/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.9.2+gitAUTOINC+871d8e8e2f: This /work/core2-64-oe-linux/qtquickcontrols2/5.9.2+gitAUTOINC+871d8e8e2f-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtquickcontrols-5.9.2+gitAUTOINC+8476f8fff7: This /work/armv5te-oe-linux-gnueabi/qtquickcontrols/5.9.2+gitAUTOINC+8476f8fff7-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtquickcontrols-5.9.2+gitAUTOINC+8476f8fff7: This /work/core2-64-oe-linux/qtquickcontrols/5.9.2+gitAUTOINC+8476f8fff7-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/aarch64-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/armv5te-oe-linux-gnueabi/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtremoteobjects-5.9.2+gitAUTOINC+6e0341bc87: This /work/core2-64-oe-linux/qtremoteobjects/5.9.2+gitAUTOINC+6e0341bc87-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/aarch64-oe-linux/qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/armv5e-oe-linux-gnueabi/qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtscript-5.9.2+gitAUTOINC+08b74f4f30: This /work/core2-64-oe-linux/qtscript/5.9.2+gitAUTOINC+08b74f4f30-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/armv5te-oe-linux-gnueabi/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscxml-5.9.2+gitAUTOINC+3caae998c8: This /work/core2-64-oe-linux/qtscxml/5.9.2+gitAUTOINC+3caae998c8-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/aarch64-oe-linux/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/armv5te-oe-linux-gnueabi/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtsensors-5.9.2+gitAUTOINC+c273f2e5c8: This /work/core2-64-oe-linux/qtsensors/5.9.2+gitAUTOINC+c273f2e5c8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/aarch64-oe-linux/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/armv5te-oe-linux-gnueabi/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtserialbus-5.9.2+gitAUTOINC+ce5a3ced5e: This /work/core2-64-oe-linux/qtserialbus/5.9.2+gitAUTOINC+ce5a3ced5e-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/aarch64-oe-linux/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/armv5te-oe-linux-gnueabi/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtserialport-5.9.2+gitAUTOINC+cb9ade8bea: This /work/core2-64-oe-linux/qtserialport/5.9.2+gitAUTOINC+cb9ade8bea-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/aarch64-oe-linux/qtsvg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/armv5te-oe-linux-gnueabi/qtsvg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsvg-5.9.2+gitAUTOINC+bdcd7a9744: This /work/core2-64-oe-linux/qtsvg/5.9.2+gitAUTOINC+bdcd7a9744-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/aarch64-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/armv5te-oe-linux-gnueabi/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtsystems-5.9.2+gitAUTOINC+9c204e05ae: This /work/core2-64-oe-linux/qtsystems/5.9.2+gitAUTOINC+9c204e05ae-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/aarch64-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/armv5te-oe-linux-gnueabi/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qttools-5.9.2+gitAUTOINC+90a701032e: This /work/core2-64-oe-linux/qttools/5.9.2+gitAUTOINC+90a701032e-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/aarch64-oe-linux/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/armv5te-oe-linux-gnueabi/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwayland-5.9.2+gitAUTOINC+d483ed2927: This /work/core2-64-oe-linux/qtwayland/5.9.2+gitAUTOINC+d483ed2927-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/aarch64-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/armv5te-oe-linux-gnueabi/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
qtwebchannel-5.9.2+gitAUTOINC+61a638663c: This /work/core2-64-oe-linux/qtwebchannel/5.9.2+gitAUTOINC+61a638663c-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/aarch64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtwebengine-5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903: This /work/core2-64-oe-linux/qtwebengine/5.9.2+gitAUTOINC+c11c2c8981_cfe8c60903-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/aarch64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueabi/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtwebkit-5.9.2+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwebkit/5.9.2+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This /work/aarch64-oe-linux/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtwebkit-examples-5.9.2+gitAUTOINC+a24c780b60: This /work/armv5te-oe-linux-gnueabi/qtwebkit-examples/5.9.2+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/aarch64-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/armv5te-oe-linux-gnueabi/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebsockets-5.9.2+gitAUTOINC+492981b932: This /work/core2-64-oe-linux/qtwebsockets/5.9.2+gitAUTOINC+492981b932-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/aarch64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]
qtwebview-5.9.2+gitAUTOINC+ec640efd1d: This /work/core2-64-oe-linux/qtwebview/5.9.2+gitAUTOINC+ec640efd1d-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/aarch64-oe-linux/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/armv5te-oe-linux-gnueabi/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
qtx11extras-5.9.2+gitAUTOINC+160435b0eb: This /work/core2-64-oe-linux/qtx11extras/5.9.2+gitAUTOINC+160435b0eb-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/aarch64-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/armv5te-oe-linux-gnueabi/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
qtxmlpatterns-5.9.2+gitAUTOINC+8d7e1e0ec0: This /work/core2-64-oe-linux/qtxmlpatterns/5.9.2+gitAUTOINC+8d7e1e0ec0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
quagga-1.2.1: This /work/core2-64-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
rabbitmq-c-0.7.0: This /work/core2-64-oe-linux/rabbitmq-c/0.7.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
radvd-2.17: This /work/aarch64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
radvd-2.17: This /work/armv5te-oe-linux-gnueabi/radvd/2.17-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
radvd-2.17: This /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
readline-7.0: This /work/core2-64-oe-linux/readline/7.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
rsyslog-8.29.0: This /work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ruli-0.36: This /work/armv5te-oe-linux-gnueabi/ruli/0.36-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
rygel-0.34.0: This /work/aarch64-oe-linux/rygel/0.34.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
samba-4.6.7: This /work/armv5te-oe-linux-gnueabi/samba/4.6.7-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
samba-4.6.7: This /work/core2-64-oe-linux/samba/4.6.7-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
sbc-1.3: This /work/aarch64-oe-linux/sbc/1.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
screen-4.6.1: This /work/aarch64-oe-linux/screen/4.6.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
sed-4.2.2: This /work/aarch64-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
shadow-4.2.1: This /work/core2-64-oe-linux/shadow/4.2.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
squid-3.5.26: This /work/aarch64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
sthttpd-2.27.1: This /work/aarch64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
sthttpd-2.27.1: This /work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
sthttpd-2.27.1: This /work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
strace-4.18: This /work/aarch64-oe-linux/strace/4.18-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
strace-4.18: This /work/armv5te-oe-linux-gnueabi/strace/4.18-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
strace-4.18: This /work/core2-64-oe-linux/strace/4.18-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
syslog-ng-3.8.1: This /work/aarch64-oe-linux/syslog-ng/3.8.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
systemtap-3.1: This /work/aarch64-oe-linux/systemtap/3.1-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
tcl-8.6.7: This /work/aarch64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
tftp-hpa-5.2: This /work/aarch64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
tftp-hpa-5.2: This /work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
tftp-hpa-5.2: This /work/core2-64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
udevil-0.4.4: This /work/aarch64-oe-linux/udevil/0.4.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
ufw-0.33: This /work/aarch64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ufw-0.33: This /work/armv5te-oe-linux-gnueabi/ufw/0.33-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ufw-0.33: This /work/core2-64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
util-linux-2.30: This /work/armv5te-oe-linux-gnueabi/util-linux/2.30-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
util-linux-2.30: This /work/core2-64-oe-linux/util-linux/2.30-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
valgrind-3.13.0: This /work/core2-64-oe-linux/valgrind/3.13.0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
vboxguestdrivers-5.1.26: This /work/qemux86_64-oe-linux/vboxguestdrivers/5.1.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
wavpack-4.60.1: This /work/armv5te-oe-linux-gnueabi/wavpack/4.60.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
wvdial-1.61: This /work/core2-64-oe-linux/wvdial/1.61-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xcb-util-keysyms-0.4.0: This /work/aarch64-oe-linux/xcb-util-keysyms/0.4.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xfce4-eyes-plugin-4.4.5: This /work/core2-64-oe-linux/xfce4-eyes-plugin/4.4.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xfce4-session-4.12.1: This /work/core2-64-oe-linux/xfce4-session/4.12.1-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
xfsprogs-4.12.0: This /work/core2-64-oe-linux/xfsprogs/4.12.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
xkeyboard-config-2.21: This /work/aarch64-oe-linux/xkeyboard-config/2.21-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
zeromq-4.1.6: This /work/armv5te-oe-linux-gnueabi/zeromq/4.1.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit: 
cc420f4 tests/fetch: skip network tests the idiomatic way
not included in master yet: 
a51418c world-image: add extra target
7096a8d fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit: 
73c6f85 lib/oe/sstatesig: fix wildcard matching wrong task signature files
not included in master yet: 
110e503 systemd: Fix build on musl
9451a8b systemd: Fix build with musl/mips64
37dd08a report-error: Allow to upload reports automatically
9c40bfb buildhistory.bbclass: metadata-revs show repo parent
a72375b metadata-revs: provide more information
d1a3571 qemux86: Add identical qemux86copy variant for tests
b985ffd reproducible_build.bbclass: initial support for binary reproducibility
dec1252 cpio: provide cpio-replacement-native
95bde9d image_types.bbclass: improve cpio image reproducibility
f239f9e rootfs-postcommands.bbclass: support binary reproducibility
3830ead sstate.bbclass: Do not cause build failures due to setscene errors
c3a5c9a insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
928201f libsdl2: allow to build native and nativesdk
b3032b4 libdrm: allow to build native and nativesdk
82a93f3 nativesdk-mesa,mesa-native: add new recipe to build small part of mesa
6a58f45 libepoxy: add support for native(sdk)
c065381 libjpeg-turbo: provide nativesdk version
7bcf920 virglrenderer: add new recipe
c50ff33 virglrenderer: fix target build
a34ab83 qemu: add PACKAGECONFIG for virtglrenderer, sdl2 and spice
3a43735 insane.bbclass: use package_qa_handle_error for do_qa_pseudo

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit: 
5d6d21e libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
not included in master yet: 
ebcef48 bridge-utils: modify the AR to cross toolchain

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit: 
d87335a qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
not included in master yet: 
197811b qtwebengine: make test suite succeed

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit: 
26d5066 firefox: fix build failures
not included in master yet: 
6773bf9 meta: drop ${COREBASE}/LICENSE references

==================== REPORT STOP ================== 
sending incremental file list</pre>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------897542E8F61BDF3B89CD4C19--
