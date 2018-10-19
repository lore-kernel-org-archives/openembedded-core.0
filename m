Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5A03E79CFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 17:28:30 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 189-v6so4381917wmw.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TrstOiQU4IyGK6e5qtRqvnnve11S/U0HFsgV00UEotY=;
	b=UAL6+SbvzDTx0fYAGDlv0oZzWFBcJY7Y+Of8WL7rI7lK4kE1JpV6GPweRRaUfdEwTi
	R5t1GgMe026YMfkSytZA6qAKsEuVTT6us+xMrIbrc/9JpLQI+zlqWJno1oP68Ix0Rw1s
	BHx0V0S4AAjMotLKp36eNggAAmU28Ziv9l/cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TrstOiQU4IyGK6e5qtRqvnnve11S/U0HFsgV00UEotY=;
	b=Itm+McD1WWSYx2M067XJj2HuWCBzd5mzO03icljJzNTRM4kRJN7wiqCDFpr16QuMIK
	kQUgDjt6iVO+91LERU9zhQdQeHnq2hUME+gJ6rcjmsCU0ZGYpWTn1n+6ksBE9rKtjOn1
	stNa5b1SiihsDn7L4MdYkjxNkGlBWRi1Z5S5NDAXYoC7DAk9FP9Jj3FaM+ylTnKfxERF
	FLSyRwoQfNLH+TBIPrI5og/6iQikZbCsL+xaX14XfaurhDqnNkXHWXA/EuReIBsXN1q1
	OQvjhQHO6Yfk7P3hFKuxdNlS3N3jfWg2KT59d3tdv3tBj2aN6qoTNQdiZ4bgOWcSWQzb
	Zc+Q==
X-Gm-Message-State: ABuFfog8Mk8AX998cJGFcLGrxGVzAjhuCd6s4UtlmkTBD3kccwUXRXgO
	iD+XIV26S+em57hQ7eo+0fhSEg==
X-Google-Smtp-Source: ACcGV6287XLTWPXNmzi+7T1Y7+I7hmEl5mcYe4C9XdbqaEX+QQd9uVS1J/xOAlF/BfjsWVrkg6BpNQ==
X-Received: by 2002:a7b:c151:: with SMTP id
	z17-v6mr6051882wmi.39.1539970110740; 
	Fri, 19 Oct 2018 10:28:30 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m12sm20859271wrx.75.2018.10.19.10.28.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 Oct 2018 10:28:29 -0700 (PDT)
Message-ID: <f595aee61f3c533f9d08152a2b3c896a9a4e2f16.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Randy MacLeod <randy.macleod@windriver.com>, Dan McGregor
	<danismostlikely@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2018 18:28:28 +0100
In-Reply-To: <ade6aec7-e193-bc8e-531f-811a17cb6bbf@windriver.com>
References: <20181018152215.23525-1-danismostlikely@gmail.com>
	<fa65fef901b5056d730703ce1c01a1594b2dc37c.camel@linuxfoundation.org>
	<64558ddd-8865-a96b-cc19-5c0e6d270754@windriver.com>
	<ade6aec7-e193-bc8e-531f-811a17cb6bbf@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] util-linux: alternatify cal, rev, and ionice
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
X-List-Received-Date: Fri, 19 Oct 2018 17:28:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-19 at 10:23 -0400, Randy MacLeod wrote:
> On 10/19/18 10:18 AM, Randy MacLeod wrote:
> > On 10/19/18 9:47 AM, Richard Purdie wrote:
> > > 
> > > The rebase went wrong here. I'll try and fix this up in -next and
> > > retest so we can figure out if switch_root really is broken (cc
> > > Randy)...
> > 
> > Ah, so it seems. Deleting switch-root alternatives, eh... WTF Dan!
> > :)
> > 
> 
> Oh, the oe-core commit log for master-next shows that Dan's
> commit is fine so it's *Richard's" rebase. I rescind my humorous WTF.

It was Dan's patch that was broken and I've now fixed it in -next ;-)

Cheers,

Richard


