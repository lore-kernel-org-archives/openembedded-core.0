Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9922C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 16:49:15 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.903.1715964551257417763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 09:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JbOdLqPl;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-24544cfbc69so207345fac.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 09:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715964550; x=1716569350; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IX6vFDQWlqZ6gzwmQqCMjMj3XDpYmAc+mHPoXEDBv5I=;
        b=JbOdLqPlsb+CszAg4IGSgF5ATpo80WmobIH6AcE/1sYlnlHnSbqSq4pSlOn3lGEt9w
         fJiYrosCgJguN4aUy3fLC6XwfBkNDoJf8Evc0o1eh6Zh7bLC8yFTXKldxqMK3BAtMG5f
         uWZsaYsHNBQQLEGxDdH18CgpTiyG7J5M6Z/2zqeWANwxDX5r80D6TvHlRPlLfex1CUhM
         7GOJO9kO/UOCPVOQzG2nItJ0arC58RUDTBADd7Y9w2HPNgbZ8ekg+EtkKc0iczKGCjQn
         IcpIAZqXJ6gJO9oMHLGpXBIGt83tAz39cjjWS0xdrW5JqWP0889C1SktDiO2rtoUQYQi
         I0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715964550; x=1716569350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IX6vFDQWlqZ6gzwmQqCMjMj3XDpYmAc+mHPoXEDBv5I=;
        b=seKhnrSLe3etJjezSDS+7feBAocG0ZWlv0RwCYRCbAqZyK6GN0sLzYAH+qT2VSi2Q1
         QgT5R212JwvehopADHfRYoT8OlZJnB5hHG+6COKGaa0bmw0cAg3AflKxnJDxqYc2YrpK
         g/t3MXuN+I+x6bThTX4LeOsXaWX986sVtDdJYJTDOd2HOmjiNY31lvNrdHQnuDN1pCXu
         zFzyRnZ63XqnOLvLw9+FimDQ5QPLrlGyuC3KdLvigPAFacl9Ej65TP3wldN5uBtCC2V2
         H5ARLKvNYBtgPTfXKMy35l7iu42OklIe0cIGu7AQJfJtCZicqXTnCgYX57stw6XOXFHP
         t5FQ==
X-Gm-Message-State: AOJu0YwF/WgaVndFzz4NGkHQDeiMBcGdirawsyVaNgNXG530+ZE1Q81r
	nT0j8BBcXsYV8ANTJAnuoN6bat/Oy1zfjT3ymr8tOwxzDfTfuVB3hE8EgTOhpaWjEellSml6hfW
	mLyWl2/ML+wyIlQl0ZmAnIPzMaK8=
X-Google-Smtp-Source: AGHT+IHXB+xTSaBAwzOKW+h1lJLqJUekWIybh9BbqT+uTR2pkQavYO1jHvlAbawfBCgvG/F0Rvp73Q7BSeMh+5N5jTQ=
X-Received: by 2002:a05:6870:478f:b0:22e:8ed:9f7a with SMTP id
 586e51a60fabf-2417291dec8mr24543284fac.4.1715964550334; Fri, 17 May 2024
 09:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240517162237.3941083-1-sundeep.kokkonda@windriver.com> <20714.1715963613869990683@lists.openembedded.org>
In-Reply-To: <20714.1715963613869990683@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 May 2024 09:48:43 -0700
Message-ID: <CAMKF1sov3reBK_2GwRyHx_EHWLFEi=W8BF90AYsHXXPbwEqEmg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates.
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199523

On Fri, May 17, 2024 at 9:33=E2=80=AFAM Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Regression testing is done and below are the results:
>
> Before glibc update:
> -------------------------------------------------
> Recipe       | Passed     | Failed   | Skipped  |
> -------------------------------------------------
> glibc        | 5037       | 123      | 156      |
> glibc-user   | 4858       | 231      | 227      |
> -------------------------------------------------
>
> After glibc update:
> -------------------------------------------------
> Recipe       | Passed     | Failed   | Skipped  |
> -------------------------------------------------
> glibc        | 5043       | 123      | 156      |
> glibc-user   | 4866       | 229      | 227      |
> -------------------------------------------------
>
> ptest shows below tests as failed after glibc update:
> tst-malloc-fork-deadlock-malloc-check, tst-robustpi7, tst-thread-affinity=
-pthread2

Perhaps the load is high on the machine running qemu ?
the results look sane to me otherwise.

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199522): https://lists.openembedded.org/g/openembedde=
d-core/message/199522
> Mute This Topic: https://lists.openembedded.org/mt/106156894/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

