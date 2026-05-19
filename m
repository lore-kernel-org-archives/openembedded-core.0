Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CFECD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 16:30:01 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2906.1779208196999084650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 09:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@rootcommit.com header.s=dkim header.b=foNhqkf+;
 spf=pass (domain: rootcommit.com, ip: 185.171.202.116, mailfrom: michael.opdenacker@rootcommit.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CA5EEC2B9E9;
	Tue, 19 May 2026 16:30:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D1DB5FFC8;
	Tue, 19 May 2026 16:29:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 632B9107E9524;
	Tue, 19 May 2026 18:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1779208194;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=U+u6ZLoWkliXIL5cS5IfNjTQcC9xbCZ7d3jFxLe/PNY=;
	b=foNhqkf+MrXK1jvSG8nD/VTvWFgkfNt/Km9lGuGXixJIEg3ML/DfOA3SwOmMrUywTMr9G1
	DmlmEmJS5h1KRbOKgercapplNm812RJz+WSavpyhqytUtisw7bPjl+q+bPYnQ+ORsWnn/6
	h5Oe8lZhdBMlBwkMtirD+Dir1Byl59o0B3VyIILbhj/c3etvkQSU69sUBrlHJ6+eztTIu8
	02jf4c7K1pTqZ8mF+1egBls4bTxYJmOTlUiKiXZC+l409GnAGxA6Syj5CBkWPTZGqgU5zw
	IYP2xvkEY/Cz0Q79T/9JDDpNko0/CTzz4FjQEl3n7xjiGl01YBGY8XvAXHgBmA==
Message-ID: <8fb4098a-0831-44d5-a852-3759d59f2433@rootcommit.com>
Date: Tue, 19 May 2026 18:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 dmitry.baryshkov@oss.qualcomm.com,
 Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
 <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
 <f531466a-fbd8-472b-a2b1-e487eea6d51a@bootlin.com>
 <9dc8c3b7-c358-4a7d-af1a-c1aec83906af@rootcommit.com>
 <e8674aa9-a98b-4d39-bc9f-a525516d3c24@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <e8674aa9-a98b-4d39-bc9f-a525516d3c24@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237335


On 5/19/26 1:59 PM, Joao Marcos Costa wrote:
>>
>>
>> Any update on this patch?
>> Building u-boot-tools on master for the "qemuriscv64" machine is 
>> still broken.
>>
>> For people facing this too, a workaround is the add back 
>> "libyaml-native" to depends in meta/recipes-bsp/u-boot/u-boot-common.inc
>>
>> How come the autobuilder didn't catch this issue on one of our 
>> officially supported machines?
>> Cheers
>> Michael.
>>
>
> The same patch [1] must be applied to u-boot-tools' sources to fix 
> this, rather than adding back the dependency.
>
> That said, unfortunately I don't know what is the current status of 
> Ricardo's patch, nor how come the autobuilder didn't catch this issue.
>
> [1] 
> meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch 
>
 From what I understood, his patch was rejected.

Maybe you should resend your patch if it's still relevant.
Thanks
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


