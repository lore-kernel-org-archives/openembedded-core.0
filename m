Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06079C4332F
	for <webhook@archiver.kernel.org>; Fri, 24 Sep 2021 17:20:23 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.220.1632504021752111462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 10:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A6oAmf3K;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id t20so7412122pju.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 10:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=8mRvWpBlGZxPkzWxcggZa6i39U7yogD/pGq9WeoWvLE=;
        b=A6oAmf3KcfYRaw4yDD3KUIFMxglSquHmTHugHwY/KPtFQtleezv2uChCK+DHLwcom2
         K+4O+5nCe7Bo6T7HxW3l6FGtaG1IdHMjTwVrLBf+FqkK5Vx5oK7kfYKAapP1JYltMxEm
         FH5tkMf4K8DpTqWiMYNiIjVpGHCNMiP5uredd/puXwfjLvEhR76IwJN9Svu7JRzu3Aa1
         R3shqg/sEHf/86+/SjYk6DCkJJHnj7ObtM24Y1T8EI6CcpQnq6zihc76lzw0H1BKC4hj
         IcPjT//u2b2tvX+3wc7vckLpo0GrsEMYt6ibJqCRDvTfdTrXArVUljVmlq4hJ+KNHTe/
         OsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=8mRvWpBlGZxPkzWxcggZa6i39U7yogD/pGq9WeoWvLE=;
        b=6hzImfkDub8ZTskh6um3kwyHcCQSb2sj8CAGDMzkKszdSlnELemNuvNdUfSbyoO5yj
         ydurRD//5zWt8N8ffICT1aTFcFuJS7cAdlksNDj1wvkOv19CPt7L7y6U/m8hyWplhBiY
         Wpny8uPy1J7sLNjvV/CZp48nHNDwAUa76f1myE1+UDoKOp/VSOjq1dM9njNqHZlmkI02
         wJkkjq+9PiYXl5bSg93/fqwBdvdRgrEfp9A1bDeUKZcT56is7WSl9J1879oK92dchsoq
         pK/UCZwVA2lmVGIjUdlJ+MxtWg3mRuKORhLDOtIVGNX5yvEMsWEj8tcz4nlipJcPUv2p
         ypZQ==
X-Gm-Message-State: AOAM532SA02pCT2US4iXUgfOrD/WYs+SXcC7qBnvmxFLaUKNxKcTmLgb
	9g1nca/xqFZgqIv/I/01aj0=
X-Google-Smtp-Source: 
 ABdhPJyoIGelGJlNfLwkipnj+PURRjr+W2Z0J5bhANkmX2SbyetGxZzsK0kA2XgzXN+auJ4gG3LTjQ==
X-Received: by 2002:a17:902:b095:b029:12c:de88:7d3b with SMTP id
 p21-20020a170902b095b029012cde887d3bmr10091030plr.15.1632504021053;
        Fri, 24 Sep 2021 10:20:21 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:9981:da6f:8c0a:a030?
 ([2601:646:9200:a0f0:9981:da6f:8c0a:a030])
        by smtp.gmail.com with ESMTPSA id
 z17sm9653028pfa.148.2021.09.24.10.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 10:20:20 -0700 (PDT)
Message-ID: <95aaf686-9587-371d-6711-ce7520f1ab66@gmail.com>
Date: Fri, 24 Sep 2021 10:20:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [OE-core] [RFC PATCH 10/14] package_ipk/deb/rpm: Drop recursive
 do_build task dependencies
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <20210920124621.1576702-10-richard.purdie@linuxfoundation.org>
 <c6c0603017b848fea5650c2a2273e66b@axis.com>
 <CAMKF1sqeyw09suOzauHvqhMfieBedsKa-JH5Qe5H+M8R0cCbgg@mail.gmail.com>
 <CA+chaQeYFOeGMS0LtPYxOR5wPCwEQ0BMYJW9FRyOwNjf8N23PA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CA+chaQeYFOeGMS0LtPYxOR5wPCwEQ0BMYJW9FRyOwNjf8N23PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 17:20:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156338



On 9/24/21 12:58 AM, Martin Jansa wrote:
> On Fri, Sep 24, 2021 at 6:51 AM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     this is quite encouraging, dont go by number of lines of change :)
>     btw. did you also try with other change which reduces native
>     dependencies,
> 
> I've tried layer.conf change in our builds and it causes _a lot_ of 
> pkgconfig issues, but in most cases they are easy to spot in failed task 
> log and easy to fix. With ~ 100 fixed recipes I can build the images 
> again :). I've already merged bunch of these fixes in various layers and 
> queued it for others. I've seen a lot of these fixes for meta-oe layers 
> from Khem as well, so I think it's also getting ready. But possibly less 
> impressive improvement and more fixes still needed for other external 
> layers. Maybe we could add pkgconfig inherit in e.g. cmake.bbclass, that 
> would at least in my case eliminate maybe 90% cases where I needed to 
> add pkgconfig inherit (because native pkgconfig is called from CMake's 
> FindPkgConfig).

meta-openembedded layers are now fixed for the pkgcconfig issues. So we 
should be in a sightly better shape

