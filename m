Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A112C71136
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 18:36:28 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.2880.1749666978776579311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 11:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mpSqWM8P;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: zboszor@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86cf9f7abc4so10477039f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 11:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749666978; x=1750271778; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Drh3YpONfXf9+az234XAmJEs6DvGl50/qV9vbE/C0kU=;
        b=mpSqWM8PCTWMhSpS2p+eT0N+cwawpFVYUTaYut3Vwl677i2YN5PX8svA8G1t/ZQggi
         knXOaL49hbTSlZO+yJK2BAlrZwv7Bm7CjfqOclyuHL+7K8+JaKBS6TsS6DpSMcE+/BNy
         JcoGSjsJZqi3Sj42TVIe8lgkxKqvpEBVoCr9yCaI4tLATel/Bj7ClAwh0aaS+cFSEXRa
         hDP8MWmGKT6U1p0l2R1+TUhHWtPar8pixJa04FSQEEZyou6AyqxCDaTGT9hfEQM1YcGZ
         92rHKJsWMyR47cIMcvZD6fL1XlHb+Efu4eV/lD4U4dqH/1Zy1A++QJwdf4yBET4rSWmo
         OLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749666978; x=1750271778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Drh3YpONfXf9+az234XAmJEs6DvGl50/qV9vbE/C0kU=;
        b=mhWnw6C1md0i0EsTiC+1gd4EbsZ7Wv/o3v+PMQXbnX6wCyKWn89oIMSsS5CjMa05jR
         iZLx7qu8Bob6DZrIOJp9LX+RBPyv1Lp3B+CAIm9KoSXYIELDWZvISw8vyr6dN5MDefo+
         lyRxUdXPH5IKFMeuPj8Qk8qfChZnleidtlEkuaNmfX9yAy58NScdRNK2GybzU2DxId9V
         4GuLFm+wbnkeAnZlUIh+ZfrrQZ2oBmSUFSA2xCd5tHl/HyCPulwbczsVNplB88vUM3nW
         UzDCunTn/J1h15Sv5e9NBQwaL+kMtPPrvz/PQVmHtSOde5viXO2xek/pcL/EnR0cZqF0
         cJ2Q==
X-Gm-Message-State: AOJu0YzqI5s+I3b94VPRapHsz0r2n6EMDVPMgzXJHrHSIcf4LT0ubxQD
	lzoi6kCPcgHA9G6/p2GhHzgxwAt/GJzOuf3weWbv6EOq+q3TNlP0xjd3
X-Gm-Gg: ASbGncsH4he8ewdMvGiGnYK7Y+KUJujk6CLB7Gjk0D2D/DJAPy6Vnavf+D8AaQfAvvB
	PalescF82QWXQOldoAnqs/JlQruLOLVUzOMBtGqjf9X1YLATzzmilo2yJXST4lvxhCx1nVoBW9v
	hBK/TepXk5JD1mIkhIicwB6KSw0gw5JaIaGbSx1OrcvROm4o4j3WoDG3SJqet4pk5e05/14Acv/
	Am52MF4RpUMEjs1JF4KYKpHUprE5JhCUYfOVGoFotXJzTwBff+hk4zZf6jk/po+vcw5iQ0MR9Z9
	SV9cpsYfiP41HLN/ICARt6sS30QAYieryIywhawV81LoPmxl4XhMHxt4dQY/NiNAMk9GT6/nncd
	zRIF9PHW6rKD746I1s3A=
X-Google-Smtp-Source: AGHT+IEv2jcD+SLld4bEljE8eYl3FLnBFsnObIfP8v41lKS00DdOWZAf9t+LyaafZZ5jQsD3IIQjzg==
X-Received: by 2002:a05:6602:2770:b0:873:47c7:6ff3 with SMTP id ca18e2360f4ac-875bc47a4e1mr559466539f.7.1749666977846;
        Wed, 11 Jun 2025 11:36:17 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5012aacc252sm501441173.116.2025.06.11.11.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 11:36:17 -0700 (PDT)
Message-ID: <63ef3071-74eb-4caf-a08e-77d91bf82c44@gmail.com>
Date: Wed, 11 Jun 2025 20:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: Fix bindgen includes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
References: <20250610142413.681911-1-zboszor@gmail.com>
 <CAO9ioeUn24ndJqaH1O8B0G+mB8JKx_JcROXhzJqrw36L84bmNw@mail.gmail.com>
 <8e9387de-14f0-4def-a41e-3b8aeaa178a0@gmail.com>
 <8155d605-c759-4645-a82a-15ef65f95e66@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <8155d605-c759-4645-a82a-15ef65f95e66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 18:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218468

2025. 06. 11. 19:34 keltezéssel, Dmitry Baryshkov írta:
> On 11/06/2025 13:46, Böszörményi Zoltán wrote:
>> 2025. 06. 10. 21:49 keltezéssel, Dmitry Baryshkov via lists.openembedded.org írta:
>>> On Tue, 10 Jun 2025 at 17:24, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>>> Add a patch to fix bindgen errors due to not finding headers
>>>> in the system, like:
>>>>
>>>> |...
>>>> | ../mesa-25.1.2/src/gallium/frontends/rusticl/ rusticl_llvm_bindings.hpp:1:10: fatal 
>>>> error: 'clang/Basic/Version.h' file not found
>>>> | Unable to generate bindings: clang diagnosed error: ../mesa-25.1.2/ 
>>>> src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10: fatal error: 
>>>> 'clang/Basic/Version.h' file not found
>>>> |...
>>>> | .../work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./GL/ glx.h:30:10: 
>>>> fatal error: 'X11/Xlib.h' file not found
>>>> | Unable to generate bindings: clang diagnosed error: /data2/dtd- 
>>>> yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/ 
>>>> include/./GL/glx.h:30:10: fatal error: 'X11/Xlib.h' file not found
>>> Can we fix this on the meson side by passing additional include path
>>> through the cross file?
>>
>> This seems to work in mesa.inc without patching Mesa:
>>
>> CFLAGS:append:class-target = " -I${STAGING_INCDIR}"
>> CXXFLAGS:append:class-target = " -I${STAGING_INCDIR}"
>
> My question was more about meson.bbclass, where we set bindgen_clang_args. See the 
> bindgen_args() function.

I wouldn't change meson.bbclass because it works for the
most recipes already.

Besides, it seems to be a meson bug, not a meson.bbclass bug
as -isystem and other include path related flags (besides -I) are
ignored in CFLAGS/CXXFLAGS.

The "clang diag" messages are likely coming from mixed up host
vs target header paths.

See
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35435#note_2952621
https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/rust.py#L392-L397

If we changed meson.bbclass to add -I${STAGING_INCDIR} to
the proper places in meson.cross, it would still print the
clang diag warning. Adding -isystem would still get ignored.

FWIW, --sysroot is also ignored by meson and adding it forcibly
throws a different error. See
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35435#note_2952805

¯\_(ツ)_/¯

>> but it also[1] prints this for some of the bindgen runs:
>>
>> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/ 
>> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:95:11: warning: '__INT64_C' macro 
>> redefined [-Wmacro-redefined]
>> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/ 
>> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:96:11: warning: '__UINT64_C' macro 
>> redefined [-Wmacro-redefined]
>>
>> [1] Using the previously posted patch also prints the same.
>>
>> It seems to be caused by a meson bug because it doesn't
>> collect the -isystem or --sysroot flags for rust/bindgen.
>> See the discussion at the MR link in the patch.
>>
>> CFLAGS and CXXFLAGS changes are both needed because
>> bindgen is run on both .h and .hpp files for rusticl.
>>
>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>> ---
>>>>   ...w-build-option-for-extra-bindgen-inc.patch | 57 +++++++++++++++++++
>>>>   meta/recipes-graphics/mesa/mesa.inc           |  3 +-
>>>>   2 files changed, 59 insertions(+), 1 deletion(-)
>>>>   create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl- 
>>>> Add-a-new-build-option-for-extra-bindgen-inc.patch
>>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#218438): https://lists.openembedded.org/g/ 
>>> openembedded-core/message/218438
>>> Mute This Topic: https://lists.openembedded.org/mt/113570520/3617728
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>
>
>


