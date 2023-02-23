Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8511C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 21:39:34 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.2341.1677188368998077122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 13:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout05.t-online.de (Postfix) with SMTP id D9F382E3D;
	Thu, 23 Feb 2023 22:39:26 +0100 (CET)
Received: from [192.168.178.83] ([79.219.239.43]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pVJJ8-2vMZv60; Thu, 23 Feb 2023 22:39:18 +0100
Date: Thu, 23 Feb 2023 22:39:12 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv4] vte: update 0.70.2 -> 0.70.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <CTYJQR.TBVBTTTWCSBP2@t-online.de>
In-Reply-To: 
	<e86a37ada8859a11797f5d88e54eb972601a8f77.camel@linuxfoundation.org>
References: <20230223191937.1215699-1-f_l_k@t-online.de>
	<CANNYZj96mFc9LN_R-Mn+6tzrNwW1TKr14bf6+1PaModzF+8gWA@mail.gmail.com>
	<HFUJQR.91EYCKKAYQ3R3@t-online.de>
	<CANNYZj8bg9srORG8rcOfqsmy420ZfFmSKAaZtJ7_D5eTibddDA@mail.gmail.com>
	<e86a37ada8859a11797f5d88e54eb972601a8f77.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-UjU8+UjI4lA9P+Lsskrb"
X-TOI-EXPURGATEID: 150726::1677188358-412BF378-74DFF75A/0/0 CLEAN NORMAL
X-TOI-MSGID: 1c533dc1-7cb7-4f0b-9ed3-b7461f4fea40
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 21:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177634

--=-UjU8+UjI4lA9P+Lsskrb
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 23. Feb 2023 um 21:27:25 +0000 schrieb Richard Purdie 
<richard.purdie@linuxfoundation.org>:
> Not necessarily. The question is whether we need gtk4 support in our
> SDK? I've prefer not to build/include things we don't need and I'm not
> sure where gtk4 is being used there as yet?

Also, I was wrong. Things are not that simple. gtk4 requires 
graphene-gobject and that is disabled by default for nativesdk. I 
really don't know why this didn't show up yesterday when I tested the 
build for nativesdk.

Using GI_DATA_ENABLED helped partially, but 'vala' still needs to be 
removed for nativesdk. Otherwise this looks pretty good now, builds for 
musl,x32,nativesdk. Fingers crossed that it passes the test now.


--=-UjU8+UjI4lA9P+Lsskrb
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 23. Feb 2023 um 21:27:25 +0000 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Not necessarily. The question is whether we need gtk4 support in our
SDK? I've prefer not to build/include things we don't need and I'm not
sure where gtk4 is being used there as yet?</div></blockquote><div><br></div><div><div>Also, I was wrong. Things are not that simple. gtk4 requires graphene-gobject and that is disabled by default for nativesdk. I really don't know why this didn't show up yesterday when I tested the build for nativesdk.</div><div><br></div><div>Using GI_DATA_ENABLED helped partially, but 'vala' still needs to be removed for nativesdk. Otherwise this looks pretty good now, builds for musl,x32,nativesdk. Fingers crossed that it passes the test now.</div></div></div>
--=-UjU8+UjI4lA9P+Lsskrb--


