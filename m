Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82E9C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 21:31:52 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.131691.1669671111588030564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 13:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout07.t-online.de (Postfix) with SMTP id 58484A168;
	Mon, 28 Nov 2022 22:31:19 +0100 (CET)
Received: from [192.168.0.80] ([24.134.105.89]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozlif-1erfJA0; Mon, 28 Nov 2022 22:31:17 +0100
Date: Mon, 28 Nov 2022 22:31:11 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCHv5] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Message-Id: <ZFU2MR.QEEXDMWS38NQ1@t-online.de>
In-Reply-To: 
	<CANNYZj_dD+wyGk4Gi0Djx2qz7KxPPOB47qdAPgp3G-oOLiECRw@mail.gmail.com>
References: <20221128161319.335950-1-f_l_k@t-online.de>
	<Y4T8JW+C10og7zeA@mail.local> <MES2MR.QEUQIOP8KV0L1@t-online.de>
	<CANNYZj_dD+wyGk4Gi0Djx2qz7KxPPOB47qdAPgp3G-oOLiECRw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-GuLLgqBfhm2p8Eqb/D9e"
X-TOI-EXPURGATEID: 150726::1669671077-E28B3E65-28935E42/0/0 CLEAN NORMAL
X-TOI-MSGID: 0c027940-62a8-45b1-9441-04dbbabf2527
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 21:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173952

--=-GuLLgqBfhm2p8Eqb/D9e
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Nov 28 2022 at 09:57:31 PM +0100, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Please test your oe-core patches with a setup that includes only
> oe-core and no other layers. Then you'd immediately see that the new
> gcr recipe won't build.

I even noticed it because I built core-image-sato for qemumips64 to 
test and added the necessary meta-openembedded layers. However, I 
thought I should wait for the answer before making such an invasive 
decision.


--=-GuLLgqBfhm2p8Eqb/D9e
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Nov 28 2022 at 09:57:31 PM +0100, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Please test your oe-core patches with a setup that includes only
oe-core and no other layers. Then you'd immediately see that the new
gcr recipe won't build.</div></blockquote><div><br></div><div>I even noticed it because I built core-image-sato for qemumips64 to test and added the necessary meta-openembedded layers. However, I thought I should wait for the answer before making such an invasive decision.</div></div>
--=-GuLLgqBfhm2p8Eqb/D9e--


