Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 840B36E30D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 10:47:13 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id j17so2715334oag.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 02:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=eYmwsivChuFUPW0cuZzdEUII8gzZhDpjibJDbkvp3Ho=;
	b=jN+EoCfXGIPh/HFkR/eCngybdK1hfGzlA9OMnbx6wgIuihuQe54iCRkICwdDq3hDlm
	kLp+MIFup0chwGl2ZH7o1SR+csUvgXzvodKFdBKvHgT/b7tDTiWuL0Wvf+1QtSmVo1PE
	Inp8tsBVtAYRMkC8ym1Ly3MjuYk2oZ0ObtzWOpv7FW+ifXnnmPO7Ns90BqDpEIAYjUmH
	oelWZvRRstaE3fRGZaUO285B1p4Wzg3ulqyIyguATF+lV1vPGPkqaph2O5cdXyZ9OHLM
	E/kN3OEDjLxe84ApjZioG1yndBtZRZBcPWK0DRBbU/4oCCYzK3MVtbFvlOceL33O7lNo
	QmOA==
MIME-Version: 1.0
X-Received: by 10.60.157.130 with SMTP id wm2mr6352105oeb.31.1389869234405;
	Thu, 16 Jan 2014 02:47:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 16 Jan 2014 02:47:14 -0800 (PST)
In-Reply-To: <38155A0E-22FF-4A3A-916A-5C0D2C256AA9@linaro.org>
References: <1389780926-20901-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoCuuPHq2OyktCAX9C5tpWwjStJR4qJMEq8_fCheb2Y6g@mail.gmail.com>
	<52D7A5F0.6090501@linaro.org>
	<CAP9ODKq+XKYP3ae=2tFdj5BATBUHUt6E-Wq8SzMpPebt9cN51g@mail.gmail.com>
	<38155A0E-22FF-4A3A-916A-5C0D2C256AA9@linaro.org>
Date: Thu, 16 Jan 2014 08:47:14 -0200
X-Google-Sender-Auth: C59R76lchauNobutSnyT2Tuc8_U
Message-ID: <CAP9ODKoLqJ63=wKJpbE3ezEN2QXO0We_yJcmdRL9qoCc0zp1+A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub git: workaround debugedit problems for 64 bit targets
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
X-List-Received-Date: Thu, 16 Jan 2014 10:47:13 -0000
Content-Type: multipart/alternative; boundary=047d7bd6afcc00476404f0142639

--047d7bd6afcc00476404f0142639
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 16, 2014 at 8:46 AM, Koen Kooi <koen.kooi@linaro.org> wrote:

> Op 16 jan. 2014, om 11:38 heeft Otavio Salvador <otavio@ossystems.com.br>
> het volgende geschreven:
> > On Thu, Jan 16, 2014 at 7:27 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> > On 01/15/2014 12:22 PM, Otavio Salvador wrote:
> > On Wed, Jan 15, 2014 at 8:15 AM, Koen Kooi <koen.kooi@linaro.org
> > <mailto:koen.kooi@linaro.org>> wrote:
> >
> >     I've limited it to 64bit targets, but to be honest debug splitting
> >     doesn't make sense for grub since it won't run in your rootfs and
> >     attaching gdb is pretty much impossible.
> >
> >     Signed-off-by: Koen Kooi <koen.kooi@linaro.org
> >     <mailto:koen.kooi@linaro.org>>
> >
> >
> >
> > I'd prefer to remove the debug systems than skip the split. What others
> > think?
> >
> > I'm not sure what you mean by that, do you mean using
> INHIBIT_PACKAGE_STRIP or something else?
> >
> >
> > Yes and be sure it has been stripped during build.
>
> That seems to be a lot more work for the same effect. Stripping isn't the
> problem, it's debugedit trying to do its magic that fails.
>

Well, if not stripped the symbols will be left in the binaries which is not
expected.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7bd6afcc00476404f0142639
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Jan 16, 2014 at 8:46 AM, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:koen.kooi@linaro.org" target=3D"_blank">koen.kooi@linaro.org</a>&gt;</s=
pan> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Op 16 jan. 2014, om 11:38 heeft Otavio Salva=
dor &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br<=
/a>&gt; het volgende geschreven:<br>

<div class=3D"im">&gt; On Thu, Jan 16, 2014 at 7:27 AM, Koen Kooi &lt;<a hr=
ef=3D"mailto:koen.kooi@linaro.org">koen.kooi@linaro.org</a>&gt; wrote:<br>
&gt; On 01/15/2014 12:22 PM, Otavio Salvador wrote:<br>&gt; On Wed, Jan 15,=
 2014 at 8:15 AM, Koen Kooi &lt;<a href=3D"mailto:koen.kooi@linaro.org">koe=
n.kooi@linaro.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:koen.kooi@linaro.org">koen.kooi@linaro.or=
g</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt; =A0 =A0 I&#39;ve limited it to 64bit targets, but to be honest debug s=
plitting<br>
&gt; =A0 =A0 doesn&#39;t make sense for grub since it won&#39;t run in your=
 rootfs and<br>
&gt; =A0 =A0 attaching gdb is pretty much impossible.<br>
&gt;<br>
&gt; =A0 =A0 Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen.kooi@linar=
o.org">koen.kooi@linaro.org</a><br>
&gt; =A0 =A0 &lt;mailto:<a href=3D"mailto:koen.kooi@linaro.org">koen.kooi@l=
inaro.org</a>&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; I&#39;d prefer to remove the debug systems than skip the split. What o=
thers<br>
&gt; think?<br>
&gt;<br>
&gt; I&#39;m not sure what you mean by that, do you mean using INHIBIT_PACK=
AGE_STRIP or something else?<br>
&gt;<br>
&gt;<br>
&gt; Yes and be sure it has been stripped during build.<br>
<br>
</div>That seems to be a lot more work for the same effect. Stripping isn&#=
39;t the problem, it&#39;s debugedit trying to do its magic that fails.<br>=
</blockquote><div><br></div><div>Well, if not stripped the symbols will be =
left in the binaries which is not expected.</div>
<div>=A0</div></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.com=
.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a hr=
ef=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystems=
.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7bd6afcc00476404f0142639--
