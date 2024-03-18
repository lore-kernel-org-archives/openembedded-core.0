Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF11C54E69
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:17:46 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.52608.1710785860284450087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 11:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TWGlLYo9;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-29c4fe68666so3675996a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710785860; x=1711390660; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBbe96gDitmUIQMlPZnDGqsK7nVrREY/WM/go7LHelE=;
        b=TWGlLYo9mbahkABoCcxAr3q26sTpbBM8U0mGTlyG8HppjVkLJ+jB0Pr8/L8RQTPfsE
         HI45joELJ+n6ifrlzNnlgsEodVwU1m7ezBFOIdONHQZoL+zOPXgIX2p1CMNWZGmHDyGo
         QeEZF7phj7c2r7Zt2jKOePUprMTwrQudXhwrXWeMK0SqYtZeoGZSmkINS2iFuFQ1xRnJ
         GvvWfTLkwUHzcfsgsC47tn2gh4Mom+XDn7o7lWQ7Amefg/ekHGKJcA5PlXaIh7Jns36E
         zVewydLbTz+5xWaHFEg5I4YE4Ro5a9Qp2U442eunmy14J03c6JVK6KOPDfPa6xeN4RXY
         VyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710785860; x=1711390660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBbe96gDitmUIQMlPZnDGqsK7nVrREY/WM/go7LHelE=;
        b=GIo8BCJhBp+EklUhnmUfnaUOHUtB/AwjUQmP6iAN2xof7uFC9M9fqdVDCw9Baa0Mu7
         8dFwevT3zc8Lx7xPIEa7NN7j2S52iVWeuLb2ec17ulDMKchNdiOBT0ARbXeu3KWkugFT
         DT/9mHwN5Kyz2fembjYW9dtFvSBqn6BCMNMG9yaluRb18XfRwn+nOFwIakJoC23kdA1J
         50M4JB/L/Ulhl8XwhaHetXapTv67nUebZJegRORtbz7dFW8Z5Hz4ZJdUgkjmDRuYJf3k
         2kFtatuL8XrnYVUOIf5Ryh1P+1Npr+g5yrieNqnpCjT15xoVRjyhH17k8cow6RBqiTw+
         pZIg==
X-Gm-Message-State: AOJu0YzXgFkkIIiUVdtKSN5zy/0qAi3/1N0rPYCHDUIFlzK1clAY7XKY
	jLBVCnW17kWgiHxaFL+i6PrLhUA1PfuEM0Xep16IvVoiHVvzQyyHLNB/3l1lLFiYtMBFvdxHOGe
	MOeQevZBAmVaqcNo3/ud4wlZ2ONs=
X-Google-Smtp-Source: AGHT+IHaHR65F6x4L5SZ/OrJoI/Rm2/feIPqYJqmBANymjtS77OKbTXD+t+fx2JGg/r04BrD0svM3/C4jtUT8y1UxNo=
X-Received: by 2002:a17:90a:c252:b0:29d:51f5:212e with SMTP id
 d18-20020a17090ac25200b0029d51f5212emr10549005pjx.41.1710785859459; Mon, 18
 Mar 2024 11:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240318083243.14536-1-liu.ming50@gmail.com>
In-Reply-To: <20240318083243.14536-1-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Mar 2024 14:17:27 -0400
Message-ID: <CADkTA4NcH+UmpDo3mpiUmFUYvB-=QJ7=_x+wdwOnEmYwvtWzhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: introduce KMETABRANCH
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 18:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197311

On Mon, Mar 18, 2024 at 4:32=E2=80=AFAM Ming Liu <liu.ming50@gmail.com> wro=
te:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> If I want to try a different branch of linux-yocto in a bbappend, that
> could be easily done by setting KBRANCH, but there is not such a way to
> do the same for kernel meta.
>

The hardcoding of the branch (versus a variable) was intentional, since
unlike the kbranch settings it is the same for all BSPs, and it is coupled
to the kernel version.

I vary the repository and branch by overriding the SRC_URI versus
changing it this way (as an example).

That being said, it isn't a terrible idea that it could be modified, it jus=
t
isn't something I'd want recipes changing.

If it is something that can be changed, it also needs to have a check that
ensures the kver in the branch matches the kernel being built, otherwise,
it should warn. Much like our kernel version check (variable vs source).

Bruce

> Introduce a variable KMETABRANCH to satisfy that.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
> index 0f62dea29a..381e20461f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -39,9 +39,10 @@ BBCLASSEXTEND =3D "devupstream:target"
>  SRCREV_machine:class-devupstream ?=3D "9b4a8eac17f0d840729384618b4b1e876=
233026c"
>  PN:class-devupstream =3D "linux-yocto-upstream"
>  KBRANCH:class-devupstream =3D "v6.6/base"
> +KMETABRANCH ?=3D "yocto-6.6"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH};protocol=3Dhttps \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3D${KMETABRANCH};destsuffix=3D${KMETA};protocol=3Dhttps"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>  LINUX_VERSION ?=3D "6.6.20"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197295): https://lists.openembedded.org/g/openembedde=
d-core/message/197295
> Mute This Topic: https://lists.openembedded.org/mt/104998899/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

