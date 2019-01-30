Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0897C31F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:18:16 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id u47so1402197qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 14:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MkHvmGfya2gv5kwyAFVxYHYL/tr14m5I1TonXlvGxjA=;
	b=ByBBVLGu056b2yDb6IREJEhMEZRP8AkxG/fBFxPdAF+AGVGN2FgNf2QYHWjDkE/gl6
	zJoCE2IPrxzPmtF6NXhfAJeqIhdsruO+PsswtD3p6X3gt65nmwt0SYeAWUNBttXb5QsB
	TO2C0TimFK139DYukUttJk7v+IfJ0dtBNRhjadmTZOyAKPgazX2Wi397/asdRTPxqFcj
	aO8XP9jl7IgylMwI0K5l55phaytVIkLGPrtOtRXPwQvVwzIdFVvJTFDNwbVJTp/JMmam
	hAS1Nann2jJHe9tZzrjRWjBM3iHncCvh9ZNHaGK1DPQQfVxWjevimlh6iWAIKmETCjwD
	1mFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MkHvmGfya2gv5kwyAFVxYHYL/tr14m5I1TonXlvGxjA=;
	b=sVoU7D1MY10NzCOw6QUMVOkbXgUmbE2mvUvpVwB7lBfcYcA0GiH2U3hDdsGH+Hk/D/
	7GVzjbGemiV4TN+zcezDBqdHfGoL1XABb1dqHAKtaCLRtJjLqRNM4E2L8eJNzK4Q4iB0
	wHqNVk37/xwIkeSymQ2DmWRMZu5tafsCMpWv7ou8liX5cLFVnhY6rysO6zPSsf2eZ96f
	ZYtpFwnIyl10nsxf7y5anatwxxoW9CXDD0k1FwsgmUQICDg7ks/8nmOVuErZoblwa0in
	nRcQ3k4KIk02OitFgcPitOExFkjNAam7glJTRxw1QUFVPSxiXK/rjBZupG44bXtvAkl3
	vNQQ==
X-Gm-Message-State: AJcUukdBUOnvfyFhWI2TdblV8r/tIb5lHvy+vUJt/biAnhqbmqkMrjHC
	jBOwaHIX77Elldrw9Bifuhh90vJrBOYRnfduliFTEQ==
X-Google-Smtp-Source: ALg8bN5pK/w41KC8+tQ1WT7H7i8JF5YagIo/VXEJR3cArj7vqXcY8PyJKvlcpFXIj9yy2Ed+6zVlREjxL3CTyATnSXo=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr31117820qtn.254.1548886697727;
	Wed, 30 Jan 2019 14:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<20190130203129.GB15086@localhost>
In-Reply-To: <20190130203129.GB15086@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jan 2019 14:18:06 -0800
Message-ID: <CAMKF1sq6Syjj5D3YT463z+d4NiVRaFNmTvM6gww5npLGvWR9nA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Wed, 30 Jan 2019 22:18:17 -0000
Content-Type: multipart/alternative; boundary="0000000000006a5a6f0580b4499d"

--0000000000006a5a6f0580b4499d
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 30, 2019 at 12:31 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Wed, Jan 30, 2019 at 08:50:02AM -0800, Khem Raj wrote:
> > On Wed, Jan 30, 2019 at 1:34 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > This is a tiny but pretty useful tool.
> > >
> >
> > question is, do we need this enabled in default config, or could be add
> it via
> > some DISTRO_FEATURE meant for validation etc. May be if you explain your
> > usecase then we might be able to make a better assessment.
>
> Sorry for being too terse.
>
> devmem allows reading and writing hardware configuration registers,
> which is useful both for debugging and for scripts.
>

Thanks for the info this seems useful can you also report how much does it
increase size of busybox

>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

--0000000000006a5a6f0580b4499d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed,=
 Jan 30, 2019 at 12:31 PM Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de"=
>bunk@stusta.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On W=
ed, Jan 30, 2019 at 08:50:02AM -0800, Khem Raj wrote:<br>
&gt; On Wed, Jan 30, 2019 at 1:34 AM Adrian Bunk &lt;<a href=3D"mailto:bunk=
@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; This is a tiny but pretty useful tool.<br>
&gt; &gt;<br>
&gt; <br>
&gt; question is, do we need this enabled in default config, or could be ad=
d it via<br>
&gt; some DISTRO_FEATURE meant for validation etc. May be if you explain yo=
ur<br>
&gt; usecase then we might be able to make a better assessment.<br>
<br>
Sorry for being too terse.<br>
<br>
devmem allows reading and writing hardware configuration registers,<br>
which is useful both for debugging and for scripts.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for the i=
nfo this seems useful can you also report how much does it increase size of=
 busybox=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
</blockquote></div></div>

--0000000000006a5a6f0580b4499d--
