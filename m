Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5423FC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 16:17:13 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.14157.1635351432137454584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 09:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dwZH8g/K;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id h4so2364435qth.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I8T1uxBhisldP3SW36v2c325xSKINKh32GfnEonPS8s=;
        b=dwZH8g/K9vh8rHYdeC8DVUkP4rlmAt6ZadLtwe4a3SfJfrPZrxR2w9xD1IMjdQrXiV
         XLmol7EfEr+SEI6+ied579w4MKUFNTD9uXYiLie6EZk+ciQeA53QQgUY9TbMJIRPJTzK
         qlq9KvEmiVClMDTKVipVj00oAXv1hSTw+Rt8jaSwPvy9x+SYvSMLUWc2IIooAMGIWCGp
         ENEklkGbA5TFtBq8r92W/N2EM5kbhCd1vuQdufIEWPXwkcDnsYakOoz0d4N+OoFIaryD
         MroF/mt1T8UychXcMiyLFgRThBihUVwWs1oyKvJ1eZh4UyP1blookEMlsV0dAMta02u4
         DvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I8T1uxBhisldP3SW36v2c325xSKINKh32GfnEonPS8s=;
        b=kA4iTWMwGiiFf7SXUrTdVI3W4OkFDf2FUfPT+Bqt/7b+30TMVa6A9hmZOb1OUAHQbg
         grpLsbyHHLWpI1O0ZHKo3/9wjsTHxGpI6dwOIsRMJ2VSm33qgKtk0xHXlTbAJmgWkzGC
         WLzZGuau9Ce0Kd3HVEixIQPrTYfY3COZXiqAx//hjndtPCzpbEHwIdxRq9EIWqCA5VY8
         EM86U9ZHAaJnfCCP/+PbD0fcZoYgAwNkZK6czpnOXZpscbpuBvXKZiufZXbYlbwKRYam
         +W3+bprCTEX8K1zQol3e6K2AXxwtm+ndkK6x6B0HURGg2F7OhQQvx47K3OGMUat1DD+G
         q2lw==
X-Gm-Message-State: AOAM530pNFIxIM8vnqvKZf5omHHhSB1qBpg34KJLXpKcEx6KEvtgBf5A
	9g/2KqrSqQh99ErkK4yDpTb/H2GddKLX6xcME78=
X-Google-Smtp-Source: 
 ABdhPJxx/DqjuvmNQY9ZIBFuv+HXikMFg26u7hfmW/HzibMisfPkH4dvVwbsWAJDZAYOWsujC82/TPGRPGg21sqnnCE=
X-Received: by 2002:a05:622a:1114:: with SMTP id
 e20mr32804599qty.225.1635351431170;
 Wed, 27 Oct 2021 09:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211027091252.5781-1-jay.shen.teoh@intel.com>
 <CANPvuRmrxFqVk4Mmz=cDrbwUZ1RPLRpD8=aF241LguR=uFjrDQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRmrxFqVk4Mmz=cDrbwUZ1RPLRpD8=aF241LguR=uFjrDQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Oct 2021 09:16:45 -0700
Message-ID: 
 <CAMKF1sqCVwThX=i1LzTF52u8oGzNmJ7gA7VJxYg9eqnOt7GGzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm failure
 in common errors list
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 16:17:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157554

On Wed, Oct 27, 2021 at 2:24 AM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
>
>
> Teoh, Jay Shen <jay.shen.teoh@intel.com> escreveu no dia quarta, 27/10/20=
21 =C3=A0(s) 10:12:
>>
>> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
>>
>> Add the following line to common_errors list.
>>
>>   [drm] Cannot find any crtc or sizes
>>
>> This message is not harmful, it extended the coverage for drm error mess=
age.
>>
>> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
>> ---
>>  meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/ru=
ntime/cases/parselogs.py
>> index 2b8893d842..96da0b4f5c 100644
>> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
>> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
>> @@ -32,6 +32,7 @@ common_errors =3D [
>>      "Failed to load module \"fbdev\"",
>>      "Failed to load module fbdev",
>>      "Failed to load module glx",
>> +    "[drm] Cannot find any crtc or sizes",
>>      "[drm] Cannot find any crtc or sizes - going 1024x768",
>
>
> I think this one ^ can be removed

will the first entry cover the case when a fallback size is set ?

>
>>
>>      "_OSC failed (AE_NOT_FOUND); disabling ASPM",
>>      "Open ACPI failed (/var/run/acpid.socket) (No such file or director=
y)",
>> --
>> 2.33.1
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157508): https://lists.openembedded.org/g/openembedde=
d-core/message/157508
> Mute This Topic: https://lists.openembedded.org/mt/86623483/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

