Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8A3C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 17:34:54 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.2737.1678901690028743377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 10:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KtyRqPtr;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id fd5so44662794edb.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678901688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4BgcHmKNkeo1nPwbETapOO5fvATRE6+Z0abo84q+UU=;
        b=KtyRqPtrHgCqHbSqTGgjklO4g07g4uGzSAL52fCbBZHdV66zP991AJL22VQHerZwyv
         LFRhsh0DuqEx8hgVDb/eIUYPw5ExvsBHh20LZYEpCHQzOyG7s+qk+92V6uqQo7fek4m7
         kddlmDIwOwyPH68BaG9W/RjBzXL74WFZlOvStMMTowJn3g6Y9Fjwm9vuIrkCkfPByeOi
         oesWsPqWKCPaCpep9mY7s1UwqhPgP7esUG/8RdpVzl5gTdjbze+xL4yfcTTWavDlqd8M
         nghO6xzUu6vPlnMzetxA2vsMO9ldP9Igz8G6YFp0R0tJv6OUKS0PSIySBZK8n6Yl7yLY
         LFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678901688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4BgcHmKNkeo1nPwbETapOO5fvATRE6+Z0abo84q+UU=;
        b=YcrpErcZ/fW+4qKNfcabjJi/V8IHbgct+563Y7Ok6rtQkA3ttffvQmEWLJb8Wk9kYu
         pvhsJ4ebxatgP9kacxjpkU+BOlOGLF4SAVGNnqqb0X6SK81PjRFii6YsvF96GUqE+FTg
         gqO4OHceCT1laaAwy+ZTDB7P+hfpp4JW3tj/KGxwq8J0nUH9yhTDgZmjKMIop9P3u7v7
         v+7yA31Bz2hb0HzGMBzAV1eXRg5fIBtsPfyMXvJ1GYlcdezaF7MExkLPDJS08VuViAGL
         3YUJNUBfNVi8ILjiN/ZA7xLiHViYzrYsvzJXD5m2QQ1Lq4Y5N7xsUombug1PBYvQIipx
         RT9g==
X-Gm-Message-State: AO0yUKUPjVXp2ekottXoLIoLu8jYEVNlNnDonVneXJ4p6PA7jMn4JSmK
	Ne/F64A2ddygRbbsILKpxiQ=
X-Google-Smtp-Source: AK7set+kyEVWjnaWa045Qhrvg6QAHBaa+B2nkK9dQGY0q2363uVY7GMVyp+x3saLN89nnETwzVA0JA==
X-Received: by 2002:a17:907:76b5:b0:8f8:eded:4254 with SMTP id jw21-20020a17090776b500b008f8eded4254mr7925175ejc.65.1678901688247;
        Wed, 15 Mar 2023 10:34:48 -0700 (PDT)
Received: from [192.168.1.143] (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id q22-20020a1709060f9600b008eabe71429bsm2803567ejj.63.2023.03.15.10.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 10:34:48 -0700 (PDT)
Message-ID: <ebd528da-79bd-22f6-6700-b876d6891035@gmail.com>
Date: Wed, 15 Mar 2023 18:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH] meson.bbclass: Split into meson-common and
 meson classes
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230315080020.2648416-1-zboszor@gmail.com>
 <0FA14024-12BF-4952-8E22-3D8A64B472FB@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <0FA14024-12BF-4952-8E22-3D8A64B472FB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 17:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178654

2023. 03. 15. 17:52 keltezéssel, Ross Burton írta:
> ... apart from the CONFIGURE_FILES line which would still be needed in the python-meson case anyway.

Actually, it doesn't seem so.

It is purely a Yocto setting that doesn't influence running meson.

For pep517 projects this would be the correct setting but it's not
present in currently existing bbclasses:

CONFIGURE_FILES = "pyproject.toml"

Patching the meson settings from meson-common through with this line is enough:

PEP517_BUILD_OPTS = ' --config-settings=setup-args="${MESONOPTS} ... " '


