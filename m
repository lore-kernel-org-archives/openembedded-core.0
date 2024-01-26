Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5489C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:13:21 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.15476.1706274797038446327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Aa1S8RpB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T6niuaO0DFQFoNMmOCyffDt4f7f1YYMe4gkGAuoWgyg=; b=Aa1S8RpB6BOnL4miLhvB76ZTYk
	dd2W34ysuHiDvXKp/Ksenhg/q5MSe+C8n3WemWjsV1i/kqaKYnG5hJk/QYgzzIBY+5vA8XeN9d6rB
	sdX68hSR/oukWKfrS+YcFJqa5skKNJrlN0gvhki39HIOmy1oqyRrLM5msXpBLJ/ByQPtLO4BudAf4
	x+QdL2fcm1X/xbB3JU3FHdX934oaEzdKscFI5D8AmswtkV1w2rEFKW/uCPmrzhiA6D67JV/ggfl6j
	XeIVnto8r0JgVgbwmYupi2Bb5M0DumSfIg1ujyBrzST3z74Tjn/sznrW+uu/BJYTwCuOfszloIWwb
	HbZUxmdQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:50300 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rTM1B-00A2Ys-1P;
	Fri, 26 Jan 2024 08:13:16 -0500
Date: Fri, 26 Jan 2024 08:13:12 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] trying to create simple example of "externalsrc"
 recipe
In-Reply-To: <CANNYZj-ieZYmz5H6=2X0OzMu+dBd8WtKsxZRa-iH2w1yLLVZnQ@mail.gmail.com>
Message-ID: <72ae1990-662d-8f4a-f0e6-5e21a53167f7@crashcourse.ca>
References: <436ae552-2fad-8de3-9435-b03df2d2a823@crashcourse.ca> <CANNYZj-ieZYmz5H6=2X0OzMu+dBd8WtKsxZRa-iH2w1yLLVZnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194358

On Fri, 26 Jan 2024, Alexander Kanavin wrote:

> Note that there is a selftest for this in
> meta/lib/oeqa/selftest/cases/externalsrc.py, so you could check why
> that seems to work.
>
> Alex

  ah, i had forgotten about the directory of selftests. my bad.

rday

