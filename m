Return-Path: <chaoscodecircuits@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6980CC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 14:39:54 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.16183.1685543991264891056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 07:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TSpcU1qM;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-75b2a2bf757so377756885a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685543990; x=1688135990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/QOgrYsMtdvi1dQ6JqfgGvYLSzggQwQZfvZ2fCylWzY=;
        b=TSpcU1qMZwZ4Vd6xohI0I5CfrbI3q23YZGEIKGU1Jwyruk5EIjjBN4SaGfUoJBxnnt
         ZXZn/20AgFP4d//SkPvRCr22pep/t2x/f9zDVDmK9XXYcl5tKVpMfnXzHPg2B/EkMQt0
         opXvwlvcp12JDQ6L2cNtx0FalvizW62l8smtWiGTd1Oi7KT219r1P95tZzYkwlZj7MfI
         d6FasGQjRupOMSHkooTSTUxjlm3nG0c5Xj9n7NPSd1ayk7NW1xRYpNxikUnn5vrOuAQR
         b+PD+i7p3SHgPEyHGhJETypABoXCHobGIFTUwWxnCH32WuvkVFvq77UlDhflXXzIUfkT
         xl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685543990; x=1688135990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/QOgrYsMtdvi1dQ6JqfgGvYLSzggQwQZfvZ2fCylWzY=;
        b=LLRjjmt+/HpwKdnN8hn385f7gcOhG+KQWBKuDox2PPm7pdiK/QbhUR3125oVojsGla
         5G1GCYcuNIB7UQ9dDQ5JGABHwJMm4lOKAWxe3WDyjcDeXyQqkA4ydFH1BEu4GUAOIEZO
         +fL7bwLoQYSYZm94O2IXTBdr2N9/tWyftOjBnYVrIDoX1GtEYbN9DHdk68JKaSxZ9a2O
         rYr+lCubEjDmYxVMgS8HpzYJrSs6qxoUaVkHDkdcKVEENGxtY4mTNWF2ORvnvBYJJvh5
         vepW2TLs2RHZG7BawAEVxKYtIj/dZ3ttTobzXyZnr+YfLkuvp/Lsnl2PXurTfs0ozcFc
         uF7A==
X-Gm-Message-State: AC+VfDyI2kk6SXZmH3PJdWUAe/Vl6D63tsXphJfH8VY0d15H6HdC3evj
	3fgfzrtmJrzy7AuxvsdvPNw=
X-Google-Smtp-Source: ACHHUZ6n1gugAaFhMTjOtGaho8A5D/6a0w5yjntvJdRA46iYB+BUo7KgVi2cb6Q/RyFfu6I9UXSHxA==
X-Received: by 2002:a05:620a:8a83:b0:75b:23a1:366a with SMTP id qu3-20020a05620a8a8300b0075b23a1366amr4859766qkn.43.1685543990167;
        Wed, 31 May 2023 07:39:50 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:bc2d:57d7:406e:f9ca? ([2001:1970:5b1f:ab00:bc2d:57d7:406e:f9ca])
        by smtp.gmail.com with ESMTPSA id f25-20020a05620a15b900b0074df70197a6sm5178703qkk.109.2023.05.31.07.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 07:39:49 -0700 (PDT)
Message-ID: <e3be72bc-a4c7-4f55-93fd-92388406e68b@gmail.com>
Date: Wed, 31 May 2023 10:39:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] python3 cryptic build failures
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Tim Orling <tim.orling@konsulko.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <eb184be946abaf9c76a2af279af2db9bcb43a1e0.camel@linuxfoundation.org>
 <CADkTA4OQJLMSqBzR3nKVX0o6YV=qa9ZPaJioU63W6B6wh6=wWA@mail.gmail.com>
 <6d3608b9-6f76-9a6a-6857-bd055b9eeb73@baylibre.com>
 <CADkTA4P4a-9sW6a64HhbFO3e+KmCn2gACYXkrrXRrV6mzT11ug@mail.gmail.com>
From: Trevor Gamblin <chaoscodecircuits@gmail.com>
In-Reply-To: <CADkTA4P4a-9sW6a64HhbFO3e+KmCn2gACYXkrrXRrV6mzT11ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 14:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182014


On 2023-05-31 10:25, Bruce Ashfield wrote:
> On Wed, May 31, 2023 at 10:20 AM Trevor Gamblin <tgamblin@baylibre.com> wrote:
>>
>> On 2023-05-31 10:04, Bruce Ashfield wrote:
>>> On Wed, May 31, 2023 at 9:23 AM Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> Hi Trevor,
>>>>
>>>> I thought this issue might be something you might be able to spot the
>>>> solution with quickly.
>>>>
>>>> I had a failing python3-iniconfig build in a TMPDIR I've reused
>>>> heavily:
>>> FWIW. I see this in about 6 or 7 python recipes in my extremely
>>> heavily reused tmpdir.
>>>
>>> After I came back from vacation, I iterated through a -c clean on the
>>> python packages, and they always built the second time through.
>> Do you recall which those are, and if it's the same ones each time it
>> happens? I'm wondering if it may be an issue with some recipes.
>>
> roughly this set (as grepped from my history):
>
>   2783  bitbake -c clean python3-attrs; bitbake core-image-minimal
>   2828  bitbake -c clean python3-colorama; bitbake core-image-minimal
>   2829  bitbake -c clean python3-jsonschema; bitbake core-image-minimal
>   2943  bitbake -c clean python3-hatch-vcs python3-hatch-vcs-native;
> bitbake core-image-minimal
>   2944  bitbake -c clean python3-attrs; bitbake core-image-minimal
>   2945  bitbake -c clean python3-urllib3; bitbake core-image-minimal
>   2946  bitbake -c clean python3-colorama; bitbake core-image-minimal
>   2947  bitbake -c clean python3-jsonschema; bitbake core-image-minimal
>   2948  bitbake -c clean python3-iniconfig; bitbake core-image-minimal
>
> Apparently I had particular issues with colorama :)

It could possibly be an issue with recipes that depend on hatchling 
and/or hatch-vcs. A quick grep for "hatch" in oe-core/meta/recipes-devtools:

python3-jsonschema_4.17.3.bb
python3-attrs_23.1.0.bb
python3-urllib3_2.0.2.bb
python3-hatchling_1.17.0.bb
python3-hatch-fancy-pypi-readme_22.8.0.bb
python3-hatch-vcs_0.3.0.bb
python3-iniconfig_2.0.0.bb

and in meta-python:

python3-traitlets_5.9.0.bb
python3-prettytable_3.6.0.bb
python3-pyhamcrest_2.0.4.bb
python3-termcolor_2.3.0.bb
python3-platformdirs_3.5.1.bb
python3-soupsieve_2.4.1.bb
python3-colorama_0.4.6.bb

If it happens with traitlets, prettytable, soupsieve, platformdirs, 
termcolor, or pyhamcrest too then that's probably where the issue is. 
I'll keep trying to reproduce it.

>
> Bruce
>
>
>> I haven't been able to recreate the issue yet, but my tmpdir is not very
>> old. When I attempt the suggested reproducer (creating the empty
>> directories and rerunning do_compile), it is successful. I'll keep
>> poking at it.
>>
>> Trevor
>>
>>> Bruce
>>>
>>>> ERROR: python3-iniconfig-2.0.0-r0 do_compile: ExecutionError('/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/run.do_compile.2391637', 1, None, None)
>>>> ERROR: Logfile of failure stored in: /media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/log.do_compile.2391637
>>>> Log data follows:
>>>> | DEBUG: Executing shell function do_compile
>>>> | * Getting build dependencies for wheel...
>>>> |
>>>> | Traceback (most recent call last):
>>>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main__.py", line 375, in main
>>>> |     built = build_call(
>>>> |             ^^^^^^^^^^^
>>>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main__.py", line 208, in build_package
>>>> |     out = _build(isolation, builder, outdir, distribution, config_settings, skip_dependency_check)
>>>> |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main__.py", line 147, in _build
>>>> |     return _build_in_current_env(builder, outdir, distribution, config_settings, skip_dependency_check)
>>>> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__main__.py", line 127, in _build_in_current_env
>>>> |     missing = builder.check_dependencies(distribution)
>>>> |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init__.py", line 369, in check_dependencies
>>>> |     return {u for d in dependencies for u in check_dependency(d)}
>>>> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init__.py", line 369, in <setcomp>
>>>> |     return {u for d in dependencies for u in check_dependency(d)}
>>>> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init__.py", line 185, in check_dependency
>>>> |     yield from check_dependency(other_req_string, ancestral_req_strings + (normalised_req_string,), req.extras)
>>>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build/__init__.py", line 179, in check_dependency
>>>> |     if req.specifier and not req.specifier.contains(dist.version, prereleases=True):
>>>> |                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packaging/specifiers.py", line 905, in contains
>>>> |     item = Version(item)
>>>> |            ^^^^^^^^^^^^^
>>>> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packaging/version.py", line 196, in __init__
>>>> |     match = self._regex.search(version)
>>>> |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> | TypeError: expected string or bytes-like object, got 'NoneType'
>>>> |
>>>> | ERROR expected string or bytes-like object, got 'NoneType'
>>>> | WARNING: exit code 1 from a shell command.
>>>> ERROR: Task (/media/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile) failed with exit code '1'
>>>>
>>>> I wondered why and I isolated it down to this:
>>>>
>>>> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages$ find -type d -empty
>>>> ./hatchling-1.13.0.dist-info/licenses
>>>> ./pathspec-0.11.0.dist-info
>>>> ./importlib_metadata-6.0.0.dist-info
>>>> ./setuptools-67.4.0.dist-info
>>>> ./wheel-0.38.4.dist-info
>>>> ./installer-0.6.0.dist-info
>>>> ./setuptools-67.6.0.dist-info
>>>> ./packaging-23.0.dist-info
>>>> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages$ find -type d -empty -delete
>>>>
>>>> After which the compile succeeds. These empty dist-info directories
>>>> really upset the build. They're left behind by the sstate cleanup code
>>>> from when I have older versions of these python modules in play since
>>>> the sstate code can race over directory removal. Is there a way to make
>>>> python ignore them? Otherwise should we remove them somewhere?
>>>>
>>>> I suspect you can recreate by adding these empty directories and
>>>> running a -c compile -f. I've seen it with plenty of other python
>>>> modules too.
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>>>
>>>>
>>>>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182013): https://lists.openembedded.org/g/openembedded-core/message/182013
> Mute This Topic: https://lists.openembedded.org/mt/99241972/4619944
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [chaoscodecircuits@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

