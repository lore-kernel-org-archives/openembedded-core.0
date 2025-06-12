Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE72C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 04:23:42 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.5159.1749702221712458395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 21:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=csoQc+V7;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: zboszor@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-86cfc1b6dcaso19901139f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 21:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749702221; x=1750307021; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gqk0H0a+Vst48UioXQ4EtFGEXLvdwmI9i69aTrpOOkE=;
        b=csoQc+V7U2xwOF0H6svxPZzvc9Uij5Lf3dP07JB4wUu6OGkbs7gYo3o+B/HfLF18Cn
         EjWWjtNPAczvBWZCRQ4RsjFoKITxomaYsu3geNEjgBXv7UgtewrjCuULff91Ughc9Vv+
         LHVNDTfil38VQid92y58Mie27eN22LDM49T5VKhShkC24pL+Tk8gtGHtHKSaHfatw4+t
         ag+ddmn5xMsv6dMndYWZoTG2nxrRxKYrq3iwGjfaTxI1F9/lmrCBWrvEf3uuIR32M/C8
         2/udjJh0CUNNZGvqVEKPjJFIWq4S68LBYwCeCZmrxVJMyc9unEPiCYp2LfnbdSt/ONGX
         PGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749702221; x=1750307021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gqk0H0a+Vst48UioXQ4EtFGEXLvdwmI9i69aTrpOOkE=;
        b=A+JgqCxsYHkWaZFDIv5IsnqsadF8ADhpiDf7O4QBl6X+HZzCw97m4paaFe/rRpHhxr
         gvoFmBI+6T1GsNxOnN91Yrjr6E8m/XpRHRVmk8YfH6pAt2ZAsgh+GN1C6NwPYGyzJPd0
         5D+NFCag9jDrl2GuTXh173ckUyMjTXlHorEpLybsvFpFJV3WhLgrw+6wbHQFb8Pk6rH6
         DPtQyS+2pR9ecb1UuIA4CHTCjZR8ijNDuAEKlUNHPdr6yPPPUNHlHNlQjb7Jkh4Uwula
         3niHntCynrPCn5mWs9Lngi8s+0ii7np7GYP38cKQPUj9OmwoaS5zwBhKEJh5J9BEY4dM
         XoZA==
X-Gm-Message-State: AOJu0YzZFMmWdayVi9l97T+omziAZf/Hu/aXq1bEgpIS/D123e+2eHA/
	VynUCm7+i1qb86oGu6wCbdWI77UG4NG19CiAQFHNIMSEt8duTvmlYPFD
X-Gm-Gg: ASbGncv1wnyLX5fWBBg21o97+TUzFWvdgbt8vUlBYJ3jRfe5VEYjGCkir9b231SndR4
	Iz4DQF+nHl1Z6aW0Tjkzd55+nkvW6U+o9dTQyrHFdu/4M4mTWrI1EyhE5hZr3URhYg7i2dqao1o
	Xot7WCJNtLcTDThYgh77sm2sDgZAjt5jvHa6tadPU00k7UCD6ZK8kzAxeHDdPKkG1f/ih5+S3KF
	ZYTevYhxvQtqqbdkwbiyqViGkV2jTDPuaIZGXEweJJDcB6R3t7wIyIVu7dMldV452/32LSRpjp+
	Xhk5Ak5uSWZXILkGGRPD2c5Z74o7YC85xz1KTXotZ9AJ8xhjcryYpJqsPyCfVi0Ty4/EBRkPie0
	Ld1Ca6tG/FGL7Eem/n80=
X-Google-Smtp-Source: AGHT+IHtZQRC9KrlKVIJe1vwIwNYGkkE4/nMGjI+Ezjd76eBJZ3CaDQ29K+Bx9HrAfalRx+3nh36yQ==
X-Received: by 2002:a05:6602:7512:b0:86a:24a7:cecb with SMTP id ca18e2360f4ac-875bc3e0aafmr872490539f.4.1749702220725;
        Wed, 11 Jun 2025 21:23:40 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5013b799f81sm130896173.58.2025.06.11.21.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 21:23:39 -0700 (PDT)
Message-ID: <96fc5917-bd69-41e3-892e-b683fd635b9e@gmail.com>
Date: Thu, 12 Jun 2025 06:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: Fix bindgen includes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
References: <20250610142413.681911-1-zboszor@gmail.com>
 <CAO9ioeUn24ndJqaH1O8B0G+mB8JKx_JcROXhzJqrw36L84bmNw@mail.gmail.com>
 <8e9387de-14f0-4def-a41e-3b8aeaa178a0@gmail.com>
 <8155d605-c759-4645-a82a-15ef65f95e66@oss.qualcomm.com>
 <63ef3071-74eb-4caf-a08e-77d91bf82c44@gmail.com>
 <CAO9ioeVE94tAha_o0Q1tcP-2LhD6YAVtLUMkqACr4q55=ahgVQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAO9ioeVE94tAha_o0Q1tcP-2LhD6YAVtLUMkqACr4q55=ahgVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 04:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218474

2025. 06. 11. 21:32 keltezéssel, Dmitry Baryshkov írta:
> On Wed, 11 Jun 2025 at 21:36, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2025. 06. 11. 19:34 keltezéssel, Dmitry Baryshkov írta:
>>> On 11/06/2025 13:46, Böszörményi Zoltán wrote:
>>>> 2025. 06. 10. 21:49 keltezéssel, Dmitry Baryshkov via lists.openembedded.org írta:
>>>>> On Tue, 10 Jun 2025 at 17:24, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>>>>> Add a patch to fix bindgen errors due to not finding headers
>>>>>> in the system, like:
>>>>>>
>>>>>> |...
>>>>>> | ../mesa-25.1.2/src/gallium/frontends/rusticl/ rusticl_llvm_bindings.hpp:1:10: fatal
>>>>>> error: 'clang/Basic/Version.h' file not found
>>>>>> | Unable to generate bindings: clang diagnosed error: ../mesa-25.1.2/
>>>>>> src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10: fatal error:
>>>>>> 'clang/Basic/Version.h' file not found
>>>>>> |...
>>>>>> | .../work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./GL/ glx.h:30:10:
>>>>>> fatal error: 'X11/Xlib.h' file not found
>>>>>> | Unable to generate bindings: clang diagnosed error: /data2/dtd-
>>>>>> yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/
>>>>>> include/./GL/glx.h:30:10: fatal error: 'X11/Xlib.h' file not found
>>>>> Can we fix this on the meson side by passing additional include path
>>>>> through the cross file?
>>>> This seems to work in mesa.inc without patching Mesa:
>>>>
>>>> CFLAGS:append:class-target = " -I${STAGING_INCDIR}"
>>>> CXXFLAGS:append:class-target = " -I${STAGING_INCDIR}"
>>> My question was more about meson.bbclass, where we set bindgen_clang_args. See the
>>> bindgen_args() function.
>> I wouldn't change meson.bbclass because it works for the
>> most recipes already.
> The bindgen_args was implemented for mesa as the first user. It is not
> frequent for the packaged software to use rust.bindgen.
>
>> Besides, it seems to be a meson bug, not a meson.bbclass bug
>> as -isystem and other include path related flags (besides -I) are
>> ignored in CFLAGS/CXXFLAGS.
>>
>> The "clang diag" messages are likely coming from mixed up host
>> vs target header paths.
>>
>> See
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35435#note_2952621
>> https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/rust.py#L392-L397
>>
>> If we changed meson.bbclass to add -I${STAGING_INCDIR} to
>> the proper places in meson.cross, it would still print the
>> clang diag warning. Adding -isystem would still get ignored.
> Are we ta

???

>> FWIW, --sysroot is also ignored by meson and adding it forcibly
>> throws a different error. See
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35435#note_2952805
> How were you passing it? Via CFLAGS / CPPFLAGS or via bindgen args?

Using  this patch and -Dbindgen-sysroot=${STAGING_DIR_TARGET}
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35435/diffs?commit_id=a82381aeaba32775db51080b823893e4b6f647fb

--sysroot is not passing through to bindgen from CFLAGS/CXXFLAGS
due to the filtering of flags in meson by the already qouted code piece at
https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/rust.py#L392-L397

>> ¯\_(ツ)_/¯
>>
>>>> but it also[1] prints this for some of the bindgen runs:
>>>>
>>>> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/
>>>> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:95:11: warning: '__INT64_C' macro
>>>> redefined [-Wmacro-redefined]
>>>> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/
>>>> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:96:11: warning: '__UINT64_C' macro
>>>> redefined [-Wmacro-redefined]
>>>>
>>>> [1] Using the previously posted patch also prints the same.
>>>>
>>>> It seems to be caused by a meson bug because it doesn't
>>>> collect the -isystem or --sysroot flags for rust/bindgen.
>>>> See the discussion at the MR link in the patch.
>>>>
>>>> CFLAGS and CXXFLAGS changes are both needed because
>>>> bindgen is run on both .h and .hpp files for rusticl.
>>>>
>>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>> ---
>>>>>>    ...w-build-option-for-extra-bindgen-inc.patch | 57 +++++++++++++++++++
>>>>>>    meta/recipes-graphics/mesa/mesa.inc           |  3 +-
>>>>>>    2 files changed, 59 insertions(+), 1 deletion(-)
>>>>>>    create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-
>>>>>> Add-a-new-build-option-for-extra-bindgen-inc.patch
>>>>>>
>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#218438): https://lists.openembedded.org/g/
>>>>> openembedded-core/message/218438
>>>>> Mute This Topic: https://lists.openembedded.org/mt/113570520/3617728
>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>
>>>
>


