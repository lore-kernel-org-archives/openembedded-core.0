Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0828BC636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 09:47:57 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.10840.1676281675277611440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 01:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout08.t-online.de (Postfix) with SMTP id C54A31E8A2;
	Mon, 13 Feb 2023 10:47:25 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.111]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRVQj-1JJFcO0; Mon, 13 Feb 2023 10:47:25 +0100
Date: Mon, 13 Feb 2023 10:47:19 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] graphene: disable neon support on arm 32bits
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Pablo Saavedra
	<psaavedra@igalia.com>, Khem Raj <raj.khem@gmail.com>
Message-Id: <V6J0QR.2R35TSZ0OM8J3@t-online.de>
In-Reply-To: 
	<99d270db661ec96c2e6f5a864962aaade7fd7887.camel@linuxfoundation.org>
References: <20230211082609.6471-1-f_l_k@t-online.de>
	<99d270db661ec96c2e6f5a864962aaade7fd7887.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Z+z8iGB7sSt3fUOCqsls"
X-TOI-EXPURGATEID: 150726::1676281645-DDB4A4E4-042D59CA/0/0 CLEAN NORMAL
X-TOI-MSGID: 177ce6db-a9d9-414a-ad3f-8ad3f31272c6
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 09:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177087

--=-Z+z8iGB7sSt3fUOCqsls
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Sa, 11. Feb 2023 um 09:05:05 +0000 schrieb Richard Purdie 
<richard.purdie@linuxfoundation.org>:
> Can we tweak the comment to say why? Saying what it does isn't that
> useful, saying why it does it helps to understand when it may be
> removed in future. An example of how to crash it would be even better.
> Was this just some some subset of 32 bit arm or all 32 bit arm?
> 
> Cheers,
> 
> Richard

Hello Richard,

I'm not affected by this bug, none of my machines has it but probably  
the underlying problem is, that there are still issues with neon 
runtime detection and not all arm platforms are guaranteed to have NEON 
available. That said, maybe it would be better to add this as a 
PACKAGECONFIG, so people could at least manually enable neon support if 
they know it would be working for them?


--=-Z+z8iGB7sSt3fUOCqsls
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Sa, 11. Feb 2023 um 09:05:05 +0000 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Can we tweak the comment to say why? Saying what it does isn't that
useful, saying why it does it helps to understand when it may be
removed in future. An example of how to crash it would be even better.
Was this just some some subset of 32 bit arm or all 32 bit arm?

Cheers,

Richard</div></blockquote><div><br></div><div>Hello Richard,</div><div><br></div><div>I'm not affected by this bug, none of my machines has it but probably &nbsp;the underlying problem is, that there are still issues with neon runtime detection and not all arm platforms are guaranteed to have NEON available. That said, maybe it would be better to add this as a PACKAGECONFIG, so people could at least manually enable neon support if they know it would be working for them?</div></div>
--=-Z+z8iGB7sSt3fUOCqsls--


