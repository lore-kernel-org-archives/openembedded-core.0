Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFFDC48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 18:47:48 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.19948.1707504461919010430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 10:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id A070062CCA;
	Fri,  9 Feb 2024 19:47:39 +0100 (CET)
Received: from [192.168.178.67] ([84.163.32.56]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rYVuV-0tZnrE0; Fri, 9 Feb 2024 19:47:39 +0100
Date: Fri, 09 Feb 2024 19:47:38 +0100
From: f_l_k@t-online.de
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org, Alexander Kanavin
	<alex@linutronix.de>
Message-Id: <EVQL8S.Z0X7LQA03JJR@t-online.de>
In-Reply-To: <CAMKF1sr8rx9Mcm40KCFJxu1S5546tQGD=d8ox1Kh74uKScFk1A@mail.gmail.com>
References: <20240208185641.2969396-1-alex@linutronix.de>
	<CAMKF1sr8rx9Mcm40KCFJxu1S5546tQGD=d8ox1Kh74uKScFk1A@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-g/W7WecEBKU4s8cez0IE"
X-TOI-EXPURGATEID: 150726::1707504459-491CA820-DDEE3EA9/0/0 CLEAN NORMAL
X-TOI-MSGID: f3a97fe4-0990-4235-8dce-55155a36f3fc
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 18:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195241

--=-g/W7WecEBKU4s8cez0IE
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Feb 9 2024 at 09:24:11 AM -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> In my distro
> settings its causing a dependency loop. see

I also had dependency loop with systemd enabled and was able to fix it 
by editing the PACKAGECONFIG like this:
PACKAGECONFIG[systemd] = "--enable-logind,--disable-logind"

Does this fix the issue for you too? There is no real need to add 
systemd to the depends field, because if DISTRO_FEATURE 'systemd' is 
set, it will be added anyway, right?


--=-g/W7WecEBKU4s8cez0IE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Feb 9 2024 at 09:24:11 AM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">In my distro
settings its causing a dependency loop. see</div></blockquote><div><br></div><div><div>I also had dependency loop with systemd enabled and was able to fix it by editing the PACKAGECONFIG like this:</div><div>PACKAGECONFIG[systemd] = "--enable-logind,--disable-logind"</div><div><br></div><div>Does this fix the issue for you too? There is no real need to add systemd to the depends field, because if DISTRO_FEATURE 'systemd' is set, it will be added anyway, right?</div></div></div>
--=-g/W7WecEBKU4s8cez0IE--


