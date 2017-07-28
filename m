Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 72D2978575
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 23:20:23 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id t201so7350794wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 16:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=fvXmS+z49YZjqc/cjBxQyQC9DhYsCIYM+64C2Ra/of4=;
	b=g5iyzspEO2NmkkmlVDWRT/0QX97tpeQma4IhNQM7vwyhJajUbG8wSci3bgrqUHOdZf
	Er0/1bzciLGXd3Nl4yMWgiGXP/nZbIbrb8DQGUGbsqm4qGjiMIXd+U0whkhdjltZkRPx
	hKKVXoxXnVL+V8iTAKbz1F/8JMKWA/Ktb6ryfRLdYzu1W0ydqRt9oUwYBVXSt2p09ezI
	qmz+ZXmz+bDxmXmiGjUTmSRqAfRQ8Jr0Dra9Hs86ds9jkiO6tDnJsvLTwyP8+x92UAbl
	g386tE9MezsGQtL4evYRzaOBTNJJocgPGyUBweJw6fMUXCToVc/xF+2xRU87W7NoxD6P
	04mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=fvXmS+z49YZjqc/cjBxQyQC9DhYsCIYM+64C2Ra/of4=;
	b=PmJFB1bKWO51zAph9yAaRHndXDZFJOEIkTTmjgZ6XHu4YIz3NbA/fu5OqV49hlG2T1
	22x+oslhvu5GETtfBwq3rSfep8sWBV7JS1H0Q8h3QlQbUhkyJptLV0VIGj5+fWEX4x6X
	jyOFQGSCzZ1GyykxHg9NhO5+ynNMRyez0OJKaMEGrolHlNHVvsY5tA4jlFn4MyfRmZHV
	CfMkm68/mflM7AZb25VcTIsKYf/WYVyFXp8a8Jmr4hGQ9ztyRY4JigyVQqmDTGfmNPYF
	zFxyMnycA9mZ78o0lQaLqjQ7AmlUmUwRmgrZO3qN6j1XgNAzDBB1nKCkdGsKGqL1+s2U
	G4MA==
X-Gm-Message-State: AIVw111V5EJV8ORng2GhvgiSZ7nQUCyyFK+5UNv7qlQLPh/WhvDFIR/h
	p5leS7+3ocUg2KH6ougyeLOmzmsS0g==
X-Received: by 10.80.164.18 with SMTP id u18mr7734911edb.250.1501284024186;
	Fri, 28 Jul 2017 16:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20170728114716.41389-1-raj.khem@gmail.com>
	<1501279292.22282.188.camel@linuxfoundation.org>
In-Reply-To: <1501279292.22282.188.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 23:20:12 +0000
Message-ID: <CAMKF1soNyjVy7pM4CxVM2LJnEONNx5Gks293kdaVE1Xk6q4TcQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] re2c: Transfer recipe from meta-oe and upgrade to 0.16
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
X-List-Received-Date: Fri, 28 Jul 2017 23:20:23 -0000
Content-Type: multipart/alternative; boundary="94eb2c198834f7fcad055568ecd7"

--94eb2c198834f7fcad055568ecd7
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 3:01 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2017-07-28 at 04:47 -0700, Khem Raj wrote:
> > ninja needs it.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-support/re2c/re2c_0.16.bb | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 meta/recipes-support/re2c/re2c_0.16.bb
>
> Doesn't seem to build:
>
>
> https://autobuilder.yocto.io/builders/nightly-no-x11/builds/376/steps/BuildImages/logs/stdio
>
> [amongst several other similar failures in the build]


I have fixed it in pull tree
Thanks

>
>
> Cheers,
>
> Richard
>

--94eb2c198834f7fcad055568ecd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, Jul 28, 2017 =
at 3:01 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Fri, 2017-07-28 at 04:47 -0700, Khem Raj wrote:<=
br>
&gt; ninja needs it.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-support/re2c/<a href=3D"http://re2c_0.16.bb" rel=3D=
"noreferrer" target=3D"_blank">re2c_0.16.bb</a> | 15 +++++++++++++++<br>
&gt; =C2=A01 file changed, 15 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-support/re2c/<a href=3D"http://r=
e2c_0.16.bb" rel=3D"noreferrer" target=3D"_blank">re2c_0.16.bb</a><br>
<br>
Doesn&#39;t seem to build:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-no-x11/builds/376/=
steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://=
autobuilder.yocto.io/builders/nightly-no-x11/builds/376/steps/BuildImages/l=
ogs/stdio</a><br>
<br>
[amongst several other similar failures in the build]</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">I have fixed it in pull tree</div><di=
v dir=3D"auto">Thanks=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--94eb2c198834f7fcad055568ecd7--
