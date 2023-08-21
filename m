Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCD2EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 13:11:04 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.100])
 by mx.groups.io with SMTP id smtpd.web10.10627.1692623459546253087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 06:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fancydomain.eu header.s=mail header.b=YZKV/WnU;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.100, mailfrom: jasper@fancydomain.eu)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1692623456;
	bh=elvCSkEnpnILfxiL4NdcnhTyS1I2xP7V2efisiDjHps=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=YZKV/WnUWFjCI5wCkThPkjUz79Hhgyhg1s2OMZfOJT0LO8KPVoJ63qznw9JwgnMDb
	 74LEwgTsZBJ7cfjNL0NcxavcHWluYB77YSwacZOkAyTcfy3H3xrzNLlElsC928+9aI
	 fsBJu6MkIWxLe/05O9/XqsA3dNNZc3MLgJ7G9K7xosHvttFrW9sBZLIT8PdN82QnpP
	 AyWhVNaLGi3YPp/U7Z7IRk8Q7mp4R1Bm7kSj1c+122jUSChQgyDPTc6ttceunFaTGq
	 uHw+33q/DDkS4dl+cjmtZ5/ZsMRf/YRBnCcIZDZqrZuw9dwh5lnRJ8Qqhvbc7wQH3T
	 jHD6t+HuzcMhw==
Date: Mon, 21 Aug 2023 15:10:55 +0200
From: jasper@fancydomain.eu
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Jasper Orschulko via lists.openembedded.org"
 <jasper=fancydomain.eu@lists.openembedded.org>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve_check: Fix cpe_id generation
In-Reply-To: <20230821141054.4f13eb78@booty>
References: <20230821120230.29184-1-jasper@fancydomain.eu>
 <20230821141054.4f13eb78@booty>
Message-ID: <eae9910df37ae0898d72882deb3cce88@fancydomain.eu>
X-Sender: jasper@fancydomain.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 13:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186439

Hi Luca,

thanks for the heads-up. That's curious, I assumed this would not be a 
problem as my signing email address is the same as the from address?

(mbox) Adding cc: Jasper Orschulko <jasper@fancydomain.eu> from line 
'From: Jasper Orschulko <jasper@fancydomain.eu>'
(body) Adding cc: Jasper Orschulko <jasper@fancydomain.eu> from line 
'Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>'

Oh well, I added an explicit sendemail.from configuration to my 
gitconfig. I will send backport patches once this is merged in master, 
so we'll see if that had the desired effect.

Jasper

On 2023-08-21 14:10, Luca Ceresoli wrote:
> Hello Jasper,
> 
> On Mon, 21 Aug 2023 14:02:30 +0200
> "Jasper Orschulko via lists.openembedded.org"
> <jasper=fancydomain.eu@lists.openembedded.org> wrote:
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> As you can see your sender address has been mangled, and as a result
> the patch is rejected by the the openembedded git server. This is not
> your fault, but we need you to modify your git configuration to prevent
> this from happening in the future. Have a look at the wiki for more
> info and how to solve that:
> 
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity
> 
> I'm taking your patch for testing on the autobuilders fixing it
> manually so you don't need to resend your patch this time.
> 
> Luca

