Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 98E2E60EE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:00:26 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id c7so2435488uaf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5XOdcBqIgXgXpgwGdjWhOOsyyHdivSfryYk8VEGIiEA=;
	b=RJ3HQHmwdrdY+onlNCT7H6iym8Qv9m8i4qfcEP3JrfYzJBkxSdH8564XtPyz13+OKr
	Wd+eWDKb+LqeSqQ8fINJ4nZn3IpL1NIdszr1AwKGlv0JUw+UsT+aK1e9jzvnd8hCaPU3
	AKbUUr7t0dQaZaoRLwX3MfJROafAK53dFs6XmEDH+yje6AvJtiHTvBFuYtl0j8gO+UvK
	uioH1WQPqbit37f6DJUJPWWtZ6kleUL0jsBL3jg3KUIfUSS/iB2LmCGhR34+ThZWNFvE
	FWnxOKSU9CzbUFhMg/MEh6s8e4wJVXj30wI5pTlAxu3HtdqrsuS7eoRQddeJ4779J4qa
	m7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5XOdcBqIgXgXpgwGdjWhOOsyyHdivSfryYk8VEGIiEA=;
	b=g8ae1OGbrx6jh5NqTqUqhRoiXwIM31fl9+ICZcqWSRwp1JqkhEVKDkYN/NGOfvR2Rq
	T/7EQh8kzlFYhF0rNYWOiQbDLRtzAAZouqARAUYtgTduzRFeYZ6JqzielJH1yV4qsyI/
	HAL3jfsQ8uERuYCQPlpLyTSaHS7YhvE6nDjX4k//UEJ1MfIHp8KwWTzQ3tdn4FgEWAgr
	Ys+IgZlvKwZoxaGCs2sXNuL44DB9FcH8yt3A1MD2ghOGcsizhxn7q98hlQglZXvWXGmH
	xS19KeaxXcUO06IjPXEAhBTmzCGtyQkibkizRrV9WecilIhqDuwBCPiXMVjtzoWurZRu
	J1Uw==
X-Gm-Message-State: APjAAAWtrls6XurPA4sKjMj7Ri4zbRKSt/eFB7ZLrGx54xUOOgCTE16W
	/DhJQEgB0jz6QJk9qeGsOdC4TWJc4EpIavJZP8U=
X-Google-Smtp-Source: APXvYqxPubBg7DTt8ebkVvON3YBWK4D4Gl5agy1ob2VFXPSenUuVvRfHKOVbvs/26C9UG2sG7EpJLwWeMUr8UydwWyI=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr7374482uap.93.1581609627384;
	Thu, 13 Feb 2020 08:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20200210214211.2696-1-maxime.roussinbelanger@gmail.com>
	<fea6b9336e34c7df3cd23217cf2715b04fbd9ae6.camel@linuxfoundation.org>
	<CAE=T-s6CdNNZjqitGhYrAV8EiufQrPZJY8JLTmnPAEHC-sSHbQ@mail.gmail.com>
	<928575d17e93b117b6f555d674089560161d6c97.camel@linuxfoundation.org>
	<CAE=T-s6tXBA66zqe83-sib4m-JSXS++9sQ_m-D3a1KjU+-YcAw@mail.gmail.com>
In-Reply-To: <CAE=T-s6tXBA66zqe83-sib4m-JSXS++9sQ_m-D3a1KjU+-YcAw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 17:00:56 +0100
Message-ID: <CANNYZj8_fd=k95FA0VFF7ZjxuFVCU8V0HouxtLCNptdWLCMLpA@mail.gmail.com>
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: add virtual supplicant
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
X-List-Received-Date: Thu, 13 Feb 2020 16:00:26 -0000
Content-Type: multipart/alternative; boundary="000000000000037d89059e77302a"

--000000000000037d89059e77302a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Feb 2020 at 16:55, Maxime Roussin-B=C3=A9langer <
maxime.roussinbelanger@gmail.com> wrote:

> PACKAGECONFIG[iwd] =3D "--enable-iwd, --disable-wifi, iwd, iwd"
> PACKAGECONFIG[wpa-supplicant] =3D "--enable-wifi, --disable-wifi,
> wpa-supplicant, wpa-supplicant"
>

The problem with this, is that enabling one but not the other will combine
into '--enable-iwd --disable-wifi' which is not what is intended.

I am not sure why you need to specify them as both build and runtime
dependencies, can you clarify why?

Alex

--000000000000037d89059e77302a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 13 Feb 2020 at 16:55, Maxime Rous=
sin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.roussinbelanger@gmail.com">m=
axime.roussinbelanger@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr">PACKAGECONFIG[iwd] =3D &quot;--en=
able-iwd, --disable-wifi, iwd, iwd&quot;<br><div>PACKAGECONFIG[wpa-supplica=
nt] =3D &quot;--enable-wifi, --disable-wifi, wpa-supplicant, wpa-supplicant=
&quot;</div></div></blockquote><div><br></div><div>The problem with this, i=
s that enabling one but not the other will combine into &#39;--enable-iwd -=
-disable-wifi&#39; which is not what is intended.</div><div><br></div><div>=
I am not sure why you need to specify them as both build and runtime depend=
encies, can you clarify why?</div><div><br></div><div>Alex=C2=A0</div></div=
></div>

--000000000000037d89059e77302a--
