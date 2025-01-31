Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6427DC02193
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 09:54:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.15734.1738317262620686586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 01:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bg3DeqCq;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862d161947so939784f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 01:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738317261; x=1738922061; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9laZikNRxu75BRUzODFc7XMVCYv2cLn4oJld0zhP4Q=;
        b=bg3DeqCq+zR5hQ3xZMUlH3sxeScKnT3RrYmfWrybmYZ766Wag9EbVUzrfaC+xGwaOX
         WDyijMxZyGL1Hw6wXWmkRbXHVkGXG27kA9LusS+/6O+vv/dJwFvA8Yn++hNKYHC3klIp
         rrIdmwINxSAaH6WgiNghDNKF4c3ju7tIK6gr7B8U+1D7e4E7/ALu0/H4+/8rj7VSrsRN
         t1mxXm5CFdBonWfnqgrci2lfgmQDMf0mRWYhV2kRD6A5d4QUhvE4Zyafw8rNVO7xU5yX
         P718uRzBWGZ+s7mQdkUZPpHlc4Ura8HAYlN5gGmVFxrgetnEMHYLXtLvUfdBX5I4IM58
         G0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738317261; x=1738922061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n9laZikNRxu75BRUzODFc7XMVCYv2cLn4oJld0zhP4Q=;
        b=sHDZwGhHGsYS/NeyBdT8wN/eiLF5MSXrkHPmt8AjgYPZiMMo4kmA6kcuWeT4dAlO6e
         9JnWPn2ywXB20P+tiG7Kxi4lg0tzaHBxhCoRMYkzJF/r2F6ehp6/uCk0rdWNA5ZbQQN2
         s1NgTKymDOw767Cihuj4dwbXLgX2hwYotBgbSoSHvHyRkvR5OEu0B09RtNYLE9Qb52zT
         /oDz3vPOpw41UlMhoX/C/OdYVeiZL9I78G8lNAkBga5SMQs8gkoa2im12O9Z06bsMtnZ
         tIkyBhS8Shw0fzw8gRUXOL24WC64p7mqh86ErvGUzGkIKznfx3Nn1B3YCD0W2H+Svrj1
         xTWw==
X-Forwarded-Encrypted: i=1; AJvYcCUq2hjoI+vDIBhTebcmxfNd+VVPAxdC5Miq8UHI2G5mq6iwo3lI1jbktn6CnU2gxbmdQ7tSiOUdQ+vgpkf0xeUO9g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyApcQlO9GbskVC59kCylZnMPYfcwAjftr/E1Td/Ohy+30fcOal
	N3Oo//Gu24dySf2aw88FoZ4kkQ2gmMQUYpmlQHCjudiGeKXtD/mq
X-Gm-Gg: ASbGnctbnkghOughqRuD2P16cOr6SrIeVst6nzfkt+vzzpd6Hv7mFr+TyrdSo+RHvE8
	SM4d45ZETcqGkPMna6d4GeFojgkkhTLyFzeK/idoOhrO3rtNygH4cgBccEtbjsHeJvrzfKPS7KP
	GKAa7a4PRpfjxaroglHSyVMOntUrS2VADTEZ1f6+8QPYLjdh3gno6WGDj7L5n2BkesH2GUxS//P
	oKoiafoudviLIhPdt/3+k1lco3U80HJoSMly2VDzGdVwgVoA+ia/JghelePmNwDMoQdv5ACdCAi
	hq9yXcTpoWvkzJrhC6mu981qwdJkpku0cetYReFDHIlhdGLN
X-Google-Smtp-Source: AGHT+IEa2cv1U6gG0A9LeOz594V7KVjYZRPCwv9bHyHUAK/N33WV6SCn5e5YcfelluQsX91ZZf5CGg==
X-Received: by 2002:a5d:59a6:0:b0:38b:f3f4:57ae with SMTP id ffacd0b85a97d-38c51949b97mr9953614f8f.10.1738317260793;
        Fri, 31 Jan 2025 01:54:20 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf2eesm4133642f8f.85.2025.01.31.01.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:54:20 -0800 (PST)
Message-ID: <5e1580d7-b8b3-4d99-8550-71c6acdcaa35@gmail.com>
Date: Fri, 31 Jan 2025 10:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v3 1/2] rpm-sequoia: New recipe for version 1.7.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129124741.4115324-1-zboszor@gmail.com>
 <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
 <181FB46B3FA62DDF.15786@lists.openembedded.org>
 <CANNYZj_auk6QcEzW0NHJpqoYaB0rCD+qiNWDJZOyikM5h_zsug@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_auk6QcEzW0NHJpqoYaB0rCD+qiNWDJZOyikM5h_zsug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 09:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210475

2025. 01. 31. 9:34 keltezéssel, Alexander Kanavin írta:
> On Fri, 31 Jan 2025 at 07:52, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>>> AssertionError:
>>> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
>>> rpm-sequoia (/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb)
>> This should've been caught in do_recipe_qa task, right when Zoltan was
>> making and building the recipe. We probably have a regression there.
> Actually we don't:
> WARNING: rpm-sequoia-1.7.0-r0 do_recipe_qa: QA Issue: Recipe
> rpm-sequoia in /srv/work/alex/poky/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
> does not have an assigned maintainer. Please add an entry into
> meta/conf/distro/include/maintainers.inc. [missing-maintainer]
>
> Not sure why Zoltan wasn't able to see and address it.

I don't either.

I had a completely uptodate poky master when I ran "oe-selftest -r signing".
Also, my custom distro environment was completely uptodate via "repo sync".
Neither showed this problem.

But I sent v4 today with that fix.


