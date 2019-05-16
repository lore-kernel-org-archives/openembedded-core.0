Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1143F7DF5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 11:48:41 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id n25so2777814wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 04:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ky3P9Dwn6xAKfd2mRHuDNh3ilhw+og2TEyqUYx6fKIw=;
	b=k5ClgbXK9Ki7cDIO15RbHnQ8h0RHr4t6SA+G7PJu40m2otZZVqMMJV5nMG4zuwbFAf
	5PMBmNxEFvRh+oTGrXXIWLBaBwYCjH8GgQ88IeELHKdDoW3/4j4/47NyKQuToksO2k7A
	07IMKXqQkSx4m5UPj52NA7KjDRfDIXo052tiyiV52zEdVdtP5nVG4BHuZo0rEZGCwxYZ
	c6A0RWPgwOdluZHk6dBxgalKixVk269ghK7lDzEqu7Gq9mr7aldYQxjTqyuQtsTwhPQQ
	6MrkHNmmqfMLpqUxUofz2GWeFcbZnpNlNnn41rAIQ2KRKpT8emZZaEi2SoS34N+MEEYd
	A6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ky3P9Dwn6xAKfd2mRHuDNh3ilhw+og2TEyqUYx6fKIw=;
	b=S42WAyK27XRLnhJjuTHypWDSAKHro1NytgcVV3/ldCy92O6FKfSICtdJ36EH36Ky5W
	sweSoWflXRjL53W3UTERul8FkR5jw6eoVJPjsDBGZA3kgvpgqrYOEyUXTU3Si8oGfQ76
	ryYzMCGkaK+CWOPfXem9Gx/anoQmAOfRgFM5obbttfjOTLCckyeoLNjHX7kdhTSoC+2B
	3lpAI4U9eu9wAjZCFgjL+tcrA1htYiQ0GXq1KTy0ptE9C91JWofa0SBrByKVXozKG+Tr
	gzb5YF6JZ8v78c9ISBTZv26sNLGLA43w/vpEDaaofc0NwypG89K2xw6VYAG0DWeBKEMu
	TM0Q==
X-Gm-Message-State: APjAAAVH95XygkjgJtx9CH3zGbmU3kTTglevdtIdkVUbBtlcK78inuAX
	Tfx98c4IFDRzRJJuMIsb/7ufCzWh//boeF2/SbwCYCIp2JEH5w==
X-Google-Smtp-Source: APXvYqy4jDBBKnIydYnxuyiLPFJaNzgP5hhdaLUrAjnQePzeelk+TQkQdj/5ZTwNceWJRx1X1J48CEyWczFIC2Gus34=
X-Received: by 2002:a1c:7dcf:: with SMTP id y198mr15505857wmc.94.1558007322557;
	Thu, 16 May 2019 04:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <1557948156-10879-1-git-send-email-liu.ming50@gmail.com>
	<9c2a9bbda97c6540061fd7a945f9d3eba0f1453c.camel@linuxfoundation.org>
	<CALatG=6FxLPZi00XyRWrbrcsZcnYxjqCJ_ogJK_7q9BwLBWLtg@mail.gmail.com>
	<46f68dd583b461731b675936391cd031d8331cf3.camel@linuxfoundation.org>
In-Reply-To: <46f68dd583b461731b675936391cd031d8331cf3.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 16 May 2019 13:48:31 +0200
Message-ID: <CALatG=618wgNHnAoRj+sRUDb9fip5vKzw1fMcNbpMzFrFQK2MQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Stefan Agner <stefan.agner@toradex.com>, Luka Pivk <luka.pivk@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: handle UBOOT_CONFIG in image.bbclass
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
X-List-Received-Date: Thu, 16 May 2019 11:48:42 -0000
Content-Type: multipart/alternative; boundary="00000000000004c3090588ffd9ce"

--00000000000004c3090588ffd9ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I wonder if we need to make it warn about missing functionality if
someone is using the old option though?

Agreed, will do that in V2.

//Ming Liu

<richard.purdie@linuxfoundation.org> =E6=96=BC 2019=E5=B9=B45=E6=9C=8816=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8812:55=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On Thu, 2019-05-16 at 10:56 +0200, Ming Liu wrote:
> > Hi, Richard:
> >
> > > I'd imagine the code is designed so you'd inherit uboot-config in
> > the machine and this therefore could be made to work as is.
> >
> > Yes, that probably is how the author intended it to be used, but
> > unfortunately, that's not how it's being used in BSP layers, that
> > fact is, in most BSP meta layers, they do not put it into INHERIT,
> > only u-boot recipes are inheriting uboot-config.
> >
> > I am on board there is no need to set IMAGE_FSTYPES in uboot-
> > config.bbclass, maybe we should drop it from UBOOT_CONFIG and it
> > would be like: 'UBOOT_CONFIG =3D "config,,binary"', there will be a
> > empty item in the middle, so the BSP meta layers would work as usual.
> >
> > Will send a V2 if you agree with this.
>
> I agree, I wonder if we need to make it warn about missing
> functionality if someone is using the old option though?
>
> Cheers,
>
> Richard
>
>

--00000000000004c3090588ffd9ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; I wonder if we need to make it warn about missin=
g functionality if someone is using the old option though?<br></div><div><b=
r></div>Agreed, will do that in V2.<div><br></div><div>//Ming Liu</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">&lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxf=
oundation.org</a>&gt; =E6=96=BC 2019=E5=B9=B45=E6=9C=8816=E6=97=A5 =E9=80=
=B1=E5=9B=9B =E4=B8=8B=E5=8D=8812:55=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2019-05-16 at 10:56=
 +0200, Ming Liu wrote:<br>
&gt; Hi, Richard:<br>
&gt; <br>
&gt; &gt; I&#39;d imagine the code is designed so you&#39;d inherit uboot-c=
onfig in<br>
&gt; the machine and this therefore could be made to work as is.<br>
&gt; <br>
&gt; Yes, that probably is how the author intended it to be used, but<br>
&gt; unfortunately, that&#39;s not how it&#39;s being used in BSP layers, t=
hat<br>
&gt; fact is, in most BSP meta layers, they do not put it into INHERIT,<br>
&gt; only u-boot recipes are inheriting uboot-config.<br>
&gt; <br>
&gt; I am on board there is no need to set IMAGE_FSTYPES in uboot-<br>
&gt; config.bbclass, maybe we should drop it from UBOOT_CONFIG and it<br>
&gt; would be like: &#39;UBOOT_CONFIG =3D &quot;config,,binary&quot;&#39;, =
there will be a<br>
&gt; empty item in the middle, so the BSP meta layers would work as usual.<=
br>
&gt; <br>
&gt; Will send a V2 if you agree with this.<br>
<br>
I agree, I wonder if we need to make it warn about missing<br>
functionality if someone is using the old option though?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--00000000000004c3090588ffd9ce--
