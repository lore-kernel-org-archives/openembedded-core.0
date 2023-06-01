Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB78DC7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 11:39:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.28633.1685619556759351796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 04:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dy4RZwei;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30ae901a9ffso672013f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685619555; x=1688211555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irXvDTY4Aoy/k2syuWHglvXH9RCPVQBPnddeV57V3U8=;
        b=dy4RZwei+cTykV0yqwspP4or1QdMZDkX8aqNlaSd0Vaz+3XAcxBkrEGcTFrLhN/XlG
         tb6q/6Xb+uoafC3AzWA33J6PGfRlYVDfrkJ+dVoPRxImKy3trBhJhFFmFXat+qbAZ2wb
         U/2PJExvkDtyTf8LWAyusqJ8e3hzPP3WOZDHUzuCF/cuVd0sbc2rLo7tJUaR6k6KDmUF
         WtFBZtb23+GB+hIuATiJpS8G5EcBx6YKy4TWrmA8JN1OOBf3vY77VDRhN8mJ1QKhfpzY
         5nYa5M3K9funKGhgHloWcXuOrRzZV+z49LMZsBEDz/wATLnXlfO7cHv9T3kg1bc00Q5t
         u6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685619555; x=1688211555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irXvDTY4Aoy/k2syuWHglvXH9RCPVQBPnddeV57V3U8=;
        b=g5szvvohQ+wUPQGayCphdnNei0O9lXNbzVeUmvdQYDF5L5fE4HAhDVzRYPRMfGdHYn
         3c9IbESLO5J7G4nS3fuLkoZKQVqu2e/BfA07cnxyO5a2kgh/Y+EnMZ+GaJD1u2IbvpB7
         DzNFJ/dM+dDvR0PvpSTY5ik/sd1MoSZJa4xaMyUWzUI77LiJAGf2l8zix6FzFOOVPIQ0
         eiwV/+3DlCZIYA+YbrnMAX7WcDTMEyKLvHJgmCdIkvnsIumWX1eByZ99FQwlAmWRKG88
         LrrVilfUac3mPX6zzuv0lS+YNimxpZcs8T0toWc+zk0JPAz9Lc+S1cxNEOfxVLFFIUQ8
         y+gw==
X-Gm-Message-State: AC+VfDxdj1mf+VUr66bU17b3j749lTpv7TrcgJjqUaezr2YaCoaV5bPf
	d/vkWqSJlUat7yNFGiRt6cc=
X-Google-Smtp-Source: ACHHUZ55UrYR6Uiz7ujsAS4Qz+3tUM6LDMH57cDDQXjSuZeYYVjpdzpbfGj0KiOtLN6PH8MhIBDzfw==
X-Received: by 2002:a5d:62cd:0:b0:304:b967:956f with SMTP id o13-20020a5d62cd000000b00304b967956fmr1861629wrv.8.1685619554987;
        Thu, 01 Jun 2023 04:39:14 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id x15-20020adfdd8f000000b0030ae3a6be4asm10087476wrl.72.2023.06.01.04.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 04:39:14 -0700 (PDT)
Message-ID: <bda183eb-33ce-687c-d5c5-1f0172199a71@gmail.com>
Date: Thu, 1 Jun 2023 13:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH v2 2/2] python3-meson-python: New recipe
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20230601080821.2346868-1-zboszor@gmail.com>
 <20230601080821.2346868-2-zboszor@gmail.com>
 <202306011100565b118a99@mail.local>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <202306011100565b118a99@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 11:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182100

2023. 06. 01. 13:00 keltezéssel, Alexandre Belloni írta:
> Hello,
>
> This fails on the autobuilders:
>
> stdio: WARNING: Nothing PROVIDES 'python3-pyproject-metadata-native'

It works in mickledore.

Was BBCLASSEXTEND removed from python3-pyproject-metadata
in meta-openembedded master? (Looking... No, it wasn't.)

Can you try building python3-pyproject-metadata-native by itself?

>   (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb, virtual:native:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb, /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb DEPENDS on or otherwise requires it). Close matches:
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pyproject-metadata' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-meson-python' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-meson-python-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'python3-pyproject-metadata-native' (but virtual:native:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'python3-pyproject-metadata' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'python3-meson-python' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'python3-meson-python-dev' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
>
> On 01/06/2023 10:08:21+0200, Zoltan Boszormenyi wrote:
>> This python module adds support for a new PEP517 build backend
>> used by recent versions of scikit-image, scipy and others.
>>
>> The previously added python_mesonpy.bbclass uses it
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/conf/distro/include/maintainers.inc      |  1 +
>>   .../python/python3-meson-python_0.13.1.bb     | 22 +++++++++++++++++++
>>   2 files changed, 23 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>> index 8c4c586414..f2448ee3c9 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -647,6 +647,7 @@ RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
>>   RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>>   RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
>>   RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>> +RECIPE_MAINTAINER:pn-python3-meson-python = "Zoltán Böszörményi <zboszor@gmail.com>"
>>   RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
>>   RECIPE_MAINTAINER:pn-python3-ndg-httpsclient = "Tim Orling <tim.orling@konsulko.com>"
>>   RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>> diff --git a/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
>> new file mode 100644
>> index 0000000000..828a1652fa
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY = "Meson Python build backend (PEP 517)"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
>> +
>> +DEPENDS = " \
>> +	meson-native ninja-native patchelf-native \
>> +	python3-pyproject-metadata-native \
>> +"
>> +
>> +PYPI_PACKAGE = "meson_python"
>> +
>> +inherit pypi python_mesonpy
>> +SRC_URI[sha256sum] = "63b3170001425c42fa4cfedadb9051cbd28925ff8eed7c40d36ba0099e3c7618"
>> +
>> +DEPENDS:remove:class-native = "python3-meson-python-native"
>> +
>> +RDEPENDS:${PN} = " \
>> +	meson ninja patchelf \
>> +	python3-pyproject-metadata \
>> +"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> -- 
>> 2.40.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#182054): https://lists.openembedded.org/g/openembedded-core/message/182054
>> Mute This Topic: https://lists.openembedded.org/mt/99259620/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>


