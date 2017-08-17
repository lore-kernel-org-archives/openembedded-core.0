Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3537199A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:46:56 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id n125so21444897vke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 04:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wx2KU7ljb/rsWV1Kk3vfA8TpgXZZeR9bLsuAPX5A90c=;
	b=dAVJt+xIOFE/x2cFp9CJrapvL6BH6mEI4LE/Lr+uXdTLGszwH9aLoiAZ9SNMiY2XLY
	XNKIZaKj52WH144q8KwvFnsyzVWyyRp/kPBCvQ8kcRLFKCntWAz8BwsB/BX+j68w6sFS
	ee2iz+hXW9JITbTyNMgQBIh2sNGK4Pr2rsI65RtRWYLOa3nZqOxqjaVNl+pTFL9TIMUM
	SxqC4UaBqoDwZpI5gK0Rq5rykv1k7tPFtuc1SgioHjbygiVqTgDySYb2x30oT87e01+g
	9WgwHUD8FEP4uASIg2eHaQQRJv17o8P0MjayDOUuPfU19MZ2s09ilj0pNrWucYG6ELDA
	Pu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wx2KU7ljb/rsWV1Kk3vfA8TpgXZZeR9bLsuAPX5A90c=;
	b=gAmjm1w6NL/hnSuQZuWE9Z4rkascx2EiSIN/MfOyb9D/fO+wIRZtkX3lAq5TzBAm3b
	/tK5+N6jolm90rKRwbJK+9q9XdMAdzptiSBqwHlttIqPPP7GeIV+QXkt7p+CtLbAJQ9d
	faEnUqCry2fnHVjZDUkTxB0aSH3sorjGSLvGltiOX55yH+d/idqr56pfh5Czt2sQHT10
	u7uTX1UbKR7oa+cpMuGByj+1dmQ2knqeBHWtiifa+fBTipZQER67a4olY4wl2Tiz+Izu
	pAD05MLEEyNoLguOLnKtsBt21BBTWUGP6TQk6cD3Xldt6LIwq7dhlWQVceFrZl+p6eTU
	q9NA==
X-Gm-Message-State: AHYfb5j2V32KmFjnVDdjiCE/J26bROT4PeZgaTuPmuStXqBZZ2KWswPl
	iaPQYu0W5dC7FlNFVOdamUzGgBftBA==
X-Received: by 10.31.160.18 with SMTP id j18mr3160898vke.130.1502970417983;
	Thu, 17 Aug 2017 04:46:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Thu, 17 Aug 2017 04:46:57 -0700 (PDT)
In-Reply-To: <1502969638.13978.209.camel@linuxfoundation.org>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 17 Aug 2017 13:46:57 +0200
Message-ID: <CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Thu, 17 Aug 2017 11:46:57 -0000
Content-Type: multipart/alternative; boundary="001a11431952df37e20556f19104"

--001a11431952df37e20556f19104
Content-Type: text/plain; charset="UTF-8"

The qtbase was just an example, the link with the last report:
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/140829.html

shows that instead of 5 failures reported in previous one:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-August/114108.html

we have around 40 failures (numbers differs for different MACHINEs) and
that's probably far from complete list of failing recipes, because many
recipes weren't built at all, because one of their dependencies failed
already.

I meant "real-world" as builds for any products on the market (which are
likely using one of the failing recipes) - e.g. in LGE we have many more
failures over all internal components, so I'll just undo this openssl
switch (renaming openssl_1.1 as openssl11 and openssl11_1.0 back as
openssl_1.0 with PROVIDES openssl11). We won't be able to use openssl-1.1
for long time anyway, because there are some 3rd party component which are
difficult (or expensive) to get rebuilt against new openssl ABI, but we
might be interested in some other improvements in oe-core/master.

I'm not saying that oe-core should be blocked until the oldest and slowly
moving project is updated to be compatible with it, just keep in mind that
"real-world" products are far more complicated than keeping oe-core
autobuilder green and that some companies might see it as blocker for
upgrading to newer oe-core.

Regards,

On Thu, Aug 17, 2017 at 1:33 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2017-08-17 at 12:31 +0200, Martin Jansa wrote:
> > Does openssl10 work for anyone in real-world scenarios?
>
> Depends what "real-world" means really.
>
> I've strongly pushed for OE-Core to have at least some spectrum of
> coverage of various elements of the software stacks people use so we
> can use it as an indicator of changes readiness to be merged. This goes
> against those who want it stripped to the bare bones.
>
> There was a strong desire to keep qt5 out of OE-Core and I've gone
> along with that, this is one of the downsides, it doesn't get testing
> when changes like this get integrated. We did test openssl 1.1 as far
> as we reasonably could before it merged and it was posted on the list
> for quite a while and discussed.
>
> There is a problem here and I don't know how we solve it to be honest
> (other than the obvious upgrading of problematic recipes).
>
> I can imagine some fancy sstate code in the openssl recipes where they
> could prune their populate_sysroot data depending on the dependency
> chains being installed. Equally, that code would be hard to right and
> would only stop another subset of issues, not solve the problem. For
> example, if python3 references the openssl headers, there could be
> ABI/API issues if QT uses python3 openssl functions, depending on how
> the headers are structured.
>
> So I'm not sure how we move forward here, one plus point is that there
> are 1.1 patches for qt5 which is something at least.
>
> People could suggest more testing. The reason patches merge slowly in
> OE-Core is the infrastructure struggles with the current range of
> testing. I've actually "destroyed" one of the autobuilder clusters this
> week and we're running on degraded infrastructure right now until we
> fix the overloading problem I caused there :(.
>
> Cheers,
>
> Richard
>
>
>

--001a11431952df37e20556f19104
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The qtbase was just an example, the link with the last rep=
ort:<div><div><a href=3D"http://lists.openembedded.org/pipermail/openembedd=
ed-core/2017-August/140829.html">http://lists.openembedded.org/pipermail/op=
enembedded-core/2017-August/140829.html</a><br></div></div><div><br></div><=
div>shows that instead of 5 failures reported in previous one:</div><div><a=
 href=3D"http://lists.openembedded.org/pipermail/openembedded-devel/2017-Au=
gust/114108.html">http://lists.openembedded.org/pipermail/openembedded-deve=
l/2017-August/114108.html</a><br></div><div><br></div><div>we have around 4=
0 failures (numbers differs for different MACHINEs) and that&#39;s probably=
 far from complete list of failing recipes, because many recipes weren&#39;=
t built at all, because one of their dependencies failed already.</div><div=
><br></div><div>I meant &quot;real-world&quot; as builds for any products o=
n the market (which are likely using one of the failing recipes) - e.g. in =
LGE we have many more failures over all internal components, so I&#39;ll ju=
st undo this openssl switch (renaming openssl_1.1 as openssl11 and openssl1=
1_1.0 back as openssl_1.0 with PROVIDES openssl11). We won&#39;t be able to=
 use openssl-1.1 for long time anyway, because there are some 3rd party com=
ponent which are difficult (or expensive) to get rebuilt against new openss=
l ABI, but we might be interested in some other improvements in oe-core/mas=
ter.</div><div><br></div><div>I&#39;m not saying that oe-core should be blo=
cked until the oldest and slowly moving project is updated to be compatible=
 with it, just keep in mind that &quot;real-world&quot; products are far mo=
re complicated than keeping oe-core autobuilder green and that some compani=
es might see it as blocker for upgrading to newer oe-core.</div><div><br></=
div><div>Regards,</div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Thu, Aug 17, 2017 at 1:33 PM, Richard Purdie <span dir=3D"lt=
r">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bla=
nk">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><span class=3D"">On Thu, 2017-08-17 at 12:31 +0200, Mar=
tin Jansa wrote:<br>
&gt; Does openssl10 work for anyone in real-world scenarios?<br>
<br>
</span>Depends what &quot;real-world&quot; means really.<br>
<br>
I&#39;ve strongly pushed for OE-Core to have at least some spectrum of<br>
coverage of various elements of the software stacks people use so we<br>
can use it as an indicator of changes readiness to be merged. This goes<br>
against those who want it stripped to the bare bones.<br>
<br>
There was a strong desire to keep qt5 out of OE-Core and I&#39;ve gone<br>
along with that, this is one of the downsides, it doesn&#39;t get testing<b=
r>
when changes like this get integrated. We did test openssl 1.1 as far<br>
as we reasonably could before it merged and it was posted on the list<br>
for quite a while and discussed.<br>
<br>
There is a problem here and I don&#39;t know how we solve it to be honest<b=
r>
(other than the obvious upgrading of problematic recipes).<br>
<br>
I can imagine some fancy sstate code in the openssl recipes where they<br>
could prune their populate_sysroot data depending on the dependency<br>
chains being installed. Equally, that code would be hard to right and<br>
would only stop another subset of issues, not solve the problem. For<br>
example, if python3 references the openssl headers, there could be<br>
ABI/API issues if QT uses python3 openssl functions, depending on how<br>
the headers are structured.<br>
<br>
So I&#39;m not sure how we move forward here, one plus point is that there<=
br>
are 1.1 patches for qt5 which is something at least.<br>
<br>
People could suggest more testing. The reason patches merge slowly in<br>
OE-Core is the infrastructure struggles with the current range of<br>
testing. I&#39;ve actually &quot;destroyed&quot; one of the autobuilder clu=
sters this<br>
week and we&#39;re running on degraded infrastructure right now until we<br=
>
fix the overloading problem I caused there :(.=C2=A0<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br></div>

--001a11431952df37e20556f19104--
