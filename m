Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3020EC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 14:50:04 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.17399.1668696600265221687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 06:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout04.t-online.de (Postfix) with SMTP id 6A3613937;
	Thu, 17 Nov 2022 15:49:58 +0100 (CET)
Received: from [192.168.178.83] ([79.219.224.229]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ovgDG-1dDvDE0; Thu, 17 Nov 2022 15:49:58 +0100
Date: Thu, 17 Nov 2022 15:49:52 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Sajal, Sakib" <Sakib.Sajal@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <4JYHLR.TSDICAGWLD7L@t-online.de>
In-Reply-To: 
	<CANNYZj-mNkCgk=XHWBvqpqr=x4R9AMyktBTj49p-QK=Ui2whxg@mail.gmail.com>
References: <20221103183356.40685-1-sakib.sajal@windriver.com>
	<CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com>
	<DM6PR11MB25388B935A115A1398CD8EAAF2079@DM6PR11MB2538.namprd11.prod.outlook.com>
	<CANNYZj-mNkCgk=XHWBvqpqr=x4R9AMyktBTj49p-QK=Ui2whxg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-mxqetOHAuIItr8zaNjgM"
X-TOI-EXPURGATEID: 150726::1668696598-49FF7689-AA67C19F/0/0 CLEAN NORMAL
X-TOI-MSGID: 00f3c838-97d0-49ab-9eae-b8e52d6426df
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 14:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173428

--=-mxqetOHAuIItr8zaNjgM
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 17. Nov 2022 um 08:43:15 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Yes, they kinda have a point. Referring to latest python as python3 
> forever is silly. Unfortunately we have all those users with legacy 
> proprietary python2 things, and they feel like they still 'own' 
> python (without a number).

To avoid patching dozens of scripts, i use this bbappend for python3 
until the time comes to make it the default:


do_install:append:class-target() {
	ln -sf ${bindir}/python3 ${D}${bindir}/python
}

FILES:${PN}:class-target += "${bindir}/python"


--=-mxqetOHAuIItr8zaNjgM
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 17. Nov 2022 um 08:43:15 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite">Yes, they kinda have a point. Referring to latest python as python3 forever is silly. Unfortunately we have all those users with legacy proprietary python2 things, and they feel like they still 'own' python (without a number).</blockquote><div><br></div><div><div>To avoid patching dozens of scripts, i use this bbappend for python3 until the time comes to make it the default:</div><div><br></div><div><br></div><div>do_install:append:class-target() {</div><div><span class="Apple-tab-span" style="white-space:pre">	</span>ln -sf ${bindir}/python3 ${D}${bindir}/python</div><div>}</div><div><br></div><div>FILES:${PN}:class-target += "${bindir}/python"</div></div></div>
--=-mxqetOHAuIItr8zaNjgM--


