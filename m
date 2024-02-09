Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39BAC4829D
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 13:59:56 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.12180.1707487186838621422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 05:59:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id 7E994452CC;
	Fri,  9 Feb 2024 14:59:43 +0100 (CET)
Received: from [192.168.178.67] ([84.163.32.56]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rYRPq-1nePC40; Fri, 9 Feb 2024 14:59:42 +0100
Date: Fri, 09 Feb 2024 14:59:50 +0100
From: f_l_k@t-online.de
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	openembedded-core@lists.openembedded.org, Alexander Kanavin
	<alex@linutronix.de>
Message-Id: <QJDL8S.L5SFWUB1B9X8@t-online.de>
In-Reply-To: <CANNYZj9uH+0Uhj9GN6wxKHXuZzGvnkzjydUJ4eD1xu_mi4V_WA@mail.gmail.com>
References: <20240208185641.2969396-1-alex@linutronix.de>
	<C6BC277B-9507-40DF-94BC-3B71E06CFEB6@arm.com>
	<CANNYZj9uH+0Uhj9GN6wxKHXuZzGvnkzjydUJ4eD1xu_mi4V_WA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-TBh/9RnZywFRCbNYe9I1"
X-TOI-EXPURGATEID: 150726::1707487182-3D2419FB-262BEC4D/0/0 CLEAN NORMAL
X-TOI-MSGID: be6d63fe-ec14-4e23-9b52-ce3740ba402a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 13:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195213

--=-TBh/9RnZywFRCbNYe9I1
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Feb 9 2024 at 02:12:35 PM +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> It's a new feature in 4.14. If someone wants it, they should find out
> what it does and whether we want it enabled in systemd builds.

configure.ac states, that it is needed for systemd session support:
<https://github.com/shadow-maint/shadow/blob/3e59e9613ec40c51c19c7bb5c28468e33a4529d5/configure.ac#L403>


--=-TBh/9RnZywFRCbNYe9I1
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Feb 9 2024 at 02:12:35 PM +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">It's a new feature in 4.14. If someone wants it, they should find out
what it does and whether we want it enabled in systemd builds.</div></blockquote><div><br></div><div>configure.ac states, that it is needed for systemd session support:</div><div><a href="https://github.com/shadow-maint/shadow/blob/3e59e9613ec40c51c19c7bb5c28468e33a4529d5/configure.ac#L403">https://github.com/shadow-maint/shadow/blob/3e59e9613ec40c51c19c7bb5c28468e33a4529d5/configure.ac#L403</a></div></div>
--=-TBh/9RnZywFRCbNYe9I1--


