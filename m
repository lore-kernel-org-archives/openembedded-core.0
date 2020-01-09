Return-Path: <pascal.huerst@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 84B3C7FE99
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 11:59:32 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id u2so2534079wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 03:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=JPDrCfXCCgbnfN39Cm0Z2xQ2rbqXQmTFTw+CbOw2u38=;
	b=km3t7qdtNOwBWZk3quDVyzJE+AkDq98hay8dIdWJhpJ6VPDGuqwQUBfF1ljjAQ8MtW
	SMjw6bppMaHXMNFBPduf7X9ZyrXLc3GfiTdHBBff48fRj1Lzdi2ABhhZV1cnXZXOmzrN
	E1GtpS7qj2x3I0+H9syHwE4JrSlMhozJLbLuUO0Y/1aQ4mF1mEQb+CqeFU5mFwxvYJt/
	RA+xEyHkr5Kg2eDPWwoyG8McM8+2jzu3eEDJ17nf7/p7xIsAHw74mKNYbUrLN5tvZciG
	f01gkxMgZJtFH1VR45yrZ/afgSFuvcdgIdYSW2Avl1tfSwsqlJdSwTSSi0OwW9Gt8vqp
	uafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:references:from:autocrypt:subject
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JPDrCfXCCgbnfN39Cm0Z2xQ2rbqXQmTFTw+CbOw2u38=;
	b=VW6k+LjiA6/LUQnJPNu0iTmwGyw3xXxvPGmU3WSlaQt2I9XN+JpWRAzi6TqcFJBziu
	j8AGY3qiLl3OpAXIocvqSo32PoFkk66hFNlh3DhSftvYUrEFDA/9WCjjNRPSjWPv6pbz
	jS+RRNk322GoLZYEi9LBeQog6XmGnNKcEiSauj63QLzqDww40VYAiA78MGlC33hgWXfl
	MRX1ANPRZH9u9gWpxqqpfP/SnmeUgHkXkSEr3aFj62mYJUDfEegl0fn5h/GLDKTGVopI
	2bh5/Gs9T2/JSM22yo33rHYLPCJbImVF/fNQh42FFujA4IC26AGxuD6g6uE2dFkjQUuN
	4bIA==
X-Gm-Message-State: APjAAAU7/sJf+GSZ7qqldchwTCJgAfQ86+R9hKkBulJEPZKbtU3DbGX9
	fXYR9yDtgejWvOzgTiJCZKw=
X-Google-Smtp-Source: APXvYqwF1UxTlYqyXzycz61uMrxoWYX9iHsu8w1QrJiXLUzkI/sz9xZ54v7J+XI3GGj52LPNIbWAKg==
X-Received: by 2002:a1c:7f4f:: with SMTP id a76mr4521006wmd.77.1578571173213; 
	Thu, 09 Jan 2020 03:59:33 -0800 (PST)
Received: from [10.10.222.52] ([194.162.236.226])
	by smtp.googlemail.com with ESMTPSA id
	n14sm2554987wmi.26.2020.01.09.03.59.32
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Jan 2020 03:59:32 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
From: Pascal Huerst <pascal.huerst@gmail.com>
Autocrypt: addr=pascal.huerst@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
Date: Thu, 9 Jan 2020 12:59:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
Cc: Rich Persaud <persaur@gmail.com>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Thu, 09 Jan 2020 11:59:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09/01/2020 11:51, Richard Purdie wrote> I did look at and think a bit
about your patch. The trouble for me (as
> the bitbake maintainer) is that:
> 
> a) it isn't clear/obvious from the variable name what it does (or even 
>    from the code)
> b) it adds yet more options to the fetcher which increases the test 
>    matrix and possible ways things can break
> c) the test doesn't actually test it does what its supposed to (no 
>    check is made on which output is downloaded for a given revision)

I certainly wouldn't insist on the name and considered it a proposal,
but you're right, it's not obvious at all. As for test-ability, I can
relate to your concerns and understand that you don't want to maintain a
corner-case like this - Which leads me to the conclusion that we should
probably rethink our internal concept for release builds...

> Some of these can be fixed, some are much harder and I can't decide if
> supporting this kind of edge case is going to be an overall good thing
> for the project or not. I don't want to give you false hope by fixing
> c) only to say "no".

Understandable.

> Add in Khem's valid concerns about reproducibility and it makes it a
> tough one even to give feedback on.
> 
> If we have a ton of users saying "yes we really need this", that would
> help but I haven't seen that as yet...

Fair enough.

Thanks for your thoughts!

