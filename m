Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFFEC021B2
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 23:24:02 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.77821.1740353035726512537
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 15:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=IeWFafqm;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02B3310382F1F;
	Mon, 24 Feb 2025 00:23:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740353033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z6VXybnbYwQMBK115N0k0gtQiYbQpwwicEY9xFdpQ84=;
	b=IeWFafqm/VN93rb9q0xOn+rYRGgOTlJe0aAVIIQBhxQRH1iNC8ult8h9s4G7o0vtcU1nZd
	mU6KvX/qMON/EHO8NaAmBppYoEkXHRDQZKQEURYYIfdMX9PpcC2gF/v9VKrmabBr2X0bRX
	b4Ge8b56xhcYSMV+XPAbxFaMOWREs7E2hMl+Uq3ntJp6vpDMiWVD2n+r9CIepuXY9giRxN
	Zj5KL0osTdNMKMfRo8TCDxPxS6TtuaYoyZzGSsf4xVmZZYuKEWQANzr2ypux+WRRCf+K97
	TfRgcMj5/6Yw9kIwMnpYYHmpKbmbrcKlqzEr2zhLqdKnU/PwL5mY0p/z5rWyKw==
Message-ID: <00501d28-4bf5-426b-b5bf-5db49da4097b@denx.de>
Date: Mon, 24 Feb 2025 00:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: kernel-fitimage: Restore
 FIT_SIGN_INDIVIDUAL="1" behavior
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 Jose Quaresma <quaresma.jose@gmail.com>,
 Leonard Anderweit <L.Anderweit@phytec.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Rogerio Guerra Borin <rogerio.borin@toradex.com>,
 Sean Anderson <seanga2@gmail.com>
References: <20250222002047.319479-1-marex@denx.de>
 <595e728dc77eadf27430628e2ce701577774df7f.camel@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <595e728dc77eadf27430628e2ce701577774df7f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 23:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211833

On 2/24/25 12:14 AM, Adrian Freihofer wrote:
> Hi Marek

Hi,

> Thank you for the patch!
>=20
> Signing first the image nodes and then the configuration nodes looks
> more reasonable to me than the other way round as done
> by=C2=A0https://lists.openembedded.org/g/openembedded-core/message/2117=
61.

It would be nice if I was CCed on that patch.

> Here is a branch where I am trying to improve the related oe-selftests:
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/oe-selftest-=
fitimage-cleanup
> So far it is unfinished. The kernel part is already in a usable state.
> The u-boot related test cases need more work.
Please post patches once you have something final-ish, I can help review=20
them.

Thanks !

