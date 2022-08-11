Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1AAC19F2D
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 07:57:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.3982.1660204667188577961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 00:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=gm1 header.b=ZB1v4cN3;
 spf=pass (domain: pbarker.dev, ip: 217.70.183.193,
 mailfrom: paul@pbarker.dev)
Received: (Authenticated sender: paul@pbarker.dev)
	by mail.gandi.net (Postfix) with ESMTPSA id C055C24000A;
	Thu, 11 Aug 2022 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; s=gm1;
	t=1660204665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUmSQTUU/563GiwBFoT1qGJwKT9NFZmBujPPCF0kx4Y=;
	b=ZB1v4cN3hUNakxJqFqqznKaoWu0JIXK8xI/O2UIPQwi9q7T5a7uj7wVlK5Io4yXadFR9FC
	UHtsHAeUpkPuF1ozFRSkVgZFFqA5dwW5/dNTTUhiqeD0+KD+4dNrV8AE2yxe8D1N1qOla7
	2ezn6WMRdy7DZQFR8s0U9anVQW4+RLfPYzFYkvgaN1MLhrgkDndGaSQN+d7ZTJpmXJXbBd
	gvP8wQf0GpBCNSxagxUqZ31wL5ID9g2g9KvzPVQsk9xYDgFSvKCjbhgDImugbAavqE4976
	b0H7sOzIaJAu3WncVBEx1NbumJloHlaV7jDASgaAfazw4EAA207hEBsroCqqhw==
Message-ID: <f0b888c9-c467-fae2-5c96-5e01e302a0c6@pbarker.dev>
Date: Thu, 11 Aug 2022 08:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/5] lib: Add copyright statements to files without one
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
 <20220810194510.484900-5-richard.purdie@linuxfoundation.org>
From: Paul Barker <paul@pbarker.dev>
In-Reply-To: <20220810194510.484900-5-richard.purdie@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tRotnd1HznzvH0DA6Yg4xtqh"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 07:57:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169233

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tRotnd1HznzvH0DA6Yg4xtqh
Content-Type: multipart/mixed; boundary="------------9sDkFErlEInPyBUvGPbI67xd";
 protected-headers="v1"
From: Paul Barker <paul@pbarker.dev>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Message-ID: <f0b888c9-c467-fae2-5c96-5e01e302a0c6@pbarker.dev>
Subject: Re: [PATCH 5/5] lib: Add copyright statements to files without one
References: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
 <20220810194510.484900-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220810194510.484900-5-richard.purdie@linuxfoundation.org>

--------------9sDkFErlEInPyBUvGPbI67xd
Content-Type: multipart/mixed; boundary="------------oZcHaeoNrrnxojcFG4wOr0hh"

--------------oZcHaeoNrrnxojcFG4wOr0hh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMDgvMjAyMiAyMDo0NSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+IGRpZmYgLS1n
aXQgYS9tZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzZXMvcnRjLnB5IGIvbWV0YS9saWIvb2Vx
YS9ydW50aW1lL2Nhc2VzL3J0Yy5weQ0KPiBpbmRleCBjNGU2NjgxMzI0OS4uMjIzY2Y3Yjk1
ZDkgMTAwNjQ0DQo+IC0tLSBhL21ldGEvbGliL29lcWEvcnVudGltZS9jYXNlcy9ydGMucHkN
Cj4gKysrIGIvbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL3J0Yy5weQ0KPiBAQCAtMSwz
ICsxLDggQEANCj4gK1wjDQoNCkxvb2tzIGxpa2UgYW4gZXh0cmEgJ1wnIGhhcyBzbGlwcGVk
IGluIGhlcmUuDQoNClRoYW5rcywNCg0KLS0gDQpQYXVsIEJhcmtlcg0K
--------------oZcHaeoNrrnxojcFG4wOr0hh
Content-Type: application/pgp-keys; name="OpenPGP_0x74975C81B7E66BAC.asc"
Content-Disposition: attachment; filename="OpenPGP_0x74975C81B7E66BAC.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
qIg4EUY=3D
=3D1/p8
-----END PGP PUBLIC KEY BLOCK-----

--------------oZcHaeoNrrnxojcFG4wOr0hh--

--------------9sDkFErlEInPyBUvGPbI67xd--

--------------tRotnd1HznzvH0DA6Yg4xtqh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCYvS2dwUDAAAAAAAKCRCrY1Tsnbr0bpjY
AQC7r3QVOl/f+P5qPsbhp3ymiYiDuMhjXb6ELi63IYIcDgD+OCGA2+Aw5G4xv3agYfH7kF3KtC4Q
Qo2dK2Zp2zU6/wU=
=qzcR
-----END PGP SIGNATURE-----

--------------tRotnd1HznzvH0DA6Yg4xtqh--

