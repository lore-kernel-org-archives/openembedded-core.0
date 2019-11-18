Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id BB8C26C3E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 21:39:59 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id g12so7214827qvy.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yasxtifprVX+AA+ahYjZ6Jm2tKxMDro+HQJWVc6wJP4=;
	b=bv1GqEXa58SEBaQYNFHFiFKRktMJqXKJNS2+4GTdDv3+xfu7momfY/8ZOcQ0qltFXA
	Ez+7OGiVEfiW8vi0LuQnH6ntdE/kLQh4Hk+DzUM54sVlGneNW3BrHX/vm7b8Lgi6IUNP
	u1OLbfUclbHsV+dOb/fMFaG+yoHVNPxLOAize2R3HzbNPhpgIDjtYcKbHU0DhVk/3wuV
	+jQhDSnindU4ei9EAhmBXjI2shCm7BCd8pdylyVv0jT+ITcb6SYj6YY7bpgheT45M9P7
	67dwHNq2dK45o79o5BtWDDVUzcqvBQmAHNVwpX10DQOhI7DyOEy+yOFLSL/9JRvBTv8i
	HUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yasxtifprVX+AA+ahYjZ6Jm2tKxMDro+HQJWVc6wJP4=;
	b=hhVdXKeN5DCO+Y+9w7tQaoIuqGbp84VXDh25CeyG54zHSU2RW41wtMSMEr3zBU0B1O
	9psEyArPBUmI3AiOJE9SVwa2UtH1q35ybrIxA/jHME6wRvQ4q8NiioZtXv3eOOVM9rLI
	6FbemxKU2Hf3GIuffF2BQp2dDZhiHBvgINYBqSpO2PpYTvs5CoufblPPqu42etd9rkbw
	nJ0n4VbOO8trj9IAXlhPMeMyj1JPOgmzL4E1qPxSCmx0ge5H1oNd/tAPIHHVIEhFbqCd
	LfEQHn+VnJah1QDJxOhwSKmsySO5MFHl39IT7XFrlQYzKHNQsmGwXhWSr4xtRdDwke+4
	jS+Q==
X-Gm-Message-State: APjAAAV5fW0NP2XqXlJIAzCu1GpojI4dwQlrVu4sKrQ5Ec2K+XSbdu+9
	U8yoGHzKPY5PDFnl6C0K7F7iVe/ly/nWiw9KJkZ7x696
X-Google-Smtp-Source: APXvYqz486842ShczrZ4DzhYTVu+okwSh36FCVACiUQ7SEs12raI0EWAYESfm8K5JGx7/PjMOPPAkn7+j+GvBtbia2U=
X-Received: by 2002:a05:6214:901:: with SMTP id
	dj1mr9136640qvb.99.1574113200020; 
	Mon, 18 Nov 2019 13:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
In-Reply-To: <20191118210500.GA4741@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Nov 2019 13:39:48 -0800
Message-ID: <CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Mon, 18 Nov 2019 21:40:00 -0000
Content-Type: multipart/alternative; boundary="0000000000001fa3fd0597a5caa8"

--0000000000001fa3fd0597a5caa8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 1:05 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Mon, Nov 18, 2019 at 10:13:05AM -0800, Khem Raj wrote:
> > On Mon, Nov 18, 2019 at 5:08 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Drop backports, rebase a couple of patches.
> > >
> > > This is the second last release of py 2.x; upstream support ends on
> > > 1 January 2020, there will be one final 2.x afterwards.
> > >
> > > Note that the only thing that still needs python 2.x in oe-core is
> > > u-boot; when the next u-boot update arrives, we should find out
> > > where the py3 migration is for that component before merging the
> > > update.
> >
> > I guess u-boot need it during build, in that case defer it to user to
> > have python2 on build host
> > could be possible.
> >...
>
> That's a non-option since it could mean
> "Yocto 3.1 cannot be built on Ubuntu 20.04".
>
> Ubuntu 20.04 might end up still shipping Python2,[1]
> but you cannot rely on future distributions shipping it.
>

And why should OE ship something that=E2=80=99s dropped by its own upstream=
 and
other distributions


> cu
> Adrian
>
> [1] it is not clear whether the Python2 removal in Ubuntu
>     will be finished in time for 20.04
>

--0000000000001fa3fd0597a5caa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 18, 2019 at 1:05 PM Adrian Bunk &lt;<a href=3D"=
mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Mon, Nov 18, 2019 at 10:13:05AM -0800, Khem Raj wrote:=
<br>
&gt; On Mon, Nov 18, 2019 at 5:08 AM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Drop backports, rebase a couple of patches.<br>
&gt; &gt;<br>
&gt; &gt; This is the second last release of py 2.x; upstream support ends =
on<br>
&gt; &gt; 1 January 2020, there will be one final 2.x afterwards.<br>
&gt; &gt;<br>
&gt; &gt; Note that the only thing that still needs python 2.x in oe-core i=
s<br>
&gt; &gt; u-boot; when the next u-boot update arrives, we should find out<b=
r>
&gt; &gt; where the py3 migration is for that component before merging the<=
br>
&gt; &gt; update.<br>
&gt; <br>
&gt; I guess u-boot need it during build, in that case defer it to user to<=
br>
&gt; have python2 on build host<br>
&gt; could be possible.<br>
&gt;...<br>
<br>
That&#39;s a non-option since it could mean<br>
&quot;Yocto 3.1 cannot be built on Ubuntu 20.04&quot;.<br>
<br>
Ubuntu 20.04 might end up still shipping Python2,[1]<br>
but you cannot rely on future distributions shipping it.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">And why should O=
E ship something that=E2=80=99s dropped by its own upstream and other distr=
ibutions=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><br>
cu<br>
Adrian<br>
<br>
[1] it is not clear whether the Python2 removal in Ubuntu<br>
=C2=A0 =C2=A0 will be finished in time for 20.04<br>
</blockquote></div></div>

--0000000000001fa3fd0597a5caa8--
