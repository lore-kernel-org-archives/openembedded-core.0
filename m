Return-Path: <abeltran@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB672C433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 21:34:40 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.763.1642541679288848942
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 13:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=DlzLmgXb;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: abeltran@linux.microsoft.com)
Received: from [192.168.1.103] (unknown [186.69.115.196])
	by linux.microsoft.com (Postfix) with ESMTPSA id 33ED520B9279
	for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 13:34:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 33ED520B9279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1642541678;
	bh=cEEvk06fR031/dUn5xCE54BLhSFHfCw8elWxsZsENPg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=DlzLmgXbVyZW5KWex2lrjTSFI17KvjdX49xd/1nIbONc6baqxctz9VEXJsUiW2dzn
	 nAAylBtDT38xttXCAKdxWB1RXOrLT3nqX1Jp85tmeNOSWmjNiJRV8AsWu4rS4C/2Xe
	 bqoFeMtOQOjlxj21sBCPSwNIs7H/MyGSWUt8r6LY=
Message-ID: <b71615ac-d9d2-438a-0410-ab9b6c948866@linux.microsoft.com>
Date: Tue, 18 Jan 2022 16:34:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH] create-spdx: add support for SDKs
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220112194012.873-1-abeltran@linux.microsoft.com>
 <a4421a37-74f3-fc36-c4e5-1db8f67d7c75@windriver.com>
From: Andres Beltran <abeltran@linux.microsoft.com>
In-Reply-To: <a4421a37-74f3-fc36-c4e5-1db8f67d7c75@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 21:34:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160681

On 1/14/2022 2:16 PM, Saul Wold wrote:
> Overall I think this is going in the right direction, I need to review 
> it a little deeper and check the actual output.
>
> I am not sure that you tested this against master as you use the old _ 
> override syntax vs using a :.
>
> See note below.
>
> Sau!
>
Thanks Saul! Yes, I was certainly using an older version. I will
correct the override syntax. Let me know if I should make any other
changes once you review it.



