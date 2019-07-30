Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 554717E830
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 13:01:16 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id u124so43407689vsu.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 06:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f5Yi+oMmUjRDxf8D1c/Dr9+0dK4hCWvTB2/KpAhPtj4=;
	b=uwFuMaV9Um3bCKYd6wNXImUnUZBgTuDGA09yCYZikrNj7tVOlaYUmKJ8zXxUokywDg
	C/494EE0YddFu2ftrrJKap81p4RLEQrJwP+ovYUwjlFAjfyajpurJExM0f+I4PSWnxus
	dsSKy6oS9UaHpJE6q5VMdA4s5nrSzETG3OwGh6wPZz2u0FtgX4MJSF1/wuPV5DNRFWdz
	zu7RgmaGGxEgPAB1ct8rY7Dy4vgC8NTVP2mBXpMT4OwtxTY3l5PvCSRq+OYmMQtnWU3x
	f09VOs2HeroSgC9Pt/3XAdvZwwtbbUO/4z9SdEOLbHhEouLsbvS8qIB8V1ja8PohWr3S
	wscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f5Yi+oMmUjRDxf8D1c/Dr9+0dK4hCWvTB2/KpAhPtj4=;
	b=opJKukzikTmkiC9jEuVOWRw6J/+PzSq/Db0odmCr0QqSm7G+2GbumK4PrBqVl9rNlX
	g2cQPzlx8KkYQFPkb9f7PUJ2pkX9JaedbKevZlsajH0JFTfT0SEkHKAT4egTvSFUTA3q
	hCFWiZ0eAAcnXAMsN2XOjUoS1dEWcRxTu7/fPPLhrzkPhTzYq1SMq4120fc7Qw2Ag0dI
	lpIN7tfXRaj/pfKa5M834W0MJcC8CN6yt7j2FpLQHTGzI5JGwlzwQzgesQh9nNYpWodu
	bI7TH4KG8FVdDju/cYpBfPFcWDMgbOh69kmFp2JtKJGAfVsA6YuvgkrD7pi4m33pZ5AM
	90jw==
X-Gm-Message-State: APjAAAWEc0i9w5f1hgoZQpXZH0XK0zkMoOHNpGYUWKborHVstWppPKu0
	BG7zvOd6lrWS9TvndLoQsidWOMLfDBTWcCcsawW2J0UsrvY=
X-Google-Smtp-Source: APXvYqx7ZL13rvBUvek5RG0FYw5UjxjazJKfDeBl9+RQLwRZYSHx5tO+iiZ3bT8Gn0s4NW9EBdDYEf9zDc/ioNLvZJ4=
X-Received: by 2002:a67:8042:: with SMTP id b63mr76068966vsd.23.1564491677054; 
	Tue, 30 Jul 2019 06:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190729100020.10517-1-bunk@stusta.de>
	<5acdfa6c-f88a-7812-a0b1-108e4532ebbd@gmail.com>
In-Reply-To: <5acdfa6c-f88a-7812-a0b1-108e4532ebbd@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Jul 2019 15:01:05 +0200
Message-ID: <CANNYZj8XyDdF_VNHL_YiDcFXeXf4Pk=o-pqg2SD3TO32ozqbyw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH] bind: Remove RECIPE_NO_UPDATE_REASON and follow the ESV releases
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
X-List-Received-Date: Tue, 30 Jul 2019 13:01:16 -0000
Content-Type: multipart/alternative; boundary="000000000000aa3ce4058ee59aa4"

--000000000000aa3ce4058ee59aa4
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jul 2019 at 11:21, akuster808 <akuster808@gmail.com> wrote:

> So are you setting the package update policy to LTS only ?  Its a
> function over maintenance question.
>
> I don't understand why this package is being singled out. I think it
> should be an OE  architecture discussion
>

I am not sure why are you objecting to this. This line:
RECIPE_NO_UPDATE_REASON = "9.11 is LTS 2021"
was added by you, and more or less states that update policy for bind is
LTS-only.

Alex

--000000000000aa3ce4058ee59aa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 30 Jul 2019 at 11:21, akuster808 =
&lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">So are you setting the package update policy to LTS only ?=
=C2=A0 Its a<br>
function over maintenance question.<br>
<br>
I don&#39;t understand why this package is being singled out. I think it<br=
>
should be an OE=C2=A0 architecture discussion<br></blockquote><div><br></di=
v><div>I am not sure why are you objecting to this. This line:</div><div><s=
pan class=3D"gmail-im">RECIPE_NO_UPDATE_REASON =3D &quot;9.11 is LTS 2021&q=
uot;</span></div><div><span class=3D"gmail-im">was added by you, and more o=
r less states that update policy for bind is LTS-only.<br></span></div><div=
><span class=3D"gmail-im"><br></span></div><div><span class=3D"gmail-im">Al=
ex<br></span></div></div></div>

--000000000000aa3ce4058ee59aa4--
