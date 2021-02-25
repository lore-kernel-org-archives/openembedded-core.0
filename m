Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.12801.1614267095111524643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 07:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W3vA7X7O;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id r3so5642705wro.9
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 07:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=F/aIkCs7EC4VKYT4ApQwUMMFKYYR1Rz6KmzHdggKg8Q=;
        b=W3vA7X7OtScGUbQRmufMoOoTUmZe3FecGKVam+QwEL7mQvzffdn4/mT9w6bBeOTbtX
         W8Vdf+xDmdTm/emcpz7ODF2J1LdYHiQUdELVZs4j+D4xu5rHck1H/Oziah+P+CZRWqDj
         N5vjqas1Tftvo5WphLVq023O/cvXEhMh0z3u3URgat5TfT5MkGY5j7mUVvgwyHMeTIpZ
         voUl2arGZ8G0UvCEAlR2Wc/RUrk8ZSdF5RxcansUkWms3EmHP6+9ogaSC54j8p9t/0ut
         zkI/IIuSPmmgs0Op1/NNtKqPKggg/aS0ODNMDoFyl0xxULcZ0kNVoqf0hgEETaDH1ncv
         /wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=F/aIkCs7EC4VKYT4ApQwUMMFKYYR1Rz6KmzHdggKg8Q=;
        b=VHakU1U/yxkizSW5ka0+u8bfWYPxj/G0MfCsVF4LSzM15SuF1U7iuELxocXEaTRKi2
         sp0Zo7TytK1DtcWJzDV5yr+fSLIc1KNGqyScQkz7qqmjU1eJZx++UXZSI7vZDdmU+Oiu
         EUaavREC2wqp89hkKPuyDXXXW1KHcWjWJMVBoOLCUaZnp7ynq5+aY7njAtG5YCqvP6TZ
         6KbwxwhTrw69PuG8PxxyU3FmRYOsroA6f4TqV0XA79Xa46mHDiQQdDAGlQ3TA9u8Jkf6
         4lbDCTXomywJkLKm6MycVaZjeYJ71yd6WWRg1Aj2uJtjBYLdorkp4AGtQEfqyUDjllZJ
         Nu9Q==
X-Gm-Message-State: AOAM530kz2nkiYeovrN52ao+UkBrOJ5iQiD15AeXtRCeoo+qUko8hfJD
	I+9/Y0ZXK8ppFlzJKGHi4UU=
X-Google-Smtp-Source: ABdhPJw1QqueV1QCRLMBqvQJqcyfo1omybkUB8OtNoGO5QFUP/K9551stbEAK7uiOea40YbCMwHUPQ==
X-Received: by 2002:a5d:4e10:: with SMTP id p16mr4090051wrt.360.1614267088703;
        Thu, 25 Feb 2021 07:31:28 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id z11sm11141127wrm.72.2021.02.25.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 07:31:27 -0800 (PST)
Message-ID: <6b1402c84ffb478875e04f6577c45d5ac3dae292.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v4] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Paul Eggleton <bluelightning@bluelightning.org>, 
	openembedded-core@lists.openembedded.org, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Date: Thu, 25 Feb 2021 15:31:26 +0000
In-Reply-To: <1814214.taCxCBeP46@linc>
References: <20201123132823.3996355-1-luca.boccassi@gmail.com>
	 <2056926.Mh6RI2rZIc@linc>
	 <45331765fb689a78bb52363d4fc8f5970693c763.camel@linuxfoundation.org>
	 <1814214.taCxCBeP46@linc>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 148601
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ftIFp2tXeNTRPnYWsF3K"

--=-ftIFp2tXeNTRPnYWsF3K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-20 at 12:28 +1300, Paul Eggleton wrote:
> On Wednesday, 20 January 2021 12:23:34 NZDT Richard Purdie wrote:
> > On Wed, 2021-01-20 at 12:13 +1300, Paul Eggleton wrote:
> > > On Wednesday, 20 January 2021 09:52:41 NZDT Richard Purdie wrote:
> > > > I think the one remaining issue here is the need to change the DEPE=
NDS
> > > > of so many other recipes, likely not just here in this patch but in
> > > > other layers. I think if util-linux DEPENDS on util-linux-uuid that
> > > > might remove the need for those changes? That should still allow yo=
u to
> > > > break the circular dependency problem?
> > >=20
> > > I have to admit to a gap in my own knowledge of how our build system
> > > handles transitive dependencies. Of course the recipe sysroot should
> > > still get everything it needs in it even if the dependency is only
> > > indirectly included, in the back of my mind I have the impression tha=
t
> > > there are expectations that all dependencies are explicitly called ou=
t
> > > and there are subtle issues if they aren't, but that could be a mista=
ken
> > > impression on my part.
> >=20
> > I do wonder a little about that as well. As you say, sysroot
> > dependencies should handle this. Anything linking against libuuid
> > should also establish an package level runtime dependency through the
> > linkage so I think this should work.
> >=20
> > We definitely don't explicitly list every dependency in every recipe.
> >=20
> > If this can work, it makes the migration path for people easier so I
> > think its at least worth investigating/testing.
>=20
> OK, sure thing.
>=20
> > Just while I'm thinking, the PACKAGES_remove also bothers me a little.
> > Can we rearrange the variables so libuuid is only added in the libuuid
> > recipe variant?
> >=20
> > [the idea being that since we control the metadata in oe-core, we
> > shouldn't need to use _remove and can restructure so we don't need to,
> > they're hard to undo. I know we do use it in places sadly even in core]
>=20
> Yes, that is a good point. We should be able to avoid using _remove and I=
=20
> don't like using it either given how heavy a hammer it is.
>=20
> > > I agree that it would be better being separate, FWIW.
> > >=20
> > > > I am also worried this is going to break AUH and mean we have to
> > > > manually handle this recipe but again, I suspect there is little to=
 be
> > > > done and we just have to deal with it.
> > >=20
> > > Could we perhaps fix the AUH to handle this properly? Do we need some=
 kind
> > > of mechanism to get it to always upgrade the two recipes together or =
is
> > > that only part of the issue?
> >=20
> > I don't know for sure that AUH won't handle it, I just worry about it.
> > If it doesn't it definitely could be something we could fix there. I
> > just don't know of anyone with the time to spend on what is a marginal
> > corner case if it doesn't work.
>=20
> Well, on the other hand if we're "causing" a problem with the AUH with th=
is=20
> change it does behoove us to try to resolve that. It is something I'd be=
=20
> prepared to look into at least.
>=20
> Cheers
> Paul

Thank you both for the reviews and suggestions, sorry it took a while
to get back to this. Just sent v5.

--=20
Kind regards,
Luca Boccassi

--=-ftIFp2tXeNTRPnYWsF3K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmA3ws4ACgkQSylmgFB4
UWJRZAf+IECBiej8majexecNf7Iq5mlr8p7BpAAreipN4ECSemcj0p3QeoEuOgW/
nDoFvSZyWnFS0IgN+eb+N7RicZl74MdGPKaED/45lJ40AbVL1joXthwfz8SfUHnR
jGfQxPdDIWz8LGxxE4NVmQ0nQeBl5XCfyrMNyGGsXdV8fJ2wj/uC4bpdz2arbyyd
Wpa1yJX5DN1HxIIR71ZwlB1yix1VxDA/LPBRCF0QargF/5lOPWDigN+FKcTUcjTv
zS6ch2XatNrvcHgUkKhgTmb5C2l91/YegikK7RnpE1gjl/uvIx6ygUvxL9+kowRC
LUSYDL+TA1qo3XOfd6sUa4Ek+vYj4A==
=mKKx
-----END PGP SIGNATURE-----

--=-ftIFp2tXeNTRPnYWsF3K--
