Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAEACD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 16:28:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.56091.1695054500718605541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 09:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=acWR/DZK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF0EA1BF211;
	Mon, 18 Sep 2023 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695054498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=829hApEyUuBNDfMSlATTIle5jrNMqo44XhccxezMYLY=;
	b=acWR/DZKgwyNHO0EZm9aAhr2iQgMwRYbTjvW7cHmSlNTUq2dxQaZURkD9GWpWoSOvpKUsZ
	ppqmZS18dHcmf8QIWyL8C44CkMxKYp0vJeVriPunMWbeLa+wN5KKnKN9uoUg3riOHLc7Kv
	zRBlIRw4063AtTXRdgkfnD3VoAOpooU5uFlOFivUCcDpTcqdNQufUUooyzsefjtyywry2b
	VxvFuF3Z8UpINlnTD9DxH2NzJDAgIzOakMcZXDjiqmPtBNBJO40TKwn39e5hKmi6+G6ze0
	CHLVd4Ggf1rwYHvTED8GMhdaXjd5reympnXP6RYHdcjXKP1cJkrBjSLPZHexvQ==
Message-ID: <071e06cc-37ab-fd55-aac5-a089bc1501b0@bootlin.com>
Date: Mon, 18 Sep 2023 18:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [AUH] alsa-lib: upgrading to 1.2.10 FAILED
Content-Language: en-US
To: Auto Upgrade Helper <auh@yoctoproject.org>
References: <0101018a9a36c5d5-dcf81a91-7709-4c49-933d-29b6888c00ba-000000@us-west-2.amazonses.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <0101018a9a36c5d5-dcf81a91-7709-4c49-933d-29b6888c00ba-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 16:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187836

Greetings,

On 15.09.23 at 20:59, Auto Upgrade Helper wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *alsa-lib* to *1.2.10* has Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed
>
Ouch, as far as I am concerned, the AUH patch didn't cause any failure 
on Poky "master".
After applying a fix to the alsa-utils 2.10 recipe, I could also build 
this recipe depending on alsa-lib 1.2.10 and check that "speaker-test" 
starts.

Any advice for cases when you can't reproduce the AUH failures?

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


