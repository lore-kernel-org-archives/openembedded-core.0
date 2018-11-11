Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 74D096C0CF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 21:59:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y3-v6so7239777wrh.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 13:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+LE+A/LrHBekl92l/DupC4aYlrGVOuC4HK9JfZvGjJY=;
	b=U1j3+crhhX6Spj3XynzNCa9zHtMxqtYqOv5aC1MgQHthX+s+VFVAxu3gV9alKJyh46
	y+AsUaAk9ViRPi2DyPLz58yKgHDimCMUpDfDUl8RHKNudB6bcoe3kdCKXyKPn+GcvIFz
	bkni5uWPfiRYGWdlsDy3ykrWNa4+LjRnYND4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+LE+A/LrHBekl92l/DupC4aYlrGVOuC4HK9JfZvGjJY=;
	b=ItZbSVuvFy7vGuAeZ7mfiANWeXIeQP9Ds7swyFMebSN2EmBh5PlRHRs/WKBR9k2r6X
	EolMzpUEWg23IlvDo0OlFnlCYJat7Jyhqn3j65qCipA0KmGVGkWS/EWyuOeTRs+eraGT
	a+fSeWW2B+19arJOYMD3HejLHinVP9JSyAoICsgwSy1fwNQwWg3vU8ff1uU56ebGJW2B
	X4qXUw4k8ZkIoyKx+fvc35WLjEnKllMtkA08qPvVz4zMW1Q1J1GsiJ3RY0odCntJBOFd
	dc6EQnQ5WA1MsCvKs2NEqaautCh5od/Xt87g0An8whBVCxceeNB6NjaZxmTkVyCODrb8
	1D4Q==
X-Gm-Message-State: AGRZ1gJCZTd6duVl257yStjYqfvduNP9PjbaeFjtqeTa3YT3kyuQ3b41
	Vg7D3VGOW2s9DVrbYTRzRmOiEA==
X-Google-Smtp-Source: AJdET5di0czCgdk8hVnBeGJMCts8DGQ/gI3RXIt6EKdtPBd4gRE/EtAONXWtwsfvCFU6kesPc8P0vg==
X-Received: by 2002:a5d:6389:: with SMTP id
	p9-v6mr14813578wru.215.1541973595939; 
	Sun, 11 Nov 2018 13:59:55 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y9-v6sm12647509wru.70.2018.11.11.13.59.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Nov 2018 13:59:55 -0800 (PST)
Message-ID: <3babfdb5e229ae4c347d40c563e77270a72a4c6a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Nov 2018 21:59:53 +0000
In-Reply-To: <5f051eae-c4a6-dcba-be88-f84bcc8baac8@gmail.com>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<5f051eae-c4a6-dcba-be88-f84bcc8baac8@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 01/12] build-appliance: Drop test which is already automated
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
X-List-Received-Date: Sun, 11 Nov 2018 21:59:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-11-11 at 13:09 -0800, akuster808 wrote:
> On 11/9/18 6:29 AM, Richard Purdie wrote:
> > The nightly-build-appliance target already tests this particular
> > build.
> 
> If I am reading the AB code correctly, it is building for x86-64
> where
> as this is for x86.  A QA person would say they are not the same.
> 
> Are the resulting build results testing the same thing?

I have to admit I did not spot the x86 verses x86_64 difference. They
are different however I think a b-a image makes most sense as a 64 bit
one and it makes more sense to test that of the two. I'm not sure there
is much marginal utility in testing the other?

I can update the commit message to state its a conscious decision?

Cheers,

Richard


