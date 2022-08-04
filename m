Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2988AC19F2C
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 09:26:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.2825.1659605208410573768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 02:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d+fzAyKh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8C7DE40005;
	Thu,  4 Aug 2022 09:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659605206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hAHQg34AWH66TVnnjDw0wNUyECe1MRW2EVOOOXTx5BA=;
	b=d+fzAyKhKa5DSZqrncP+qHr00Sg1byPYrDVa7Kk/3d2Px1pnrnp4xwemvuc7M7UnpFcvv0
	FkH9dVuw4fkxrYQsl+9TW0raJjdcLkMEzr1rTCWFzucAJAQYG+qBtR9g0y0cJZ6UEqZR8m
	CxeiarUbTZWKGAQ6rMi4zYLAB39zrW+prJ6gONOAAqkxrbhucycu2onwWOR11o1FX/xfKS
	wxUqzF4i0d/AcnS0zcGslmRcvM54tFbg8vK+hV8R0wP6+VjxG2/F/YQb+qqRIkgp35F8ah
	wC2IBMmY5j4iW8JQjYXwZ4tWRtTL8sa85kHqAh6MOQCqGNZybSUzZU7NH4MTHA==
Date: Thu, 4 Aug 2022 11:26:43 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] python3-pip: upgrade 22.1.2 -> 22.2.1
Message-ID: <20220804112643.4b534094@booty>
In-Reply-To: <1659570974-4168-1-git-send-email-wangmy@fujitsu.com>
References: <1659570974-4168-1-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 09:26:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168840

On Thu, 4 Aug 2022 07:56:14 +0800
"wangmy" <wangmy@fujitsu.com> wrote:

> reproducible.patch
> refreshed for new version.
> 
> 0001-change-shebang-to-python3.patch
> removed since it's not available in new version.

I must say this comment was not clear to me. What is "not available in
new version"?

By looking at the source history, I found upstream has removed the
shebang lines entirely and thus this patch is not needed anymore.

I'm taking this patch for testing with this comment modified to:

  removed as not needed since upstream has removed the shebang lines.

Can you confirm whether it is correctly describing what you mean?

Thanks,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

