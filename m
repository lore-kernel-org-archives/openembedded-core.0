Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3359FC71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 13:49:05 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.13433.1749736138312365339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 06:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CjiOHnQA;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: zboszor@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86cf9f46b06so30933739f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749736137; x=1750340937; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SbC+putm6kkNmncw+kU8TeUDGP/2YQeSW22DHBbAAms=;
        b=CjiOHnQASOymBZmanguTeGvuDHbvMuu9vTUtPpN08novRXK3YZN+yyC5qLdnasvozG
         sx6RsOjVWCCgsaGLqmOIpWXtqKqs9UP+IfwmkLdgyf3ZkGh5p3hOTIrgJRKpt7YVbK1O
         Um79DuJIh5lm4bLBpY5S+N/wRna/XNi3sSmf1SeG5YclYiBt//O9x0z14mn+k3FOHr+X
         9tbDczV9sKRgTrpXUX4Ln0WKbBiWSqdslqQq/sw13/TNsNBf0HfJkvLpVqflHmDoiCVJ
         cgC7HH5uYqc8ZELSuwBAgDziTZBkqTVZEEoIRy3y305wPO75YAT0CuGuVeOrLowhkiTn
         OdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736137; x=1750340937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbC+putm6kkNmncw+kU8TeUDGP/2YQeSW22DHBbAAms=;
        b=EKLEx3DMe7bUI7bVrzzBwvNyG1LgNPJeh2P9csolvUiDLPyBtBAEPlcF0SyMZFWPDW
         racLB8/6K4eCUbjtisBCfTz8Ql8l/D2ArG2bdm65tahG56F2LLO+n+3WeBmdjz+Iopym
         jHxhpPWWKTNmgH75fPl5aDtfTe+HiDYT/Csd9JuMKPypIwCDvVuRy9CusTrewVgq7pbS
         SHS8blIGqx02oHHWoC4UtCYmQNPGD6mC5I4+jMl5A5rFAu69Hxsz/ZkxxFrNz3T7pKx2
         hxltWf45xHk/0mOnzDd6imtRYFWvdoXijOTOyRCfUozX+U1NLIult0hDhJN+eGY+/srB
         /o3w==
X-Gm-Message-State: AOJu0YxgsQh7gJ9DD6/clppfWWhzC3GdgpRMv+1k1zx1Am/g8m4l3wtX
	6Gq34SJW6kWDRuZgK3JYH3cVIhbk58Hy1vEcdvGhl7S8aYkMEnf905hO
X-Gm-Gg: ASbGncsH3l4MHzUMXI4NYGo6RUqS1BLgu2EmukAr0JN6tKO4i+Pb5AySTbCoeSO6hx9
	fchxgFNJfMJc5FIMjJyFpIpXShIKrKi4J0wt1l99C9RUqFHNqgDLPdpln0LcAQOJ0fT4hPrIgpG
	T94Mep/CtVZh24JEwqMA433+e/8n5ensaN6ucxd4moRy1Sqz9Wl1+Pg+Lo0aC22FC9JZIh+/oxs
	B70daZdNIKftdgbR4Fst0uS5Nk1BxAdEu3uJHA6M7/8v3LSPo7oy48NJlZhJZO9nlLpq4mdFzG2
	qUFFEmFdL+LYPXsLLlHzpGAx8TrK0vTaCPCevfEMcTC06QADfqyVllt7wwmeaeT6OlUs2uR4Qlq
	q7lWlNbjdLrxafyU3zHQ=
X-Google-Smtp-Source: AGHT+IGkByLBDHpwc3CQtzJNhjXRxwpjxLq1rH0LYTjCF+IsOuS0AQhVVkngt0AuhLsuV554xvMJlQ==
X-Received: by 2002:a05:6602:2b15:b0:86c:fed2:90bb with SMTP id ca18e2360f4ac-875c5eb7333mr482598439f.14.1749736137307;
        Thu, 12 Jun 2025 06:48:57 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5013b8da9efsm300809173.112.2025.06.12.06.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:48:56 -0700 (PDT)
Message-ID: <1dc9e6d0-f7ee-4e13-9439-65c65353afaf@gmail.com>
Date: Thu, 12 Jun 2025 15:48:54 +0200
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
 <96fc5917-bd69-41e3-892e-b683fd635b9e@gmail.com>
 <6ce1ccba-2d62-4cb2-b327-9dd81a942765@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <6ce1ccba-2d62-4cb2-b327-9dd81a942765@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 13:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218519

2025. 06. 12. 10:08 keltezéssel, Dmitry Baryshkov írta:
> On 12/06/2025 07:23, Böszörményi Zoltán wrote:
>> 2025. 06. 11. 21:32 keltezéssel, Dmitry Baryshkov írta:
>>> On Wed, 11 Jun 2025 at 21:36, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>> 2025. 06. 11. 19:34 keltezéssel, Dmitry Baryshkov írta:
>>>>> On 11/06/2025 13:46, Böszörményi Zoltán wrote:
>>>>>> 2025. 06. 10. 21:49 keltezéssel, Dmitry Baryshkov via lists.openembedded.org írta:
>>>>>>> On Tue, 10 Jun 2025 at 17:24, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>>>>>>> Add a patch to fix bindgen errors due to not finding headers
>>>>>>>> in the system, like:
>>>>>>>>
>>>>>>>> |...
>>>>>>>> | ../mesa-25.1.2/src/gallium/frontends/rusticl/ rusticl_llvm_bindings.hpp:1:10: 
>>>>>>>> fatal
>>>>>>>> error: 'clang/Basic/Version.h' file not found
>>>>>>>> | Unable to generate bindings: clang diagnosed error: ../ mesa-25.1.2/
>>>>>>>> src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10: fatal error:
>>>>>>>> 'clang/Basic/Version.h' file not found
>>>>>>>> |...
>>>>>>>> | .../work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./ GL/ glx.h:30:10:
>>>>>>>> fatal error: 'X11/Xlib.h' file not found
>>>>>>>> | Unable to generate bindings: clang diagnosed error: /data2/dtd-
>>>>>>>> yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/
>>>>>>>> include/./GL/glx.h:30:10: fatal error: 'X11/Xlib.h' file not found
>>>>>>> Can we fix this on the meson side by passing additional include path
>>>>>>> through the cross file?
>>>>>> This seems to work in mesa.inc without patching Mesa:
>>>>>>
>>>>>> CFLAGS:append:class-target = " -I${STAGING_INCDIR}"
>>>>>> CXXFLAGS:append:class-target = " -I${STAGING_INCDIR}"
>>>>> My question was more about meson.bbclass, where we set bindgen_clang_args. See the
>>>>> bindgen_args() function.
>>>> I wouldn't change meson.bbclass because it works for the
>>>> most recipes already.
>>> The bindgen_args was implemented for mesa as the first user. It is not
>>> frequent for the packaged software to use rust.bindgen.
>>>
>>>> Besides, it seems to be a meson bug, not a meson.bbclass bug
>>>> as -isystem and other include path related flags (besides -I) are
>>>> ignored in CFLAGS/CXXFLAGS.
>>>>
>>>> The "clang diag" messages are likely coming from mixed up host
>>>> vs target header paths.
>>>>
>>>> See
>>>> https://gitlab.freedesktop.org/mesa/mesa/-/ merge_requests/35435#note_2952621
>>>> https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/ rust.py#L392-L397
>>>>
>>>> If we changed meson.bbclass to add -I${STAGING_INCDIR} to
>>>> the proper places in meson.cross, it would still print the
>>>> clang diag warning. Adding -isystem would still get ignored.
>>> Are we ta
>>
>> ???
>>
>>>> FWIW, --sysroot is also ignored by meson and adding it forcibly
>>>> throws a different error. See
>>>> https://gitlab.freedesktop.org/mesa/mesa/-/ merge_requests/35435#note_2952805
>>> How were you passing it? Via CFLAGS / CPPFLAGS or via bindgen args?
>>
>> Using  this patch and -Dbindgen-sysroot=${STAGING_DIR_TARGET}
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35435/diffs? 
>> commit_id=a82381aeaba32775db51080b823893e4b6f647fb
>>
>> --sysroot is not passing through to bindgen from CFLAGS/CXXFLAGS
>> due to the filtering of flags in meson by the already qouted code piece at
>> https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/ rust.py#L392-L397
>
> Can we pass those flags via bindgen_clang_args? If I understand correctly, then they 
> will bypass all the filtering.

You mean these changes from master?

commit 40008d55c01681c60088e5b7defb0b8513a4ed1c
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date:   Fri Apr 18 03:57:12 2025 +0300

     meson: pass -target and -I to bindgen calls

     In order to properly generate Rust bindings for the target systems, we
     need to pass '-taget foo-linux-gnueabi' flags and a correct include
     target include path (${STAGING_INCDIR}) to the bindgen. Add those
     flags to the generated meson target file.

     Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

and

commit a647a0ff4c4eb7a7c1f6ec84a574f7d7796b6178
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date:   Mon May 5 19:22:30 2025 -0700

     meson: correct bindgen_clang_argments

     Follow the changes in Clang search paths and specify sysroot via the
     TOOLCHAIN_OPTIONS, otherwise clang will fail to find system headers when
     executed by bindgen.

     For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path, so
     specify the correct directory explicitly.

     Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
     Signed-off-by: Khem Raj <raj.khem@gmail.com>
     Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Hurray, they help building the backported mesa recipe on Yocto 5.2.

These two commits should be backported to walnascar. Pretty please.

>
>>
>>>> ¯\_(ツ)_/¯
>>>>
>>>>>> but it also[1] prints this for some of the bindgen runs:
>>>>>>
>>>>>> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/
>>>>>> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:95:11: warning: '__INT64_C' macro
>>>>>> redefined [-Wmacro-redefined]
>>>>>> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/
>>>>>> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:96:11: warning: '__UINT64_C' macro
>>>>>> redefined [-Wmacro-redefined]
>>>>>>
>>>>>> [1] Using the previously posted patch also prints the same.
>>>>>>
>>>>>> It seems to be caused by a meson bug because it doesn't
>>>>>> collect the -isystem or --sysroot flags for rust/bindgen.
>>>>>> See the discussion at the MR link in the patch.
>>>>>>
>>>>>> CFLAGS and CXXFLAGS changes are both needed because
>>>>>> bindgen is run on both .h and .hpp files for rusticl.
>>>>>>
>>>>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>>> ---
>>>>>>>>    ...w-build-option-for-extra-bindgen-inc.patch | 57 +++++++++++ ++++++++
>>>>>>>>    meta/recipes-graphics/mesa/mesa.inc           | 3 +-
>>>>>>>>    2 files changed, 59 insertions(+), 1 deletion(-)
>>>>>>>>    create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-
>>>>>>>> Add-a-new-build-option-for-extra-bindgen-inc.patch
>>>>>>>>
>>>>>>>
>>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>> Links: You receive all messages sent to this group.
>>>>>>> View/Reply Online (#218438): https://lists.openembedded.org/g/
>>>>>>> openembedded-core/message/218438
>>>>>>> Mute This Topic: https://lists.openembedded.org/mt/113570520/3617728
>>>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/ unsub 
>>>>>>> [zboszor@gmail.com]
>>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>>
>>>>>
>>>
>>
>
>


