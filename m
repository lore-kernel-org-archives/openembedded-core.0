Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16285.1793379004120259713
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 09:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=aFb4BTVO;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=SL26Yog0;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 15993140005E
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 12:50:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 30 Oct 2026 12:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793379003;
	 x=1793465403; bh=GxUu7GGnGnsgp077emWF1/bVi3mvC1dKZt3USmlw4XA=; b=
	aFb4BTVOO/05HLMkFQpU72Xu20QHvKdMTVVarZHdpd9IsdquCArAaJmtcWgOfKO7
	2Uxrl8ajCoMNy7y7Z3npMnUDmydxWKJWk126ejzQLn0NIDLc2DONjMtCUz/hk3gd
	hzQ0onEr7pDBoC0mLwX0uBd/Lj0NgvGStUrgBlNEW1qElVi79q2JzsqIULar1x6N
	JINb2tJ4wfv/VEcJYqU3jrZbancY0rQhwQlMna7W0UiE3/9peqRemm2Ex7gxfKcO
	1luXRYWeD2KlKluLHD7xXRo2U70EMRsneaEnsXv2HveQprFeidrf1vJajrMm/KDL
	Qp+9N/+IKh8pKu5DDSI3mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793379003; x=1793465403; bh=G
	xUu7GGnGnsgp077emWF1/bVi3mvC1dKZt3USmlw4XA=; b=SL26Yog0uqEXqlJvZ
	bOYE/m4Qk9sI0ON3a6Iv05vBdT6CJ2XYwKW7sF0Plp7v3vODUU8esbxbZbcSOp4W
	WOL2jFquWQ16TiIrLA9QBn46S2KHDJoo/q/AoNBS/AO/MP6nZ0bzX/BK/hdD+VLp
	XTwTnz5uiGs5epNDKOFefEobxcpVMbC9UgQXL/SG2EkDrVZv7dtoU1xv8ahHbONY
	TEaYRNXPDAfAQ/Zuk/Dcw6efe2UOrwwnsKVh/IBqmtCkmArXfiMM0CnXtGkUr2kN
	CoicdUca5bjRa0UiFohtD3XWVO83jK7CXLKri2EAtSZvV46+gPA4X5AMkjlcQxWj
	WhGKg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793379003; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:nQx+NsPnF1wSf0XOy2049M2e07ryYqfmJVXsodufLSoeDMS
	CIBoOxUMdYZA2ZDKulBNwXJTg7mH2H2DzYiRLlpeCtUyEbDliQn1N2wSI3NAvPpV
	m0H5Uq4ADNSCBNzIY4X99lAQS9DnHezuiEK4MRtpg4TsFWqD9LTP+DUNPjpex5Uz
	oDC3Hfl6lOw0kzZ2D9poyoFYSftm2t6aiXBAKi5IGTKGhUzzaTMWUXENjbgDuiik
	tt0O2gsIjktph6RfuvjzMzK4cDh+uv51rD3HVaIumAmhrgPfEDPwl6JEb8j3XZe0
	6HWf1YExYFjDptpgB9A+urvSLt/yMRjqm8nyvDw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:8TMarVQSb0mRT5v7V4hr/jKErLNTTapKuE21zZUVKj8=:GxUu7GGnGnsgp077emWF1/bVi3mvC1dKZt3USmlw4XA=;
X-ME-Sender: <xms:usrkaqx3uXub6_0MG0RmNXNskXs4dQKo-b9uKq5RgttCvwWY0YBcbg>
    <xme:usrkasQboKIEMERiBeF_6e8hx4N4ErQYho6zLJUGuu2suiRafjFKk5XU8YrxmlkZa
    yMxKO3U869pq0-v4J0KSRmHTfGP1hutoj_MuQvQMkpEF8s2KCEI1bB0>
X-ME-Received: <xmr:usrkap_gFtyezOx5QUnLbbGDs49MxjVTU3hVAyxpRJQ916Ty94DRGbV98EmpeZsxJqvlOC5ppkbWbUJ3_9lcUYO0Tbj6ffPndUBaLrk>
X-ME-Proxy-Cause: dmFkZTFECXpgCrYOGoXYIDWOk3ItYvCs6bcEjhz8qS+VY38vcN/eTsjDfcRvb2ua74CVKO
    g2uHEfHJt/1WsaC2ns43sY/uKzHsWwvD1Q0qpD2tUo7CkYd36ZxKIS6AHM175inX+477lR
    /g+Pwtsma/up0wLk3YPgKkCWLmN00rFJGuif5FaieO/aghbKEjrCzDhDmrX+JJoVabSyKt
    OVE1ksKLy2ZYepTBaLCZmAKvy40P4lBGid9rdDYkAtEAKyd5Y14wauZ3KLCkkZqtCDXUqj
    CacZGItJgsY9tDKAqrzJZk6SKeOGXoCYd+kJuuNw5s+4hZ0ITIxBxQDsGlJNLRNwoPkQiI
    1ncfpXTtzfVX+H3mnNQXk/G9v05XbC7qDOKqlLc0+bIYYOpr4VyzNgb6E15gu2fobMw5KH
    oniu4xNLCJqSUuPuKXo7duMcxb3iJ9Vaq2trHZE9IkLKerVtrBn2hXIEgmcI0tLaTsnh7R
    uZT6bw5KjF2NramdvdyCoWyKDbTFQiaTr1JS9CtlDM8mXqzmSBe0ztRN8bKUumOyFGubMV
    vokVyoqz6gLwtLl90llg7HzkgJ7cuyBzf3w3xzJnonXGFz00O5lI+BgC273pbnNLIZ52Qh
    r0qQS9K2jQqaOaAYSalVuC7WpmuR4CAyGpyvJaS2zS+XJr0XxBBTB1uHHJ7Q
X-ME-Proxy: <xmx:usrkarrG-l8BCQ1s_J-lDLf1DvptCyfJRHYgAlpIYGt0IpNQDD337Q>
    <xmx:usrkauk2kJU157a9B5H24PK6Wp4hoJNqEyc-cNmxephRynCqhrCYsQ>
    <xmx:usrkaqKiIIoFSGda4TPKB4pdKjcPKgch0dVUG9tNozeIacgwoU3txQ>
    <xmx:usrkarx972Zx5VnujXUDV-jizyh-SkUF8F5m7y9NG-BlPeKn4KJYCA>
    <xmx:u8rkaqBePFvrNlSFy3Q4vGwQPGZPT_KYmO8SMeHBStIbkF0MHdS_UF7C>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 12:50:01 -0400 (EDT)
Message-ID: <3c6ddfc306b5369be0748e492955e3a1a4bb9a74.camel@pbarker.dev>
Subject: Re: [PATCH v2] yocto-check-layer: don't skip entries when dropping
 invalid layers
From: Paul Barker <paul@pbarker.dev>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2026 16:49:59 +0000
In-Reply-To: <20261030121428.1658630-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029112443.1734921-1-vinicius.eduardo.pedrosa@gmail.com>
	 <20261030121428.1658630-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 16:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249054

On Fri, 2026-10-30 at 09:14 -0300, Vinicius Pedrosa wrote:
> The "Detected layers" loop removes invalid entries from the list it's
> iterating over. When two invalid layers are next to each other,
> removing the first one skips the second.
>=20
> A skipped entry without conf/layer.conf makes the dependency pass fail
> with KeyError: 'collections'. A skipped BSP+DISTRO entry isn't
> reported at all. If no other layer is left to test, the script exits 0.
>=20
> Move the check into validate_layers(), which returns a new list with
> only the valid layers. Call it right after detect_layers(), so
> dep_layers is built from the filtered list too.

Hi,

This is now changing a different behaviour as well as fixing the bug you
tried to address in v1. These should be separate patches - one to fix
the accidental removal of valid layers and one to move the validation
before setting dep_layers (if this is justified... the commit message
for the second change needs to explain why this is needed).

I have to ask, is this AI generated? If so, make sure you're following
our docs [1].

[1]: https://docs.yoctoproject.org/contributor-guide/submit-changes.html#ac=
ceptance-of-ai-generated-code

Best regards,

--=20
Paul Barker

