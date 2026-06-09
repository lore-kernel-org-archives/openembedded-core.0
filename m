Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E61CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:28:38 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75531.1780997304456749493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cc6LIwTK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6919f40a0c8so4668063a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780997303; x=1781602103; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JY9QDdCtDX61uCsMS6m9cjW13IqvtJvYc7E1pwOr6q8=;
        b=Cc6LIwTKkwYYoWXryyhZ5ixi9sTClnvartszK0J5DbsxXbNisOLlCuZEcTzEd2xIEE
         404UqbeN+rS+OVEHgbw33WgTfYtUW/GcR5ha/DJ90bk8pMQHlPvSBWiV+YGEqKVN7Ahi
         OJtToASgmPxgv+5/kHEV5WhZ0ctkbMmBDcRng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997303; x=1781602103;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JY9QDdCtDX61uCsMS6m9cjW13IqvtJvYc7E1pwOr6q8=;
        b=ba9GUjJyU9zkkRK8XhC5blqKYpXVAAHjHqLB0S7ryDfeMNBfVRArKGPMMgeGBEOzF9
         wzlOtRdxVtqkycdLWCAE2y4PhACswdetbDSco1WHvVcrH3BznXTUMyyk08E0VPlTBqCW
         5dQOm1ngfy8lamYeoHACvpe8NqANeb8AUs42+i2JEiuU1riWxTaPfCapLh3Ro24JAk8R
         jlWIFWJpVjiO/8jL6wh3LLCWdVt2q0dfAsUaiE4OuDjMh7dENLEtAnVfQa5E7UO9KJBk
         sffsCbQ3gGHqtFBdAIY6ZgtctCdUwU85n3sWvTZ06CvwGxDhFqW1vqBln2fFLaC7oXms
         c0/g==
X-Forwarded-Encrypted: i=1; AFNElJ/sOlHTXltSdHEbbtAb/1HtOw5TtVLL4VVuA7BAV+CVFQgA7fD/ehcc+rvsMyZPS56dcgn2El2jmsz1Qey5bWR9Nw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/9CIXeFdb41bK8bmnyXjOkeHUVgm90Cwc3M0Gbqkfq0jPy4fp
	lpOXMDppB5e+s+XD6FJoBP8+lcPTnEh6AhrA10KxpMojAqvvIV8okkP2CA+DTwPCEDA=
X-Gm-Gg: Acq92OEC3ibx4gs1XcBDSThsC/PA+ifmnXmuLbQMcsqg1NvzePNfoDexV9jbMMK5914
	GqblUM2MjCHfDz5SakCe1kN6WP9AlzDwqU9r1jJdfiIiKI3O8ZM+/uW1e9Gqt9ySmsbk95pmG/n
	a5w3PfqRN53uvzAMGDH23+TKdCtnNIeDvPtHhS9bMd0bnsxbWe5gx8nhyXuC4cFoDASLpurrS1S
	QJSsCbPEmb/ptHpKY0Upn0Ud8IWSltVG972ai2YsfDvI3BwfJl9rJQxyQU+P5XMj0BA8kbby+Nx
	80yK2PbcHWMi+O/pISZDCvtK5qaXwnGkRTeayRm8CQgnxGo4ClXZhBMJRjhw/hNa29zookuwYoq
	a5vrrC8+UtodNgh339TAfD7U+dKl00KBVsHhEIBizBLWgqhgSjD8QU1dPkG/xWVsyARbY5xLiCm
	dPN/N+ObZmfPNpi79zCQcjxsB9eonaVeBw0zDG9W5Ax1hXHTqRQ3XdBFHAicHn0PrzZdEDtB67j
	grwOPIhjux9W42aMG0vwNiQONk=
X-Received: by 2002:a17:907:940d:b0:be2:d66:eb4d with SMTP id a640c23a62f3a-bf373a032c2mr921210266b.44.1780997302708;
        Tue, 09 Jun 2026 02:28:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1? ([2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051a5sm1014530666b.35.2026.06.09.02.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:28:22 -0700 (PDT)
Message-ID: <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM
 URIs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: saisneha196@gmail.com
Cc: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org, corentin.guillevic@smile.fr, 
	martin@geanix.com, paul@pbarker.dev, mathieu.dubois-briand@bootlin.com
Date: Tue, 09 Jun 2026 10:28:21 +0100
In-Reply-To: <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
	 <20260602062940.3107241-4-saisneha196@gmail.com>
	 <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
	 <18B61AC5A22983D6.29982@lists.openembedded.org>
	 <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-bi21Q2Iw/v9/jMWtFk5Q"
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 09:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238283

--=-bi21Q2Iw/v9/jMWtFk5Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-09 at 14:49 +0530, Sai Sneha via lists.openembedded.org
wrote:
> Following up on the=C2=A0suggestions to fix this in the BitBake=20
> fetchers using supports_srcrev(), I have tried implementing that=20
> approach locally. Here is what I did and how it works.
>=20
> The fix has two parts:
>=20
> Part 1 =E2=80=94 BitBake fix (prevent parse crash):
> The crash happens in setup_revisions() when srcrev_internal_helper()=20
> raises a FetchError for missing SRCREV. This propagates up through=20
> expandWithRefs() as an ExpansionError which halts parsing for all=20
> recipes. The fix catches FetchError in setup_revisions() and sets=20
> a missing_srcrev flag on the FetchData object:
>=20
> def setup_revisions(self, d):
> try:
> self.revision =3D srcrev_internal_helper(self, d, self.name)
> except FetchError:
> self.revision =3D None
> self.missing_srcrev =3D True
>=20
> git.py and hg.py also needed a guard to prevent calling=20
> latest_revision() when missing_srcrev is set, since that would=20
> trigger a live network fetch under BB_NO_NETWORK=3D1.

That is going to break some of our other protections for invalid SRCREV
setups and swallow other errors.

How about instead we set a flag in OE-Core on a per layer basis:

BB_FETCH_REQUIRE_DETERMINISM:layer-core =3D "1"

and this simply changes the fetcher behaviour to error if it would
touch the network?

Cheers,

Richard

--=-bi21Q2Iw/v9/jMWtFk5Q
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Tue, 2026-06-09 at 14:49 +0530, Sai Sneha via =
lists.openembedded.org wrote:</div><blockquote type=3D"cite" style=3D"margi=
n:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><div sty=
le=3D"font-size:inherit" dir=3D"auto">Following up on the&nbsp;suggestions =
to fix this in the BitBake <br style=3D"font-size:inherit">fetchers using s=
upports_srcrev(), I have tried implementing that <br style=3D"font-size:inh=
erit">approach locally. Here is what I did and how it works.<br style=3D"fo=
nt-size:inherit"><br style=3D"font-size:inherit">The fix has two parts:<br =
style=3D"font-size:inherit"><br style=3D"font-size:inherit">Part 1 =E2=80=
=94 BitBake fix (prevent parse crash):<br style=3D"font-size:inherit">The c=
rash happens in setup_revisions() when srcrev_internal_helper() <br style=
=3D"font-size:inherit">raises a FetchError for missing SRCREV. This propaga=
tes up through <br style=3D"font-size:inherit">expandWithRefs() as an Expan=
sionError which halts parsing for all <br style=3D"font-size:inherit">recip=
es. The fix catches FetchError in setup_revisions() and sets <br style=3D"f=
ont-size:inherit">a missing_srcrev flag on the FetchData object:<br style=
=3D"font-size:inherit"><br style=3D"font-size:inherit">  def setup_revision=
s(self, d):<br style=3D"font-size:inherit">      try:<br style=3D"font-size=
:inherit">          self.revision =3D srcrev_internal_helper(self, d, <a hr=
ef=3D"http://self.name">self.name</a>)<br style=3D"font-size:inherit">     =
 except FetchError:<br style=3D"font-size:inherit">          self.revision =
=3D None<br style=3D"font-size:inherit">          self.missing_srcrev =3D T=
rue<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">git.py a=
nd hg.py also needed a guard to prevent calling <br style=3D"font-size:inhe=
rit">latest_revision() when missing_srcrev is set, since that would <br sty=
le=3D"font-size:inherit">trigger a live network fetch under BB_NO_NETWORK=
=3D1.</div></div></blockquote><div><br></div><div>That is going to break so=
me of our other protections for invalid SRCREV setups and swallow other err=
ors.</div><div><br></div><div>How about instead we set a flag in OE-Core on=
 a per layer basis:</div><div><br></div><div>BB_FETCH_REQUIRE_DETERMINISM:l=
ayer-core =3D "1"</div><div><br></div><div>and this simply changes the fetc=
her behaviour to error if it would touch the network?</div><div><br></div><=
div>Cheers,</div><div><br></div><div>Richard</div><div><span></span></div><=
/body></html>

--=-bi21Q2Iw/v9/jMWtFk5Q--

