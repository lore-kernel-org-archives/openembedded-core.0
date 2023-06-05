Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E71C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:30:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.1913.1685950219097695016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=TmmGWA8k;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: sbabic@denx.de)
Received: from [IPV6:2001:a61:6143:6401:caa7:bce6:5adc:67e2] (unknown [IPv6:2001:a61:6143:6401:caa7:bce6:5adc:67e2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbabic@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 958028464D;
	Mon,  5 Jun 2023 09:30:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1685950216;
	bh=USDsQgmqCayVwn842yOCI9ZImr2GL6g+aoejBovEzg4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TmmGWA8k7i1AFKFIReIiFG3UHsW6TON0/rotxLRJ+DBS7rJg++MWiqnzXRnpHvDVI
	 +iJQp0M0XVr55qD2DlGanxJO8TvDHMZ5R9u2rVcFm+gQP8FyO1qEpsEyBMkrm+eV1K
	 0hy+gI3gNPUeVqw/ZEijCYhpG1Gm3n4Zp6+Xjb/FVj/xx2v8YX8p79YB4BuR0osw3N
	 n+tVBmSGhoYUIsnx99i8N0t75b9816jfLv6JmLjpzC8YgRsMTzBMVH2ThNvyq2QOGh
	 PFSh5npa7seKE8LGT3DSTb+08S4CXy6/iwBD6qtm8trTnefr3TuQzBb85GRC/h3nEq
	 aYtyJ1q6KiShg==
Message-ID: <d559b9cb-d0a6-bde3-b68d-2e4a1345bd30@denx.de>
Date: Mon, 5 Jun 2023 09:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH] libubootenv: upgrade 0.3.3 -> 0.3.4
To: alexandre.belloni@bootlin.com, Stefano Babic <sbabic@denx.de>
Cc: openembedded-core@lists.openembedded.org
References: <20230602112737.28608-1-sbabic@denx.de>
 <20230604203324a71d55c7@mail.local>
Content-Language: de-DE
From: Stefano Babic <sbabic@denx.de>
In-Reply-To: <20230604203324a71d55c7@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 07:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182373

Hi Alexandre,

On 04.06.23 22:33, Alexandre Belloni via lists.openembedded.org wrote:
> Hello Stefano,
> 
> This caused the following failure:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7124/steps/12/logs/stdio
> 

Thanks and sorry, my fault, I send a V2 to fix it.

Regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich,   Office: Kirchenstr.5, 82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================


