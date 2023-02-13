Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A74C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 11:00:27 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.11725.1676286017956940500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 03:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout05.t-online.de (Postfix) with SMTP id 042C61C635;
	Mon, 13 Feb 2023 12:00:16 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.111]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRWZC-0f8jfE0; Mon, 13 Feb 2023 12:00:14 +0100
Date: Mon, 13 Feb 2023 12:00:08 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] graphene: add a PACKAGECONFIG for arm_neon
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <8KM0QR.NK5UM1EJ34HH3@t-online.de>
In-Reply-To: 
	<CANNYZj8KiZfFD6-BvTNv5oSQ5pNg_KX7_qF1hfNpip8WLM=G-g@mail.gmail.com>
References: <20230213104228.1067057-1-f_l_k@t-online.de>
	<CANNYZj8KiZfFD6-BvTNv5oSQ5pNg_KX7_qF1hfNpip8WLM=G-g@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-nJaIpaR+p2+uFamgsNEt"
X-TOI-EXPURGATEID: 150726::1676286014-42FEBC4D-8215517B/0/0 CLEAN NORMAL
X-TOI-MSGID: 97e57a5c-55e9-4877-a31f-5378c965617e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 11:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177097

--=-nJaIpaR+p2+uFamgsNEt
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 13. Feb 2023 um 11:45:45 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Can you verify
> the final value on aarch64?

You are absolutely right. ?= negates the introspection. I wasn't 
expecting that and was just checking to see if neon was properly 
activated.
What would be the best way to handle this? Since oe-core should be kept 
free of :append, just remove the '?'.


--=-nJaIpaR+p2+uFamgsNEt
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 13. Feb 2023 um 11:45:45 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Can you verify
the final value on aarch64?</div></blockquote><div><br></div><div><div>You are absolutely right. ?= negates the introspection. I wasn't expecting that and was just checking to see if neon was properly activated.</div><div>What would be the best way to handle this? Since oe-core should be kept free of :append, just remove the '?'.</div></div></div>
--=-nJaIpaR+p2+uFamgsNEt--


