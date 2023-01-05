Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E619C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 18:04:12 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.422.1672941849002854123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 10:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id D4EDD20278;
	Thu,  5 Jan 2023 19:04:06 +0100 (CET)
Received: from [192.168.178.83] ([79.219.228.197]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pDUb0-0gCSLw0; Thu, 5 Jan 2023 19:04:06 +0100
Date: Thu, 05 Jan 2023 19:04:00 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gcr3: update 3.40.0 -> 3.41.1
To: alexandre.belloni@bootlin.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <O6Y0OR.6XUFDVK24QTZ@t-online.de>
In-Reply-To: <Y7cQGj3L0Vcuktps@mail.local>
References: <20230101142414.463881-1-f_l_k@t-online.de>
	<Y7YD1ZgSe7b+UIBt@mail.local> <DMR0OR.Q1D80VIV2M3N1@t-online.de>
	<CANNYZj_A=RVVUVu0YQDWMOk=9ZXEQq3=UoR3iA+DAOP-qpe1AA@mail.gmail.com>
	<JWR0OR.6UB8QLRZ7CCN2@t-online.de> <Y7cQGj3L0Vcuktps@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-lTm263RT6fCjnNi9a6PZ"
X-TOI-EXPURGATEID: 150726::1672941846-01604ECF-10F4548E/0/0 CLEAN NORMAL
X-TOI-MSGID: 333232ec-7737-4d84-b539-4cfd172ef7bc
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 18:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175547

--=-lTm263RT6fCjnNi9a6PZ
Content-Type: text/plain; charset=us-ascii; format=flowed

 - convert from gtk-doc to gi-docgen

I added the change in the commit message, but you are right, I should 
have mentioned it in the mail as well.

Am Do, 5. Jan 2023 um 18:59:54 +0100 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> On 05/01/2023 16:48:19+0100, Markus Volk wrote:
>>  Am Do, 5. Jan 2023 um 16:46:37 +0100 schrieb Alexander Kanavin
>>  <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>:
>>  >
>> 
>>  I already sent a v2 patch that should fix it
>> 
> 
> Then please say so in v2, I can't guess why you sent a v2 when there
> where no comment on v1
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com <https://bootlin.com/>
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175546): 
> <https://lists.openembedded.org/g/openembedded-core/message/175546>
> Mute This Topic: <https://lists.openembedded.org/mt/95988912/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-lTm263RT6fCjnNi9a6PZ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><span style="white-space: break-spaces;"> - convert from gtk-doc to gi-docgen</span>
</div><div><span style="white-space: break-spaces;"><br></span></div><div><span style="white-space: break-spaces;">I added the change in the commit message, but you are right, I should have mentioned it in the mail as well.</span></div></div><div id="geary-quote" dir="auto"><br>Am Do, 5. Jan 2023 um 18:59:54 +0100 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On 05/01/2023 16:48:19+0100, Markus Volk wrote:
<blockquote> Am Do, 5. Jan 2023 um 16:46:37 +0100 schrieb Alexander Kanavin
 &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;:
 &gt; 
 
 I already sent a v2 patch that should fix it
 
</blockquote>
Then please say so in v2, I can't guess why you sent a v2 when there
where no comment on v1

<div>-- 
</div>Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a href="https://bootlin.com">https://bootlin.com</a>
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#175546): <a href="https://lists.openembedded.org/g/openembedded-core/message/175546">https://lists.openembedded.org/g/openembedded-core/message/175546</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/95988912/3618223">https://lists.openembedded.org/mt/95988912/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-lTm263RT6fCjnNi9a6PZ--


