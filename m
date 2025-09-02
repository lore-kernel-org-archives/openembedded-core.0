Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE06CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 11:37:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.75187.1756813054319118406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 04:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fJ0kgiRp;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b0454d63802so86272866b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756813053; x=1757417853; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xY4iRhgA6TxiogUTKkWczyzHL3mHnSWfYuo2cBtPhY=;
        b=fJ0kgiRpvv0WWM3atxlFkEuyM6d4mibmz9v4RK2fvHhYyKQJfW8gMwR5Vifmvp+BP5
         apcJF+9cJy3aIpzkEoAAxm16iJRr8eY//kCbSvsJe7vjCvHAbqdoVGXpPqr3108gr2ow
         ZDfAOYRstji5h8UtIeVQVDIUnO8pnYyQpDA+T+ULbQrYpqJMO8ysA2FmO+B8CRqpSeLX
         o5F8I2CeZv/icwEU+flAjAkw+Mf3KDMIeGkjMsmnB7dXvhv2Pd8Q8+Di2hH8amErWf7F
         jm0R+2Sa9kEyOpC0X6S2+30toXm30bsON3J+FLY5wDrRukm28wHN1JNq1HBU3oUYzLSh
         0M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756813053; x=1757417853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xY4iRhgA6TxiogUTKkWczyzHL3mHnSWfYuo2cBtPhY=;
        b=key4NIURx6DvOQfrqMPb29vf9EFMUZH22udjBhtntqVUnSUnYDik60AbFmRouR3/pu
         F45/AtgWs6a6H9zGwimR+4gSKebsYNwRhrvFtdclEEgzO8sxHDXjPRbzbW5KtQaD4xoW
         6CFmZbpR9vJDJw2slcAAqEMPLthcjCUVaPxkKTuoXiLx7Ehd/opgGXWdFYDRSIbz19b1
         fQ/86ZGf1LWYGaV3fmyMSj4thfD5G1JF2TJHeS2zSIH3GQPDLlFCp7e05O6aWeYOpueV
         zZvp5LnKaPEUBNVzqr7LaQnhn5Q1rkd9l2khPUngbVQKiY/MjohMNztZI6KYNzKEw2B5
         PCCQ==
X-Gm-Message-State: AOJu0YzTuRNRLJjWnEdvtiulI9T0S2fafBBXNuS6flPtVpxbBc9EXLK7
	RxU2SqWGYWq1nNtJP3TAxbur8cqQwlhCk86HDxB+hmS48v6Ac44M2RNn
X-Gm-Gg: ASbGncvml594AOcBV2vbvYK9cqlRMYj4akskE8lm5Z2rwzGoN6kNy3EX/UkHeQWaz+k
	nr39UPzmPlkX6ogcn6ReIVVmpYwlI3Iin1JEJuvvp2CTRr6ZOP6A7G1MqoOJOkkqu3tVh88Rmgz
	JwNwIQlhIJs9pz+bh1OjgI1X6CGK5iVSrkBFb+laFUj5BQMzXvzmCMv2suAatpkF6QxGHISl2Ad
	yBQJsHmNFnoP14efC7Rs3TnJFSQpxe3TDl6JueoA6cI2qgIkXucz7b8BElPsBD1wZSXHsMR+T0x
	Qathi3nZqf19jpR/Z3Kvu1vCFOQZzcmD7muZd7+/nkFYWTppTNHLjYZBpweN/xO+O3qk+RtU5pe
	0nfy0L67eHIloIo//kgxG2oQFPrMNmF0=
X-Google-Smtp-Source: AGHT+IGxzOLGh91s09939rxuAb16sX++OIt33XCfiILZQzfo0Te934kzJ5cQNgzdiW0yIDxzi9kLww==
X-Received: by 2002:a17:907:1b10:b0:afe:c099:aeb3 with SMTP id a640c23a62f3a-b01d8c90624mr1253760666b.25.1756813052391;
        Tue, 02 Sep 2025 04:37:32 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041800e89esm630119166b.30.2025.09.02.04.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 04:37:31 -0700 (PDT)
Message-ID: <55d22ee4-dd85-4f80-9d77-e469982a6d50@gmail.com>
Date: Tue, 2 Sep 2025 13:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] pinentry: upgrade 1.3.1 -> 1.3.2
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250829080118.3776531-1-skandigraun@gmail.com>
 <10AC7637-C4F4-45F6-B10C-A13FE5ED192D@arm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <10AC7637-C4F4-45F6-B10C-A13FE5ED192D@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 11:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222725

On 9/1/25 18:59, Ross Burton wrote:
> On 29 Aug 2025, at 09:01, Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> wrote:
>> --- a/meta/recipes-support/pinentry/pinentry-1.3.1/gpg-error_pkconf.patch
>> +++ b/meta/recipes-support/pinentry/pinentry/gpg-error_pkconf.patch
> I looked again at the state of gpg and pkg-config, and I think we can clean up now.
>
> Instead of patching gpg-error.m4 to use pkg-config, I suspect we can simply do this in configure.ac:
>
> -AM_PATH_GPG_ERROR("$NEED_GPG_ERROR_VERSION”, have_gpg_error=yes,have_gpg_error=no)
> +PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $NEED_GPG_ERROR_VERSION], have_gpg_error=yes, have_gpg_error=no)
>
> I suspect upstream won’t take that either, but it will be a lot easier to maintain for us.

Will take a look at it.

> Ross


