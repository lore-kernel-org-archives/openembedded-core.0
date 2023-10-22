Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6E4C001DF
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 18:34:55 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.104386.1697999691038821787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 11:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bKFW6PhQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9be7e3fa1daso378369566b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 11:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697999689; x=1698604489; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEwj+BqvBR4/3jcwdql5qminfk2iLT+FM0ICRHM4kRg=;
        b=bKFW6PhQnGWNiq/NodqbPy0qthxdWdqFzHAOTzJXI+v2rpTcjmYbpaa527+7zS/Z34
         D4Ffv+4prq/i121oRMtxHzhVcmAkyhOTKF3fih1EWslg63iL3JiGnRpu8fBprD/0EKH6
         sWS07NNXwHu+Zv/TCpAAb7SP+w/qlgI8+kpCQdOxxfNqn/olKiRCjJEPEBbKegdiVTKR
         PAmR/EKnosANpQN5/XKOdKExsIMrR8DyUFgQRtDSjClzR9nUqqSQyPgDrFGoJJpWR3CC
         0Nq/wCbaDpVVqUW0Jzs8Pbd+Z+2DCrzqWX8g5EDUiPDuaoFcVeKd1dMSez8aboezEXOj
         X+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697999689; x=1698604489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEwj+BqvBR4/3jcwdql5qminfk2iLT+FM0ICRHM4kRg=;
        b=P4O9TtyuEJ8z0LcMkQz/g68614hZmrJ2uTArhvP0hubOxa88nAlPfmHdOneBaTVqr7
         6oW+N0t0epQSgTKSYMzFluQzcEBci4qLyKzVuRdmcIXE2Nowr4aBKxAJBVIGyFX9gOsO
         rhazLi2oV2bjRR11coen1SwWoXoVw1KVki6rxRae2yZtssNTdAmQTQ0GHl61OlmCg1HR
         tD7tKji58+Q7F3FTHAGihXojEAssHpdkp9jwv4MRe7Bih3FNw7G5DW9ZIZFXgE1Ggq91
         lRIAqA2QgAUydQja4KvX0775RLTXn12HSyGptfYmvACrLb9Zdf5PAQU/pZAty6Mtu/qa
         wCBw==
X-Gm-Message-State: AOJu0YxB1wtzkYNJZXEk7yQAuU0yHAT2SbuzMKjy+oEYacRTVdm0z6bX
	uZohCgQ0WfNXV50cdtvFgxo=
X-Google-Smtp-Source: AGHT+IGTuM33NZ0A4dal7T+2mLqt60SWe1rnMNOQnll/2yDaj7VL1qhy0VoMgrTjhMGMquUxn8fNKA==
X-Received: by 2002:a17:907:5c1:b0:9a1:c659:7c56 with SMTP id wg1-20020a17090705c100b009a1c6597c56mr5163924ejb.22.1697999689215;
        Sun, 22 Oct 2023 11:34:49 -0700 (PDT)
Received: from [10.134.48.187] ([89.249.73.141])
        by smtp.gmail.com with ESMTPSA id vg18-20020a170907d31200b009adc77fe164sm5414163ejc.66.2023.10.22.11.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Oct 2023 11:34:48 -0700 (PDT)
Message-ID: <a9389814-affd-4bce-85b9-e3a4555a684e@gmail.com>
Date: Sun, 22 Oct 2023 20:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
Content-Language: en-US
To: lukas.funke-oss@weidmueller.com, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 18:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189611

Hey Lukas,
Thanks a lot for the patch. A few questions/comments from my initial 
test below.

- I tried it with a go-based backend I have by providing ssh URL to 
github. It seems like the GO_IMPORT is set to a module name from go.mod 
of my project, which of course fails to fetch it like that, because it's 
not a valid URL. How is it supposed to be used?
- I've got about 20 lines like:
INFO: Please add the following line for 
'vendor/google.golang.org/protobuf/LICENSE' to a 
'lib/recipetool/licenses.csv' and replace `Unknown` with the license:
02d4002e9171d41a8fad93aa7faf3956,Unknown
INFO: Please add the following line for 
'vendor/gopkg.in/yaml.v3/LICENSE' to a 'lib/recipetool/licenses.csv' and 
replace `Unknown` with the license:
3c91c17266710e16afdbb2b6d15c761c,Unknown

I believe I have to go through all of them manually and set a proper 
license in the recipe. Still the questions arises, what should be a 
better way to reduce amount of this work? Adding more hashes/licenses to 
lib/recipetool/licenses.csv would be a way to go? I'm just afraid that 
file might explode if we use it like that...

- Could please clarify where does the version from go.mod hide? Is it 
taken directly from go.mod? I'm trying to understand what should be the 
workflow when a module version should be bumped up in the go.mod. Will 
that be reflected in the recipe in any way?

Thanks,
Slava

On 17.10.2023 15:26, lukas.funke-oss@weidmueller.com wrote:
> From: Lukas Funke <lukas.funke@weidmueller.com>
>
> This patch series adds a recipetool handler in order to create 'go' recipes.
> Each recipe contains a list of dependencies in their SRC_URI
> variable which are derived from the projects `go.mod` file. For each
> dependency the corresponding license file uri/hash is added.
>
> The recipe may not work ad-hoc, but is a good starting point to create
> a working recipe and have a working offline-build.
>
> Lukas Funke (4):
>    classes: go-vendor: Add go-vendor class
>    selftest: recipetool: Add test for go recipe handler
>    recipetool: Ignore *.go files while scanning for licenses
>    recipetool: Add handler to create go recipes
>
>   meta/classes/go-vendor.bbclass             | 135 ++++
>   meta/lib/oeqa/selftest/cases/recipetool.py | 163 +++++
>   scripts/lib/recipetool/create.py           |   2 +-
>   scripts/lib/recipetool/create_go.py        | 730 +++++++++++++++++++++
>   4 files changed, 1029 insertions(+), 1 deletion(-)
>   create mode 100644 meta/classes/go-vendor.bbclass
>   create mode 100644 scripts/lib/recipetool/create_go.py
>


