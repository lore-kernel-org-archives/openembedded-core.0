Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80901C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 13:13:46 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.10619.1707484419235026359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 05:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id A9358EC32;
	Fri,  9 Feb 2024 14:13:36 +0100 (CET)
Received: from [192.168.178.67] ([84.163.32.56]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rYQhE-2nFdT60; Fri, 9 Feb 2024 14:13:36 +0100
Date: Fri, 09 Feb 2024 14:13:45 +0100
From: f_l_k@t-online.de
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: Ross Burton <ross.burton@arm.com>
Cc: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Message-Id: <XEBL8S.I5Z7GHTFT0RX@t-online.de>
In-Reply-To: <C6BC277B-9507-40DF-94BC-3B71E06CFEB6@arm.com>
References: <20240208185641.2969396-1-alex@linutronix.de>
	<C6BC277B-9507-40DF-94BC-3B71E06CFEB6@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-5ueVWOQfW+/DI4TYlsEy"
X-TOI-EXPURGATEID: 150726::1707484416-E4E0893F-EAB18227/0/0 CLEAN NORMAL
X-TOI-MSGID: 06fd2567-81bf-419a-95c4-028bb36277cb
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 13:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195209

--=-5ueVWOQfW+/DI4TYlsEy
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Feb 9 2024 at 12:33:39 PM +00:00:00, Ross Burton 
<ross.burton@arm.com> wrote:
> Would we want to enable this in target builds by default if systemd 
> is in DISTRO_FEATURES?

I wondered that myself. Maybe it would also be a good idea to rename 
the PACKAGECONFIG to 'systemd' ?
This would allow to just add it to the bb.utils.filter line.


--=-5ueVWOQfW+/DI4TYlsEy
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Feb 9 2024 at 12:33:39 PM +00:00:00, Ross Burton &lt;ross.burton@arm.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Would we want to enable this in target builds by default if systemd is in DISTRO_FEATURES?
</div></blockquote><div><br></div><div>I wondered that myself. Maybe it would also be a good idea to rename the PACKAGECONFIG to 'systemd' ?</div><div>This would allow to just add it to the bb.utils.filter line.</div></div>
--=-5ueVWOQfW+/DI4TYlsEy--


