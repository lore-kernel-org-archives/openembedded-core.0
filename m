Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202C2C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 07:31:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.3643.1666942291003764531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 00:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EAx8ekJh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0E5D61BF20C;
	Fri, 28 Oct 2022 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666942288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNgt+CHnV156Y5veN+rKx/xhhlak6ngjMXMUX0uWe+o=;
	b=EAx8ekJhBEKhQuryY+oycdpcKnfK1vYrLodcN/fmOncqRKkxjZp+S6iC5nA/9x1ZHeRMrp
	68+ET4CmFxuYTxyZm1y17pFHmyg/aBY7h8MeszYFcQ5sKyoXXlwHwyEaCbNqhWq6qsOIWF
	dEy++QwExWdcd/vByX3ctvVKQzsZ6gTMrdR5fbeVFzhYEb33c9z4LGA82DWouFg0nIj3EM
	rgu7fIDn3X1hIY8+pEKvV4OzWmufDNQ+Qmv/KvnYdpDmRMKGkyNSfp7D1i1gS+JuW3AIgm
	coaxOUeTo2kMrFK07c2/nXTtXMRnqvvMMZrYiB3hRsBgv57Ijf/+eh/dLvptLg==
Message-ID: <e722d9bb-0481-b002-8ead-0b015ffbcf9a@bootlin.com>
Date: Fri, 28 Oct 2022 09:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Subject: Re: [OE-core] [PATCH v2 1/1] cmake-native: Fix host tool
 contamination (Bug: 14951)
Content-Language: en-US
To: bero@lindev.ch, openembedded-core@lists.openembedded.org
References: <20221027185937.2023904-1-bero@baylibre.com>
 <20221027194748.3851487-1-bero@baylibre.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221027194748.3851487-1-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 07:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172235

Hi Bero

On 10/27/22 21:47, Bernhard Rosenkränzer via lists.openembedded.org wrote:
> From: Bernhard Rosenkränzer <bero@baylibre.com>
>
> [v2 hopefully fixes the From: mangling by the ML, no functional changes]

Yes it does. Thanks for the update!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


