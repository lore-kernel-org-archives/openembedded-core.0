Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1A8EE49A5
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 01:17:04 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.21645.1692494216357868056
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Aug 2023 18:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout03.t-online.de (Postfix) with SMTP id E54AF9434;
	Sun, 20 Aug 2023 03:16:53 +0200 (CEST)
Received: from [192.168.0.109] ([24.134.105.89]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qXX3l-0pWT9k0; Sun, 20 Aug 2023 03:16:53 +0200
Date: Sun, 20 Aug 2023 03:16:47 +0200
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <ZV0OZR.Y2DDWRBQSCHY@t-online.de>
In-Reply-To: <CAMKF1sr2oP1qNP51Dxm_mHcz607eqWToUVN3_Duj_iD9NNvdHg@mail.gmail.com>
References: <20230815145218.1561896-1-f_l_k@t-online.de>
	<CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
	<IHIJZR.16XNVQ6SKCIP1@t-online.de>
	<CAMKF1soQSYA1xg8iDciyVxxZSqxekVOv-tjaojiXXqgOqU4Pqg@mail.gmail.com>
	<G7LLZR.6FLOA2CLJNX21@t-online.de>
	<CAMKF1spUD6Lh-GoshPq9g9r4Y7LkHDUczJycP38hg4MABMwTFQ@mail.gmail.com>
	<1SYNZR.YGJKMZAB9Y9V3@t-online.de>
	<CAMKF1sr2oP1qNP51Dxm_mHcz607eqWToUVN3_Duj_iD9NNvdHg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-EUZw0Vo3DWGR6pvQ+Cyk"
X-TOI-EXPURGATEID: 150726::1692494213-43FFD2B7-1223273F/0/0 CLEAN NORMAL
X-TOI-MSGID: 41124fea-7ef0-4065-b4be-39c8eff822fa
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 01:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186405

--=-EUZw0Vo3DWGR6pvQ+Cyk
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Aug 19 2023 at 05:43:35 PM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Possibly a good fix I think you should propose it at the bug I 
> pointed out

At the moment this is just a theory because I haven't managed to solve 
my problem with libcxx-native yet. I will test this in a vm when I find 
the time.

After thinking about it a bit more and re-reading the problem you 
pointed out, it seems to only happen with -Dvulkan=enabled, so it looks 
like VK_USE_64_BIT_PTR_DEFINES is set to 0, which could be exactly the 
reason why the pointer gets converted to int.

Anyway, as long as I cant reproduce, its just fishing in murky waters. 
I'll post there once I was able to test it.


--=-EUZw0Vo3DWGR6pvQ+Cyk
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Aug 19 2023 at 05:43:35 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">Possibly a good fix I think you should propose it at the bug I pointed&nbsp;out</blockquote><div><br></div><div>At the moment this is just a theory because I haven't managed to solve my problem with libcxx-native yet. I will test this in a vm when I find the time.</div><div><br></div><div>After thinking about it a bit more and re-reading the problem you pointed out, it seems to only happen with -Dvulkan=enabled, so it looks like VK_USE_64_BIT_PTR_DEFINES is set to 0, which could be exactly the reason why the pointer gets converted to int.</div><div><br></div><div>Anyway, as long as I cant reproduce, its just fishing in murky waters. I'll post there once I was able to test it.</div></div>
--=-EUZw0Vo3DWGR6pvQ+Cyk--


