Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECACDC64ED8
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 20:04:40 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.774.1677182678428783695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 12:04:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 9F3FD49DDA;
	Thu, 23 Feb 2023 21:04:35 +0100 (CET)
Received: from [192.168.178.83] ([79.219.239.43]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pVHpT-2B73ui0; Thu, 23 Feb 2023 21:04:35 +0100
Date: Thu, 23 Feb 2023 21:04:29 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv4] vte: update 0.70.2 -> 0.70.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <HFUJQR.91EYCKKAYQ3R3@t-online.de>
In-Reply-To: 
	<CANNYZj96mFc9LN_R-Mn+6tzrNwW1TKr14bf6+1PaModzF+8gWA@mail.gmail.com>
References: <20230223191937.1215699-1-f_l_k@t-online.de>
	<CANNYZj96mFc9LN_R-Mn+6tzrNwW1TKr14bf6+1PaModzF+8gWA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-DyFgo4ImosVKwiiGvpV9"
X-TOI-EXPURGATEID: 150726::1677182675-B7BA6DF7-3F1DD20B/0/0 CLEAN NORMAL
X-TOI-MSGID: 081ba7d8-b4f1-4f06-862f-40f6aa8dcee1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 20:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177626

--=-DyFgo4ImosVKwiiGvpV9
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 23. Feb 2023 um 20:46:03 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Why does gtk4 need to be removed as well in this case?

Because gtk4 is not allowed to build for nativesdk yet, only for 
native. I've tested that it'll work, if 'nativesdk' is added to 
BBCLASSEXTEND for gtk4, xkeyboard-config and libxkbcommon

> you need to use GI_DATA_ENABLED variable instead here.

Aah, thanks


--=-DyFgo4ImosVKwiiGvpV9
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 23. Feb 2023 um 20:46:03 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Why does gtk4 need to be removed as well in this case?</div></blockquote><div><br></div><div>Because gtk4 is not allowed to build for nativesdk yet, only for native. I've tested that it'll work, if 'nativesdk' is added to BBCLASSEXTEND for gtk4, xkeyboard-config and libxkbcommon</div><div><br></div><div><div id="geary-body" dir="auto"><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">you need to use GI_DATA_ENABLED variable instead here.</div></blockquote><div><div class="plaintext" style="white-space: break-spaces;"><br></div></div><div class="plaintext" style="white-space: break-spaces;">Aah, thanks</div></div></div></div>
--=-DyFgo4ImosVKwiiGvpV9--


