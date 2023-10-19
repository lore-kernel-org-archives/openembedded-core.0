Return-Path: <logang@deltatee.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A7ECDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 20:58:52 +0000 (UTC)
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by mx.groups.io with SMTP id smtpd.web10.39294.1697749126934906212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 13:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@deltatee.com header.s=20200525 header.b=CJu8oUGI;
 spf=pass (domain: deltatee.com, ip: 204.191.154.188, mailfrom: logang@deltatee.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=tc/zl7PWi61iYTmCBwaCDS5o4MQDCtfiylO4uky4fRI=; b=CJu8oUGIRcSN4VdbR7wOVBKy3q
	RYaFlabfhnfLSAOgFr+nGBDCM9HYY5p1WgT7abnZMAtXOJzzhqnHIVFbzmk1Q1GsUOKfLigZAVfbk
	iCj7gd4U98/TD6ziESvdNTKuYTKZk+V1lSdmeJEgCzYjqGWN/ljHkVMkmHIop9MDvcsKQ8Z4zvL+1
	TIeobfjkESKJ4k/+SwZntDFVZsaG0SyvDWxXp4jh4m31ZG5w6oivWXQKzm+JgXyJGK3+U3uavZb8P
	EySE/vr1yZo5aQ5Nq/2/4lUe9qY+yWb9vYTbky6/JO4VnQ7nA8HXHUFhFqyNy6jwT+dzuPz9Vwkzr
	HKUrEz7Q==;
Received: from s0106a84e3fe8c3f3.cg.shawcable.net ([24.64.144.200] helo=[192.168.0.10])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <logang@deltatee.com>)
	id 1qta6O-000qe1-K9; Thu, 19 Oct 2023 14:58:45 -0600
Message-ID: <5a4de60a-5669-4977-b566-0236bf2ed7db@deltatee.com>
Date: Thu, 19 Oct 2023 14:58:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-CA
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Logan Gunthorpe <logan.gunthorpe@eideticom.com>
References: <20231019181051.216536-1-logang@deltatee.com>
 <202310192057180d3b8ab7@mail.local>
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <202310192057180d3b8ab7@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 24.64.144.200
X-SA-Exim-Rcpt-To: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org, logan.gunthorpe@eideticom.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [OE-core] [PATCH] runqemu: Add squashfs filesystem types
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 20:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189485



On 2023-10-19 14:57, Alexandre Belloni wrote:
> Hello,
> 
> On 19/10/2023 12:10:51-0600, Logan Gunthorpe via lists.openembedded.org wrote:
>> From: Logan Gunthorpe <logan.gunthorpe@eideticom.com>
>>
>> When using a squashfs filesystem type, runqemu requires specifying the
>> full path to the image because it doesn't list squashfs types in its
>> fstypes variable. Add them to provide the same support as other
>> filesystem types.
>>
>> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> 
> One of the SoB must match your From:

My apologies. I messed that up and didn't notice until after it was
sent. I'll resend.

Thanks,

Logan

