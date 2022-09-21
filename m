Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80212C6FA82
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 17:15:03 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.9176.1663780494366285585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 10:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout05.t-online.de (Postfix) with SMTP id 40D801BCC7;
	Wed, 21 Sep 2022 19:14:21 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.47.145]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ob3Ih-1nI8ES0; Wed, 21 Sep 2022 19:14:19 +0200
Date: Wed, 21 Sep 2022 19:14:13 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] virglrenderer: upgrade 0.9.1 -> 0.10.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <P7LKIR.3NI8GTU36ICA3@t-online.de>
In-Reply-To: 
	<f24ebe6e876ed33b07719f339aadd5ef43c28c45.camel@linuxfoundation.org>
References: <20220921075113.187693-1-f_l_k@t-online.de>
	<f24ebe6e876ed33b07719f339aadd5ef43c28c45.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LLKlotuWSXICrfFeZgT4"
X-TOI-EXPURGATEID: 150726::1663780459-2E8B5EA1-3CECDFF0/0/0 CLEAN NORMAL
X-TOI-MSGID: 7d8d6491-d06b-40b4-86da-84e55d4794e0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 17:15:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170955

--=-LLKlotuWSXICrfFeZgT4
Content-Type: text/plain; charset=us-ascii; format=flowed

I started with a clean master branch and encountered the patch fuzz 
warning on the first build. But to verify that the driver was working, 
I wanted to run my wayland image with 'runqemu'. That required a whole 
bunch of extra files to be changed, and I ended up forgetting to fix 
the patch. Sorry

But I can confirm that I was able to run the image with the runqemu 
script. The driver should work.

Am Mi, 21. Sep 2022 um 14:38:02 +0100 schrieb Richard Purdie 
<richard.purdie@linuxfoundation.org>:
> On Wed, 2022-09-21 at 09:51 +0200, Markus Volk wrote:
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../virglrenderer/virglrenderer_0.10.3.bb     | 33 
>> +++++++++++++++++++
>>   .../virglrenderer/virglrenderer_0.9.1.bb      | 25 --------------
>>   2 files changed, 33 insertions(+), 25 deletions(-)
>>   create mode 100644 
>> meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
>>   delete mode 100644 
>> meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
> 
> The patches weren't refreshed leading to fuzz warnings:
> 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5884/steps/11/logs/warnings>
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5931/steps/11/logs/warnings>
> 
> and many many more like it in that build.
> 
> How was this tested? :/
> 
> Cheers,
> 
> Richard
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170950): 
> <https://lists.openembedded.org/g/openembedded-core/message/170950>
> Mute This Topic: <https://lists.openembedded.org/mt/93821898/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-LLKlotuWSXICrfFeZgT4
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I started with a clean master branch and encountered the patch fuzz warning on the first build. But to verify that the driver was working, I wanted to run my wayland image with 'runqemu'. That required a whole bunch of extra files to be changed, and I ended up forgetting to fix the patch. Sorry</div><div><br></div><div>But I can confirm that I was able to run the image with the runqemu script. The driver should work.</div></div><div id="geary-quote" dir="auto"><br>Am Mi, 21. Sep 2022 um 14:38:02 +0100 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Wed, 2022-09-21 at 09:51 +0200, Markus Volk wrote:
<blockquote> Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  .../virglrenderer/virglrenderer_0.10.3.bb     | 33 +++++++++++++++++++
  .../virglrenderer/virglrenderer_0.9.1.bb      | 25 --------------
  2 files changed, 33 insertions(+), 25 deletions(-)
  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
  delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
</blockquote>
The patches weren't refreshed leading to fuzz warnings:

<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5884/steps/11/logs/warnings">https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5884/steps/11/logs/warnings</a>
<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5931/steps/11/logs/warnings">https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5931/steps/11/logs/warnings</a>

and many many more like it in that build.

How was this tested? :/

Cheers,

Richard
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#170950): <a href="https://lists.openembedded.org/g/openembedded-core/message/170950">https://lists.openembedded.org/g/openembedded-core/message/170950</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/93821898/3618223">https://lists.openembedded.org/mt/93821898/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-LLKlotuWSXICrfFeZgT4--


