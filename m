Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90781C0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 11:00:13 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.17594.1690282803559818581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 04:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KRRjBXgS;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5222b917e0cso3129320a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 04:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690282801; x=1690887601;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/E0ygwjbZWhsqcP/Mx4gObbWnOo9Lesehm26mqDoJqM=;
        b=KRRjBXgS9Dx6Ku7EWPrEtA+iQmEQ87/PeQ9O4e1vdjn5P4PsyLA1ZIkgg96zL4s2nY
         OF1Xq2FpNl+kVnw6+bigs0B655RPGLKN2EE6c1SPB19QofSg6+K3F8Om4haEAlrX6EnY
         7iSgm6HkDujxBuB3IUK1OI913TOOqwrry9QOVDxVraHJMDBvRFUN8xluy0L9LNU5ePEU
         UcSBCUxH1sl1NAVmlcs2UPNpU/EnWpjQq2P33PtniZ4bLsdChLacVf/i/m7xYJliL/pt
         Pu5YUhxz2jKHYfMb6jClS4PKqLV/tlbTKJQI60PZdbWdixRjWu+e1z0Q4E/l46VBLSkK
         jLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690282801; x=1690887601;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/E0ygwjbZWhsqcP/Mx4gObbWnOo9Lesehm26mqDoJqM=;
        b=Xlpu00iDjwvdccMDM7Tvr9zzHW6OuEPG/Mp50CwxnCD6srQpUA83vL87hl90jyGpDY
         jIzSASUT8dqG3FALUPDz0mw9586LMeBHjr36xY5myL0W7vrLPvtmflckI6IApTJgPOVW
         PufRaAlfAiQlPK7yevfu0N0ZX01eN6ZU5flMuMeCuzGv2SCq6H8dXSqJwwQy5taZMKhW
         12b7MXkyKyOvKRenJodjeYYuYpcNpmDes5kgTIm5wrW4Me9p8brZl3ZSF395hFI84bqP
         vV+QhH+V8wGoWPNKxhLktDvMoPpT9ggNk/C04eb3TehR9BYZlfnhPocCfq/IIu9wnzrS
         exvw==
X-Gm-Message-State: ABy/qLZ3rWRa4m4nY256LRI+aGbMMHzebE65f6DUfSv8wE1opRflLioJ
	6mMfjlCvBb85OxxS7CcLZ0Y=
X-Google-Smtp-Source: APBJJlHGlRKsl8BLN1PZWhT1lawbU8Ue9uy2r0oV1DYnXQmvl4XaJvjrDyhD9ze9w0JPGJ3wyODDjg==
X-Received: by 2002:a17:906:1089:b0:965:6075:d100 with SMTP id u9-20020a170906108900b009656075d100mr12275213eju.39.1690282801568;
        Tue, 25 Jul 2023 04:00:01 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id q4-20020a170906a08400b00992d0de8762sm8042228ejy.216.2023.07.25.04.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 04:00:01 -0700 (PDT)
Message-ID: <5c5a31be-f45b-3227-faba-7ef2b5d49556@gmail.com>
Date: Tue, 25 Jul 2023 13:00:00 +0200
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
 <79529556-5b85-c8b5-1145-177c741f9da4@gmail.com>
 <CANNYZj92V90ADfPLOwT2QEkm9JyE4aDWM7SFCPO6JpFVbE7xqw@mail.gmail.com>
 <17751648A3E42B17.23395@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <17751648A3E42B17.23395@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 11:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184837

2023. 07. 25. 12:42 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 07. 25. 12:30 keltezéssel, Alexander Kanavin írta:
>> On Tue, 25 Jul 2023 at 12:27, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>> I have a working recipe change based on
>>> https://github.com/rpm-software-management/rpm/pull/2579 (for 4.18.x)
>>> https://github.com/rpm-software-management/rpm/pull/2580 (for 4.19.x)
>>>
>>> I will send it soon.
>> I'd want to see what rpm upstream says. Maybe we're doing the whole
>> platform macro thing wrongly.
>
> Hm. Maybe using the BSP name as the platform name is the problem.

Maybe it's not that much of a problem.
As far as I can see, kernel packages and a few others are built
using ${MACHINE_ARCH}.rpm and are put into different
subdirectories in a package repository. If everything was
built using ${TARGET_ARCH}.rpm, different BSPs that require
different kernels but otherwise use identical packages wouldn't
be able to use a common repositories.

If the project intends to keep this feature, then something
like the patch I posted on github is needed.

> FWIW, on Fedora, there is no /etc/rpm/platform and binary
> packages simply use .x86_64.rpm or .i686.rpm suffixes.
>
> Apparently, rpmbuild can deduce the platform without help.
> After removing /etc/rpm/platform, rpmbuild will generate
> an .x86_64.rpm for me.

And this won't allow building a BSP specific kernel package in the
sense that the package would be installable on a different BSP

With the patch I posted on github, any package built on a specific
machine will use the BSP specific file name suffix and maybe
it won't be installable on a compatible TARGET_ARCH machine.

Catch-22?


