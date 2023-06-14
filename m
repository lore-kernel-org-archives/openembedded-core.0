Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF48EB64DA
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 12:27:35 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.10284.1686745654312036491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 05:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pBAfsoq5;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30fceb009faso1292271f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 05:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686745653; x=1689337653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBlyXw0ZtflEgTux/YUX8uMDuRWhjdFJIbKQ14qn5Qg=;
        b=pBAfsoq5faCnuzd+hQwzJGyMtBMU/GJNy31ijJL4Wd+lsUGXE3Ln7mjTOWUf0bGXTj
         5AjjuB4bTqniTfZYzkPheoV3md+l2H68rh3zoTQSWqUhFNe9fOJV5AFjBETsRpVmQ6vv
         9D2HXlLVwKSSkiuJCHOYddQ2BAG563AOCX76GkeCvRdR4dhPcydS7lFqb+RdRJgSm2s1
         xiBSnm6k9qTHPB0z7kj+/2vS1GPmLODy9hkL66f12UCuHYd40Xp9YcypdpCObF5WbqmZ
         vloR418MK3WtUxBjDi8plplXCsvbYS3990C9v/DzdrfspyO7F50HTKvUmFJ/N4+NMRM+
         DOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686745653; x=1689337653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBlyXw0ZtflEgTux/YUX8uMDuRWhjdFJIbKQ14qn5Qg=;
        b=We8UJhX6ndDw4fP3vmCoXzY31rb78ZCDnvst7ZJZBRfX5vYquRWpPGjdFLkv77ICyF
         PDAijOE0Cct+zC+D4gYNWrYpFLbDzxiXHUj6dPNeLwxuQVEiZK0X5rPNxCkBHSMyF3YC
         yqaFgvJIAokosMMDDFhrQxuvW6ng2qvrY5cdpLG+Fp0E3LXCMkOtZaG5bs5MRRCRP7mo
         R9G0i0Z0oj0Bdmkk/EYFCRo6XcrU6vkoqraWzhxZsBP6SxBYrHZLf5zo1vg6jcdow4wp
         gPxFKzYpVpqc9379heh6BJQS0YZ4BL/1JsBIXpL5LxmWd/GqNC/JR8OAoLdsYUyx53ah
         0FLA==
X-Gm-Message-State: AC+VfDzrOCGtJ0K39gPY4ay3x0P/i3LpDVRF2HteRJVr1ZWJ4VhBpJ7C
	4hNQkEkhkScyoNBQNz8HnvA=
X-Google-Smtp-Source: ACHHUZ5W9upyNQ2DbT6KKsF9hN0g3BlBPvJWEG1/jDW+jhmmHWaWVDNPI4HGi89qqKvdGREUgmt62A==
X-Received: by 2002:a5d:43cb:0:b0:311:f11:4c55 with SMTP id v11-20020a5d43cb000000b003110f114c55mr816454wrr.13.1686745652535;
        Wed, 14 Jun 2023 05:27:32 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id t18-20020adfeb92000000b003093a412310sm18083315wrn.92.2023.06.14.05.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 05:27:32 -0700 (PDT)
Message-ID: <1d115a59-a113-9822-7562-2832023e4f14@gmail.com>
Date: Wed, 14 Jun 2023 14:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH 3/3] python_mesonpy: New class
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230602074419.2450399-1-zboszor@gmail.com>
 <20230602074419.2450399-3-zboszor@gmail.com>
 <fcb088b53c6635a6289c3d7d6fdbc6930de634a6.camel@linuxfoundation.org>
 <b48ac118-3096-8a94-9896-daefe4b46a30@gmail.com>
 <01dca4b2a76d8972c24ec1aa5480b93f4f0b0585.camel@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <01dca4b2a76d8972c24ec1aa5480b93f4f0b0585.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 12:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182804

2023. 06. 14. 11:52 keltezéssel, Richard Purdie írta:
> On Wed, 2023-06-14 at 07:46 +0200, Böszörményi Zoltán wrote:
>> 2023. 06. 13. 22:59 keltezéssel, Richard Purdie írta:
>>> On Fri, 2023-06-02 at 09:44 +0200, Zoltan Boszormenyi wrote:
>>>> This is a new PEP517 compatible build class for python modules
>>>> that use pyproject.toml and this:
>>>>
>>>> [build-system]
>>>> build-backend = 'mesonpy'
>>>>
>>>> The new class uses python3-meson-python-native.
>>>>
>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>> ---
>>>>    meta/classes-recipe/python_mesonpy.bbclass | 54 ++++++++++++++++++++++
>>>>    1 file changed, 54 insertions(+)
>>>>    create mode 100644 meta/classes-recipe/python_mesonpy.bbclass
>>>>
>>>> diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classes-recipe/python_mesonpy.bbclass
>>>> new file mode 100644
>>>> index 0000000000..1da8b005ab
>>>> --- /dev/null
>>>> +++ b/meta/classes-recipe/python_mesonpy.bbclass
>>>> @@ -0,0 +1,54 @@
>>>> +#
>>>> +# Copyright OpenEmbedded Contributors
>>>> +#
>>>> +# SPDX-License-Identifier: MIT
>>>> +#
>>>> +
>>>> +inherit meson setuptools3-base python3targetconfig python_pep517
>>>> +
>>>> +# Filter out meson_do_qa_configure from do_configure[postfuncs]
>>>> +DOCONFIGUREPOSTFUNCS := "${@d.getVarFlag('do_configure', 'postfuncs')}"
>>>> +DOCONFIGUREPOSTFUNCS:remove = "meson_do_qa_configure"
>>>> +do_configure[postfuncs] := "${@'' if d.getVar('DOCONFIGUREPOSTFUNCS') is None else d.getVar('DOCONFIGUREPOSTFUNCS') }"
>>>> +
>>>> +# This prevents the meson error:
>>>> +# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pick one.
>>>> +MESONOPTS:remove = "--buildtype ${MESON_BUILDTYPE}"
>>>> +
>>>> +CONFIGURE_FILES = "pyproject.toml"
>>>> +
>>>> +DEPENDS += "python3-wheel-native python3-meson-python-native"
>>>> +
>>>> +def mesonpy_get_args(d):
>>>> +    vars = ['MESONOPTS', 'MESON_CROSS_FILE', 'EXTRA_OEMESON']
>>>> +    varlist = []
>>>> +    for var in vars:
>>>> +        value = d.getVar(var)
>>>> +        vallist = value.split()
>>>> +        for elem in vallist:
>>>> +            varlist.append("-Csetup-args=" + elem)
>>>> +    return ' '.join(varlist)
>>>> +
>>>> +PEP517_BUILD_OPTS = "-Cbuilddir='${B}' ${@mesonpy_get_args(d)}"
>>>> +
>>>> +# Python pyx -> c -> so build leaves absolute build paths in the code
>>>> +INSANE_SKIP:${PN} += "buildpaths"
>>>> +INSANE_SKIP:${PN}-src += "buildpaths"
>>> This is not ready for core as the output is not reproducible. I am not
>>> taking patches which skip buildpaths warnings.
>>>
>>> This also shows that the code is not being tested in OE-Core. Until it
>>> is needed by and being used by something in core, I don't think it
>>> should be there.
>> This thread was long time dead. The series was sent to meta-oe.
> Was the reproducibility issue fixed?

You tell me. This is something to be fixed in Cython, as the
pyx -> C/C++ translation is responsible for those warnings,
not mesonpy.

I am happy to remove those INSANE_SKIP settings, though.

>   It really does need to be as we
> have things like hash equivalence which depend upon that...
>
> Cheers,
>
> Richard


