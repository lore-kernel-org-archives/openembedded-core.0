Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA42C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 16:27:17 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.12716.1664468835502312469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 09:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout11.t-online.de (Postfix) with SMTP id BB9AB71EB;
	Thu, 29 Sep 2022 18:27:12 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.42.234]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1odwNS-0tvFfk0; Thu, 29 Sep 2022 18:27:10 +0200
Date: Thu, 29 Sep 2022 18:27:04 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] wic-imager-direct.py: use fstab update also for
 root device
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Message-Id: <4DCZIR.IYUQY8B4E6CC@t-online.de>
In-Reply-To: <17195FE5AE38CC13.31922@lists.openembedded.org>
References: <20220929125750.3338743-1-f_l_k@t-online.de>
	<f0eca98f9324c537e2aee3c655258f98372d7926.camel@linuxfoundation.org>
	<17195FE5AE38CC13.31922@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-UiHXXnw41eqRWdZbPb2y"
X-TOI-EXPURGATEID: 150726::1664468830-177E998D-5217A545/0/0 CLEAN NORMAL
X-TOI-MSGID: edb857ae-2d23-434a-8364-ad364fa52ef5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 16:27:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171196

--=-UiHXXnw41eqRWdZbPb2y
Content-Type: text/plain; charset=us-ascii; format=flowed

In special circumstances this could cause problems with layern and .wks 
configurations if neither '--use-uuid' nor '--use-label' is used and 
the root device is not specified hardcoded. Then the entry is created 
as /dev/sda which can lead to a non-booting system.

But this is then due to a misconfigured layer

> 


--=-UiHXXnw41eqRWdZbPb2y
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>In special circumstances this could cause problems with layern and .wks configurations if neither '--use-uuid' nor '--use-label' is used and the root device is not specified hardcoded. Then the entry is created as /dev/sda which can lead to a non-booting system.&nbsp;</div><div><br></div><div>But this is then due to a misconfigured layer</div></div></div>
--=-UiHXXnw41eqRWdZbPb2y--


