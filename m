Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB4DC636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 19:11:01 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.20416.1677179451703720332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 11:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout09.t-online.de (Postfix) with SMTP id BD65513F9;
	Thu, 23 Feb 2023 20:10:48 +0100 (CET)
Received: from [192.168.178.83] ([79.219.239.43]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pVGzQ-4R79iy0; Thu, 23 Feb 2023 20:10:48 +0100
Date: Thu, 23 Feb 2023 20:10:43 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] vte: update 0.70.2 -> 0.70.3
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <VXRJQR.8JKKCDQP0R612@t-online.de>
In-Reply-To: <Y/eYmAMJJRMeE+6Z@mail.local>
References: <20230223075256.1755504-1-f_l_k@t-online.de>
	<Y/eYmAMJJRMeE+6Z@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-F2/sRLo9fvFMnky+aLp0"
X-TOI-EXPURGATEID: 150726::1677179448-167FD778-76340F72/0/0 CLEAN NORMAL
X-TOI-MSGID: 0dd212d8-9064-4f6f-935b-539767a35c6c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 19:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177622

--=-F2/sRLo9fvFMnky+aLp0
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 23. Feb 2023 um 17:47:20 +0100 schrieb Alexandre Belloni 
<alexandre.belloni@bootlin.com>:
> It failed on qemux86-64-x32:

Now that's unruly

I did a test build for qemux86-64-x32. For some reason gir gets 
disabled while vala still is requested to be built and thus configure 
fails. Not sure, why gir gets disabled here without disable vala as 
well. Maybe there is a global setting for this somewhere?

However, adding another PACKAGECONFIG:remove line for x86-x32 did solve 
the issue


--=-F2/sRLo9fvFMnky+aLp0
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 23. Feb 2023 um 17:47:20 +0100 schrieb Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">It failed on qemux86-64-x32:</div></blockquote><div><br></div><div><div>Now that's unruly</div><div><br></div><div>I did a test build for qemux86-64-x32. For some reason gir gets disabled while vala still is requested to be built and thus configure fails. Not sure, why gir gets disabled here without disable vala as well. Maybe there is a global setting for this somewhere?</div><div><br></div><div>However, adding another PACKAGECONFIG:remove line for x86-x32 did solve the issue</div></div></div>
--=-F2/sRLo9fvFMnky+aLp0--


