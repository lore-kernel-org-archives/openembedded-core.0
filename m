Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE3CECAAD4
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 11:24:54 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.10346.1661858675704316626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 04:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout09.t-online.de (Postfix) with SMTP id 34F9FCE3A;
	Tue, 30 Aug 2022 13:24:33 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.39.244]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oSzM7-0TxmPw0; Tue, 30 Aug 2022 13:24:32 +0200
Date: Tue, 30 Aug 2022 13:24:25 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] packagegroup-base.bb: add a configure option to
 set the wireless-daemon
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <PCEFHR.JXOPDOBC9X722@t-online.de>
In-Reply-To: <Yw3QqKm8NPRbAPuP@mail.local>
References: <20220830051108.86092-1-f_l_k@t-online.de>
	<Yw3QqKm8NPRbAPuP@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-vSlDFhbW11Yy2XUGa3lH"
X-TOI-EXPURGATEID: 150726::1661858672-0144B102-E5A3F4A3/0/0 CLEAN NORMAL
X-TOI-MSGID: b182eaef-50ed-4e95-b874-50f06120dddf
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 11:24:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170070

--=-vSlDFhbW11Yy2XUGa3lH
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Di, 30. Aug 2022 um 10:56:08 +0200 schrieb Alexandre Belloni 
<alexandre.belloni@bootlin.com>:
> Doesn't that break existing layers and bbappends?

Since the WIRELESS_DAEMON option in connman has only existed for a few 
days, I don't think there are already layers that depend on it. 
Previously wpa-supplicant was automatically preset in connman.




--=-vSlDFhbW11Yy2XUGa3lH
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Di, 30. Aug 2022 um 10:56:08 +0200 schrieb Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Doesn't that break existing layers and bbappends?</div></blockquote><div><br></div><div>Since the WIRELESS_DAEMON option in connman has only existed for a few days, I don't think there are already layers that depend on it. Previously wpa-supplicant was automatically preset in connman.</div><div><br></div><div><br></div></div>
--=-vSlDFhbW11Yy2XUGa3lH--


