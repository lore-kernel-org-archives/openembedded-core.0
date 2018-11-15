Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 502206C0FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 11:35:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j26-v6so20844329wre.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 03:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4luwDsfVKMTMqM/ze2e+vg4u6KB0yz20Dp0Bnsn9kA0=;
	b=pZo0bkLGLcGTC+nUaWoPRbth3dN+j7gUy54uJbtyADqjThC1ueqqMDPwcegSvAA+2G
	0+eCRAiancTbPhCpORAdYruFKpjXHVJw+hyDDxCIrSRJ7bxFa+EWzyk3B1AxpE/bXhyi
	2GzxGVFKFiHiFEVLSwZu09QKanwcctNh977CGfA7Wdv/+DueA7636ycskA58Vj3cl0xc
	WM898bnpanbnZwv9sUE1jaL6pMk/fvRzyzRACeXOnY+uDNuRiEgQz/PLv7/qc0D83Xqu
	GcnuvwWe4e5ToUIGjCne1Srrf/gYdwEkPqqiKs1KjM1Qhrfw1+Hek6oe3Er4z1RU4GXI
	l+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4luwDsfVKMTMqM/ze2e+vg4u6KB0yz20Dp0Bnsn9kA0=;
	b=a2rIZ7Nj7gYpV6MEI0+RxuHWxDH7cDNrP8UOLo5iD+51n6G7EGT2tvLtd4VaJ9JdDE
	V/vIjZLO58vGse/utva+JKLVm5QO1bPK/D3HjPPbqPaujplmV/1gZsgghfdVyyiblEFr
	4xWep7Z6HTbUcVV9SCPa6bsm6zaGlXtDbgNzEp7WT1U4Wn6T0PP5LVmh7yPvLL58FOnM
	eVVn1n1E069ixd4PNRLV4D87PI494/gAhLgAyI3TFpkzvi6/PcS8iCp9yMpyqSWeJrJT
	OrZIKBfLTU2CMpK8OIDq0zHq+NdB4aCV0oKkrH3y/v2KMRKaO7aqhCis0YGJK2fZ3d0o
	XUGA==
X-Gm-Message-State: AGRZ1gLqqE4BxPUde1qzwjOsM2HGWcCSeTMIH20L03MQv4a6/t2oVdhb
	4Llcf7zUuyLMTKav8Sa66PS4H8KLPhP4Pf+b3/Q=
X-Google-Smtp-Source: AJdET5d6loST4zW/dvINVX01bFRTytdf0/s3G98NxmB4XHBvExa4uVXQgQzzj1AbP8WnKfPX9j9mrbGZ8lFH5jcY4vw=
X-Received: by 2002:a05:6000:151:: with SMTP id
	r17mr5495231wrx.53.1542281710803; 
	Thu, 15 Nov 2018 03:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20181115040043.9326-1-abrodkin@synopsys.com>
	<CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
	<2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
	<804b3db998a4d9efa0e9f8f649ea9741274be094.camel@synopsys.com>
	<20181115092758.GA1430@jama>
	<104a73697f5072fc3abcf7d9cce47e95ca2e8c12.camel@synopsys.com>
In-Reply-To: <104a73697f5072fc3abcf7d9cce47e95ca2e8c12.camel@synopsys.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Nov 2018 12:34:59 +0100
Message-ID: <CA+chaQd+_55SeR-61zi4DOU8iTyac=w-tEkBDJJvQb-3OvC8iA@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Marek Vasut <marex@denx.de>, linux-snps-arc@lists.infradead.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 11:35:10 -0000
Content-Type: multipart/alternative; boundary="000000000000842074057ab27195"

--000000000000842074057ab27195
Content-Type: text/plain; charset="UTF-8"

Hi,

yes fw-utils is similar, but has different dependencies and builds slightly
differently.

mkenvimage on the other hand is already built by current u-boot-mkimage
recipe, just not installed by default (adding separate recipe would build
it twice).

On Thu, Nov 15, 2018 at 11:32 AM Alexey Brodkin <alexey.brodkin@synopsys.com>
wrote:

> Hi Martin,
>
> On Thu, 2018-11-15 at 10:27 +0100, Martin Jansa wrote:
> > On Thu, Nov 15, 2018 at 05:15:03AM +0000, Alexey Brodkin wrote:
> > > Hi Marek,
>
> [snip]
>
> > > > Reviewed-by: Marek Vasut <marex@denx.de>
> > > >
> > > > That said, could the recipe for mkimage and mkenvimage be somehow
> > > > deduplicated ? There seems to be a lot of common stuff.
> > >
> > > I'd say why don't we just have one recipe for all U-Boot tools
> > > instead of adding tools one-by-one?
> >
> > Or add:
> >     install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
> >     ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
> >
> > to existing u-boot-mkimage recipe, that's what I'm doing in
> > u-boot-mkimage bbappend.
>
> Sure and indeed that was my initial intention but then I noticed
> there're separate recipes for mkimage and fw-utils and decided
> to act similarly.
>
> If OE people is fine with addition of another (pretty similar
> ideologically)
> utility in u-boot-mkimage_xx.bb then I'm happy to implement it that way.
>
> -Alexey
>

--000000000000842074057ab27195
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>yes fw-utils is similar, but has di=
fferent dependencies and builds slightly differently.</div><div><br></div><=
div>mkenvimage on the other hand is already built by current u-boot-mkimage=
 recipe, just not installed by default (adding separate recipe would build =
it twice).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Th=
u, Nov 15, 2018 at 11:32 AM Alexey Brodkin &lt;<a href=3D"mailto:alexey.bro=
dkin@synopsys.com">alexey.brodkin@synopsys.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Hi Martin,<br>
<br>
On Thu, 2018-11-15 at 10:27 +0100, Martin Jansa wrote:<br>
&gt; On Thu, Nov 15, 2018 at 05:15:03AM +0000, Alexey Brodkin wrote:<br>
&gt; &gt; Hi Marek,<br>
<br>
[snip]<br>
<br>
&gt; &gt; &gt; Reviewed-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de=
" target=3D"_blank">marex@denx.de</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; That said, could the recipe for mkimage and mkenvimage be so=
mehow<br>
&gt; &gt; &gt; deduplicated ? There seems to be a lot of common stuff.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;d say why don&#39;t we just have one recipe for all U-Boot =
tools<br>
&gt; &gt; instead of adding tools one-by-one?<br>
&gt; <br>
&gt; Or add:<br>
&gt;=C2=A0 =C2=A0 =C2=A0install -m 0755 tools/mkenvimage ${D}${bindir}/uboo=
t-mkenvimage<br>
&gt;=C2=A0 =C2=A0 =C2=A0ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage<br=
>
&gt; <br>
&gt; to existing u-boot-mkimage recipe, that&#39;s what I&#39;m doing in<br=
>
&gt; u-boot-mkimage bbappend.<br>
<br>
Sure and indeed that was my initial intention but then I noticed<br>
there&#39;re separate recipes for mkimage and fw-utils and decided<br>
to act similarly.<br>
<br>
If OE people is fine with addition of another (pretty similar ideologically=
)<br>
utility in <a href=3D"http://u-boot-mkimage_xx.bb" rel=3D"noreferrer" targe=
t=3D"_blank">u-boot-mkimage_xx.bb</a> then I&#39;m happy to implement it th=
at way.<br>
<br>
-Alexey<br>
</blockquote></div>

--000000000000842074057ab27195--
