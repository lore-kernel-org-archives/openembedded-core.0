Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3290AC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 07:03:06 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.87726.1701068579657310355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 23:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 1C0EA16B25;
	Mon, 27 Nov 2023 08:02:57 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.136]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r7Vdu-17fyKm0; Mon, 27 Nov 2023 08:02:54 +0100
Date: Mon, 27 Nov 2023 08:03:03 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH] pciutils: add packageconfigs for options
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <3XSR4S.8WKCEJD49NBK@t-online.de>
In-Reply-To: <CAMKF1spWFVCbyL9NT1CWQKgWTthBV7REiL40NnZXb-b9tN=FEA@mail.gmail.com>
References: <20231123113452.1697802-1-f_l_k@t-online.de>
	<CAMKF1spWFVCbyL9NT1CWQKgWTthBV7REiL40NnZXb-b9tN=FEA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tflnt9jaykz6lHjzh0b4"
X-TOI-EXPURGATEID: 150726::1701068574-1B7FD95D-B42302E9/0/0 CLEAN NORMAL
X-TOI-MSGID: 8544b7d7-dfd4-43b9-b902-7eb8c43e1c17
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 07:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191259

--=-tflnt9jaykz6lHjzh0b4
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Nov 26 2023 at 05:18:16 PM -08:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> I am seeing configure failures

-e MAKEFLAGS= needs to be last in EXTRA_OEMAKE

Sorry, not sure why I didn't catch this


--=-tflnt9jaykz6lHjzh0b4
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Nov 26 2023 at 05:18:16 PM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I am seeing configure failures</div></blockquote><div><br></div><div>-e MAKEFLAGS= needs to be last in EXTRA_OEMAKE</div><div><br></div><div>Sorry, not sure why I didn't catch this</div></div>
--=-tflnt9jaykz6lHjzh0b4--


