Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39B1C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 09:20:44 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.7075.1692868837612119924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 02:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id D1BE8FCF5;
	Thu, 24 Aug 2023 11:20:35 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.33.18]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZ6W2-3suDVA0; Thu, 24 Aug 2023 11:20:34 +0200
Date: Thu, 24 Aug 2023 11:20:29 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] qemu: fix libudev packageconfig for systemd
 images
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <5Y1WZR.5KQFYPCEBMX51@t-online.de>
In-Reply-To: <CANNYZj_oj1JDbpTm3ev4nKGKr7Or0+bBiWwg=6B9-oJdhiOmFA@mail.gmail.com>
References: <20230824090414.9198-1-f_l_k@t-online.de>
	<CANNYZj_oj1JDbpTm3ev4nKGKr7Or0+bBiWwg=6B9-oJdhiOmFA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-mWb4a2lfjZ6MMAc0/8rg"
X-TOI-EXPURGATEID: 150726::1692868834-FDC012E6-E8A1DB83/0/0 CLEAN NORMAL
X-TOI-MSGID: 0f00bdcf-f64a-4923-8677-c34bcb4b6c2e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 09:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186653

--=-mWb4a2lfjZ6MMAc0/8rg
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Aug 24 2023 at 11:12:27 AM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> so the dependency can simply be changed to udev?

I think I remember a few years ago there was a problem with "multiple 
providers", but now it works as you write :)


--=-mWb4a2lfjZ6MMAc0/8rg
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Aug 24 2023 at 11:12:27 AM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">so the dependency can simply be changed to udev?</div></blockquote><div><br></div><div>I think I remember a few years ago there was a problem with "multiple providers", but now it works as you write :)</div></div>
--=-mWb4a2lfjZ6MMAc0/8rg--


