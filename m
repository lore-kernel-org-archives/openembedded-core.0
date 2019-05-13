Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 05AB9607E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:24:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h4so16725075wre.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qb8eysriNgmO8TXZZrdpw0aQPztS6+j3/vZsUfrZE40=;
	b=DdSz++nZzYedWSZbpzFcVt91rPB7rEAABB0diD84APCl/QVQtbRcQjMcocJxyEkwgA
	9wsEFdD/SXAoXoVQzwz1VX01lTBknw7LKBXVWAE1eT2SA3AP/cmB29DdE4cg9QNk+b9x
	IPxzSPoipin4pPPiOaUZ+NGMYQc9L4zwxgIXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qb8eysriNgmO8TXZZrdpw0aQPztS6+j3/vZsUfrZE40=;
	b=AklfcvYa1qAptfb4xMv0neuCjvhXK3MdvlKxT9NWdAc2xy16YLij1SzsXnZ6TruXu3
	QOOcZQKmJlxucRfvLj0TApJWAxWgWz3yDPAb6BHEo3t+jm7bvHoAKUoziYLDHiHWgppP
	m8R/MP2n/+pWNGdZErL7iNj8pHSvVoS5KsrpfHPzxQaQO6RmG4AllQEeIpEiaXhBcL2X
	AWJQ7pjNRtjAChUTRwnqyFOOhh0YwHr9g0r7Nw0JYfiFjnDGxksovSoLPRZsKZxgYGqI
	Fn7Aq24alfPHezMV4QgYgPIhkRrYywcofx3HmT59RlSJDXO8vdGzUawF8Jse96Oz7xAB
	WGrA==
X-Gm-Message-State: APjAAAUr23wdpD1b8RVVa59VFKUwD9TIlNcOj4ucdENO5+TUiCaKmkIW
	aKuaa5u57s1ojA0tNdNyOJybFA==
X-Google-Smtp-Source: APXvYqy47au1zXb4Wj5UzfF7hxXPkRgSqgeqZ/Abz5gM8rAi0AXavyjl/DwW/jKdYTnBb6XGVC8kjQ==
X-Received: by 2002:adf:e44b:: with SMTP id t11mr3563126wrm.151.1557779045810; 
	Mon, 13 May 2019 13:24:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f6sm16033742wro.12.2019.05.13.13.24.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 13 May 2019 13:24:05 -0700 (PDT)
Message-ID: <5c41f8b6a4b25135149b99f4e80c6a356738f158.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:24:03 +0100
In-Reply-To: <d53f683f-84c5-e6a5-3030-09762663b785@gmail.com>
References: <20190513112942.14103-1-richard.purdie@linuxfoundation.org>
	<d53f683f-84c5-e6a5-3030-09762663b785@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa/target/ssh: Replace suggogatepass with latin-1 codec
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
X-List-Received-Date: Mon, 13 May 2019 20:24:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-13 at 13:16 -0700, akuster808 wrote:
> 
> On 5/13/19 4:29 AM, Richard Purdie wrote:
> > We continued to see encoding problems with ssh commands run in
> > oeqa. After much
> > research the conclusion was we should use the latin-1 coding which
> > would avoid
> > the problems.
> There are hard coded encodings in may places. Would a variable be
> applicable in this case?

I replaced the patch with a version to ignore errors since I don't
think the other solution was right and whilst ignoring the errors is
ugly, its probably the lesser of several problems...

Cheers,

Richard


