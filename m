Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC06BC433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:34:33 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.6796.1640014472686306980
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=F+yyCVYO;
 spf=pass (domain: madison.systems, ip: 209.85.167.44,
 mailfrom: matt@madison.systems)
Received: by mail-lf1-f44.google.com with SMTP id cf39so22547099lfb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DSCcL5hCeIc+w2xz92hnbtQyCT+OgluNOFM0VkABJ5c=;
        b=F+yyCVYOtDJ1tKVSDaChAxOTkjQ503AU/CagmzQNaoEcUuhY7jIPJxVPvpQhYcQcM6
         tll/iCuu8S6DRPhWfZHZkmyxLWswnyF6fHKL5afclt/XaIwv2wX44isrO4RvC5ryZ9iN
         V27vqWTCsdOxcAJdEoeJIUvThEt19ryIDeJAu1LoHIPZLyxdZGXihr53joju1gTJQAv4
         7RcxODBUSeBp9813ACBJjaxjJtR5/n5GHSYGo384Xs33/VVVPluPjHuWkuB7bdT4X2et
         oDOfzDDMwg2vT5eRKYR0alln1xUGGG9ruy+ooLIh5Vc/nZQFbshzDI3Wbo5a1IRJlHMN
         NMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DSCcL5hCeIc+w2xz92hnbtQyCT+OgluNOFM0VkABJ5c=;
        b=MywxL1cTuZ6mdbfM627ke/HpN1ONtS0V0c451Xlp0gcRjMfzHCVFdJtZ7Fiy1nRrMq
         ziSxYjq38t4PLVr0dRUXFXsZEeOwdg5s1sAClgjGzDqhsElrMfOrgL25ZpEIl11VfPmf
         yfgbiPqJOpA5i9hcXzZUTswsdPr380r3PLVkOWM3QMUjcNYw43LWcfddngv2u/giXcmp
         Agwc49vWPT1OeiE3ERnsdNt/hKL/KFJEX1JRmrp5WcybPa3xqe1I35y94rNlFeTmm/29
         dbGEQ4XJfQIQaaidlz9j58qWqvQ1jGTABscUd5tLPMhs/6Lp4Y77z9jzq3OWasj4Jm4A
         u/Lg==
X-Gm-Message-State: AOAM533LjRwrLnrYJqmquaQTDJZ1O9yTQ7M/8FGOJAuqI2QJp924nm0q
	XCGRMFsz9lMgKYpp+RUiaBrmCNkXPJxLdjlC9OGzuw==
X-Google-Smtp-Source: 
 ABdhPJx5GjJv4b89uIVK/Gs+sJ/gTXDyuhP7M2S+lavwz/ALcLFTzgZH4AQTn+Z8KqQtHsHfzhJsxRDHWnqn74m6lmc=
X-Received: by 2002:a19:e046:: with SMTP id g6mr15757415lfj.176.1640014471007;
 Mon, 20 Dec 2021 07:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20211217153630.1746217-1-matt@madison.systems>
 <20211217153630.1746217-3-matt@madison.systems>
 <CANNYZj9T6Mgcytg11VXDc2_3vqvkJnREpd9cPfjfqF7X3yB_4w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9T6Mgcytg11VXDc2_3vqvkJnREpd9cPfjfqF7X3yB_4w@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Mon, 20 Dec 2021 07:34:20 -0800
Message-ID: 
 <CAGgRHJrO5Am29X99nEFosQC-2R-+war-XAif8WCb=jy1Y9WeSg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/4] base.bbclass: add crate to OE_IMPORTS
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:34:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159891

On Fri, Dec 17, 2021 at 8:37 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Should this be named oe.crate for consistency and avoiding potential clashes?

I retained the existing name for this change set.  The same thought
had occurred to me, though.

-Matt

>
> Alex
>
> On Fri, 17 Dec 2021 at 18:37, Matt Madison <matt@madison.systems> wrote:
>>
>> to install the crate:// fetch handler.
>>
>> Signed-off-by: Matt Madison <matt@madison.systems>
>> ---
>>  meta/classes/base.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index b709777f24..ee9950f207 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -12,7 +12,7 @@ inherit logging
>>
>>  OE_EXTRA_IMPORTS ?= ""
>>
>> -OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible ${OE_EXTRA_IMPORTS}"
>> +OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible crate ${OE_EXTRA_IMPORTS}"
>>  OE_IMPORTS[type] = "list"
>>
>>  PACKAGECONFIG_CONFARGS ??= ""
>> --
>> 2.32.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#159830): https://lists.openembedded.org/g/openembedded-core/message/159830
>> Mute This Topic: https://lists.openembedded.org/mt/87791269/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

