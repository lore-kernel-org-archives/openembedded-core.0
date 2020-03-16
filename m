Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	by mail.openembedded.org (Postfix) with ESMTP id 61037601E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 09:13:00 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id y138so2933428vsy.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FW1Nui9+S46EvjtHo/7d4c4IvUb/LZEgOR2QB9AXIRo=;
	b=m6WJIzYpiAtELGw/Y6cfEOzfEia4ceptg0+tNlpkwZuGHCY0r1OfS6VdwPXwVUS8Ix
	RJN6dlASCEdY/r+azZ3tkOC272eznBOXWB3U+c8ifDAj14F7yT2J5aAyNVaHhCRGXnXy
	BXxy5u0iXL7PKk9ASbiTThoeeWNoREY8LqhBiVCUl0yjWnpac9A6PLZE0OARFfKDKgeJ
	vIRpV1WTPe0e4DzK4njRN6D2ezj7iXGTHxlV7b7+Q1v2oR3Q4wHYi702bdbf1X70DiRV
	X0PD1fZNxEq1SKUhb6fguqYIxZ2J2P03Mtkz/oo+FUbzT7FJWqpL64LZN8L8MDwpRuY2
	1xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FW1Nui9+S46EvjtHo/7d4c4IvUb/LZEgOR2QB9AXIRo=;
	b=Liu+xGGrvU6pWnQmnwie4McuZUAxzzzKn3bKEohk3nvz5Xk9kkP2A/TyVbubx4vBeC
	XGwIa/91yjn9g9jkUahixymwkYh3BLqnqCt7CE5WQCCWHjH1wVT4X6QIQ+CLhH4VdnRM
	ZEGmOInEEtVs/RpdSFiaTz4Kuy61c1u1I05CXHCKChZ6qiS3cWgc3uNZQm6qbAQJw9Zi
	aKpa5/0wpsxr1AcgOflbOLeFNcodBaczOUzN60AQBE291YZkuOd/Rml+Ll3Vfl8AFiIN
	oACUTiFo4OOTlXAHISIrGBflwtai+ST4ANvZENVsDzCKfttoV/PSZf+8cEgMfuy50S7v
	Ubzw==
X-Gm-Message-State: ANhLgQ3TcwVmds/Bwn2xRQzFkWXsCpKUPBc3FRkwoYn23kJ5QFr6oU/D
	5yZcv6afFPgTVDTyklhdXbib7RAxrBUwWZosh8g=
X-Google-Smtp-Source: ADFU+vvF0tsaGosayutEgbbdBm/tmfQ+bFxvmg5fLIpTMKN8axmmMnhtsolW+8zzdBbfDg+wTlKJU8flxCP2h6DHXNU=
X-Received: by 2002:a67:1d03:: with SMTP id d3mr16460832vsd.25.1584349981030; 
	Mon, 16 Mar 2020 02:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <74a48760-cfec-a2ff-e50b-ebd5d70ae8d8@gmail.com>
In-Reply-To: <74a48760-cfec-a2ff-e50b-ebd5d70ae8d8@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Mar 2020 10:12:49 +0100
Message-ID: <CANNYZj_koSi=wyZ04G-xQQsvTeY79N4S=yTpw=rLUS-bmF2sVw@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: How to skip building kernel modules
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
X-List-Received-Date: Mon, 16 Mar 2020 09:13:00 -0000
Content-Type: multipart/alternative; boundary="000000000000d1bf6f05a0f539e9"

--000000000000d1bf6f05a0f539e9
Content-Type: text/plain; charset="UTF-8"

The way I read kernel.bbclass, you need to set CONFIG_MODULES=n in your
configuration through some mechanism; then they'll be skipped altogether.

Alex

On Mon, 16 Mar 2020 at 10:06, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> Hi,
>
> I'm using the linux-yocto kernel recipes together with additional kernel
> config fragments that I append in our custom distro layer. All required
> functionality is built into the kernel, so we don't install any kernel
> modules on target.
>
> What would be the correct way to save compilation time and skip
> building/packaging the kernel modules ? Do I need to provide a custom
> defconfig that explicitly disables all modules ?
>
> I can monkey-patch oe-core with the attached patch in order to achieve
> that goal, but I'm guessing something like this wouldn't be suitable for
> upstreaming ?
>
> Cheers,
> Jacob
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d1bf6f05a0f539e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The way I read kernel.bbclass, you need to set CONFIG=
_MODULES=3Dn in your configuration through some mechanism; then they&#39;ll=
 be skipped altogether.</div><div><br></div><div>Alex<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 16 M=
ar 2020 at 10:06, Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com">=
jacob.kroon@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi,<br>
<br>
I&#39;m using the linux-yocto kernel recipes together with additional kerne=
l <br>
config fragments that I append in our custom distro layer. All required <br=
>
functionality is built into the kernel, so we don&#39;t install any kernel =
<br>
modules on target.<br>
<br>
What would be the correct way to save compilation time and skip <br>
building/packaging the kernel modules ? Do I need to provide a custom <br>
defconfig that explicitly disables all modules ?<br>
<br>
I can monkey-patch oe-core with the attached patch in order to achieve <br>
that goal, but I&#39;m guessing something like this wouldn&#39;t be suitabl=
e for <br>
upstreaming ?<br>
<br>
Cheers,<br>
Jacob<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000d1bf6f05a0f539e9--
