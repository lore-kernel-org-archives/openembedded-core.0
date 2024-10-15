Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75142D1D88F
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:01:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.3194.1729014217216867731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 10:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=ezyjSCVA;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: festevam@denx.de)
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E555E88703;
	Tue, 15 Oct 2024 19:43:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729014215;
	bh=6TltV29QWhQY0EGzl/QrmCNKp+2DBXbNeifZz/lk6D0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ezyjSCVAV8sMNWe0IaCPO+m0Elo1FLAYR0hiCxj6kKoUznkRJAwq33RCvoOgbBft7
	 90+tD49VWRr9ti5vb/5KwT/W73qiDSufMl9N8p6umBdbk9Se1cFL20S8xqBHYjl17u
	 tSXsW7p59PpmY9bhfI4cLKq/yb9AmeF1bnZnE4uqZw3+up9mYRwF6Z3Dh2gZZRjYve
	 FTm5Jxm3IHKkPSfOe39otGdGQlmw3Grt3l2dtlp11GtFnhNqgQt6bqFs3fic/x9C0S
	 pcspraO9P8IbrbP3JQ2CyzWnpioZhZ6H4EvudHqoB45xJz00Kb3jGgtcXHzrg5qbZ3
	 5/X1jovNrqbnw==
MIME-Version: 1.0
Date: Tue, 15 Oct 2024 14:43:34 -0300
From: "Fabio Estevam" <festevam@denx.de>
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] maintainers: Switch U-Boot to Fabio
In-Reply-To: <20241015161133.11326-1-marex@denx.de>
References: <20241015161133.11326-1-marex@denx.de>
Message-ID: <eae857c01ea81087894cd341fbaa6a28@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205922

Hi Marek,

On 15/10/2024 13:11, Marek Vasut wrote:
> Fabio has been keeping the U-Boot recipe up to date for a long time
> in a timely manner, doing a great job there, update the maintainers
> file.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Fabio Estevam <festevam@denx.de>

Thanks

