Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF8CC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:51:48 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.29956.1644429107670239729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IyIIePZ5;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id j24so2248301qkk.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6zcbY+oyvsBqiDRkpiETuhai7tvAyz3cDgFjPDYOLkY=;
        b=IyIIePZ58v3zmHsG49EzVd1wguW5bkXrFTzx9RFOFp7NA6rSG9byJ/K7Onr9Pfz2Qb
         VWDhj24HT9KHlkKOCeGfBQe141HLLXjAJRkz1w0nmUsdy0d+2VNpMPfNdwMG5sH0dnpd
         L20qbiZm6PtNwEa1bsZ9xn2CRgFxAr4A5uLdLu6uEm9AdxSZg0pIVtfBC5U6iwu9U3V8
         W7Zl+KtdZHP9h4qoBWj5KGn5OuXcIBgQTTZ03Md2MdQSy89orRZp0e+GJIz8jXNqzhNg
         wFWZPwrnVcvYPg8kusuWHSk9/kX9PLVPsH7dQa4Nc12ldzyG3nEN9cU7NxdjvM53Clsf
         vJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6zcbY+oyvsBqiDRkpiETuhai7tvAyz3cDgFjPDYOLkY=;
        b=iGabJIIObmsqNHF58jqQVuQx0RxB5GIY8kLBgTdkoEX0C501TGYtW+b3cECz+mdnyv
         Au+mWu02XqOowQA5w5liAMhI//GbCepKiZW0uIRHQmhOXaZZGN0lvVrUUwrDk+ZAEkuu
         lxhgXYzpL4YfGy8aLNz2QEMCQfRZWTzsxcCc+inAf5+h+mu/8h5pnpLGtZ9tLVkqCx6N
         B7p7ezhBaAfFJdOY+2B26nht3L5KTEKbOT2wnk0AN6IGS51/OrQTmBMa9HbHPwYgqeVf
         EmQteBN8KRmSrLajOlQsfPA230H15VlyD/u20d9Tb741pKfj7F50jfdsy9Gbt1GQcxop
         pmiA==
X-Gm-Message-State: AOAM531icKxhJ9iwG5Xv53up/OdGKquvIIXgMw5LtPfe2UFfduf677hU
	RJ0FAUfhGFi7+hpSLOpVmYeTS8k7ZE2GO03QavPLythvOoc=
X-Google-Smtp-Source: 
 ABdhPJxygp0j3M4ODPpkuxaqD+8WBG+Au/WHXGXxgSepuEqAZEYMB/vtWVXeMUDqHIMbuUeqkQSzsEn9aPFPBqURL8w=
X-Received: by 2002:a05:620a:152b:: with SMTP id
 n11mr1729135qkk.463.1644429106738;
 Wed, 09 Feb 2022 09:51:46 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAEhQi8kj1kqd6cdG-1LOrmVJ75nR4W47wsa3b5r0RkwmyQho3g@mail.gmail.com>
In-Reply-To: 
 <CAEhQi8kj1kqd6cdG-1LOrmVJ75nR4W47wsa3b5r0RkwmyQho3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2022 09:51:20 -0800
Message-ID: 
 <CAMKF1sqBH1K0syKq+nNeM_ppsVC6qpbivvpzz286ez_2Yb=Lfg@mail.gmail.com>
Subject: Re: [OE-core] Missing python.h when building ntpsec
To: Mans Zigher <mans.zigher@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:51:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161581

On Wed, Feb 9, 2022 at 5:50 AM Mans Zigher <mans.zigher@gmail.com> wrote:
>
> Hi,
>
> I am trying to backport ntpsec from master to Thud but I have
> encountered an issue where python.h is missing in the sysroot for the
> ntpsec so the configuration task is failing. The ntpsec recipe has
>
> DEPENDS += "bison-native \
>             openssl \
>             python3"
>
> So should that not result in python.h being included to the sysroot
> for the ntpsec? Any hints on what to look for?
>

what happens if you change python3 to python in depends

> Thanks,
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161562): https://lists.openembedded.org/g/openembedded-core/message/161562
> Mute This Topic: https://lists.openembedded.org/mt/89021393/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

