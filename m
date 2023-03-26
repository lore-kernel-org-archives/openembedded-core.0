Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE87C6FD1C
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 16:57:24 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.14357.1679849840381591183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 09:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MvzfAZzT;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id t14so6565942ljd.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679849838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5+WJEKQQy9pn3DIkFXyVtrtneBRy6JwKst1u1cENnI=;
        b=MvzfAZzTZlB14jUW8vxj8rP7cXxwR8tjDCl26HgdEHNva+X9NV9Wf6CPV2T0uMsf/T
         J0juUxYS68Gr8cjwgruM2fvWxtZUqg5Es86toat91oUTXJ4grf/fd6v7SsdK2nIXOPU8
         4pCoR9gCB10BDctp6vIImAoMm3qr6sZGI2uTXQZck1Twix9X+gYc/DrmY8e47Be5pJ6T
         v/DjjDJ/9yVkzhD1Y+rmfSC/xr7PN2VqZrhpOlkvnFA0RyMg84RkDrA19hrWsGCZ5QsJ
         R5nymbmHIr0TjlWx7mnUlkgczs/KOAyR3AKzNrWiNXApkVYdbp/RpGCJpN5YD5oWzA6f
         xsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679849838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5+WJEKQQy9pn3DIkFXyVtrtneBRy6JwKst1u1cENnI=;
        b=59HdrG4JzGHOcgo4ljwP06IOpZwfSKpc8Asv5e/0/mcgp98BIy5DdlLnE9XgTzmeIL
         a2W99+iiMEkLLiaQHQj84TAuCMwKl15g0lPC6HsSp1Zq3Nycf63KExZzAmPZg8uWw7Ge
         kAilreh+2y544lKO4yZB066Tmwpy4M6q1lnc8DISljPtyzfZ4i2q3OC4QSju9ZB1Lfap
         DWuLBAoUm7efKMVuqQoI+HWEEZ5Kgu3Z6ZdtRWBQoba4jkLVIDsahV948nWQ8tFbbx9O
         CiUiuHjdwrlSbULBPO5Pe1A3mT8Bgj1sXqMmgor3hGxMf66T+LykjeJJhgFcCr+xMV30
         x4GA==
X-Gm-Message-State: AAQBX9fDFrjGygp1cMldc6ftj5cFz4sMGRuF57j3+CMe5Il055f68hwe
	Vcft37Pj2n+/Op6VZ10kvJZPfTZJWegxSgLncatj6Kry
X-Google-Smtp-Source: AKy350aeOThgMtiFij5FzWBBf+OQCLvSRi6fE1lkuSyC9BDejQUf9z7PA7b/Qqd4cDW0xSOW2h60lsgGV700A4uOuvg=
X-Received: by 2002:a2e:6a12:0:b0:29a:9053:ed22 with SMTP id
 f18-20020a2e6a12000000b0029a9053ed22mr2719855ljc.7.1679849838422; Sun, 26 Mar
 2023 09:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230325004818.2784943-1-f_l_k@t-online.de> <20230325004818.2784943-7-f_l_k@t-online.de>
 <CANNYZj-RdghFdcmNa=NeA1tqxe1SkcgbsN3d2H18y54MrOzyVw@mail.gmail.com>
 <174FBE6FF0B9B09E.25304@lists.openembedded.org> <98D3SR.ES0FR9UCE62O2@t-online.de>
In-Reply-To: <98D3SR.ES0FR9UCE62O2@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 26 Mar 2023 18:57:07 +0200
Message-ID: <CANNYZj-BQ2mgoPR9iOx4RVsSo6eiC5bgSt=YbcxSY=d6xgEO5g@mail.gmail.com>
Subject: Re: [oe-core][PATCH 7/7] webkitgtk: update 2.38.5 -> 2.40.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 16:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179131

On Sun, 26 Mar 2023 at 01:43, Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Sa, 25. M=C3=A4r 2023 um 19:56:00 +0100 schrieb Markus Volk <f_l_k@t-o=
nline.de>:
>
> webkitgtk-4 is confusing for the gtk3 variant, but named it anyway becaus=
e meson reports that webkitgtk-4.0 is missing if it is not found
>
>
> During the change I noticed that webkitgtk-4 (built with gtk3) also  stor=
es its libs in ${libdir}/webkit2gtk-4.*. If I now rename the recipe to webk=
itgtk-3, won't the confusion increase?

I expect that webkitgtk-3 is a transitional recipe due to some
upstreams lagging behind in gtk4 conversion, and will be eventually
removed, at which point everyone would just be using webkitgtk as they
do now.

Alex

