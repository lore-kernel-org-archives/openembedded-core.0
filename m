Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4193671C36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 15:48:06 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 36so4647300otx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K9+VVDn3X6v9D1IS3+DZbt/9fzhEZVblMlM8g6n7h24=;
	b=ukQIXZsBOl3y09sBSJMUn/wkntvYtOjrvwmRDh8z1inKr36buMpLc5BHzEMr6m719l
	fTle2RWclZZTqEESkbXol7QpA264tchtsWSED9kzW9IsQQiZKz7Sb2dP+StI62QT4yDD
	V3M3VWQs7qZOSxz5ItS5PWbBu7/lYTKxuMonuablsNEUk8UJMAmysPAAcD+lAYNaIq1b
	W8JGRFBDK5kffj+3+sGdaWp0MOiyZgoT8XxbHTvpwKJGbyQKJNGkbccU6bAc7dwvy4P5
	1PIt+/P6RVyI4hWNxX26qq3kWlF4rEDTYNDJqRaGYoVRCwWluD3qhRowS92Lh/1poIxF
	RWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K9+VVDn3X6v9D1IS3+DZbt/9fzhEZVblMlM8g6n7h24=;
	b=ca00F8S7P72+AmMKQd/V7MuPMrZgZlK+RrBV7xLYs6B1voWYEtJCxygKaSgBeCB3en
	BJXMU8wVt1h2KYSrhstJfY6Nmj2/P7kha73S2vrO9jQQHsI9DPnqDlGuIelaTLgwTvle
	JztE8oKYlJ7CWSUqFtSpG9Oi3GoNOrkoq/ngl/xYwqviM6eMlp8Gxu35cvglpjZrKh60
	MEfqNBHDQ6zBFgKSbJoi2v7LldHJtHdFiy1uxUyvIpz2nfdrTE91BY1kR02q6KPG1z9z
	XE4GiP5C9pb3zsZqndaFclX0oKOyz0dQHtA6EJ6eNZPjeL/v0gj8m1ZNyWo/5oJrq7RJ
	hazw==
X-Gm-Message-State: AIkVDXJlNNAf6rbyz6Hb+M7DsEU1Fwk6z4MpzrfvMMks3x8ErjYVd+Oca+TNRlzVzCCLY1Py62cEZqIHuaAaWA==
X-Received: by 10.157.1.115 with SMTP id 106mr4464756otu.259.1484840887127;
	Thu, 19 Jan 2017 07:48:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.5.8 with HTTP; Thu, 19 Jan 2017 07:47:46 -0800 (PST)
In-Reply-To: <1484839946.5377.209.camel@intel.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
	<f776bb458e8570ec6f6c9fff1dada3ecd7a36090.1483645446.git.chris_larson@mentor.com>
	<1484839946.5377.209.camel@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 19 Jan 2017 08:47:46 -0700
Message-ID: <CABcZAN=bkTWrbTKj1n6xEPP8WWVTJ1jrwwE3HJtMdLLuA3pS0Q@mail.gmail.com>
To: "Wold, Saul" <saul.wold@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/16] gnu-efi: build 64-bit for x32
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
X-List-Received-Date: Thu, 19 Jan 2017 15:48:08 -0000
Content-Type: multipart/alternative; boundary=94eb2c03b042a021420546747525

--94eb2c03b042a021420546747525
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 19, 2017 at 8:32 AM, Wold, Saul <saul.wold@intel.com> wrote:

> On Thu, 2017-01-05 at 12:46 -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > We're targeting the x86_64 EFI ABI.
> >
> Chris,
>
> Firstly, thanks for all the x32 patches!
>
> I tried to build gnu-efi for x32 via genericx86-64 and still got a
> failure about missing the gnu/stubs-64.h. I am building pure x32, is it
> possibly you build x32 in a TMPDIR that already had a 64bit build?
>
> There is a generated stubs-x32.h, but not the required -64 variant.
>
> Can you confirm this builds correctly?


I'm building x32-only, but admittedly 90% of my builds are with an external
toolchain, so any bugs in the build of the toolchain obviously wouldn't be
encountered in that case. I suspect that's what's happening here, so this
would be a new issue to dive into.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--94eb2c03b042a021420546747525
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Jan 19, 2017 at 8:32 AM, Wold, Saul <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:saul.wold@intel.com" target=3D"_blank">saul.wold@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, 2017-=
01-05 at 12:46 -0700, Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; We&#39;re targeting the x86_64 EFI ABI.<br>
&gt;<br>
</span>Chris,=C2=A0<br>
<br>
Firstly, thanks for all the x32 patches!<br>
<br>
I tried to build gnu-efi for x32 via genericx86-64 and still got a<br>
failure about missing the gnu/stubs-64.h. I am building pure x32, is it<br>
possibly you build x32 in a TMPDIR that already had a 64bit build?<br>
<br>
There is a generated stubs-x32.h, but not the required -64 variant.<br>
<br>
Can you confirm this builds correctly?</blockquote></div><br>I&#39;m buildi=
ng x32-only, but admittedly 90% of my builds are with an external toolchain=
, so any bugs in the build of the toolchain obviously wouldn&#39;t be encou=
ntered in that case. I suspect that&#39;s what&#39;s happening here, so thi=
s would be a new issue to dive into.<br>-- <br><div class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr=
">Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, Open=
Embedded, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></di=
v></div></div>
</div></div>

--94eb2c03b042a021420546747525--
