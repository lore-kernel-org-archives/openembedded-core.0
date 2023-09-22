Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C988CD4F44
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 09:44:39 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.17989.1695375877996974798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 02:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout06.t-online.de (Postfix) with SMTP id EC2E4D8D2;
	Fri, 22 Sep 2023 11:44:35 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.238.241]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjciA-1FFuuu0; Fri, 22 Sep 2023 11:44:34 +0200
Date: Fri, 22 Sep 2023 11:44:37 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv6] vte: upgrade 2.72.2 -> 2.74.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <DESD1S.X62NHIYI61VT2@t-online.de>
In-Reply-To: <20230921205944c6389866@mail.local>
References: <20230920181526.386874-1-f_l_k@t-online.de>
	<2023092114422322cfc0b0@mail.local> <20230921205944c6389866@mail.local>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-cIFwEdi95Vph8lbtcJJG"
X-TOI-EXPURGATEID: 150726::1695375874-067F8E79-C211408E/0/0 CLEAN NORMAL
X-TOI-MSGID: b7859be9-2a92-4ecd-8c9b-9453913c87ae
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 09:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188090

--=-cIFwEdi95Vph8lbtcJJG
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 21 2023 at 10:59:44 PM +02:00:00, Alexandre Belloni 
<alexandre.belloni@bootlin.com> wrote:
> BTW, I'd like you to test patches before sending because you claimed
> this was tested with oe-core but this was definitively not. The fact
> that we are at v6 and this still breaks builds so early is very
> annoying.

Believe me, this is a bit annoying for me now too. I did some testing 
on that patch and also tried to solve the configuration problem in v1 
by setting gtk4=false. So in a way, we are also at v6 because changes 
were requested, which in turn bring changes and also raise the question 
of a fundamental decision. And yes, that was a misunderstanding. By 
oe-core I meant that I tested with 'oe-core only' layers and the 
default local.conf (with DISTRO=poky). I hope that I am not being 
accused of something else here.


--=-cIFwEdi95Vph8lbtcJJG
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Sep 21 2023 at 10:59:44 PM +02:00:00, Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">BTW, I'd like you to test patches before sending because you claimed
this was tested with oe-core but this was definitively not. The fact
that we are at v6 and this still breaks builds so early is very
annoying.
</div></blockquote><div><br></div><div>Believe me, this is a bit annoying for me now too. I did some testing on that patch and also tried to solve the configuration problem in v1 by setting gtk4=false. So in a way, we are also at v6 because changes were requested, which in turn bring changes and also raise the question of a fundamental decision. And yes, that was a misunderstanding. By oe-core I meant that I tested with 'oe-core only' layers and the default local.conf (with DISTRO=poky). I hope that I am not being accused of something else here.</div></div>
--=-cIFwEdi95Vph8lbtcJJG--


