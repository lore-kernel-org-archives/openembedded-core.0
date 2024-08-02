Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DBEC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 14:57:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.94825.1722610635174073614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 07:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TElzq581;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01A3A2000F;
	Fri,  2 Aug 2024 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722610633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YWleSPEf7ATgtFN8ON4urZPldyNr/ECSx9QuBWRWq/Y=;
	b=TElzq581hgvxQoLnPHdLVjiQDeCLifydDAqF7MDQ5TXOOFM4ya3cnLK/t570LJZ7t8tJ2v
	YPhCl2AJhGzUPhqy02pBZtLWwa1f9n3OnKRfUwTXpuCooAvPrM0dCcuchJ9gHPUAwRA9Fz
	B4spAiF/IPTl6xPbHHkWLQ6hrfmXSr4nJG96a09E1ShYOPqF3eePecKuS6TxCK3r6QNCom
	TDfZ77ffo7tAtJ2DxYdxgRdxLl2d0QM5Emm5pmcW+kNhoLfEU+XUHiavD51lbFu1Bq9z6f
	JObFI1HaeS92CzEH9lhLCYyE/GPE+3OmlIcFO3KlRxqHeA7Fx1ftgAgtFMUuUA==
Message-ID: <4c6579a7ae6988005f628bbdbd686a4294bb8e99.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.5.1
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 02 Aug 2024 16:57:11 +0200
In-Reply-To: <CANNYZj8XmjudNK_=O0ftKAw9pUHD2Ybc=ZoW_wLHjROiZQ7giA@mail.gmail.com>
References: <20240802121336.1642376-1-thomas.perrot@bootlin.com>
	 <CANNYZj8XmjudNK_=O0ftKAw9pUHD2Ybc=ZoW_wLHjROiZQ7giA@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-peXrSkwyG4j1qQGYSS2f"
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 14:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202917


--=-peXrSkwyG4j1qQGYSS2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alexander,

On Fri, 2024-08-02 at 16:00 +0200, Alexander Kanavin wrote:
> You need to rename the recipe as well?

As for some recipes, like the kernel recipes, I only used the first two
numbers of the release version.
I can rename it to use all numbers if you prefer.

Kind regards,
Thomas Perrot

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-peXrSkwyG4j1qQGYSS2f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmas88gACgkQn8ALBXH+
Cu1r1Qv9Hu59sGwu+EIQ/8zEtND3EMQYKy651dQdZuIXnATRpbwnx3Otlm7fVnTr
4HLNurqBS08rE64+CxGazJX/ssO866nE6xw9zLvIGUdcQR9uU0lz7+NIJ1VIrQbJ
LvA0dOaENeumJPpFyKK4pkyQRu2Zch8JAjfQoCpSbiIFRA7kWtFJpLn9S6ZoVDQ7
CxUdvgjtLuQ9P8oMyNmTs/J5GEl8cE8PUlIBwKv6N06wLz11KnY8muFVwE+teG+J
ge5SYoNHwj46uECdYFJlPBDAdLYbLH2P3cdsiXPcRj2qZsCDcBN6ULDmRE+DtC5S
FXP9wk5k1hZzCROwknw9GOqAprAcN1DUFHVV2CPLBBWy97jMtNMgSdTW4WJwNGM+
M1WME/cpCFk+3akquyZf/+6ySt5VQt78DB8ClZvlggqf+OS5l6Mv87baacV3PnMa
CXZvF26eeUst3NtZThDvnt5+fqt3I46wm8jyYuaihUiusBsoHEg6XqulpGFaitGi
CTJIkPaQ
=FgNu
-----END PGP SIGNATURE-----

--=-peXrSkwyG4j1qQGYSS2f--

