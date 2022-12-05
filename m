Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32579C4708C
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 23:30:08 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.32501.1670283002811450582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 15:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout01.t-online.de (Postfix) with SMTP id BA0D63ACE;
	Tue,  6 Dec 2022 00:29:59 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.205]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2KuI-0QEnKq0; Tue, 6 Dec 2022 00:29:54 +0100
Date: Tue, 06 Dec 2022 00:29:48 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gstreamer-vaapi: rename USE_X11 variable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <OLYFMR.XRLL6VOXMZI4@t-online.de>
In-Reply-To: 
	<febe3d80e804684b2cd8f1be280bca7193e8ff9c.camel@linuxfoundation.org>
References: <20221205201330.2184787-1-f_l_k@t-online.de>
	<febe3d80e804684b2cd8f1be280bca7193e8ff9c.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-1WqU/a1mNd5VLg8g2jfI"
X-TOI-EXPURGATEID: 150726::1670282994-2EFF8535-FC31877D/0/0 CLEAN NORMAL
X-TOI-MSGID: 71f8a284-3c08-4a84-a1fe-fd209d5acdd8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 23:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174312

--=-1WqU/a1mNd5VLg8g2jfI
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 5. Dez 2022 um 22:30:38 +0000 schrieb Richard Purdie 
<richard.purdie@linuxfoundation.org>:
> FWIW I do agree with Alex, we can't afford to carry a patch like this
> ourselves and we should discuss it with upstream as it is presumably
> something they'd want to fix. If they reject it for some reason, that
> is a different discussion.

I agree on this point as well. I marked the patch as inappropriate 
because I see some more problems here, such as options that should be 
boolean and are defined as strings, or the uppercase variables in 
general, most of which at least are common enough to possibly cause 
unwanted magic. This patch feels like replacing one hack with another. 
True, there would be something to discuss.
I'd have to be in the right mood for this. At least today I'm not.


--=-1WqU/a1mNd5VLg8g2jfI
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 5. Dez 2022 um 22:30:38 +0000 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">FWIW I do agree with Alex, we can't afford to carry a patch like this
ourselves and we should discuss it with upstream as it is presumably
something they'd want to fix. If they reject it for some reason, that
is a different discussion.</div></blockquote><div><br></div><div><div>I agree on this point as well. I marked the patch as inappropriate because I see some more problems here, such as options that should be boolean and are defined as strings, or the uppercase variables in general, most of which at least are common enough to possibly cause unwanted magic. This patch feels like replacing one hack with another. True, there would be something to discuss.</div><div>I'd have to be in the right mood for this. At least today I'm not.</div></div></div>
--=-1WqU/a1mNd5VLg8g2jfI--


