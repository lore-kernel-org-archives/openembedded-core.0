Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21E01093199
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 09:16:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8752.1773998201874388167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 02:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=N5uaZpqR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 69C92C415A4
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:17:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14D91600E0
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:16:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15DAC10450B7B;
	Fri, 20 Mar 2026 10:16:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773998199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=vo1v6ksqSNpf/AbkF2GpASsRRVOm6Bm9M3sg5ZxRePg=;
	b=N5uaZpqRCpSSXtOz4yOC9vwJdE7s7C0Rk+9VcDx5cBh0zvmJDBaeditD087A75H3BL1AKc
	SPrNwsAZvPLJd8I2CHa+EF2HjOaJ66vfmLBtXpsA+HyN4dAuNvPlrCS6Kg1/72xDQnu0Gw
	ulK4lhyKAkyCa3iSKvdzDFBvh87q77C6OESbVopiBgOFwqftG/DCVExSFzVOTgCOidaxsq
	rkN/P9ltvNptweGDwvdyIIQkBtxP24FS9+yVpdxNdpusQSlRzIHZxmtTUMQjYMsPRj7wvN
	Hs5HZmVLGIKtBOJlTiMEYe/E4Y9H5+2cybUu6RkYh9VsnH5cL2po64eAZwdZzw==
Message-ID: <d01181ac-b115-4d87-9902-e7dd5b888341@bootlin.com>
Date: Fri, 20 Mar 2026 10:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ltp: fix warning in remove_broken_musl_sources
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20260319132904.1308436-1-joaomarcos.costa@bootlin.com>
 <DH6XX5V3YO6B.2PRKV55NZP37I@bootlin.com>
 <78bcbd97-e691-4381-9312-bae0fe0ebf73@bootlin.com>
 <DH6YQYC6H8Z2.2B8KJW0XH6SI@bootlin.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DH6YQYC6H8Z2.2B8KJW0XH6SI@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233591

Hello,

On 3/19/26 19:17, Mathieu Dubois-Briand wrote:
> On Thu Mar 19, 2026 at 6:55 PM CET, Joao Marcos Costa wrote:
>> Hello,
>>
>> On 3/19/26 18:38, Mathieu Dubois-Briand wrote:
>>> On Thu Mar 19, 2026 at 2:29 PM CET, Joao Marcos Costa via lists.opene=
mbedded.org wrote:
>>>> If this was originally intended to be an actual warning, it was not
>>>> behaving as such: echo only prints to log.do_patch, so the message e=
nds
>>>> up hidden there.
>>>>
>>>> Replace 'echo' by bbwarn to display the warning message correctly.
>>>>
>>>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>>>> ---
>>>
(...)>>>
>> Yep, it will. Would an INFO/NOTE be acceptable instead?
>>
>> Thanks!
>=20
> Yes, I believe info or note are acceptable.
>=20
> Thanks,
> Mathieu

I sent a v2 to fix that.

One more thing, though: this same function uses an 'rm -rfv' and the=20
"-f" option will not raise an error if the file is not there.

Do you think this should be addressed? I would send this in a different=20
patch, of course.

Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

