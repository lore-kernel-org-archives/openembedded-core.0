Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCFFE65D14
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 01:41:03 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.15264.1732239659631689192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 17:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout04.t-online.de (Postfix) with SMTP id B91E63AD;
	Fri, 22 Nov 2024 02:40:56 +0100 (CET)
Received: from [192.168.178.67] ([84.163.36.225]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tEIfH-2ZgBoO0; Fri, 22 Nov 2024 02:40:55 +0100
Date: Fri, 22 Nov 2024 02:40:50 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gcc: add a backport patch to fix an issue with
 tzdata 2024b
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <2OWBNS.D6YX45ITNWSD3@t-online.de>
In-Reply-To: <CA+chaQcL_dGkNAgVXD3JWvKFObQ=73tfSbkJcdFHbkDH9HqD5w@mail.gmail.com>
References: <20241122012941.3055-1-f_l_k@t-online.de>
	<CA+chaQcL_dGkNAgVXD3JWvKFObQ=73tfSbkJcdFHbkDH9HqD5w@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-RJ2aPQFPp80QPKdmM1De"
X-TOI-EXPURGATEID: 150726::1732239655-BED6BD18-3D61F3AC/0/0 CLEAN NORMAL
X-TOI-MSGID: 9fa5d1b6-b5c5-4c92-b8a0-9ace8a759b3e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207586

--=-RJ2aPQFPp80QPKdmM1De
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Nov 22 2024 at 02:35:37 AM +01:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> I don't know how widespread this is (or what is waybar clock module)


The issue was discussed here

<https://github.com/Alexays/Waybar/issues/3024>



--=-RJ2aPQFPp80QPKdmM1De
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Nov 22 2024 at 02:35:37 AM +01:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I don't know how widespread this is (or what is waybar clock module)</div></blockquote><div><br></div><div><br></div><div>The issue was discussed here</div><div><br></div><div><div><a href="https://github.com/Alexays/Waybar/issues/3024">https://github.com/Alexays/Waybar/issues/3024</a></div></div><div><br></div></div>
--=-RJ2aPQFPp80QPKdmM1De--


