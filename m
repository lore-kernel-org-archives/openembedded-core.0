Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 63BA96041D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 08:18:00 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v25so5312000qto.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 00:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K1YWBB6JfTME96kHCYSYDnC5PK367LdXtxVha8NVAfQ=;
	b=MlEUkzA+fMCsQ1t0PSB26Qtz1Nn5ikGmmpxirgnO+u9l+lhyK/Pmc+vRZ7PN/XW24G
	jSno38yy3gLFtDOonYDxhOSSIXQ82YvYbiOXdhuSRd58a1wI4kCXcYkmHHiFbcPSoOFN
	aHc+jEJAZ+o0yYKdBsuQGWp5lzPTx7I+nj9IIbENlJSxUmL+UChki6+BCRMCTteLVctT
	/kch9iyj1tiSy/IIod7qhAOyYBoQmj9NkCjVsYzI4wFc28RL7OeRyF0IUyNqGQtQg5T9
	FH7ogzc0+ZMoU1+0jsLPFDFaWxI0WF4LZT2sAm78px0SBRha1sr/NqV2f2o8VgPSB62g
	qL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K1YWBB6JfTME96kHCYSYDnC5PK367LdXtxVha8NVAfQ=;
	b=P8vS7kVwlbeXf3cC9gffL5I8N5tlGfrRTd1keffVlqFBKRz7SPL5nG4PnCX49+rFF8
	AI0bLfOWgN5SuDuClZ47tmitnf5pTy6vPEwdQQvxvEFC++DKI9copAJ4tI3WinS+DEhB
	cw0GahJJt0qAjNT86N4vf7Pzc3p+SixqjVl7ZfDKe6dihNT9EXpGw4PBNwFBJy75Xnry
	LACJeHdw0BG3SOPZ4Ik41JOCjyLtOVzuhAHLfZL6QnmKV1NoW4/Qms7rAJoeikGgn/d2
	8DLamvJJpnGZmVC0xxFrDLrSxXqpePuO8BxWTBi8vCCMHsX+xKQCSdNT7mdz+opexS1i
	gWjw==
X-Gm-Message-State: APjAAAVUIIM2jdizowxT0TXDGszuMDgCDM9RgOjQJrz6tZDRaL8FmhAq
	FAjvxInqHFYI/Tj4+sgNAsy/YZ8yJ+Iyprx7BFffww/T
X-Google-Smtp-Source: APXvYqzgboMXVKPMFbCrATLW/t6QRe4bwTFOXJVcJ8rpi/0GOLlM503RKvRyWpQbPPssaNP4iBn3+jrl+FS7mr8Z+Rg=
X-Received: by 2002:aed:29a4:: with SMTP id o33mr10540368qtd.316.1583050681028;
	Sun, 01 Mar 2020 00:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20200301014301.805156-1-raj.khem@gmail.com>
	<20200301014301.805156-2-raj.khem@gmail.com>
	<6ebd8c098cac7dab116f9043e7b64fe9b3376601.camel@linuxfoundation.org>
	<CAMKF1spJ_aBK=JdZvr0yFLEHBgYeQcZhUFHBaHDcHt=J05O8=g@mail.gmail.com>
	<7737c4f098af15087a434de3b1a09d8d651ebaa8.camel@linuxfoundation.org>
In-Reply-To: <7737c4f098af15087a434de3b1a09d8d651ebaa8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Mar 2020 00:17:50 -0800
Message-ID: <CAMKF1sqVqVDgUac2+G6VX4GmvD7+ecF9HzO731s=OsrWESk+dg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus-test: Fix QA host-contamination errors
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
X-List-Received-Date: Sun, 01 Mar 2020 08:18:00 -0000
Content-Type: multipart/alternative; boundary="0000000000008113f2059fc6b56a"

--0000000000008113f2059fc6b56a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2020 at 12:14 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2020-03-01 at 00:12 -0800, Khem Raj wrote:
> >
> >
> > On Sat, Feb 29, 2020 at 11:57 PM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Sat, 2020-02-29 at 17:42 -0800, Khem Raj wrote:
> > > > Errors like below are fixed
> > > >
> > > > bus/connection.h is owned by uid 1000, which is the same as t
> > > > he user running bitbake. This may be due to host contamination
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-core/dbus/dbus-test_1.12.16.bb | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > Why aren't we seeing this everywhere? The autobuilders don't show
> > > it
> > > and no other reports. What is unique to your setup to reproduce
> > > this?
> >
> > These are QA warnings by default and in my distro I turned it into
> > error so they were being reported before too
>
> The autobuilder would show any warnings or errors and we're not seeing
> either.
>
> > Secondly this is a Debian10 minimum container running in docker where
> > the user id is 1000 for the build user other than that there is
> > nothing special
>
> We run debian10 builders on the autobuilder.
>
> I just don't understand why weren't not seeing this everywhere. We
> really need to understand why this is :/.


From what you see from fixes what it=E2=80=99s reporting are legit errors
Why it=E2=80=99s not showing up everywhere I am not sure
I don=E2=80=99t see it on Ubuntu 18.04 boxes without docker as well


>
> Cheers,
>
> Richard
>
>

--0000000000008113f2059fc6b56a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Mar 1, 2020 at 12:14 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 2020-=
03-01 at 00:12 -0800, Khem Raj wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Sat, Feb 29, 2020 at 11:57 PM Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Sat, 2020-02-29 at 17:42 -0800, Khem Raj wrote:<br>
&gt; &gt; &gt; Errors like below are fixed<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; bus/connection.h is owned by uid 1000, which is the same as =
t<br>
&gt; &gt; &gt; he user running bitbake. This may be due to host contaminati=
on<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.1=
2.16.bb" rel=3D"noreferrer" target=3D"_blank">dbus-test_1.12.16.bb</a> | 4 =
++--<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; Why aren&#39;t we seeing this everywhere? The autobuilders don&#3=
9;t show<br>
&gt; &gt; it<br>
&gt; &gt; and no other reports. What is unique to your setup to reproduce<b=
r>
&gt; &gt; this?<br>
&gt; <br>
&gt; These are QA warnings by default and in my distro I turned it into<br>
&gt; error so they were being reported before too <br>
<br>
The autobuilder would show any warnings or errors and we&#39;re not seeing<=
br>
either.<br>
<br>
&gt; Secondly this is a Debian10 minimum container running in docker where<=
br>
&gt; the user id is 1000 for the build user other than that there is<br>
&gt; nothing special <br>
<br>
We run debian10 builders on the autobuilder.<br>
<br>
I just don&#39;t understand why weren&#39;t not seeing this everywhere. We<=
br>
really need to understand why this is :/.</blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto">From what you see from fixes what it=E2=80=99s rep=
orting are legit errors=C2=A0</div><div dir=3D"auto">Why it=E2=80=99s not s=
howing up everywhere I am not sure</div><div dir=3D"auto">I don=E2=80=99t s=
ee it on Ubuntu 18.04 boxes without docker as well=C2=A0</div><div dir=3D"a=
uto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000008113f2059fc6b56a--
