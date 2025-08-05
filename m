Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23CEC87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 13:29:25 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.21748.1754400558920314841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 06:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id E69781C68D;
	Tue,  5 Aug 2025 15:29:16 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.225.228]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ujHjA-3HGRQO0; Tue, 5 Aug 2025 15:29:16 +0200
Date: Tue, 05 Aug 2025 15:29:10 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH 1/2] librsvg: upgrade 2.59.2 -> 2.60.0
To: mathieu.dubois-briand@bootlin.com
Cc: skandigraun@gmail.com, openembedded-core@lists.openembedded.org,
	"Mathieu Dubois-Briand via lists.openembedded.org"
	<mathieu.dubois-briand=bootlin.com@lists.openembedded.org>
Message-Id: <M4WI0T.DNEICBR8P1D13@t-online.de>
In-Reply-To: <DBUDGTFZM43O.22SQN5VKTB6Y9@bootlin.com>
References: <20250805063925.771875-1-skandigraun@gmail.com>
	<DBUDGTFZM43O.22SQN5VKTB6Y9@bootlin.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wRUBuhfpHeOvFKwYTKa3"
X-TOI-EXPURGATEID: 150726::1754400556-877FD95C-35CFB075/0/0 CLEAN NORMAL
X-TOI-MSGID: 573c1dfc-7d02-4faa-afaa-750b819775e3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 13:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221473

--=-wRUBuhfpHeOvFKwYTKa3
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Aug 5 2025 at 11:04:43 +02:00:00, Mathieu Dubois-Briand via 
lists.openembedded.org 
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
> Now, as this is in the configure step, it might be related with the
> gdk-pixbuf commits from Ross, but they look like fairly 
> straightforward.

looks like a gdk-pixbuf-native dependency is missing:
<https://github.com/GNOME/librsvg/blob/822f3229ab70312014a52c5d6124858a50d1d7ee/gdk-pixbuf-loader/meson.build#L39>


--=-wRUBuhfpHeOvFKwYTKa3
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Aug 5 2025 at 11:04:43 +02:00:00, Mathieu Dubois-Briand via lists.openembedded.org &lt;mathieu.dubois-briand=bootlin.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Now, as this is in the configure step, it might be related with the
gdk-pixbuf commits from Ross, but they look like fairly straightforward.</div></blockquote><div><br></div><div>looks like a gdk-pixbuf-native dependency is missing:</div><div><a href="https://github.com/GNOME/librsvg/blob/822f3229ab70312014a52c5d6124858a50d1d7ee/gdk-pixbuf-loader/meson.build#L39">https://github.com/GNOME/librsvg/blob/822f3229ab70312014a52c5d6124858a50d1d7ee/gdk-pixbuf-loader/meson.build#L39</a></div></div>
--=-wRUBuhfpHeOvFKwYTKa3--


