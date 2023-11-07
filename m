Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7705C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 10:18:02 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.7393.1699352275518875106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 02:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id 5683517B77;
	Tue,  7 Nov 2023 11:17:53 +0100 (CET)
Received: from [192.168.178.62] ([84.154.173.54]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0J9c-0P9hOy0; Tue, 7 Nov 2023 11:17:53 +0100
Date: Tue, 07 Nov 2023 11:18:15 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][RFC][PATCH] vala.bbclass: enable vapi build if class is
 inherited
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <FM0R3S.LJIIPJV21YAH3@t-online.de>
In-Reply-To: <CANNYZj-+78t2Pu908g3zRGgGYG4GUM_S3ZkrPBmkjPq+tUwsxg@mail.gmail.com>
References: <20231107100149.1048627-1-f_l_k@t-online.de>
	<CANNYZj-+78t2Pu908g3zRGgGYG4GUM_S3ZkrPBmkjPq+tUwsxg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-NO8RNixCleTrcS9orOT8"
X-TOI-EXPURGATEID: 150726::1699352273-C5BE2DAC-338E1455/0/0 CLEAN NORMAL
X-TOI-MSGID: e544b5cd-ec15-4776-810a-40163bae4357
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 10:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190263

--=-NO8RNixCleTrcS9orOT8
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Nov 7 2023 at 11:06:26 AM +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> There is quite a bit more recipes in core that inherit vala. Shouldn't
> they be as well tweaked to rely on the class doing the right thing?

yes, and I build almost all of them regulary. On a first look it seems 
like they already do the right thing. I encountered some breakage in 
meta-openembedded and one issue in meta-virtualization so far. I'll 
send RFC patches for that and I'll also do more testing with oe-core


--=-NO8RNixCleTrcS9orOT8
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Nov 7 2023 at 11:06:26 AM +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">There is quite a bit more recipes in core that inherit vala. Shouldn't
they be as well tweaked to rely on the class doing the right thing?</div></blockquote><div><br></div><div>yes, and I build almost all of them regulary. On a first look it seems like they already do the right thing. I encountered some breakage in meta-openembedded and one issue in meta-virtualization so far. I'll send RFC patches for that and I'll also do more testing with oe-core &nbsp;</div></div>
--=-NO8RNixCleTrcS9orOT8--


