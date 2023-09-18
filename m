Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0645CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 12:40:04 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.50092.1695040797521767410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 05:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id 1A9AAB997;
	Mon, 18 Sep 2023 14:39:46 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.161.214]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiDXQ-369KrY0; Mon, 18 Sep 2023 14:39:41 +0200
Date: Mon, 18 Sep 2023 14:39:45 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/4] libxmlb: import recipe from meta-oe
To: Markus Volk <f_l_k@t-online.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <9UL61S.KHBD7IUK1XAU1@t-online.de>
In-Reply-To: <1785FB5FB0D0A413.14604@lists.openembedded.org>
References: <20230917182829.2153680-1-f_l_k@t-online.de>
	<64a23553aec159f4d506efd799eca893c7d9f25c.camel@linuxfoundation.org>
	<DKI61S.U4D11V8BDTPG3@t-online.de>
	<CANNYZj-73pCe_yRamvNM=9U2sGdv+ty9-QO8g=5QVkPD9crmdQ@mail.gmail.com>
	<1785FB5FB0D0A413.14604@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-mjEvF1/aq3EKA+Mrw1GJ"
X-TOI-EXPURGATEID: 150726::1695040781-70FF6980-EB52032A/0/0 CLEAN NORMAL
X-TOI-MSGID: 4aa653b0-56be-47bb-9ee2-4583dec48a8e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 12:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187829

--=-mjEvF1/aq3EKA+Mrw1GJ
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Sep 18 2023 at 01:40:25 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> I did that already to check if the test is working at all. It took a 
> few minutes. Didn't focus on that but I guess its been about 1-2 
> Minutes.
> That is a fast one, I guess?

Tested this again with core-image-sato and runqemu script
Without compiling at the same time, it's also much quicker.
total=1; passed=1; skipped=0; failed=0
DURATION: 14

But I don't have a clue as to when a ptest is considered slow


--=-mjEvF1/aq3EKA+Mrw1GJ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Sep 18 2023 at 01:40:25 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div>I did that already to check if the test is working at all. It took a few minutes. Didn't focus on that but I guess its been about 1-2 Minutes.</div><div>That is a fast one, I guess?</div></blockquote><div><br></div><div>Tested this again with core-image-sato and runqemu script</div><div>Without compiling at the same time, it's also much quicker.</div><div>total=1; passed=1; skipped=0; failed=0</div><div>DURATION: 14</div><div><br></div><div>But I don't have a clue as to when a ptest is considered slow</div></div>
--=-mjEvF1/aq3EKA+Mrw1GJ--


