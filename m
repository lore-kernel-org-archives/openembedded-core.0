Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59466CDB47C
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 11:19:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4617.1782299950397179926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 04:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IVl8yWvt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F5471A08F4
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 11:19:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1AD5601C5;
	Wed, 24 Jun 2026 11:19:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86BBE106C81A8;
	Wed, 24 Jun 2026 13:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782299947; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=WE3D03rGSrBpgbhu987sOMpjIl+xUi+kDXrlX5xDGsA=;
	b=IVl8yWvtCsHnu6imkSlwuxx9pgOLKqWJf7OdMV9wD0wa3hhWtSFgygGo29cZZ5IFAG2RQP
	h7urniClYcCKXer8GaAYqyHaluyRBAAFLu1ot3VHUsZW4aIOWS9IhPTdx05gVz45E1K7hb
	pi5/l8b+ri+Aedcri4ayJEdh4nHll89SPphVQZq/WqgP7I+V6ayKJeQhfOdzyull24ROGb
	p/pJbkfqzLtfS3jwIOPv/5LO2PZzB3GWpHKf0ew/azyHQUdaa0ud3j+TbWbEmtzqm76ymg
	cISj8IQGtWwhEJZvgNoyieFyKrd4eO7QVOZ0Ol/+1Rmx/c2vn1ObCbHGe+EPdw==
Message-ID: <8a1b467a-f648-4142-b07b-4dc6d239bbbb@bootlin.com>
Date: Wed, 24 Jun 2026 13:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] muon, an alternative to meson
To: ross.burton@arm.com,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <D146E22D-7BC9-441E-A835-163CF509D8A3@arm.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <D146E22D-7BC9-441E-A835-163CF509D8A3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 11:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239488

Hi, Ross

On 6/24/26 13:07, Ross Burton via lists.openembedded.org wrote:
> Hi,
>=20
> There exists out there an alternative implementation of meson called mu=
on (https://muon.build/), whose defining feature is that it=E2=80=99s imp=
lemented in C and not Python.
>=20
> This means that nominally it=E2=80=99s faster (although the time of the=
 compiler vastly outweighs the speed of muon in all but contrived tests, =
like - and I=E2=80=99m not joking - raytracers) but more interestingly ca=
n help remove python3-native from early in the build.
>=20
> I=E2=80=99ve not yet done a full build swapping muon-native for meson-n=
ative to see what the different to the build tree is, but it=E2=80=99s ce=
rtainly an interesting development.
>=20
> I have a prototype recipe in case anyone wants to run with this before =
I do, just ask and I=E2=80=99ll share what I have and the latest learning=
s.
>=20
> Ross

I'd like to try it out, if you can share the recipe you wrote. Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

