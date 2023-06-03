Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6BAC77B73
	for <webhook@archiver.kernel.org>; Sat,  3 Jun 2023 08:11:33 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8054.1685779885255701244
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jun 2023 01:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WxA+JYcO;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f732d37d7bso1167925e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685779884; x=1688371884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YrOD5m6tRCpMZ4nGr6qDa84f+JS8/qqgoXgj6rEs69o=;
        b=WxA+JYcOg7BXVmlbGUpBKMR67miHQd+JkXzMyN4RuKQXK566Pw2CFtsb1saEB61MEu
         XzhGbOvptYybu76BBY08z3pf8r+AoHYlTAEDrdvQioRkhUFhBH8+3bkLLSeTlB4IZ12o
         fQWXxrn3hQorXIMHG4sORRNU5djWN0bv+3+sSin1VwsWsBgIh9MOi2MAheRte1TTwwFt
         1xgK/Tvygi6NuC5bWGNLtdRvgW2o/kkf9jZOveOmWyLSDFF7EfqsL/eZJQu7luqGW9U2
         ASH04gzqVIMwRT3JiKNT43cktuciCBUu9SYY8ZfUQbazje3Bf90gXwzA2I83GNyYkwtQ
         1UHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685779884; x=1688371884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YrOD5m6tRCpMZ4nGr6qDa84f+JS8/qqgoXgj6rEs69o=;
        b=FliEsOTtzPhczFNBfoACIVdVmiZS/W5akab2Jv7AnFQU4ED1EguQ5Sc7MgvW6o1WFN
         ELxulIx5fGAlXNtPRScBvJcERySapWO+DDCbmZvGbYcb87zSsSiNu8rf9nq/inV1+5bH
         21XOJo9uPOtlUFR0saao00s2NpXQDe/Zl4kx3V92uh4GsSrBaWur+8zjSz0dzzJS6QnY
         I8XxtSlK/J+skEAA+3BDglw8j1AZV5kg3CbITkLtVrRtHl2WUrZaKGeyrMzO8W9iJZkR
         ytN7lk8Lx/vUw8rQTkv/LEFPRgR6VE52G8Ym6UYwskpbYevfRUwrLoWUw9A4HL3bjGxM
         DrVA==
X-Gm-Message-State: AC+VfDzDVqf6PlQBW0FhfeyCQwnw1L3QwczWMKotAb403jkByVHYySO9
	bvJp3TGTpRt+Cm1hzGCTAAE=
X-Google-Smtp-Source: ACHHUZ5vcdNWV6atFQibRq+wfDGdgQL9sCW/IgmaT+Xy4xHVf/tY9YKofRiXW5rgBBvWNsxPJi9yHQ==
X-Received: by 2002:a7b:cb57:0:b0:3f6:7fb:b60e with SMTP id v23-20020a7bcb57000000b003f607fbb60emr3244249wmj.35.1685779883656;
        Sat, 03 Jun 2023 01:11:23 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id cx14-20020a056000092e00b003078681a1e8sm3793938wrb.54.2023.06.03.01.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jun 2023 01:11:23 -0700 (PDT)
Message-ID: <f398da62-5c65-9804-4409-7ab4ab4789c8@gmail.com>
Date: Sat, 3 Jun 2023 10:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH 1/3] python3-pyproject-metadata: New recipe
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20230602074419.2450399-1-zboszor@gmail.com>
 <20230602172146f5408a36@mail.local>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20230602172146f5408a36@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 08:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182350

2023. 06. 02. 19:21 keltezéssel, Alexandre Belloni írta:
> Hello,
>
> the series causes the following warnings:

Thanks. Just sent v4 with adding HOMEPAGE to both recipes.

> stdio: WARNING: python3-pyproject-metadata-native-0.7.1-r0 do_fetch: QA Issue: Recipe python3-pyproject-metadata in /home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
> stdio: WARNING: python3-pyproject-metadata-0.7.1-r0 do_fetch: QA Issue: Recipe python3-pyproject-metadata in /home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
> stdio: WARNING: python3-meson-python-0.13.1-r0 do_fetch: QA Issue: Recipe python3-meson-python in /home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
> stdio: WARNING: python3-meson-python-native-0.13.1-r0 do_fetch: QA Issue: Recipe python3-meson-python in /home/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
>
> On 02/06/2023 09:44:17+0200, Zoltan Boszormenyi wrote:
>> It is a dependency for python3-meson-python.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/conf/distro/include/maintainers.inc         |  1 +
>>   .../python/python3-pyproject-metadata_0.7.1.bb   | 16 ++++++++++++++++
>>   2 files changed, 17 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>> index 5accca3fef..d910ce6481 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -670,6 +670,7 @@ RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>
>>   RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
>>   RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>>   RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
>> +RECIPE_MAINTAINER:pn-python3-pyproject-metadata = "Zoltán Böszörményi <zboszor@gmail.com>"
>>   RECIPE_MAINTAINER:pn-python3-pysocks = "Tim Orling <tim.orling@konsulko.com>"
>>   RECIPE_MAINTAINER:pn-python3-pytest = "Tim Orling <tim.orling@konsulko.com>"
>>   RECIPE_MAINTAINER:pn-python3-pytest-runner = "Tim Orling <tim.orling@konsulko.com>"
>> diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
>> new file mode 100644
>> index 0000000000..9887af78d0
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "PEP 621 metadata parsing"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
>> +
>> +PYPI_PACKAGE = "pyproject-metadata"
>> +
>> +inherit pypi python_setuptools_build_meta
>> +SRC_URI[sha256sum] = "0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> +
>> +RDEPENDS:${PN} += " \
>> +    python3-logging \
>> +    python3-packaging \
>> +    python3-profile \
>> +"
>> -- 
>> 2.40.1
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#182146): https://lists.openembedded.org/g/openembedded-core/message/182146
>> Mute This Topic: https://lists.openembedded.org/mt/99281729/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>


