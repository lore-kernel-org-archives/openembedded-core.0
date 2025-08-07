Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930C2C87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 10:41:49 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.48686.1754563308981676901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 03:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZcLSPz1P;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso1444819a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754563307; x=1755168107; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUKki3yQkufwLFb2WvmWNCldGucBg2gZHjajccfWv+8=;
        b=ZcLSPz1PWk+/vj/hV27SeJqB+OHE6UAKPXEKYwZ6Li2t/k9YGszki9QoL815NKxUg/
         R3ACZJCPluoW4em+BmU+ppsPFgoL9LlnNwEcR7OEQRnGlgK0G9FV6G7LmnAGq5iHXnzy
         gZUmLAZpUNjQhuC8Q1+4d4SvniWUh8TVNDPh+TBR47v8Wa2x17oabxeinJGlttEaKSba
         N/32riJla3ROenosH6gUDGVjSsbvTAg7rClJpM6X7jAr5L6UFNdUdMEi6Zuk0lRqBPsy
         j9dvs1zV60+gQ9tPhJB548O/EqB6NR2ymy+JtEVxGe1L7o6WZ0PeZ0VC8Um7SGSegpDN
         qU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754563307; x=1755168107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUKki3yQkufwLFb2WvmWNCldGucBg2gZHjajccfWv+8=;
        b=izYa9Fjae6uRkOunvJFiwQQhnF6dG+u03zO9NMsV4+9wuv8vtG3/CTPVP+xJO8+LvY
         Js5fOR7TrFYcg38Hfbb2uldBMdQUbl7sM4kUF2OATh2CqF5ZlybF7lKHnm9bkpUEr9uS
         Gk7URQ10Gsg9odP/ahwnDans9jm9INW/E0pKRC1gmJAKaRVvIej/gjpBiNrjZuOF1P73
         1SwAfnAoHGXZRdfGOq9We65x6zxqK0fzT8nChOmVHNaT+6zVwrfjfsyFUpbqgUKwv5Ge
         KXLIkAcCnRVTqwCpVuo3attSm92wsUSDe6Yn+oWJoWTg/V1LJYT0LZQAPlCNqgJv6Gw7
         qRvQ==
X-Gm-Message-State: AOJu0YyIllF7OOpR/hf/5e6cLVXw5eQcSayaHd9wtE+VHHNDq2kg3C35
	Qlqt1G/Lz0YuWFyaEUOX3a9VwWG+IreSG7/TD4mvpa5lP7hIWkPMGi/8
X-Gm-Gg: ASbGncuBvhHt7ivYmrNgv1WOgT03NUoMhnEtlLCbrT5LYOiGBhKqUgHsxoOj0AK44Af
	U5hT8H3ajgQJcymhKmDcks1nSa3hApTgFHxxJWzYotRQ9cwu5nFw3Jnfx4ed7ugeqD9x854TGGW
	15+5SfAnbWomORnDA/Qt6rlkLK266B59E/TjLAa/8MABZVkvQ5/DyF8s3nZc8Zr7x/ornP3LYC9
	CXlKuFToilY2jTVev+WecTp75/cqfKwbUMevHEXRg5Fa2z0Vd9Zv2fCI/LuD1FdfK3KccGwDdNh
	XkSuBQ7MRbhyRhn/hu//OTZ3CPIY0rqNzRwEj6jeOYDRpLCa6ZIjn+/GSI12v0/51E2yfBQtK+Y
	Dqf0+e+vFE5tvSh7bazOAbdUNdeXOHCQmsiqmRny3
X-Google-Smtp-Source: AGHT+IEaUIxZkFC/0GotuHZXAQ0yHKwd9/95rxriea4CtzwMwVrUY7OYlJH1yG4oUQFebwaSjbdPRw==
X-Received: by 2002:a05:6402:26d1:b0:617:c1e5:bfa9 with SMTP id 4fb4d7f45d1cf-617c1e5d1f3mr1277105a12.33.1754563307059;
        Thu, 07 Aug 2025 03:41:47 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f16062sm11525263a12.18.2025.08.07.03.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 03:41:46 -0700 (PDT)
Message-ID: <69f256e1-0ef3-4212-9e2b-f141de7ea2ef@gmail.com>
Date: Thu, 7 Aug 2025 12:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] webkitgtk: upgrade 2.48.2 -> 2.48.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250803073541.2210769-1-skandigraun@gmail.com>
 <CAMKF1sr2zYyuzewOE+miSNdfpE2haU4iAbybpzmxRvXtX6pGbA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sr2zYyuzewOE+miSNdfpE2haU4iAbybpzmxRvXtX6pGbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 10:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221564

On 8/7/25 09:01, Khem Raj wrote:
> Not a blocking issue but Interestingly it fails build with
> clang/qemuarm - https://errors.yoctoproject.org/Errors/Details/874909/
>
Hmmm... will take a look at it.

