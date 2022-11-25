Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51263C433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 07:42:46 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.42029.1669362162596870025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 23:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=aAuKvcIE;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669362163;
  x=1700898163;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version;
  bh=/k80mAroZK9tTubv68+cinsJBVb2KDB0d8TckIpuLDs=;
  b=aAuKvcIE2SBk/OBoXITZrVvsX0B87TtJh6q29kGM5CSRKpzaiAYkYHBy
   nuY8X37EnRPnzrMSX76UgubNMvVhDeG1gM25nfAsfgCfLOm+LjdkG3njk
   MOML4FYwdhQIuZlx/He41UgmZN0X+g+RniVKHYhkqECh/xrp4BiKs4XKd
   GQ2ybGtnNrbcw5vJeWQsVZ8CBBhRf9QjglpiV+Drfne2Njvtoo5ky4c30
   7+mDqn6lYK2ncoRqlItoP1hkkbHgQbD67Qxx4MHpSvOMqD6vs0dTUDiGb
   p2IWm6zNx4txSwflOHjewFcBUTaNLl8mgQoopy4hz0mRe+/lIc4Pl44sO
   A==;
References: <20221124165206.1020295-1-olani@axis.com>
 <ff56dd20a02379f34932a49092d7c5f868de14d2.camel@linuxfoundation.org>
User-agent: mu4e 1.8.8; emacs 29.0.50
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kbd: DEPEND on bison-native and don't build
 tests
Date: Fri, 25 Nov 2022 08:41:46 +0100
Organization: Axis Communications AB
In-Reply-To: <ff56dd20a02379f34932a49092d7c5f868de14d2.camel@linuxfoundation.org>
Message-ID: <jwq4jun4h00.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 07:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173761


On Thu, Nov 24 2022, Richard Purdie wrote:

> On Thu, 2022-11-24 at 17:52 +0100, Ola x Nilsson wrote:
>> bison-native is required if any .y-file is changed, by patch or in
>> devtool.  Otherwise the build will fail with
>
> The key point is that we don't patch any .y file out the box. I
> therefore don't want to add this dependency.

I get that.  I'll send a v2. 

> If you do start adding patches you can easily add the dependency too?

Of course.

-- 
Ola x Nilsson

