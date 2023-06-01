Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619F2C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 13:45:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.32002.1685627149082432727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 06:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rqHCQj/b;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6ffc2b314so16839685e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 06:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685627147; x=1688219147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2nfbfZbP2BUOJiHrX+UNymnCFG5BXD7MziGMK5K8l4=;
        b=rqHCQj/bZs2Gpy/nFs0n1nyfrPn6lonq5pIdzWKwsYnjClk5YneD6J/f1SqhpegLr+
         U5SNBwPNAkaYYQvv3J7MQZkdN7A7SWlXrSYux6373sKhaT9iui7CxjJQzscMSqPmuHRO
         XjT6XonCjwpgT49mCgEtLxkqK/m2hM4JnxhORdvEa9BnGgYYTGyx0qQralt4v1YmyoeV
         mk0deotzmBb3wQfCu0neZTi+5Uu1kfzsnspz1NqkFMboWsl6HxntulkBnU6zXc7fKclN
         WQpE4nHjQ/NkTh1ZmSpzf8liOBvDc24Uu1dPXIFA2NxvBQ+7j18LYYDg9Ug1hYkLZt0j
         xlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685627147; x=1688219147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2nfbfZbP2BUOJiHrX+UNymnCFG5BXD7MziGMK5K8l4=;
        b=MB0uNPbOVQLLHKfi4x8SVtcjXMP6SHnzxJ3zWUrHu19hRSccAs53Sk9MaM+90REkO1
         lBPB/UBNAuhoE7lMGqzDmmBoxrYBZZQzG9JyuyVWnStJEDRHeQopHRU/mROe0fP7CTs+
         Fwqdr3CpxGKbX/9y3htSb2MEpx/8pZLPy5A3ByVe7LKInps3C+VELqUIVXSWI4Q+IqJf
         AL7tmQBI2Gc0McPOc5SDd0QSenGnIqC1pe5bEu2SKQIIj2meqOqvIz/NMZY4joFkKLZp
         2dGvUdn5WSU4pqyva4O/jfy1/FAetaqmJ5piarF/N9j/h/3ieISD2eNMKfAkSpvUMWRm
         4yIg==
X-Gm-Message-State: AC+VfDwtg46PD52ojiM+OjFsoaOHX66jlBp61UROm8zKU9WTp7zwfL96
	IGtEPxRaBX1OCwEa86z4gCVWzTcG3HM=
X-Google-Smtp-Source: ACHHUZ4rRJSsu52aRSz66SS593nMkrHI5/H6rg7oEI93H/cukDHnS8QKNeY0w8xMh05C/mUoy+khDw==
X-Received: by 2002:a05:600c:4e0c:b0:3f6:80:aa60 with SMTP id b12-20020a05600c4e0c00b003f60080aa60mr2006351wmq.8.1685627147137;
        Thu, 01 Jun 2023 06:45:47 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d5344000000b00307acec258esm10417670wrv.3.2023.06.01.06.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 06:45:46 -0700 (PDT)
Message-ID: <092fab93-1fb6-54b2-1ec8-6207ffc99ee1@gmail.com>
Date: Thu, 1 Jun 2023 15:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH v2 2/2] python3-meson-python: New recipe
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20230601080821.2346868-1-zboszor@gmail.com>
 <20230601080821.2346868-2-zboszor@gmail.com>
 <202306011100565b118a99@mail.local>
 <bda183eb-33ce-687c-d5c5-1f0172199a71@gmail.com>
 <2023060111494403e2eb36@mail.local>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <2023060111494403e2eb36@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 13:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182109

2023. 06. 01. 13:49 keltezéssel, Alexandre Belloni írta:
> On 01/06/2023 13:39:13+0200, Böszörményi Zoltán wrote:
>> 2023. 06. 01. 13:00 keltezéssel, Alexandre Belloni írta:
>>> Hello,
>>>
>>> This fails on the autobuilders:
>>>
>>> stdio: WARNING: Nothing PROVIDES 'python3-pyproject-metadata-native'
>> It works in mickledore.
>>
>> Was BBCLASSEXTEND removed from python3-pyproject-metadata
>> in meta-openembedded master? (Looking... No, it wasn't.)
>>
>> Can you try building python3-pyproject-metadata-native by itself?
> oe-core doesn't depend on meta-openembedded so our builds doesn't have
> it. You should either import the missing recipe or submit your recipe to
> meta-openembedded.

Thanks, I will send a v3 with this recipe added soon.

>>>    (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb, virtual:native:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb, /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb DEPENDS on or otherwise requires it). Close matches:
>>> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pyproject-metadata' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
>>> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-meson-python' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
>>> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-meson-python-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
>>> stdio: WARNING: Nothing RPROVIDES 'python3-pyproject-metadata-native' (but virtual:native:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
>>> stdio: WARNING: Nothing RPROVIDES 'python3-pyproject-metadata' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
>>> stdio: WARNING: Nothing RPROVIDES 'python3-meson-python' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
>>> stdio: WARNING: Nothing RPROVIDES 'python3-meson-python-dev' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
>>>
>>> On 01/06/2023 10:08:21+0200, Zoltan Boszormenyi wrote:
>>>> This python module adds support for a new PEP517 build backend
>>>> used by recent versions of scikit-image, scipy and others.
>>>>
>>>> The previously added python_mesonpy.bbclass uses it
>>>>
>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>> ---
>>>>    meta/conf/distro/include/maintainers.inc      |  1 +
>>>>    .../python/python3-meson-python_0.13.1.bb     | 22 +++++++++++++++++++
>>>>    2 files changed, 23 insertions(+)
>>>>    create mode 100644 meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
>>>>
>>>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>>>> index 8c4c586414..f2448ee3c9 100644
>>>> --- a/meta/conf/distro/include/maintainers.inc
>>>> +++ b/meta/conf/distro/include/maintainers.inc
>>>> @@ -647,6 +647,7 @@ RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
>>>>    RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>>>>    RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
>>>>    RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>>>> +RECIPE_MAINTAINER:pn-python3-meson-python = "Zoltán Böszörményi <zboszor@gmail.com>"
>>>>    RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
>>>>    RECIPE_MAINTAINER:pn-python3-ndg-httpsclient = "Tim Orling <tim.orling@konsulko.com>"
>>>>    RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>>>> diff --git a/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
>>>> new file mode 100644
>>>> index 0000000000..828a1652fa
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
>>>> @@ -0,0 +1,22 @@
>>>> +SUMMARY = "Meson Python build backend (PEP 517)"
>>>> +LICENSE = "MIT"
>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
>>>> +
>>>> +DEPENDS = " \
>>>> +	meson-native ninja-native patchelf-native \
>>>> +	python3-pyproject-metadata-native \
>>>> +"
>>>> +
>>>> +PYPI_PACKAGE = "meson_python"
>>>> +
>>>> +inherit pypi python_mesonpy
>>>> +SRC_URI[sha256sum] = "63b3170001425c42fa4cfedadb9051cbd28925ff8eed7c40d36ba0099e3c7618"
>>>> +
>>>> +DEPENDS:remove:class-native = "python3-meson-python-native"
>>>> +
>>>> +RDEPENDS:${PN} = " \
>>>> +	meson ninja patchelf \
>>>> +	python3-pyproject-metadata \
>>>> +"
>>>> +
>>>> +BBCLASSEXTEND = "native nativesdk"
>>>> -- 
>>>> 2.40.1
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#182054): https://lists.openembedded.org/g/openembedded-core/message/182054
>>>> Mute This Topic: https://lists.openembedded.org/mt/99259620/3617179
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>


