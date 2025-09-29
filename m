Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0027DCAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 15:40:22 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.1197.1759160417942886341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 08:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pn64DiNe;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-424da17e309so52736665ab.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759160417; x=1759765217; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=361JzYT1xtTINcu840noVyOPZI9znaR+7Ad0y0ksSG4=;
        b=Pn64DiNekWMcPmvqqFBIszxfMWiuKDYeDA4cTJsOCCPE31x/Vdd/d4oBzxT5sIx/VS
         WMgr04AcPZBlzKRFwOPPtMAvzjUnBUj67wo5bWApW8J3LBVKtK/naE0V0UjfNdQzrFL0
         0SgBoywIdYJ9NrR9vOOTvDE0jUfalyC3GLqwnlKzaVPg3jDyhdeqLyf56Sm4DZz9JHLm
         I9iBFV9aS2f52iTdFSpuiNUdUlOhQB3KcGrjUE3LGmy6LRN/SmNXYWb/R4fMEYBm8Ud5
         YtUW+sHXXnPTv+ih4c85HeBw9KDCjr0+Q6lZD4tCTUPHoxcrqqkJ4N+g+7HnwHNxfqRx
         0LEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759160417; x=1759765217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=361JzYT1xtTINcu840noVyOPZI9znaR+7Ad0y0ksSG4=;
        b=Iaw9HHr+LirXBc/YFg2oe7dqNGx1RQ046FApJRzlqc1WUOvmAyZzveWmO8TKj1Etyt
         4Ux2Hf0aLzZmHEo2HmknnRBYk8tMgvrx7c5xPD/uipL6WwEHhAC5juoTaZkbLl6XQeP3
         AQ739M1EVuIYqLrnVM4IwphRSYHZINUy+Pm1oMJm99KZMF4WAtVQtH7LbmWyj8zcfBpR
         34U5lF9Mr6ojIfI7JVrhITmh6BfBmoWXYSj/JJn+KCjtISOG9lKupeDmx5ydGnoJ/dYg
         GiAEpz+hOgeIhQl/iL/SbFizezIRw7+f9u4hpwsbuXVcfNhXP1qT3azUgH1MV1cdpqnH
         Rytw==
X-Gm-Message-State: AOJu0YwjTgEGytEYhWsQq/vWW5PHdsqjRG6tcSB0PTtfLGqb1TBF6Xgv
	COcNJOZhtvb9gpLHcV8RrNKb3JkNI1bmSvRKWDVmpEKf6QctUDf+3teC
X-Gm-Gg: ASbGncsJk26DSzRZmiadMX+/LWteM96esTsOZAKhVV5DuQmLQSL/nfIgY5uTdMwL5MF
	cF5Y3prvJw8w7xH5/SSCiex8Or+h6LgHRIv9tmbiYt2Zag9goiFKeI4UgXhjoddINfb7y5apxGJ
	TfTUryNQ6cgAxp4UKtyOGth9ynuVIwB/upM252APS0IKkfp8+vhNhP35OgeWzI4BF33yhtFAui+
	5dR7EJr6R4bAOFf3A6gAlpkrASkD2SZlEsrt+cz2Bf5NMY6ntcHL/ggMaAnpGHaZyQKfMWXYQbF
	/9JIwIFsSYE2eTyCV9+blgF7QbG2GUlz/55QdJGSpdzXWkL2uz3G/tVTwdE+UvCqMkTvfcLHZzW
	MXDzmT+MFnolLf+EgFQE72M4ow5MIlhZMM2a77OuBgA2PiDsEtJ4JaEck0IRjUGlkXnuHAtsZdA
	==
X-Google-Smtp-Source: AGHT+IFrr9amVD+EfF1YcauJLTgzPVHlAdoDLPWYM3pFOGCliV4pUi4RHDUJYTK70armd0b7a40p6g==
X-Received: by 2002:a05:6e02:154b:b0:427:de6d:b6f3 with SMTP id e9e14a558f8ab-42bf8310281mr48071025ab.8.1759160417023;
        Mon, 29 Sep 2025 08:40:17 -0700 (PDT)
Received: from [172.26.252.3] (174-16-207-42.hlrn.qwest.net. [174.16.207.42])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bff83e0fsm58799495ab.39.2025.09.29.08.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 08:40:16 -0700 (PDT)
Message-ID: <8ea77c3c-5dc1-4eab-905b-27a4cbfebb39@gmail.com>
Date: Mon, 29 Sep 2025 09:40:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rpm-sequoia-crypto-policy: add nativesdk to
 BBCLASSEXTEND
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, zboszor@gmail.com
References: <a5b379d1-88b8-499c-bfe6-d741e508ca84@gmail.com>
 <CANNYZj9PM=Sn5zy+6-N6ZFvzEt4eJpM5dGNAMong8WMtOHtNeA@mail.gmail.com>
 <9d9b71c6-76f2-4964-8341-4918eb9d66b4@gmail.com>
 <CANNYZj8e8dpdpZe41O_N1P44Ki61tcFNX4jVQ8rn0EG__j+RKg@mail.gmail.com>
Content-Language: en-US
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <CANNYZj8e8dpdpZe41O_N1P44Ki61tcFNX4jVQ8rn0EG__j+RKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 15:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224150

> On Mon, 29 Sept 2025 at 15:47, Clayton Casciato
> <majortomtosourcecontrol@gmail.com> wrote:
>> I understand the pushback against unnecessary functionality.
>>
>> I would still like to resolve the case where "sequoia" is in the ??. 
>>
>> What are your thoughts on this alternative?
>>
>> PACKAGECONFIG:remove:class-nativesdk = "sequoia"
>@
> I would rather add it separately like the signing selftest does:
>@
> meta/lib/oeqa/selftest/cases/signing.py:        feature +=
> 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
> meta/lib/oeqa/selftest/cases/signing.py:        feature +=
> 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
>@
> _remove works 'after the fact' and complicates understanding how the 
> configuration ends up with the final values. It also cannot be undone
> with any other statement.
>@
> Alex
I will reconsider for the future, but I typically manipulate the 
non-specific PACKAGECONFIG as suggested by the documentation:
https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-PACKAGECONFIG

This was a frustrating issue to encounter as I had not come across this
behavior before for other recipes.

I see the downside to using a remove operation.
With that said, it is discoverable via bitbake-getvar.

While this does seem like a bug, I plan to drop this issue for now.

Thanks again!

Clayton Casciato

