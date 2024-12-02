Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7E4D7830F
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 11:37:18 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.172127.1733139436376526392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 03:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id 258481013;
	Mon,  2 Dec 2024 12:37:14 +0100 (CET)
Received: from [192.168.178.67] ([84.154.160.60]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tI4jp-1CicwS0; Mon, 2 Dec 2024 12:37:13 +0100
Date: Mon, 02 Dec 2024 12:37:08 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] pam: update 1.6.1 -> 1.7.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <WX6VNS.5H7C19CD19ZL2@t-online.de>
In-Reply-To: <CANNYZj9jpLRJyrE8LUbRv7LwmyFA6BgwqbDvPumR=Zvv5oUohQ@mail.gmail.com>
References: <20241202105339.58026-1-f_l_k@t-online.de>
	<CANNYZj9jpLRJyrE8LUbRv7LwmyFA6BgwqbDvPumR=Zvv5oUohQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Hl6cMZ4qOaxGxx108Zau"
X-TOI-EXPURGATEID: 150726::1733139433-38FF926E-A59DDB72/0/0 CLEAN NORMAL
X-TOI-MSGID: d9df3843-d006-4890-81a4-541e9e23a74c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 11:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208140

--=-Hl6cMZ4qOaxGxx108Zau
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Dec 2 2024 at 12:06:17 +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Please see my comment elsewhere, it's better to split this into
> several patches, each dealing with a particular issue (in particular
> the version update shouldn't be bundled with all the other changes).
> 
> Alex

Fair enough. I haven't gotten around to cleaning it up yet and there is 
also still
a patch in it with ;apply=no that needs to be deleted. I'd better wait 
for the update
and add the changes afterwards. I just wanted to submit the patch for 
review to see
if that would even be an optionat all


--=-Hl6cMZ4qOaxGxx108Zau
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Dec 2 2024 at 12:06:17 +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Please see my comment elsewhere, it's better to split this into
several patches, each dealing with a particular issue (in particular
the version update shouldn't be bundled with all the other changes).

Alex</div></blockquote><div><br></div><div><div>Fair enough. I haven't gotten around to cleaning it up yet and there is also still</div><div>a patch in it with ;apply=no that needs to be deleted. I'd better wait for the update</div><div>and add the changes afterwards. I just wanted to submit the patch for review to see</div><div>if that would even be an optionat all</div></div></div>
--=-Hl6cMZ4qOaxGxx108Zau--


