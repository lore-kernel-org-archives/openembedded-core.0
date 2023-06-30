Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7415EEB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 07:06:36 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.6863.1688108786036316589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 00:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=E2LAOkwt;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3110ab7110aso1742251f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688108784; x=1690700784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWyFXS2nQ4BSHBaESWXezQ5TbBrYEHTgEH9+VSTfroc=;
        b=E2LAOkwtVYjyP+LzNslXWXjhpmoe+agRxiQKliU4ZQqGhV3LBktiPP5jiPW4mOEouV
         1qYFBnSLWfUOcmAhuwo5P8b17RPUFzGuOmE8JueHzDIKJskIEK0aSKbQtRaf7ZR+2H6T
         bRQuFCDeZQnrxZYfmX2wPmt59/V/FJ0xN4aaMlkLe2zJhEX5uWbYpZaaFtA2CVo4i0ln
         tc7KJ/jLQRJzPi/zPq4XE/NR2apilj90Mp1nHG/ia8sCcI97QsiMttVp6ohRYfBl1sf5
         bryPopncoxwJZneGnLhIaiIFueouNjQRqsOA4t2M8DcD3dZhg7lzcaymzwsE/caMMY13
         1yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688108784; x=1690700784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWyFXS2nQ4BSHBaESWXezQ5TbBrYEHTgEH9+VSTfroc=;
        b=W9bWQhjZjgDTDhRMEVo60FCQhE5cB20AyU13kDgmVewHiewsmre4hQBYM3/OIUrI2f
         IhaJhdT/4XJ0Sx0I6zIXg4zxHcLsKjX0QTda1A0EdZePjRsEvNm7+17JPdRh03L0VFgZ
         ttpeqPI4/ZBJyghqN4r7HtgjIPbZh/rYoFt6yCgpnEPucrFBfFZtOi/0m2lrZvvxRiIL
         UjSr5h//k7m0HxRo2iuuQazU19cCthUY1DBASlI1aSz0X+TD7u6TDgfVN7Cxn3/lDu3C
         qFu8UsR2oBHB7zleKAtJKpj6htgv+hJxctSWTbrLd6O12A2jGGIqE1BoFpzy5kw0OHCk
         /2qA==
X-Gm-Message-State: ABy/qLY5aigtZj8JDMzgGBO7a3aE2neUZ65tPaR6kF+b0gV4/9xu74tH
	uxm7a4q0Uj2d+e4FRq8ZZO8=
X-Google-Smtp-Source: APBJJlEBjK5ekX9seMgnBSLLdnuf0gkzhLpjcVuH+vO79RO6fV6iqqNX94GpIsgjeJ0Ev/mkX1UXpw==
X-Received: by 2002:adf:fac8:0:b0:313:dfb8:b4d0 with SMTP id a8-20020adffac8000000b00313dfb8b4d0mr1305737wrs.66.1688108784229;
        Fri, 30 Jun 2023 00:06:24 -0700 (PDT)
Received: from [192.168.6.52] (213-225-15-104.nat.highway.a1.net. [213.225.15.104])
        by smtp.gmail.com with ESMTPSA id d9-20020a5d6dc9000000b0030ae53550f5sm17499907wrz.51.2023.06.30.00.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 00:06:23 -0700 (PDT)
Message-ID: <f6557b77-fc23-f713-86b7-286dabf7bc06@gmail.com>
Date: Fri, 30 Jun 2023 09:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [meta-oe][PATCH] uninative-tarball.xz - reproducibility
 fix
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
References: <20230629140258.5635-1-Robert.Berger@ReliableEmbeddedSystems.com>
 <36bd8483782bbbdf9a24c3f5fe9f1ccabf25554f.camel@linuxfoundation.org>
From: Robert Berger <oecore.mailinglist@gmail.com>
In-Reply-To: <36bd8483782bbbdf9a24c3f5fe9f1ccabf25554f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 07:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183683

Hi,

Not sure my previous reply made it to the list.
So I try it again here.

On 29/06/2023 16:07, Richard Purdie wrote:
> On Thu, 2023-06-29 at 16:02 +0200, Robert Berger wrote:
>> added --clamp-mtime --mtime to the tar command
>>
>> see:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15148
>>
>> Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
>> ---
>>   meta/classes-recipe/populate_sdk_base.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
>> index b23ea26d40..c804e7520a 100644
>> --- a/meta/classes-recipe/populate_sdk_base.bbclass
>> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
>> @@ -86,7 +86,7 @@ python () {
>>          d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDK_ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
>>       else:
>>          d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
>> -       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>> +       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} ${SDKTAROPTS_ADDON} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>>   }
>>   
>>   SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>> @@ -286,6 +286,7 @@ python check_sdk_sysroots() {
>>   }
>>   
>>   SDKTAROPTS = "--owner=root --group=root"
>> +SDKTAROPTS_ADDON ?= "--clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
>>   
> 
> Thanks, looks good. I did wonder if we could just put this in
> SDKTAROPTS though? Do we really need to add a new variable?

Functionality-wise it's fine to add it to SDKTAROPTS. The default value 
I added would give people the chance to experiment with different 
options as well.

If you want me to "hard code" it I'll create a v2.

Just let me know.

> 
> Cheers,
> 
> Richard
> 

Regards,

Robert

-- 
Robert Berger
Embedded Software Evangelist

Reliable Embedded Systems
Consulting Training Engineering
URL: https://www.reliableembeddedsystems.com

Schedule a web meeting:
https://calendly.com/reliableembeddedsystems/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--


