Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F73C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 12:59:00 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20678.1782824336705094008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 05:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=aG4JdWD+;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: marek.vasut@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gqNWJ0qgSz8tyl;
	Tue, 30 Jun 2026 14:58:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782824332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkc/xGHNnrPTheQv4b4QsbJUfMB8OZt3mBHF2GbGKH8=;
	b=aG4JdWD+nXuIwSQthHDcTISrkFt/3eO0+GEoheX9NkI3YJs0Zc1Lp0/mEsr1Rupj2Macd9
	R/ttUG//EAP+P9x+QC2afN+NohyCdJz5fxip7fX410X6uercuWeyAb0vj5rHXvS94/mkqA
	KXJegNDHTMiCSjVNTG2JNfbPfvn/tXsQGcbzXEQq+9c1ge4q6I09xWTf08G+ynuWKH61g9
	At2vgH+QJVz185cDp2I6JmodeLyuD/XJgny2S01X7hQKBuEqpL6gOvdqCjQZSXDGvV06Hl
	6BDmQrdXi0U4/nbWy9x1lFAdBP34w0mpo9SAFcjTN7nCPaCzQOcbHrmkiAZaKA==
Message-ID: <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
Date: Tue, 30 Jun 2026 14:58:50 +0200
MIME-Version: 1.0
Subject: Re: [wrynose][PATCH] kernel-fit-image.bbclass: Do not include kernel
 property in DTBO config subnodes
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 673cce13cbc03e82ed7
X-MBO-RS-META: sg5akf5co68da51egn7e1x9ymdg689hf
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 12:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239886

On 6/30/26 12:51 PM, Freihofer, Adrian wrote:

Hello Adrian,

> I guess, before this patch can be applied, this one (or a back-port of
> it) is required:
> https://git.openembedded.org/openembedded-core/commit/?id=85e0408a81bdca0411a8625061e5e343c05f92d9
> Otherwise, the oe-selftest fail.
Thank you for staying vigilant.

Yoann, can you please pick the aforementioned commit too ?

Thank you for your help !

