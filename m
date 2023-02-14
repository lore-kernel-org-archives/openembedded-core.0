Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB93C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:58:45 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.12674.1676393920790543505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ajC6TcfS;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id bj22so13490254oib.11
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TwFIczHPzxORm8XQTwnvPGA1FJB8LfXEKJk2x2LD6n0=;
        b=ajC6TcfSbVuZx6rYPZMaDonlFvIy6/hFZdXBN/EAWEr01Cj1V6loon6ziilZBy2ZMK
         c578sPfj8XiDys2sxF0CJF2+3rX3820GeJJ3SAmS4KLvTqOsZOe7MI4gcKPsxnBk7HVt
         u9d6bPY/JvBSdbHY1gzYirSkSUsRo18G3HT4IurWPQufNOp4/LMWCYcOjeP/snC9Aas2
         Q2BWSnNNHZ+5vh0uxwzQLJPHaUeFNaqsISsMujjhLVrnQinlX9giwzfdKv4tAdtaBzbB
         INJ06wxmBBk5Kw3zW3WH9+o+MB9mfd0IFmA641/DVMp6e4vT+Ju0vX02EKd10CbRf40W
         69Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwFIczHPzxORm8XQTwnvPGA1FJB8LfXEKJk2x2LD6n0=;
        b=LscyUHTJ7rbPY8jksPe3bFLmH3nH6UwMKvD/h9HabwwSAkeYX/Yby0yKBj64nthu0x
         BQdKqXWb+Qj3QeAvllgSw/pOKe5wb0JN2QvqqOxQvuEhBSHFVdyZUo37Nkmj9WK6/wEL
         K7MJZ0XbBX+kg7pfnbmnzyHeF9mg3h6Kyo9dpBpjw2dNjTeUEgT22+yoxa1gTG/6LX4X
         S5OGmMJfMFcMQ7b/b6mUGJqkuA4fmvumUEojBKa/Th0yw22unYheRqQeGu9CE9BSXwxB
         iMV1tjNGTyYnep+q9TvXMVCs4R4NHwqBDfrJclD9FeGtbaLu590g9vAhk1md+DnXMYAk
         RGCA==
X-Gm-Message-State: AO0yUKUVPItjXentVxihhsh7opML6pftmer55R2cluFFTdm6NYXrVbwG
	4GqTCadGQ30QBLvIegeyvm0=
X-Google-Smtp-Source: AK7set9pmz1nA0Xh5tXtBCIiN8G3jkmForTKqnYcsWf76vrceKfy+ohkIC3kaRUJn5ZxvATdHpdSbA==
X-Received: by 2002:a05:6808:68c:b0:378:24d:a7c8 with SMTP id k12-20020a056808068c00b00378024da7c8mr1404543oig.15.1676393919863;
        Tue, 14 Feb 2023 08:58:39 -0800 (PST)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id w6-20020acadf06000000b0037b80fe0539sm6348454oig.42.2023.02.14.08.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 08:58:39 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <d6247733-e8da-fe22-3bf0-2de66e341407@gmail.com>
Date: Tue, 14 Feb 2023 10:58:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] create-spdx-2.2: Add support for custom Annotations
To: "Saul Wold (local)" <saul.wold@windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230213195413.3535358-1-saul.wold@windriver.com>
 <CAJdd5GZjcOTBy-8LKmqdqzupiCz2mg5_PMtJUtj0juGdbkV1Eg@mail.gmail.com>
 <0e22fb64-7b85-bc6c-421c-d5789afe9e44@windriver.com>
Content-Language: en-US
In-Reply-To: <0e22fb64-7b85-bc6c-421c-d5789afe9e44@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177166


On 2/14/23 10:52, Saul Wold (local) wrote:
>
>
> On 2/13/23 12:03, Joshua Watt wrote:
>> On Mon, Feb 13, 2023 at 1:54 PM Saul Wold <saul.wold@windriver.com> 
>> wrote:
>>>
>>> This change adds a new variable to track which recipe variables
>>> are added as SPDX Annotations.
>>>
>>> Usage: add SPDX_CUSTOME_ANNOTATION_VARS = <some recipe variable>
>>
>> nit: CUSTOM
>>
> v2 will come shortly (I will try to address the flags)

Sorry, I wasn't trying to say we needed to do that today; that was for 
posterity. I'm fine with omitting the flags and adding them in later if 
necessary; I don't have crystal ball to tell whats needed today, so it 
might be best to wait until we know.

>>>
>>> The recipe spdx json will contain an annotation stanza that looks
>>> something like this:
>>>
>>>       "annotations": [
>>>          {
>>>            "annotationDate": "2023-02-13T19:44:20Z",
>>>            "annotationType": "OTHER",
>>>            "annotator": "Tool: oe-spdx-creator - 1.0",
>>>            "comment": "CUSTOM_VARIABLE=some value or string"
>>>          },
>>>
>>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>>> ---
>>>   meta/classes/create-spdx-2.2.bbclass | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/create-spdx-2.2.bbclass 
>>> b/meta/classes/create-spdx-2.2.bbclass
>>> index f0513af083b..e1bbf646ff9 100644
>>> --- a/meta/classes/create-spdx-2.2.bbclass
>>> +++ b/meta/classes/create-spdx-2.2.bbclass
>>> @@ -30,6 +30,8 @@ SPDX_PRETTY ??= "0"
>>>
>>>   SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
>>>
>>> +SPDX_CUSTOM_ANNOTATION_VARS ??= ""
>>> +
>>>   SPDX_ORG ??= "OpenEmbedded ()"
>>>   SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
>>>   SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX 
>>> packages created from \
>>> @@ -402,7 +404,6 @@ def collect_dep_sources(d, dep_recipes):
>>>
>>>       return sources
>>>
>>> -
>>>   python do_create_spdx() {
>>>       from datetime import datetime, timezone
>>>       import oe.sbom
>>> @@ -479,6 +480,10 @@ python do_create_spdx() {
>>>       if description:
>>>           recipe.description = description
>>>
>>> +    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
>>> +        for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
>>> +            recipe.annotations.append(create_annotation(d, var + 
>>> "=" + d.getVar(var)))
>>> +
>>
>> Seems reasonable. If we need more configuration options, I think we
>> can add it later with flags, e.g.
>>
>>   MY_VAR = "foo"
>>   MY_VAR[spdx-annotator] = "Me!"
>>   SPDX_CUSTOM_ANNOTATION_VARS = "MY_VAR"
>>
> What did you think the output should be here? ie what does the comment 
> line contain?
> Today the annotation would contain:
>
> "comment": "MY_VAR=foo"
>
> What should the comment line contain if a flag or multiple flags 
> exists? Or the CUSTOM_ANNOTATION code only looks for one flag 
> [spdx-annotator]?
>
> "comment": "Me!=foo"
>
> Thoughts?
>
>> Aslo, in the future if users want package annotations, we can 
>> probably do:
>>
>>   SPDX_CUSTOM_ANNOTATION_VARS:${PN}
>>
> Do you really mean SPDX_CUSTOM_ANNOTATIONS_VARS:pn-${PN}
>
> I tested this and it appears to work, along with the :append:pn-${PN} 
> style.
>
> Sau!
>>
>>>       # Some CVEs may be patched during the build process without 
>>> incrementing the version number,
>>>       # so querying for CVEs based on the CPE id can lead to false 
>>> positives. To account for this,
>>>       # save the CVEs fixed by patches to source information field 
>>> in the SPDX.
>>> -- 
>>> 2.25.1
>>>

