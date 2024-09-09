Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3EDECE579
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 09:38:23 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.48942.1725874696339645040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 02:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id 107E28C63;
	Mon,  9 Sep 2024 11:38:14 +0200 (CEST)
Received: from [192.168.178.67] ([79.219.228.217]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1snaqa-24rKxE0; Mon, 9 Sep 2024 11:38:12 +0200
Date: Mon, 09 Sep 2024 11:39:49 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] mesa: update 24.0.7 -> 24.2.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <DIHJJS.B4YM11YGTKD43@t-online.de>
In-Reply-To: <CANNYZj91+H0FyxRQtWy4WTox+1a1X+ZUrpAXoQyfiqL8Xt9Vdw@mail.gmail.com>
References: <20240908165102.3699657-1-f_l_k@t-online.de>
	<CANNYZj91+H0FyxRQtWy4WTox+1a1X+ZUrpAXoQyfiqL8Xt9Vdw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-icAJalzZqzJu/EK//SeK"
X-TOI-EXPURGATEID: 150726::1725874692-4F7FD85B-336969E1/0/0 CLEAN NORMAL
X-TOI-MSGID: 0d6ccd3c-bb4c-4fc0-b213-fcb4b51a7de5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 09:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204322

--=-icAJalzZqzJu/EK//SeK
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Sep 9 2024 at 10:44:40 AM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Ongoing work to keep mesa current is appreciated, but you should start
> marking it RFC as well, and make it clear in the commit message that
> this won't be taken until someone sits down and gets clang integrated
> into core. I would love to see the project users making that
> contribution, but we should put a bit of pressure on them in the shape
> of shipping outdated mesa in a release.

Sorry, I did not realize that intel iris/vulkan would block update. In 
that case it will be best to do mesa updates in my image layer until 
clang makes it to oe-core. I have personal interest in mesa/rusticl 
because intel provides working raytracing for Alchemist with it.


--=-icAJalzZqzJu/EK//SeK
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Sep 9 2024 at 10:44:40 AM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Ongoing work to keep mesa current is appreciated, but you should start
marking it RFC as well, and make it clear in the commit message that
this won't be taken until someone sits down and gets clang integrated
into core. I would love to see the project users making that
contribution, but we should put a bit of pressure on them in the shape
of shipping outdated mesa in a release.</div></blockquote><div><br></div><div>Sorry, I did not realize that intel iris/vulkan would block update. In that case it will be best to do mesa updates in my image layer until clang makes it to oe-core. I have personal interest in mesa/rusticl because intel provides working raytracing for Alchemist with it.</div></div>
--=-icAJalzZqzJu/EK//SeK--


