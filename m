Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD74E64AAD
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 14:00:04 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.20457.1733234397034667094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 4A1A3EE1;
	Tue,  3 Dec 2024 14:59:55 +0100 (CET)
Received: from [192.168.178.67] ([79.219.235.82]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tITRQ-0u27tY0; Tue, 3 Dec 2024 14:59:52 +0100
Date: Tue, 03 Dec 2024 14:59:51 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] pam: update 1.6.1 -> 1.7.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <R78XNS.UI8NYXWW9D1A2@t-online.de>
In-Reply-To: <180D59229FBE9F1F.18476@lists.openembedded.org>
References: <20241202105339.58026-1-f_l_k@t-online.de>
	<CANNYZj9jpLRJyrE8LUbRv7LwmyFA6BgwqbDvPumR=Zvv5oUohQ@mail.gmail.com>
	<180D59229FBE9F1F.18476@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-DyFouiG1AsE75BReGAcw"
X-TOI-EXPURGATEID: 150726::1733234392-A27EF96B-30E1F46D/0/0 CLEAN NORMAL
X-TOI-MSGID: 174e6d41-2717-481c-aada-bf263007ce6f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208213

--=-DyFouiG1AsE75BReGAcw
Content-Type: text/plain; charset=us-ascii; format=flowed

Sent a v2 that adds the package split and more cleanup on top of the 
upcoming libpam update and

On Mon, Dec 2 2024 at 12:37:08 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> On Mon, Dec 2 2024 at 12:06:17 +01:00:00, Alexander Kanavin 
> <alex.kanavin@gmail.com> wrote:
>> Please see my comment elsewhere, it's better to split this into
>> several patches, each dealing with a particular issue (in particular
>> the version update shouldn't be bundled with all the other changes).
>> 
>> Alex
> 
> Fair enough. I haven't gotten around to cleaning it up yet and there 
> is also still
> a patch in it with ;apply=no that needs to be deleted. I'd better 
> wait for the update
> and add the changes afterwards. I just wanted to submit the patch for 
> review to see
> if that would even be an optionat all


--=-DyFouiG1AsE75BReGAcw
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Sent a v2 that adds the package split and more cleanup on top of the upcoming libpam update and</div></div><div id="geary-quote" dir="auto"><br>On Mon, Dec 2 2024 at 12:37:08 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div id="geary-body" dir="auto">On Mon, Dec 2 2024 at 12:06:17 +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Please see my comment elsewhere, it's better to split this into
several patches, each dealing with a particular issue (in particular
the version update shouldn't be bundled with all the other changes).

Alex</div></blockquote><div><br></div><div><div>Fair enough. I haven't gotten around to cleaning it up yet and there is also still</div><div>a patch in it with ;apply=no that needs to be deleted. I'd better wait for the update</div><div>and add the changes afterwards. I just wanted to submit the patch for review to see</div><div>if that would even be an optionat all</div></div></div>
</blockquote></div>
--=-DyFouiG1AsE75BReGAcw--


