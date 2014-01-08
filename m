Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA856D152
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 17:14:31 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id n16so2061042oag.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 09:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TsEuQ7GyojNkXZOWn+1T5DhPDqOQfrI1olSz+jxGR8w=;
	b=WSURnFamIDhbNBBr84BZFtuBRVSK3N928kmsAJFYz8sCib+VFMiwQi8vDDXEVsjvGV
	IaewCzOKU6FgS486wDfpyK+VIz5bpjfi+bTgvPoVZOmiVgIhgWJO8E1RBggcte2Kp+3+
	QvTkhoknDewevsQiDccogtNnIlwIh/5QCZxX6DYq7JWc4UL/dzUsAkvBg52e59Eq1HqU
	RqQSqgvK5dpxxr9/fqoIfP2r34QsjyL/U24Kqnebp1ad9+EOp/U066B0Uaivhoj//mWT
	Y9MPBTaKTfXbSbGfG1cBVek6P4R5LDQHSIBE7L9y49ZO/vPr1ObK1oRIGhvVVn3FVWbe
	F2tQ==
X-Gm-Message-State: ALoCoQn/D/h92gnw7dcjm+3oOEByMF/R4Db6gU52u4jI7M0CSXmA0ED3xo+cZlYfRZLgEcZafGqI
X-Received: by 10.60.178.139 with SMTP id cy11mr41867055oec.36.1389201272181; 
	Wed, 08 Jan 2014 09:14:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.89.143 with HTTP; Wed, 8 Jan 2014 09:14:12 -0800 (PST)
In-Reply-To: <1389200502.6899.112.camel@ted>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<52B8DECA.6060704@balister.org>
	<CAJTo0LaEgLWZHk34e-_-+z69Zw3J+S1zGFFJAONjfYBDQ1TehQ@mail.gmail.com>
	<1389200502.6899.112.camel@ted>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 8 Jan 2014 18:14:12 +0100
Message-ID: <CAP71Wjxsn4f4MU7K_vK+rcusdsip5tA4hX6HAivrNuR60_-WzA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Poky Project <poky@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Piglit in Poky
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
X-List-Received-Date: Wed, 08 Jan 2014 17:14:31 -0000
Content-Type: multipart/alternative; boundary=089e011774f759df4204ef78a0b0

--089e011774f759df4204ef78a0b0
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 8, 2014 at 6:01 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> >
> > On 24 December 2013 01:09, Philip Balister <philip@balister.org> wrote:
> > >> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
> > >> and pushes the boundaries of "core platform".  In a sense this is a
> > >> repeat of the discussion we had with Midori...  does oe-core contain
> > >> everything needed to sufficiently exercise the core components it
> > >> ships or not?
> > >
> > > I expect Richard will push back on this, and I would support him here.
> >
> > Probably best to let Richard speak for himself here. :)
>
> :)
>
> I have to admit I'm leaning towards pulling in the 4 recipes we need
> since the win is we get to test the GL stacks.
>
> We do support graphics in the core, we also do particularly badly at
> testing it. That is something I think we need to change. piglit lets us
> do that and its not like it has a significant number of dependencies.
> Having a couple more python modules to test the python stack probably
> isn't a bad idea ether. We pruned quite a number of recipes out, this is
> a case where we can add a small number for a significant win.


I am in favor of that too. I would like to use piglit too to test GLES on
some of our ARM projects. I am not sure when we can get to do it, but i am
definitely interested into that, and it's been on a TODO list for some time
now.

--089e011774f759df4204ef78a0b0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 8, 2014 at 6:01 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">&gt;<br>
&gt; On 24 December 2013 01:09, Philip Balister &lt;<a href=3D"mailto:phili=
p@balister.org">philip@balister.org</a>&gt; wrote:<br>
&gt; &gt;&gt; 1) Move piglit and deps to oe-core. =A0Piglit is for QA purpo=
ses only<br>
&gt; &gt;&gt; and pushes the boundaries of &quot;core platform&quot;. =A0In=
 a sense this is a<br>
&gt; &gt;&gt; repeat of the discussion we had with Midori... =A0does oe-cor=
e contain<br>
&gt; &gt;&gt; everything needed to sufficiently exercise the core component=
s it<br>
&gt; &gt;&gt; ships or not?<br>
&gt; &gt;<br>
&gt; &gt; I expect Richard will push back on this, and I would support him =
here.<br>
&gt;<br>
&gt; Probably best to let Richard speak for himself here. :)<br>
<br>
</div>:)<br>
<br>
I have to admit I&#39;m leaning towards pulling in the 4 recipes we need<br=
>
since the win is we get to test the GL stacks.<br>
<br>
We do support graphics in the core, we also do particularly badly at<br>
testing it. That is something I think we need to change. piglit lets us<br>
do that and its not like it has a significant number of dependencies.<br>
Having a couple more python modules to test the python stack probably<br>
isn&#39;t a bad idea ether. We pruned quite a number of recipes out, this i=
s<br>
a case where we can add a small number for a significant win.</blockquote><=
/div><br>I am in favor of that too. I would like to use piglit too to test =
GLES on some of our ARM projects. I am not sure when we can get to do it, b=
ut i am definitely interested into that, and it&#39;s been on a TODO list f=
or some time now.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br></div><=
/div>

--089e011774f759df4204ef78a0b0--
