Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B325ECAAD5
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 05:56:22 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web08.8299.1661838979157311261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 22:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id 36F9E170B3;
	Tue, 30 Aug 2022 07:55:29 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.39.244]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oSuDg-0bq9HE0; Tue, 30 Aug 2022 07:55:29 +0200
Date: Tue, 30 Aug 2022 07:55:23 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] packagegroup-base.bb: remove wpa_supplicant
 preset from packagegroup-base-wifi
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <B4ZEHR.U6MBOQ6736O52@t-online.de>
In-Reply-To: <d104e8ed664d4e7e9503b7125fe29975@axis.com>
References: <20220828165830.12594-1-f_l_k@t-online.de>
	<d104e8ed664d4e7e9503b7125fe29975@axis.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-2nJK1mzH7eLrSe5b/ow0"
X-TOI-EXPURGATEID: 150726::1661838929-01453B16-6B476185/0/0 CLEAN NORMAL
X-TOI-MSGID: 4322bb6b-ca85-4143-a996-e4d017723ee4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 05:56:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170065

--=-2nJK1mzH7eLrSe5b/ow0
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 29. Aug 2022 um 11:51:45 +0000 schrieb Peter Kjellerstedt 
<peter.kjellerstedt@axis.com>:
> Rather than removing wpa-supplicant, which breaks backwards
> compatibility and expectations, wouldn't it make more sense to
> introduce a variable for the wireless service, and default it
> to wpa-supplicant. Then there is no breakage for those who
> expect packagegroup-base-wifi to pull in wpa-supplicant, but
> those who want to use iwd can easily change the configuration
> in their distros.

Good point. I've sent a new patch for it


--=-2nJK1mzH7eLrSe5b/ow0
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 29. Aug 2022 um 11:51:45 +0000 schrieb Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Rather than removing wpa-supplicant, which breaks backwards 
compatibility and expectations, wouldn't it make more sense to
introduce a variable for the wireless service, and default it 
to wpa-supplicant. Then there is no breakage for those who 
expect packagegroup-base-wifi to pull in wpa-supplicant, but 
those who want to use iwd can easily change the configuration 
in their distros. </div></blockquote><div><br></div><div>Good point. I've sent a new patch for it</div></div>
--=-2nJK1mzH7eLrSe5b/ow0--


