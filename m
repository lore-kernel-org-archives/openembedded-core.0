Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A00E6781C
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 14:50:23 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.37148.1731250213682994802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 06:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id B8E364CD;
	Sun, 10 Nov 2024 15:50:10 +0100 (CET)
Received: from [192.168.178.67] ([84.154.174.121]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tA9GT-1cKeNk0; Sun, 10 Nov 2024 15:50:09 +0100
Date: Sun, 10 Nov 2024 15:52:26 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
To: alex.kanavin@gmail.com
Cc: "Alexander Kanavin via lists.openembedded.org"
	<alex.kanavin=gmail.com@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <EBPQMS.UEZLLM5MH6D9@t-online.de>
In-Reply-To: <CANNYZj8XUkrp6Fc5kB=4S_q7AKiYkN+zZ4Tqd9ZEQK-4JGC5xg@mail.gmail.com>
References: <20241110132848.2135721-1-f_l_k@t-online.de>
	<CANNYZj8XUkrp6Fc5kB=4S_q7AKiYkN+zZ4Tqd9ZEQK-4JGC5xg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-JMCNxc34bnjcXkwNbwO7"
X-TOI-EXPURGATEID: 150726::1731250209-8DFF95A0-F9944E5C/0/0 CLEAN NORMAL
X-TOI-MSGID: 18bfebc4-1aad-46c3-bc20-02f6451a4cb3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 14:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206923

--=-JMCNxc34bnjcXkwNbwO7
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Nov 10 2024 at 03:40:42 PM +01:00:00, Alexander Kanavin via 
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> 
wrote:
> It would help to explain what the option does precisely.

As far as I understand it, it is a general way for meson to prevent the 
addition of features just because the required source has been found. 
Each feature must then be explicitly enabled.

I checked if the setting is effective by creating sysupdate. If 
auto-features=enabled, it was enough to add util-linux to the 
PACKAGECONFIG[sysuser] depends field and fdisk support was built 
without having to explicitly set -Dfdisk=enabled. With 
'--auto-features=disabled' the latter was required.


--=-JMCNxc34bnjcXkwNbwO7
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Nov 10 2024 at 03:40:42 PM +01:00:00, Alexander Kanavin via lists.openembedded.org &lt;alex.kanavin=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div dir="auto">It would help to explain what the option does precisely.&nbsp;</div><div dir="auto"></div></blockquote><div><br></div><div><div>As far as I understand it, it is a general way for meson to prevent the addition of features just because the required source has been found. Each feature must then be explicitly enabled.</div><div><br></div><div>I checked if the setting is effective by creating sysupdate. If auto-features=enabled, it was enough to add util-linux to the PACKAGECONFIG[sysuser] depends field and fdisk support was built without having to explicitly set -Dfdisk=enabled. With '--auto-features=disabled' the latter was required.</div></div></div>
--=-JMCNxc34bnjcXkwNbwO7--


