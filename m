Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6ADC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 17:03:55 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.2261.1716829427632510314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 10:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout04.t-online.de (Postfix) with SMTP id D575F23D90;
	Mon, 27 May 2024 19:03:45 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.33.219]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBdlB-2BIt160; Mon, 27 May 2024 19:03:45 +0200
Date: Mon, 27 May 2024 19:04:18 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] ghostscript: update 10.03.0 -> 10.03.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <63M5ES.7R9MO217YEQ43@t-online.de>
In-Reply-To: <CANNYZj9iHD2sS7HNXrPLujxCVxe8JCygdtwpRTDUoLsWy73VmQ@mail.gmail.com>
References: <20240527161104.2954913-1-f_l_k@t-online.de>
	<17D364C190E1284E.7888@lists.openembedded.org>
	<CANNYZj8q1zqypRzFMdkt8hJ9bGGWjROW51EHO1P1fG-bFvCP2w@mail.gmail.com>
	<NNK5ES.VJH4NYNWIV9K2@t-online.de>
	<CANNYZj9iHD2sS7HNXrPLujxCVxe8JCygdtwpRTDUoLsWy73VmQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-x6lGMAtPqEBg0xJ3fRLN"
X-TOI-EXPURGATEID: 150726::1716829425-68D8B3C7-F3D55FE0/0/0 CLEAN NORMAL
X-TOI-MSGID: f82520f5-65cc-49ef-b9f8-272f97f8146e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 17:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199917

--=-x6lGMAtPqEBg0xJ3fRLN
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, May 27 2024 at 06:39:44 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Do you have something special in your
> setup, can you try with plain poky master without the patch?

This error is caused by adding the 'libidn' PACKAGECONFIG


--=-x6lGMAtPqEBg0xJ3fRLN
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, May 27 2024 at 06:39:44 PM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Do you have something special in your
setup, can you try with plain poky master without the patch?</div></blockquote><div><br></div><div>This error is caused by adding the 'libidn' PACKAGECONFIG</div></div>
--=-x6lGMAtPqEBg0xJ3fRLN--


