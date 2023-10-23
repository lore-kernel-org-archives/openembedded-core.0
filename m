Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03E5C25B45
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 18:06:23 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.128372.1698084375518948744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 11:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iIXPrTFO;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9ba081173a3so573418966b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 11:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698084374; x=1698689174; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69iHywcgLLtcHgYnx1aIXbRJsX/nzaK8XoQoIG3cnHw=;
        b=iIXPrTFOh0btS7/WYzqiNOSMhQBow07kjhU2nURtMHadfikB6XxF5mBlSk7c6/jFFW
         C7wagNZ6p0e2F/6/m/AcOv4c+ol8DQ0tabIgHoxPawqifnWBAu1SHzzK2jfGoAm67PIO
         4Qz6AyeggSRkbe0oz3/B0pRJx8AsL+N5W5nJVsyUbaqnpfc+VaeJqucUW+tGJ972l52X
         /ZNgHvfhM2sYx+Igwf1V4h/3n/6VUy2BRPjyqlcl0kCDliQ/O4a5gk57cHPmwrOAa0gg
         xpp5KzSE8InC82j4XlXE7NBWZu0QheXDlV2wTQ6t07EHU/pDea32nAomEtp8+9STo4E3
         WDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698084374; x=1698689174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69iHywcgLLtcHgYnx1aIXbRJsX/nzaK8XoQoIG3cnHw=;
        b=HMF8udiWv9U34DlqebN2H94YrUYJVZBnpiTwnP+nMcEam5SLAMCdFeNWppGgmU3YWE
         7/CXgHbOWA8CWa08T1sUZg8wwM3MqQmy7dH/ulrPOje4cCJm9ApzrN6AuwBq2L62H4ml
         YkLcNf4v7OZ891fosPG5+etTM+69PRxfHL2/D4Fv3Vr5uRFBv24BaJrHhLKtDqu6kkbY
         ha/PsOV6ZSMI/ZwZlHdzOr80+7fF1OnOrsngX8+ARsuz8ohz1DKrDntDHrQiiz/FLO8Q
         TpZU2CvCxwB8SHBptip8G5T95Tv7TeVHc8A/6gTfP5KfO36pt3u85SWraSTAvRFYHkaU
         A8eg==
X-Gm-Message-State: AOJu0YybtM3z10UBV58FL+lhQfzIyvsBbXIOWaikpPZea79BjgVRYfP1
	aRNwqiC39tTVYeNLpqsfC5Q=
X-Google-Smtp-Source: AGHT+IHzRX7BIMxN2BLqlOWmA5RFAsYtg2UE056sqKDlu2wg6OQbH4Z0TVJumvmZEXy/IZEiFwlhCQ==
X-Received: by 2002:a17:907:934c:b0:9b9:fce8:e073 with SMTP id bv12-20020a170907934c00b009b9fce8e073mr8688128ejc.26.1698084373538;
        Mon, 23 Oct 2023 11:06:13 -0700 (PDT)
Received: from [10.134.42.224] ([89.249.73.138])
        by smtp.gmail.com with ESMTPSA id m19-20020a1709066d1300b0099bd453357esm6894034ejr.41.2023.10.23.11.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 11:06:13 -0700 (PDT)
Message-ID: <1762baab-06d2-4fc4-9cd0-307b76f0d79e@gmail.com>
Date: Mon, 23 Oct 2023 20:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
Content-Language: en-US
To: Lukas Funke <lukas.funke-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
 <a9389814-affd-4bce-85b9-e3a4555a684e@gmail.com>
 <3ab8f8ee-ce9d-48c1-b802-177f4bec9e3c@weidmueller.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <3ab8f8ee-ce9d-48c1-b802-177f4bec9e3c@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 18:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189631

On 23.10.2023 14:18, Lukas Funke wrote:
> Hi Slava,
>
> On 22.10.2023 20:34, Vyacheslav Yurkov wrote:
>> Hey Lukas,
>> Thanks a lot for the patch. A few questions/comments from my initial 
>> test below.
>>
>> - I tried it with a go-based backend I have by providing ssh URL to 
>> github. It seems like the GO_IMPORT is set to a module name from 
>> go.mod of my project, which of course fails to fetch it like that, 
>> because it's not a valid URL. How is it supposed to be used?
>
> Your assumption is correct: the GO_IMPORT is taken from the go.mod file.
>
> I've not considered the case where the repo URL is unequal to the 
> module path. This may require manual rework of the recipe. Another 
> solution would be to take the source URL from the recipetool. I think 
> there is no correct solution to this problem, because probably most 
> people might want to have the original solution, since they are 
> creating recipes from oss components (i.e. from github).

Some more results from my tests.

- I refactored module name to contain a valid URL... It seems though 
that current version of go_src_uri does not handle ssh URLs, and all 
required info from URL was lost (git@ component, ssh protocol, .git suffix).

- I placed the correct URL into SRC_URI, but do_go_vendor still failed 
with following stacktrace:

File: 
'/home/uvv/projects/yocto-lorch-mapro/openembedded-core/meta/classes/go-vendor.bbclass', 
lineno: 86, function: do_go_vendor
      0082:        # path = github.com/foo/bar
      0083:        # version = v1.2.3
      0084:
      0085:        p = destsuffix[len(default_destsuffix)+1:]
  *** 0086:        path, version = p.split('@')
      0087:
      0088:        subdir = fetcher.ud[url].parm.get('go_subdir')
      0089:        subdir = "" if not subdir else subdir
      0090:
Exception: ValueError: not enough values to unpack (expected 2, got 1)

The reason is that my go.mod name does not have a version component. If 
I understood the convention https://go.dev/ref/mod#introduction, it's 
not a required component, so this should be taken into account.

Thanks,
Slava

