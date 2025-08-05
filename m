Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B792C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 19:32:57 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.8046.1754422369706873656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 12:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id 22F2BE75C;
	Tue,  5 Aug 2025 21:32:47 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.225.228]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ujNOr-0GFG9A0; Tue, 5 Aug 2025 21:32:41 +0200
Date: Tue, 05 Aug 2025 21:32:35 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH 1/2] librsvg: upgrade 2.59.2 -> 2.60.0
To: skandigraun@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org,
	"Gyorgy Sarvari via lists.openembedded.org"
	<skandigraun=gmail.com@lists.openembedded.org>
Message-Id: <BYCJ0T.GXT9VE7CNT592@t-online.de>
In-Reply-To: <dc1d93ac-23b0-4d79-b8b6-73b0d22720e9@gmail.com>
References: <20250805063925.771875-1-skandigraun@gmail.com>
	<1858D393D35BC4B4.28357@lists.openembedded.org>
	<DBUIS9SGNETD.1OJZHA0Y17QRS@bootlin.com>
	<dc1d93ac-23b0-4d79-b8b6-73b0d22720e9@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3PLjrdwKaYobfuQ/syW5"
X-TOI-EXPURGATEID: 150726::1754422361-45D2E9EC-B41937DE/0/0 CLEAN NORMAL
X-TOI-MSGID: 8811e47a-08dc-4849-a6d1-6e0dc54dabe3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 19:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221494

--=-3PLjrdwKaYobfuQ/syW5
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Aug 5 2025 at 21:23:48 +02:00:00, Gyorgy Sarvari via 
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> 
wrote:
> Indeed, the bug is here - it is trying to use the build machine's
> gdk-pixbuf-query-loaders

I wouldn't call it a bug ... seems to be intended because find_program 
is used and the dependeny is explicitly added only, if meson can use 
hosttools


--=-3PLjrdwKaYobfuQ/syW5
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Aug 5 2025 at 21:23:48 +02:00:00, Gyorgy Sarvari via lists.openembedded.org &lt;skandigraun=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Indeed, the bug is here - it is trying to use the build machine's
gdk-pixbuf-query-loaders</div></blockquote><div><br></div><div>I wouldn't call it a bug ... seems to be intended because find_program is used and the dependeny is explicitly added only, if meson can use hosttools</div></div>
--=-3PLjrdwKaYobfuQ/syW5--


