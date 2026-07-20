Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6523BC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:19:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11495.1784560778374857189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Vo/lSgWN;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49553515a8bso22107635e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784560777; x=1785165577; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRjGSS5UOfJ5/vzgYyvg1a6/XBhkpW/TN72bJwUfF+4=;
        b=Vo/lSgWNkxCGL+YSetYI0z3X5gM4xCN4srcz62GDVfGnKhAj2UZ8xPsFAvsLuuDjm3
         09c17wLE94JCJTOfqGSDE0znuDIZnzxRfliAsW597Uxxue9JPuKfxiMIz1EbNgEYwRGW
         bFZdIg+GIINC0ulNeKEWMBxInDNHJGdNvV+x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560777; x=1785165577;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRjGSS5UOfJ5/vzgYyvg1a6/XBhkpW/TN72bJwUfF+4=;
        b=rwCp0hV9sCkeqtFPMr+5SHhzU3s+eSIRosOqPDBCK+w6TO9hGousc8D/Pboov9x6CD
         Puf+tkx9p1ZK4hxKXOZ/gPp1lSBoIOkcz99gL55IUbb9FH3cuh6aWpirza3uuZQM0ktQ
         cAKXg+9rbFZVP1eYMMx99X/1BZV/VtyZHDU4S4M9Y5QrhX/1I/8qvfsjfrs6aMIYZ6uF
         7d54fJRtvyv/sVZ1M7LVYDilF6eJEEzass/PSiz0ylVfWvVjZXexlCa3FjLyR3r76b8w
         cp+eRU0tHhoXXgDWh33Dwro8+2sJLtSf65Yn2BV+ewZMpqo1ca2MDkHOHZDFSdwvir/v
         1oJA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Becdy065RPPicmnIjMWW3IBUSAz45kYtEWcuL7RdpeTjaw89MslN/WlerdaC0mC2rGegTh2hz+BGapUUqxJATw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbegXKTo9cpqBOa3CrNE+FWtLlHEjdOoPZfTyDImO377M3J4ui
	KcEXSZ7a06PAaney6BYhBCI2oOZB6cc3zQdaSERVeCi26bamuiHwFV3n/Hq3tDt1qwUiWP4JRfV
	VA7UHjjoVWA==
X-Gm-Gg: AfdE7cnrjjE44b90PK7ct32mtkg0ygPAN6piT8Kjk4oSHMlkjLaXC3NfSjEt6QTO+qO
	56ke5jXC741SYtA6LD25or3zqxjmW45x9h0WcAlgHUew6kRiTdQruEaBUpYqh4AHzQojbU95baD
	dEsSQHlulrgJ9nvsjq2wd5yqs9OUuX/ZFBJkJRIv+q6n2MoNIJ8iSBlVfLReVlJTso/eLlOsi92
	VfkUsBzrIQcw84c8QjjQSAY+z8ROclfGew+RW9aXnXLTcMBandIT+YQHZPc3O8rFb8VrMyP2Ppk
	cAhHejRnEmJtgO4zCHCyRYk1G+wnjD1UAPdR0orsh1dA1ds/RM+XirHfCM5HSbPYhr16sb4p61H
	Qyt67qexrbSP/lBov/Pq7vyyiraf1IZ+kI69j3nvz+TjqFYpLGRHIly2oxjzsEej+idhcFU4HnT
	JW6c/ZpTavFL8nQvyEOVQOc8rUzLW7yUXXzwC0iRNv5mgMmRr8/FuT2Z7BJLlmcw==
X-Received: by 2002:a05:600c:474e:b0:493:915b:dc4a with SMTP id 5b1f17b1804b1-4954a3d005amr186948835e9.8.1784560776462;
        Mon, 20 Jul 2026 08:19:36 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955a9e5f26sm97698325e9.0.2026.07.20.08.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 08:19:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 17:19:35 +0200
Message-Id: <DK3HZYI7OV4C.YF3JS912EHFG@smile.fr>
Cc: "Ryan Eatmon" <reatmon@ti.com>
To: "Marek Vasut" <marek.vasut@mailbox.org>, <adrian.freihofer@gmail.com>,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH] kernel-fit-image.bbclass: Do not
 include kernel property in DTBO config subnodes
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
 <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
 <91b15fcf-715b-40cc-8f77-ff4571946725@mailbox.org>
 <DJO1RET2JWA2.2H0HY5TPUI2T5@smile.fr>
 <84bd480810d947c860b95c3cc10f66fced3cdedf.camel@gmail.com>
 <e4369955-eae6-4c45-b00c-01ca18d94fa2@mailbox.org>
 <2304e3c8-1b90-4bbf-8022-80f19d1447a7@mailbox.org>
In-Reply-To: <2304e3c8-1b90-4bbf-8022-80f19d1447a7@mailbox.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241411

On Mon Jul 20, 2026 at 5:09 PM CEST, Marek Vasut wrote:
> On 7/4/26 11:55 PM, Marek Vasut wrote:
>
> Hello one more time,
>
>>>>>> I guess, before this patch can be applied, this one (or a back-
>>>>>> port of
>>>>>> it) is required:
>>>>>> https://git.openembedded.org/openembedded-core/commit/?=20
>>>>>> id=3D85e0408a81bdca0411a8625061e5e343c05f92d9
>>>>>> Otherwise, the oe-selftest fail.
>>>>> Thank you for staying vigilant.
>>>>>
>>>>> Yoann, can you please pick the aforementioned commit too ?
>>>>>
>>>>> Thank you for your help !
>>>>
>>>> Hello,
>>>>
>>>> I missed that discussion, sorry. But was reminded by Ryan (thanks).
>>>>
>>>> If I understood correclty, the set of patches we need for wrynose is:
>>>> * kernel-fit-image.bbclass: Do not include kernel property in DTBO
>>>> config subnodes
>>>> * kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED =3D
>>>> "1"
>>>> * oe-selftest: fitimage: Do not expect kernel property in DTBO config
>>>> subnodes
>>>> * kernel-fit-image: Add KERNEL_DTBVENDORED support for
>>>> FIT_CONF_DEFAULT_DTB (this one is not merged on master yet)
>>>>
>>>> Marek, Adrian, Ryan: does that sound correct?
>>>>
>>>
>>> Yes, that's correct. One little detail is the order of the patches. If
>>> you pick the oe-selftest commit first, all commits are compile and
>>> test-able. That's my suggestion:
>>>
>>> =C2=A0 * oe-selftest: fitimage: Do not expect kernel property in DTBO c=
onfig
>>> subnodes
>>=20
>> This is [1].
>>=20
>>> =C2=A0 * kernel-fit-image.bbclass: Do not include kernel property in DT=
BO
>>> config subnodes
>>=20
>> This is [2].
>>=20
>>> =C2=A0 * kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORE=
D =3D
>>> "1"
>>=20
>> This is [3].
>>=20
>>> =C2=A0 * kernel-fit-image: Add KERNEL_DTBVENDORED support for
>>> FIT_CONF_DEFAULT_DTB (this one is not merged on master yet)
>>=20
>> This is still not even in master-next .
>>=20
>>> same order as on master branch.
>>=20
>> Thank you for your help !
>>=20
>> [1] https://patchwork.yoctoproject.org/project/oe-core/=20
>> patch/20260704214812.365483-1-marek.vasut@mailbox.org/
>> [2] https://patchwork.yoctoproject.org/project/oe-core/=20
>> patch/20260630074356.10265-1-marek.vasut@mailbox.org/
>> [3] https://patchwork.yoctoproject.org/project/oe-core/=20
>> patch/20260630074423.10306-1-marek.vasut@mailbox.org/
>
> Do you think those three backports can be picked up for OE wrynose ?
>
> Thank you for your help !

Sure! They even are in the branch I sent for review:
https://lore.kernel.org/all/cover.1784364567.git.yoann.congal@smile.fr/

Following Paul's review, I will most likely hold it for one cycle in order =
to merge
the test at the same time.
See: https://lore.kernel.org/all/c791b1b82e236039c614ab41402844c965fdc6c5.c=
amel@pbarker.dev/

Regards,
--=20
Yoann Congal
Smile ECS


