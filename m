Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1B3CAC58F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:10:26 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.17671.1757686223342781036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 07:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout07.t-online.de (Postfix) with SMTP id 1C4A0E51D;
	Fri, 12 Sep 2025 16:09:34 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.236.20]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ux4St-0uGQRE0; Fri, 12 Sep 2025 16:09:27 +0200
Date: Fri, 12 Sep 2025 16:09:22 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.84.4 -> 2.86.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <MBBH2T.5XF97UDNPGXO2@t-online.de>
In-Reply-To: <CANNYZj8=Le1Eod6NfcmSFNiOuLafD4WoC9qSU4yRRpCz3So4nQ@mail.gmail.com>
References: <186275A42D34EEAB.19063@lists.openembedded.org>
	<5I7F2T.KIGKW1QUPNT51@t-online.de>
	<CANNYZj89e_Q80kSO-E7_iByBw72=0TuJNgoyPV1DzM=Q73irJg@mail.gmail.com>
	<J9PG2T.NK5VSUKA3AQO3@t-online.de>
	<CANNYZj8=Le1Eod6NfcmSFNiOuLafD4WoC9qSU4yRRpCz3So4nQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-lAsOV7KVyPe9ppBTYC6K"
X-TOI-EXPURGATEID: 150726::1757686167-20FF6B3F-EBA66A07/0/0 CLEAN NORMAL
X-TOI-MSGID: 80a6cb37-d88c-4bfa-b0c4-cc93c93a83b1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 14:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223312

--=-lAsOV7KVyPe9ppBTYC6K
Content-Type: text/plain; charset=us-ascii; format=flowed

I think the problem lies in gjs, because that's where the error occurs. 
I'll take a look if I can backport needed things.
I haven't looked into this direction yet because I was afraid it might 
only be the tip of the iceberg. But let's see.


On Fri, Sep 12 2025 at 11:58:10 +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> I saw the patch on oe-devel. It looks like a simple rename of
> methods/properties/etc? Maybe it's possible to extract and backport
> the fix to gnome-shell rather?




--=-lAsOV7KVyPe9ppBTYC6K
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I think the problem lies in gjs, because that's where the error occurs. I'll take a look if I can backport needed things.</div><div>I haven't looked into this direction yet because I was afraid it might only be the tip of the iceberg. But let's see.</div><div><br></div><div><br></div>On Fri, Sep 12 2025 at 11:58:10 +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I saw the patch on oe-devel. It looks like a simple rename of
methods/properties/etc? Maybe it's possible to extract and backport
the fix to gnome-shell rather?</div></blockquote><div><br></div><div><br></div></div>
--=-lAsOV7KVyPe9ppBTYC6K--


