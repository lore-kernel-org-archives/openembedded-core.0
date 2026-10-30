Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9714.1793361466502686138
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=DV8kp32c;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ERbHg919;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6B4161400186
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:57:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 30 Oct 2026 07:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793361465;
	 x=1793447865; bh=Fc79aIi2Ilwvia+Ag1GTQJe5ytnb9hdiHE96zBiut14=; b=
	DV8kp32cj7O/od9YRgiMgZ5F0PkSoPB0v8vJ/EwOkbvw6e129+icwGoV9Wjjf5U5
	Wm2bu1KAGopMWoqeb52IBp+U2ON70SsvlUGJQo2UyCBSPwkZfAQd+OhcRpTjWHAO
	iFfmce0CEbnZyaqHVmzSQYxxEzbLghZRpDOFVXmtBRO4X58dTnjkyTpbJxIeJkpY
	BZDkCV2JcL7C1WLcfJjKHB/dZWhi9vRSUSpvEvX7yZmHIUXJZPtYT3gIqY2KsKpU
	FipmRUMMQRATMkP20bQpTq/+QnYFXUmxXNLgN6IYMXABIDkw10YkQE1vWFYBnjEn
	lwpiRtQ5oW7nKlSYNfaKKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793361465; x=1793447865; bh=F
	c79aIi2Ilwvia+Ag1GTQJe5ytnb9hdiHE96zBiut14=; b=ERbHg919lBMBAlI3c
	1AS656dekylrL3O7NA2pF3LYzuD2PrklgnvjXywHfVJiQAEYI/Piq9VEU4fExI0c
	R7EUULbOErGFZht5iaaDBDG6GlVsaAW3I3RTeV/BHHd5c7h0ttIHrkv3FDg0C+y3
	CieVhWP8Riqx5SbP4VliBFdWvjqNAlDRP6LCNXX04MC6OgAIxi4SspCtELsZwOqD
	pIoF92k2o8lGDvzxcYbfKNnOwunrZq9gpT0O6usq+wqV7K74nSiZHZjeFG0H1KYe
	A9ZumvLuunwAb5zOljJAJlJKIARQb72eEvF146wITkLMd2gZdrF8so1PqjB5n/QI
	fIgDA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793361465; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:m2kTfrQPvbsKhJEpmOnhBvV8esVTu7I7LZ85DeyZ1UhBhhY
	xugbsYcQIke3HM8Fgi5iLHCjBuRK089jbJHgw/CYGtJZse0JxgRHs3ojpDgqhvz5
	KiTWjNJmER3Sl1KzWiGhnOI3LGEg/RvNQCNtWKndWG/lhrxqsak1BaqlTx1cvJiz
	jSFKT4kS9Qy9kuQCU/XsM2BMG2Rg4HPG+QqB/z3YhS5hOIueNBnkPwaycfXkZagy
	jtSo8NXppri8YZM3R9ryloS9JZITOMzYqHwnnMyEgJO0DvqVUbHiTcMi/u6dGW3K
	nlSyLqO0pGwH9CCaXf5///3yjdqM7Z8fj/z5OvA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:AQwgn2F7B4EDF6FB7YiwrgktEyo1Lsz/6S9n3GLXvik=:fR/Lf+BxySlf6wlz0KRiuYiVK8Asq9BhtxTkMC8AvuE=;
X-ME-Sender: <xms:OYbkaiu9RiuQVeLQ7xPn8l1wdGHE1oj91pVikYVyJtAWX_s4Rv5mQA>
    <xme:OYbkatfMSoFcnlmK9YkYA4up1LB8vb_MXW805K9GHrhsXdS_s0Yb58DbB_jdUE0St
    U3IOFWVlyUheaPJy--KxwYbaSld9kSFbhXckKgtmiIwO-VFg3LuXA>
X-ME-Received: <xmr:OYbkarZXX71Ul666w9z0yo3BNniHcSQGlt-e-wHcdUf3_oE-2mkUkZWZ8oSaBsr8MLdOemKEToq-nlUdao20M8IXMU_svD7MypPGCHw>
X-ME-Proxy-Cause: dmFkZTEVwY0xqUFC+N+XcgV4mJ7A0jl4gmkHsTFTQ5LyKzB6Fat0UEtfx9V3PGYVme/+LD
    +wcjjB66BhKJrthq10MjtpjLqhgqkvcg5AMEDqUytv6Quduai1SmcRFuaOSXUaHtrSBnYF
    mLjVNaer9N8ENf65hubu8pQi4otbG1jCTPStzYLUCkZmidC0zgKyZ0tg40BQFnvEEGFhfS
    N5sFxzEeyew9AEgZhkMp5+4BCiXpCjeqs7ZOo1WdHNPLqbqkCb2Pt0+68j0i+6iQOmGxIl
    sYlBhdsUt1Tkw+Ig82CI+WqZ8fYwI1gfnq5ht5059yYyjAyWcc+flbhfGcxNF6cnAgLPg0
    gBPfUEoYrLzWZ261bPFQAihIVCtEOnZ+yqjPK7w51Q1/CJ2qLXdH0ZsWGqZkSI1XGsex+p
    umgZXTLHsuI8uj0xZQxrzZ85aKSIamj6G9ZMReGoGqqAGdXgIEE2Q2zMNb3g3N6pARZxza
    qII9YxE7NiRB4N4OVi4vlyhBEguPdfcqr9FgE3t3HRPOVLu7JaNFEovAnIFHx5OYTrdA45
    V6cU5i60qXZfGBE4G0JPVdqD1CBUtCdb+SENuGzp1y/BiJaq4iyKGsMLOF70X9W0mkoOTN
    3a0C3/tW1D+pylB2lyavoZHaUMCGpcp4oB/RZCgiZXY6AR9uCt/P3X93rnAA
X-ME-Proxy: <xmx:OYbkaoUlCCIBXHi9NhB8gOaJyIGTTndrf8KBpeukamT4zLXOwN0ykw>
    <xmx:OYbkalj1j6XDyJhbHwMsaspNQZty8f-PGduvM-M1-66UstZvRMsO-w>
    <xmx:OYbkauVxcO-M8hY79GgX5g_FcT5gvaJFf3xl1eyxiG4fNjJaWtPa7A>
    <xmx:OYbkakPv5GlJ95Awfzu4ZhnBty2k3JReKZF2BOX2HV02-0Y8kfKkww>
    <xmx:OYbkapQWbOBbBPpQ7ReibbH66ncp8V6D7b7Lo2eCFAt0_vwipmnHvM2y>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 07:57:44 -0400 (EDT)
Message-ID: <7ed3a9b73c814ee1eed9efb56f1c03600e680f87.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH scarthgap] b4-config: Add configuration for
 scarthgap
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2026 11:57:43 +0000
In-Reply-To: <DMHOVC3580CN.26K60XV4TXQHN@smile.fr>
References: <20261023-b4-scarthgap-v1-1-6a85c3fec09e@pbarker.dev>
	 <DMHOVC3580CN.26K60XV4TXQHN@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 11:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249032

On Thu, 2026-10-29 at 23:51 +0100, Yoann Congal wrote:
> On Fri Oct 23, 2026 at 12:41 PM CEST, Paul Barker via lists.openembedded.=
org wrote:
> > This should simplify sending patches for scarthgap using `b4`.
> >=20
> > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > ---
> >  .b4-config | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/.b4-config b/.b4-config
> > new file mode 100644
> > index 000000000000..5876a9f2691d
> > --- /dev/null
> > +++ b/.b4-config
> > @@ -0,0 +1,4 @@
> > +[b4]
> > +  send-series-to =3D openembedded-core@lists.openembedded.org
> > +  prep-pre-flight-checks =3D disable-needs-auto-to-cc, disable-needs-c=
hecking
> > +  send-prefixes =3D scarthgap
> >=20
> > ---
> > base-commit: c9b000059a37241c5b97426f0aadc012b13bd20f
> > change-id: 20261023-b4-scarthgap-31cd33af24d9
> >=20
> > Best regards,
> > -- =20
> > Paul Barker
>=20
> Hello,
>=20
> Are you sure there are no bad interactions with combo-layer and
> poky.git?
> When we started adding those .b4-config I avoided doing it for scarthgap
> because of that.

Yeah, I like to use b4 everywhere now but this is a challenge. We
probably don't want a b4 config in the poky repo as it's likely to
result in patches going to the wrong list.

We could add this to file_exclude in combo-layer-scarthgap.conf in the
poky-config repo. There's only me and Richard going to be pushing to the
poky repo so we should be able to make sure we both have the config
change.

Best regards,

--=20
Paul Barker

