Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E6FC4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 17:56:01 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.18378.1668966957363488258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 09:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id 8513991B2;
	Sun, 20 Nov 2022 18:55:55 +0100 (CET)
Received: from [192.168.178.83] ([79.219.233.127]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1owoXq-13CVzE0; Sun, 20 Nov 2022 18:55:54 +0100
Date: Sun, 20 Nov 2022 18:55:48 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Sajal, Sakib" <Sakib.Sajal@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <05RNLR.XOB85H3PQ20A2@t-online.de>
In-Reply-To: 
	<CANNYZj8AcsEM2SQXarq=x_6_OjnJMKNkyJAQnuRrBaz4vw7s5w@mail.gmail.com>
References: <20221103183356.40685-1-sakib.sajal@windriver.com>
	<CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com>
	<DM6PR11MB25388B935A115A1398CD8EAAF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
	<CANNYZj-mNkCgk=XHWBvqpqr=x4R9AMyktBTj49p-QK=Ui2whxg@mail.gmail.com>
	<4JYHLR.TSDICAGWLD7L@t-online.de>
	<CANNYZj_akT9iove+LmqnrY4zA1ghct93t4P7hc5UtuSf8s5eHQ@mail.gmail.com>
	<XAMJLR.696EYFVTYA7M3@t-online.de>
	<CANNYZj_KxF2o1TdsKRN3ESqN1T=tkbb3wBB4UZ8-5SPDY2or+g@mail.gmail.com>
	<52PJLR.JPC24H6Y7EH91@t-online.de>
	<CANNYZj8AcsEM2SQXarq=x_6_OjnJMKNkyJAQnuRrBaz4vw7s5w@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-cvKbiu3F5P3kTbEZiJJw"
X-TOI-EXPURGATEID: 150726::1668966954-F3FEE417-E0073BE1/0/0 CLEAN NORMAL
X-TOI-MSGID: 0683b0cf-ca44-4d19-b0a9-16db039c3272
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 17:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173638

--=-cvKbiu3F5P3kTbEZiJJw
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Sa, 19. Nov 2022 um 18:37:37 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Very well. Can you make a patch?

I've sent a patch for this. It was tested with 'bitbake myimage -c 
do_populate_sdk' only for x86_64. I guess this is arch independent


--=-cvKbiu3F5P3kTbEZiJJw
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Sa, 19. Nov 2022 um 18:37:37 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Very well. Can you make a patch?</div></blockquote><div><br></div><div>I've sent a patch for this. It was tested with 'bitbake myimage -c do_populate_sdk' only for x86_64. I guess this is arch independent</div></div>
--=-cvKbiu3F5P3kTbEZiJJw--


