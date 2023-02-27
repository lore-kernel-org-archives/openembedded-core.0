Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256CFC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 10:39:12 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.87152.1677494350466913999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 02:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PoFhB+Y9;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id ee7so23869919edb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5U+uUZaDJZT+nbw70hLxgXOyiR2aIPusDNkR0RVhqk=;
        b=PoFhB+Y9S8FykcIWKu16s17Rv5UE4hyl6rsEsOPS5G6NONZqoyFsVM8P81zcsaDrZR
         pYweJmv6fFiyexxxAqjzKkSrCP7zquOGUmVeIPInoUxkkrYjfjofwbrqB6l3kZq0M5kQ
         rW1FQ/zmNK4Ahxr0oKlYRXR4bg+ejApISp8SXqkMFGsKMjS1TiWb3jXvcoOHIBKhRbDW
         ybSOmJHKOmIuB+Z9h/oHEDKF4FDjj8DkbqbwBzqFaOKDnqUQJQ69f3Hgb0whz1qu5Zl3
         hAx/bQDy3ITGAKkQYN3oLRNpjb1QlJC3x56JxNZwonPgsukeBEh1DPsBacYVlpdmNs3D
         rRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5U+uUZaDJZT+nbw70hLxgXOyiR2aIPusDNkR0RVhqk=;
        b=lQIzG4UFzASZ1ZZJQPjmpgEGzv599+6Ms+FBcFeQfj+5SG08lRiuMj0M2TKx9pLSez
         1tUdII5+oz4QBE/nE/WewdVvGrnmZbgdQFvOuDt9Pudm6NBonP6xaKOCxjFy52r1MP4l
         EYDLmjrTKAop7oQwtjx5Xad21PMYETn8SgLn9xo1LVAdHfhhyBpPvfy3uJMq0ieHXVk4
         54DCoMEVid98j/k6Wop7la1aUqlHAyJcxjUUgYOLWBuRcCvKuDtk1IxmYUw9IQefryR6
         8qOZPhK0yu4FOlBYHazHjZ+Aq7J5Ck1V+D2TwggDB9kqvLQSJ2GdopsNkRd9imyWv3H9
         CmgQ==
X-Gm-Message-State: AO0yUKVrUSYqbmPK5J9C4nYodRRw3UW5CAgSjb2r/pKIEYAY3f3HUCP5
	cdPpBaLmWWGxqu8E6KnACwI=
X-Google-Smtp-Source: AK7set+pP2NGh2Q2H9QdlrgsmwFoxOh7vtYG1ZWdieGWgT0VUK7/OGkPiDWvh5FgsliYEOwZRY6tjg==
X-Received: by 2002:a17:906:a96:b0:8b2:d30:e721 with SMTP id y22-20020a1709060a9600b008b20d30e721mr37183079ejf.71.1677494348847;
        Mon, 27 Feb 2023 02:39:08 -0800 (PST)
Received: from [192.168.1.143] (BC24436C.dsl.pool.telekom.hu. [188.36.67.108])
        by smtp.gmail.com with ESMTPSA id my18-20020a1709065a5200b008eb2a1474d0sm3074503ejc.77.2023.02.27.02.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 02:39:08 -0800 (PST)
Message-ID: <4efb5d41-5f42-e2e9-3258-1f18d4dd6fed@gmail.com>
Date: Mon, 27 Feb 2023 11:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/3] mesa: Add PACKAGECONFIG "rusticl"
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230224093850.3393567-1-zboszor@gmail.com>
 <20230226050814.929055-1-zboszor@gmail.com>
 <20230226050814.929055-4-zboszor@gmail.com>
 <CAO5Uq5Qcyr4tywhEgJbFeONrrQW-W10i5Bp7iGHph0xGBeznUA@mail.gmail.com>
 <CANNYZj_5LJAp9RaVWh__NPG6UcAHf6SwxoKqg1w+c4fwA7ZeCQ@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_5LJAp9RaVWh__NPG6UcAHf6SwxoKqg1w+c4fwA7ZeCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 10:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177786

2023. 02. 27. 10:31 keltezéssel, Alexander Kanavin írta:
> On Mon, 27 Feb 2023 at 09:04, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>>> +# Building "rusticl" runs bindgen.
>>> +# This setting is needed by bindgen to dlopen the correct libclang.
>>> +export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}"
>>> +
>> Could that be part of a wrapper in the bindgen recipe?
> Specifically, take a look at create_wrapper in
> classes-global/utils.bbclass and examples of its use in meta/
>
> Alex

Thanks, I will look into it.


