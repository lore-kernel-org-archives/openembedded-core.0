Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC35C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:45:00 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.12862.1641930296414829787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:44:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KS/s/ii5;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id 202so20136602qkg.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DfqtbFmy4g4+ztut593+PsymibByR3JSsY/qSH/zgTc=;
        b=KS/s/ii5L1W4TPg/wFSgS5rMrLwtnUDcS5I4AYdSwg9SeoEDt5j7jlqHPe+pr2oHw8
         5X4X4jmOUQ5IfKhgL4wvioN0XcAyHbUT60wmwYS8m3Trf6atFyyDR5BmOG/OZDHVctKK
         TChjulR2o7zRmSrZFIZ6WBlGLCbmTF3HyUb2fH6XK1r0XIPA+xyYweUWsVbPTFFzmRMR
         9wmdIBLM8swe7V48UuqHVwRa5p5NJD5hAr5XLMeMFUjmidm3psia8Nvfhj7bENsgAgLt
         w1Ag6BsOO6KM2kirO4b0pwxS73He202gVmnLM7c1ou+CFvxOyUGARaDTFYHhaqKQyC3N
         x+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DfqtbFmy4g4+ztut593+PsymibByR3JSsY/qSH/zgTc=;
        b=7wqXEyBneD0HoWfgaDcBqv9LPePVSktSaqvJoRIPxc7HM+oOJPE06zw5jAKPJfjAYL
         s7JNopZ/9bCoBxlgbZxLUeJVglNpToofHla0y+X8buzGFkXPMYK+9Ko+mnOVxqTsCpi5
         B1Dqomvgq1i5TbKYVImX9R/4xcdqWtK3Z2DfgTRO9QlHXC1lWOnkrKAB+FlJ2mjBWD15
         oMFerMUXq6kSy/KcJo5SQiPTn/yiY01Sd6OnQTzeD0vgkExeS1X6WBDAL6qwX1OeZ5gj
         5fz8pAax4avdx8UM6Hh9QcyQLIvtssOsTs/yn41QpBdqWDKuNcdPK5wzaPwg1Seg5YC2
         rojA==
X-Gm-Message-State: AOAM531YEpsLSK/gJZka6dDTGg/xmEn0McIMri5RlsADofR4lVR9kYRT
	On60pqsjuGKBB6u5nz3GWDwKgdRW+iNKd09HSDY=
X-Google-Smtp-Source: 
 ABdhPJzZK5Abl1Ts5n3qsXH5f/hIm50kW1T7sCKSyv5KYaB2YLnYFMy/+Nb+KAUAG4T5QCITkylsrDwlXrVf6vjN+9E=
X-Received: by 2002:a37:5541:: with SMTP id j62mr4179136qkb.180.1641930295424;
 Tue, 11 Jan 2022 11:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20220109222732.2252416-1-alex@linutronix.de>
 <20220109222732.2252416-10-alex@linutronix.de>
 <CAMKF1sqW2NaY+=49oWG24=6mrrLjM_jam375tbHS_yo8xD2+hA@mail.gmail.com>
 <CANNYZj8jt-Wh4nyBNdXm5ykPjOkK1nvoLH7vcJwgZpPnxn=NeQ@mail.gmail.com>
 <CAMKF1sr4VpWwTqER4h4tYUm4p2v_di8BcmcE_As8GFkiEJO6kQ@mail.gmail.com>
 <CANNYZj9e6DDGBEL7_bcSdU=6z-faXOEjCnDcsJ-rAtEqK_aVrQ@mail.gmail.com>
 <CAMKF1sp3ujr7iaktTzxH0bSXT8MKJ5c06t4ObUro8m5zCczD5Q@mail.gmail.com>
 <CAMKF1srFMGqOXKSiU_J-D04g2-E45OGVY7kgeXwdXf0MgPKxmQ@mail.gmail.com>
 <CANNYZj-tuaUGyHVuy2uFgsNHTsxTTyLQWFG38NcdYrNDNVqEaw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-tuaUGyHVuy2uFgsNHTsxTTyLQWFG38NcdYrNDNVqEaw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jan 2022 11:44:29 -0800
Message-ID: 
 <CAMKF1sp3nYeqwemL+eMB9R_6ugUUvdWMAWxP62V89HLhkXfVZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/14] epiphany: make libportal optional, and
 move it to meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:45:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160460

On Tue, Jan 11, 2022 at 12:48 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 11 Jan 2022 at 08:49, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, Jan 10, 2022 at 12:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > On Mon, Jan 10, 2022 at 11:18 AM Alexander Kanavin
>> > <alex.kanavin@gmail.com> wrote:
>> > >
>> > > For epiphany you also need the oe-core patch. Nautilus should switch to an optional dependency via PACKAGECONFIG, similar to epiphany.
>> >
>> > I might have missed the OE-core patch perhaps, I will rebuild with
>> > latest master-next perhaps and see if that helps
>>
>> digging a bit deeper reveals this
>>
>> ../nautilus-41.1/src/nautilus-files-view.c:95:10: fatal error:
>> 'libportal/portal-gtk3.h' file not found
>> #include <libportal/portal-gtk3.h>
>>         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> 1 error generated.
>>
>> but libportal is staging it in
>>
>> % find ../ -name portal-gtk3.h
>> ../recipe-sysroot/usr/include/libportal-gtk3/portal-gtk3.h
>>
>> and this is happening with 0.5 upgrade of libportal. I guess nautilus
>> needs to be patches perhaps.
>
>
> It's a lot easier to just turn the dependency into a PACKAGECONFIG, and in due time upstream will address it. It's not an essential feature at all.

I have sent a fix to contain the breakage. Generally, its good to keep
the dependencies working when doing such incisive changes

>
> Alex

