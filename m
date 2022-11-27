Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F168EC4321E
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 19:38:34 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.99282.1669577914052877564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 11:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id 40F75B16C;
	Sun, 27 Nov 2022 20:38:30 +0100 (CET)
Received: from [192.168.178.83] ([79.219.231.234]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozNTs-36KKoq0; Sun, 27 Nov 2022 20:38:24 +0100
Date: Sun, 27 Nov 2022 20:38:18 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <UJU0MR.40BCMW1Z3VVX@t-online.de>
In-Reply-To: <Y4O2Zu5VubWJiFhP@mail.local>
References: <20221127122744.1404648-1-f_l_k@t-online.de>
	<Y4O2Zu5VubWJiFhP@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-I6O+qErtoYutUuDcp63N"
X-TOI-EXPURGATEID: 150726::1669577904-C9C89B6F-EFA8032B/0/0 CLEAN NORMAL
X-TOI-MSGID: a4016078-1019-4a75-87aa-90513b1b7e07
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173883

--=-I6O+qErtoYutUuDcp63N
Content-Type: text/plain; charset=us-ascii; format=flowed

Am So, 27. Nov 2022 um 20:11:34 +0100 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> stdio: WARNING: Nothing PROVIDES 'gtk4' (but 
> /home/pokybuild/yocto-worker/a-full/build/meta/recipes-gnome/gcr/gcr_4.0.0.bb 
> DEPENDS on or otherwise requires it)

mmh, i guess possible solutions would be to move either gtk4 to oe-core 
or gcr4 to meta-gnome


--=-I6O+qErtoYutUuDcp63N
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am So, 27. Nov 2022 um 20:11:34 +0100 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">stdio: WARNING: Nothing PROVIDES 'gtk4' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-gnome/gcr/gcr_4.0.0.bb DEPENDS on or otherwise requires it)</div></blockquote><div><br></div><div>mmh, i guess possible solutions would be to move either gtk4 to oe-core or gcr4 to meta-gnome</div></div>
--=-I6O+qErtoYutUuDcp63N--


