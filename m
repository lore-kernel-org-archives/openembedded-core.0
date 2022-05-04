Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6446EC433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 08:50:46 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.4155.1651654236629545501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 01:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K7eZ/BRf;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id c15so813302ljr.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 01:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:cc:in-reply-to:content-transfer-encoding;
        bh=BsEBhF/tXZLbC+q9XSWPV6c8NQhFWiJKDA7o6KmR+sI=;
        b=K7eZ/BRf8CsYBPbZSo65FUE57A4ddnxn6G/wHpFMzAl8uxQeBZhWpLaVbqxRf6gu1H
         a4FzO5qyyrmDRE7Xs7UJnuD46KSI5WZWeJj3Fb9ZmY60nuLNk6XsQ14kc7erpHq+W0B/
         9LUtfDCSD9bao+u2OYwiOq7bGsCAWhE3MrZLH94lqL6RgCcvaH2wbK3kLJvwz33nFQNz
         sJmqGiqHt1iQHH+ggITmhFTGDLJJ44Aa84t1yySew5QW8uOO5ClcL9j3O6kN4vPrM/HX
         yC3BwxWXlQm7RS6L0lYnOSWkcn5L74h/ebAuEK2Sr4LTP0xo6x17C0oSuziiPqnCYICa
         46lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:cc:in-reply-to
         :content-transfer-encoding;
        bh=BsEBhF/tXZLbC+q9XSWPV6c8NQhFWiJKDA7o6KmR+sI=;
        b=XEicC+cHOrO70eR2kbfecFiTcSn8Nv1CQTCHIHofmbEOJz0wKi/nx209WrDhCT9ioL
         EP+/PlAsa12J4q527KRwzNeWH+Q68r5tHayzbIWvy/wAfY4FIXegSseQm6EuggkOnsXX
         Ca9yhRjQnY1jh+GTP/IDndrH4MQexHisUO32JIeTs0XpTEJinRSazs71UZS4q1+6QmuW
         0GiJAAymYHcKTYWeL0Fj0pdkJS4UI81wR161+HCDTTTkI4DlnVNBmMXTQX0UyNVkNIRd
         G+9fFTuGh2vsuDm9iCOQK7K/wOp0dSxzjCDGsR40Kckl2UZTpw8fNV0Nh7+43NQCClgz
         NnPQ==
X-Gm-Message-State: AOAM5336TakmlP+7XHihDTLh5uTwq5wZ+LtE65ZpEXaiYLDpj9fR9fXQ
	GRMBc23M1o5aXueLoJCsU38=
X-Google-Smtp-Source: 
 ABdhPJz3C12DR0JEtsB1BSEGXn9mNvD8DkhCDGWe0wYA7u10cFfdEmra9Gt4G4b06G4Ewu/PyNIrNA==
X-Received: by 2002:a05:651c:b26:b0:250:5a0f:66f3 with SMTP id
 b38-20020a05651c0b2600b002505a0f66f3mr7162172ljr.132.1651654234231;
        Wed, 04 May 2022 01:50:34 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 d27-20020ac2545b000000b0047255d210easm1147894lfn.25.2022.05.04.01.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:50:33 -0700 (PDT)
Message-ID: <5cfedc42-5db7-0a0f-9c68-0565682b14a8@gmail.com>
Date: Wed, 4 May 2022 10:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] image.bbclass: allow overriding dependency on
 virtual/kernel:do_deploy
Content-Language: en-US
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220427073739.4015660-1-dmitry.baryshkov@linaro.org>
 <98ed4653-93a0-2559-c6ab-4054b1c43be6@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 luca.ceresoli@bootlin.com
In-Reply-To: <98ed4653-93a0-2559-c6ab-4054b1c43be6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 08:50:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165216

Hi Dmitry,

Do you want to send a patch for fixing this ? Otherwise I'll send a
patch reverting the changes.

Jacob

On 4/29/22 22:53, Jacob Kroon wrote:
> On 4/27/22 09:37, Dmitry Baryshkov wrote:
>> Since the commit fe26b2379ecd ("image.bbclass: Depend on
>> virtual/kernel:do_deploy"), the image.bbclass made building images
>> depend on virtual/kernel. For some images, including small initramfs,
>> this is not the case. Allow overriding this dependency in case
>> developers knows what they are doing.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  meta/classes/image.bbclass | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 7f1f6f80a464..47776db2b0e6 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -132,7 +132,12 @@ def rootfs_variables(d):
>>  
>>  do_rootfs[vardeps] += "${@rootfs_variables(d)}"
>>  
>> -do_build[depends] += "virtual/kernel:do_deploy"
>> +# This is needed to have kernel image in DEPLOY_DIR.
>> +# This follow many common usecases and user expectations.
>> +# But if you are building an image which doesn't need the kernel image at all,
>> +# you can unset this variable manually.
>> +KERNELDEPLOYDEPEND ?= "virtual/kernel:do_deploy"
>> +do_build[depends] += "${KERNELDEPMODDEPEND}"
>>  
> 
> I saw this got merged to master.
> 
> The patch doesn't make sense.
> 
> It sets
> 
> KERNELDEPLOYDEPEND
> 
> then uses
> 
> KERNELDEPMODDEPEND
> 
> ?
> 
> And please make it readable by adding some underscores, like
> 
> KERNEL_DEPLOY_DEPEND
> 
> Jacob

