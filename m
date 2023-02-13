Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8388EC636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 18:07:59 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.22488.1676311669014716894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 10:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout07.t-online.de (Postfix) with SMTP id 203FC12AF1;
	Mon, 13 Feb 2023 19:07:18 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.111]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRdET-2gM2Pw0; Mon, 13 Feb 2023 19:07:17 +0100
Date: Mon, 13 Feb 2023 19:07:11 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv4] graphene: add a PACKAGECONFIG for arm_neon
To: Bastian Krause <bst@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <ZB61QR.9SY70KT4XW8L@t-online.de>
In-Reply-To: <4fedc2d9-6eba-a4ff-b5cb-0496caca9eda@pengutronix.de>
References: <20230213120407.1092455-1-f_l_k@t-online.de>
	<4fedc2d9-6eba-a4ff-b5cb-0496caca9eda@pengutronix.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-lEfTXMdu7ZIEImL9BJ1L"
X-TOI-EXPURGATEID: 150726::1676311637-DA6182C4-84791DEB/0/0 CLEAN NORMAL
X-TOI-MSGID: df0582b4-b844-42ab-93b9-f199052afe7c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 18:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177108

--=-lEfTXMdu7ZIEImL9BJ1L
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 13. Feb 2023 um 17:14:16 +0100 schrieb Bastian Krause 
<bst@pengutronix.de>:
> 0e0849cd1 ("graphene: disable neon support on arm 32bits") from 
> meta-oe
> needs to be reverted to make this patch work, right?

I guess we need to completely remove the recipe from meta-oe but I 
already sent a patch for that


--=-lEfTXMdu7ZIEImL9BJ1L
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 13. Feb 2023 um 17:14:16 +0100 schrieb Bastian Krause &lt;bst@pengutronix.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">0e0849cd1 ("graphene: disable neon support on arm 32bits") from meta-oe
needs to be reverted to make this patch work, right?</div></blockquote><div><br></div><div>I guess we need to completely remove the recipe from meta-oe but I already sent a patch for that</div></div>
--=-lEfTXMdu7ZIEImL9BJ1L--


