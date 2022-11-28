Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0096CC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 12:07:29 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.116071.1669637240210060922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 04:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout04.t-online.de (Postfix) with SMTP id 602BE5CD1;
	Mon, 28 Nov 2022 13:07:18 +0100 (CET)
Received: from [192.168.178.83] ([84.163.35.123]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozcur-4S8OyO0; Mon, 28 Nov 2022 13:07:17 +0100
Date: Mon, 28 Nov 2022 13:07:11 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <ZB42MR.U9I5BNKLFJN32@t-online.de>
In-Reply-To: 
	<CANNYZj9nZc6U8ojtShu7DO8qBfzF0a15qUEHBQ1VmZDhe335_w@mail.gmail.com>
References: <20221128112232.123025-1-f_l_k@t-online.de>
	<CANNYZj9OzcCqoC9=cDcMVPDc85KZbuWuksekUgg0YhDWsG+TrQ@mail.gmail.com>
	<2732MR.ANT1XFWZ05B13@t-online.de>
	<CANNYZj9nZc6U8ojtShu7DO8qBfzF0a15qUEHBQ1VmZDhe335_w@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oXaeRPnn5xF6IBkyWYu0"
X-TOI-EXPURGATEID: 150726::1669637237-62A0A2DC-A292E8EF/0/0 CLEAN NORMAL
X-TOI-MSGID: e9d64411-116a-44ab-bd74-acef67ec66ac
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 12:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173913

--=-oXaeRPnn5xF6IBkyWYu0
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 28. Nov 2022 um 12:45:54 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> For gcr I suppose we can just disable the ssh stuff if it's not
> strictly required.

I've noticed that you sent a patch to gcr that would fix it but 4.0.0 
will presumably still search for the external ssh programs even if 
ssh_agent is disabled.

It's an optional feature, but not being able to activate it feels like 
a hack as well to me.


--=-oXaeRPnn5xF6IBkyWYu0
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 28. Nov 2022 um 12:45:54 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">For gcr I suppose we can just disable the ssh stuff if it's not
strictly required.</div></blockquote><span style="white-space: break-spaces;"><br></span><div><div>I've noticed that you sent a patch to gcr that would fix it but 4.0.0 will presumably still search for the external ssh programs even if ssh_agent is disabled.</div></div><div><br></div><div>It's an optional feature, but not being able to activate it feels like a hack as well to me.</div></div>
--=-oXaeRPnn5xF6IBkyWYu0--


