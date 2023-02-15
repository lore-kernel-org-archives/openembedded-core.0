Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19638C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 06:54:25 +0000 (UTC)
Received: from out-236.mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
 by mx.groups.io with SMTP id smtpd.web10.9759.1676444056714582187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 22:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@g0hl1n.net header.s=key1 header.b=W2yEoDYb;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.236, mailfrom: dev@g0hl1n.net)
Date: Wed, 15 Feb 2023 07:54:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1676444054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n1risUh6MXFXG+7OWXIa4wG4+v/nSDrX7NriJBPGpa0=;
	b=W2yEoDYb0HnD2gZkuLEWIw2uRU9Bqfls2Jx82iNRfvBnaMrQw2a4mFAL7xmJH2GiIG7q6O
	rzp1YSwgMdfvApjoR1JETEqCiLL21FDPMUJ9wpVz5vX9o3WIm/qBQ2putU34baEcNyQHjE
	ccA+vWydhGX1hSM3ItNf1bwgYir0lQ8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: Siddharth <sdoshi@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [kirkstone][PATCH-v2] Upgrade OpenSSL 3.0.7 -> 3.0.8
Message-ID: <Y+yBk/xUGTEmfSjb@g0hl1n.net>
References: <20230209143800.21458-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209143800.21458-1-sdoshi@mvista.com>
X-Migadu-Flow: FLOW_OUT
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 06:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177181

On Thu, Feb 09, 2023 at 08:08:00PM +0530, Siddharth wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
> 
> OpenSSL 3.0.8 fixes 1 HIGH level security vulnerability and 7 MODERATE level security vulnerability [1].
> 
> Upgrade the recipe to point to 3.0.8.
> 
> CVE-2022-3996 is reported fixed in 3.0.8, so drop the patch for that as
> well.
> 
> [1] https://www.openssl.org/news/vulnerabilities.html
> 
> CVEs Fixed:
> https://www.openssl.org/news/secadv/20230207.txt
> 
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>

Hi Siddharth,
thanks for the patch.

Tested-by: Richard Leitner <richard.leitner@skidata.com>

> ---
>  .../openssl/openssl/CVE-2022-3996.patch       | 43 -------------------
>  .../{openssl_3.0.7.bb => openssl_3.0.8.bb}    |  3 +-
>  2 files changed, 1 insertion(+), 45 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.7.bb => openssl_3.0.8.bb} (98%)


regards;rl

