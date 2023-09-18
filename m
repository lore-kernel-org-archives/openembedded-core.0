Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3D0C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 11:40:24 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.48929.1695037222798717471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 04:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id D1D80540BE;
	Mon, 18 Sep 2023 13:40:20 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.161.214]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiCc0-0lclAO0; Mon, 18 Sep 2023 13:40:20 +0200
Date: Mon, 18 Sep 2023 13:40:25 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/4] libxmlb: import recipe from meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <D3J61S.AQNAPI025HYK@t-online.de>
In-Reply-To: <CANNYZj-73pCe_yRamvNM=9U2sGdv+ty9-QO8g=5QVkPD9crmdQ@mail.gmail.com>
References: <20230917182829.2153680-1-f_l_k@t-online.de>
	<64a23553aec159f4d506efd799eca893c7d9f25c.camel@linuxfoundation.org>
	<DKI61S.U4D11V8BDTPG3@t-online.de>
	<CANNYZj-73pCe_yRamvNM=9U2sGdv+ty9-QO8g=5QVkPD9crmdQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-XUkgkE4eY2CpEyN/nGE7"
X-TOI-EXPURGATEID: 150726::1695037220-1FFF716C-614DDAF9/0/0 CLEAN NORMAL
X-TOI-MSGID: 1237dc81-2945-434e-8419-95368f8614cb
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 11:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187826

--=-XUkgkE4eY2CpEyN/nGE7
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Sep 18 2023 at 01:33:56 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> You need to first check (with kvm) how long the tests are taking (and
> that they pass, obviously), then add to one of the lists in
> ptest-packagelists.inc.

I did that already to check if the test is working at all. It took a 
few minutes. Didn't focus on that but I guess its been about 1-2 
Minutes.
That is a fast one, I guess?


--=-XUkgkE4eY2CpEyN/nGE7
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Sep 18 2023 at 01:33:56 PM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">You need to first check (with kvm) how long the tests are taking (and
that they pass, obviously), then add to one of the lists in
ptest-packagelists.inc.
</div></blockquote><div><br></div><div>I did that already to check if the test is working at all. It took a few minutes. Didn't focus on that but I guess its been about 1-2 Minutes.</div><div>That is a fast one, I guess?</div></div>
--=-XUkgkE4eY2CpEyN/nGE7--


