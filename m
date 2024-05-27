Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E66AC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 16:32:55 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.1567.1716827573583277442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 09:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout02.t-online.de (Postfix) with SMTP id AD78823107;
	Mon, 27 May 2024 18:32:51 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.33.219]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBdHF-2Y7fe40; Mon, 27 May 2024 18:32:49 +0200
Date: Mon, 27 May 2024 18:33:23 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] ghostscript: update 10.03.0 -> 10.03.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <NNK5ES.VJH4NYNWIV9K2@t-online.de>
In-Reply-To: <CANNYZj8q1zqypRzFMdkt8hJ9bGGWjROW51EHO1P1fG-bFvCP2w@mail.gmail.com>
References: <20240527161104.2954913-1-f_l_k@t-online.de>
	<17D364C190E1284E.7888@lists.openembedded.org>
	<CANNYZj8q1zqypRzFMdkt8hJ9bGGWjROW51EHO1P1fG-bFvCP2w@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tBJqr0rLWxWcZ++BhF6r"
X-TOI-EXPURGATEID: 150726::1716827569-FEFFB352-6EE15A19/0/0 CLEAN NORMAL
X-TOI-MSGID: b82ee0f3-aa53-40d0-a6ba-3759b89006d2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199912

--=-tBJqr0rLWxWcZ++BhF6r
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, May 27 2024 at 06:22:34 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> With this error, forcing a cast may be masking the real issue? int
> should not be forced into a pointer to int, ever.

Thanks. That was the information I was hoping for.

Anyway, build for ghostscript currently fails and if the cast is 
causing the real issue, maybe it should be for now fixed like this?

CFLAGS += "-Wno-int-conversion"


--=-tBJqr0rLWxWcZ++BhF6r
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, May 27 2024 at 06:22:34 PM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">With this error, forcing a cast may be masking the real issue? int
should not be forced into a pointer to int, ever.</div></blockquote><div><br></div><div>Thanks. That was the information I was hoping for.</div><div><br></div><div>Anyway, build for ghostscript currently fails and if the cast is causing the real issue, maybe it should be for now fixed like this?</div><div><br></div><div>CFLAGS += "-Wno-int-conversion"</div></div>
--=-tBJqr0rLWxWcZ++BhF6r--


