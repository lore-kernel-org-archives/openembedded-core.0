Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A889C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 04:56:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.32970.1738817777266739629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 20:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XX+6UZ4D;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-438a39e659cso2538815e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 20:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738817775; x=1739422575; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRfjOjORqR0KI2/LMQnDi1s25eZ6j+uzrdOKfxaXNlk=;
        b=XX+6UZ4DD6Ug33ZCejGDQ0CJXlE2zsIDT8wRPmjrirjnnCKSh44WnYIdb7Bju3sZ/7
         apTy6moxXK2B9rR2rnPTNEF2Z3Ztr7sQNQTBlevG2b6KmrZtUswG5OJZ0MxK221fctiC
         UC3SfNB3zUhQSeR5mesjVkUoY+f51xNHEeJLUZiJncr0OOPRrP030OLhEvk+ECzSe2MW
         2FndzU5HkQmTRJPZ9Ya7laLy/MBfS88C7GF5iZaRf/O3Owh6ZrOUYn2sO1zerwTxUQYu
         XFAya1qlJ7Am+A6qKc+W9JNlbXBZznJ6YDUCyRUOMqN5VgSTt3qd7Zk4pskXdhFR7Oc2
         D9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738817775; x=1739422575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRfjOjORqR0KI2/LMQnDi1s25eZ6j+uzrdOKfxaXNlk=;
        b=rCq4KsfTLYsZtZr9mtwsCdw/wnctyGSmG/92LXaoWSKnwfQLE0BdchAKkcw8R18rq7
         fe7GBGSzm5l1d0KYB1dlnGrPf/gsLj2lJsqTH/Q7VEuZBcnM7DdM5pz5g3fJPHLBL5kK
         3MvGteIP67toqw6qtOZ+/qHS4qB2VrLnstAf+R2WGDXs+eqewjjb+Jlc5OzRQFdY31fw
         uVjCXq74dhdyQQO2iw6VCMjPU/d1fO0K0Uo0f9BQn1LtIDuRMpd0+8KGkiOHxXX2foka
         0rLRz8nLCI66VBB4EMCkvAzIwMNRF9tTwnfg4NxJu8YHcmmLRvX6R1MOv+IG52t1Mo3U
         zrow==
X-Gm-Message-State: AOJu0Yx0KkMN2hLZhOkUt7rK2ba302wDsOARJ1HYQUk5aCu5oW6+d49m
	F1cGDA7UYmUi1R87wWWUp9D4/I30vJuODVN6kdTRp/jYYh1L3m6we9wJiA==
X-Gm-Gg: ASbGnctgz8Wwfa4iJl9oWtlxnSejqxtNfEUKFyaHtgxSP2s4XEdW6N0E1zrza5MKGEU
	dwV25a6rDF3mqifs9KTWmmQDlHxUzquu3xsCdO12TJJIE0gcZhTyJXeRQjqeGxfFtILWBFybiuE
	F+YybuYbwkCMo9Ytmbdb17eUr8d3SmYWlK2NqqSDiogq1aYazehLpjl9Y9FAePDYQ08RyQCkMue
	HpRySF/eQTZeS9NpC0gpdYwWHYaJuaiVM4w3/y6cnEojKHcePwfPFT3t3YtF2HU2U4xdAhH4nIz
	hM1qpbg6E6lXUyLPamtr5BvIWSzEjST3mDSErF4ZqQcZaueG
X-Google-Smtp-Source: AGHT+IEI1Ytm695AK046wnyW55p5SpzvPLpylfWl/FYiyzS7Ndj5Ht1Lb6gv6fgIpvvI+0XKOiQRSw==
X-Received: by 2002:a05:6000:1a89:b0:38d:b57e:7202 with SMTP id ffacd0b85a97d-38db57eab02mr4125244f8f.31.1738817774957;
        Wed, 05 Feb 2025 20:56:14 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf4438sm42897595e9.25.2025.02.05.20.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 20:56:14 -0800 (PST)
Message-ID: <4db839d3-b550-46e4-9a8b-57cf8eb2942f@gmail.com>
Date: Thu, 6 Feb 2025 05:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v7 3/5] rpm: Set SEQUOIA_CRYPTO_POLICY in wrapped
 tools
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20250206044250.3311711-1-zboszor@gmail.com>
 <20250206044250.3311711-3-zboszor@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20250206044250.3311711-3-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 04:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210894

2025. 02. 06. 5:42 keltezéssel, Zoltán Böszörményi írta:
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>   meta/recipes-devtools/rpm/rpm_4.20.0.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
> index 6c995ff50c..d296c20d78 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
> @@ -100,6 +100,7 @@ WRAPPER_TOOLS = " \
>   do_install:append:class-native() {
>           for tool in ${WRAPPER_TOOLS}; do
>                   test -x ${D}$tool && create_wrapper ${D}$tool \
> +                        SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \

Self review / explanation:

This envvar is set unconditionally, regardless of
PACKAGECONFIG="sequoia" being present or not for rpm.

Reasoning:
* it's needed when it's set
* it's ignored when it's not set (rpm is not linked with librpm_sequoia.so)
* the next patch for dnf also needs it, and AFAIK one recipe
   can't detect PACKAGECONFIG of a different recipe

So setting it conditionally would have been pointless in the rpm recipe
when it has to be set in the dnf recipe unconditionally.


