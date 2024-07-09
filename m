Return-Path: <niko.mauno@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11C4C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 17:13:48 +0000 (UTC)
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
 by mx.groups.io with SMTP id smtpd.web10.1471.1720545220236221953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 10:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@runbox.com header.s=selector2 header.b=PIiCgSAJ;
 spf=pass (domain: runbox.com, ip: 185.226.149.37, mailfrom: realint@runbox.com)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <realint@runbox.com>)
	id 1sREPK-004IHd-6L
	for openembedded-core@lists.openembedded.org; Tue, 09 Jul 2024 19:13:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID;
	bh=weODGYSA1ZCua+8tWRRx8FkCqflf0B4BY3cwsiMZZFE=; b=PIiCgSAJToSYFuIW8X26pmuSjd
	0zfs3SnXeSXJzVasay+MSd3Du0aOikIVY47PfcBED7dBgp0rNMjRMYlBXFHhzCG2zEP/pBYR9DZS5
	z+0hTGqZC3wePxNbUktaEZJcg1M6KApKyS4X4h/y7r3SLI54UHk/TiV8CKG8E/fHiKWiyw23xoXMB
	Fzp/K7Y4V+74q1J/RZNNArgS+3idVcUG2P0L8D5n7oDR3Z0JdfHWrNXGe/NGN76cWalsXiOU7SqbE
	w9Mn+eTdX3i1lveVQ6e0ibbNhBUZTY5YKjgNssZYxAV4jf6UwoM7MxfEq5Ov7raMytJy85vzFipu4
	1Gos3ecQ==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <realint@runbox.com>)
	id 1sREPH-0002pD-Ie; Tue, 09 Jul 2024 19:13:37 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1051538)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1sREOy-006q15-TA; Tue, 09 Jul 2024 19:13:16 +0200
Message-ID: <74e2418a-821f-4648-8342-314d8377544d@runbox.com>
Date: Tue, 9 Jul 2024 20:13:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: niko.mauno@iki.fi
Subject: Re: [OE-core] [PATCH] Fix missing leading whitespace with ':append'
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 alexandre.belloni@bootlin.com, niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
References: <20240709120209.65344-1-niko.mauno@vaisala.com>
 <20240709141043a4c14363@mail.local>
 <e2968d625ce5192dba1ecc02242509f8fc24dcc6.camel@linuxfoundation.org>
From: Niko Mauno <realint@runbox.com>
Content-Language: en-US
In-Reply-To: <e2968d625ce5192dba1ecc02242509f8fc24dcc6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 17:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201670

On 7/9/24 18:43, Richard Purdie wrote:
> On Tue, 2024-07-09 at 16:10 +0200, Alexandre Belloni via
> lists.openembedded.org wrote:
>> Hello,
>>
>> Can you submit one patch per recipe?
> 
> FWIW I tweaked the shortlog prefix in master-next to mesa/dnf: which
> resolves this case.
> 
> Cheers,
> 
> Richard

Apologies, I failed to realize this before submitting a v2 of the commit 
as a series of two separate patches.
Please ignore it.

- Niko

