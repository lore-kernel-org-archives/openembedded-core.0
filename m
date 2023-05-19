Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93F4C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 13:09:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.25897.1684501778992247950
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 06:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R5FIKDTS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ED1F360002;
	Fri, 19 May 2023 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684501777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3iSTPD7tYPxf2kPLqoN/1dwVlV7sNo3vG4MOywYSQKI=;
	b=R5FIKDTSX71nToiWOmx5+QOqfFzQ4oDOpCYL1HzvOpJy0GTNWkY1SvFV1I7JE5RKFF6DFD
	lAneL62IcCpYkSpHANoBAkTnN6uDysHR1lWP8sbvC07JAopVTyqHcX6NClYpy6M25LYmD2
	97BkMUluZphqZSF539IpWcn0KvkB9FV+yjZj59kZZFewzv5uA3ReUHC527NEBnWBY3/VQ1
	7I/bsO/zXK06IksHh+f4NG/V196hSTghSplNPon1YOlHfODVLblury7FdUs+lHSU3hvaA8
	ua4HYnLWxhaD3h/ebHaLk9vvVwYbykH2OO17Q/4QyiQs0u5yVlU3jC/G5rEhlg==
Message-ID: <4b3d799e-21ae-bea4-e702-9d2db4b7145e@bootlin.com>
Date: Fri, 19 May 2023 15:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: Peter Marko <peter.marko@siemens.com>
Subject: Re: [OE-core][PATCH v4 1/3] cve-check: add option to add additional
 patched CVEs
Content-Language: en-US
To: andrej.valek@siemens.com, openembedded-core@lists.openembedded.org
References: <20230505111814.491483-1-andrej.valek@siemens.com>
 <20230519081850.82586-1-andrej.valek@siemens.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 13:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181549

Hi Andrej,

On 19.05.23 at 10:18, Andrej Valek via lists.openembedded.org wrote:
> - Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_REASONING] to be
> more flexible. CVE_STATUS should contain flag for each CVE with accepted
> values "Ignored", "Not applicable" or "Patched". It allows to add
> a status for each CVEs.
> - Optional CVE_STATUS_REASONING flag variable may contain a reason
> why the CVE status was used. It will be added in csv/json report like
> a new "reason" entry.


I'm not a native English speaker, but what about just 
"CVE_STATUS_REASON" instead of "CVE_STATUS_REASONING"?

"Reasoning" is a mental process if I understand correctly. See 
https://www.englishforums.com/English/ReasonVsReasoning/zdgdw/post.htm. 
It seems to me that the term "reason" should be sufficient, as the 
"reason" flag that you're using.

I'd be interested in what others think about this...
Thanks in advance
Cheers

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


