Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B23FC4828D
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 08:15:40 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.13616.1706948132501162931
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 00:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b354fnr2;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-59883168a83so1470670eaf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 00:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706948131; x=1707552931; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWIutkzjvX4KHTWi+MebaK/UMV6saaE82O/9RUipfa4=;
        b=b354fnr2n7vlGIcozgk3Et7iVKQ223JvYTjTIF8cHbvr0hijIRQQO+6Z8XZ2sbysud
         cLZrjwOX0kWeHJQvdNjFyAbIg2Tzzd7UTeJeqQ3nrloS9yWtN3OiV3e63/ldWVeULwOr
         R7AgZLFmArY7U3G5U+hMMkyDXtPINZoWbGRigl2xuSRTNVJ4ClEowzsEhXFFL/JJM4Gv
         9FlbpCL7a4wb5jNt+wYA/vQ48TiYm/9mBJDE8Sy+aU53MJcktRDVYlH0/gzidGwqWcrm
         SB5VXRIThCg8aWAb0UUd73l2nC66906ZsSeBQmSvx1bp7C/x3+vrPlxCHjaKfIdhoPFS
         uxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706948131; x=1707552931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWIutkzjvX4KHTWi+MebaK/UMV6saaE82O/9RUipfa4=;
        b=akHc36aMKILgC6pQvvubddN9Pp4xJULR55UZTW742E8rmCL6q60oZm5PfHTgpuTtbF
         XK0tXpx8mI5ZF83Cs+GIH9GZUNrbzwmp/E3JmFbUl3uXMxxrWmqRrJTI3KksF/hZawn3
         Capf9sV4KfmHMTV4Mq+XUhdvw7RT+5AJEizmx8Xp2tCkG8hVRIF1QSWzx+ToQ1sum+yX
         WQoM22HOIfpyzt8NqSqLjt+AqHbGhD3k+HokuvQlM6g0dh1YsT1YncCEjx0S73lFbnyz
         bJNAL3dGujLyeJaBqaASEMaVlF+kmOXozo10jEEAJiozGvMgw4iZ+KD4c3nmni4q3Q4o
         Ed2w==
X-Gm-Message-State: AOJu0Ywv7ZwSXnPjlDng0uKKjic9CUVRDB0yxyp3w/y3Vuvn0Kcm3MWc
	Ux1JrO9/QmUPkoev+MmE60K1bgAOYVwQrtzjUHZ9sVOmSgcb9SAkfcT8rf+200J4tmcEGD+gjh5
	Xp47lkuCUSN4x+O7xBquUWw2y0FE=
X-Google-Smtp-Source: AGHT+IFikzR1mGlORPk5ifziMG6XMb6x/ozbqpD+PIT4EUwUmzwWCmLXU/ZZrmR/eQhtS1o1yc3uTm0RpKaFgszPupQ=
X-Received: by 2002:a05:6870:1495:b0:219:47c0:d46a with SMTP id
 k21-20020a056870149500b0021947c0d46amr991624oab.16.1706948131434; Sat, 03 Feb
 2024 00:15:31 -0800 (PST)
MIME-Version: 1.0
References: <20240201222401.565583-1-raj.khem@gmail.com> <e490accbe222726fba2d51fadb40040b0608a172.camel@linuxfoundation.org>
In-Reply-To: <e490accbe222726fba2d51fadb40040b0608a172.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Feb 2024 00:15:05 -0800
Message-ID: <CAMKF1somo=Uma9ze-tiRw+iJkg6T0ikf3NDDyVvq4QtNEYjD3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] glibc: Upgrade to 2.39
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 08:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194836

On Fri, Feb 2, 2024 at 11:54=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2024-02-01 at 14:24 -0800, Khem Raj wrote:
> > License-Update: Relicenses the IBM portions of resolv/base64.c and
> > resolv/res_debug.c to a new license that does not have use-limited
> > patent language [1]
> >
> > Upgrade localdef to get glibc 2.39 build fixes
> > Details of release [2]
> >
> > Add fix for mips clone3 crash
> >
> > [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dae49a7b29a=
cc184b03c2a6bd6ac01b5e08efd54f
> > [2] https://sourceware.org/glibc/wiki/Release/2.39
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> I think we may still have an n32 mips failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8562/st=
eps/27/logs/stdio
>
> #   error "_TIME_BITS=3D64 is allowed only with _FILE_OFFSET_BITS=3D64"
>
> although I haven't 100% confirmed it is this patch.

most likely, I will take a look later.

>
> Cheers,
>
> Richard

