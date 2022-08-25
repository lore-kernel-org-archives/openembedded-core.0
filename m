Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CE7ECAA25
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 18:37:20 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.27893.1661452637567099006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 11:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id CC6111C8A5;
	Thu, 25 Aug 2022 20:36:57 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.38.226]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oRHir-1Y8W7E0; Thu, 25 Aug 2022 20:36:57 +0200
Date: Thu, 25 Aug 2022 20:36:51 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] connman: add PACKAGECONFIG to support iwd
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <F1P6HR.2RJQHL8GACC73@t-online.de>
In-Reply-To: <D7DA9B94-3FFE-4817-9279-3420BB423AC2@arm.com>
References: <20220824125037.4855-1-f_l_k@t-online.de>
	<D7DA9B94-3FFE-4817-9279-3420BB423AC2@arm.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-5ohD2zw7e0GHo3xvmODA"
X-TOI-EXPURGATEID: 150726::1661452617-0144F70D-0947BDB2/0/0 CLEAN NORMAL
X-TOI-MSGID: 142cb619-128b-44ec-8436-2c2f116cae31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 18:37:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169884

--=-5ohD2zw7e0GHo3xvmODA
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 25. Aug 2022 um 12:17:06 +0000 schrieb Ross Burton 
<ross.burton@arm.com>:
> Note that if wpa_supplicant and iwd are mutually exclusive, you can 
> express that in the PACKAGECONFIG:

I didn't want to make the decision whether wpa_supplicant and iwd 
should be mutually exclusive. Although I think mixed operation is 
nonsensical, it will probably be possible with the appropriate 
configuration.

Just let me know if you want me to add it as rconflict in PACKAGECONFIG


--=-5ohD2zw7e0GHo3xvmODA
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 25. Aug 2022 um 12:17:06 +0000 schrieb Ross Burton &lt;ross.burton@arm.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Note that if wpa_supplicant and iwd are mutually exclusive, you can express that in the PACKAGECONFIG:</div></blockquote><div><br></div><div><div>I didn't want to make the decision whether wpa_supplicant and iwd should be mutually exclusive. Although I think mixed operation is nonsensical, it will probably be possible with the appropriate configuration.</div><div><br></div><div>Just let me know if you want me to add it as rconflict in PACKAGECONFIG</div></div></div>
--=-5ohD2zw7e0GHo3xvmODA--


