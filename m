Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E71C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:04:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.6788.1642165452924592201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mv0P1OF4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id l25so15446541wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WDiKEuCGE1aOuvsiU7ZwRHoJuQZNZH1KVKu6X1yXZgs=;
        b=Mv0P1OF4XiI6R0O8TVD0UwaAUH5zXrdlrxo9Byd1t/llpQTwH5Nr4wULrvy4oPWbur
         9IAoJvjiSh3MzqZaw/ENs1JuHWvIGptcdd4FLN1PW7/UOYLWxHy+zmGmxidz4xy1ddGX
         I5wJAPHlErQD24nVHltcjKI3MfFPJcEGxIu+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WDiKEuCGE1aOuvsiU7ZwRHoJuQZNZH1KVKu6X1yXZgs=;
        b=SAqXcfEbVh2xFFpkElk/bAuPr1mhJmPZbaxYllD4gPNyQuunlkCPIPGNjFqNQBGslX
         Qp/CN5FH1OLS7cobdFHD5jhPYMMgHTqcZKm4H0y0zRIBVbZKm9XEUZdzJ9y69Unb9L4M
         Jk4WglE+aNbgoRzVEut4lPhKKicfFeGW99Ws24ibm9qyxVWCLSdB744wIN0r1ip4uecu
         wSqJm/u4imLsLw2JM1Wvu3w1YJoyTErdez2AwzxdjY4p0QxFjb1bNIr9OHM6s10SR2gN
         8CMV6hlvBf90S6KmD0InQKP3+OiqE6Go69AI9DdbCMCxXVjnXgFtYLyD8Cl3uMnzq5sS
         oNRw==
X-Gm-Message-State: AOAM531+JvUyt7Yk0nY0OhAPvJPl0LdWTOx9CoDSwZ+wyk9hXjx5DIs/
	LnQpWlztxq4fCbsS9+mxaBTt3A==
X-Google-Smtp-Source: 
 ABdhPJyyV+gcKDzFX9SbFT2+o+4X/KY4IV8/euWtmJr3cQ/mi+5mxoGKbKvMdlxREDWVXOWCxDePKQ==
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr8209419wrb.583.1642165451482;
        Fri, 14 Jan 2022 05:04:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b80b:58a:dabd:3794?
 ([2001:8b0:aba:5f3c:b80b:58a:dabd:3794])
        by smtp.gmail.com with ESMTPSA id
 w12sm6046662wrm.36.2022.01.14.05.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 05:04:11 -0800 (PST)
Message-ID: 
 <779116463c2179c139f3aec318a45fbcab3ed8e2.camel@linuxfoundation.org>
Subject: Re: AW: [yocto] Question of Yocto dunfell LTS period
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthias Klein <matthias.klein@optimeas.de>, "chanho61.park@samsung.com"
	 <chanho61.park@samsung.com>, "yocto@lists.yoctoproject.org"
	 <yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "steve@sakoman.com" <steve@sakoman.com>
Date: Fri, 14 Jan 2022 13:04:08 +0000
In-Reply-To: 
 <AM0PR10MB3107F4F770A4DDDDAAD009A099549@AM0PR10MB3107.EURPRD10.PROD.OUTLOOK.COM>
References: 
	<CGME20220114011350epcas2p16efb8acbdc4d9edceee83569e10cc359@epcas2p1.samsung.com>
	 <000801d808e3$fcea94e0$f6bfbea0$@samsung.com>
	 <AM0PR10MB3107F4F770A4DDDDAAD009A099549@AM0PR10MB3107.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 13:04:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160564

On Fri, 2022-01-14 at 07:14 +0000, Matthias Klein wrote:
> Hello together,
> 
> I would like to add a question to the topic:
> 
> Why was the LTS period for dunfell extended?
> Can we expect the same for kirstone?

The project members agreed to fun an extension to the lifetime of dunfell from 2
years to 4 years. There should have been some announcements about this but we
lack people on the advocacy side of the project with time to make that happen.
That saddens me a lot and I think it is a missed opportunity but there isn't
much I can do about it beyond what I've already tried.

Extending Dunfell is an experiment so we would base a decision on how well the
dunfell extension is working out. Extending an LTS like this requires a
financial commitment from the project. At this point in time the project cannot
commit to extending kirkstone as we can't guarantee the finances. 

Cheers,

Richard




