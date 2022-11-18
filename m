Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9A0C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 13:22:00 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.11338.1668777718464509870
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 05:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout08.t-online.de (Postfix) with SMTP id 7232C1E29;
	Fri, 18 Nov 2022 14:20:35 +0100 (CET)
Received: from [192.168.178.83] ([79.219.225.179]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ow1IJ-1xSfNQ0; Fri, 18 Nov 2022 14:20:35 +0100
Date: Fri, 18 Nov 2022 14:20:29 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Sajal, Sakib" <Sakib.Sajal@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <52PJLR.JPC24H6Y7EH91@t-online.de>
In-Reply-To: 
	<CANNYZj_KxF2o1TdsKRN3ESqN1T=tkbb3wBB4UZ8-5SPDY2or+g@mail.gmail.com>
References: <20221103183356.40685-1-sakib.sajal@windriver.com>
	<CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com>
	<DM6PR11MB25388B935A115A1398CD8EAAF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
	<CANNYZj-mNkCgk=XHWBvqpqr=x4R9AMyktBTj49p-QK=Ui2whxg@mail.gmail.com>
	<4JYHLR.TSDICAGWLD7L@t-online.de>
	<CANNYZj_akT9iove+LmqnrY4zA1ghct93t4P7hc5UtuSf8s5eHQ@mail.gmail.com>
	<XAMJLR.696EYFVTYA7M3@t-online.de>
	<CANNYZj_KxF2o1TdsKRN3ESqN1T=tkbb3wBB4UZ8-5SPDY2or+g@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-EDf8PSMQDBSYYNpTpHhE"
X-TOI-EXPURGATEID: 150726::1668777635-3B7ED81E-2938D1FD/0/0 CLEAN NORMAL
X-TOI-MSGID: 669d85f8-d0d9-4e53-8f1f-5ace874349b0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 13:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173458

--=-EDf8PSMQDBSYYNpTpHhE
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Fr, 18. Nov 2022 um 13:36:17 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> I'd rather force everyone to patch their 2.x scripts to ask for
> python2.

Should anybody still promise Python2 support?
I know, reality is still different, but since it is meanwhile 
unsupported, my idea would rather be to put the pressure on the 
possibly still failing scripts to get them fixed for python3.




--=-EDf8PSMQDBSYYNpTpHhE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Fr, 18. Nov 2022 um 13:36:17 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I'd rather force everyone to patch their 2.x scripts to ask for
python2.</div></blockquote><div><br></div><div>Should anybody still promise Python2 support?</div><div>I know, reality is still different, but since it is meanwhile unsupported, my idea would rather be to put the pressure on the possibly still failing scripts to get them fixed for python3.</div><div><br></div><div><br></div></div>
--=-EDf8PSMQDBSYYNpTpHhE--


