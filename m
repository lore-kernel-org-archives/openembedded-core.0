Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.16421.1604948359376141763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 10:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QbNHnmEm;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id g17so6780458qts.5
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 10:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JiQ66mYfyBCCF6F99e/X/Dar+m7ppTgNvMB3bDkDPJ8=;
        b=QbNHnmEm0ZcCXV7n3fGZuLMb4rInaMG1cCKCpHeugyUEOOsuQAitLau8xb1OYvu2Tw
         rngViGhJrGUgxl9AXH8U6I2Td0zo0BH4MfOaBmdYojJmji0b5bEnhbS91UAtwG4w5TMB
         RjH6hO8g8QLJE2VidNe78k+L65NCmE10mc3MZUw4uwDrU7zA9ipXST9J0GT9U2YcL64a
         cIZ0Wx6NFmECWKflwt+bG9bclI4pd1MGWyfO+w5MZXpk7fVyCEK3D09XkGlB5NOz+m22
         VmK7GAFNghCTUPXu5WHpFCRqjD42vDYrZHh6CXC8MiBaqkntDVRoMpa9xwZ0gjPS8FV/
         Om8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JiQ66mYfyBCCF6F99e/X/Dar+m7ppTgNvMB3bDkDPJ8=;
        b=XSwLwL6DmeF+duKyh1Ybxif6VWFVchtdsOOQjrIMW7VLeuBO2s2UYigajBW3Z3ggI1
         o5MfvOB1PsbbD1Davj7oCOfCIwdN2q5jQoqQ9k9DcX+s8gl8pndRcjNz3m1NS97q0r7b
         ZcZtnIn3JWlV7tRHxu+O5Lp5KWuNiGOggcd8lrWaYuJNhfnKpZk4IkmExD/sy3uLZXjt
         e1hq4GJtNc4Jas+3gBHB6Js+l/7GLfReooA4KwHRy1fxXUB+NK0a85a3bbO23bluc91E
         M9ht4Ct0QO1QAJ+as9YftL9QvRh0A7/mlGKDEU9nlJoWhAIJo6ENnVPTrEWP4SIzk5TL
         ygrA==
X-Gm-Message-State: AOAM531RjnhIqD9sUB/ffKVyB1w2y1z395HrA7cAvprxCF7Hrv+ejyqn
	3rlBaWDB6VJyAu2NKiK3mpIH+VoRx7kkvh04JxA=
X-Google-Smtp-Source: ABdhPJxO/btbM8lxJvQ+lrhHL21RNoY9DT44kXJ3pn1WPZppujZnUAQksSKFnHmi2FRa0A1gJ2CUdXip5ktSCObY6fE=
X-Received: by 2002:ac8:5844:: with SMTP id h4mr14359674qth.194.1604948358397;
 Mon, 09 Nov 2020 10:59:18 -0800 (PST)
MIME-Version: 1.0
References: <20201109003123.31494-1-kai.kang@windriver.com>
 <CANNYZj9dT6GBpFCkfGobL1tJ8K1GRLe9VuJJPaNR4Ubnyr0cCg@mail.gmail.com>
 <15a325ef-c583-1afa-ae19-750a0927f2f9@windriver.com> <CANNYZj_ku_fWOyn_pkTsC0ygCRXT7QrTS8AedH-VEhvAcr+t4Q@mail.gmail.com>
 <8b13424d-115a-037b-cdd8-16c264a48ff7@windriver.com>
In-Reply-To: <8b13424d-115a-037b-cdd8-16c264a48ff7@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 10:58:52 -0800
Message-ID: <CAMKF1sqjqtN0BcoVg8xM5SrXLmZS_RNTCYG6iVLtWuHQ+VY58Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: remove '-fno-omit-frame-pointer' for x86
To: kai <kai.kang@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 12:18 AM kai <kai.kang@windriver.com> wrote:
>
> On 11/9/20 4:07 PM, Alexander Kanavin wrote:
>
> Right, but then adding _remove to the upstream recipe doesn't seem right - rather you should use _pn-webkitgtk override in your custom config.
>
> I suppose '-fomit-frame-pointer' is common compile flag that other people may also meet this error.
>
> Regards,
> Kai
>
>
> Alex
>
> On Mon, 9 Nov 2020 at 08:52, kai <kai.kang@windriver.com> wrote:
>>
>> On 11/9/20 3:32 PM, Alexander Kanavin wrote:
>>
>> This is not seen on the autobuilder, which does world builds on qemux86. Something might be wrong on your side?
>>
>> Just the option '-fno-omit-frame-pointer' which is not set by default. We have a build with an extra config in local.conf:
>>
>> SELECTED_OPTIMIZATION = "${PROFILING_OPTIMIZATION}"
>>
>> which expands to
>>
>> SELECTED_OPTIMIZATION = "${FULL_OPTIMIZATION} -fno-omit-frame-pointer -fvisibility=default"
>>
>> then it fails to compile webkitgtk. It could be reproduced with upper config line.
>>

since we do not have global file to control this its fine if you alter
PROFILING_OPTIMIZATION inside this recipe
something like PROFILING_OPTIMIZATION_remove = "..."

>> Regards,
>> Kai
>>
>>
>>
>>
>> Alex
>>
>> On Mon, 9 Nov 2020 at 01:32, kai <kai.kang@windriver.com> wrote:
>>>
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> It fails to compile webkitgtk for qemux86 if compile option
>>> '-fno-omit-frame-pointer' is applied:
>>>
>>> | TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/
>>>     Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:
>>> | internal compiler error: in find_oldest_value_reg, at regcprop.c:438
>>> |    47 | }
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>  meta/recipes-sato/webkit/webkitgtk_2.30.2.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>> index 1acba6be1d..11fdb59034 100644
>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>> @@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
>>>  # which is not enough for binaries larger than 32 MiB
>>>  CFLAGS_append_arc = " -mlong-calls"
>>>  CXXFLAGS_append_arc = " -mlong-calls"
>>> +CXXFLAGS_remove_x86 = "-fno-omit-frame-pointer"
>>>
>>>  # Javascript JIT is not supported on powerpc
>>>  EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
>>> --
>>> 2.17.1
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>>
>
>
> 
>
