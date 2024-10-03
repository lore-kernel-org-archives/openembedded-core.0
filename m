Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D617CF34BC
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 17:03:28 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.1960.1727975003881905227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 10:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PI1rZ5MY;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-287759c0fbdso687922fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727975003; x=1728579803; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdWrHMPu7sdnYBKFDzXQzlIant0FIPO/+Cefh/N4C3M=;
        b=PI1rZ5MYlCt6BMEvQHiUPhApxY49g2vgAsGBVOgQp7vNzmfwAp7UkTtRF/wpMiLSII
         ebRaW77DgAaXi5RWuoX8q4tK3X3qgrd4++1QQLRZZ7Hae2Q/aIFSdQzGxplF6Q7A/VjA
         5DaXmHXAXt4Hd3dV8XgUAc+9az9NKLVtHTfpBS06jaRo2Q5YU9kbqtBK58z0hyW0DWS4
         pOtg+C1vNQ2xOiNyd4up+5Xl2sZ8lh71Yvdz9qQtFuk6V6qNIWbbC16DGr4hwwPF3OMA
         s9pRyKr61MqQfO6iFlNtNHleWiwk2M8BHLiaZRuBwjxPgx2ljkfZ8Wim2fK2x5hlcIOQ
         2Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727975003; x=1728579803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdWrHMPu7sdnYBKFDzXQzlIant0FIPO/+Cefh/N4C3M=;
        b=bA8voSLgRm84XJNsH4cVKu8thJqt5PszM3qwcdsEjkgzHLERSXzqR/s830EP0zGOrR
         uIE7ovhbhgOpOFgol+EIRJc3l3aPET81ae1WD/GWOPvdfF9SYyEXbrO4sMiXrqt+pW4f
         FLy//KbS/uLYazSEM4ZXsEAaS7h4a5o0BM11EPm7ewJh/crmTCwd7rS1o2GWgCEXC0Zo
         0VxCRbUzJXxOT4NcBH6z69en4f9Y7JP/2XxSZtgjSjl8/kCH/2AmghOqniscmCdCAwUM
         RiXLkfboMzo54SDog/jYCWGHt9qyclI/raO6jb6YaSc5ILtVMCUnmLzC3TxsqWYm/HU9
         XOoQ==
X-Gm-Message-State: AOJu0Yx8i7+3hMUjU+zeK3vkBFtipinqufB1FDmmcXN7vl37xBpIKeE7
	Z0qMxKMlnXz8g3KysO72yh3UffDCsxRXXGC7Gq5LyAR6pB6/WvCTs9dcT0fVm3bxIs9yscv9YBH
	WHDIXZw2tk7aM9CjIklFvG/I7UdY=
X-Google-Smtp-Source: AGHT+IEjSeaQ4tQ1mnz+NIOF10rkb8OevmiNd+FmYPJ4CyVGtcMz2ndMGDfa82/usbLUlcq0ZS8t1PMqq2aetNmfD5k=
X-Received: by 2002:a05:6871:281:b0:287:31fe:de95 with SMTP id
 586e51a60fabf-287c1e343a2mr84877fac.28.1727975003079; Thu, 03 Oct 2024
 10:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soz6mBG3GiGkT9mRcvVu9+sXpU_gA-vm+zPnK9LEsKeKg@mail.gmail.com>
 <26848.1727974574916875913@lists.openembedded.org>
In-Reply-To: <26848.1727974574916875913@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Oct 2024 10:02:55 -0700
Message-ID: <CAMKF1soMgbTtzBOBd9C1XORvY0A0PWYEULpPGsFN-5wrtetzvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: stable 2.40 branch updates
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 17:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205210

On Thu, Oct 3, 2024 at 9:56=E2=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hi Khem,
>
> I analyzed the issue further by debugging it manually and observed that t=
he testcase "malloc/tst-free-errno.c" passed as expected. Hence, I ran the =
testsuite again after the update and found that the issue was not reproduce=
d anymore.

Another intermittent issue it seems. For future I would suggest to do
more than 1 run and save the logs, I also wonder what is the spec of
VM on which these tests are running.

> Please find the following results after the update:
> After update
> PASS - 4946
> FAIL - 223
> XPASS - 4
> XFAIL - 16
> UNSUPPORTED - 229
>
> Before update
> PASS - 4924
> FAIL - 223
> XPASS - 4
> XFAIL - 16
> UNSUPPORTED - 229
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205209): https://lists.openembedded.org/g/openembedde=
d-core/message/205209
> Mute This Topic: https://lists.openembedded.org/mt/108643422/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

