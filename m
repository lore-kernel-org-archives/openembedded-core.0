Return-Path: <ian.arkver.dev@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE4060017
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 09:50:18 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y43so936415wrd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WHjHQ2u6yHqdCGQpagDOYA4t2P3UdpePLr6nbtiswts=;
	b=BEsrG6tyXD2bWg4YaxlxSoY0kUyWDTVpxSGq+E9DcfD5EtTMFFoaswnYhnXwFtvZ7f
	nXz44dF4djvaAAGU/U4uK8m2BdJCMx1lmrZe9Z6UYJDqPiL3DtPpqUpIZTcyp0mUysQd
	uq0WgC4RRypzmZTx16NqRwJPgTo7xFRgU8vU3zKPrYYAvqOF0WbCQhQjdOH6WfC3XlcE
	eMDO/1R4zNPGNTVWdnHYhdc4qISkJ2wZfnkF9WfxmLpU/R/RXowsAEh76y/4UlreFSo2
	4Hjp2mflLDQMOy2S944EET/q8wJ50X7EFLxqLN9nVYo1IqxBr0fCzLfxEiNsJIKxeOmi
	4yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WHjHQ2u6yHqdCGQpagDOYA4t2P3UdpePLr6nbtiswts=;
	b=iABOsSM1zsJk05OfxqyXmvjTCbW5m0IeHFvNihtFBHPoG+mwkqJR8PZl5/jSsvi2Nc
	BXeP9mR8NJFlCKzztm28ey/oJCWppuQgPj7VXYFWHm9+2ZTOYm/JBEAAzwMcbiTFZbtL
	LPNopCS30AOYxlyBRwzcXG3B9AvM7Jma47AMGtoA8PILbWL4wOe3PBy8rlLUC9TSHoeC
	RGjsOsvZS0QhjBUXSBeWgnShnjNrim9fEHdq6y/psa89ByKQRDxqhrwJKGT+Pm5OwshD
	L5kxtsQqt5Y3y5M0dEeregFhTnqrTT6R67/ibkxgXuKJos1YFnDD+pJXIRU/9FPaB2WM
	w5dA==
X-Gm-Message-State: AIVw112IX6rUL/sdE4NkzbccZZTMgwDhXEB7u0534arfL7kDhcIdCn/7
	2sQ/fOfIY69yGw==
X-Received: by 10.223.152.172 with SMTP id w41mr6740554wrb.202.1501581019400; 
	Tue, 01 Aug 2017 02:50:19 -0700 (PDT)
Received: from [192.168.19.15] ([95.147.75.135])
	by smtp.googlemail.com with ESMTPSA id
	r108sm17159839wrb.29.2017.08.01.02.50.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 02:50:18 -0700 (PDT)
To: Anton Novikov <a.novikov@yadro.com>,
	openembedded-core@lists.openembedded.org
References: <14e5f528-a64b-94e2-4e86-7a22770623d6@yadro.com>
From: Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <9d9d1ea9-d594-e08d-9e17-858b10a1aeca@gmail.com>
Date: Tue, 1 Aug 2017 10:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <14e5f528-a64b-94e2-4e86-7a22770623d6@yadro.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCHv2] (morty) Arch Linux build fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Aug 2017 09:50:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 21/06/17 10:05, Anton Novikov wrote:
> [3 patch attachments]

Any word on getting these patches applied to Morty? Is anything blocking
them? Maybe they need resubmitted as individual patches?

They do seem to apply cleanly on the current tip of morty
(7d5822bf4c) and do fix various automake and gcc7 host build failures.

Regards,
Ian

