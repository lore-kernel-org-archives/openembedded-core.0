Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAC4C61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 13:47:47 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.90944.1700747259015353099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 05:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout10.t-online.de (Postfix) with SMTP id F185612DB7;
	Thu, 23 Nov 2023 14:47:35 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.134]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r6A3K-0m0xTE0; Thu, 23 Nov 2023 14:47:34 +0100
Date: Thu, 23 Nov 2023 14:40:19 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCHv3] cups: Allow to be controlled by root and users
 in wheel
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <7NWK4S.WL0GC9LYMOPE3@t-online.de>
In-Reply-To: <aa9e1e82072027c73d4ce2b787a0a2cc9e4ada79.camel@linuxfoundation.org>
References: <20231120161848.1461683-1-f_l_k@t-online.de>
	<aa9e1e82072027c73d4ce2b787a0a2cc9e4ada79.camel@linuxfoundation.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BgD+41EE/1mRYZAuDzRe"
X-TOI-EXPURGATEID: 150726::1700747254-2F7FD958-0DB65DB0/0/0 CLEAN NORMAL
X-TOI-MSGID: e2ee6037-dc84-40aa-be29-00cf0b0ce7a8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 13:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191152

--=-BgD+41EE/1mRYZAuDzRe
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Nov 23 2023 at 12:50:20 PM +00:00:00, Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> This definitely needs more explanation about the problem being solved
> and why this is the right way to solve it...
> 
> root could presumably control this before so even the current commit
> message doesn't quite make sense to me.

With this commit the printer configuration in gnome-control-center 
works as i would expect:

To unlock the printer configuration a user who is in the wheel group 
only needs his own password, if he is not in wheel the root password is 
requested.
If the printer configuration is unlocked, all configuration options of 
gnome-control-center can be used

With the lpadmin group you can unlock the printer configuration with 
cups-pk-helper, but then you still do not have the needed permission to 
make meaningful changes. You can only print ... Adding or removing 
printers or changing the print quality or paper size can then only be 
done via the web interface

In other words. This makes the cups-pk-helper unlock mechanism work out 
of the box without further configuration


--=-BgD+41EE/1mRYZAuDzRe
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Nov 23 2023 at 12:50:20 PM +00:00:00, Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This definitely needs more explanation about the problem being solved
and why this is the right way to solve it...

root could presumably control this before so even the current commit
message doesn't quite make sense to me.</div></blockquote><div><br></div><div><div>With this commit the printer configuration in gnome-control-center works as i would expect:</div><div><br></div><div>To unlock the printer configuration a user who is in the wheel group only needs his own password, if he is not in wheel the root password is requested.</div><div>If the printer configuration is unlocked, all configuration options of gnome-control-center can be used</div><div><br></div><div>With the lpadmin group you can unlock the printer configuration with cups-pk-helper, but then you still do not have the needed permission to make meaningful changes. You can only print ... Adding or removing printers or changing the print quality or paper size can then only be done via the web interface</div><div><br></div></div><div>In other words. This makes the cups-pk-helper unlock mechanism work out of the box without further configuration</div></div>
--=-BgD+41EE/1mRYZAuDzRe--


