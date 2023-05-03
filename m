Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ECCC77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:11:40 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.20553.1683123096727340742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 07:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DKJ3mQvi;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-b9d8b458e10so7191133276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683123096; x=1685715096;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8/IUZZRDKH0LkYCQ13Ni41GsKnXbttVvSixr/HpBXA=;
        b=DKJ3mQviMavAonqf2Qk1dG4CovDT6RGL0ELCOn/WudbiWI2j4MfHOXtOUSmecp3K08
         pUrl8NiRJtWYEnQXf1uElAJ8DIgah4OraKokS4Zc+yiHEl0Ir8waAwflGLh8pAuko0xL
         UnphIWDFhC24y8V8wGpWMv8XW7DPTJ3dCyiq3QFpXS4kIe+8tLjFw8IqoJqfLDU8Ymsc
         5fD2n7hrh9N8Aqs1qxkEpU8api31ZStSEi6AuUCGy44sv7NVd8z4szsE6shGz7KamuU1
         dOCJs91/oM6VDYVxnAfmUgNVn84b4PsTciJW3skokT9+3tNgi0cExxAbRBEc4fRbW6XD
         jSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683123096; x=1685715096;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8/IUZZRDKH0LkYCQ13Ni41GsKnXbttVvSixr/HpBXA=;
        b=lHDVpPXPtU0/B8GmiCDHE6i1UACnZapGsVX/zpHL+1PH5olN2Dw9Ejf5tRXNzyN0G+
         kbCxaQAv/PP8buZXOYgAsCLxuFkEXyrqFDXkqGslWGLYwtA5jkJbt4QDKgxpcI7O5T9B
         x6nOrhJPBAqu2ubH8bmcqpJdutM34REIvQqlIxmq1Q5x1y02FTFJC/Lzohv2Wzjg2fdc
         dMQtUSH+AZKIzy/om7MBjxS+1FrEx+FdzS+9pXHb8LX8M8/aycVMh2GruvaOa0IPQziq
         n8yAgc066MEcATSpMIxaeYmi3NpJJSQwf2zaWCKitajrPtCzv8AQ9wMnL+o9sT2/dgbV
         QJBA==
X-Gm-Message-State: AC+VfDyHvKtPpS+kOu/11O/wLy1wx6q8VuWBl4mfN8yReon/Q8KYZhfQ
	GM/zm3Ob2yR6r3X3e+3FbB8=
X-Google-Smtp-Source: ACHHUZ5V8HtNCxDxDPdXO7d+VKwo4V15ubWAEidHqqJHSTY8aXqTL+T2Q/uztsQLDf0GouyGYizv0g==
X-Received: by 2002:a25:fc0c:0:b0:b9e:7ec8:5d41 with SMTP id v12-20020a25fc0c000000b00b9e7ec85d41mr4728033ybd.55.1683123095728;
        Wed, 03 May 2023 07:11:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:6f7a:c057:293d:a9b7? ([2600:1700:9190:ba10:6f7a:c057:293d:a9b7])
        by smtp.gmail.com with ESMTPSA id v70-20020a25c549000000b00b9dc4620f95sm2328370ybe.6.2023.05.03.07.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 07:11:34 -0700 (PDT)
Message-ID: <aff18830-ff7f-1381-92c6-aafadd7da8d9@gmail.com>
Date: Wed, 3 May 2023 10:11:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [v2][PATCH] os-release: Add CPE_NAME
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230503125120.944934-1-akuster808@gmail.com>
 <f6aeec9f69d053a97cc36f5cfb6306ce1200f038.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <f6aeec9f69d053a97cc36f5cfb6306ce1200f038.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 14:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180827



On 5/3/23 8:58 AM, Richard Purdie wrote:
> On Wed, 2023-05-03 at 08:51 -0400, Armin Kuster wrote:
>> Its time we add the CPE_NAME to os-release.
>>
>> The vendor field is hardcoded to "openembedded" as it is the base
>> framework. We will use "DISTRO" to identify which variation of
>> openembedded is being used.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>
>> ---
>> V2]
>> Add CPE_DISTRO
>> Improve usage text.
>> ---
>>   meta/recipes-core/os-release/os-release.bb | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
>> index 860ee97224..3f93711efb 100644
>> --- a/meta/recipes-core/os-release/os-release.bb
>> +++ b/meta/recipes-core/os-release/os-release.bb
>> @@ -16,6 +16,7 @@ do_configure[noexec] = "1"
>>   #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
>>   OS_RELEASE_FIELDS = "\
>>       ID ID_LIKE NAME VERSION VERSION_ID VERSION_CODENAME PRETTY_NAME \
>> +    CPE_NAME \
>>   "
>>   OS_RELEASE_UNQUOTED_FIELDS = "ID VERSION_ID VARIANT_ID"
>>   
>> @@ -25,6 +26,22 @@ VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in
>>   VERSION_ID = "${DISTRO_VERSION}"
>>   VERSION_CODENAME = "${DISTRO_CODENAME}"
>>   PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
>> +
>> +"""
>> +The vendor field is hardcoded to "openembedded" deliberately. We'd
>> +advise developers leave it as this value to clearly identify the
>> +underlying build environment from which the OS was constructed. We
>> +understand people will want to identify themselves as the people who
>> +built the image, we'd suggest using the DISTRO element to do this, so
>> +that is customisable.
>> +This end result combines to mean systems can be traced back to both who
>> +built them and which system was used, which is ultimately the goal of
>> +the CPE.
>> +"""
>> +
>> +CPE_DISTRO ??= "${DISTRO}"
>> +CPE_NAME="cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"
>> +
>>   BUILD_ID ?= "${DATETIME}"
>>   BUILD_ID[vardepsexclude] = "DATETIME"
>>
> That looks like a parsing error to me? How did you test this? :)

Looks like I didn't. Can't blame Monday for this, maybe just old age?

v3 shortly.

-armin
>
> (needs # at the start of comment lines)
>
> Cheers,
>
> Richard
>
>
>


