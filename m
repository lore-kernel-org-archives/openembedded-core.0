Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBB2D75E35
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 12:35:35 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.22921.1732278927088233268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 04:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout10.t-online.de (Postfix) with SMTP id 11DF79BF;
	Fri, 22 Nov 2024 13:35:25 +0100 (CET)
Received: from [192.168.178.67] ([84.163.36.225]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tESsb-0K41Fw0; Fri, 22 Nov 2024 13:35:21 +0100
Date: Fri, 22 Nov 2024 13:35:15 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gcc: add a backport patch to fix an issue with
 tzdata 2024b
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <RYQCNS.10T32VDPPEQO3@t-online.de>
In-Reply-To: <CAMKF1sokg5vHatwE6+Ac17JZSXU65cHTV9ddkMZ8MGtftyfJcA@mail.gmail.com>
References: <20241122012941.3055-1-f_l_k@t-online.de>
	<CAMKF1sokg5vHatwE6+Ac17JZSXU65cHTV9ddkMZ8MGtftyfJcA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-i3Oycg45a64yp11bhy7/"
X-TOI-EXPURGATEID: 150726::1732278921-3E7EA712-5A83DC10/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f82584e-cbfb-4f03-a78c-8c3edcf898c3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 12:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207609

--=-i3Oycg45a64yp11bhy7/
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Nov 21 2024 at 07:04:06 PM -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Patch is fine however I would suggest to remove the hunk changing 
> changellog files it will make it easy to backport

Removed the comments on the changelog from the commit message. but I 
didn't find a hunk that patches Changelog


--=-i3Oycg45a64yp11bhy7/
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Nov 21 2024 at 07:04:06 PM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">Patch is fine however I would suggest to remove the hunk changing changellog files it will make it easy to backport&nbsp;</blockquote><div><br></div><div>Removed the comments on the changelog from the commit message. but I didn't find a hunk that patches Changelog</div></div>
--=-i3Oycg45a64yp11bhy7/--


