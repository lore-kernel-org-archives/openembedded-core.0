Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9D36FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 14:27:21 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id w198so12603721oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Mo1GzAyKBau15UK0KvR8MCzb03noVpf1kGzJlppVn3A=;
	b=xzLyEIru+M3MqPVcD/a25kzE1tCm+d3ual6CSKshWBdQVMIkuPItI2vo0FVFJ5ckVz
	tsKNWQbEpCdLxIk0xJ916Zi6jkej8mBPcINpCiO/0UtdybSp+iBvzhataKXYjSPqO86O
	c01T2WE/yl0IaROUU+ncGjlZgzJHNrDzFocZX15bXCxH9nGqA299uf0qda1MVbLULZjd
	5h/YzU8hBoU6j9EM1Dwtum8/uTROqkIHFiav3idPPRuovVSomn9F+tijqt9M2RL8c3h9
	WAONrL1v/cZa1AQBt4foWwYl6tJKGxQUkXiozso8jdjlRDaDmyrdqkZr9jEy7k832Fvb
	8ofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Mo1GzAyKBau15UK0KvR8MCzb03noVpf1kGzJlppVn3A=;
	b=NfYx8OokFsy1Lp1Frn0KZS1lheq/NDCUC/FR38yUW75uxZLQRc2sa3YuAm9hpQoTMR
	L+8LwhMMxQYDvJc0IjotMMLJcVROg6iOGZuVBJ6OaKKCdVAHe0uZB1sY0e73M/i6FWjc
	iK4JmDYoHLPNfte8ulSzgzrJ+oQKVMjtWHIyzlnXAqLfaRP09JEdlfJnk4pn+F9w5XW1
	UrXzRELxnYZ2RAcUOooeszzEqneBGD3oohBKfpAJ94/gG8JuznH8pGC/Rsj8iResaGXx
	ThGKJSAWVQrlEGI/qmqsI1pe2vE/Yauy5KoJZ8shg67umRnfe1XRu9DQuPy7Pr/B4O4R
	TnYg==
X-Gm-Message-State: AOPr4FVtsNMEHggM2BS7xnYqZbFAR6W6QyvvG5FYopA/ct7BqmrTwPdIi09uZdeGqaFQHS2iPH4skxEhxawDlg==
MIME-Version: 1.0
X-Received: by 10.202.196.72 with SMTP id u69mr4909621oif.116.1463063242422;
	Thu, 12 May 2016 07:27:22 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Thu, 12 May 2016 07:27:22 -0700 (PDT)
In-Reply-To: <CAMKF1sq8GmdowYQf6cyVJZxmXWzi7y+usAe-wpTVq2kjztXEQA@mail.gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
	<1d16314288f1f93b21bacd0016d23abcab52b501.1462987863.git.raj.khem@gmail.com>
	<CADkTA4P6hCQBMgNXZZY80OTSH2vuxjw0h27fgNvN8p22u8riAQ@mail.gmail.com>
	<CAMKF1srqdFXR4jD12MFL1rwco2aCyKYwh7dwKnNbC6xnu6ON0Q@mail.gmail.com>
	<CADkTA4O+yfpCXFzpqWcE1sC0TKD6TH2Xfbt7xiA3ncxBkYikTg@mail.gmail.com>
	<CAMKF1sonno53gN+P8=Sdxems6pZnDEGqMCMNzObJsqByPjda7A@mail.gmail.com>
	<CADkTA4M3S=rRWD8+-j+qo0jCJ1AmSJjNEDOy61+AXMLJwRmv8w@mail.gmail.com>
	<CADkTA4MXrL5Z+TwOU=O9dJseT-mFWKBNka1D2Gvb+740zQ+jYg@mail.gmail.com>
	<CAMKF1sq8GmdowYQf6cyVJZxmXWzi7y+usAe-wpTVq2kjztXEQA@mail.gmail.com>
Date: Thu, 12 May 2016 10:27:22 -0400
Message-ID: <CADkTA4Me6=MAUfLRVdtb0KYua1ut3ofuKxGESr4m-8gB2ZAdBw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/42] linux-yocto: Fix build on ppc with gcc-6
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
X-List-Received-Date: Thu, 12 May 2016 14:27:23 -0000
Content-Type: multipart/alternative; boundary=001a11352a4ed946490532a5f496

--001a11352a4ed946490532a5f496
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 10:21 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, May 12, 2016 at 6:28 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > The patches are not integrated into linux-yocto-4.4 and I added the patch
> > I've
> > attached o my zedd/kernel poky-contrib branch:
>
> Nice, is this branch already proposed for merge ?
>

Yes. I stacked it on top of the -stable updates I sent yesterday, so it is
proposed to merge
for master and krogoth.

Bruce




-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11352a4ed946490532a5f496
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 12, 2016 at 10:21 AM, Khem Raj <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, =
May 12, 2016 at 6:28 AM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt; The patches are not integrated into linux-yocto-4.4 and I added the pa=
tch<br>
&gt; I&#39;ve<br>
&gt; attached o my zedd/kernel poky-contrib branch:<br>
<br>
</span>Nice, is this branch already proposed for merge ?<br></blockquote><d=
iv><br></div><div>Yes. I stacked it on top of the -stable updates I sent ye=
sterday, so it is proposed to merge</div><div>for master and krogoth.</div>=
<div><br></div><div>Bruce</div><div>=C2=A0</div></div><br><br clear=3D"all"=
><div><br></div>-- <br><div class=3D"gmail_signature">&quot;Thou shalt not =
follow the NULL pointer, for chaos and madness await thee at its end&quot;<=
/div>
</div></div>

--001a11352a4ed946490532a5f496--
