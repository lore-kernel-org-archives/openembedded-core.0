Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F045C25B06
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 16:39:10 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web12.44.1660235944920175785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ECYUim8I;
 spf=pass (domain: gmail.com, ip: 209.85.128.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-32194238c77so178538037b3.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yL/Yh4g21LemSTFP3Ufi/OLaEUp/aaMNKCgmG+qS/M8=;
        b=ECYUim8IBV8HECfoHYd+X6EQGNJKM0p/Jj2LqRK22mx9CtSBBxItRU3QTDgOIUPsMj
         Fvq0AJAshDCsALWxHuT7U0XkFwU0CZR7EtDeLth+Y9Xcz4RVgkchLXMC4W4AOWNN09Pk
         96aNPHZwgjCaO8tjt7hqE5g41P9agTFOSGqWo5HqV26ccR/6XHQPE9Aqv9PAe93YQLmi
         uu9h0oypqFB2mOTXVhYHFARw7E91TVQQmLqxvt49wabhFsOLZQspBrKKJ0nRKwl0/vTx
         y8REE+ue8AiB1JlGG+UyRGtuujTHFGPCsxeoQIXSB2GeMBURCRMJ4dum+jZPN6L8AOZn
         Tv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yL/Yh4g21LemSTFP3Ufi/OLaEUp/aaMNKCgmG+qS/M8=;
        b=X90FAHaVKT2inZdSjBf0K9YGPLqWvz/5MZnjox0Yg8dXUetoe31BwG6Ina6BSQFpiI
         I01p7y6UoIiPr4DZ0zgNOBr+9y+O2sshZjdnGbyyGKhw4DYrOBx3XtkiWvTnmtC0Dx5Z
         c0MzAICIEIgVNRSEBG5qtyYvQfNEuhrFkJOFOJ3tvWUg5RiqDyGTZoT78VW0HPvjESue
         YoafMVsTXGDO6VSBRJAcl/63K9NRhI+IxPM1VDyoqkF1bDg6zLuDnfFJWI75pT/KP7kw
         ruzon3cM9IumAHwboMfEZRGNq0r6gPeiUMw6H6ef4U3vlWbXd1B4NhGEggpcVVYl6xWt
         iKzg==
X-Gm-Message-State: ACgBeo3NYwW967cK3xlFL4uzjnDhLWYCc3nHIL/AuYGEM7RnAiuuhoDd
	d90/iuzZ8PO6uVnp5LTTxtBKK9Km0L2o/we1T0o=
X-Google-Smtp-Source: 
 AA6agR5YPC9gTwMbIDUPQxy8ubaBNU57SYP+Zc8dHkxIUXU9nP+bLSP8sFJLGwyyaz9cTDPQNET5TGV9IbZaKR2HyQQ=
X-Received: by 2002:a81:9144:0:b0:31f:5070:4241 with SMTP id
 i65-20020a819144000000b0031f50704241mr63730ywg.282.1660235943943; Thu, 11 Aug
 2022 09:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220809145042.1789552-1-raj.khem@gmail.com>
 <CA+chaQebygH34uZ0bwiUdMKrBV3Wsnx-G8Muv4zmFZR7kjAuGA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQebygH34uZ0bwiUdMKrBV3Wsnx-G8Muv4zmFZR7kjAuGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Aug 2022 09:38:36 -0700
Message-ID: 
 <CAMKF1spGv2PBhkaSuhcRZnDrrAiyN3xD6bZM=rGbj0bV2ah7uQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Update patch status
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 16:39:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169256

On Thu, Aug 11, 2022 at 9:21 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> The 2nd more important part was backported to 2.36 branch https://sourceware.org/git/?p=glibc.git;a=commit;h=302bc33bc53c787da6e74162a7092e9c0fb964a8
>
> If you plan to do another SRCREV bump before glibc upgrade is merged, then we can drop these 2 changes. (I'll try to do another build tests with DEBUG_BUILD, but probably next week or so).

I think, I might do, if Alex reports issues as he is already testing it out.

>
> On Tue, Aug 9, 2022 at 4:50 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> These patches were appplied in master
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch     | 2 +-
>>  .../0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch     | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
>> index 2d14a4c6196..2caff3a0d53 100644
>> --- a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
>> +++ b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
>> @@ -7,7 +7,7 @@ Subject: [PATCH] x86: Fix `#define STRCPY` guard in strcpy-sse2.S
>>  defined.  It doesn't end up mattering as the whole check is
>>  guarded by `#if IS_IN (libc)` but is incorrect none the less.
>>
>> -Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=29454 https://sourceware.org/pipermail/libc-alpha/2022-August/141289.html]
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=312ded0d6339e8c463d0395397b5825401b14f54]
>>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>  ---
>>   sysdeps/x86_64/multiarch/strcpy-sse2.S | 2 +-
>> diff --git a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
>> index 1b347b33226..a2c951ad936 100644
>> --- a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
>> +++ b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
>> @@ -8,7 +8,7 @@ strlen_pass::handle_builtin_strcpy but only for optimized
>>  build. To avoid needing to include strcpy.S in the rtld build to
>>  support the debug build, just do the optimization by hand.
>>
>> -Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=29454 https://sourceware.org/pipermail/libc-alpha/2022-August/141290.html]
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=483cfe1a6a33d6335b1901581b41040d2d412511]
>>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>  ---
>>   elf/dl-cache.c | 5 +++--
>> --
>> 2.37.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#169155): https://lists.openembedded.org/g/openembedded-core/message/169155
>> Mute This Topic: https://lists.openembedded.org/mt/92916378/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Martin.Jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

