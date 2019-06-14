Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id D60027E982
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 13:33:56 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id s184so1945922oie.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tTQPJYefYtTSVwxPb0seJMo+CeTV2825HJ6RkRisvfA=;
	b=L0JKqJ1OmakMDKnUGSEN3ZxS1rOcJIjIxgyyx0TIlACBZuJWntZtc2mFsonku9nd7H
	qsY7UGcFFbeYNcZUBW0G/XjJ8iQgdzfcy0igLslGwpAMpTfdF/e7upI0G8kljHLa7uVw
	28jmbR2smbq1KRnLufKKuEcL1y3og+Yp3OyVjQ3mhUFhiquvcmOtUvVL5Ao/C+jL6Ao5
	Ymf8u3gZbbzuG5v8954Xr9jds7jbujqk4kptiv22Md2yrIzNsriQulW0bk8fCzpyw4u/
	hz57OEK/16XNKvkhI2ktjUT36wc06GY+J35qKedkEb14auVDaz00GoGQh/gXXDDM93js
	s+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tTQPJYefYtTSVwxPb0seJMo+CeTV2825HJ6RkRisvfA=;
	b=nMQ1oVw4m/LoVMLSxN8PEn9qiyL2I39D4wVYLUaVkNr3lLIXM4kxAwZl34jLcShMBE
	3Pnm3y/iZmkHKiZUMyy6u7CW3CaoufWkUyJZvAXU7u9fXtRukhQwCi8/xb0wQ7F0m3pX
	P0uWSey3p88VDMKByc4NZSjhq1ISyKJTXLqtbq6I0V46hhpgQNpD/8mXctyk53+Dm6za
	emFJCdV54Lq0bQvgurXXfFY9HqRknHiluvWAeVmwEULBmIAnAJx7O9M+ew/XDtGfIXit
	DN8O5AiUKBFibZZFeCkbLpSmb3Ln8AuMSfJ+/W7pX561D3Vxs9psLLOxFG+7To+y5SL7
	6Ijw==
X-Gm-Message-State: APjAAAVlJsm/PQXMOSjaO0wXUEVHUDUnFG+jPTI/UgPKtBElL1gsPy97
	pTScxCDKy6mOR+x0OLzzaP/DjdETDNomBabI5nQ=
X-Google-Smtp-Source: APXvYqyQOu9hJBXjNHbLmxaxrOkya6+C7zQSoF5h8dAsdZ8zsK7Xsx1Q+jAu37hx2FNgp1ABqpZi7Qcpg6EgLYk/NE4=
X-Received: by 2002:aca:1819:: with SMTP id h25mr1051126oih.119.1560519237867; 
	Fri, 14 Jun 2019 06:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
	<f2348016a0867fd986bbe4965dcb88a5b652055f.camel@linuxfoundation.org>
	<99B005A2-CD21-4AA8-B960-54121098F850@gmail.com>
	<c85e93b13ddcbc27c27ac17fdcf97a0d1ffc4020.camel@linuxfoundation.org>
In-Reply-To: <c85e93b13ddcbc27c27ac17fdcf97a0d1ffc4020.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jun 2019 15:33:46 +0200
Message-ID: <CANNYZj-9xUFE0x9D_BpLiqkNitLmXnrv9n8boodZpE5bX-psgw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: kernel@pengutronix.de, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Fri, 14 Jun 2019 13:33:57 -0000
Content-Type: multipart/alternative; boundary="000000000000d69e35058b48b2d4"

--000000000000d69e35058b48b2d4
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Jun 2019 at 15:26, <richard.purdie@linuxfoundation.org> wrote:

> I guess if we can track down where the swrast dependency is coming and
> and change things to avoid it, that would probably be ok.
>

As Ross said, qemu bsp has this:

XSERVER ?= "xserver-xorg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
            xf86-video-fbdev \
            "
Dropping the swrast dependency will not help though, as it is provided by
the mesa-megadriver package, which will continue to include swrast as long
as it is enabled in the mesa recipe. mesa-megadriver is also pulled in
through other dependencies.

Alex

--000000000000d69e35058b48b2d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 14 Jun 2019 at 15:26, &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I guess if we can track down where the swr=
ast dependency is coming and<br>
and change things to avoid it, that would probably be ok.<br></blockquote><=
div><br></div><div>As Ross said, qemu bsp has this:</div><div><br></div><di=
v>XSERVER ?=3D &quot;xserver-xorg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;opengl&#39;,<br>
&#39;mesa-driver-swrast xserver-xorg-extension-glx&#39;, &#39;&#39;, d)} \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-video-fbdev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;</div><div>Dropping the swr=
ast dependency will not help though, as it is provided by the mesa-megadriv=
er package, which will continue to include swrast as long as it is enabled =
in the mesa recipe. mesa-megadriver is also pulled in through other depende=
ncies.<br></div><div><br></div><div>Alex<br></div></div></div>

--000000000000d69e35058b48b2d4--
