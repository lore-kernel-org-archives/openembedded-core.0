Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C237AC4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 10:49:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.60100.1702637370297142847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 02:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=k+y917gU;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so5327775e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 02:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702637369; x=1703242169; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=int/T2wvNJQdguDTCtZnnLFS141ssUQZM4UaFMISW1s=;
        b=k+y917gUQgZ/91xWoEIGt4Qd6jPGQ5XlMX1s4PXjTfUB+Ef9vXLu1bkURdHUc/AlGW
         QzhAvjB3C+p5NtnyVlEFSAdR4+2kZanmhFIf6gyNHqNmV0lilp0rJz7hXkWfQIEVBJOl
         0srIb9U6pXkdiBfqYRSa+nWbtnb+jC+gdI2AUnNCXz8v+znwp7PEdKzoddQKe/0KSkuF
         NP/+sxcEXBTrZHThNnKdTAhST8eBLZUj66jUdB7sir9sid1rla2acWsoR40C6wkIYQaF
         e//8OznwVEMVcoSqNuiPm2/6ydPBWeUGlRTcPbBFGQHv46uoI/O/JnYp0wiMjwyGkO8o
         rvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702637369; x=1703242169;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=int/T2wvNJQdguDTCtZnnLFS141ssUQZM4UaFMISW1s=;
        b=GCENSxQvwwGRAmO/WZizJGDbAGUSWxmgPItmY1mzFAQwQZoQp2Ba/OWbC0Kyopqn4v
         QG2AYzmO/Mnvs6ByZE0OaZYaV7iLj211+MVztfrdzq1D/LqFW5+COuaRlC38rzCPImQ1
         IWpUr8S+aKo4/ljQh/tHu3S1fzrBHHqn0iYdkurTExd1kbP6ev9SQCSMpoFN7AQVIQJy
         MG8reWRr4p2cDamaiA2jNknq8/SDwOV2H8AMwnVUlhN5KL4hG5L6IxZTM/CgSO9w7HDy
         ZCwXobK3Lp/Vd8HJ7aHbn5fOUFyfgTBwMJ6XPgkChCIFrFuCGcuR3ckCmrqeXo0BWHN6
         JMXg==
X-Gm-Message-State: AOJu0YwaRRO1+PBqaCLDJCjmxTUc74GTrBXPXMk8wJCw1nFVZx3Fo4QZ
	Dr1D+tJsE3lZynf7MpcELSk7Xw==
X-Google-Smtp-Source: AGHT+IGGe9jB9VwaSq7ib8mINVy6q9MiPTXptI0wG9DgUoB4uyOZrgFUjAhqX9BZLsCDFh4avM8BSQ==
X-Received: by 2002:a05:600c:45c8:b0:40c:6d83:4721 with SMTP id s8-20020a05600c45c800b0040c6d834721mr99575wmo.319.1702637368628;
        Fri, 15 Dec 2023 02:49:28 -0800 (PST)
Received: from [192.168.0.28] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b0040c2963e5f3sm28399785wmb.38.2023.12.15.02.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 02:49:28 -0800 (PST)
Message-ID: <18825c98-a4bf-4918-833d-a797a9e5ac74@smile.fr>
Date: Fri, 15 Dec 2023 11:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
 <CAMKF1spsMdx55xzBT9VEb51my-fE4GeLCq5m3do-5-8AKr-BqQ@mail.gmail.com>
 <20231214193346baddfca0@mail.local>
 <CAMKF1soTi3X-eZf6+pd+hS3FpTvxSO7kR4ievYgM_F2N_8AVFA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CAMKF1soTi3X-eZf6+pd+hS3FpTvxSO7kR4ievYgM_F2N_8AVFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 10:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192425



Le 14/12/2023 à 20:36, Khem Raj a écrit :
> On Thu, Dec 14, 2023 at 11:33 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>>
>> On 14/12/2023 10:53:05-0800, Khem Raj wrote:
>>> On Thu, Dec 14, 2023 at 1:10 AM Alexander Kanavin
>>> <alex.kanavin@gmail.com> wrote:
>>>>
>>>> On Wed, 13 Dec 2023 at 09:57, Yoann Congal <yoann.congal@smile.fr> wrote:
>>>>>
>>>>> The bluetooth support adds a bluez5 dependency (and,recursively, a lot
>>>>> of other stuff). Disable it by default to avoid having to build all of
>>>>> this when it is not needed.
>>>>>
>>>>> This decrease the number of tasks run for a core-image-minimal build by
>>>>> ~1000 (-21%).
>>>>>
>>>>> To re-enable bluetooth support in strace, add "bluez" to strace
>>>>> PACKAGECONFIG. For example, in local.conf:
>>>>>   PACKAGECONFIG:append:pn-strace = " bluez"
>>>>>
>>>>> Fixes [YOCTO #15323]
>>>>
>>>> I'm afraid I have to raise objections.
>>>>
>>>> First, this needs an explanation: what functionality in strace does
>>>> this disable? Is that functionality important from the point of having
>>>> bluetooth in DISTRO_FEATURES? Not respecting DISTRO_FEATURES sets a
>>>> bad precedent, and should be more carefully justified and treated as
>>>> an exception.
>>>>
>>>> Second, why is strace even needed in the context of
>>>> core-image-minimal? It's not installed into the image, so I went and
>>>> checked:
>>>> util-linux-ptest needs mdadm
>>>> mdadm-ptest needs strace.
>>>
>>> I looked briefly into util-linux pertaining to mdadm needs in tests, there
>>> are 4 tests needing it.
>>> md-raid0-whole, md-raid1-part, md-raid1-whole, align-512-4K-md
>>>
>>> and all of them are marked as
>>> TS_KNOWN_FAIL="yes"
>>>
>>> See https://github.com/util-linux/util-linux/commit/7519c3edab120b14623931d5ddb16fdc6e7cad5d
>>>
>>> I think we can skip running these tests as well and safely avoid
>>> depending upon mdadm for util-linux ptests which can break the depchain as well.
>>>
>>
>> I think dropping the mdam ptests was the plan seeing the amount of
>> breakage this does on the AB.
> 
> Good deal, I also see them happening on musl so I went ahead and cooked a patch
> and posted it on ml. Musl util-linux ptests have 4 less fails now.

FYI, since Khem's patch ([OE-core] [PATCH] util-linux: Delete md-raid tests) also prevent bluez to be built in a default core-image-minimal build, we can skip this one (strace: Disable bluetooth support by default) and still fix [YOCTO #15323].

>>
>>>>
>>>> Which begs the question. Should we continue to enable ptest by default
>>>> in poky? Should we create and use a ptest-less distro configuration?
>>>> It does pull in a ton of extra stuff all over the place which
>>>> lengthens the builds a lot. And the resulting ptest packages aren't
>>>> even used until one explicitly requests one of the ptest images.
>>>>
>>>> As an example, I saw an oe-selftest-armhost yesterday, which ran
>>>> nearly 17 hours:
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2587
>>>>
>>>> If you go and look at what tests in it took the longest time, you see:
>>>> 2023-12-13 15:45:22,812 - oe-selftest - INFO - RESULTS -
>>>> runtime_test.Postinst.test_postinst_rootfs_and_boot_systemd: PASSED
>>>> (32620.46s)
>>>> 2023-12-13 15:45:22,794 - oe-selftest - INFO - RESULTS -
>>>> prservice.BitbakePrTests.test_import_export_override_db: PASSED
>>>> (12789.45s)
>>>> 2023-12-13 15:45:22,789 - oe-selftest - INFO - RESULTS -
>>>> overlayfs.OverlayFSEtcRunTimeTests.test_all_required_variables_set:
>>>> PASSED (35205.79s)
>>>> 2023-12-13 15:45:22,781 - oe-selftest - INFO - RESULTS -
>>>> minidebuginfo.Minidebuginfo.test_minidebuginfo: PASSED (15395.76s)
>>>> 2023-12-13 15:45:22,782 - oe-selftest - INFO - RESULTS -
>>>> multiconfig.MultiConfig.test_multiconfig: PASSED (11098.06s)
>>>> 2023-12-13 15:45:22,776 - oe-selftest - INFO - RESULTS -
>>>> incompatible_lic.IncompatibleLicensePerImageTests.test_bash_and_license:
>>>> PASSED (24012.67s)
>>>> 2023-12-13 15:45:22,775 - oe-selftest - INFO - RESULTS -
>>>> imagefeatures.ImageFeatures.test_mandb: PASSED (19394.74s)
>>>> 2023-12-13 15:45:22,762 - oe-selftest - INFO - RESULTS -
>>>> devtool.DevtoolExtractTests.test_devtool_build_image: PASSED
>>>> (27341.75s)
>>>> 2023-12-13 15:45:22,760 - oe-selftest - INFO - RESULTS -
>>>> debuginfod.Debuginfod.test_debuginfod_qemu: PASSED (25784.11s)
>>>> 2023-12-13 15:45:22,759 - oe-selftest - INFO - RESULTS -
>>>> containerimage.ContainerImageTests.test_expected_files: PASSED
>>>> (19453.84s)
>>>> 2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
>>>> buildoptions.SanityOptionsTest.test_options_warnqa_errorqa_switch:
>>>> PASSED (10492.68s)
>>>> 2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
>>>> buildoptions.ToolchainOptions.test_toolchain_fortran: PASSED
>>>> (11367.46s)
>>>> 2023-12-13 15:45:22,743 - oe-selftest - INFO - RESULTS -
>>>> baremetal.BaremetalTest.test_baremetal: PASSED (24196.04s)
>>>>
>>>> The same a-full selftest, but on a x86 host has these times, quicker
>>>> than arm but still measured in hours:
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6179/steps/15/logs/stdio
>>>>
>>>> What do most of these tests do? They do indeed build
>>>> core-image-minimal (sometimes full-cmdline or some other images), and
>>>> sometimes in multiple variants within a single test. But they never
>>>> use ptest. And so we need to find a way to make it happen faster.
>>>>
>>>> I'm going to get some numbers, first without any changes, then with
>>>> your proposed change, then with ptest dropped - this will take a bit
>>>> of time, so I wanted to get the concerns written and sent first.
>>>>
>>>> Alex
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#192339): https://lists.openembedded.org/g/openembedded-core/message/192339
>>>> Mute This Topic: https://lists.openembedded.org/mt/103146402/1997914
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>
>>
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com

-- 
Yoann Congal
Smile ECS - Tech Expert

