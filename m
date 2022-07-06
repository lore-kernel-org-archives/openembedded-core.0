Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FADC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 10:59:03 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.4875.1657105136148824306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 03:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y8rn9dXf;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id f39so25296554lfv.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 03:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OYwby98sXw4kilZ2T15xx4erSuViZZuDzc8UshS0R0Q=;
        b=Y8rn9dXfhbC1BAWxf9yx4tFicDQWcyznCHsyHrjCHQoQaYiaw5afLI5gpokTmwP0iV
         hvPyVbJ07K77h4XUYtlFt24d81JLEWt80cLDzUSaAoLGX+ABgJMMFzW1rlKvtI8El8w4
         i67+zBFAiUISI/haPG57AVh6eB62g3Zf6FX+C5x2hHPEVjoRyCYw+SCzKe+JnQVMXopm
         ot0C6ZzIk7BaEkxtRHmbahsDysEDYP7Gr99+k1Q9mQJg4f1APhpmR7l6c1VGqvaeVCKw
         ILF30oUmQALS1p6QgR6swF3u9KPou+daAiscz2Y1a4/7pSzaBgeVsECQhIdPZHJbkFh4
         LfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OYwby98sXw4kilZ2T15xx4erSuViZZuDzc8UshS0R0Q=;
        b=K/jDdi5pRIxe3bH5c7K8+axPo8TCvTKdBs0IQfONby5CeDiUcwLiMn3nB+Iv18cgho
         FgHkWQ9fYMnRnPMuY0XDGF9oqst2gdCSTTPjz+ZPUhWqX2b5G3bN6Gb94h/wXcys47ck
         GqbavERWi3F4P0P7fIw7+fBSivEYlHm8CHZFux0p+bz/N2yWIkWOYj5NaTb4Q9coc4Td
         UbwqLi5q/3yHF2xm/VjQ6h+im3OsUlKwtp84Xv9+mFZQbcvqLSPzMzLWXdFo3qsH4oc0
         IdCSF3QsWkBAf9u1Fwq5rjZsCPIbB54d+MzxuUq6qxRv4haqMvUFk/RCHbJTuLb/Rfnr
         yCyg==
X-Gm-Message-State: AJIora/do59WSX45iwZ3WWGmnvzTN3tHH3ix03noOrsTf4gBQnjTxtqc
	WDNqTTyzW0V1pkKt2RDIlCEYVoZc+FJkYGWX6H0=
X-Google-Smtp-Source: 
 AGRyM1t0GbpVWjgl1IL8EN82YU93GjGP/WAkP0Aa/ZHVx/L+7cB50NyxR39fbFhfdySoSF67eKp7o14/b2lpg8Fs2bY=
X-Received: by 2002:a05:6512:3b21:b0:47f:665a:bf50 with SMTP id
 f33-20020a0565123b2100b0047f665abf50mr26312851lfv.673.1657105134109; Wed, 06
 Jul 2022 03:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220706080721.3072553-1-alex@linutronix.de>
 <20220706080721.3072553-20-alex@linutronix.de>
 <CAMKF1soyCB6WGUCpPhbzjt5=7pr6gSeJSjg5a58wkqh7rGJ04g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soyCB6WGUCpPhbzjt5=7pr6gSeJSjg5a58wkqh7rGJ04g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Jul 2022 12:58:42 +0200
Message-ID: 
 <CANNYZj9zfOM09a1bKEgWPxiSS0r_oaxr=JOy=+JA2vFDs_N2Pw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 20/27] python3-mako: upgrade 1.2.0 -> 1.2.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 10:59:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167718

Right yes.

License-Update: copyright years

Alex


On Wed, 6 Jul 2022 at 12:39, Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Wed, Jul 6, 2022 at 4:07 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> ---
>>  .../python/{python3-mako_1.2.0.bb => python3-mako_1.2.1.bb}   | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-devtools/python/{python3-mako_1.2.0.bb => python3-mako_1.2.1.bb} (73%)
>>
>> diff --git a/meta/recipes-devtools/python/python3-mako_1.2.0.bb b/meta/recipes-devtools/python/python3-mako_1.2.1.bb
>> similarity index 73%
>> rename from meta/recipes-devtools/python/python3-mako_1.2.0.bb
>> rename to meta/recipes-devtools/python/python3-mako_1.2.1.bb
>> index 11e5f326bd..8155c37984 100644
>> --- a/meta/recipes-devtools/python/python3-mako_1.2.0.bb
>> +++ b/meta/recipes-devtools/python/python3-mako_1.2.1.bb
>> @@ -2,13 +2,13 @@ SUMMARY = "Templating library for Python"
>>  HOMEPAGE = "http://www.makotemplates.org/"
>>  SECTION = "devel/python"
>>  LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b32291f107a8f1ea94c4a41e00a6a18d"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ad08dd28df88e64b35bcac27c822ee34"
>
>
> You forgot to mention What changed here
>>
>>
>>  PYPI_PACKAGE = "Mako"
>>
>>  inherit pypi python_setuptools_build_meta
>>
>> -SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
>> +SRC_URI[sha256sum] = "f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffcc146c9de17e717b0307"
>>
>>  RDEPENDS:${PN} = "${PYTHON_PN}-html \
>>                    ${PYTHON_PN}-markupsafe \
>> --
>> 2.30.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#167707): https://lists.openembedded.org/g/openembedded-core/message/167707
>> Mute This Topic: https://lists.openembedded.org/mt/92202189/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

