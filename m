Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED68C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 12:22:47 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.19711.1713183758298421393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 05:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id 79A532D500;
	Mon, 15 Apr 2024 14:22:11 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.43.130]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rwLLc-1KqOXY0; Mon, 15 Apr 2024 14:22:08 +0200
Date: Mon, 15 Apr 2024 14:22:26 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCHv2 1/2] libei: import recipe from meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Message-Id: <E1HZBS.QW2ZU0PPKK2O2@t-online.de>
In-Reply-To: <CANNYZj9dv1AEOiQdg7xOB9uUwCoW_C_sS5RLmDNX0-WVZ0z=iA@mail.gmail.com>
References: <17C66EFC7A908A1D.10598@lists.openembedded.org>
	<YKDZBS.QFD0S4Q09SWT@t-online.de>
	<CANNYZj_8mwSFRf42_BkUv_=b_49vm6P0kKnELw+1fY48Mb=2aA@mail.gmail.com>
	<S9FZBS.32DDJ2ORYUB6@t-online.de>
	<CANNYZj9dv1AEOiQdg7xOB9uUwCoW_C_sS5RLmDNX0-WVZ0z=iA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/duTcJ5McwL9X11azcTJ"
X-TOI-EXPURGATEID: 150726::1713183728-62FFB3C7-CA011E43/0/0 CLEAN NORMAL
X-TOI-MSGID: 9486602a-bc6e-4251-af76-a17b5b292c63
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 12:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198236

--=-/duTcJ5McwL9X11azcTJ
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Apr 15 2024 at 01:54:48 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> This means we need a new set of PACKAGECONFIG options for xwayland_ei,
> and pick the one that sets it to to false by default. Similar to
> XORG_CRYPTO in that recipe.

Thank you for the review. I have made these changes and verified that 
all three options work.
Great :)


--=-/duTcJ5McwL9X11azcTJ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Apr 15 2024 at 01:54:48 PM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This means we need a new set of PACKAGECONFIG options for xwayland_ei,
and pick the one that sets it to to false by default. Similar to
XORG_CRYPTO in that recipe.</div></blockquote><div><br></div><div><div>Thank you for the review. I have made these changes and verified that all three options work.</div><div>Great :)</div></div></div>
--=-/duTcJ5McwL9X11azcTJ--


