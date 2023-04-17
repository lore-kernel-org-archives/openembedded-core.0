Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40890C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:47:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.48477.1681717617526820166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f7P5GMlt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0A5E4C0015;
	Mon, 17 Apr 2023 07:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681717615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCCs8dFSO1BCntaawdTIUCuyRk6DGszMxFr5EwEu+9I=;
	b=f7P5GMltXoBzb5FK03y6QYVG6i+xYeVAbLf/Jww/nQowIBXCXRtDu/J4tR7+ddwLfyz3WB
	3N7U7mLBDWrhrg2h9ASPZSwKkPOKef38Ujk+4DYuUdrORk/nvHflujI+UeioMUMDzVm0hw
	cDBVWK661HryDF9BA/IYa8nB47+8/H2YdcHACi4IUdMAAcbWMG+HVtabpdTtxuGQcTk+14
	Btrekr8FlDcKT+4TXIYEOiF3b1EctA+HICHFOOkJ/8E+P2hBso8PQ0S3sJFy5TdiK3QCbJ
	Zp7g8Pcq3nxoqUd2jd0ulWcuVv0y2uZqGeHcnCOwfIUKZnELaU2caKcjxPYs/w==
Date: Mon, 17 Apr 2023 09:46:53 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe] [meta-oe] [PATCH] capnproto: upgrade 0.10.3 ->
 0.10.4
Message-ID: <20230417094653.4f70d231@booty>
In-Reply-To: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
References: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180145

Hello wangmy,

On Mon, 17 Apr 2023 14:37:35 +0800
"wangmy" <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../capnproto/{capnproto_0.10.3.bb => capnproto_0.10.4.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/capnproto/{capnproto_0.10.3.bb => capnproto_0.10.4.bb} (90%)

You have sent several patches today, but they all should be sent to
meta-oe instead of oe-core.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

