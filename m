Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A77387EE4F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 13:39:26 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 44so14463348qtg.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KdwmxGlbSznWAwzL5ArSIOtXPwxa6zgrerhW0Oag+uw=;
	b=c1bsLTzfCj/hgTDFWf5EtHFVuPuWn0kzI2lDBaiKRpt68SRAjwdJfDjBkG74GduNrr
	oZOmxGvq+10CADPoPV3FpT9xAdTw665QOh+U/7D0bC+EK1aolfc9COBln666OJFYABIP
	Uh5aHVmhAHHdM4QY8SmJuo/pz39czHYzYRXDNbe9jgRpQA7qm+xYmIBaXRvySGpLPcQa
	ovDXww5z4QBM4IhSI4dSz0YveXsylKP9fZ6uUBBr9vbxL2tnKazenyTFaXQw9L8dRUpy
	JibWfbf7E3vZtzJy37pxIKPvL11/a8oxFkTAEJfB0rOx61c4vqoWdikRWxdSY1AUFOVx
	xfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KdwmxGlbSznWAwzL5ArSIOtXPwxa6zgrerhW0Oag+uw=;
	b=GFNcpA2MT55J+0GXN7/VL4BAGZ1nLc9n/lRIb26WE/qqpi/uAmPxJDlhf2GDk7P3hL
	IPXWE+O9VSqScTt92ZKInXFIXyzERaciVXKqT42St3KEVrS7mEKs0w+cGuobE04fQ8Qx
	fLRnf8JDNaJTUmugiLJDitMljst2d683YgJRtKfVb0ZZtDYrUTMG+UuVvPsk80kjZZ7C
	4/RGPMPG6NycGw5isPyr3kBka2NshX+soUSoHxD52Kw8/kJ3YS52v9L5slxWLn7b4lX6
	cSlzd2dNBcOjXpOEa1ITH1y2TnOeGCWgkDN+iVqGuuRNLWYYywtqV/KY21NfwyCybQWu
	7r3g==
X-Gm-Message-State: APjAAAVopNfsUamSPVX2K82PHBBkbtyf26qDTfMKHmeV0CAQCQsaVsqT
	qMIhLQhCbErbvFugFWL2ssQp6XKPkc6oPIvy0AU=
X-Google-Smtp-Source: APXvYqxaqJTTbNjtbm0g9vfEMmwaJrMGxLBmtP2z1jJ6Nyt9DY2d2gCPnevOdYwtdEpYktJn8HB+pD/8hOf9HeTNghA=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr57348365qtn.378.1563975567413;
	Wed, 24 Jul 2019 06:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190720180058.10672-1-raj.khem@gmail.com>
	<20190720180058.10672-3-raj.khem@gmail.com>
	<20190721152022.GA5474@localhost>
	<531504ebcdae52b7ce1fe8221417d4026c0f9ceb.camel@linuxfoundation.org>
In-Reply-To: <531504ebcdae52b7ce1fe8221417d4026c0f9ceb.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2019 06:39:16 -0700
Message-ID: <CAMKF1sqhkL7moib2Z0N8+quptPW7fEx9ez_MBE0zZAjr-A-kgg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH V4 3/4] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Wed, 24 Jul 2019 13:39:26 -0000
Content-Type: multipart/alternative; boundary="00000000000022160e058e6d7070"

--00000000000022160e058e6d7070
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 1:24 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2019-07-21 at 18:20 +0300, Adrian Bunk wrote:
> > On Sat, Jul 20, 2019 at 11:00:57AM -0700, Khem Raj wrote:
> > > ...
> > > ++#if !defined(FNM_EXTMATCH)
> > > ++# define FNM_EXTMATCH (0)
> > > ++#endif
> > > ...
> >
> > As already said in [1] this is expected to result in broken code,
> > and the upstream testsuite also confirms this.
>
> I've taken the patches as they don't make things worse. I am a bit
> concerned about a few places musl is building up problematic patches
> though (systemd, elfutils, ltp come to mind).
>

Yes I am aware of this I think LTP we are upstreaming and I hope this will
be better in future
Systemd we might have to re-evaluate but I think few patches are worthy of
upstreaming elfutils I don=E2=80=99t know yet

>
> Cheers,
>
> Richard
>
>

--00000000000022160e058e6d7070
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 24, 2019 at 1:24 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 2019-=
07-21 at 18:20 +0300, Adrian Bunk wrote:<br>
&gt; On Sat, Jul 20, 2019 at 11:00:57AM -0700, Khem Raj wrote:<br>
&gt; &gt; ...<br>
&gt; &gt; ++#if !defined(FNM_EXTMATCH)<br>
&gt; &gt; ++# define FNM_EXTMATCH (0)<br>
&gt; &gt; ++#endif<br>
&gt; &gt; ...<br>
&gt; <br>
&gt; As already said in [1] this is expected to result in broken code,<br>
&gt; and the upstream testsuite also confirms this.<br>
<br>
I&#39;ve taken the patches as they don&#39;t make things worse. I am a bit<=
br>
concerned about a few places musl is building up problematic patches<br>
though (systemd, elfutils, ltp come to mind).<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes I am aware o=
f this I think LTP we are upstreaming and I hope this will be better in fut=
ure</div><div dir=3D"auto">Systemd we might have to re-evaluate but I think=
 few patches are worthy of upstreaming elfutils I don=E2=80=99t know yet=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000022160e058e6d7070--
