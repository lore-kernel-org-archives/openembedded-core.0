Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB5CE6ADF4
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 11:00:42 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.45360.1732359635247641366
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 03:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 52328A58;
	Sat, 23 Nov 2024 12:00:33 +0100 (CET)
Received: from [192.168.178.67] ([84.163.36.244]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tEnsO-0ehms40; Sat, 23 Nov 2024 12:00:32 +0100
Date: Sat, 23 Nov 2024 12:00:27 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gcc: add a backport patch to fix an issue with
 tzdata 2024b
To: Steve Sakoman <steve@sakoman.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, f_l_k@t-online.de,
	openembedded-core@lists.openembedded.org
Message-Id: <R8HENS.P1NP684GLCTM2@t-online.de>
In-Reply-To: <CAOSpxdaeYv3DEcSXHs4j0c-+XZaR=PfokWF09TCuJ8QKpABEBg@mail.gmail.com>
References: <20241122012941.3055-1-f_l_k@t-online.de>
	<CA+chaQcL_dGkNAgVXD3JWvKFObQ=73tfSbkJcdFHbkDH9HqD5w@mail.gmail.com>
	<CAOSpxdaeYv3DEcSXHs4j0c-+XZaR=PfokWF09TCuJ8QKpABEBg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-gKtn4j2YSXhOHYQHV6kx"
X-TOI-EXPURGATEID: 150726::1732359632-7A7F8786-432B1B8E/0/0 CLEAN NORMAL
X-TOI-MSGID: abe1a6bb-c2a7-4cba-a0ce-6cbfca56096a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 11:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207678

--=-gKtn4j2YSXhOHYQHV6kx
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Nov 22 2024 at 05:33:29 AM -08:00:00, Steve Sakoman 
<steve@sakoman.com> wrote:
> Markus, could you send versions of this patch for stable branches too?
> (styhead, scarthgap, kirkstone)

I have sent the patches, but only verified that they would apply. I 
can't comile test them as I dont have buildsystems set up for any of 
these branches


--=-gKtn4j2YSXhOHYQHV6kx
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Nov 22 2024 at 05:33:29 AM -08:00:00, Steve Sakoman &lt;steve@sakoman.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Markus, could you send versions of this patch for stable branches too?
(styhead, scarthgap, kirkstone)</div></blockquote><div><br></div><div>I have sent the patches, but only verified that they would apply. I can't comile test them as I dont have buildsystems set up for any of these branches</div></div>
--=-gKtn4j2YSXhOHYQHV6kx--


