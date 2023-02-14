Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC3AC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 05:46:02 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.477.1676353553468016034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 21:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout11.t-online.de (Postfix) with SMTP id 3C837195E7;
	Tue, 14 Feb 2023 06:45:51 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.220]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRo8Q-3WEmXI0; Tue, 14 Feb 2023 06:45:46 +0100
Date: Tue, 14 Feb 2023 06:45:40 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] graphene: disable neon support on arm 32bits
To: alexandre.belloni@bootlin.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org, Pablo Saavedra
	<psaavedra@igalia.com>, Khem Raj <raj.khem@gmail.com>
Message-Id: <4O22QR.JSAA3JUUJ5Y71@t-online.de>
In-Reply-To: <Y+qmcQVCcJ4F5LOA@mail.local>
References: <20230211082609.6471-1-f_l_k@t-online.de>
	<99d270db661ec96c2e6f5a864962aaade7fd7887.camel@linuxfoundation.org>
	<V6J0QR.2R35TSZ0OM8J3@t-online.de> <Y+qmcQVCcJ4F5LOA@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BklFCW4ZZLGDP4e+qSJK"
X-TOI-EXPURGATEID: 150726::1676353546-CDFFB046-A342C127/0/0 CLEAN NORMAL
X-TOI-MSGID: 31f85713-bbcd-4b73-a012-8daf053d1330
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 05:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177122

--=-BklFCW4ZZLGDP4e+qSJK
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 13. Feb 2023 um 22:06:57 +0100 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> 
> Can't we get that out of the tune?

The problem I see is that we would need to know for sure what works and 
what doesn't.


--=-BklFCW4ZZLGDP4e+qSJK
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 13. Feb 2023 um 22:06:57 +0100 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
Can't we get that out of the tune?</div></blockquote><div><br></div><div>The problem I see is that we would need to know for sure what works and what doesn't.</div></div>
--=-BklFCW4ZZLGDP4e+qSJK--


