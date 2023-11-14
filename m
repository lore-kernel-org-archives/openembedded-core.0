Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9B0C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 11:05:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.10231.1699959891999505312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 03:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ytl+7ec4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3676D1C0009;
	Tue, 14 Nov 2023 11:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699959889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uH+siq9AKo9pFzwSbZOcCRh0BIib5ulNNuqiVPdZ8+k=;
	b=Ytl+7ec4b5xZ3JS001AgO3Ne+sNV2O6Tgiz4Hx9xR4bySRpA19NBuSHfnlpdBLGfdFrbR0
	Ieu0743sF0VEDPtxdWxtMdHdOMG9b7+cZwkhujM95hBaZcB6P6jwExYHjTWv0H6icnwzl/
	XwPHvQGrr3IpgeJowsQ5fcd+VVC+mGsl8wMsKv5JN42nfFMUfKNS3pMmL8hwFiqPvVK6/D
	M+a8s4QhDqC8OUk1lnrInegMvL9ANFSNAoa79alSVG7pZrWOoOamYwNJ/cX84her10j7ag
	2HdumnmSej9YhufQv5DWq9aIh4nsecPpYvn6Kw085rtgkg6kVTkk5m3w80OBYg==
Date: Tue, 14 Nov 2023 12:04:48 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org,
	Malte Schmidt <malte.schmidt@weidmueller.com>
Subject: Re: [OE-Core][PATCH v3] wic: rawcopy: add support for zsdt
 decompression
Message-ID: <2023111411044866684d1d@mail.local>
References: <20231113140154.1048359-1-lukas.funke-oss@weidmueller.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113140154.1048359-1-lukas.funke-oss@weidmueller.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 11:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190498

On 13/11/2023 15:01:54+0100, Lukas Funke wrote:
> From: Malte Schmidt <malte.schmidt@weidmueller.com>
> 

Please include a commit message and don't forget SoB's

> ---
>  scripts/lib/wic/plugins/source/rawcopy.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
> index 7c90cd3cf8..82d38fbb84 100644
> --- a/scripts/lib/wic/plugins/source/rawcopy.py
> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
> @@ -52,7 +52,8 @@ class RawCopyPlugin(SourcePlugin):
>          decompressor = {
>              ".bz2": "bzip2",
>              ".gz": "gzip",
> -            ".xz": "xz"
> +            ".xz": "xz",
> +            ".zst": "zstd -f",
>          }.get(extension)
>          if not decompressor:
>              raise WicError("Not supported compressor filename extension: %s" % extension)
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190473): https://lists.openembedded.org/g/openembedded-core/message/190473
> Mute This Topic: https://lists.openembedded.org/mt/102561555/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

