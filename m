Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 607E57C410
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 08:33:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o12so1313877wrn.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=od+UN4yruKkT7eOhTB3r+P3mdNV2V8LkqePhb7WfRng=;
	b=CP3Da33MV2JFk7VafvAT5iQHf2FXE/ie7EQDou3g8HPhycGVQ2QYH3EM3vSD1iAScz
	NGLQYIMZR9nQaTUaE5Acoix1nLKXVqvXYafM8Y5MyHjARz10JNU8c5enHKy8+J+yz0ui
	nFYs8Av1D0KISz+E20URwAnB9pxtSpeifK6VEEA69PxxZ8gZpxWkc8aC8yfg6arxbIuk
	+hGb4R5tbI0cNkHkqCs9Y56B2BBWm2GKcjlBYc+taF6L3NOCwu7oX6kgt+ClZ+3y+9Vt
	oyBbcVTpgTU9FQ7Di9AtyRiprwodzrUv86x7OU+4G/e4bhoGYG4iXqayslTGhpClMCkV
	UP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=od+UN4yruKkT7eOhTB3r+P3mdNV2V8LkqePhb7WfRng=;
	b=dqymiDTDMKybzbuh43d5/XNgQ1PykPHk9v4ExFqEAKyPjdbo8kQIFIQct8rM3IwML4
	i98EajBfTLEOaLpyvuFPh6FCizBuZ8dokdhxlK1s5hl8B5Cy81aEHsc08ARcnLai0KQF
	ymeBBJQXwmU5buXEcgIefd2KGnVp6kg0F+xhD+UzGtsT/7o9wdcBRwl/nylcCcaPkHvQ
	gI+FMapdJ3UmR2ROSsk0MutMbce3UGtqGNzEg2XcQnYKAZgjd3yfAPSbM2bcCkI8arYb
	5zNW9gqDflbFlAoAylB8DrAAI8RaomlCstzZFYraOlAlNTYpkQ114DvGXbZtIE2U6OPN
	MTFg==
X-Gm-Message-State: APjAAAWO73uBESYBLtjZVdP0I+6hQfcQXcQxYJgGCaorcLYxySPFJQsE
	VZWgvMRjycQIhwvQ8F6Ly1cEY3TCCG5Sb9a9x0I=
X-Google-Smtp-Source: APXvYqyHBReLO8a/HqYfcuheHwsozhTqYGMs4UAAZ+dZzhDyFgv7+tVUxVcO1+Vden3hJGa5jJJZUfP8qYRTmpUAVXo=
X-Received: by 2002:adf:e88f:: with SMTP id d15mr2188136wrm.260.1555490009791; 
	Wed, 17 Apr 2019 01:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554233389.git.pkj@axis.com>
	<8694f4c6a289db1fe45c24bc1ee9139458e09521.camel@linuxfoundation.org>
	<20190403062249.GB1281@localhost>
	<CAJ86T=Wfp+1mrgWZCOG5VrhONADi08yZXd4Fm3L2Txb1euyUuA@mail.gmail.com>
	<20190403202448.GA7131@localhost>
	<CAJ86T=Xs2z7yTeF20NWT31KGGyzEtibxj3zJWKTBWUE_18btow@mail.gmail.com>
In-Reply-To: <CAJ86T=Xs2z7yTeF20NWT31KGGyzEtibxj3zJWKTBWUE_18btow@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Apr 2019 10:33:18 +0200
Message-ID: <CA+chaQc3VwOJ6LM1=mF03cKYFJf0_kfPzGv_s-iUR0LxWUO1dQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 0/6] Correct and improve the ARM tunings
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
X-List-Received-Date: Wed, 17 Apr 2019 08:33:29 -0000
Content-Type: multipart/alternative; boundary="0000000000007c40e30586b5bd2e"

--0000000000007c40e30586b5bd2e
Content-Type: text/plain; charset="UTF-8"

It's not caused by this change (not the previous one I believe), but today
I've noticed that aarch64 tunes don't set TUNE_PKGARCH correctly.

e.g. with raspberrypi3-64 which since this commit:
https://github.com/agherzan/meta-raspberrypi/commit/9cc89cb7341d633b6fc3a92b937b5560d26257a1
uses conf/machine/include/tune-cortexa53.inc I was expecting it to use
cortexa53 specific TUNE_PKGARCH (and stop messing with other MACHINEs which
are using aarch64 package feed).

There is indeed:
DEFAULTTUNE="cortexa53"
and mcpu=cortex-a53+crc in CC:
export CC="aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc
--sysroot=/OE/build/luneos-warrior/webos-ports/tmp-glibc/work/aarch64-webos-linux/zlib/1.2.11-r0/recipe-sysroot"

But
ARMPKGARCH="cortexa53"

# $TUNE_PKGARCH_32
#   set
/OE/build/luneos-warrior/webos-ports/openembedded-core/meta/conf/machine/include/arm/arch-arm64.inc:29
#
 "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
TUNE_PKGARCH_32="cortexa53"
#
# $TUNE_PKGARCH_64
#   set
/OE/build/luneos-warrior/webos-ports/openembedded-core/meta/conf/machine/include/arm/arch-arm64.inc:23
#     "aarch64${ARMPKGSFX_ENDIAN_64}"
TUNE_PKGARCH_64="aarch64"

#   "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}',
'${TUNE_PKGARCH_32}' ,d)}"
TUNE_PKGARCH="aarch64"

so the packages built with -mcpu=cortex-a53+crc (and rpi overrides) end in
the same TUNE_PKGARCH as other MACHINEs which include e.g.
conf/machine/include/arm/arch-arm64.inc and DEFAULTTUNE="aarch64" which
surprisingly uses aarch64 in both TUNE_PKGARCH_32/64:

#   "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}',
'${TUNE_PKGARCH_32}' ,d)}"
TUNE_PKGARCH="aarch64"
#
# $TUNE_PKGARCH_32
#   set
/OE/build/luneos-warrior/webos-ports/openembedded-core/meta/conf/machine/include/arm/arch-arm64.inc:29
#
 "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
TUNE_PKGARCH_32="aarch64"
#
# $TUNE_PKGARCH_64
#   set
/OE/build/luneos-warrior/webos-ports/openembedded-core/meta/conf/machine/include/arm/arch-arm64.inc:23
#     "aarch64${ARMPKGSFX_ENDIAN_64}"
TUNE_PKGARCH_64="aarch64"

Looks like aarch64 are even bigger mess than arm tunes already :/.

On Wed, Apr 3, 2019 at 10:48 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, Apr 3, 2019 at 1:24 PM Adrian Bunk <bunk@stusta.de> wrote:
> > On Wed, Apr 03, 2019 at 12:29:29PM -0700, Andre McCurdy wrote:
> > > On Tue, Apr 2, 2019 at 11:23 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > On Tue, Apr 02, 2019 at 09:26:46PM +0100, Richard Purdie wrote:
> > > > >...
> > > > > "armv4t" is defined in the arm tune files to mean "add
> -march=armv4t"
> > > > > which is the convention used throughout all the tune files.
> > > > >...
> > > >
> > > > Unfortunately this is not true.
> > > >
> > > > OE has both armv7a and armv7at tunes.
> > > >
> > > > There is no armv7a without Thumb support,
> > > > so no -march=armv7-at exists in gcc.
> > > >
> > > > Both armv7a and armv7at tunes pass the same march to gcc,
> > > > but [1] is not true:
> > > >   Default to using the Thumb-2 instruction set for armv7a and above.
> > > >
> > > > The hardware supports Thumb-2 in any case, the actual difference
> between
> > > > the armv7a and armv7at OE tunes is whether OE tells the compiler to
> > > > generate ARM or Thumb-2 code.
> > > >
> > > > OE has both armv6 and armv6t tunes.
> > > >
> > > > There is no armv6 without Thumb support
> > > > so no -march=armv6t exists in gcc.
> > > >
> > > > Some v6 support only Thumb-1 and some v6 support also Thumb-2,
> > > > so what gcc does have is an -march=armv6t2.
> > > > But OE lacks tunes for that.
> > > >
> > > > For matching the gcc options it would be correct to remove all
> > > > armv6t and armv7at tunes that have no coresponding gcc options,
> > > > and add armv6t2 tunes.
> > >
> > > Aligning the tuning options exposed via the machine config files to
> > > those supported by gcc seems like a worthy goal... but would be a big
> > > upheaval at this point.
> > >
> > > Note that the problem isn't specific to ARM. There are similar issues
> > > for x86, but there we seem happy to provide a very minimal abstraction
> > > with no attempt to track gcc. e.g. "corei7" hasn't been a documented
> > > -march option since gcc 4.8 and we (somewhat arbitrarily) map it to
> > > -march=nehalem to hide that fact from end users.
> > >
> > > So the high level question seems to be: should DEFAULTTUNE even
> > > attempt to provide a full featured mapping to the options provided by
> > > gcc? Are we happy to expose a limited subset without a 1:1 mapping for
> > > the options we do expose (current ARM approach) or is it better for
> > > DEFAULTTUNE to hide away all the complexity of the options provided by
> > > gcc (current x86 approach).
> >
> > The current 32bit ARM[1] approach seems to be an attempt
> > of a 1:1 mapping.
> >
> > For ARMv8 it is already obvious that DEFAULTTUNE is not long-term
> > maintainable, and duplicating all the gcc rules regarding feature
> > flags[2] also sounds like a pointless exercise.
> >
> > What are actually the benefits of DEFAULTTUNE with all the tune files,
> > compared to just let the user provide a string that is passed to -march?
>
> Restricting the user to a certain set of DEFAULTTUNE options means
> there will always be a valid mapping from DEFAULTTUNE to
> PACKAGE_EXTRA_ARCHS.
>
> If we let the user pass an arbitrary string to -march then we lose the
> ability to determine that (for example) it's safe for a
> "armv7athf-vfpv3" machine to pull from a "armv7athf-vfpv3d16" package
> feed.
>
> Whether or not anyone in the real world actually maintains a generic
> package feed and pulls from it from multiple machine specific builds
> (verses setting up separate package feeds for each DEFAULTTUNE they
> care about) would be an interesting question...
>
> > cu
> > Adrian
> >
> > [1] ARM <= v7, not the differing 32bit ABI of ARMv8
> > [2] example:
> > 'fp16fml'
> >      Enable FP16 fmla extension.  This also enables FP16 extensions and
> >      floating-point instructions.  This option is enabled by default for
> >      '-march=armv8.4-a'.  Use of this option with architectures prior to
> >      Armv8.2-A is not supported.
> >
> >
> > --
> >
> >        "Is there not promise of rain?" Ling Tan asked suddenly out
> >         of the darkness. There had been need of rain for many days.
> >        "Only a promise," Lao Er said.
> >                                        Pearl S. Buck - Dragon Seed
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007c40e30586b5bd2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr">It&#39;s not caused by this change (not the previous on=
e I believe), but today I&#39;ve noticed that aarch64 tunes don&#39;t set T=
UNE_PKGARCH correctly.<div><br></div><div>e.g. with raspberrypi3-64 which s=
ince this commit:</div><div><a href=3D"https://github.com/agherzan/meta-ras=
pberrypi/commit/9cc89cb7341d633b6fc3a92b937b5560d26257a1">https://github.co=
m/agherzan/meta-raspberrypi/commit/9cc89cb7341d633b6fc3a92b937b5560d26257a1=
</a><br></div><div>uses=C2=A0conf/machine/include/tune-cortexa53.inc I was =
expecting it to use cortexa53 specific TUNE_PKGARCH (and stop messing with =
other MACHINEs which are using aarch64 package feed).</div><div><br></div><=
div>There is indeed:</div><div>DEFAULTTUNE=3D&quot;cortexa53&quot;<br></div=
><div>and mcpu=3Dcortex-a53+crc in CC:</div><div><div>export CC=3D&quot;aar=
ch64-webos-linux-gcc=C2=A0 -mcpu=3Dcortex-a53+crc --sysroot=3D/OE/build/lun=
eos-warrior/webos-ports/tmp-glibc/work/aarch64-webos-linux/zlib/1.2.11-r0/r=
ecipe-sysroot&quot;</div></div><div><br></div><div>But</div><div>ARMPKGARCH=
=3D&quot;cortexa53&quot;<br></div><div><div><br></div><div># $TUNE_PKGARCH_=
32</div><div>#=C2=A0 =C2=A0set /OE/build/luneos-warrior/webos-ports/openemb=
edded-core/meta/conf/machine/include/arm/arch-arm64.inc:29</div><div>#=C2=
=A0 =C2=A0 =C2=A0&quot;${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARM=
PKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}&quot;</div><div>TUNE_PKGARC=
H_32=3D&quot;cortexa53&quot;</div><div>#</div><div># $TUNE_PKGARCH_64</div>=
<div>#=C2=A0 =C2=A0set /OE/build/luneos-warrior/webos-ports/openembedded-co=
re/meta/conf/machine/include/arm/arch-arm64.inc:23</div><div>#=C2=A0 =C2=A0=
 =C2=A0&quot;aarch64${ARMPKGSFX_ENDIAN_64}&quot;</div><div>TUNE_PKGARCH_64=
=3D&quot;aarch64&quot;</div></div><div><br></div><div><div>#=C2=A0 =C2=A0&q=
uot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;aarch64&#39;, &#39;$=
{TUNE_PKGARCH_64}&#39;, &#39;${TUNE_PKGARCH_32}&#39; ,d)}&quot;</div><div>T=
UNE_PKGARCH=3D&quot;aarch64&quot;</div></div><div><br></div><div>so the pac=
kages built with -mcpu=3Dcortex-a53+crc (and rpi overrides) end in the same=
 TUNE_PKGARCH as other MACHINEs which include e.g.</div><div>conf/machine/i=
nclude/arm/arch-arm64.inc and=C2=A0DEFAULTTUNE=3D&quot;aarch64&quot; which =
surprisingly uses aarch64 in both TUNE_PKGARCH_32/64:<br></div><div><br></d=
iv><div><div>#=C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#3=
9;, &#39;aarch64&#39;, &#39;${TUNE_PKGARCH_64}&#39;, &#39;${TUNE_PKGARCH_32=
}&#39; ,d)}&quot;</div><div>TUNE_PKGARCH=3D&quot;aarch64&quot;</div><div>#<=
/div><div># $TUNE_PKGARCH_32</div><div>#=C2=A0 =C2=A0set /OE/build/luneos-w=
arrior/webos-ports/openembedded-core/meta/conf/machine/include/arm/arch-arm=
64.inc:29</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;${ARMPKGARCH}${ARMPKGSFX_THU=
MB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}&quo=
t;</div><div>TUNE_PKGARCH_32=3D&quot;aarch64&quot;</div><div>#</div><div># =
$TUNE_PKGARCH_64</div><div>#=C2=A0 =C2=A0set /OE/build/luneos-warrior/webos=
-ports/openembedded-core/meta/conf/machine/include/arm/arch-arm64.inc:23</d=
iv><div>#=C2=A0 =C2=A0 =C2=A0&quot;aarch64${ARMPKGSFX_ENDIAN_64}&quot;</div=
><div>TUNE_PKGARCH_64=3D&quot;aarch64&quot;</div></div><div><br></div><div>=
Looks like aarch64 are even bigger mess than arm tunes already :/.</div></d=
iv></div></div></div></div></div></div></div></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 3, 2019 at 1=
0:48 PM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Apr 3, 2019 at 1:24 PM Adrian Bunk &lt;<a href=3D"mailto=
:bunk@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; On Wed, Apr 03, 2019 at 12:29:29PM -0700, Andre McCurdy wrote:<br>
&gt; &gt; On Tue, Apr 2, 2019 at 11:23 PM Adrian Bunk &lt;<a href=3D"mailto=
:bunk@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; &gt; &gt; On Tue, Apr 02, 2019 at 09:26:46PM +0100, Richard Purdie wro=
te:<br>
&gt; &gt; &gt; &gt;...<br>
&gt; &gt; &gt; &gt; &quot;armv4t&quot; is defined in the arm tune files to =
mean &quot;add -march=3Darmv4t&quot;<br>
&gt; &gt; &gt; &gt; which is the convention used throughout all the tune fi=
les.<br>
&gt; &gt; &gt; &gt;...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Unfortunately this is not true.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; OE has both armv7a and armv7at tunes.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; There is no armv7a without Thumb support,<br>
&gt; &gt; &gt; so no -march=3Darmv7-at exists in gcc.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Both armv7a and armv7at tunes pass the same march to gcc,<br=
>
&gt; &gt; &gt; but [1] is not true:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Default to using the Thumb-2 instruction set for=
 armv7a and above.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The hardware supports Thumb-2 in any case, the actual differ=
ence between<br>
&gt; &gt; &gt; the armv7a and armv7at OE tunes is whether OE tells the comp=
iler to<br>
&gt; &gt; &gt; generate ARM or Thumb-2 code.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; OE has both armv6 and armv6t tunes.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; There is no armv6 without Thumb support<br>
&gt; &gt; &gt; so no -march=3Darmv6t exists in gcc.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Some v6 support only Thumb-1 and some v6 support also Thumb-=
2,<br>
&gt; &gt; &gt; so what gcc does have is an -march=3Darmv6t2.<br>
&gt; &gt; &gt; But OE lacks tunes for that.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For matching the gcc options it would be correct to remove a=
ll<br>
&gt; &gt; &gt; armv6t and armv7at tunes that have no coresponding gcc optio=
ns,<br>
&gt; &gt; &gt; and add armv6t2 tunes.<br>
&gt; &gt;<br>
&gt; &gt; Aligning the tuning options exposed via the machine config files =
to<br>
&gt; &gt; those supported by gcc seems like a worthy goal... but would be a=
 big<br>
&gt; &gt; upheaval at this point.<br>
&gt; &gt;<br>
&gt; &gt; Note that the problem isn&#39;t specific to ARM. There are simila=
r issues<br>
&gt; &gt; for x86, but there we seem happy to provide a very minimal abstra=
ction<br>
&gt; &gt; with no attempt to track gcc. e.g. &quot;corei7&quot; hasn&#39;t =
been a documented<br>
&gt; &gt; -march option since gcc 4.8 and we (somewhat arbitrarily) map it =
to<br>
&gt; &gt; -march=3Dnehalem to hide that fact from end users.<br>
&gt; &gt;<br>
&gt; &gt; So the high level question seems to be: should DEFAULTTUNE even<b=
r>
&gt; &gt; attempt to provide a full featured mapping to the options provide=
d by<br>
&gt; &gt; gcc? Are we happy to expose a limited subset without a 1:1 mappin=
g for<br>
&gt; &gt; the options we do expose (current ARM approach) or is it better f=
or<br>
&gt; &gt; DEFAULTTUNE to hide away all the complexity of the options provid=
ed by<br>
&gt; &gt; gcc (current x86 approach).<br>
&gt;<br>
&gt; The current 32bit ARM[1] approach seems to be an attempt<br>
&gt; of a 1:1 mapping.<br>
&gt;<br>
&gt; For ARMv8 it is already obvious that DEFAULTTUNE is not long-term<br>
&gt; maintainable, and duplicating all the gcc rules regarding feature<br>
&gt; flags[2] also sounds like a pointless exercise.<br>
&gt;<br>
&gt; What are actually the benefits of DEFAULTTUNE with all the tune files,=
<br>
&gt; compared to just let the user provide a string that is passed to -marc=
h?<br>
<br>
Restricting the user to a certain set of DEFAULTTUNE options means<br>
there will always be a valid mapping from DEFAULTTUNE to<br>
PACKAGE_EXTRA_ARCHS.<br>
<br>
If we let the user pass an arbitrary string to -march then we lose the<br>
ability to determine that (for example) it&#39;s safe for a<br>
&quot;armv7athf-vfpv3&quot; machine to pull from a &quot;armv7athf-vfpv3d16=
&quot; package<br>
feed.<br>
<br>
Whether or not anyone in the real world actually maintains a generic<br>
package feed and pulls from it from multiple machine specific builds<br>
(verses setting up separate package feeds for each DEFAULTTUNE they<br>
care about) would be an interesting question...<br>
<br>
&gt; cu<br>
&gt; Adrian<br>
&gt;<br>
&gt; [1] ARM &lt;=3D v7, not the differing 32bit ABI of ARMv8<br>
&gt; [2] example:<br>
&gt; &#39;fp16fml&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Enable FP16 fmla extension.=C2=A0 This also enable=
s FP16 extensions and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 floating-point instructions.=C2=A0 This option is =
enabled by default for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;-march=3Darmv8.4-a&#39;.=C2=A0 Use of this op=
tion with architectures prior to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Armv8.2-A is not supported.<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Is there not promise of rain?&quot; L=
ing Tan asked suddenly out<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of the darkness. There had been need =
of rain for many days.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Only a promise,&quot; Lao Er said.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Pearl=
 S. Buck - Dragon Seed<br>
&gt;<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000007c40e30586b5bd2e--
