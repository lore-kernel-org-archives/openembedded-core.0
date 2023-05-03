Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E588CC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:49:59 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.18300.1683118190192499463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HCeZV5wS;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-b996127ec71so7486094276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683118189; x=1685710189;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQH3z7IpMiP3gzbTXzaqfx48+nlGcO+jFQXxLGWAAcE=;
        b=HCeZV5wSCto6+84ya5bkFxAPhNGyG2DXg+Cs2BjLwB9kRvRcLnh9YH886CdIfDmSV+
         Pte4SobGN+E74dEA7jgUA+Un5BvF9f0YsxmwG+g0wk5nmBmHv8VC16jHVoalBXhYQY3D
         094EHXmIGm3lnvfNDnCZsZTQsrt9Jeysh8fR4wkf1fw/F5SJkLyllDqbMARgj7V5uuDf
         A6Q999WGeUM6JGz99cKR+6LfUYPpdMrXaRPVOh6SA/aNsBZxA/qrT0V2oWo6uwfCWZLE
         J/jfzoqZiroAwkLrcZRKWGtgR3hAlK0Pw8JWrNXKTeB7tFLb4sOh+hMckfm2gdtN1XSF
         6CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683118189; x=1685710189;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQH3z7IpMiP3gzbTXzaqfx48+nlGcO+jFQXxLGWAAcE=;
        b=i5LCMDQclOy8c5XPC587uSa5s5d4hiZuhxcLeFAyzc93YRKeX+PoJ7O2vx1u2injfb
         yPS6Ar9oZGqTkkx/b6CzrlYBxwZa/uJg80BfuEglqqFfcQIC9OJeFErYgrimV4PqMLHw
         sD48H8vuK8JpgQkbwkcs6ht8gFFykpl5nICEgoqYjdTiF31TNN0H8/5hE60CCpGaQF2U
         BAY9OIlCxtzeXyMu2mT4bUZG9EJab0B23a+sMYGA55GsHvmTYkCFZb+p2bnLVp3QjoaC
         Er7jtpyne1rXoxxmetJfRj1hqn6Mrdo6XglqbimK1EgRVC06izWkCiDVY1AwqdweLU+O
         ruiA==
X-Gm-Message-State: AC+VfDxXgtMWbvlv2Cs3XUb1bdukNS+YQxNEFAXf5Uce5b3AUVIvCkJB
	QAhPOkKmD7dD4Ls2U0E/AjgnyKzYpcHQCg==
X-Google-Smtp-Source: ACHHUZ4GvRvF3yiS4Ox7xFlT59ShfQ6Zmz1A+4hTB4BHYCM65vPudcziPas8s0tIDFuxR9IWqOf0Vg==
X-Received: by 2002:a05:6902:1148:b0:b97:f46:a2b8 with SMTP id p8-20020a056902114800b00b970f46a2b8mr25815873ybu.17.1683118189105;
        Wed, 03 May 2023 05:49:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:6f7a:c057:293d:a9b7? ([2600:1700:9190:ba10:6f7a:c057:293d:a9b7])
        by smtp.gmail.com with ESMTPSA id s14-20020a5b074e000000b00b993995abe4sm7215818ybq.60.2023.05.03.05.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 05:49:48 -0700 (PDT)
Message-ID: <fd75c2dd-6409-ca2f-f4d1-c550fd8d3f75@gmail.com>
Date: Wed, 3 May 2023 08:49:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH 1/1] os-release: Add CPE_NAME
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230503111938.942018-1-akuster808@gmail.com>
 <20230503111938.942018-2-akuster808@gmail.com>
 <14aba094734c98ead11de151a392d21fff96909c.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <14aba094734c98ead11de151a392d21fff96909c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180818



On 5/3/23 7:44 AM, Richard Purdie wrote:
> On Wed, 2023-05-03 at 07:19 -0400, Armin Kuster wrote:
>> Its time we add the CPE_NAME to os-release.
>>
>> The vendor field is hardcoded to "openembedded" as it is the base
>> framework. We will use "DISTRO" to identify which variation of
>> openembedded is being used.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta/recipes-core/os-release/os-release.bb | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
>> index 860ee97224..aa37dec7c7 100644
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
>> @@ -25,6 +26,13 @@ VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in
>>   VERSION_ID = "${DISTRO_VERSION}"
>>   VERSION_CODENAME = "${DISTRO_CODENAME}"
>>   PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
>> +
>> +# The vendor field is hardcoded to "openembedded" as it is the base
>> +# framework for all derivatives Distos.
>> +# We use "DISTRO" to identify which variation of openembedded core
>> +# is being used.
>> +CPE_NAME="cpe:/o:openembedded:${DISTRO}:${VERSION_ID}"
>> +
>>   BUILD_ID ?= "${DATETIME}"
>>   BUILD_ID[vardepsexclude] = "DATETIME"
>>   
> I know a bit more about the context of this and I don't think it is
> clear in the above comment. I'd like to suggest something a little
> stronger, how about:
>
> """
> The vendor field is hardcoded to "openembedded" deliberately. We'd
> advise developers leave it as this value to clearly identify the
> underlying build environment from which the OS was constructed. We
> understand people will want to identify themselves as the people who
> built the image, we'd suggest using the DISTRO element to do this, so
> that is customisable.
> This end result combines to mean systems can be traced back to both who
> built them and which system was used, which is ultimately the goal of
> the CPE.
> """
Works for me.
> Perhaps we'd also want to do:
>
> CPE_DISTRO ??= "${DISTRO}"
> CPE_NAME="cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"

Like this better.
>
> to make it clear we're suggesting which bit be customised?

Thanks for the review. v2 shortly.

-armin
>
> Cheers,
>
> Richard
>
>
>
>


