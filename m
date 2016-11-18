Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA9871AB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 00:59:57 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id f201so4611495oib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 16:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=fpE433fJ0wiioLQJq/FKYAUliQT5aZG0f7An5b5pXr0=;
	b=to3e/bWIF22RvS8pnAgYKQkwe5egb8Pvx2JBsEigOViRAkxog9ilEdrKHaKfG3MALG
	Y2c34tAjNB1TdrEByJ3oiV8bUPqp6S5JrqpkIHyE+RFdfS4VnXP+JcK3xKwt3weHnJ2U
	hjaCRYlSHPpyjUkhuHod+3hgztjzHt07InwlPH6Zd3mj2/od61EJuYWPDnS9qmUScr+R
	g+Z71/v47VD11VzqvzEPiS4Mky85g9/alh/HlRMn7MFZuQ6Z8IqU3LpAfRUY2KwBk1cM
	Cwz1CejkSQ1M3ERi/DxStDgPAP6W0TIG3zSVxfNfdKrYIX81BQAtZJ9BCCyV0u95bBME
	Oe4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=fpE433fJ0wiioLQJq/FKYAUliQT5aZG0f7An5b5pXr0=;
	b=QOtFlh/E5wzK97P4Hps0esmo7mmSJblNpg4i4utuqox47sMl13JOlCDC7YYQo1JeLE
	jSPKSZojTMJSB4fFMM8D2incRydybjaKLfBhxm9OAPTJEYJYhJ0pcCLfAzCyPrEz3xiP
	SWFCDorPVlRLhmaaRbykXIUZICiMgiHuLFXJw0wYaAokKdjWheTdB2t0l5wN89kjtn+c
	5XHfQgTvPse4MOQjbodYCCthRo5S8C0pcdLSp9x7Kq2k/YldocVHRKcqwCNmr9Ss4wBB
	zm7Gg2F9W2ZBxhoFm9Un+r5q06b1pV89kQtX7B+A4K/dXvEp65Lav3rRIPAQRGWJa1uQ
	Qo9A==
X-Gm-Message-State: AKaTC01yHM6PKMUwGux7f3dBpkZJqCEPTzefs+GRPW0MFCA0bjtwA7KQHAXT0zPl9vcJweQEFP3h1TfOwd6t6g==
X-Received: by 10.202.231.68 with SMTP id e65mr2985023oih.200.1479430799275;
	Thu, 17 Nov 2016 16:59:59 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.65 with HTTP; Thu, 17 Nov 2016 16:59:38 -0800 (PST)
In-Reply-To: <1479423992.28508.99.camel@linuxfoundation.org>
References: <CAJ86T=U8RB13J_we2bte22bFQKwnahCe3v5L6na9SDPKm6O8bA@mail.gmail.com>
	<1479423992.28508.99.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 17 Nov 2016 17:59:38 -0700
X-Google-Sender-Auth: zEixPYDK8LxxO4x2ucOalI5jDF0
Message-ID: <CABcZANkrmRksUCq6M+cenETY1ak=YvSGzXudxPprY+2nfkJKWQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Modifying SRC_URI from anonymous python
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
X-List-Received-Date: Fri, 18 Nov 2016 00:59:58 -0000
Content-Type: multipart/alternative; boundary=001a1141ba2442b9b9054188d399

--001a1141ba2442b9b9054188d399
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 17, 2016 at 4:06 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2016-11-17 at 13:28 -0800, Andre McCurdy wrote:
> > I have a supplier who provides recipes which set SRC_URI to their
> > private git servers. To make those same recipes usable by others (ie
> > me), some anonymous python is used to transform the default SRC_URI
> > (elements which contain private git URLs are replaced, patches and
> > other files are left as-is).
> >
> > This apparently worked in OE 2.0 but from 2.1 onwards the anonymous
> > python which modifies SRC_URI races with the anonymous python in
> > base.bbclass which parses SRC_URI to determine additional
> > do_fetch/do_unpack dependencies and whether or not to call
> > fetch2.get_srcrev().
>
> I suspect we made some changes around that time to ensure determinism
> in the order certain things happened.
>
> >  Specifically I get failures because
> > fetch2.get_srcrev() sees the original SRC_URI and tries to resolve
> > AUTOREV from a repo to which I don't have access.
> >
> > The proposed solution from the supplier is this patch to
> > base.bbclass:
> >
> > @@ -598,7 +598,7 @@ python () {
> >              d.appendVarFlag('do_unpack', 'depends', '
> > file-native:do_populate_sysroot')
> >
> >      if needsrcrev:
> > -        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
> > +        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}",
> > parsing=True)
> >
> >      set_packagetriplet(d)
>
>
> parsing=True is a bitbake internal thing, its not documented and
> shouldn't be used outside the bitbake codebase. In hindsight, naming
> could have been better.
>
> > After reading the setVar source I'm not very clear how or why this
> > works, but it looks dubious. What is parsing=True intended to do?
>
> Its internal bitbake data store stuff, don't use or rely on it. It
> might happen to work here but its just luck.
>
> > Is it documented somewhere that modifying SRC_URI from anonymous
> > python isn't allowed? I've now seen two suppliers both independently
> > run into the same problem when updating to OE 2.1.
>
> We have an open bug related to anonymous python ordering. Its hard to
> fix easily as something can indicate it wants to run last, but then
> everything wants to run last. As Chris mentions, you can use an earlier
> event handler as one way to work around it.


I think our best bet there is to move toward more explicit event handler
naming and dependency handling amongst event handlers.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141ba2442b9b9054188d399
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 17, 2016 at 4:06 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On Thu, 2016-11-17 at 13:28 -0800, Andre McCurdy w=
rote:<br>
&gt; I have a supplier who provides recipes which set SRC_URI to their<br>
&gt; private git servers. To make those same recipes usable by others (ie<b=
r>
&gt; me), some anonymous python is used to transform the default SRC_URI<br=
>
&gt; (elements which contain private git URLs are replaced, patches and<br>
&gt; other files are left as-is).<br>
&gt;<br>
&gt; This apparently worked in OE 2.0 but from 2.1 onwards the anonymous<br=
>
&gt; python which modifies SRC_URI races with the anonymous python in<br>
&gt; base.bbclass which parses SRC_URI to determine additional<br>
&gt; do_fetch/do_unpack dependencies and whether or not to call<br>
&gt; fetch2.get_srcrev().<br>
<br>
</span>I suspect we made some changes around that time to ensure determinis=
m<br>
in the order certain things happened.<br>
<span class=3D""><br>
&gt;=C2=A0 Specifically I get failures because<br>
&gt; fetch2.get_srcrev() sees the original SRC_URI and tries to resolve<br>
&gt; AUTOREV from a repo to which I don&#39;t have access.<br>
&gt;<br>
&gt; The proposed solution from the supplier is this patch to<br>
&gt; base.bbclass:<br>
&gt;<br>
&gt; @@ -598,7 +598,7 @@ python () {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0d.appendVarFlag(&#39;<wbr>do_unpack&#39;, &#39;depends&#39;, &#39;=
<br>
&gt; file-native:do_populate_<wbr>sysroot&#39;)<br>
&gt;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if needsrcrev:<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.setVar(&quot;SRCPV&=
quot;, &quot;${@bb.fetch2.get_srcrev(d)}&quot;)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.setVar(&quot;SRCPV&=
quot;, &quot;${@bb.fetch2.get_srcrev(d)}&quot;,<br>
&gt; parsing=3DTrue)<br>
&gt;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0set_packagetriplet(d)<br>
<br>
<br>
</span>parsing=3DTrue is a bitbake internal thing, its not documented and<b=
r>
shouldn&#39;t be used outside the bitbake codebase. In hindsight, naming<br=
>
could have been better.<br>
<span class=3D""><br>
&gt; After reading the setVar source I&#39;m not very clear how or why this=
<br>
&gt; works, but it looks dubious. What is parsing=3DTrue intended to do?<br=
>
<br>
</span>Its internal bitbake data store stuff, don&#39;t use or rely on it. =
It<br>
might happen to work here but its just luck.<br>
<span class=3D""><br>
&gt; Is it documented somewhere that modifying SRC_URI from anonymous<br>
&gt; python isn&#39;t allowed? I&#39;ve now seen two suppliers both indepen=
dently<br>
&gt; run into the same problem when updating to OE 2.1.<br>
<br>
</span>We have an open bug related to anonymous python ordering. Its hard t=
o<br>
fix easily as something can indicate it wants to run last, but then<br>
everything wants to run last. As Chris mentions, you can use an earlier<br>
event handler as one way to work around it.</blockquote></div><br>I think o=
ur best bet there is to move toward more explicit event handler naming and =
dependency handling amongst event handlers.<br>-- <br><div class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson =
at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mainta=
iner - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1141ba2442b9b9054188d399--
