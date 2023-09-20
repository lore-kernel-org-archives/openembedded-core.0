Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689AACE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:29:15 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.33519.1695202153446647938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout08.t-online.de (Postfix) with SMTP id C91A225BF7;
	Wed, 20 Sep 2023 11:28:29 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.37.179]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qitVR-38osIy0; Wed, 20 Sep 2023 11:28:26 +0200
Date: Wed, 20 Sep 2023 11:28:28 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] vte: upgrade 2.72.2 -> 2.74.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <GB2A1S.G4VW7D0GB37S2@t-online.de>
In-Reply-To: <CANNYZj_jBuT6CSMqY6xC8k0aLZKy42wxwTHzj2c+BQ74CpijqQ@mail.gmail.com>
References: <20230920090312.2496296-1-f_l_k@t-online.de>
	<CANNYZj8HKKdRo=yDwsCopP8oZBpz=xyp78GUHOajcdkDQjA0=Q@mail.gmail.com>
	<NO1A1S.XMF9OFTDUIW41@t-online.de>
	<CANNYZj_jBuT6CSMqY6xC8k0aLZKy42wxwTHzj2c+BQ74CpijqQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-lPClgJnsDq3miNhe+vnF"
X-TOI-EXPURGATEID: 150726::1695202106-077FEE79-D6695B62/0/0 CLEAN NORMAL
X-TOI-MSGID: bed55a3e-91f9-4b4d-b5e2-f9681318216a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187909

--=-lPClgJnsDq3miNhe+vnF
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Sep 20 2023 at 11:16:21 AM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Not at all. If X depends on Y, and Y is enabled for nativesdk, that
> doesn't mean that X needs that as well. matchbox-terminal depends on
> vte, but isn't enabled for nativesdk.

Of course, you are right.
I'll do a  'bitbake core-image-sato -c do_populate_sdk' and if nothing 
fails I'll send a v4


--=-lPClgJnsDq3miNhe+vnF
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Sep 20 2023 at 11:16:21 AM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Not at all. If X depends on Y, and Y is enabled for nativesdk, that
doesn't mean that X needs that as well. matchbox-terminal depends on
vte, but isn't enabled for nativesdk.</div></blockquote><span style="white-space: break-spaces;"><div><span style="white-space: break-spaces;"><br></span></div>Of course, you are right.</span><div><div>I'll do a &nbsp;'bitbake core-image-sato -c do_populate_sdk' and if nothing fails I'll send a v4</div></div></div>
--=-lPClgJnsDq3miNhe+vnF--


