Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2682C021B4
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 23:18:19 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.11188.1740093492947580374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 15:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=BZUSkr6V;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9911510382D37;
	Fri, 21 Feb 2025 00:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740093491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZf38YjNP6k8nz8KG4DNtx5yiiFY36dRtyag95na8Dk=;
	b=BZUSkr6VQv7cjRXocBhYJitkimLoNXAVaONAi0jnF3PehVBCc/Fv21rKIIs9R46ZCedrMI
	Bc2aR6YQQLI3NYfKA7fJOQjtz9iM4b9TW4EZ6M1w3TYo45VRrNrK/zqykun8qR4oSuH9pP
	D8zMLZywrPeWhfastW+jAVV0pyyj9VTJGnR3W96nN7eFzxOCv1/A+kIKfFWGbHSu1iJaRF
	10fUyTvtqRZnNX6kL8at8vDsWfL4s4HFwEt18WhkGPpD6Kd8U7F5JBf+1w6hl5aJICvL1g
	3/EhFC45RMDW0YuvILufCdls61GciRLIwu4eDZbkDN4y6/0RH1x7pkmXgdcxDA==
Message-ID: <a2355ed2-b87f-4537-a6eb-0b1ce1d6d5f4@denx.de>
Date: Fri, 21 Feb 2025 00:05:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Broken FIT image signing since "u-boot:
 kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV
 enabled"
To: Leonard Anderweit <L.Anderweit@phytec.de>,
 "rogerio.borin@toradex.com" <rogerio.borin@toradex.com>,
 "quaresma.jose@gmail.com" <quaresma.jose@gmail.com>
Cc: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "adrian.freihofer@siemens.com" <adrian.freihofer@siemens.com>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
 <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de>
 <86f57755-bad6-49ad-a1b6-d0dceaf5344b@denx.de>
 <c1fdfe98-90cd-44e4-9c5a-fe5d73ac49b4@toradex.com>
 <CANPvuRnkwX3ptjj6W8kZMjkXbUz=2qa=3nJvzxcrY_CYkBQRYA@mail.gmail.com>
 <91fdc65ed3eff19e0f02c3a3b6c4f5001380769b.camel@phytec.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <91fdc65ed3eff19e0f02c3a3b6c4f5001380769b.camel@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 23:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211782

On 2/20/25 3:42 PM, Leonard Anderweit wrote:
> Hi,

Hello Leonard,

> I've also noticed this bug and sent patch [1] to fix it.
> 
> [1] https://lists.openembedded.org/g/openembedded-core/message/211761
Please CC me on the patch so I can review it ?

