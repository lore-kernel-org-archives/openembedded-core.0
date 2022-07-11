Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92065C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 19:27:54 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web09.9.1657567664461021595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 12:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=W73r1xHP;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from Seans-MBP.hadsten (unknown [185.233.254.173])
	by first.geanix.com (Postfix) with ESMTPSA id E0433E9047;
	Mon, 11 Jul 2022 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1657567661; bh=Vhe39UErl4LC4aoHP0dsg1IAKyrFM47dbd+TgJSqyrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W73r1xHPfLocuebnbsGZDQ1UCQSQc4jutcndkZE19oxj4OcMzzvM2eYxI7olj1FOz
	 wHjyVgOu/WA7mRR65R8tkiFR7Kwcj5adAp8bXH5slEQBixrNmvYfnjUSFINaJuK6cg
	 sMya+YpTEoWm2TPhpj+/1U9rk+Fgfa/N3pemuP90CKejWkvzcZVtt10RqqzwiGZl6p
	 zzd0dXaAQaY7jhP4qKTR65Pwv5Jz4hAd20JhNheGzbO7VIIzZKYBCfJDnIzKebL0kF
	 zzmRd0r3V+lmhGzm71RUnrfNnWO0IJOkjsVsPZ2tVCAH/NbTzG9UCnMOU6dhVM6lIa
	 q7Nmo7trxi5nw==
Date: Mon, 11 Jul 2022 21:27:40 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] zlib: split src_uri into inc file
Message-ID: <20220711192740.yqa3kdfkvrxt4hib@Seans-MBP.hadsten>
References: <20220711083309.1749253-1-sean@geanix.com>
 <CAMKF1sry2PHb52OyVBFSwFnnuHVB4g5rY-te_-BKjq4uQ0onsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: 
 <CAMKF1sry2PHb52OyVBFSwFnnuHVB4g5rY-te_-BKjq4uQ0onsQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 19:27:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167879

On Mon, Jul 11, 2022 at 07:07:38PM +0100, Khem Raj wrote:
> We are in process of merging the inc files can you cite reasons why we want
> to split it
> 

@Khem:
Inside the zlib artifact resides a contrib directory that contains more
libs, one of them minizip are we using in our project.

/Sean

