Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95854C77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 18:52:00 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.2952.1683312715594361405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 11:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=tROhGQzP;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-61b58b6e864so19638196d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683312714; x=1685904714;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mLxJe4Tkej8wwYisGD8c4bC0LOhZeYUKrqGvOKOp7ng=;
        b=tROhGQzPssU2DULs8xlbi3eGtcaZGd7Q9O6EGZGwZLNONBwVz4UDvz0NBysLSHVeky
         UqoVivF6vvM6Cuqm7FMXEAsaHhyMkzromC2j8KELzHsW7eq6vs72voOaSwLX1KQtYRAu
         CQy/mhBWQ4hvBrvu3ZCyFrNS8nOMxMNoFfKlv9BtdCCQccY03GXY7ZNJEYI1FtEBDuVE
         f/KoFZnpGXZC/EQVGOt3fimGsFUeG2RSXEz57fdA6Khi3bbkh4D1rKzhGMxeEkV4hy6q
         Zx6o6pZpoxxjqyL45GXWY5FV9KmxyYaQWVCZW0F1v9z7kH0mQMzfStYDJ0hD80AzR9Yj
         LoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683312714; x=1685904714;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLxJe4Tkej8wwYisGD8c4bC0LOhZeYUKrqGvOKOp7ng=;
        b=bel/3mBo4lmd7ucaEyp5jAmUEh9jZoOoTL34BKfjxaSACw/IVxkAaFYSLcjHbB01sr
         xiwr9CBUS/7/LLVGL44UvJcCGpGbP4JewEmusYvWr3NYPDJj+oOir3DnAWclex1DGg8c
         Fh1AKnoEGdJLGtINcfAVasRuR1MSadJZgNCkpHWxm54xu0nk6M/5dbPdggqR8/ecSRSw
         fAN11ejE6PNALDZ0x+3lS03fgPMxapFHbSSK0/O2sDIR+2zmES2dfgEysXRYbjuYKCbF
         O6/PeH2UmcSv9MhN03Jm44W8IyKWQWLh/kQl9XQIfD8ognviw6aXLnq00xrBN1CMrYDA
         9yOw==
X-Gm-Message-State: AC+VfDwIHXGXoNMEIyoQjqyejQitHxPc6T7fzmR4Tz6TNvp/icUskJ2U
	msVrM6IjzIQDs55+JKZMs5cfow==
X-Google-Smtp-Source: ACHHUZ539fvHS6c0xzKSczP95bBKRAsYl3w02nu1URv4No5YWqY6K/3/q2xfetaYLDauq20CM7E3aA==
X-Received: by 2002:a05:6214:d68:b0:5f1:6892:7440 with SMTP id 8-20020a0562140d6800b005f168927440mr4077924qvs.23.1683312714739;
        Fri, 05 May 2023 11:51:54 -0700 (PDT)
Received: from [192.168.0.195] (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id o18-20020a05620a15d200b0074683c45f6csm790752qkm.1.2023.05.05.11.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 11:51:54 -0700 (PDT)
Message-ID: <a3d9dff7-5005-d82a-ae37-9efbf6408adf@baylibre.com>
Date: Fri, 5 May 2023 14:51:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH v3] python3-calver: Add recipe
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230502174529.2262518-1-tgamblin@baylibre.com>
 <DB5PR02MB10213E17AFAED21E8AEC49827EF6F9@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <DB5PR02MB10213E17AFAED21E8AEC49827EF6F9@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 18:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180970


On 2023-05-02 18:40, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Trevor Gamblin
>> Sent: den 2 maj 2023 19:45
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core][PATCH v3] python3-calver: Add recipe
>>
>> calver is "a setuptools extension for automatically defining your Python
>> package version as a calendar version." It is required for
>> python3-trove-classifiers (another new recipe), which in turn is
>> required for the upgrade of python3-hatchling from 1.13.0 to work.
>>
>> v3 clarifies that the recipe now includes ptests, where v2 didn't make
>> this clear and v1 didn't have them at all.
> Comments related to the patch versions should go after the "---" below
> as they will otherwise become part of the commit message, where they
> typically do not make any sense.

Sorry, missed this earlier. I've resent with the revision notes moved.

-Trevor

>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   .../distro/include/ptest-packagelists.inc     |  1 +
>>   .../python/python3-calver_2022.6.26.bb        | 28 +++++++++++++++++++
>>   2 files changed, 29 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3-calver_2022.6.26.bb
>>
>> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
>> index 2f83132aeb..bd95a13ff6 100644
>> --- a/meta/conf/distro/include/ptest-packagelists.inc
>> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>> @@ -56,6 +56,7 @@ PTESTS_FAST = "\
>>       popt \
>>       python3-atomicwrites \
>>       python3-bcrypt \
>> +    python3-calver \
>>       python3-hypothesis \
>>       python3-jinja2 \
>>       python3-jsonpointer \
>> diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
>> new file mode 100644
>> index 0000000000..32b6cfbd42
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
>> @@ -0,0 +1,28 @@
>> +SUMMARY = "Setuptools extension for CalVer package versions"
>> +HOMEPAGE = "https://github.com/di/calver"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>> +
>> +SRC_URI = " \
>> +    git://github.com/di/calver;branch=master;protocol=https \
>> +    file://run-ptest \
>> +"
>> +SRC_URI[sha256sum] = "e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b"
> This recipe uses Git, and thus should not need a SHA-256 checksum.
>
>> +SRCREV ?= "3268d8acf2c345f32a1c5f08ba25dc67f76cca81"
> Change `?=` to `=`.
>
>> +
>> +inherit python_setuptools_build_meta ptest
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +RDEPENDS:${PN}-ptest += " \
>> +    ${PYTHON_PN}-pretend \
>> +    ${PYTHON_PN}-pytest \
>> +    ${PYTHON_PN}-unittest-automake-output \
>> +"
>> +
>> +do_install_ptest() {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    cp -rf ${S}/tests ${D}${PTEST_PATH}/
> Shell code in OE-Core is expected to be tab-indented.
>
>> +}
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.40.0
> //Peter
>

