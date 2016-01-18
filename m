Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8189B60620
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 10:19:42 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b14so114923335wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 02:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=YDYnyTUNKLCnLrbYiWx9GZoT7oNHUHaqlZZinQe7pdk=;
	b=Y6IpRcRrbGWXA9Lg4jvO/ltJYYfB3KOdgvBXoVsHWspm6/MkOfPy+0spnVlmUIHdGj
	VE0kcVG6BhdzgSCMHyThdz2J42SDpLfGS7WnCiu0YFreWc9woz99JOvWOoAh2kkHQAqH
	A41/G+ptcYka6ysweXqMbaYAMTpiatGqUyzoLJ6r0qXVyq0Wo9ftzKtJ6k33+3XtAuba
	0nwXM3Ng0PQqZzxDDnMVDrXaSKofIx3g8FJmE4XKCGRt+5TIzAdfAo9FGUJr4oQipn6E
	bSJppfq2q5YlZ/QQZcANn9zR/Bxmnv9ilccvyUkDXGgTS2n11goZ3LR3ZzbvfqzspSyz
	vxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=YDYnyTUNKLCnLrbYiWx9GZoT7oNHUHaqlZZinQe7pdk=;
	b=gmtH7MzapfFsMG23iXDW/lhcsTezBhR0f9AVYg0jnpHBEbjwzJo1KBxWoKbxOsGMMd
	czAlTWcxtSthQjAtuLlgnztXRNe2inRMrUFp8lEPXjcQNOPTVG/QhLMP0V5IzoK2hm9t
	xnoQ1haUCBoZCvU6gNw+Oc3hfI2MB2XyoL1Cfuf5dg84zGBeNI/AhJN9sclXmIbE1Iuq
	oa8gGQpXLMurC8hewTIj91ldA3snKivTJF1nNFw5ehlf6mk9q/RUo2UcHagZUc2GCtOI
	yOYYgs9IJsmWJn08O9tBpxMW2IEqv877O3bsiyETjQS3xOAOLHmbrUftnjRSERAmmOwz
	qzzQ==
X-Gm-Message-State: ALoCoQnIZT0nez1OGFx89yHKrreRmw0mZMnDNZlfl9z66u6Jf7XX3k9CukafAF3sBBpaDjgp9a5v176X2JZgImQqIB1VxTzk5A==
X-Received: by 10.194.175.170 with SMTP id cb10mr27732662wjc.36.1453112383147; 
	Mon, 18 Jan 2016 02:19:43 -0800 (PST)
Received: from ?IPv6:2001:610:612::3870:6f41:fc04:319f?
	([2001:610:612:0:3870:6f41:fc04:319f])
	by smtp.gmail.com with ESMTPSA id
	s129sm14966466wmf.18.2016.01.18.02.19.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 02:19:41 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: iPhone Mail (13C75)
In-Reply-To: <569CBA29.60301@dresearch-fe.de>
Date: Mon, 18 Jan 2016 11:19:40 +0100
Message-Id: <229F5D91-9E6E-42BB-81C6-24D0B46A456B@dominion.thruhere.net>
References: <5698E002.5090800@dresearch-fe.de>
	<1452863169.28375.161.camel@linuxfoundation.org>
	<5698F31E.1020905@dresearch-fe.de>
	<56990180.9080407@dresearch-fe.de>
	<6AFD6AF0-3B94-44BB-BAA0-30EBB9747193@dominion.thruhere.net>
	<569CA241.20805@dresearch-fe.de>
	<F620CA2D-BA83-436A-B7D4-EA0C117154D9@dominion.thruhere.net>
	<569CBA29.60301@dresearch-fe.de>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Christopher Larson <clarson@kergoth.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fido -> jethro switching problem
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
X-List-Received-Date: Mon, 18 Jan 2016 10:19:45 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> Op 18 jan. 2016 om 11:10 heeft Steffen Sledz <sledz@dresearch-fe.de> het v=
olgende geschreven:
>=20
> On 18.01.2016 09:41, Koen Kooi wrote:
>>> Op 18 jan. 2016, om 09:28 heeft Steffen Sledz <sledz@dresearch-fe.de> he=
t volgende geschreven:
>>> On 15.01.2016 15:29, Koen Kooi wrote:
>>>>> Op 15 jan. 2016 om 15:26 heeft Steffen Sledz <sledz@dresearch-fe.de> h=
et volgende geschreven:
>>>>> It seems that all machines based on armv5e are affected.
>>>>=20
>>>> FWIW, I'm seeing the same problem. The last time it happened it was due=
 to the fixup angstrom does for broken arm BSPs
>>>=20
>>> What commits do you talking about ("last time it happened")?
>>>=20
>>> https://github.com/Angstrom-distribution/meta-angstrom/commit/7f3d898930=
077710dfa42150882bce60d437af7d ?
>>> https://github.com/Angstrom-distribution/meta-angstrom/commit/4b2e8ecb9a=
82109022727f6d80b8db56ae493fe8 ?
>>>=20
>>> Or something else?
>>=20
>> Yes, those ones.
>=20
> If I understand right you only introduced an own DEFAULTUNE override for a=
ngstrom to work around the problem. Right?

right

>=20
> Did you identify the parts of meta-fsl-arm which were responsible for thes=
e problems?

The machine includes that tune to cortex-foo instead of armvX. I don't need 5=
 different versions of bash for 5 'different' armv7 machines.

>=20
> Steffen
>=20
> PS: Hi Otavio, I've added you to this discussion as the official meta-fsl-=
arm maintainer.
>=20
> --=20
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058

