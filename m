Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C8FC48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 13:18:06 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.10990.1707484682253976548
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 05:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout10.t-online.de (Postfix) with SMTP id 9AAE52F8F1;
	Fri,  9 Feb 2024 14:18:00 +0100 (CET)
Received: from [192.168.178.67] ([84.163.32.56]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rYQlU-4MOqjg0; Fri, 9 Feb 2024 14:18:00 +0100
Date: Fri, 09 Feb 2024 14:18:09 +0100
From: f_l_k@t-online.de
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Alexander Kanavin
	<alex@linutronix.de>, openembedded-core@lists.openembedded.org
Message-Id: <9MBL8S.OKKYLSNZSE2O@t-online.de>
In-Reply-To: <CAMKF1soOPZBoaks_LFCAoaMqdu+pY8v-arh58gmBUbndE4=cVg@mail.gmail.com>
References: <20240208185641.2969396-1-alex@linutronix.de>
	<CAMKF1soOPZBoaks_LFCAoaMqdu+pY8v-arh58gmBUbndE4=cVg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6AOstPzNAWBuvDTMF1iB"
X-TOI-EXPURGATEID: 150726::1707484680-CAFFADC7-9CBD1629/0/0 CLEAN NORMAL
X-TOI-MSGID: 372bc5f6-14e1-4a92-a4e1-3a15b3c4c4e7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 13:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195210

--=-6AOstPzNAWBuvDTMF1iB
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Feb 8 2024 at 08:45:33 PM -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Will be at disadvantage since someone might be able to use logind 
> with non-systemd system too

If someone, for whatever reason wants to go that way, it might be 
possible to set elogind as provider for systemd.


--=-6AOstPzNAWBuvDTMF1iB
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Feb 8 2024 at 08:45:33 PM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">Will be at disadvantage since someone might be able to use logind with non-systemd system too&nbsp;</blockquote><div><br></div><div>If someone, for whatever reason wants to go that way, it might be possible to set elogind as provider for systemd.</div></div>
--=-6AOstPzNAWBuvDTMF1iB--


