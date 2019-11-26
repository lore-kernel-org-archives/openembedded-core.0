Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC817FCF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 06:16:51 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id k15so18771441lja.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QttjqEMwBjRGzmSzdPKa4tjdr9KooxFkjVBM+qjbyUY=;
	b=A/JD/FaNpoEgPX0YXWt1eFp0OM98/cjjnL1qMk1uGxlPJ3OCZFij05ATLdge1jz6BU
	M7o1FCsduS2//AXkbJnXEIRu2vRPNQn+8ACJFGmm0sTiCjn7D1Rz4huqbGNLciDg/8sn
	dKHquNBlbxfjE/tqrDVeHMWV0bYzCY9oAIOswYRWYJRWxjRITgaFLMNlzt0vFS2b3a4Q
	/nEyyfe9LANDNroIr6oHV7pZiA3NDNk2jQdJQssuPaZOjWVdrJgMTor92AEaWb+KFSnh
	WyTA716+mMGzzMf8u08xjquKefG8Z/On244IKy7XarBjYPPHPNOzq1QiqMJHg3GvpN3p
	ejwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QttjqEMwBjRGzmSzdPKa4tjdr9KooxFkjVBM+qjbyUY=;
	b=ZDihvEB3IiIyLn0dZEtya1jy5e8YAZUZoWfhev8J3UeKv81/sAWQF+54JqPXBH4fB/
	GYzGu0MCARAd/92xM2qoG2Pgdz3exkC59aNCEYnBdVHOPFvT4BGgB0J1WJnF6jcgHwVD
	xQtoqaHRyfRxkgCTcEvAFXd9ztArwbgEznj4rfz0LLwAK0sCbL+jZni6tT88EJW4WJOa
	XBeC+BJr7R6ow5IRg65sB5tiQuRHK7Zt9EF+GCoaIRRJtiGCr0c1L6C8W4B3kJhtAswl
	5Ufq5/nuo/RfCX1V6V+/Qtn1ctXv8wMcLiWNDgkgz4G42PdQ90nEoS9YnzjkMDqZbVp4
	x2iQ==
X-Gm-Message-State: APjAAAUECjlkHod5YODezdgWTHZ+11TbTvHNKoXkZ5pOr21ZOz1iEcMz
	66MeKiLiNMi/fGQOSNH3C8r6awkgWxwufr02gA4=
X-Google-Smtp-Source: APXvYqwMe8Z5cGMGrnAtJa+88X4yOkQswAfWnBQTC85cEB2Tqa4pBI2ExB7612jh5AkRKXN/LeLDCu2tFDMs5k/cngQ=
X-Received: by 2002:a05:651c:d1:: with SMTP id
	17mr18671770ljr.238.1574749011806; 
	Mon, 25 Nov 2019 22:16:51 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<20191125195555.GA31543@localhost>
	<CADySD0Ey3Zo_6g5mJMxPyG4uETgbya6aXN28qr_rifvH=BYhwg@mail.gmail.com>
	<1e0c5549-d862-bfa9-caba-9b2c44e560e9@intel.com>
In-Reply-To: <1e0c5549-d862-bfa9-caba-9b2c44e560e9@intel.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 25 Nov 2019 22:16:39 -0800
Message-ID: <CADySD0H_AZ9L_kqKFtcdAdLRxSW6QXuC8TZSsD-OjAXtS63MiA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Tue, 26 Nov 2019 06:16:51 -0000
Content-Type: multipart/alternative; boundary="000000000000758fd9059839d3bd"

--000000000000758fd9059839d3bd
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

I just used arago distro as it is but you are right, once I have stable
builds
with default configuration then I will try your suggestion.

Thanks for your help

Ankur

On Mon, Nov 25, 2019 at 12:58 PM Ross Burton <ross.burton@intel.com> wrote:

> On 25/11/2019 20:22, Ankur Tyagi wrote:
> > # Select external binary prebuilt Arm toolchain
> > TCMODE = "external-arm"
> > TCLIBC = "external-arm-toolchain"
>
> FWIW, I don't see what the value in external toolchains actually is.
> You might get better results by simply setting:
>
> TCMODE = "default"
> TCLIB = "glibc"
>
> (or TCLIBC="musl" if you want to save even more space)
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000758fd9059839d3bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">Hi Ross,</div><div class=3D"gmail_default" sty=
le=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_default=
" style=3D"font-family:verdana,sans-serif">I just used arago distro as it i=
s but you are right, once I have stable builds</div><div class=3D"gmail_def=
ault" style=3D"font-family:verdana,sans-serif">with default configuration t=
hen I will try your suggestion.</div><div class=3D"gmail_default" style=3D"=
font-family:verdana,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:verdana,sans-serif">Thanks for your help</div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><br></div><div =
class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">Ankur<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Nov 25, 2019 at 12:58 PM Ross Burton &lt;<a href=3D"mailto:ros=
s.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 25/11/2019 20:22, Ankur Tyagi w=
rote:<br>
&gt; # Select external binary prebuilt Arm toolchain<br>
&gt; TCMODE =3D &quot;external-arm&quot;<br>
&gt; TCLIBC =3D &quot;external-arm-toolchain&quot;<br>
<br>
FWIW, I don&#39;t see what the value in external toolchains actually is. <b=
r>
You might get better results by simply setting:<br>
<br>
TCMODE =3D &quot;default&quot;<br>
TCLIB =3D &quot;glibc&quot;<br>
<br>
(or TCLIBC=3D&quot;musl&quot; if you want to save even more space)<br>
<br>
Ross<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000758fd9059839d3bd--
