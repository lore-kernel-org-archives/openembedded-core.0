Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE14FC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 15:27:52 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.207468.1672327662257869507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 07:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout06.t-online.de (Postfix) with SMTP id 66D1A38AF;
	Thu, 29 Dec 2022 16:27:40 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.205]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pAuoj-1HCML20; Thu, 29 Dec 2022 16:27:37 +0100
Date: Thu, 29 Dec 2022 16:27:31 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gtk-icon-cache.bbclass: replace += by :append
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <V9SNNR.YP0EQG241RGR3@t-online.de>
In-Reply-To: 
	<CA+chaQfqN0JLgPk3zUE_QN6KRcm7-q2TWbYLyeMUAbg1AGw_5g@mail.gmail.com>
References: <20221229151110.224320-1-f_l_k@t-online.de>
	<CANNYZj-gY4N=95D39TcAy0OWoi+rOkb2pN1beZy_UOiY3BYRaA@mail.gmail.com>
	<CA+chaQfqN0JLgPk3zUE_QN6KRcm7-q2TWbYLyeMUAbg1AGw_5g@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-9XPQRiDEWkGbqB1qdCxX"
X-TOI-EXPURGATEID: 150726::1672327657-E5FDF07E-FD0C21D7/0/0 CLEAN NORMAL
X-TOI-MSGID: ba60c8e8-0be5-4039-ae41-eb974ae02243
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 15:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175106

--=-9XPQRiDEWkGbqB1qdCxX
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 29. Dez 2022 um 16:18:26 +0100 schrieb Martin Jansa 
<Martin.Jansa@gmail.com>:
> My guess is that it was caused by gnome-control-center inheritting 
> gtk-icon-cache before setting DEPENDS, so the DEPENDS from bbclass 
> are overwritten.

Absolutely true, that's been my issue. Thanks for the hint


--=-9XPQRiDEWkGbqB1qdCxX
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 29. Dez 2022 um 16:18:26 +0100 schrieb Martin Jansa &lt;Martin.Jansa@gmail.com&gt;:<br><blockquote type="cite">My guess is that it was caused by gnome-control-center inheritting gtk-icon-cache before setting DEPENDS, so the DEPENDS from bbclass are overwritten.</blockquote><div><br></div><div>Absolutely true, that's been my issue. Thanks for the hint</div></div>
--=-9XPQRiDEWkGbqB1qdCxX--


