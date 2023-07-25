Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB72C001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 10:27:23 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.17179.1690280840850097923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 03:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GR4Ojve4;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99364ae9596so918923466b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690280839; x=1690885639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfhRiRFbzrPLB+bUfUQWqUHkv/ZixRjhDK0Aa6QfpXk=;
        b=GR4Ojve40xdULfwP+udCweNq3zPfADH6ZXGe65ZLUFxtCppe9T5j7uwykzj1mPtoTd
         U+wCGnOnep8HmKPcc97YOLkrO37M6dbzkjonUZbHV+fn/nWL08JWZKY/5vOJtx/aZncP
         iz35t4zpuAAzoJ/7FijM89pdUJh7c5++5I1zKVW5ByYSWmG0CVLeDzRyeGTuCtGGF+Ji
         roPWd3e/Pv+qtjIu0rSTt7AKM0fmIYs8gGqGscn7cGcGfHjoE+lNcYm/lpWh5vtD7OlY
         v2KuBf0OA5Z8GBj6lOG95FBZgOp03ulWdApdVsS4mdyetCWru+dPCsXnKrqCn7Y5Nw1O
         lAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280839; x=1690885639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LfhRiRFbzrPLB+bUfUQWqUHkv/ZixRjhDK0Aa6QfpXk=;
        b=QAMVG3OwisjUedf9djR6sRo0AwDTM0zxfYeBz1RCcbXy7ozi76kkV74BIbemYagVdQ
         ELAEYVZScKJargj8s17WF2EwuiYAPETHsJmK7Io+yW3m1UnZW0qYN4aODwva+5cJznAV
         sUE9+PkGgDiRmTRQ82Y57E6s39ObSq8iViVhKSBwU45gUdigVj0KmmZFwvjdxTjcEsaT
         +ziFTzVxGktmA+r7faS+x2zpWwm8ygAhTa0dA/YHD9uaxIXSCfYSvsJ2ED9X7nxp1YKt
         6fLxcl5gheSCnGQtzn2PdhjopR8l3CziEBQ+hyLwys74f9UZVz/FfpbAr3jKG2BsNNuK
         rHbA==
X-Gm-Message-State: ABy/qLbSe5LeDuNfFaSEtPRkzXneEHqH7+3G5AcPkq7g1c/tvFJmzwIt
	OhBZ4ypw2ZHlf8fPCo0z3II=
X-Google-Smtp-Source: APBJJlF8C88fy9E9FBoI7LImhYHb96+yozmlExGD55JN052a25RrQH3UG2XflHfDYHNuOlSNne4OcQ==
X-Received: by 2002:a17:906:101a:b0:98d:cd3e:c193 with SMTP id 26-20020a170906101a00b0098dcd3ec193mr11133698ejm.46.1690280839103;
        Tue, 25 Jul 2023 03:27:19 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id kd7-20020a17090798c700b00992a8a54f32sm7902865ejc.139.2023.07.25.03.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:27:18 -0700 (PDT)
Message-ID: <79529556-5b85-c8b5-1145-177c741f9da4@gmail.com>
Date: Tue, 25 Jul 2023 12:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>
References: <20230724123529.288581-1-zboszor@gmail.com>
 <CANNYZj9FLbQxnbhd-Lzcr5GB3Ycf+35O1eADZ51EuVNg-eN33A@mail.gmail.com>
 <CANNYZj8HRnoCSBax5VzHU+xU+=XqeS3gF_ys_jFzJYs2+MivwQ@mail.gmail.com>
 <3040946c-5697-d6f5-567c-7bb85f8e0c49@gmail.com>
 <CANNYZj__RUD=T7qgBpAmNs5K9Qf1hgFkjeqnsm_04yAQJkxQow@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj__RUD=T7qgBpAmNs5K9Qf1hgFkjeqnsm_04yAQJkxQow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 10:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184831

2023. 07. 24. 17:20 keltezéssel, Alexander Kanavin írta:
> On Mon, 24 Jul 2023 at 16:59, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> I'll rework it using a template file.
>> Still, sed would be used, but in a more readable fashion.
>>
>> Will this work for you?
> What would be preferred is a patch to the source code, and if we can
> submit it upstream, that'd be even better.

I have a working recipe change based on
https://github.com/rpm-software-management/rpm/pull/2579 (for 4.18.x)
https://github.com/rpm-software-management/rpm/pull/2580 (for 4.19.x)

I will send it soon.


