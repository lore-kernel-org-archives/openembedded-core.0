Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9AC7D6B4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 15:20:20 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id 8so23028087uaz.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=miQ0RFvm9Lw0bVI7BiqHjXh0Gs3FHK4FU2wlF1BwBtU=;
	b=hgdoeLxRBot0VIzXYXvBNwJ/DWEBz9LzNLKXyNrrLHYMn2P6SqPFf+Js7y4bHJqq/H
	OWlyMURNNA1y3WS24qwomUHK1w/8sa2maTD84Bs6nBLaaJgwawxK/hUKB8ScnNiQZ/OB
	JdZROny/evo1r/Rchfq07s/4TrW8M+bWNSdTcF66KJorbKk78OKOd2TEV+l5n5O4EsoE
	zYGzgM/I1OmwTmn8UpNRlYhTe6Gl4YQF9mQlcvXJve0yoWeImE4XXQsafLhJ++Ue0Jvn
	74B7ZNlhtt0Rc7ZfyNUF1eO5cbi8XwDi7ewdLhB1/xVahYEpat/Uel3L3LDSZAL2XEvq
	25Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=miQ0RFvm9Lw0bVI7BiqHjXh0Gs3FHK4FU2wlF1BwBtU=;
	b=NPh7pP9y5BIavsUjqUfqNmIt0RAkOfEs1vAQAde5UdHBbMloR3dxZG7tGOeF07bd7h
	AeEjig1RcD452TBFd/9c88psr+0aQxOyztEa0aanWPdwRSPlPnGmym55AXK/y6d0dENn
	OxS54QBT6WqtRjxSgm+tIQ8Ucjxg5YEELGYdrUAFG5M2pEtjtvmeKE43S/70a0I1NtQX
	7lL54Qp039O7JJUoG1szswgdj09Eln9jFvyLyonJz4IYDPknrE8uk1Mf4eKy2G+Ny8BR
	Q2oQesAuNT5c6kB417V1KEou7VLkUUm9h0RgFY0PiojLDLXN1rfBeO1NQYRLKNx3FqBI
	QDEA==
X-Gm-Message-State: APjAAAVpzZN4o2OvvPNYDvd/TsESgQo9ZP8daPbWVK5wCQAqvAgoMRNk
	MQGjm1xPO6mT3emo3HAZzO6nPwBBmJKnDuU+t2o=
X-Google-Smtp-Source: APXvYqzh8x+uK3Pge17ILW8BhJOEQW0IcOgXrc2Oe/7ra5k1e0gpNoHnqZQ6RLLA3wSviIdPm+yBGJGlc+3x8bzeY5U=
X-Received: by 2002:ab0:2756:: with SMTP id c22mr11938874uap.22.1564327221379; 
	Sun, 28 Jul 2019 08:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <1564260566-8134-1-git-send-email-akuster808@gmail.com>
	<20190728092843.GA15666@localhost>
In-Reply-To: <20190728092843.GA15666@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Jul 2019 17:20:10 +0200
Message-ID: <CANNYZj9ymQgk0Mb3i4Ze5AnTaJMsZ=Sws1i3MUZrsyE6J3wR_A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: Update to latest stable, 9.14.
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
X-List-Received-Date: Sun, 28 Jul 2019 15:20:21 -0000
Content-Type: multipart/alternative; boundary="00000000000057c9de058ebf50e6"

--00000000000057c9de058ebf50e6
Content-Type: text/plain; charset="UTF-8"

Indeed; I think we should wait for 9.16, and take the latest in 9.11
meanwhile.

Alex

On Sun, 28 Jul 2019 at 11:29, Adrian Bunk <bunk@stusta.de> wrote:

> On Sat, Jul 27, 2019 at 01:49:26PM -0700, Armin Kuster wrote:
> > Even releases are stable and supported for 1 year.
> >...
>
> 9.11 upstream support covers the whole lifetime of Yocto 2.8,
> 9.14 upstream support does not.
>
> Eve worse, Yocto 2.9 would ship with 9.14 that might become EOL around
> the time of the 2.9 release.
>
> ESV (3 years supported) releases are planned when upstream
> is divisible by 4.
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000057c9de058ebf50e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Indeed; I think we should wait for 9.16, and take the late=
st in 9.11 meanwhile.<div><br></div><div>Alex</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 28 Jul 2019 at 1=
1:29, Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-colo=
r:rgb(204,204,204);padding-left:1ex">On Sat, Jul 27, 2019 at 01:49:26PM -07=
00, Armin Kuster wrote:<br>
&gt; Even releases are stable and supported for 1 year.<br>
&gt;...<br>
<br>
9.11 upstream support covers the whole lifetime of Yocto 2.8,<br>
9.14 upstream support does not.<br>
<br>
Eve worse, Yocto 2.9 would ship with 9.14 that might become EOL around <br>
the time of the 2.9 release.<br>
<br>
ESV (3 years supported) releases are planned when upstream<br>
is divisible by 4.<br>
<br>
cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
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

--00000000000057c9de058ebf50e6--
