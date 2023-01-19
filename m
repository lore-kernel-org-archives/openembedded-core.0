Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9512DC46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 18:12:02 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.52913.1674151920952898928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 10:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id 5A37651EC;
	Thu, 19 Jan 2023 19:11:58 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.208]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pIZOH-41G0au0; Thu, 19 Jan 2023 19:11:57 +0100
Date: Thu, 19 Jan 2023 19:11:52 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gptfdisk: add follow-up patch to fix with
 current popt
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <SVVQOR.3E7X7N48W2OK1@t-online.de>
In-Reply-To: 
	<CANNYZj_n=mVXPiDsfuW3vW-bCos57_dD+ffTZ8Bz7uZ9zb_d8A@mail.gmail.com>
References: <20230119131853.27372-1-f_l_k@t-online.de>
	<CANNYZj-ihaDgJ1Nar=h6oxq0GcA_J4-jouWfTacdoViNmRZuTQ@mail.gmail.com>
	<G9OQOR.29KQBNHWF95M@t-online.de>
	<CANNYZj8DpFxQfTJtWoyGyUkLRjZgKRoLKKJu4KXB77r755hEQw@mail.gmail.com>
	<2LTQOR.QLNMTZ06LFDD3@t-online.de>
	<CANNYZj_n=mVXPiDsfuW3vW-bCos57_dD+ffTZ8Bz7uZ9zb_d8A@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IzR/IH0m6FAp2G67mTCW"
X-TOI-EXPURGATEID: 150726::1674151917-D53B29DF-DD9BC7F7/0/0 CLEAN NORMAL
X-TOI-MSGID: 4744f19d-adb0-4e85-bfaf-ca450d08e43f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 18:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176159

--=-IzR/IH0m6FAp2G67mTCW
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 19. Jan 2023 um 18:33:35 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> no one
> expects you to produce a perfect patch and complete understanding of
> the issue in your head up-front.

I really didn't find the git repository and thought they were still 
using subversion. But I have to admit that I didn't search thoroughly. 
When I see code still hosted on Sourceforge, I'm automatically a bit 
skeptical.  It's not hard to do merge requests, but I really prefer to 
know something before I do it. And it's of course also a bit of a 
hassle.
The only thing I know for now is that it fixes a segfault, thats what I 
at least have tested. So it looks like an improvement.

But now that I have a git repo, I guess I lack the excuse ;)


--=-IzR/IH0m6FAp2G67mTCW
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 19. Jan 2023 um 18:33:35 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">no one
expects you to produce a perfect patch and complete understanding of
the issue in your head up-front.</div></blockquote><div><br></div><div><div>I really didn't find the git repository and thought they were still using subversion. But I have to admit that I didn't search thoroughly. When I see code still hosted on Sourceforge, I'm automatically a bit skeptical. &nbsp;It's not hard to do merge requests, but I really prefer to know something before I do it. And it's of course also a bit of a hassle.</div><div><div>The only thing I know for now is that it fixes a segfault, thats what I at least have tested. So it looks like an improvement.</div></div><div><br></div><div>But now that I have a git repo, I guess I lack the excuse ;)</div></div></div>
--=-IzR/IH0m6FAp2G67mTCW--


