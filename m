Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07314ECE57B
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 09:44:33 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.49138.1725875064346625193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 02:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout04.t-online.de (Postfix) with SMTP id DEE8311678;
	Mon,  9 Sep 2024 11:44:22 +0200 (CEST)
Received: from [192.168.178.67] ([79.219.228.217]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1snawW-0A3evA0; Mon, 9 Sep 2024 11:44:20 +0200
Date: Mon, 09 Sep 2024 11:45:53 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] mesa: add support for rusticl
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Message-Id: <HSHJJS.OO3X80OW2KGA@t-online.de>
In-Reply-To: <CANNYZj_aLfFFe14-YNYfGt5T05dRb_-N7NPSk3Tx5-j09xRtrg@mail.gmail.com>
References: <20240908172311.3773048-1-f_l_k@t-online.de>
	<CANNYZj_aLfFFe14-YNYfGt5T05dRb_-N7NPSk3Tx5-j09xRtrg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Tlwl7fk2W872fVoIjD+A"
X-TOI-EXPURGATEID: 150726::1725875060-0E7FA40A-66B7BBE9/0/0 CLEAN NORMAL
X-TOI-MSGID: e0ca736d-064b-459a-86b4-ab7adfd6c1ca
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 09:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204323

--=-Tlwl7fk2W872fVoIjD+A
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Sep 9 2024 at 10:46:59 AM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> This does need to be properly looked into, there's probably a better
> patch possible, or a build setting we're missing, or at least an
> upstream ticket to be filed. It's not a good patch when it says
> 'workaround' and doesn't explain the issue and the fix.

Fully agree. This is ugly as hell. Just a quick and dirty hack to get 
things working (which is always a good starting point) but by no means 
a solution for oe-core. Thats why I marked it RFC


--=-Tlwl7fk2W872fVoIjD+A
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Sep 9 2024 at 10:46:59 AM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This does need to be properly looked into, there's probably a better
patch possible, or a build setting we're missing, or at least an
upstream ticket to be filed. It's not a good patch when it says
'workaround' and doesn't explain the issue and the fix.</div></blockquote><div><br></div><div>Fully agree. This is ugly as hell. Just a quick and dirty hack to get things working (which is always a good starting point) but by no means a solution for oe-core. Thats why I marked it RFC</div></div>
--=-Tlwl7fk2W872fVoIjD+A--


