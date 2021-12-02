Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8CBC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 15:58:14 +0000 (UTC)
Received: from avasout-peh-002.plus.net (avasout-peh-002.plus.net
 [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web11.10261.1638460691647870530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 07:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=f3Cc8AJw;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id soTHmeeiBdg3PsoTImbqNK; Thu, 02 Dec 2021 15:58:09 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=ceyxElPM c=1 sm=1 tr=0 ts=61a8ed11
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=IOMw9HtfNCkA:10 a=-An2I_7KAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=4rwPFWVpgiCg8D6c7esA:9 a=CjuIK1q_8ugA:10
 a=Sq34B_EcNBM9_nrAYB9S:22 a=9H3Qd4_ONW2Ztcrla5EB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=A7sBN85QeUVPL+dK3MSvUs+qx6tLmjkjgmK3qx+rsOw=; b=f3Cc8
	AJwtazHHGxhKhAERmLqrmod3TGMPsqcAzIb9R4g/D/15EAU3UrRhhqaJ1vHMeWvUSb4PVDWNO+G8w
	npFhsdNcxxRdThzYMwfDf95KvFIe9dBXpXJyuAl+JZEYqA0zk95J0Y7FRoAPitIxtvNEUNpsO2osE
	5C8EckzKL37OU0pH22/olDR1v8FFMWfoXCLvOkfvN4cJ4AaCVSPGNY8EkONULe0I1l8O4280slBxm
	L1Ov0jwzG+BaGve2uNTrUfxnA5o3E3kDa/IpNEk7QRpPHdXXTIRSSgGkttPmNeMAjTUiK/kVMsz3D
	h3o4+Iewpf+d3xWrwWI/mJDVSShgA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1msoTH-008kUo-DK; Thu, 02 Dec 2021 15:58:07 +0000
Date: Thu, 2 Dec 2021 15:58:07 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Correct way to set DRIDRIVERS and GALLIUMDRIVERS from
 mesa bbappend
Message-ID: <YajtD+IFyjZJb2yX@mcrowe.com>
References: <YaemRcD22hUhkQrq@mcrowe.com>
 <CANNYZj-7YLRwgbCDusZv98B0RSkzVbKPZWJm6r=akEXysLGT0g@mail.gmail.com>
 <Yae5h9EsXqA0ycqU@mcrowe.com>
 <CANNYZj81Yk2vB119MguwPmfY4s_S3G1KSVWQL8N8JQBe3xzx1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CANNYZj81Yk2vB119MguwPmfY4s_S3G1KSVWQL8N8JQBe3xzx1g@mail.gmail.com>
X-CMAE-Envelope: 
 MS4xfHuhchT3PiwqNG4JwPROdf1W4VUdQLeAt+Xe2KuNaGQpe4vkyeRydUxj8mjHpzcmlGU8lAQCeZBtYnVrU9WagTcdCjXGX2WXM6M+Q2lMqqs3oYHyT1t3
 CnvFjDtyZHsLicixa0Nnrwo8Ai8M2r/LJRLi6JAYD4LCGmrWZGMwUVqJAFyxbnGrCthPI1flC14+1ZvUamQsfx4ENWoTWohISgk=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 15:58:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159092

Hi Alex,

It's not a case of simply deleting the so files we don't need since the
mesa build system stuffs everything into a small number of files and then
hard links them together. For example, the current unmodified oe-core build
for qemux86-64 yields:

$ ls -l tmp-glibc/deploy/ipk/core2-64/mesa-megadriver_21.3.0-r0_core2-64.ipk
-rw-r--r-- 2 mac mac 7993248 Dec  2 09:13 tmp-glibc/deploy/ipk/core2-64/mesa-megadriver_21.3.0-r0_core2-64.ipk

$ dpkg-deb -c tmp-glibc/deploy/ipk/core2-64/mesa-megadriver_21.3.0-r0_core2-64.ipk
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/
-rwxr-xr-x root/root  17728664 2021-11-17 20:17 ./usr/lib/dri/crocus_dri.so
hrwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/i915_dri.so link to ./usr/lib/dri/crocus_dri.so
-rwxr-xr-x root/root  15903952 2021-11-17 20:17 ./usr/lib/dri/i965_dri.so
hrwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/iris_dri.so link to ./usr/lib/dri/crocus_dri.so
hrwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/kms_swrast_dri.so link to ./usr/lib/dri/crocus_dri.so
hrwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/nouveau_vieux_dri.so link to ./usr/lib/dri/i965_dri.so
hrwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/r200_dri.so link to ./usr/lib/dri/i965_dri.so
hrwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/radeon_dri.so link to ./usr/lib/dri/i965_dri.so
hrwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/swrast_dri.so link to ./usr/lib/dri/crocus_dri.so
hrwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/virtio_gpu_dri.so link to ./usr/lib/dri/crocus_dri.so
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/share/
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/share/drirc.d/
-rw-r--r-- root/root     44273 2021-11-17 20:16 ./usr/share/drirc.d/00-mesa-defaults.conf

If I prune the default configuration do_install:append so I only keep
swrast_dri.so then I get:

$ ls -l tmp-glibc/deploy/ipk/core2-64/mesa-megadriver_21.3.0-r0_core2-64.ipk
-rw-r--r-- 2 mac mac 4247362 Dec  2 15:29 tmp-glibc/deploy/ipk/core2-64/mesa-megadriver_21.3.0-r0_core2-64.ipk

$ dpkg-deb -c tmp-glibc/deploy/ipk/core2-64/mesa-megadriver_21.3.0-r0_core2-64.ipk
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/
-rwxr-xr-x root/root  17728664 2021-11-17 20:17 ./usr/lib/dri/swrast_dri.so
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/share/
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/share/drirc.d/
-rw-r--r-- root/root     44273 2021-11-17 20:16 ./usr/share/drirc.d/00-mesa-defaults.conf

If I do no pruning but force:
 DRIDRIVERS = ""
 GALLIUMDRIVERS = "swrast"

then I get:

$ ls -l tmp-glibc/deploy/ipk/core2-64/mesa-megadriver_21.3.0-r0_core2-64.ipk
-rw-r--r-- 2 mac mac 2590320 Dec  2 15:15 tmp-glibc/deploy/ipk/core2-64/mesa-megadriver_21.3.0-r0_core2-64.ipk

$ dpkg-deb -c tmp-glibc/deploy/ipk/core2-64/mesa-megadriver_21.3.0-r0_core2-64.ipk
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/
-rwxr-xr-x root/root  11981240 2021-11-17 20:17 ./usr/lib/dri/kms_swrast_dri.so
hrwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/lib/dri/swrast_dri.so link to ./usr/lib/dri/kms_swrast_dri.so
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/share/
drwxr-xr-x root/root         0 2021-11-17 20:17 ./usr/share/drirc.d/
-rw-r--r-- root/root     44273 2021-11-17 20:16 ./usr/share/drirc.d/00-mesa-defaults.conf

This is an uncompressed saving of over five megabytes (32%) and a
compressed saving of 1.6MiB (39%) (assuming that the ipk compression is
indicative of whatever rootfs compression is used.)

I tried just crocus and just iris and there were still savings, albeit
not quite as large as for swrast.

(I have to admit that when I first started investigating this I misread the
numbers and thought they were a factor of ten higher. Nevertheless, it's
clear that there is a difference.)

Justin Bronder's suggestion has given me a workaround if you don't believe
that the space saving is more generally useful.

Thanks.

Mike.

On Wednesday 01 December 2021 at 21:33:39 +0100, Alexander Kanavin wrote:
> I'd like to see specifics though to understand the use case better. What
> kind of target you're on, how much space will be saved by only building the
> driver you need and which driver is that? If the drivers are in separate
> .so objects, you can simply delete the ones you don't need from
> do_install_append. The build time savings would be very minimal.
> 
> Alex
> 
> 
> On Wed, 1 Dec 2021 at 19:06, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > Hi Alex,
> >
> > Thanks for responding.
> >
> > Just to make sure I understand, you think that I should add something like:
> >
> >  PACKAGECONFIG[i915] = ""
> >  PACKAGECONFIG[iris] = ""
> >  PACKAGECONFIG[crocus] = ""
> >  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'i915',
> > ',i915', '', d)}"
> >  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'iris',
> > ',iris', '', d)}"
> >  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'crocus',
> > ',crocus', '', d)}"
> >
> > But then I need to find a way to get "i915 iris crocus" into PACKAGECONFIG
> > for x86 and x86-64 whilst still letting others override that. The best I
> > can come up with is to modify the existing default PACKAGECONFIG to be
> > something like:
> >
> >  PACKAGECONFIG_DEFAULT_FOR_TARGET:x86 = "i915 iris crocus"
> >  PACKAGECONFIG_DEFAULT_FOR_TARGET:x86-64 = "i915 iris crocus"
> >  PACKAGECONFIG:class-target ??= "${@bb.utils.filter('DISTRO_FEATURES',
> > 'wayland vulkan', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> > 'opengl egl gles gbm dri gallium virgl', '', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> > 'x11 dri3', '', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan',
> > 'dri3', '', d)} \
> >                     elf-tls \
> >                     ${PACKAGECONFIG_DEFAULT_FOR_TARGET} \
> >                     "
> >
> > This will probably break anyone who currently sets their own PACKAGECONFIG
> > for x86 and x86-64 until they add the drivers they require. This would seem
> > to be worse than my GALLIUMDRIVERS_DEFAULT suggestion. :(
> >
> > Have I misunderstood you, or is there a better way?
> >
> > Thanks.
> >
> > Mike.
> >
> > On Wednesday 01 December 2021 at 18:21:44 +0100, Alexander Kanavin wrote:
> > > I think you do need to modify oe-core unfortunately, like is done for
> > other
> > > drivers:
> > >
> > > PACKAGECONFIG[etnaviv] = ""
> > > GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
> > > ',etnaviv', '', d)}"
> > >
> > > Alex
> > >
> > > On Wed, 1 Dec 2021 at 17:44, Mike Crowe via lists.openembedded.org <mac=
> > > mcrowe.com@lists.openembedded.org> wrote:
> > >
> > > > I'm building for a specific chip and therefore don't wish to waste
> > time and
> > > > electricity building and disk space on the target installing unwanted
> > mesa
> > > > drivers. However, mesa.inc contains:
> > > >
> > > >  GALLIUMDRIVERS = "swrast"
> > > >  GALLIUMDRIVERS:x86-x32 = ""
> > > >  GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
> > > >  GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
> > > >
> > > > and mesa_21.3.0.bb contains:
> > > >
> > > >  DRIDRIVERS ??= ""
> > > >  DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
> > > >  DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"
> > > >
> > > > I'm unable to find a way to override these values. Using (for example):
> > > >
> > > >  DRIDRIVERS:forcevariable = ""
> > > >  GALLIUMDRIVERS:forcevariable = "swrast"
> > > >
> > > > doesn't work because the append still happens after the forcevariable
> > > > override takes effect. :(
> > > >
> > > > Is there a way that I can override GALLIUMDRIVERS and DRIDRIVERS with
> > my
> > > > own values for x86 and x86-64 without modifying oe-core itself?
> > > >
> > > > If not, should the oe-core recipe being using something like:
> > > >
> > > >  GALLIUMDRIVERS_DEFAULT = "swrast"
> > > >  GALLIUMDRIVERS_DEFAULT:x86-x32 = ""
> > > >  GALLIUMDRIVERS_DEFAULT:append:x86:class-target = ",i915,iris,crocus"
> > > >  GALLIUMDRIVERS_DEFAULT:append:x86-64:class-target =
> > ",i915,iris,crocus"
> > > >  GALLIUMDRIVERS ?= "${GALLIUMDRIVERS_DEFAULT}"
> > > >
> > > > and similar for DRIDRIVERS to support this?
> > > >
> > > > Thanks.
> > > >
> > > > Mike.
> > > >
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#159048):
> > > > https://lists.openembedded.org/g/openembedded-core/message/159048
> > > > Mute This Topic: https://lists.openembedded.org/mt/87432435/1686489
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [
> > > > alex.kanavin@gmail.com]
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > >
> > > >
> >

