Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACD3C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 07:52:18 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.5957.1677138728872954548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 23:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id A246D1A8C2;
	Thu, 23 Feb 2023 08:52:06 +0100 (CET)
Received: from [192.168.178.83] ([79.219.239.43]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pV6Oc-3tV43U0; Thu, 23 Feb 2023 08:52:06 +0100
Date: Thu, 23 Feb 2023 08:52:01 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] vte: update 0.70.2 -> 0.70.3
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <PIWIQR.1DAESNVLMIYE1@t-online.de>
In-Reply-To: <Y/aoV7gBf9t0z53M@mail.local>
References: <20230222114847.3421468-1-f_l_k@t-online.de>
	<Y/aoV7gBf9t0z53M@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-4D8k7n68HkC4H4edwK7Q"
X-TOI-EXPURGATEID: 150726::1677138726-82AE9D99-4E4B40EB/0/0 CLEAN NORMAL
X-TOI-MSGID: 14218ba9-4e2e-4b71-a300-6e4c6ed0f01e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 07:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177604

--=-4D8k7n68HkC4H4edwK7Q
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 23. Feb 2023 um 00:42:15 +0100 schrieb Alexandre Belloni 
<alexandre.belloni@bootlin.com>:
> This fails on musl:

I've missinterpreted that this patch is not needed anymore
0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch

After following the conversation Ross Burton started some years ago it 
turned out, that the issue is 'wont fix', because the vte maintainer 
refuses to support musl.

Adding back the patch fixes the issue


--=-4D8k7n68HkC4H4edwK7Q
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 23. Feb 2023 um 00:42:15 +0100 schrieb Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This fails on musl:</div></blockquote><div><br></div><div><div>I've missinterpreted that this patch is not needed anymore</div><div>0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch</div><div><br></div><div>After following the conversation Ross Burton started some years ago it turned out, that the issue is 'wont fix', because the vte maintainer refuses to support musl.</div><div><br></div><div>Adding back the patch fixes the issue</div></div></div>
--=-4D8k7n68HkC4H4edwK7Q--


