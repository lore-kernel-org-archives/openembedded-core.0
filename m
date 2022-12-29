Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80B1C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 15:22:52 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.206030.1672327366441000254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 07:22:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout06.t-online.de (Postfix) with SMTP id ACB68134EF;
	Thu, 29 Dec 2022 16:22:44 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.205]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pAuk0-1o2bUu0; Thu, 29 Dec 2022 16:22:44 +0100
Date: Thu, 29 Dec 2022 16:22:38 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gtk-icon-cache.bbclass: replace += by :append
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <Q1SNNR.8UO27RVKCGID@t-online.de>
In-Reply-To: 
	<CANNYZj-gY4N=95D39TcAy0OWoi+rOkb2pN1beZy_UOiY3BYRaA@mail.gmail.com>
References: <20221229151110.224320-1-f_l_k@t-online.de>
	<CANNYZj-gY4N=95D39TcAy0OWoi+rOkb2pN1beZy_UOiY3BYRaA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-D3Q8khxXa20nBvTlzPeb"
X-TOI-EXPURGATEID: 150726::1672327364-78BAC9DD-0FB7008A/0/0 CLEAN NORMAL
X-TOI-MSGID: c97e8e12-cf8c-42c2-8285-b714d70977d4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 15:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175105

--=-D3Q8khxXa20nBvTlzPeb
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 29. Dez 2022 um 16:14:02 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> But what is the actual issue? Did depends end up malformed, and how?

The issue is, that for whatever reason the DEPENDS += line gets ignored 
and I had to explicitly add gtk4-native to the DEPENDS of the 
gnome-control-center recipe to get gtk-update-icon-cache found although 
gtk-icon-cache was present in inherit.


--=-D3Q8khxXa20nBvTlzPeb
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 29. Dez 2022 um 16:14:02 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite">But what is the actual issue? Did depends end up malformed, and how?</blockquote><div><br></div><div>The issue is, that for whatever reason the DEPENDS += line gets ignored and I had to explicitly add gtk4-native to the DEPENDS of the gnome-control-center recipe to get gtk-update-icon-cache found although gtk-icon-cache was present in inherit.</div></div>
--=-D3Q8khxXa20nBvTlzPeb--


