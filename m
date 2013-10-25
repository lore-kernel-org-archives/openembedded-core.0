Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7C2496D312
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 13:59:25 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t61so3908400wes.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=e486Nn3WmTJx0XOwyFhwD5prPjjE9QTVTEJ4GQcaccs=;
	b=cNsBCykd+Wi9UCzvlUpGg+nrIXrl8SfWLqu0jtD97GQQ2Mf1Y3N9Kft9Gmag9NAvsV
	XWYEVU3e+uowzsgfsK5fcR5nK1V89BGmf3CsU5vlsiDwIT0I2/BYboyH5T/pDbsFirIL
	XInhNKxHbDWx8QeP5O0/90jEqSxdVH6gxjpF4RLsoNIE0OlY/iRBUUPX+ufyEmBhAkz8
	5I0yGbfbP0ZkVtxwUphN3fUyXB3RjSbXPX9K2XMplX0HOSibVteRukNn+ngVp9D0xiky
	qb1rMTzoPSMcIxGfnGyW9zHZOVoQ7DO0/qqpd8h3em544xwh7Yk/vj1955wpEZmpCAE+
	il9g==
MIME-Version: 1.0
X-Received: by 10.180.126.103 with SMTP id mx7mr2653979wib.39.1382709566606;
	Fri, 25 Oct 2013 06:59:26 -0700 (PDT)
Received: by 10.194.179.198 with HTTP; Fri, 25 Oct 2013 06:59:26 -0700 (PDT)
In-Reply-To: <20131025132137.GA11683@ad.chargestorm.se>
References: <1381528914.29912.188.camel@ted> <1381529759.29912.191.camel@ted>
	<20131025132137.GA11683@ad.chargestorm.se>
Date: Fri, 25 Oct 2013 15:59:26 +0200
Message-ID: <CA+chaQemjeoUQ-VgvqgKAbnKoXYN95GSaGEGpE3fMzXXfaw27w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: tar 1.32 fixes
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
X-List-Received-Date: Fri, 25 Oct 2013 13:59:25 -0000
Content-Type: multipart/alternative; boundary=e89a8f6479d18b967b04e9912842

--e89a8f6479d18b967b04e9912842
Content-Type: text/plain; charset=UTF-8

Gentoo is also installing 1.32 version by default now, so I would also like
to see it in dora later.


On Fri, Oct 25, 2013 at 3:21 PM, Anders Darander <anders@chargestorm.se>wrote:

> * Richard Purdie <richard.purdie@linuxfoundation.org> [131012 00:16]:
> > > tar: --same-order option cannot be used with -c
>
> > > with the commandlines we have been using. We can remove the -s option
> (which
> > > is --same-order) to remove the error.
>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Could we backport this patch to dora?
>
> I'm experiencing this issue on a couple of buildboxes that was recently
> updated.
>
> Cheers,
> Anders
>
> --
> Anders Darander
> ChargeStorm AB / eStorm AB
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--e89a8f6479d18b967b04e9912842
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Gentoo is also installing 1.32 version by default now, so =
I would also like to see it in dora later.<br></div><div class=3D"gmail_ext=
ra"><br><br><div class=3D"gmail_quote">On Fri, Oct 25, 2013 at 3:21 PM, And=
ers Darander <span dir=3D"ltr">&lt;<a href=3D"mailto:anders@chargestorm.se"=
 target=3D"_blank">anders@chargestorm.se</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">* Richard Purdie &lt;<a href=3D"mailto:richa=
rd.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; <=
a href=3D"tel:%5B131012%2000" value=3D"+13101200">[131012 00</a>:16]:<br>

<div class=3D"im">&gt; &gt; tar: --same-order option cannot be used with -c=
<br>
<br>
&gt; &gt; with the commandlines we have been using. We can remove the -s op=
tion (which<br>
&gt; &gt; is --same-order) to remove the error.<br>
<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br>
</div>Could we backport this patch to dora?<br>
<br>
I&#39;m experiencing this issue on a couple of buildboxes that was recently=
<br>
updated.<br>
<br>
Cheers,<br>
Anders<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Anders Darander<br>
ChargeStorm AB / eStorm AB<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>

--e89a8f6479d18b967b04e9912842--
