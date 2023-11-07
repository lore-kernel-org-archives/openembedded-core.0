Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D94C41535
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 13:05:14 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.10071.1699362305682825456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 05:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout08.t-online.de (Postfix) with SMTP id 10BD427C4;
	Tue,  7 Nov 2023 14:05:03 +0100 (CET)
Received: from [192.168.178.62] ([84.154.173.54]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0LlM-4WA5Ng0; Tue, 7 Nov 2023 14:05:01 +0100
Date: Tue, 07 Nov 2023 12:52:33 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][RFC][PATCH] vala.bbclass: enable vapi build if class is
 inherited
To: Markus Volk <f_l_k@t-online.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <LZ4R3S.N6GMLTDQEFAX1@t-online.de>
In-Reply-To: <17954FE430FD7BA2.25348@lists.openembedded.org>
References: <20231107100149.1048627-1-f_l_k@t-online.de>
	<CANNYZj-+78t2Pu908g3zRGgGYG4GUM_S3ZkrPBmkjPq+tUwsxg@mail.gmail.com>
	<17954FE430FD7BA2.25348@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Bz9CUlXbvQGBdhAdhmDI"
X-TOI-EXPURGATEID: 150726::1699362301-DF7FDD63-B0AE0B32/0/0 CLEAN NORMAL
X-TOI-MSGID: 45b48d2e-16f0-47ae-a6e4-ff5926e0587d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 13:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190281

--=-Bz9CUlXbvQGBdhAdhmDI
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Nov 7 2023 at 11:18:15 AM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Shouldn't
> they be as well tweaked to rely on the class doing the right thing?

functionwise its been ok but I've found some additional things to 
cleanup, so I'll send a v2.


--=-Bz9CUlXbvQGBdhAdhmDI
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Nov 7 2023 at 11:18:15 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Shouldn't
they be as well tweaked to rely on the class doing the right thing?</div></blockquote><div><br></div><div>functionwise its been ok but I've found some additional things to cleanup, so I'll send a v2.</div></div>
--=-Bz9CUlXbvQGBdhAdhmDI--


