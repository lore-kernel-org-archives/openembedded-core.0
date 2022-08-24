Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A534AC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 12:53:02 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web09.10489.1661345573184514163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 05:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout08.t-online.de (Postfix) with SMTP id 77C6C63AC;
	Wed, 24 Aug 2022 14:52:51 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.43.62]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oQpsI-3Kf4t60; Wed, 24 Aug 2022 14:52:50 +0200
Date: Wed, 24 Aug 2022 14:52:45 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] connman: add PACKAGECONFIG to support iwd
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: luca.ceresoli@bootlin.com, openembedded-core@lists.openembedded.org
Message-Id: <XFE4HR.DS3GGCNJRRBV3@t-online.de>
In-Reply-To: <6bf395b5-864f-4d2d-8fe9-fb05cbe3940e@theobroma-systems.com>
References: <20220823163809.17214-1-f_l_k@t-online.de>
	<20220824105440.1cdf49a7@booty> <UI34HR.PZNATSOSGVWO2@t-online.de>
	<20220824115108.6eee852c@booty>
	<6bf395b5-864f-4d2d-8fe9-fb05cbe3940e@theobroma-systems.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-90ZQ8ND7DuIfou7cVhVa"
X-TOI-EXPURGATEID: 150726::1661345570-01452558-E09A30D7/0/0 CLEAN NORMAL
X-TOI-MSGID: 0fbfca77-7d46-4c60-9b5e-795a205e8808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 12:53:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169813

--=-90ZQ8ND7DuIfou7cVhVa
Content-Type: text/plain; charset=us-ascii; format=flowed

thats true. I'll add it as runtime dependency then

Am Mi, 24. Aug 2022 um 14:09:52 +0200 schrieb Quentin Schulz 
<quentin.schulz@theobroma-systems.com>:
> Hi all,
> 
> On 8/24/22 11:51, Luca Ceresoli via lists.openembedded.org wrote:
>> Hello Markus,
>> 
>> On Wed, 24 Aug 2022 10:56:54 +0200
>> "Markus Volk" <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> wrote:
>> 
>>> Hello Luca,
>>> 
>>> Am Mi, 24. Aug 2022 um 10:54:40 +0200 schrieb Luca Ceresoli
>>> <luca.ceresoli@bootlin.com <mailto:luca.ceresoli@bootlin.com>>:
>>>> I would think iwd should be an rdepends, not an rrecommends. Any 
>>>> reson
>>>> for that? Or is it just an unintended extra ','?
>>> 
>>> Only reason for this was the fact, that iwd is not in oe-core so it
>>> felt wrong somehow to set it RDEPEND
>> 
>> I see, that's fine, but I wonder whether this should be clarified in 
>> a
>> comment. I'll be taking the patch for testing as is anyway.
>> 
> 
> IIRC the policy is to have a default configuration working. It is 
> fine to have PACKAGECONFIG options with dependencies on 
> recipes/packages not in the same layer.
> 
> Here, if someone builds with NO_RECOMMENDATIONS to have a minimal 
> setup but have iwd as WIRELESS_DAEMON, connman won't work because the 
> package won't be added to the image, it'll be a bit harder to debug 
> than a build failing because iwd recipe could not be found 
> (especially since I also didn't notice the additional comma).
> 
> Cheers,
> Quentin
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169809): 
> <https://lists.openembedded.org/g/openembedded-core/message/169809>
> Mute This Topic: <https://lists.openembedded.org/mt/93208331/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-90ZQ8ND7DuIfou7cVhVa
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>thats true. I'll add it as runtime dependency then</div></div><div id="geary-quote" dir="auto"><br>Am Mi, 24. Aug 2022 um 14:09:52 +0200 schrieb Quentin Schulz &lt;quentin.schulz@theobroma-systems.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Hi all,

On 8/24/22 11:51, Luca Ceresoli via lists.openembedded.org wrote:
<blockquote>Hello Markus,

On Wed, 24 Aug 2022 10:56:54 +0200
"Markus Volk" &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:

<blockquote>Hello Luca,

Am Mi, 24. Aug 2022 um 10:54:40 +0200 schrieb Luca Ceresoli
&lt;<a href="mailto:luca.ceresoli@bootlin.com">luca.ceresoli@bootlin.com</a>&gt;:
<blockquote>I would think iwd should be an rdepends, not an rrecommends. Any reson
for that? Or is it just an unintended extra ','?
</blockquote>
Only reason for this was the fact, that iwd is not in oe-core so it
felt wrong somehow to set it RDEPEND
</blockquote>
I see, that's fine, but I wonder whether this should be clarified in a
comment. I'll be taking the patch for testing as is anyway.

</blockquote>
IIRC the policy is to have a default configuration working. It is fine to have PACKAGECONFIG options with dependencies on recipes/packages not in the same layer.

Here, if someone builds with NO_RECOMMENDATIONS to have a minimal setup but have iwd as WIRELESS_DAEMON, connman won't work because the package won't be added to the image, it'll be a bit harder to debug than a build failing because iwd recipe could not be found (especially since I also didn't notice the additional comma).

Cheers,
Quentin
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#169809): <a href="https://lists.openembedded.org/g/openembedded-core/message/169809">https://lists.openembedded.org/g/openembedded-core/message/169809</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/93208331/3618223">https://lists.openembedded.org/mt/93208331/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-90ZQ8ND7DuIfou7cVhVa--


