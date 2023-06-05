Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A38C7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 12:23:33 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.6124.1685967809448512367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 05:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UKjOwnNs;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: zboszor@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f619c2ba18so2508619e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 05:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685967807; x=1688559807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fuYrOTbELpZjqTPgdviolvvev+HGJh2J/0QaahFbmxo=;
        b=UKjOwnNskd2RINqQUhkk3UZObgdJcDBN31UzmzkS7sYnYy3lQ+gUWjzH7CcV8CE9BT
         crq2+bKwbT6QmziuWJiULkigMeB3gW3i0KL7cAOBkkyHDqdhms4bqqkPGq2sUupUBCIu
         aYHQNKHvZeQaW8cOnmRkZAIrnX7KqeldIKACgrSgQ/VbZjDJBUSTromFC3GP5v4gjGlp
         +zu6TeoBs9rkr50PDFTNunuVZkqc6A578xDNgAk5vjo/h5RSt/qzez9y5KaMOjthUnAg
         YCC3K7h29Wz+G/vzBs1h41sHZdJdBehGQpjFeOg6kxfcgycg62RJkf0uUQZzjCaOdQHf
         FEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685967807; x=1688559807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuYrOTbELpZjqTPgdviolvvev+HGJh2J/0QaahFbmxo=;
        b=KljJWHpChCI0AwXFWNMlzigCrWgyVE42VrqdB9ZANrJCXknPfl8jj5GOkCzIUIdkzY
         RdgYiVEHhyXCPNOTZC2ZshxW9taSrEGRobzidjdbvkFtBOQG78ryIYPGwd679KFIwFFB
         jpGwHyLlALyIfWCwJm6bDtXdrQ0PmilJyLBrxq9i2yq/ljuiXvG4xKSaDFzaMUexLi26
         ec7j8qlq87mpW4pq2I8zNjtkOM5iYsirIUjTK+dJYpztPdDseMEJLgi6T46pItvBctf0
         IttjIa4uh9FFKrMPZK9vsbmZaXxrybvN1TCHDZDO4kDdVlota0c7E5nthQyodRhrshLA
         3KFg==
X-Gm-Message-State: AC+VfDxH1lXsEKtf2XKg3Sn5XY+BZt+QYIM312RWqLRiGMFo4s5wG4va
	eW79TRAerQQ/2s36XJ+35V8=
X-Google-Smtp-Source: ACHHUZ5H/I7h743V4fsDe+oUehUA9Tq02ZEfdD7xbD8jPE/6IVX+0FlOvop5Stroe/+sX/lx16qcBA==
X-Received: by 2002:a05:6512:50f:b0:4f1:4051:d77b with SMTP id o15-20020a056512050f00b004f14051d77bmr5057819lfb.60.1685967807277;
        Mon, 05 Jun 2023 05:23:27 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a20-20020a05600c225400b003f7aad8c160sm3174213wmm.11.2023.06.05.05.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 05:23:26 -0700 (PDT)
Message-ID: <c79cf0a5-0766-c0d8-7699-b261e5e819db@gmail.com>
Date: Mon, 5 Jun 2023 14:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH v4 3/3] python_mesonpy: New class
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20230603080703.1400571-1-zboszor@gmail.com>
 <20230603080703.1400571-3-zboszor@gmail.com>
 <EE298E95-80DF-45D0-A4CB-52CD86601CB0@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <EE298E95-80DF-45D0-A4CB-52CD86601CB0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 12:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182379

2023. 06. 05. 13:57 keltezéssel, Ross Burton írta:
> Do you have a recipe in mind to demonstrate that this works as intended?

I have a working python3-scikit-image recipe for version 0.20.0,
which uses this build backend.

meta-scipy may also use it to add a newer version of python3-scipy.

> If there’s nothing in core that needs it, maybe it should sit in meta-python until then.
>
> Ross
>
>> On 3 Jun 2023, at 09:07, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>>
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
>> meta/classes-recipe/python_mesonpy.bbclass | 54 ++++++++++++++++++++++
>> 1 file changed, 54 insertions(+)
>> create mode 100644 meta/classes-recipe/python_mesonpy.bbclass
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
>> +
>> +python_mesonpy_do_configure () {
>> +    python_pep517_do_configure
>> +}
>> +
>> +python_mesonpy_do_compile () {
>> +    python_pep517_do_compile
>> +}
>> +
>> +python_mesonpy_do_install () {
>> +    python_pep517_do_install
>> +}
>> +
>> +python_mesonpy_do_bootstrap_install () {
>> +    python_pep517_do_bootstrap_install
>> +}
>> +
>> +EXPORT_FUNCTIONS do_configure do_compile do_install
>> -- 
>> 2.40.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#182349): https://lists.openembedded.org/g/openembedded-core/message/182349
>> Mute This Topic: https://lists.openembedded.org/mt/99301645/6875888
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross.burton@arm.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


