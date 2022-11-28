Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07A3C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 11:42:49 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.115669.1669635767400944462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 03:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id 32E74D869;
	Mon, 28 Nov 2022 12:42:45 +0100 (CET)
Received: from [192.168.178.83] ([84.163.35.123]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozcX6-0GCVeq0; Mon, 28 Nov 2022 12:42:44 +0100
Date: Mon, 28 Nov 2022 12:42:38 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <2732MR.ANT1XFWZ05B13@t-online.de>
In-Reply-To: 
	<CANNYZj9OzcCqoC9=cDcMVPDc85KZbuWuksekUgg0YhDWsG+TrQ@mail.gmail.com>
References: <20221128112232.123025-1-f_l_k@t-online.de>
	<CANNYZj9OzcCqoC9=cDcMVPDc85KZbuWuksekUgg0YhDWsG+TrQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Y5mxIxq1ONV3w4+XYo/R"
X-TOI-EXPURGATEID: 150726::1669635764-ECFFEA26-1D6A859C/0/0 CLEAN NORMAL
X-TOI-MSGID: 8d89f887-76bf-44af-b7b5-10429fc21cb5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 11:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173910

--=-Y5mxIxq1ONV3w4+XYo/R
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 28. Nov 2022 um 12:28:31 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> This needs to be explained. And we need to find a better way to do it,
> preferably one that is acceptable upstream.

Now thats somehow problematic. I had this issue also with seahorse, 
that wants to know at build time what targets ssh-keygen path would be. 
We need a way to look for the targets ssh binary paths but since 
openssh for whatever reason doesn't  support pkgconfig i guess we are 
forced to hack it.
Another possibility would be to add an openssh-native recipe. I sent a 
patch for that but it was rejected for valid reasons.


--=-Y5mxIxq1ONV3w4+XYo/R
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 28. Nov 2022 um 12:28:31 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This needs to be explained. And we need to find a better way to do it,
preferably one that is acceptable upstream.</div></blockquote><div><br></div><div>Now thats somehow problematic. I had this issue also with seahorse, that wants to know at build time what targets ssh-keygen path would be. We need a way to look for the targets ssh binary paths but since openssh for whatever reason doesn't &nbsp;support pkgconfig i guess we are forced to hack it.</div><div>Another possibility would be to add an openssh-native recipe. I sent a patch for that but it was rejected for valid reasons. &nbsp;</div></div>
--=-Y5mxIxq1ONV3w4+XYo/R--


