Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2D7C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 13:34:30 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.117900.1669642467654643483
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 05:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout09.t-online.de (Postfix) with SMTP id AD201DCE1;
	Mon, 28 Nov 2022 14:34:25 +0100 (CET)
Received: from [192.168.178.83] ([84.163.35.123]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozeHB-0HNefQ0; Mon, 28 Nov 2022 14:34:25 +0100
Date: Mon, 28 Nov 2022 14:34:19 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <7D82MR.61VA0LZXWI583@t-online.de>
In-Reply-To: 
	<CANNYZj_PxabL7ZKO8cu8UBGgV7MA9c0q4jvKiRS2pKtQYuqWvA@mail.gmail.com>
References: <20221128112232.123025-1-f_l_k@t-online.de>
	<CANNYZj9OzcCqoC9=cDcMVPDc85KZbuWuksekUgg0YhDWsG+TrQ@mail.gmail.com>
	<2732MR.ANT1XFWZ05B13@t-online.de>
	<CANNYZj9nZc6U8ojtShu7DO8qBfzF0a15qUEHBQ1VmZDhe335_w@mail.gmail.com>
	<ZB42MR.U9I5BNKLFJN32@t-online.de>
	<CANNYZj_PxabL7ZKO8cu8UBGgV7MA9c0q4jvKiRS2pKtQYuqWvA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-2rEFx+cSur8bE/LCPQ9v"
X-TOI-EXPURGATEID: 150726::1669642465-C8C8BB6F-F084E447/0/0 CLEAN NORMAL
X-TOI-MSGID: b4e0563f-32c4-43f0-a66b-bde655ecc3d8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 13:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173916

--=-2rEFx+cSur8bE/LCPQ9v
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 28. Nov 2022 um 14:13:36 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> We have plenty of options everywhere that are disabled specifically 
> because there is no easy way to activate them.

Fair enough. I've sent a v3 that completely removes the ssh_agent 
settings and includes your patch


--=-2rEFx+cSur8bE/LCPQ9v
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 28. Nov 2022 um 14:13:36 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite">We have plenty of options everywhere that are disabled specifically because there is no easy way to activate them.</blockquote><div><br></div><div>Fair enough. I've sent a v3 that completely removes the ssh_agent settings and includes your patch</div></div>
--=-2rEFx+cSur8bE/LCPQ9v--


