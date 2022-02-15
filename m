Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE65C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 16:17:57 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.11615.1644941876873327635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 08:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=blyWOLDV;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id o5so18055106qvm.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 08:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KMML6fUbrNu5mz4bK9enFHDsKzNXCsGfF/PARbr1uek=;
        b=blyWOLDVwdL13758O89zhmnMMyS35Fdg5r3T0xSohbr2npdPvgbFqoxi0Si9x9mE74
         co03pkgwE3ZigNa1zLx0bG+kAgybklhSWyaCaZ2DRWMvM1kOEXhKmzzVZZ9ITRzpSLWL
         ConicFws9qhEYO+7JhJ0PyHwZvCOWLdEmnKPfIR5fU2iEN0wuSwETZhoNqE7yms9/BSo
         sPR4EsEkqxaKQMEzRB5gm6ZHatz5Ct9lA4Db0sDBNNrDyVd24zt+KwAwB3bYwA1LYEhW
         ecBelYed3h0sJfv2F+tZR2xzTmI1GrJBomuiKN/zIjYYF4zTQaKAk1cDoKIobkYXW34T
         Jjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KMML6fUbrNu5mz4bK9enFHDsKzNXCsGfF/PARbr1uek=;
        b=6vPhB+PM8BuXJUPvRXLWznk2p5a2W0z17tetDaO1Kl6EjBzqBUKRVXnaxrhaVTX6iE
         U42NQjrCgCNbGSu6bS6cUK0C2JnUbb0g7sjXcMA5t4PHK+fiMykLLhV/78MxFMBrmnyt
         8/g10t6nElu05KNyffSqe8ktiffjkfToz1X4FobQwohrXKYFatw5Tpqp1iBBvHFZCVfd
         DbrrmTovp+ZCMtRo5ZdjlhsYMhkz0IjhJZg9jkbLpgTco7llMrOwATO3xIRMZqnMpK+4
         ltY5c4baOYbNDHKVQVIad8wXoEegIFIIseAIZtVsKIOMUqR7VwHCL04SWC6+lB6yxfPq
         f4Lg==
X-Gm-Message-State: AOAM533nvGQZFhTLjNlvXysLwXK45YO1neDQwmCPFRkI6rDYF2hvKiXG
	1Jk0tLqn0zuNbZX11CCfPQsmJRJS5ejHwkIXkxA=
X-Google-Smtp-Source: 
 ABdhPJx3Kz4SN63rd6SrBKM9z4Che3DNfNqGN+aB4IhmAMpdwBezNWfu0dZmMXGAaioLZYVk7aDOiRPX3HW0SwKi9Yk=
X-Received: by 2002:ad4:576f:: with SMTP id r15mr3320372qvx.16.1644941875787;
 Tue, 15 Feb 2022 08:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20220208225310.1685131-1-raj.khem@gmail.com>
 <333ededd-79c4-8a21-b6a5-8012b5f793e3@windriver.com>
In-Reply-To: <333ededd-79c4-8a21-b6a5-8012b5f793e3@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Feb 2022 08:17:29 -0800
Message-ID: 
 <CAMKF1sp5rtBg0tf4mN-9VBUxVYXbqrA1i8nQe-L_8MHNRapj1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
To: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 16:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161754

On Tue, Feb 15, 2022 at 12:25 AM Jia, Hongxu <Hongxu.Jia@windriver.com> wrote:
>
> On 2/9/22 06:53, Khem Raj wrote:
>
> diff --git a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> deleted file mode 100644
> index 3283dd7ad8a..00000000000
> --- a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Sun, 29 Aug 2021 20:49:16 +0800
> -Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
> -
> -Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and clone3]
> -applied, start a unprivileged container (docker run without --privileged),
> -it creates a thread failed in container.
> -
> -In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
> -__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
> -
> -As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
> -CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
> -was specified by an unprivileged process (process without CAP_SYS_ADMIN)
> -
> -[1] https://man7.org/linux/man-pages/man2/clone3.2.html
> -
> -So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
> -fix the issue. Here are the test steps:
> -
>
> Hi RP,
>
>
> I found this local patch was removed from glibc, we have to get it back and regenerate uninative to avoid the thread creation failure in  unprivileged container
>

I intentionally dropped it since upstream glibc will not accept this
patch since its not glibc problem but
rather container runtime problem. Can you investigate that path before
we reapply it. Maintaining a rejected patch is last thing we want to
do.

>
> //Hongxu

