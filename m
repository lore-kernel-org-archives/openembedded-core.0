Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42E8D2E9CD
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 09:46:18 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.55756.1731318369308407308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 01:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout07.t-online.de (Postfix) with SMTP id 3F49F9D7;
	Mon, 11 Nov 2024 10:46:07 +0100 (CET)
Received: from [192.168.178.67] ([84.154.170.97]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tAQzk-2ARoZs0; Mon, 11 Nov 2024 10:46:04 +0100
Date: Mon, 11 Nov 2024 10:48:25 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <PW5SMS.YER64B7Q8HYQ@t-online.de>
In-Reply-To: <02ea8fa9-b33d-4f10-b8a9-98a4f62c1d1f@windriver.com>
References: <20241110132848.2135721-1-f_l_k@t-online.de>
	<02ea8fa9-b33d-4f10-b8a9-98a4f62c1d1f@windriver.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-yLHprOq0lWHV++TNT7N3"
X-TOI-EXPURGATEID: 150726::1731318364-8963143E-A4E03D1A/0/0 CLEAN NORMAL
X-TOI-MSGID: 912cecee-a949-4be5-bc7e-5ba0f3123318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206940

--=-yLHprOq0lWHV++TNT7N3
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Nov 11 2024 at 03:07:30 PM +08:00:00, ChenQi 
<Qi.Chen@windriver.com> wrote:
> ?

1) I didn't diff the output files yet, so I don't have a valid answer 
to this. I just looked at log.do_configure with and without this option 
and did some runtime testing
2) Generally speaking, a binary changes when a feature is added. 
Ideally, a feature should only be added if this is explicitly 
specified. Otherwise there can always be differences (e.g. because a 
tool is searched for and found on the host machine). This can lead to 
different results on different distributions/installations.


--=-yLHprOq0lWHV++TNT7N3
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Nov 11 2024 at 03:07:30 PM +08:00:00, ChenQi &lt;Qi.Chen@windriver.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">?</div></blockquote><div><br></div><div>1) I didn't diff the output files yet, so I don't have a valid answer to this. I just looked at log.do_configure with and without this option and did some runtime testing</div><div>2) Generally speaking, a binary changes when a feature is added. Ideally, a feature should only be added if this is explicitly specified. Otherwise there can always be differences (e.g. because a tool is searched for and found on the host machine). This can lead to different results on different distributions/installations.</div></div>
--=-yLHprOq0lWHV++TNT7N3--


