Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBCDC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 16:43:15 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.1837.1716828192955675704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 09:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 33A90384A7;
	Mon, 27 May 2024 18:43:11 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.33.219]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBdRG-1U926C0; Mon, 27 May 2024 18:43:10 +0200
Date: Mon, 27 May 2024 18:43:44 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] ghostscript: update 10.03.0 -> 10.03.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <W4L5ES.ZQ2E7C318OBQ@t-online.de>
In-Reply-To: <CANNYZj9iHD2sS7HNXrPLujxCVxe8JCygdtwpRTDUoLsWy73VmQ@mail.gmail.com>
References: <20240527161104.2954913-1-f_l_k@t-online.de>
	<17D364C190E1284E.7888@lists.openembedded.org>
	<CANNYZj8q1zqypRzFMdkt8hJ9bGGWjROW51EHO1P1fG-bFvCP2w@mail.gmail.com>
	<NNK5ES.VJH4NYNWIV9K2@t-online.de>
	<CANNYZj9iHD2sS7HNXrPLujxCVxe8JCygdtwpRTDUoLsWy73VmQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-u78VF1cdZDWt2o1qARRR"
X-TOI-EXPURGATEID: 150726::1716828190-C6FFAD1D-607A983A/0/0 CLEAN NORMAL
X-TOI-MSGID: 8712a6f2-98ea-4734-b3e9-2cb5faafcc43
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199915

--=-u78VF1cdZDWt2o1qARRR
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, May 27 2024 at 06:39:44 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Someone sent the same version update but without the patch, so
> presumably it works for them? Do you have something special in your
> setup, can you try with plain poky master without the patch?

I'm additionally building with
PACKAGECONFIG:append = " gtk libidn"

I'll verify if thats the reason


--=-u78VF1cdZDWt2o1qARRR
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, May 27 2024 at 06:39:44 PM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Someone sent the same version update but without the patch, so
presumably it works for them? Do you have something special in your
setup, can you try with plain poky master without the patch?</div></blockquote><div><br></div><div>I'm additionally building with</div><div>PACKAGECONFIG:append = " gtk libidn"</div><div><br></div><div>I'll verify if thats the reason</div></div>
--=-u78VF1cdZDWt2o1qARRR--


