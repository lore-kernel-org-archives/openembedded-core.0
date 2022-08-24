Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69213C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:57:11 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web08.8786.1661331428976596155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout08.t-online.de (Postfix) with SMTP id 8559514DE8;
	Wed, 24 Aug 2022 10:57:00 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.43.62]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oQmC4-2ERIau0; Wed, 24 Aug 2022 10:57:00 +0200
Date: Wed, 24 Aug 2022 10:56:54 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] connman: add PACKAGECONFIG to support iwd
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <UI34HR.PZNATSOSGVWO2@t-online.de>
In-Reply-To: <20220824105440.1cdf49a7@booty>
References: <20220823163809.17214-1-f_l_k@t-online.de>
	<20220824105440.1cdf49a7@booty>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IhKHcKD+X7480j5UlBYQ"
X-TOI-EXPURGATEID: 150726::1661331420-014551EF-4DB64E63/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ac59667-8f3d-4c3b-9ca1-c5ef33b8e6d5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:57:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169798

--=-IhKHcKD+X7480j5UlBYQ
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello Luca,

Am Mi, 24. Aug 2022 um 10:54:40 +0200 schrieb Luca Ceresoli 
<luca.ceresoli@bootlin.com>:
> I would think iwd should be an rdepends, not an rrecommends. Any reson
> for that? Or is it just an unintended extra ','?

Only reason for this was the fact, that iwd is not in oe-core so it 
felt wrong somehow to set it RDEPEND


--=-IhKHcKD+X7480j5UlBYQ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Hello Luca,</div><div><br></div>Am Mi, 24. Aug 2022 um 10:54:40 +0200 schrieb Luca Ceresoli &lt;luca.ceresoli@bootlin.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I would think iwd should be an rdepends, not an rrecommends. Any reson
for that? Or is it just an unintended extra ','?</div></blockquote><div><br></div><div>Only reason for this was the fact, that iwd is not in oe-core so it felt wrong somehow to set it RDEPEND</div></div>
--=-IhKHcKD+X7480j5UlBYQ--


