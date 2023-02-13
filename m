Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97722C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 11:25:37 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.12091.1676287536258327083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 03:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 74B4914F14;
	Mon, 13 Feb 2023 12:25:10 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.111]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRWxJ-3723ay0; Mon, 13 Feb 2023 12:25:09 +0100
Date: Mon, 13 Feb 2023 12:25:03 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] graphene: add a PACKAGECONFIG for arm_neon
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <RPN0QR.78GW1EDG5GW2@t-online.de>
In-Reply-To: <17435D409BDFDC2E.12482@lists.openembedded.org>
References: <20230213104228.1067057-1-f_l_k@t-online.de>
	<CANNYZj8KiZfFD6-BvTNv5oSQ5pNg_KX7_qF1hfNpip8WLM=G-g@mail.gmail.com>
	<17435D409BDFDC2E.12482@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ziaD4jXeDgoKTQla93Ii"
X-TOI-EXPURGATEID: 150726::1676287509-812ECD99-900C1C47/0/0 CLEAN NORMAL
X-TOI-MSGID: 69b96a17-d513-4f7b-9d69-71805a4448a1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 11:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177098

--=-ziaD4jXeDgoKTQla93Ii
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 13. Feb 2023 um 12:00:08 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> just remove the '?'

No. That didn't help either.

The only way that seems to work for me is:
PACKAGECONFIG:append:aarch64 = " neon"


--=-ziaD4jXeDgoKTQla93Ii
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 13. Feb 2023 um 12:00:08 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite">just remove the '?'</blockquote><div><br></div>No. That didn't help either.<br><div><br></div><div>The only way that seems to work for me is:</div><div>PACKAGECONFIG:append:aarch64 = " neon"&nbsp;</div></div>
--=-ziaD4jXeDgoKTQla93Ii--


