Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB6FD12D4A
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 16:41:54 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.39216.1731256904035674144
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 08:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout02.t-online.de (Postfix) with SMTP id 7E8424FF;
	Sun, 10 Nov 2024 17:41:41 +0100 (CET)
Received: from [192.168.178.67] ([84.154.174.121]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tAB0O-0H6KaO0; Sun, 10 Nov 2024 17:41:40 +0100
Date: Sun, 10 Nov 2024 17:43:53 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <5HUQMS.SMNF3CYKEZ7C1@t-online.de>
In-Reply-To: <CANNYZj_AK7rWMRkkiincd7TZwWX4+iYziAM=UG5kOmKSC9nvSg@mail.gmail.com>
References: <20241110132848.2135721-1-f_l_k@t-online.de>
	<CANNYZj8XUkrp6Fc5kB=4S_q7AKiYkN+zZ4Tqd9ZEQK-4JGC5xg@mail.gmail.com>
	<1806A2E5B9CEF1AC.19665@lists.openembedded.org>
	<SQQQMS.OQC2MWOKNELB1@t-online.de>
	<CANNYZj_AK7rWMRkkiincd7TZwWX4+iYziAM=UG5kOmKSC9nvSg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-F+d6hYY5NBEz16QOJEZI"
X-TOI-EXPURGATEID: 150726::1731256900-75FF947E-3010DD58/0/0 CLEAN NORMAL
X-TOI-MSGID: 985449ea-1253-428c-86cc-c7fce1b79f9c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 16:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206927

--=-F+d6hYY5NBEz16QOJEZI
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Nov 10 2024 at 05:33:42 PM +01:00:00, Alexander Kanavin via 
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> 
wrote:
> Shouldn't this go to meson.bbclass then? It's useful everywhere.

Presumably yes, but I just found out about this command-line option and 
didn't dare to propose it for the whole system without checking the 
impact.I have some other stuff I'd like to sort out before I can have a 
look at. For now I only verified that systemd builds with oe-core and 
poky for qemux86-64 with glibc and musl


--=-F+d6hYY5NBEz16QOJEZI
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Nov 10 2024 at 05:33:42 PM +01:00:00, Alexander Kanavin via lists.openembedded.org &lt;alex.kanavin=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Shouldn't this go to meson.bbclass then? It's useful everywhere.</div></blockquote><span style="white-space-collapse: break-spaces;"><div><span style="white-space-collapse: break-spaces;"><br></span></div>Presumably yes, but I just </span>found out about this command-line option and didn't dare to propose it for the whole system without checking the impact.I have some other stuff I'd like to sort out before I can have a look at. For now I only verified that systemd builds with oe-core and poky for qemux86-64 with glibc and musl</div>
--=-F+d6hYY5NBEz16QOJEZI--


