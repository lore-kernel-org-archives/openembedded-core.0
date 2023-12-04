Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9318C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 07:04:59 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.63508.1701673496662819324
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 23:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout01.t-online.de (Postfix) with SMTP id ED68220DD6;
	Mon,  4 Dec 2023 08:04:53 +0100 (CET)
Received: from [192.168.178.67] ([84.163.47.5]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rA30d-1D3Weu0; Mon, 4 Dec 2023 08:04:51 +0100
Date: Mon, 04 Dec 2023 08:05:31 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] pciutils: add packageconfigs for options
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <7PR45S.RXSR40OIMQVU3@t-online.de>
In-Reply-To: <de1b836711c50aca80e47411f9b64d1b2a59076c.camel@linuxfoundation.org>
References: <20231127070746.3199347-1-f_l_k@t-online.de>
	<de1b836711c50aca80e47411f9b64d1b2a59076c.camel@linuxfoundation.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-E4OjJn3/N+pj9ntkaxR/"
X-TOI-EXPURGATEID: 150726::1701673491-3DA409FB-153F856A/0/0 CLEAN NORMAL
X-TOI-MSGID: b1b9864d-0427-423d-a37f-87bbcfb61a53
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191723

--=-E4OjJn3/N+pj9ntkaxR/
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Dec 3 2023 at 01:24:06 PM +00:00:00, Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> FWIW I think the default of compression makes sense gives our embedded
> targets so I'd argue against that change.

Also though about not changing the default, because it'll increase size 
by about one MB. On the other hand the only consumer of pci.ids I know 
of requires to read it uncompressed plus it's packaged into its own 
package, so its not installed by default.
I'll split the patch up but will have to find some time first to look 
at the issue this patch causes to the autobuilder.




--=-E4OjJn3/N+pj9ntkaxR/
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Dec 3 2023 at 01:24:06 PM +00:00:00, Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">FWIW I think the default of compression makes sense gives our embedded
targets so I'd argue against that change.</div></blockquote><div><br></div><div>Also though about not changing the default, because it'll increase size by about one MB. On the other hand the only consumer of pci.ids I know of requires to read it uncompressed plus it's packaged into its own package, so its not installed by default.</div><div>I'll split the patch up but will have to find some time first to look at the issue this patch causes to the autobuilder.</div><div><br></div><div><br></div></div>
--=-E4OjJn3/N+pj9ntkaxR/--


