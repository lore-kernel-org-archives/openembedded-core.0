Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CB3C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 14:39:47 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.13179.1707489586164688286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 06:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout12.t-online.de (Postfix) with SMTP id 6FD742840;
	Fri,  9 Feb 2024 15:39:42 +0100 (CET)
Received: from [192.168.178.67] ([84.163.32.56]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rYS2X-2w2eP20; Fri, 9 Feb 2024 15:39:42 +0100
Date: Fri, 09 Feb 2024 15:39:48 +0100
From: f_l_k@t-online.de
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: f_l_k@t-online.de, Ross Burton <Ross.Burton@arm.com>,
	openembedded-core@lists.openembedded.org, Alexander Kanavin
	<alex@linutronix.de>
Message-Id: <CEFL8S.5THERGNQN4KV3@t-online.de>
In-Reply-To: <CANNYZj_Ludt4Cr68KnVCDz-U51WvpyE1qLFwhM10ePAXR7zKkw@mail.gmail.com>
References: <20240208185641.2969396-1-alex@linutronix.de>
	<C6BC277B-9507-40DF-94BC-3B71E06CFEB6@arm.com>
	<CANNYZj9uH+0Uhj9GN6wxKHXuZzGvnkzjydUJ4eD1xu_mi4V_WA@mail.gmail.com>
	<QJDL8S.L5SFWUB1B9X8@t-online.de>
	<CANNYZj_Ludt4Cr68KnVCDz-U51WvpyE1qLFwhM10ePAXR7zKkw@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-HzE0FxwXDn09iGoOeJhL"
X-TOI-EXPURGATEID: 150726::1707489582-749BF9CF-D25CBBC9/0/0 CLEAN NORMAL
X-TOI-MSGID: 8afddddf-127d-4151-8c20-20e8449dbd63
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 14:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195223

--=-HzE0FxwXDn09iGoOeJhL
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Feb 9 2024 at 03:13:40 PM +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> You also need to check how it worked in previous versions. Why would
> we want to enable it, if it wasn't even available previously, and
> things were still working well?

According to the documentation it will read from logind instead of utmp 
if enabled.  This is also set to be default.
<https://github.com/shadow-maint/shadow/commit/fb35ad15aef6190914a939b299e10c343e3e4c2a>
<https://github.com/shadow-maint/shadow/issues/674>


--=-HzE0FxwXDn09iGoOeJhL
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Feb 9 2024 at 03:13:40 PM +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">You also need to check how it worked in previous versions. Why would
we want to enable it, if it wasn't even available previously, and
things were still working well?</div></blockquote><div><br></div><div>According to the documentation it will read from logind instead of utmp if enabled. &nbsp;This is also set to be default.</div><div><a href="https://github.com/shadow-maint/shadow/commit/fb35ad15aef6190914a939b299e10c343e3e4c2a">https://github.com/shadow-maint/shadow/commit/fb35ad15aef6190914a939b299e10c343e3e4c2a</a></div><div><a href="https://github.com/shadow-maint/shadow/issues/674">https://github.com/shadow-maint/shadow/issues/674</a></div></div>
--=-HzE0FxwXDn09iGoOeJhL--


