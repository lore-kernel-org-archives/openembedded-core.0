Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id ECF427FCF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 06:17:54 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id j6so9741474lja.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UQaHVekqfu6aXHdgt3YFvy1Xu15XVvUaU1Yyj/tgbGc=;
	b=ar9jNAtVtopg2W4MJYRUU8wsmt9p8ISSY5XMmdGebaYae8u9VlSL4RSVW6yJ23SHly
	y0P4yVSObHobaNK6PS6VZl3kpX4avq7Jr/TokD9dokVPtsIRh+DxgWWqSotw23PHoHF/
	J3J2MnDtxqWugo0thYWM545eHrQPH0zYyJaitvKfVNG/YqPeRhXf51BKZVclbC3xBmmP
	qrErD+yHb8odGqU0Z4R0viXm+N/HTyhdIC1h/NergjayOQXB0ZQG7e/2n8oT0c4q3N8k
	m3SVvDcYlkL7E8zDYppTi4bYk17DXnUowoVCSzg6cNZ1uGArIteKRKIImkXK5+ulH5Hz
	ftFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UQaHVekqfu6aXHdgt3YFvy1Xu15XVvUaU1Yyj/tgbGc=;
	b=R4PPdNwX4D9hGy/mIuBDxRXlCYcBXaIe4eGylbBbdM2OFt6zYyR7DIMpRQ3CVDeyjY
	c9MDApL6IHhPPv2QztP52Y73c4CiW7LeQXCKbZcmUME/8IhwcvzOxkxkgfBDm3qX0Db7
	JcgRItGmVkHxBxDKzK5EU4nNnZlbrsQvk5gp7knouQrd/9lEjQcMwMymoFsueMhCzO+Q
	TOaHckrtji4nIASnX/WkIIVeeUaFv1PsMs7Lv9Jx5ynEqbJxAsvk+1HeH1i+7OLsglrg
	L4iNn5f+p5TE4xuGsFblfPevcqGT9FfJpoLG5Uv1vRnaAX1pc4cTw0KA5HB/cdfhGui5
	QfYw==
X-Gm-Message-State: APjAAAW30+Idau3JhZAZrf0mbavY33b3rM1i4qkpONsu2ehAKiOwAWjy
	0fuueaqI8GE0qKO/Lp0DjIkSS4yl0XasJbTtUfE=
X-Google-Smtp-Source: APXvYqxmcKru9sWLnRxUQkSxLTnWtJtuvNVe9FUtW5mk7gr8j9lJDgDq8yoWJxY2F4Tu2u3MjRVcJf5EZZn/2NyR8Zs=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr25298825ljd.183.1574749074657;
	Mon, 25 Nov 2019 22:17:54 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<20191125211027.GA32080@localhost>
In-Reply-To: <20191125211027.GA32080@localhost>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 25 Nov 2019 22:17:42 -0800
Message-ID: <CADySD0HO0QCAScA4iH5LLm4B4Zoq1rXLqi0hP3D5-jMyACwThw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Tue, 26 Nov 2019 06:17:55 -0000
Content-Type: multipart/alternative; boundary="00000000000034970c059839d7f4"

--00000000000034970c059839d7f4
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

Thanks for explaining things and helping me out.

Once I have stable builds then will try your suggestion as well.

Ankur

On Mon, Nov 25, 2019 at 1:10 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Mon, Nov 25, 2019 at 07:26:58PM +0000, Ross Burton wrote:
> > On 25/11/2019 18:37, Ankur Tyagi wrote:
> > > Hi,
> > >
> > > Based upon "thud" branch, I created core-image-minimal for am335x-evm
> > > board and resulting image size is very big(71M)
> >
> > If disk size is important then a good first step is to use musl instead
> of
> > glibc:
> >
> > TCLIBC = "musl"
> >...
>
> musl is mainly useful for tiny systems, a 40 MB partition is such a huge
> amount of space that the size of the C library no longer matters much.
>
> The size benefit of replacing glibc with musl is around 2 MB.
>
> A partition with an -Os build of Yocto with glibc+systemd (sic)
> is around 9 MB, together with bootloader and kernel this all
> fits in a 16 MB flash. Use compression for kernel and root
> filesystem and everything fits in a 8 MB flash.
>
> > Ross
>
> cu
> Adrian
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000034970c059839d7f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">Hi Adrian,</div><div class=3D"gmail_default" s=
tyle=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-family:verdana,sans-serif">Thanks for explaining things a=
nd helping me out.</div><div class=3D"gmail_default" style=3D"font-family:v=
erdana,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fam=
ily:verdana,sans-serif">Once I have stable builds then will try your sugges=
tion as well.</div><div class=3D"gmail_default" style=3D"font-family:verdan=
a,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:v=
erdana,sans-serif">Ankur<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 25, 2019 at 1:10 PM Adrian Bu=
nk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Nov 25, 2019=
 at 07:26:58PM +0000, Ross Burton wrote:<br>
&gt; On 25/11/2019 18:37, Ankur Tyagi wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt; <br>
&gt; &gt; Based upon &quot;thud&quot; branch, I created core-image-minimal =
for am335x-evm<br>
&gt; &gt; board and resulting image size is very big(71M)<br>
&gt; <br>
&gt; If disk size is important then a good first step is to use musl instea=
d of<br>
&gt; glibc:<br>
&gt; <br>
&gt; TCLIBC =3D &quot;musl&quot;<br>
&gt;...<br>
<br>
musl is mainly useful for tiny systems, a 40 MB partition is such a huge<br=
>
amount of space that the size of the C library no longer matters much.<br>
<br>
The size benefit of replacing glibc with musl is around 2 MB.<br>
<br>
A partition with an -Os build of Yocto with glibc+systemd (sic)<br>
is around 9 MB, together with bootloader and kernel this all<br>
fits in a 16 MB flash. Use compression for kernel and root<br>
filesystem and everything fits in a 8 MB flash.<br>
<br>
&gt; Ross<br>
<br>
cu<br>
Adrian<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000034970c059839d7f4--
