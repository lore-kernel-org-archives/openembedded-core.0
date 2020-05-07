Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.5722.1588857909972802556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 06:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A9uN4w1D;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id i5so1834143uaq.1;
        Thu, 07 May 2020 06:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zjA6IYqMA3L+IbGE+23DE3r2eMzX5VQ04dxaUzFdT8w=;
        b=A9uN4w1D4Hixxc4Y2JmXiyTc7daxEsn1gqKNQcQchmhKAJWv7WB1ZY/wTBRmEecH1s
         grwGVuGnGRa8NpXalAkT30DvM9ni3ofmXxOYQgnxbwEQkOmMY0z72h8bLAAH3c8UF+Uf
         cN0rKU0KZQDhkTpPL2+WUmAXILbrDvn6enuEE/xGIEOHWTxiN5raeYzS6pVvnY3/6YT0
         tcgGgorhmtBgx8CxGdo3sadAIhal2cSX/Xh0fmsuExErLsRe4JTMBe4oa7wJ5I9IzmIe
         bBMO+qqNLenohDlI3zrp0VENpuyI8WET3xuvJfhz8ypK/8yEeioGzTGFLdAK78WS9aPB
         nuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zjA6IYqMA3L+IbGE+23DE3r2eMzX5VQ04dxaUzFdT8w=;
        b=NLOGOs1Uur6ksT9tu5DUaoZjPQnsIR2NBuoJEZjr7l3oE65whgR8tEvPL94vou6rX2
         PaQ85OWjgSAu0dCBT9xpBBqq0usmQR7uXMoL6p36SfulOPE1aTiUoJI/zHcS2tFPj7c/
         QesL3BaxypGxCK6vsYnyL74hOWnFPNqHUMHIIt7WExQRlHhWQr5O8Pk0jOgUb4ndVdVc
         WWpNJiEEZPMrNPH7ndXEyx0KCsUaoN57FrNwldVfq72wQWa1N1MEc6rtZOK0Ajp+xaNc
         UQby8TkukFGZ9rqoWHSlB2spVlzx8ZmQpN7/e4K0nRS4TmScHdpIWawyYnn13iQNzEIi
         6jXQ==
X-Gm-Message-State: AGi0PubxaHqYfTjV3FEsvr+GX3h7TZaqWVixzAKHJ0MGbxfqrAmVMEGG
	sCKBtTFembF9fnvEfoqYIw9FHUdgvtDROL7yRrE=
X-Google-Smtp-Source: APiQypJ/lJhRI+fjFVDcOpNqSdTxKfY5tuzv1bTctQEmg5iqI3Mlc2r6zyJr0ZiaNUJU0Tq7tOP21Iht02QdEKF2TDY=
X-Received: by 2002:ab0:6313:: with SMTP id a19mr11127803uap.71.1588857909107;
 Thu, 07 May 2020 06:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com>
 <53530eac-ce1c-db1a-f489-1d5a4a910870@gmail.com> <CANNYZj90z3JYhajCF9fEDeUXgsYJary9PKk0GbihAHp_FH3_cQ@mail.gmail.com>
 <1AEA4CE9-1C08-4336-9634-B546476F92C4@gmail.com>
In-Reply-To: <1AEA4CE9-1C08-4336-9634-B546476F92C4@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 7 May 2020 15:24:57 +0200
Message-ID: <CANNYZj8K_3=pQQrLZD1D+vFhSxLsRTDxTsYB1r8wMZw7f4whKg@mail.gmail.com>
Subject: Re: [OE-core] [Openembedded-architecture] Proposal: community maintained recipes in oe-core
To: Jens Rehsack <rehsack@gmail.com>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000455ec105a50ecf3f"

--000000000000455ec105a50ecf3f
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2020 at 14:38, Jens Rehsack <rehsack@gmail.com> wrote:

> > I agree there should be a way to update maintainers e-main once we
> determine they are not longer willing to take part in that program or
> absent. I believe this an issue in general for OpenSource has had to
> address over the years.
> >
> > My plan is to experiment with this for the python3* recipes in oe-core
> for a start: they've been bouncing between various people over the past
> couple of years, but no active maintainer has emerged.
>
> I'd like to see 'non-systemd init' in, either :)
>

On a technical level this means updating maintainers.inc entries to list
oe-core list as the email address; the next AUH round (in a week or so)
will go as usual (because it's the first post-release one), and depending
on how maintainers react, and who hasn't sent anything at all for a long
time, I will propose something specific.

Alex

--000000000000455ec105a50ecf3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 7 May 2020 at 14:38, Jens Rehsack=
 &lt;<a href=3D"mailto:rehsack@gmail.com">rehsack@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; I agree there should be a way to update maintainers e-main =
once we determine they are not longer willing to take part in that program =
or absent. I believe this an issue in general for OpenSource has had to add=
ress over the years.<br>
&gt; <br>
&gt; My plan is to experiment with this for the python3* recipes in oe-core=
 for a start: they&#39;ve been bouncing between various people over the pas=
t couple of years, but no active maintainer has emerged.<br>
<br>
I&#39;d like to see &#39;non-systemd init&#39; in, either :)<br></blockquot=
e><div><br></div><div>On a technical level this means updating maintainers.=
inc entries to list oe-core list as the email address; the next AUH round (=
in a week or so) will go as usual (because it&#39;s the first post-release =
one), and depending on how maintainers react, and who hasn&#39;t sent anyth=
ing at all for a long time, I will propose something specific.</div><div><b=
r></div><div>Alex<br></div></div></div>

--000000000000455ec105a50ecf3f--
