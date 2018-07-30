Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id A6E4678D97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 16:38:01 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x5-v6so7548544pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=TPvBnX47is+q9/+e4XWNb/6NOvFvLVK3LxJHNExJ4es=;
	b=N0/BJTBqSaVgBiiUGVt98ADSj5GGGfQoewYDY1GHqYtSJ+F+QECmnZcUdAPNUfZIHs
	TRkupiEPJlSR4tmHKnawxqAaNZCg9fbjiR8xV6N/HNFp5z6sukSmPxwNZNOTQqTGh1Mr
	MrUmCRFs25S2x4C4RzXr2ECitwZYSmLFq1Z3CLKkq9SO9oQK78QSmlnyJN/O/TbcnuuQ
	fd15ZZbSxhncZ+/DBmHRfMQ6Ojyk1CWXGj52Io+EzWTclgK2OSj68svu1zYQXr4VJ1mf
	h4Yr6iQAP3KX3eQOZWw6R0wiVdy3BlX6GcwNN1uq25mYEUu9oiXHz8fPrx3dpBdAXA3L
	gAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=TPvBnX47is+q9/+e4XWNb/6NOvFvLVK3LxJHNExJ4es=;
	b=aDRMvGWN6acw8XlTJYXC1d17g4rol46DFLfqw5MHENSHaTbTvqJBsPTtVgokgNxqGu
	32cfNi379BP/WPXAdeESMPn1rkCLXjWCfhdFJn1yGlE+UXgUKdBjqbkBekEKuSgV71Ux
	M90ZYVvXSmwgZ28BaUN7278O6x7LB/EMR+rXWnRKsPhYEP4LEfkjQJ0EM71LzJy9dts8
	bXAY7byfCJZVg1pt9kpsc/dTYoezGsgX9QUMJpg1UKKGS2+kMzn3dLrTTtC5Y+sjPx0B
	VEXD2mY57+FVNVJuysL8E5OPqtow9l8CCRdGYBRT0r9bNEZtgHFEMGJiiUhjInLU84e8
	AFZA==
X-Gm-Message-State: AOUpUlGs4433oAiTWG3+ItDr+21Gsa8FKGQrEoKmw6vsIL2JWHIRahUD
	j8UslsjzAYzZKxL0fR3ari2dVRd2
X-Google-Smtp-Source: AAOMgpex9XUFIEGaq0BgU99NvhUyqQTt8HjxliXS3uanw9FplxaSbgsjD/iM1bUB+zrc/xuzxpAseA==
X-Received: by 2002:a62:411a:: with SMTP id
	o26-v6mr8577430pfa.111.1532968682594; 
	Mon, 30 Jul 2018 09:38:02 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:f98c:c6a6:efae:e2fe?
	([2601:202:4180:c33:f98c:c6a6:efae:e2fe])
	by smtp.gmail.com with ESMTPSA id
	s16-v6sm16383003pfm.114.2018.07.30.09.38.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 09:38:02 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>, openembedded-core@lists.openembedded.org
References: <20180730051029.5530-1-joel@jms.id.au>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <682febae-f873-d42b-3fd3-fced5f8a82b8@gmail.com>
Date: Mon, 30 Jul 2018 09:38:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180730051029.5530-1-joel@jms.id.au>
Subject: Re: [PATCH v2 0/2] GCC 7.3 fixes
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
X-List-Received-Date: Mon, 30 Jul 2018 16:38:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/29/2018 10:10 PM, Joel Stanley wrote:
> v2: Add Upstream-Status tags
For sumo too ?

- armin
>
> This series has a pair of patches that we have been using in OpenBMC's
> Yocto tree for a few weeks. The build fix is required to compile from
> our ppc64le build machines.
>
> The std::pair fix reduces memory requirements from many gigabytes down
> to something reasonable.
>
> Joel Stanley (2):
>   gcc-7.3: Fix build on ppc64le hosts
>   gcc-7.3: Backport fixes for std::pair high memory usage
>
>  meta/recipes-devtools/gcc/gcc-7.3.inc         |  2 +
>  ...c64le-build-Partial-backport-r256656.patch | 36 ++++++++++++
>  ...-PR-c-80290-memory-hog-with-std-pair.patch | 57 +++++++++++++++++++
>  3 files changed, 95 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build-Partial-backport-r256656.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-PR-c-80290-memory-hog-with-std-pair.patch
>


