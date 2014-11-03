Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id DF95B65DEB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 17:34:01 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id dc16so8612328qab.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 09:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cqW4rIwRShhWy818UwStwmZflOWUZp/ewHzUTA7JO9A=;
	b=k2vFiO0np3GlvxUYdzo21ZewZKVz03r4iLnZhQxjorZAtqXid+2Nl/AnSPO7CIj6Yd
	pPLqxWW1GoFyypezfTtuD5yDk1P90GpfzrwMSyBYHr9TqwfjgSfzY/RcoygfebTu0OSZ
	K5EXg6grYHxSGtDE8A0D59QJF/YF4BQGctb5gV0HZIJrUtHh6ESFyYW+oiCASMlP0baj
	8nFIaJI1LwNODdvpo6W/blHFwdSAtC2WTbGa7ovGWZCIPzMtH1w49cgpTZqTl8O74K75
	xO8/npBIeLtsREABS11FpvYbQLWoW/nVF+upFzHIvmEDmr1IfQJehsrsoizlxA/qQBoX
	YRTw==
X-Gm-Message-State: ALoCoQlbVPY7dQxKqL6CQ0v2qugX0v7C0NGQPZsY9uPPp0eeGGTMKwbLwcP+6tp30VeuJAmhAda6
X-Received: by 10.224.28.68 with SMTP id l4mr64561013qac.22.1415036041495;
	Mon, 03 Nov 2014 09:34:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 3 Nov 2014 09:33:41 -0800 (PST)
In-Reply-To: <363A0B14-2FE4-4F63-BA2C-C9581F1D86CA@dominion.thruhere.net>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
	<CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>
	<07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>
	<1415016627.5111.9.camel@ted>
	<9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>
	<CAJTo0LaeFG5ceKK1a1ugPEHyQ5z1dz6YVqY7Y0gPyD6vyWY=BA@mail.gmail.com>
	<363A0B14-2FE4-4F63-BA2C-C9581F1D86CA@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Nov 2014 17:33:41 +0000
Message-ID: <CAJTo0LZSyy78b=nNzzvF8P1cVUQTrNSk5HNQJ2+9qtcZDG+MrA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 03 Nov 2014 17:34:11 -0000
Content-Type: multipart/alternative; boundary=001a11c2c3ce993e250506f7c0b0

--001a11c2c3ce993e250506f7c0b0
Content-Type: text/plain; charset=UTF-8

On 3 November 2014 17:13, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Most likely not because we already have meta-aarch64 for the toolchain and
> kernel support. But aside from that, the past few *years* it wasn't a
> problem to get aarch64 related patches merged into OE-core, so why is there
> suddenly such a problem now?
>

Because oe-core was frozen and we were only taking serious fixes.  Now
there's a number of related patches that can and should be bundled up so
they can be tested as a whole.


> Furthermore, this libpng patch isn't strictly an aarch64 patch, it fixes a
> previous commit that should have been flagged in review as being wrong for
> using double qualifiers in a bogus way. So why did the culprit go in and
> the fix submitted 3 days later not?


That patch in particular?  Because humans are not infallible.  FWIW, this
is in my MUT now.

Ross

--001a11c2c3ce993e250506f7c0b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
 November 2014 17:13, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto:koe=
n@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.net</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex">Most likely not because we already hav=
e meta-aarch64 for the toolchain and kernel support. But aside from that, t=
he past few *years* it wasn&#39;t a problem to get aarch64 related patches =
merged into OE-core, so why is there suddenly such a problem now?<br></bloc=
kquote><div><br></div><div>Because oe-core was frozen and we were only taki=
ng serious fixes.=C2=A0 Now there&#39;s a number of related patches that ca=
n and should be bundled up so they can be tested as a whole.</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex">
Furthermore, this libpng patch isn&#39;t strictly an aarch64 patch, it fixe=
s a previous commit that should have been flagged in review as being wrong =
for using double qualifiers in a bogus way. So why did the culprit go in an=
d the fix submitted 3 days later not?</blockquote></div></div><div class=3D=
"gmail_extra"><br>That patch in particular?=C2=A0 Because humans are not in=
fallible.=C2=A0 FWIW, this is in my MUT now.<br></div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c2c3ce993e250506f7c0b0--
