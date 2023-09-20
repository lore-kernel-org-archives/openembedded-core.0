Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247ADCE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:14:55 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.33350.1695201290364559593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout01.t-online.de (Postfix) with SMTP id 335AC2517E;
	Wed, 20 Sep 2023 11:14:48 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.37.179]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qitID-2OWKlE0; Wed, 20 Sep 2023 11:14:45 +0200
Date: Wed, 20 Sep 2023 11:14:47 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] vte: upgrade 2.72.2 -> 2.74.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <NO1A1S.XMF9OFTDUIW41@t-online.de>
In-Reply-To: <CANNYZj8HKKdRo=yDwsCopP8oZBpz=xyp78GUHOajcdkDQjA0=Q@mail.gmail.com>
References: <20230920090312.2496296-1-f_l_k@t-online.de>
	<CANNYZj8HKKdRo=yDwsCopP8oZBpz=xyp78GUHOajcdkDQjA0=Q@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Vl++PgLvGc+P36ChPHIi"
X-TOI-EXPURGATEID: 150726::1695201285-E0D82FD5-0428B39F/0/0 CLEAN NORMAL
X-TOI-MSGID: 7138f8a3-4def-428b-a4e8-f5480af94bbc
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187905

--=-Vl++PgLvGc+P36ChPHIi
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Sep 20 2023 at 11:09:26 AM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> in this case it would be better to drop nativesdk option
> from vte

The challange I guess would be to not build nativesdk for gtk+3/gtk4. 
As long as we allow to build them for nativesdk, vte will also depend 
on it.


--=-Vl++PgLvGc+P36ChPHIi
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Sep 20 2023 at 11:09:26 AM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">in this case it would be better to drop nativesdk option
from vte</div></blockquote><div><br></div><div>The challange I guess would be to not build nativesdk for gtk+3/gtk4. As long as we allow to build them for nativesdk, vte will also depend on it.&nbsp;</div></div>
--=-Vl++PgLvGc+P36ChPHIi--


