Return-Path: <t.fuchs@thofu.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C7DC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 06:50:20 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web11.66254.1723531811487705614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 23:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thofu.net header.s=MBO0001 header.b=w8WDg1LD;
 spf=pass (domain: thofu.net, ip: 80.241.56.171, mailfrom: t.fuchs@thofu.net)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4WjhpR5Pkjz9sdB
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 08:50:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thofu.net; s=MBO0001;
	t=1723531807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fttBVkPD7L+Ia89PBWvLyEy97p6jJWa+MyXodCM3TkI=;
	b=w8WDg1LDhvNvA1mHKIyJLNe2+225/+0M6a8hL/RaMsjNDXZrmVk4+KvkT/Bf51Xw2ts5kF
	30sx1igC3B5BVLhPhxFD5/z5x7uUYl+TP18bN3jVa3wwmK2XoSJQnOwlEaNo8lP19ytvA2
	vekL7JeG8QXKHZcgFGUAMNYtz/SwntVw5ETGioaKss49O4QjKDq+F6pSlmUIHrQh12ftcg
	Elx7H4AV9rV+V9kLKT+b3b7svSfrYKqo/43PCKWisO4SIWiLLVX132dz70PGftWg5AzySu
	wprLodnOf8IysGzGnbNXogM6u8oU0HWAtSZDmYV1mPxSt6bB63M/kLEdCjVD5g==
Date: Tue, 13 Aug 2024 08:50:07 +0200 (CEST)
From: t.fuchs@thofu.net
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Message-ID: <1827111276.193571.1723531807206@office.mailbox.org>
In-Reply-To: <AS1PR10MB5697D30873B0F3ADDA280459FD862@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240813060844.5036-1-t.fuchs@thofu.net>
 <AS1PR10MB5697D30873B0F3ADDA280459FD862@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Subject: RE: [OE-core] [PATCH] lz4: upgrade 1.9.4 -> 1.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Rspamd-Queue-Id: 4WjhpR5Pkjz9sdB
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 06:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203253

Peter wrote:
> The CVE_STATUS needs to stay (forever), as r118 > 1.x.y so it would reappear in CVE reports.
> Also, you're not fixing this CVE with this upgrade, so commit message should not have "CVE: " flag.

This was a bit confusing to me. I read up on the docs again and understand the system now.
I mistook "r118 being bigger" with regard to release order and not simple lexical order.
Sorry for the inconvenience.

> Additionally upstream-status flag is missing in your patch, move it there from commit message.

Perfect hint, I read patch and assumed the patch we generate and send to the mailing list. Not the patch files themselves.

> Cheers,
> Peter

As a side note, working with the mailing list is still a bit obscure to me so I apologize for any mistakes in advance.

Cheers,
Thorsten

