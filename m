Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DBCC46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 18:46:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.59856.1695062802718256852
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 11:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UlZRSsSH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 516CF40004;
	Mon, 18 Sep 2023 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695062800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pF0Wo6KO3gfpsBQLr//t+meZF0lwMgEdAKbDTcs01co=;
	b=UlZRSsSH+j/1BxMUy5gYyd9GgAXMUG1PDmww9FDvcYhIXcFZBJ78pP6GvEGeS0xbwUMzmj
	hwPDi6qGVrSFzXpn72y7L+61T/1lgHBH+EkzGWGej/aIkweqfuwAOh9PC+TG2Ohr3DvgMm
	9j9H7n9lnD+FgrOtGdKBnvdCps695ItCbF2L6xk//SxiOTguSTb22M4jmOjkXlDG1Hc8f9
	lyjKT4wZl4F7ZTBx2UnqaQ3wCxBJYId9E5zIKivUmSY6f0ojhq9YU9z6LBt1LZGpHvbWqX
	mokA7s/1xg6PI8Yj4hEQF1V18qcRKMBsc77XqtpFzIpRlCjAsvJlEQhp34XcuQ==
Message-ID: <1a9a7ce4-821e-4e82-6b55-c0dd5dc9283d@bootlin.com>
Date: Mon, 18 Sep 2023 20:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [AUH] alsa-lib: upgrading to 1.2.10 FAILED
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <0101018a9a36c5d5-dcf81a91-7709-4c49-933d-29b6888c00ba-000000@us-west-2.amazonses.com>
 <071e06cc-37ab-fd55-aac5-a089bc1501b0@bootlin.com>
 <CANNYZj9Sy+vMoOF5s9yHejT2fCbE1LhOtbxMEXqME4sPePyJ+A@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj9Sy+vMoOF5s9yHejT2fCbE1LhOtbxMEXqME4sPePyJ+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 18:46:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187843


On 18.09.23 at 19:16, Alexander Kanavin wrote:
> On Mon, 18 Sept 2023 at 18:28, Michael Opdenacker via
> lists.openembedded.org
> <michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
>>> this email is a notification from the Auto Upgrade Helper
>>> that the automatic attempt to upgrade the recipe *alsa-lib* to *1.2.10* has Failed(do_compile).
>>>
>>> Detailed error information:
>>>
>>> do_compile failed
>>>
>> Ouch, as far as I am concerned, the AUH patch didn't cause any failure
>> on Poky "master".
>> After applying a fix to the alsa-utils 2.10 recipe, I could also build
>> this recipe depending on alsa-lib 1.2.10 and check that "speaker-test"
>> starts.
>>
>> Any advice for cases when you can't reproduce the AUH failures?
> The failure is with musl, and I easily reproduced it there. The main
> report itself isn't saying it, but attached log file name should
> indicate the failing configuration.


Ah, right, I should have paid attention to the file name.
I could reproduce it too.

Thanks a lot Alex :)
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


