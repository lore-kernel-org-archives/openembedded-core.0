Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id AB7376A593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 16:33:46 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id fb19so2064430obc.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=B98sn+yLw6sol4vw8GpT0ZWb59ch3N4OPel/qhEpjZU=;
	b=mU+fZG33k2qEUH88NPXrZQh8yH34tZJQfPs2H2gKxai30BTCoqasDhNlpIyBZoYUpl
	BukITh+UDxsh27BTjuMHf/VHnFFFa9Uf7HQmgpzw1GomMjsV3EMiG88AI86vT66LA5ND
	VAjyF2/7I1f5tTF58jZJy6ctAEL05UqMye8cm99mnxQxSRrF8qBfuqj6zlEbiSQm3fs3
	DWY/452N66ohG7vlbBdnpyfZaKQ0NMRtrd+w0Bed9EsYjbMDB4ksk+UyQrdlOOkak0Xu
	LaS5jEcMNY0Vx42SAhrlB+/ySQ7iP0H9Gw0+0vREvhnE1qQG0TurWDFe+kaDMds1GwPK
	ptDg==
MIME-Version: 1.0
X-Received: by 10.182.111.164 with SMTP id ij4mr21450335obb.59.1369758827373; 
	Tue, 28 May 2013 09:33:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Tue, 28 May 2013 09:33:47 -0700 (PDT)
In-Reply-To: <1369758517.8846.20.camel@phil-desktop.brightsign>
References: <1369753475-22573-1-git-send-email-otavio@ossystems.com.br>
	<1369753938.8846.8.camel@phil-desktop.brightsign>
	<CAP9ODKqkoXrrYSyQJzRxmDfBKnQWYMUoCV8dhRvHGm2Y-sXp7g@mail.gmail.com>
	<1369755098.8846.16.camel@phil-desktop.brightsign>
	<CAP9ODKpzC7hM54OQ3dBQ5fBs5D5Fo=vawo1xWWA_wLKY8cPv-w@mail.gmail.com>
	<1369758517.8846.20.camel@phil-desktop.brightsign>
Date: Tue, 28 May 2013 13:33:47 -0300
X-Google-Sender-Auth: Fv2ZXp3o7GkD-5nmd0agT5Hlp0A
Message-ID: <CAP9ODKp_DwsLazRcsidwiwsLNZAsrv1PZ7Rou8FM1StmygUxzw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add COMPATIBLE_DISTRO_FEATURES support
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
X-List-Received-Date: Tue, 28 May 2013 16:33:47 -0000
Content-Type: multipart/alternative; boundary=089e0149d0d6556f5604ddc9d423

--089e0149d0d6556f5604ddc9d423
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 28, 2013 at 1:28 PM, Phil Blundell <pb@pbcl.net> wrote:

> On Tue, 2013-05-28 at 13:08 -0300, Otavio Salvador wrote:
>
> > I dislike the 'required' my idea here was each item of the 'compat
> > distro features' would be as an OR. Like
> >
> >
> > COMPATIBLE_DISTRO_FEATURE = "x11 wayland"
>
> Oh, right, I see.  Sorry, I misunderstood the intent of your original
> patch.
>
> Well, then, how about making each item be a regex and having:
>
> REQUIRED_DISTRO_FEATURES = "x11|wayland qt|gtk"
>
> or some such?
>

I did it initially using a regexp but I think it is too complexity for a
small thing. Besides the features has  a fixed value (different of machine
name and like) so a list would fit better.


> All that said, before spending too much more time debating the minutiae
> of this particular feature, I'd kind of like to get a better
> understanding of what problem it's actually solving.  How many recipes
> would actually need to use this mechanism and why?
>

In meta-fsl-arm, for now, it'll be 4 (gpu-viv-bin, gpu-viv-wl-bin,
amd-gpu-bin and amd-gpu-x11-bin) but I think other layers has same need.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e0149d0d6556f5604ddc9d423
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, May 28, 2013 at 1:28 PM, Phil Blundell <span dir=3D"ltr">&l=
t;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</spa=
n> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, 2013-05-28 at 13:0=
8 -0300, Otavio Salvador wrote:<br>
<br>
&gt; I dislike the &#39;required&#39; my idea here was each item of the &#3=
9;compat<br>
&gt; distro features&#39; would be as an OR. Like<br>
&gt;<br>
&gt;<br>
&gt; COMPATIBLE_DISTRO_FEATURE =3D &quot;x11 wayland&quot;<br>
<br>
</div>Oh, right, I see. =A0Sorry, I misunderstood the intent of your origin=
al<br>
patch.<br>
<br>
Well, then, how about making each item be a regex and having:<br>
<br>
REQUIRED_DISTRO_FEATURES =3D &quot;x11|wayland qt|gtk&quot;<br>
<br>
or some such?<br></blockquote><div><br></div><div style>I did it initially =
using a regexp but I think it is too complexity for a small thing. Besides =
the features has =A0a fixed value (different of machine name and like) so a=
 list would fit better.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
All that said, before spending too much more time debating the minutiae<br>
of this particular feature, I&#39;d kind of like to get a better<br>
understanding of what problem it&#39;s actually solving. =A0How many recipe=
s<br>
would actually need to use this mechanism and why?<br></blockquote><div><br=
></div><div style>In meta-fsl-arm, for now, it&#39;ll be 4 (gpu-viv-bin, gp=
u-viv-wl-bin, amd-gpu-bin and amd-gpu-x11-bin) but I think other layers has=
 same need.</div>
<div style><br></div></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =
=A0<a href=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://pr=
ojetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e0149d0d6556f5604ddc9d423--
