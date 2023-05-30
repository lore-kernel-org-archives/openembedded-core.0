Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9505CC77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 08:15:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.4989.1685434509524266790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 01:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K1n/nWRu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685434507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtjLU5IuNbKDfeLhqJqP1NPxRYFeP2ZK43PkEFV7SRI=;
	b=K1n/nWRu+XtMK7if8KHrhPT8GyZM1zMlWxa+9iVyb88BX56rUTws0f5QwK4xvf8YPKHM0f
	mc8w9moPeZ0EHejqszRlcRfHpP6Pbv4ijiyssRDOd85LSJHy2DB3ChDbn5mPBS1ErgjxkP
	quzS7Y5jx4lUiyK/EbuaeUvcoSMw1VMZj+njcazSjXtSEgpmSuPnRjin4+nEMCgTMzrbbT
	WKKLIN8HHuXtD42T+R+e0VzNiOjfp6zatOhCvXOYcH3qnQLWpJrWbK/8bI8Vljhygsxgjz
	NrWDOAEU2z3ssKUDrXGY3thRIZ8QD8LL4JehWiW8yccmMNcDHtQnDdTP5vURsw==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D2E6E0009;
	Tue, 30 May 2023 08:15:06 +0000 (UTC)
Message-ID: <f0bdf677-a950-8723-96fb-6651396719f4@bootlin.com>
Date: Tue, 30 May 2023 10:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: michael.opdenacker@bootlin.com
Subject: Re: [OE-core] [PATCH v2] Fixes pseudo build in loongarch64
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20230530064659.1465477-1-zhangjialing@loongson.cn>
 <1763DDADADC4728C.20537@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1763DDADADC4728C.20537@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 08:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181906


On 30.05.23 at 10:13, Michael Opdenacker via lists.openembedded.org wrote:
>
>
> |git config --global user.name "Guy Fawkes" |||


Sorry about the extra "|" characters. Of course, you should read...

git config --global user.name "Guy Fawkes"

Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


