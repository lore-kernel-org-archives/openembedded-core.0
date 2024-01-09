Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8517CC4706C
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 19:10:32 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.26039.1704827431831267753
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 11:10:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout03.t-online.de (Postfix) with SMTP id E6172429DA;
	Tue,  9 Jan 2024 20:10:29 +0100 (CET)
Received: from [192.168.178.67] ([84.154.162.27]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rNHUb-0pStWK0; Tue, 9 Jan 2024 20:10:29 +0100
Date: Tue, 09 Jan 2024 18:21:14 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] webp: switch recipe to cmake buildsystem
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <E7807S.VVM2UHW4HZEC1@t-online.de>
In-Reply-To: <ddc2301e942a551d895943886fd69da4038341a7.camel@linuxfoundation.org>
References: <20240109132826.2445412-1-f_l_k@t-online.de>
	<ddc2301e942a551d895943886fd69da4038341a7.camel@linuxfoundation.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/dUMIJgbsyvK6fVnBdVE"
X-TOI-EXPURGATEID: 150726::1704827429-5181C95D-365E3969/0/0 CLEAN NORMAL
X-TOI-MSGID: a9d09742-7926-4e38-a337-671b65885e7a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 19:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193478

--=-/dUMIJgbsyvK6fVnBdVE
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Jan 9 2024 at 02:10:10 PM +00:00:00, Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> The trouble is things can end up in the sysroot via indirect
> dependencies so this change allows unintended changes to creep in (a
> dependency adds jpeg so the config of webp could change too). I'm
> therefore not happy about having "floating" dependencies this
> introduces.

Yes, this actually happens and also triggered me, that's why I 
mentioned it.
The issue for me is, that this is google code and google would force me 
to create/use a google account even to contact them.
Therefore I feel strongly uninvited there.

I tried to resolve the issue and sent a v2. But for the above reason I 
won't be taking the patch to google


--=-/dUMIJgbsyvK6fVnBdVE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Jan 9 2024 at 02:10:10 PM +00:00:00, Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">The trouble is things can end up in the sysroot via indirect
dependencies so this change allows unintended changes to creep in (a
dependency adds jpeg so the config of webp could change too). I'm
therefore not happy about having "floating" dependencies this
introduces.</div></blockquote><div><br></div><div><div>Yes, this actually happens and also triggered me, that's why I mentioned it.</div><div>The issue for me is, that this is google code and google would force me to create/use a google account even to contact them.</div><div>Therefore I feel strongly uninvited there.</div><div><br></div><div>I tried to resolve the issue and sent a v2. But for the above reason I won't be taking the patch to google</div></div></div>
--=-/dUMIJgbsyvK6fVnBdVE--


