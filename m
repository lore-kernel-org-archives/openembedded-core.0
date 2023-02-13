Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8D0C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 10:16:07 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.11197.1676283365548955793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 02:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id 6AEDC556F;
	Mon, 13 Feb 2023 11:16:03 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.111]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRVsR-0UzZlQ0; Mon, 13 Feb 2023 11:16:03 +0100
Date: Mon, 13 Feb 2023 11:15:57 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] graphene: disable neon support on arm 32bits
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Pablo Saavedra
	<psaavedra@igalia.com>, Khem Raj <raj.khem@gmail.com>
Message-Id: <LIK0QR.B6PGBDW8PED51@t-online.de>
In-Reply-To: <1743594D8095F1A6.21535@lists.openembedded.org>
References: <20230211082609.6471-1-f_l_k@t-online.de>
	<99d270db661ec96c2e6f5a864962aaade7fd7887.camel@linuxfoundation.org>
	<1743594D8095F1A6.21535@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-9sCXZzH6mGPtyB/YTuwd"
X-TOI-EXPURGATEID: 150726::1676283363-511B9A0B-C9620109/0/0 CLEAN NORMAL
X-TOI-MSGID: 83eb7528-ac73-4a46-ac5c-3cd8a9d0ccc8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 10:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177090

--=-9sCXZzH6mGPtyB/YTuwd
Content-Type: text/plain; charset=us-ascii; format=flowed

sent a patch for it

> maybe it would be better to add this as a PACKAGECONFIG, so people 
> could at least manually enable neon support if they know it would be 
> working for them?


--=-9sCXZzH6mGPtyB/YTuwd
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>sent a patch for it</div></div><div id="geary-quote" dir="auto"><br><blockquote type="cite"><div id="geary-body" dir="auto"><div>maybe it would be better to add this as a PACKAGECONFIG, so people could at least manually enable neon support if they know it would be working for them?</div></div>
</blockquote></div>
--=-9sCXZzH6mGPtyB/YTuwd--


