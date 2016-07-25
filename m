Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 645CC606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 14:14:58 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id o67so162425904qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BoZN6Ha4TWG5zwNFtLwuPQg7SziuCnHFLPmwMdih9WY=;
	b=dZ2G7qs7lINa09fMgWK1QyHhIHPCTPArQ1OmgzjKkJZ7C2C/zelK22/p6127EZA6gf
	Lzhlb6hBQccBmdHIe+QiaUG29kVc12jLjW+MRJrRTdfmaoFg8HRyTgxN+WRFe5b7HEGn
	E6ZVChsRD6RqmiAQTCBWSGHowTXLLi3bdFsA+Vojl9haJEHbSD+tP+3Rq2h8YT2MC5Fr
	NBkI9XOEbrHKhSQdAGO7f4XKzegJ4jJ/4w8G4BSWTCLI+ojWoeRS/gl6q15CQDJMagVN
	WT5lmgkp8S99aLemmFaiPSAF+qTjrDETsy5GzplE/OE367IzAw0lSOisvWKIXYEpzFID
	AuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BoZN6Ha4TWG5zwNFtLwuPQg7SziuCnHFLPmwMdih9WY=;
	b=F9BuEMfJDwT+X2Td2RmXHBH8pfqipt749XCEEaJBqyBmVgK+tO7HveU74AxoGzfkrU
	jVchwDGYU/2KaFf2GsFHol7b9xVGoao8HpcXEsbXyVQ4wIgp+tAx1x3R1cFYz95aCzpD
	9ceApKz3vZXqUHUZO74cKbhCQhidB+q6IxzHKCLEzqrKXG5HXVwZS7qGflovD7nLIsn2
	uF0rXTfe9oY9PvRVmKeVmw2q8xw6UCfhY1yNjopU50ROY8y523z4dAacwOo/3Gyjv7Vn
	eRuyiskfmbOt1CLemtADfyQlh45hYNtkHKEcfant3ECW5GJjKZbQEhojEs1dX/nspbEf
	ljrQ==
X-Gm-Message-State: AEkoouvAe1fvaDpLRglz31Kfg3HoBbOEPjgHOUgP2mVV8EZ69Oj69qpJrL7dK/hYz9EGkysvhVN4XXclsSniaw==
X-Received: by 10.55.16.232 with SMTP id 101mr23640859qkq.151.1469456098623;
	Mon, 25 Jul 2016 07:14:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 25 Jul 2016 07:14:57 -0700 (PDT)
In-Reply-To: <1469455403.6896.29.camel@ts.fujitsu.com>
References: <1469194596.6594.13.camel@ts.fujitsu.com>
	<CAMKF1srBan-tupS7qGb3kDnAn-2-u8dox3vFk5ssGwQLzeGaHw@mail.gmail.com>
	<1469455403.6896.29.camel@ts.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Jul 2016 07:14:57 -0700
Message-ID: <CAMKF1soyDLFePf+JqwQeyqCeig=CeZqHADwJJ7yZ=Nz9PcW0Hg@mail.gmail.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building for armv7athf-neon but toolchain is softfp
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
X-List-Received-Date: Mon, 25 Jul 2016 14:15:00 -0000
Content-Type: multipart/alternative; boundary=001a113fe378c5abc105387668d6

--001a113fe378c5abc105387668d6
Content-Type: text/plain; charset=UTF-8

On Monday, July 25, 2016, thilo.cestonaro@ts.fujitsu.com <
thilo.cestonaro@ts.fujitsu.com> wrote:

> Hey Khem!
>
> Thanks for your answer!
>
> > >
> > > I want to build my own dist and a sdk for it. The dist is working and
> is as expected by the DEFAULT_TUNE of "armv7athf-neon", hardfp.
> > >
> > > But the TARGET_SYS in the bitbake header always tells me, that the
> toolchain it uses is "...-gnueabi". Not "hf" in there?!
> > > Thats the first thing what I can't figure out.
> > We do not rely on target triplet. calling convention is determined by
> > -mfloat-abi switch that is what OE relies on.
> >
>
> Ok. Understood. But even when I build with -mfloat-abi=hard (and the VFP
> Register Entry is there with readelf, on build machine and target).
> I can't do ldd helloworld on the target.
>
>
>
> > >
> > > The other thing is, when I now use the sdk, after successfully
> populating it, the toolchain in there has the default -mfloat-abi=softfp ...
> > > But even when I compile with -mfloat-abi=hard, the executable which I
> get, segfaults on the target and ldd tells me "not a dynamic executable".
> > > But readelf (on the target or host) tells me, that "Tag_ABI_VFP_args:
> VFP registers" (which is detection for hardfp, right?).
> > > And I miss the "hf" at the gnueabi in the sdk toolchain.
> > Is target running the image build by you as well ? and prefereably
> > build in same sandbox as the SDK
> > if not then you need to figure out how the image was built.  what is
> > output of ls /lib/ld-*
>
> It's a krogoth build with callconvention-hard enabled via DEFAULTTUNE.
> And I have one recipe for the image and one for the sdk toolchain. So the
> "Build" are two bitbake calls.
>
> HOST with SDK:
> $ . /opt/amana-sdk/sdk-environment
> $ echo $CXX
> arm-magna-linux-gnueabi-g++ -march=armv7-a -marm -mfpu=neon
> -mfloat-abi=hard
> --sysroot=/opt/amana-sdk/4.0-1469450812/sysroots/armv7ahf-neon-magna-linux-gnueabi
> $ ${CXX} -o helloworld helloworld.cpp
> $ scp helloworld target:/usr/bin
>
>
> TARGET:
> # ldd /lib/libc.so.6
>         /lib/ld-linux-armhf.so.3 (0xb6f41000)
> # ls -l /lib/ld-*
> -rwxr-xr-x    1 root     root        134396 Jul 22 10:56 /lib/ld-2.23.so
> lrwxrwxrwx    1 root     root            10 Jul 22 10:56
> /lib/ld-linux-armhf.so.3 -> ld-2.23.so
>
> # /usr/bin/helloworld
> Segmentation fault
>
> # ldd /usr/bin/helloworld
>         not a dynamic executable
>
> # readelf -A /usr/bin/helloworld
> Attribute Section: aeabi
> File Attributes
>   Tag_CPU_name: "7-A"
>   Tag_CPU_arch: v7
>   Tag_CPU_arch_profile: Application
>   Tag_ARM_ISA_use: Yes
>   Tag_THUMB_ISA_use: Thumb-2
>   Tag_FP_arch: VFPv3
>   Tag_Advanced_SIMD_arch: NEONv1
>   Tag_ABI_PCS_wchar_t: 4
>   Tag_ABI_FP_rounding: Needed
>   Tag_ABI_FP_denormal: Needed
>   Tag_ABI_FP_exceptions: Needed
>   Tag_ABI_FP_number_model: IEEE 754
>   Tag_ABI_align_needed: 8-byte
>   Tag_ABI_align_preserved: 8-byte, except leaf SP
>   Tag_ABI_enum_size: int
>   Tag_ABI_VFP_args: VFP registers
>   Tag_CPU_unaligned_access: v6
>
> # readelf -h /usr/bin/helloworld
> ELF Header:
>   Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
>   Class:                             ELF32
>   Data:                              2's complement, little endian
>   Version:                           1 (current)
>   OS/ABI:                            UNIX - System V
>   ABI Version:                       0
>   Type:                              EXEC (Executable file)
>   Machine:                           ARM
>   Version:                           0x1
>   Entry point address:               0x85f4
>   Start of program headers:          52 (bytes into file)
>   Start of section headers:          42264 (bytes into file)
>   Flags:                             0x5000400, Version5 EABI, hard-float
> ABI
>   Size of this header:               52 (bytes)
>   Size of program headers:           32 (bytes)
>   Number of program headers:         8
>   Size of section headers:           40 (bytes)
>   Number of section headers:         39
>   Section header string table index: 36
>
>
> Any idea what's wrong here??
> I don't get it.


Seems steps are all ok. Can you upload your hello world somewhere.

>
> Cheers,
> Thilo

--001a113fe378c5abc105387668d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, July 25, 2016, <a href=3D"mailto:thilo.cestonaro@ts.fuji=
tsu.com">thilo.cestonaro@ts.fujitsu.com</a> &lt;<a href=3D"mailto:thilo.ces=
tonaro@ts.fujitsu.com">thilo.cestonaro@ts.fujitsu.com</a>&gt; wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Hey Khem!<br>
<br>
Thanks for your answer!<br>
<br>
&gt; &gt;=C2=A0<br>
&gt; &gt; I want to build my own dist and a sdk for it. The dist is working=
 and is as expected by the DEFAULT_TUNE of &quot;armv7athf-neon&quot;, hard=
fp.<br>
&gt; &gt;<br>
&gt; &gt; But the TARGET_SYS in the bitbake header always tells me, that th=
e toolchain it uses is &quot;...-gnueabi&quot;. Not &quot;hf&quot; in there=
?!<br>
&gt; &gt; Thats the first thing what I can&#39;t figure out.<br>
&gt; We do not rely on target triplet. calling convention is determined by<=
br>
&gt; -mfloat-abi switch that is what OE relies on.<br>
&gt;<br>
<br>
Ok. Understood. But even when I build with -mfloat-abi=3Dhard (and the VFP =
Register Entry is there with readelf, on build machine and target).<br>
I can&#39;t do ldd helloworld on the target.=C2=A0<br>
<br>
<br>
<br>
&gt; &gt;<br>
&gt; &gt; The other thing is, when I now use the sdk, after successfully po=
pulating it, the toolchain in there has the default -mfloat-abi=3Dsoftfp ..=
.<br>
&gt; &gt; But even when I compile with -mfloat-abi=3Dhard, the executable w=
hich I get, segfaults on the target and ldd tells me &quot;not a dynamic ex=
ecutable&quot;.<br>
&gt; &gt; But readelf (on the target or host) tells me, that &quot;Tag_ABI_=
VFP_args: VFP registers&quot; (which is detection for hardfp, right?).<br>
&gt; &gt; And I miss the &quot;hf&quot; at the gnueabi in the sdk toolchain=
.<br>
&gt; Is target running the image build by you as well ? and prefereably<br>
&gt; build in same sandbox as the SDK<br>
&gt; if not then you need to figure out how the image was built.=C2=A0=C2=
=A0what is<br>
&gt; output of ls /lib/ld-*<br>
<br>
It&#39;s a krogoth build with callconvention-hard enabled via DEFAULTTUNE.<=
br>
And I have one recipe for the image and one for the sdk toolchain. So the &=
quot;Build&quot; are two bitbake calls.<br>
<br>
HOST with SDK:<br>
$ . /opt/amana-sdk/sdk-environment<br>
$ echo $CXX<br>
arm-magna-linux-gnueabi-g++ -march=3Darmv7-a -marm -mfpu=3Dneon -mfloat-abi=
=3Dhard --sysroot=3D/opt/amana-sdk/4.0-1469450812/sysroots/armv7ahf-neon-ma=
gna-linux-gnueabi<br>
$ ${CXX} -o helloworld helloworld.cpp=C2=A0<br>
$ scp helloworld target:/usr/bin<br>
<br>
<br>
TARGET:<br>
# ldd /lib/libc.so.6=C2=A0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/ld-linux-armhf.so.3 (0xb6f41000)<br>
# ls -l /lib/ld-*<br>
-rwxr-xr-x=C2=A0=C2=A0=C2=A0=C2=A01 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0root=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0134396 Jul 22 10:56 /lib/<a=
 href=3D"http://ld-2.23.so" target=3D"_blank">ld-2.23.so</a><br>
lrwxrwxrwx=C2=A0=C2=A0=C2=A0=C2=A01 root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0root=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010 =
Jul 22 10:56 /lib/ld-linux-armhf.so.3 -&gt; <a href=3D"http://ld-2.23.so" t=
arget=3D"_blank">ld-2.23.so</a><br>
<br>
# /usr/bin/helloworld<br>
Segmentation fault<br>
<br>
# ldd /usr/bin/helloworld=C2=A0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 not a dynamic executable<br>
<br>
# readelf -A /usr/bin/helloworld=C2=A0<br>
Attribute Section: aeabi<br>
File Attributes<br>
=C2=A0 Tag_CPU_name: &quot;7-A&quot;<br>
=C2=A0 Tag_CPU_arch: v7<br>
=C2=A0 Tag_CPU_arch_profile: Application<br>
=C2=A0 Tag_ARM_ISA_use: Yes<br>
=C2=A0 Tag_THUMB_ISA_use: Thumb-2<br>
=C2=A0 Tag_FP_arch: VFPv3<br>
=C2=A0 Tag_Advanced_SIMD_arch: NEONv1<br>
=C2=A0 Tag_ABI_PCS_wchar_t: 4<br>
=C2=A0 Tag_ABI_FP_rounding: Needed<br>
=C2=A0 Tag_ABI_FP_denormal: Needed<br>
=C2=A0 Tag_ABI_FP_exceptions: Needed<br>
=C2=A0 Tag_ABI_FP_number_model: IEEE 754<br>
=C2=A0 Tag_ABI_align_needed: 8-byte<br>
=C2=A0 Tag_ABI_align_preserved: 8-byte, except leaf SP<br>
=C2=A0 Tag_ABI_enum_size: int<br>
=C2=A0 Tag_ABI_VFP_args: VFP registers<br>
=C2=A0 Tag_CPU_unaligned_access: v6<br>
<br>
# readelf -h /usr/bin/helloworld=C2=A0<br>
ELF Header:<br>
=C2=A0 Magic:=C2=A0=C2=A0=C2=A07f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00=
 00=C2=A0<br>
=C2=A0 Class:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ELF32<br>
=C2=A0 Data:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02&#39;s complement, little endian=
<br>
=C2=A0 Version:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A01 (current)<br>
=C2=A0 OS/ABI:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0UNIX - System V<br>
=C2=A0 ABI Version:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00<br>
=C2=A0 Type:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0EXEC (Executable file)<br>
=C2=A0 Machine:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ARM<br>
=C2=A0 Version:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A00x1<br>
=C2=A0 Entry point address:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x85f4<br>
=C2=A0 Start of program headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A052 (bytes into file)<br>
=C2=A0 Start of section headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A042264 (bytes into file)<br>
=C2=A0 Flags:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x5000400, Version5 EABI, hard-float=
 ABI<br>
=C2=A0 Size of this header:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A052 (bytes)<br>
=C2=A0 Size of program headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A032 (bytes)<br>
=C2=A0 Number of program headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A08<br>
=C2=A0 Size of section headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A040 (bytes)<br>
=C2=A0 Number of section headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A039<br>
=C2=A0 Section header string table index: 36<br>
<br>
<br>
Any idea what&#39;s wrong here??<br>
I don&#39;t get it.</blockquote><div><br></div><div>Seems steps are all ok.=
 Can you upload your hello world somewhere.=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
Cheers,<br>
Thilo</blockquote>

--001a113fe378c5abc105387668d6--
