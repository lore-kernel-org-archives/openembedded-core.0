Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CA4C3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 17:09:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.93672.1673629755441410984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 09:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l2EVPU+g;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EC57AE0008;
	Fri, 13 Jan 2023 17:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673629753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1y82iX6WlsRQFcNtibageQJRU14EiQ6WHp+36E+RPU=;
	b=l2EVPU+gkKKOV3kQb4V6DVQCdU/qAjPoMybZpvhMJAL8W8cj5YvFgxUEvpnQUq987HiNiJ
	4AQ64451Chl7vdPJASCqiuhNqaciSYUQPA7WocVkoWxTr7gGpgZieb4m7Mkg074Yi1Xnqs
	jjJnBTZLF1ucLU0VzS5AQzfOswJw2LgdsM523Q34ZCeWUMU33RLHTyPB+82WjO3PAd3n1p
	tk6//zkxVsb5olUno4HMdTzIpHAVGCY+od9e5zjrDkJRsqsyiRAW7QL6szVjXMIn+gFtHv
	ARrW1bQP0EIJ27RWeU+wAy03HMAVXBX9ZJwj8SumQuEznIzdBiP6aNdMwgb53A==
Message-ID: <a2b3f9de-f3b7-ae06-b3c9-230689de3b02@bootlin.com>
Date: Fri, 13 Jan 2023 18:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: michael.opdenacker@bootlin.com,
 OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Is rust-bin.bbclass still in use?
Content-Language: en-US
To: Alex Kiernan <alex.kiernan@gmail.com>
References: <da703100-dd85-8ede-3a3d-f7e57d6a4ee7@bootlin.com>
 <CAO5Uq5T3Mc5pEFK+4GODftM4kzwkJo8RnpgrQvFX-ewskpAWbA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAO5Uq5T3Mc5pEFK+4GODftM4kzwkJo8RnpgrQvFX-ewskpAWbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 17:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175843


On 13.01.23 at 18:06, Alex Kiernan wrote:
> Nothing I know of - I suspect it wants deleting.


Thanks for the quick answer. I'll send such a patch.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


