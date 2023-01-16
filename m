Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070CAC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 17:20:59 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.173261.1673889650892167618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 09:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id CBF9114D8A;
	Mon, 16 Jan 2023 18:20:48 +0100 (CET)
Received: from [192.168.178.83] ([79.219.233.67]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pHTA8-0zTFr60; Mon, 16 Jan 2023 18:20:48 +0100
Date: Mon, 16 Jan 2023 18:20:42 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] neard: dont pull in wpa-supplicant
 unconditionally
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <II9LOR.Y1Q7EACQVKAA1@t-online.de>
In-Reply-To: 
	<74d632633cef4a52f0833ee6eeb1141403ecbff4.camel@linuxfoundation.org>
References: <20230116164325.289867-1-f_l_k@t-online.de>
	<ca881583fdf1906bb5828607c19a11113cbd895d.camel@linuxfoundation.org>
	<838LOR.7MMYBGDJNPM51@t-online.de>
	<74d632633cef4a52f0833ee6eeb1141403ecbff4.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-kNVanLnYUEe2W9iIo3Go"
X-TOI-EXPURGATEID: 150726::1673889648-AAFF4A74-193420E6/0/0 CLEAN NORMAL
X-TOI-MSGID: afdb0579-9dde-437e-9e68-f59dbbc84085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 17:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176009

--=-kNVanLnYUEe2W9iIo3Go
Content-Type: text/plain; charset=us-ascii; format=flowed

Yes, that's right, of course. What would be the preferred way to deal 
with this. The dependency on wpa-supplicant is a bit annoying. Should I 
use a bbappend to remove it, or is the RRECOMMEND on wpa-supplicant 
perhaps removable from the neard recipe?

Am Mo, 16. Jan 2023 um 17:03:09 +0000 schrieb Richard Purdie 
<richard.purdie@linuxfoundation.org>:
> On Mon, 2023-01-16 at 17:49 +0100, Markus Volk wrote:
> 
>>  > That isn't going to work as there is no default value for
>>  > WIRELESS_DAEMON ?
>>  >
>> 
>>  We have it set here
>> 
>>  
>> <https://git.yoctoproject.org/poky/commit/?id=1eaf64fbe16d2ceb472623c65c961b36aee33608>
>> 
> 
> Sure, but the neard recipe can't see in the packagegroup-base recipe
> scope?
> 
> Cheers,
> 
> Richard
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176008): 
> <https://lists.openembedded.org/g/openembedded-core/message/176008>
> Mute This Topic: <https://lists.openembedded.org/mt/96310274/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-kNVanLnYUEe2W9iIo3Go
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Yes, that's right, of course. What would be the preferred way to deal with this. The dependency on wpa-supplicant is a bit annoying. Should I use a bbappend to remove it, or is the RRECOMMEND on wpa-supplicant perhaps removable from the neard recipe?</div></div><div id="geary-quote" dir="auto"><br>Am Mo, 16. Jan 2023 um 17:03:09 +0000 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Mon, 2023-01-16 at 17:49 +0100, Markus Volk wrote:

<blockquote> &gt; That isn't going to work as there is no default value for
 &gt; WIRELESS_DAEMON ?
 &gt; 

 We have it set here
 
 <a href="https://git.yoctoproject.org/poky/commit/?id=1eaf64fbe16d2ceb472623c65c961b36aee33608">https://git.yoctoproject.org/poky/commit/?id=1eaf64fbe16d2ceb472623c65c961b36aee33608</a>
 
</blockquote>
Sure, but the neard recipe can't see in the packagegroup-base recipe
scope?

Cheers,

Richard
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#176008): <a href="https://lists.openembedded.org/g/openembedded-core/message/176008">https://lists.openembedded.org/g/openembedded-core/message/176008</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/96310274/3618223">https://lists.openembedded.org/mt/96310274/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-kNVanLnYUEe2W9iIo3Go--


