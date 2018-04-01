Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 50B7E746D5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 16:09:03 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id bj1-v6so345039plb.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2018 09:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LZug6bjESKQK+VBlx0x/yPtSZij1pZ5QBdYnGrdP9hQ=;
	b=R2UGLdn8N2QheNxGhk0GnAiQlfOcFrKaj3y3KdX0iCwjdXYz4jzSk+67iVdqgGb0+3
	Z5EuIBxHIeNAfSN0TGxz7heVpmzRbURJRAQfjIAY+W2NBdcPHhQSwrXpRGK/RDg4jWUa
	Fe0lmgClodGghLIB2sEYH3kuBk6+RS7I+QjOfevku0cEACmdEphnfsEv3eNzGfsDK97r
	yDf6jiSxLdv8v/hIDH/udXRinOwfIUzUZUwRgL2hRDjJkdEps32YMzZbc+GkUZ4HaRPx
	ZmHBPlWM/0B3iUMUkbJyHdMFoJcVFr9YCM9MYRzB7+rDydVkmyHDpcAlrgPR4Cg2H8PZ
	1tNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LZug6bjESKQK+VBlx0x/yPtSZij1pZ5QBdYnGrdP9hQ=;
	b=hb6CwiMfO6yFgKSXwD2qXqo/rPcjfoHdplRAr3uNvFuYiJ3S1/sPEzFvLsN2nikIEA
	OucnG9Wa2GYqQ22SfiLHI2cudoavJ3kAFbI07mnICeq4JKfn/EAQOL0Vm0c6+GiiOwxe
	RqN56wleWcLWHWRLedYHsM91P779Kh/NrzvR7R2pw/3FYkvF/53o4eXFRvXGQjCyX2Tt
	wxAGh7KvJjo1UfPy7hDcfYc8m3ygvOy07DqAtPHiURYTky6jpn4sKZiDySBtIzBKdTAU
	YwrBxBT3AxElKx6M06Lw9RfwWDaDJ+LN+aaD+8kxlzi+Op56U4iSxxXVZErgPiqiWMQ5
	SvsQ==
X-Gm-Message-State: AElRT7EDjm9gH/E/zU02tM9oAnl4SxVs258d6mr7COyIdCZlHEuY4gcn
	fVEikkAJ6qYm/iJbRHXGvsgoDU1Ez6QcWmZ+3b8=
X-Google-Smtp-Source: AIpwx4/ITZFsmWrdo0Oik1+nhTsUqbXmKn99BNkuC0jobOidO0tjRTMrbYIGhHoSaWdvQby/IbplmBN/RIzVFbT2aAI=
X-Received: by 2002:a17:902:63:: with SMTP id
	90-v6mr6806720pla.125.1522598944965; 
	Sun, 01 Apr 2018 09:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <BN6PR1201MB0195CA6828AEB411745386138BA70@BN6PR1201MB0195.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR1201MB0195CA6828AEB411745386138BA70@BN6PR1201MB0195.namprd12.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 01 Apr 2018 16:08:54 +0000
Message-ID: <CAMKF1sr_e2do5gDUtsgn_BuT_x5tkDEChyoBuacb1kfW1YBrKg@mail.gmail.com>
To: chris.laplante@agilent.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Question about native recipes
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
X-List-Received-Date: Sun, 01 Apr 2018 16:09:04 -0000
Content-Type: multipart/alternative; boundary="000000000000400b030568cbb163"

--000000000000400b030568cbb163
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 1, 2018 at 8:53 AM Chris Laplante via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> Hello,
>
>
>
> Suppose I have a native recipe that installs a large (~1 =E2=80=93 2 GB) =
amount of
> stuff. It=E2=80=99s needed by about 20 or 30 recipes. I=E2=80=99d rather =
not install that
> 1-2 GB into every recipe=E2=80=99s recipe-sysroot-native, because that wi=
ll consume
> a ton of disk space. Is there any way I can change my native recipe to
> install to a common location?
>
>
Recipe specific sysroot uses hard links to a commons location isn=E2=80=99t=
 that
happening in your build

>
>
> Thanks,
>
> Chris
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000400b030568cbb163
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Sun, Apr 1, 2018 a=
t 8:53 AM Chris Laplante via Openembedded-core &lt;<a href=3D"mailto:openem=
bedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_-6036286419628848822WordSection1">
<p class=3D"MsoNormal">Hello,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Suppose I have a native recipe that installs a large=
 (~1 =E2=80=93 2 GB) amount of stuff. It=E2=80=99s needed by about 20 or 30=
 recipes. I=E2=80=99d rather not install that 1-2 GB into every recipe=E2=
=80=99s recipe-sysroot-native, because that will consume a ton of disk
 space. Is there any way I can change my native recipe to install to a comm=
on location? =C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u></p></div></div></blockquote><div dir=3D"auto=
"><br></div><div dir=3D"auto">Recipe specific sysroot uses hard links to a =
commons location isn=E2=80=99t that happening in your build=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#9=
54F72"><div class=3D"m_-6036286419628848822WordSection1"><p class=3D"MsoNor=
mal">=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Chris<u></u><u></u></p>
</div>
</div>

--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000400b030568cbb163--
