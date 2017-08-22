Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 91BA478289
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 10:26:29 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id d12so1615785uag.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DZanqg35TN8Q/M/sjsnYfJRAU1Du7Q9Clku6Hn5zETg=;
	b=Gzb5G21tLe7o0AWk7A7yucEVbWJXoBAWetMrNq0B0azxaBY/NY26AeFqQ58Wve8EKD
	nqBxkRZsqFphQ0oN8tJcsaBDoM2nVdpsefl3UwM7pdcf5KBCqc339Asj1EfZrj6hD/4Q
	SXeOUSY+9bSEF+9PG8+9eJsUYubIjIbX5Wh51DLrOfI7MUrcc+r5JgLfYKALxJtyeA6Q
	KxhQ6D73Xi/bxgVnEECDOYiX4VF1FK9DRt/bsci6tE0XDSZkzbc4f8A9iBkZ6eO48Ema
	UcSmB6wo/bv8JMq2Ic2cVwad/lp2px1WRqdX1eEsP6fwfNm5r5FpjitaqcP8QOpBMN2P
	jx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DZanqg35TN8Q/M/sjsnYfJRAU1Du7Q9Clku6Hn5zETg=;
	b=MIp8Ptr73DKRaUk2E6xb8Y5eS+hXMUQuSr4eGZ/zQ40nLhDgqym946D8n4G7Frswsu
	bGuUha9zomvF7DHJZ7QX38fBWC0aOTy+NvuKFYQJFVXnf46Yx35aaYVWpkdy6a4Px+kx
	rIRtG8Me/vImDusiS9AwNhbPImcrTF0oI4ZpIZUT0b/gCaG5ML9QL4hHCr1Z28DBqkI6
	Yf+JLraXz8A1eFUcs9+jc/UV5qwWPrShXShCUggAhyViNL2NRIdjcruDtmJjqEusuC/C
	RYRFjVPITyhYfbEHF3ca95mM4LmkfEI7VTuUPmdDxJZ+m4Xq/vAYbZNiyp+7XjtFj8dX
	dVgg==
X-Gm-Message-State: AHYfb5hIkhh+B+A71cYSySyd2hwykekmWIiC/dnnU8x6KEx1nA8aHB5j
	uoq7OeZ4hfciAz6AIHVa27AOskjAwQ==
X-Received: by 10.176.81.23 with SMTP id e23mr104082uaa.2.1503397590446; Tue,
	22 Aug 2017 03:26:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Tue, 22 Aug 2017 03:26:29 -0700 (PDT)
In-Reply-To: <1503397329.32591.79.camel@linuxfoundation.org>
References: <20170821205721.20086-1-Martin.Jansa@gmail.com>
	<20170821205721.20086-2-Martin.Jansa@gmail.com>
	<1503397329.32591.79.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 22 Aug 2017 11:26:29 +0100
Message-ID: <CA+chaQfHU-5Jp2Q7171mcJkX8YGnFpngYG39PWeW4WhCjWp+bw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] grub2: fix build with gcc-7
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
X-List-Received-Date: Tue, 22 Aug 2017 10:26:29 -0000
Content-Type: multipart/alternative; boundary="94eb2c191a8a55b5be05575507f9"

--94eb2c191a8a55b5be05575507f9
Content-Type: text/plain; charset="UTF-8"

I'm sorry for the issues caused by this, can you share config.log from that
build? Maybe the native compiler on that build host doesn't support this
option?

On Tue, Aug 22, 2017 at 11:22 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2017-08-21 at 22:57 +0200, Martin Jansa wrote:
> > * build with gcc-7 fails with:
> >   | ./config-util.h:1504:48: error: this use of "defined" may not
> > be   portable [-Werror=expansion-to-defined]
> >   |              || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
> >   |                                                 ^~~~~~~~~~~~~~~
> >   and we're not building on Apple or BSD, so we should be able
> >   to just ignoreit until it's resolved properly in some newer gnulib
> >   and imported from gnulib to grub-2
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-bsp/grub/grub-efi_2.02.bb | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> Sadly this appears to break grub-efi everywhere on the autobuilder,
> e.g.:
>
> https://autobuilder.yocto.io/builders/nightly-no-x11/
> builds/428/steps/BuildImages/logs/stdio
>
> I took a risk and tried to get this into M3 buts its not paid off and
> we'll need another rebuild :(.
>
> Cheers,
>
> Richard
>
>
>

--94eb2c191a8a55b5be05575507f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m sorry for the issues caused by this, can you share=
=C2=A0config.log from that build? Maybe the native compiler on that build h=
ost doesn&#39;t support this option?</div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Tue, Aug 22, 2017 at 11:22 AM, Richard Purdie <=
span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" =
target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, 2017-08-21 at 22=
:57 +0200, Martin Jansa wrote:<br>
&gt; * build with gcc-7 fails with:<br>
&gt; =C2=A0 | ./config-util.h:1504:48: error: this use of &quot;defined&quo=
t; may not<br>
&gt; be=C2=A0=C2=A0=C2=A0portable [-Werror=3Dexpansion-to-defined]<br>
&gt; =C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|| (defined _FORTIFY_SOURCE &amp;&amp; 0 &lt; _FORT=
IFY_SOURCE \<br>
&gt; =C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0^~~~~~~~~~<wbr>~~~~~<br>
&gt; =C2=A0 and we&#39;re not building on Apple or BSD, so we should be abl=
e<br>
&gt; =C2=A0 to just ignoreit until it&#39;s resolved properly in some newer=
 gnulib<br>
&gt; =C2=A0 and imported from gnulib to grub-2<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.02.bb" rel=3D=
"noreferrer" target=3D"_blank">grub-<wbr>efi_2.02.bb</a> | 6 ++++++<br>
&gt; =C2=A01 file changed, 6 insertions(+)<br>
<br>
</span>Sadly this appears to break grub-efi everywhere on the autobuilder,<=
br>
e.g.:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-no-x11/builds/428/=
steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://=
autobuilder.yocto.io/<wbr>builders/nightly-no-x11/<wbr>builds/428/steps/Bui=
ldImages/<wbr>logs/stdio</a><br>
<br>
I took a risk and tried to get this into M3 buts its not paid off and<br>
we&#39;ll need another rebuild :(.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br></div>

--94eb2c191a8a55b5be05575507f9--
