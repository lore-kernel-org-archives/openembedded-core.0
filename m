Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256BEC433F5
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 05:51:36 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web08.33287.1637992295257326532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 21:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lHUd0Ofi;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id t13so22674787uad.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 21:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A+UUrMyDLtA+XjLXsJSwBQlAxznyKLH+X2j/VhK39Ag=;
        b=lHUd0OfiGCisXIZKuX+tRNpQb7bpImrx1eb2VZnySJlsUgd8uW6jSZrF9zAUGMpoFq
         shh7CZ3SKDA5SNvCTrrktuDBdX1Lvk9YB1fI3ydXeYuwb8BRmupeJfHhiBq7d+GLCyLB
         b5YGJW11R2XVnehp6IUq6jCxuauxEgBdrZufcE4QjEg1KerzO7LLu7GAUKmIQe9/Mkot
         nvY6wdE+/A6mE9JF4aMAoeVQUZ30KHdQtF7j84nSddErwqntFGuizqjhcQ5cGbnOFHwz
         4kNG27Y/QslmyGu21sbxsYUcptyeuypKbNyi1SVp59Ck/hE5wDWItZ3Dqe13EDEx7E7q
         72Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A+UUrMyDLtA+XjLXsJSwBQlAxznyKLH+X2j/VhK39Ag=;
        b=2NPm6QXJYxYzh5yyxa8yGJvTOInzDVpMY6NDglNhh3/VF49AltyCqAjXCqgEwHHtEb
         l+JUYXz9nr5e/B1O3f30o/eE0kxPr13EPX/tW4N21JlO1uG9OZ7M+LxAoITVV/Ctb9z+
         jhuGn7lnevuztoLWW/VKyt/w4xAytwragVdSqlXGeIFBJEL+SjS/K+YDcv4hJhnVMD9C
         I8Qw1DwEva2qTNa2hu0jWtSo7j3Laqnwel/Yb6TfQuv/AFNp8Z/plhK5EPyWQvC3FpuD
         NEYUfbSWQ3RkSmHITyCdXFkhCOToDelu+0u1S5EYL8D8t21iEu4q526SDYnNFqGBTO1A
         uZ3g==
X-Gm-Message-State: AOAM531ZEIRHsIFcNOjFp5SpVqqZpcVors9NjxHRzv7WJhwhLyFBWDEr
	ymb+HGM42B4uB13GGQogtuWSJG0MzBDzMUJWmgg=
X-Google-Smtp-Source: 
 ABdhPJxCDQMDE1PzYhOV5NV9iDFpcjT4eN/Xl41+CpScDlFvbNqtabouvw3xcPVLzwIjQJOTKiWy9p9MzBuWk0geBUE=
X-Received: by 2002:a05:6102:a46:: with SMTP id
 i6mr21286778vss.19.1637992294356;
 Fri, 26 Nov 2021 21:51:34 -0800 (PST)
MIME-Version: 1.0
References: <16BAEC7B11896AEA.23256@lists.yoctoproject.org>
 <CAA=hcWSA8-8TCJDD8_Zib11Vaizok-xZvQMqSevjKJLrQ+GuhA@mail.gmail.com>
 <16BB4412EB9EABB0.15594@lists.yoctoproject.org>
 <CANx9H-BczVumN8LwcH6+4SmobRJz=Hxmand2soVyfuoYZVmMQw@mail.gmail.com>
In-Reply-To: 
 <CANx9H-BczVumN8LwcH6+4SmobRJz=Hxmand2soVyfuoYZVmMQw@mail.gmail.com>
From: Jupiter <jupiter.hce@gmail.com>
Date: Sat, 27 Nov 2021 16:50:58 +1100
Message-ID: 
 <CAA=hcWTwe9WM2CoaMyrxWX3zHRRa3QyzgMQd5AC5QPGE61o3rA@mail.gmail.com>
Subject: Re: [yocto] [OE-core] How to create connman_1.40.bbappend to enable
 and to build connman with iwd?
To: Tim Orling <ticotimo@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Armin Kuster <akuster808@gmail.com>,
	Daniel Wagner <wagi@monom.org>, comman <connman@lists.linux.dev>,
	oe-core <openembedded-core@lists.openembedded.org>,
	yocto <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 05:51:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158847

Thanks Tim for the link, I have built the iwd.

According to Daniel's advice to configure with "--disable-wifi,
--enable-iwd", I added PACKAGECONFIG[wifi] =3D "--disable-wifi,
--enable-iwd", to override PACKAGECONFIG[wifi] in oe-core
connman_1.40.bb. The intention is to remove wpa-supplicant and to add
iwd to connman_1.40.bbappend, it built the image without error, I
believe that the syntax is OK, but the wpa-supplicant was still built
and packaged. Any idea from OE/Yocto insiders why PACKAGECONFIG[wifi]
in bbappend is not effective?

Daniel, how can I verify in the Linux console if the connmand is
running with iwd or with wpa_supplicant? I have disabled
wpa_supplicant.service, and I'll remove wpa_supplicant completely when
I find a way to do it.

Thank you.

Kind regards,

- jh
On 11/27/21, Tim Orling <ticotimo@gmail.com> wrote:
> On Fri, Nov 26, 2021 at 5:48 PM Tim Orling via lists.yoctoproject.org
> <ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>>
>>
>> On Thu, Nov 25, 2021 at 10:26 PM JH <jupiter.hce@gmail.com> wrote:
>>
>>> Hi,
>>>
>>> Given the high profile of iwd and advocating connman with iwd, I
>>> believe someone have already built Yocto connman and iwd,
>>> surprisingly, I could not even find an iwd recipe in
>>> https://github.com/openembedded/openembedded/tree/master/recipes, nor
>>> can I find connman document and instructions to replace wpa_supplicant
>>> by iwd, what could I be missing here?
>>>
>>
>> Please look at the layer index for recipes:
>> https://layers.openembedded.org/layerindex/branch/master/layers/
>>
>> I don=E2=80=99t have any advice for building it however.
>>
>
> I forgot to include the recipe link:
> https://layers.openembedded.org/layerindex/recipe/89268/
>
>
>>
>>> Appreciate your kind advice.
>>>
>>> Thank you.
>>>
>>> Kind regards,
>>>
>>> - jh
>>>
>>>
>>> On 11/26/21, JH via lists.yoctoproject.org
>>> <jupiter.hce=3Dgmail.com@lists.yoctoproject.org> wrote:
>>> > Hi,
>>> >
>>> > Please correct me, but it seems to me the connman is moving to a
>>> > direction to ditch out wpa_supplicant and to use iwd, but the Honiste=
r
>>> > still configure connman with wpa_supplicant by default, appreciate
>>> > your advice:
>>> >
>>> > - Is connman with iwd stable enough?
>>> >
>>> > - How can I create a connman_1.40.bbappend  to replace wpa_supplicant
>>> > by iwd configure?
>>> >
>>> > - Where are the documents for configuring and building connman with
>>> > iwd? Where is the operational guidance to run connman with iwd? Can I
>>> > use the same connman dbus APIs or are there any dbus API changes to
>>> > run connman with iwd?
>>> >
>>> > My apology for FAQs.
>>> >
>>> > Thank you very much.
>>> >
>>> > Kind regards,
>>> >
>>> > - JH
>>> >
>>>
>>>
>>> --
>>> "A man can fail many times, but he isn't a failure until he begins to
>>> blame somebody else."
>>> -- John Burroughs
>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#55430):
>> https://lists.yoctoproject.org/g/yocto/message/55430
>> Mute This Topic: https://lists.yoctoproject.org/mt/87331141/924729
>> Group Owner: yocto+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
>> ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>


--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs

