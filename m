Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7186EC2BA15
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 06:41:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.80410.1718692840668058950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 23:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MmHPFY4F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99814E0007;
	Tue, 18 Jun 2024 06:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718692839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lesa+T4cry89M+zWoLpmtEKYEF0q76U8Yi+XUCNjbWY=;
	b=MmHPFY4FouGRQXP1kYsVTI+w/RfruLmXduKmM+Fhc+buSHND+VUWp5jSDVyP5jg2kUgAp0
	49baBIjdUo9WWMmgT4KCiJ4EOgE2OSJ2C116/2tB9RBVlVPIp3M7qV1gzUH55fFN3RipoT
	TwfxGNT8X2aR0cqA/46/8qxpP2FBdKvTco6/DM9LvIV0Q19TVMl3KjCIvB1mrh+Hl9GTI1
	0iMPnljxwdt2YHn9SYLUe6etbxaqaeYSboNARizbVjIKncIFBrG5h5U12B5T/WO/D+vx/Y
	5QCxL8s/Brpngi1H50VrU0nfjsoqK+1M3/bXvPp+CdsQqIi+p4dRMoJ+TLN3Wg==
Date: Tue, 18 Jun 2024 08:40:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: kai.kang@windriver.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 0/1] Update for gfortran
Message-ID: <202406180640385120dfe3@mail.local>
References: <20240616153135.3058410-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616153135.3058410-1-kai.kang@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 06:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200856

You must always resend the whole series, else ths patch is not
applicable as-is. The work must be on your side, not on the maintainer's
side.

On 16/06/2024 23:31:34+0800, Kai Kang via lists.openembedded.org wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> v3:
> * update INSANE_SKIP for ${MLPREFIX}gfortran
> 
> v2:
> * add sub-package gfortran conditionally
> 
> 
> Kai Kang (1):
>   gfortran: update runtime dependencies
> 
>  meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200779): https://lists.openembedded.org/g/openembedded-core/message/200779
> Mute This Topic: https://lists.openembedded.org/mt/106704989/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

