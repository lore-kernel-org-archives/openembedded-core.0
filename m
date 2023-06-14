Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE0FEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 05:46:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.4930.1686721567859202538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 22:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OP1uVMQZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30fceb009faso987988f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 22:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686721566; x=1689313566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CK7zKlbD8K4QqF34Wun6gw+5tPwGm8kSYfPFdeIXxEA=;
        b=OP1uVMQZ2cVzgOWw0o7WQW4KLXNrunQ3kK8kkp1Ub8ymPVwMmrBhHSUCaI+HMiH+/A
         CkW5IR5D5M1tL2gbKA4pIBEaeCcfW07M1Mc/YlZxD54Ccomrb5hcB86ZLbY7DNdqsc5j
         ahF4gVZqHY9+QGd3YQ1Zf2AaQ8ISl4AiP7J/zVaxtocptrtf1zBAxXEgywJ1gvg+r62r
         FQ1F8ct6BpvR9PR8EKFJ+fWRt7HIkvIfn1EMP4ZkdemsLCoyFaqAq8kiEUgMGt+pH9cL
         UzgzocKg+RGqTZ/+H3zFiOFAqXWJqVUpV0qeql8wWe+PJw7sFGEdCVSQLDz2va7rLy0+
         8FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686721566; x=1689313566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CK7zKlbD8K4QqF34Wun6gw+5tPwGm8kSYfPFdeIXxEA=;
        b=cPLHbYKm7cnk3MBCIZ6bQiC6dJpbvPIUrytFts0QSgtBCyWlmgKG5XJllW9xK/jUUo
         2NPqF9fnh3ydVOET3r2PPTAoKWiaL7Eep47ZsxFpesaLnuuu1+4kxTcSIhOcYJIGsDHE
         jRQJTGWF9iAS/nG3K6zPvVpqIgHuuYKEbkHz4oWBppxI5MIKdrIueTwGwxhUI6pn1+5B
         oAMKjN0kD0iqrkgMTac6zlDFEZSa1zI3NuiPY18Ou/U3Gemv1zIq32IdstXttK6VMVyF
         3zjN++OF3XU/N6xKo4mhksrnmruhOTpJciq05hsuGPQa0x34I5BUr/m/I9S/xqudRucu
         tkqw==
X-Gm-Message-State: AC+VfDxaL3zgTr9QJQcsv0yDi1Dock5j9IKzWkIm4OblPTCJ6mTc3Fh/
	H3AwGA6oQmNApHu9tbrYTdM=
X-Google-Smtp-Source: ACHHUZ4M7wazWtwU8plttgjdnmRif9weJtFa+RN5oJ2gBnYJj2eLjsMX6PmQ2S41XoFT9ELyNQJYbA==
X-Received: by 2002:adf:ee4a:0:b0:30f:bd4f:8f00 with SMTP id w10-20020adfee4a000000b0030fbd4f8f00mr408129wro.28.1686721565909;
        Tue, 13 Jun 2023 22:46:05 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id t3-20020a5d6903000000b0030fcaf57660sm4393005wru.29.2023.06.13.22.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 22:46:05 -0700 (PDT)
Message-ID: <b48ac118-3096-8a94-9896-daefe4b46a30@gmail.com>
Date: Wed, 14 Jun 2023 07:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH 3/3] python_mesonpy: New class
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230602074419.2450399-1-zboszor@gmail.com>
 <20230602074419.2450399-3-zboszor@gmail.com>
 <fcb088b53c6635a6289c3d7d6fdbc6930de634a6.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <fcb088b53c6635a6289c3d7d6fdbc6930de634a6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 05:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182732

2023. 06. 13. 22:59 keltezéssel, Richard Purdie írta:
> On Fri, 2023-06-02 at 09:44 +0200, Zoltan Boszormenyi wrote:
>> This is a new PEP517 compatible build class for python modules
>> that use pyproject.toml and this:
>>
>> [build-system]
>> build-backend = 'mesonpy'
>>
>> The new class uses python3-meson-python-native.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/classes-recipe/python_mesonpy.bbclass | 54 ++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>   create mode 100644 meta/classes-recipe/python_mesonpy.bbclass
>>
>> diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classes-recipe/python_mesonpy.bbclass
>> new file mode 100644
>> index 0000000000..1da8b005ab
>> --- /dev/null
>> +++ b/meta/classes-recipe/python_mesonpy.bbclass
>> @@ -0,0 +1,54 @@
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +inherit meson setuptools3-base python3targetconfig python_pep517
>> +
>> +# Filter out meson_do_qa_configure from do_configure[postfuncs]
>> +DOCONFIGUREPOSTFUNCS := "${@d.getVarFlag('do_configure', 'postfuncs')}"
>> +DOCONFIGUREPOSTFUNCS:remove = "meson_do_qa_configure"
>> +do_configure[postfuncs] := "${@'' if d.getVar('DOCONFIGUREPOSTFUNCS') is None else d.getVar('DOCONFIGUREPOSTFUNCS') }"
>> +
>> +# This prevents the meson error:
>> +# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pick one.
>> +MESONOPTS:remove = "--buildtype ${MESON_BUILDTYPE}"
>> +
>> +CONFIGURE_FILES = "pyproject.toml"
>> +
>> +DEPENDS += "python3-wheel-native python3-meson-python-native"
>> +
>> +def mesonpy_get_args(d):
>> +    vars = ['MESONOPTS', 'MESON_CROSS_FILE', 'EXTRA_OEMESON']
>> +    varlist = []
>> +    for var in vars:
>> +        value = d.getVar(var)
>> +        vallist = value.split()
>> +        for elem in vallist:
>> +            varlist.append("-Csetup-args=" + elem)
>> +    return ' '.join(varlist)
>> +
>> +PEP517_BUILD_OPTS = "-Cbuilddir='${B}' ${@mesonpy_get_args(d)}"
>> +
>> +# Python pyx -> c -> so build leaves absolute build paths in the code
>> +INSANE_SKIP:${PN} += "buildpaths"
>> +INSANE_SKIP:${PN}-src += "buildpaths"
> This is not ready for core as the output is not reproducible. I am not
> taking patches which skip buildpaths warnings.
>
> This also shows that the code is not being tested in OE-Core. Until it
> is needed by and being used by something in core, I don't think it
> should be there.

This thread was long time dead. The series was sent to meta-oe.

>
> Cheers,
>
> Richard
>


