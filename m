Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFCCE6FE48
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 15:10:59 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.24253.1695395455079650433
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 08:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xcxq4vPs;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5739972accdso2003253eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695395454; x=1696000254; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NT2Pyx9Uwan7tBODYSBTsCoiLuEitrKW7xZDwNgT5EA=;
        b=Xcxq4vPsj6MUXR0hgsiqC3AP+IuYJty6UW86vBZkDusZxupalKM2lsKbJzKMPMuptM
         JwCawk3g9gJQPLAVK7V3tR4UGh4EICyceC5pcQ+VPIEHuQF5yQQKa7zAtG5r3q94lX4D
         cUuK8P6Ui17ntGYvc29uH9Z63JBL1NBcOrY4jLYykLzHeAxNbTUFjYRdfpdqQh72ShXv
         pJsqv4s7e3/ltp2Kd+FhEc5kpbpN78OirbJZlyLtFsmBCC7TlmrrPngzMEC6tRJESKHZ
         Yxnq1B3ewNCCDtOhr9HZW8xvOOAJZxEwvF9lHm5QkroQ6apLK8FOTMgA2OlWspAlJaDm
         HqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695395454; x=1696000254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NT2Pyx9Uwan7tBODYSBTsCoiLuEitrKW7xZDwNgT5EA=;
        b=q+jF0He3BJkDtzCiLZVhC2iB2bT57phHzP1B8R6RPTFncq3jtZLtFLqJCTKz89I4k7
         0qX5h8bHZY5GNFvkiRVd2O0HV+WzyBRWmmlDckZ79pFWqKwEU44U5eWvyv0TrzmOnY3L
         blNgUli4OxDuPw6rc9iTPlFICBR9kTwCC5unncuDgUSETrEfMKeFLe5MsEfTImZdTgsQ
         AhhKf0OPvSWGcMsi3XA0ULWaWAvERQ+wDxiAWpJm8+8P0wxQZcHyIwiPhw205A6itmKK
         lAP3W2uYHCj899YmVzGvdkw4hglydt1IumIYITCmv79eyA5TkdKNAkElVdtfT0iGFV2t
         mlfg==
X-Gm-Message-State: AOJu0YxQ43sFdrx4QbWI6FFFaSIr+MeTGD9ne8VkduYjnlp/mvoDwrf4
	JoC4CAl7GLIH6eaNSmcSKPNOqlkYAAPkPga8yPU=
X-Google-Smtp-Source: AGHT+IGYoVOT6H5qCdUES0gb+MwSZPYC26F+NHIHxaQTk98H7D/n7fKwoTS11D0xkhV/wTnJHJs+thM9uivko6C6duU=
X-Received: by 2002:a05:6870:df90:b0:1ba:a410:4c53 with SMTP id
 us16-20020a056870df9000b001baa4104c53mr1439740oab.10.1695395454298; Fri, 22
 Sep 2023 08:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230922011520.23704-1-raj.khem@gmail.com> <2d66ceecc50d6a5041963c1afa9d55858c0e9bfa.camel@linuxfoundation.org>
In-Reply-To: <2d66ceecc50d6a5041963c1afa9d55858c0e9bfa.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Sep 2023 08:10:28 -0700
Message-ID: <CAMKF1soqXrRMfeFt6Gk-w9GfFN3CjjFW87qOeBi0F5Bx3kuvJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Drop MIRRORS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 15:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188121

On Fri, Sep 22, 2023 at 3:11=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-09-21 at 18:15 -0700, Khem Raj wrote:
> > When using mirrors fetcher gets into a weird state when shallow clones
> > are enables.
> >
> > ERROR: Bitbake Fetcher Error: UnpackError('No up to date source
> > found: clone directory not available or not up to date:
> > /mnt/b/yoe/master/downloads/git2/git.musl-libc.org.git.musl.git;
> > shallow clone not available:
> > /mnt/b/yoe/master/downloads/gitshallow_git.musl-
> > libc.org.git.musl.git_79bdacf-1_master.tar.gz', 'git://git.musl-
> > libc.org/git/musl.git;branch=3Dmaster;protocol=3Dhttps')
>
> That sounds like something we should look into and fix?
>
> I don't think it makes sense as a justification in a commit message.

I tried to do it in several ways and somehow fetch is failing. Only
way I see it work once was when removing the mirrors and rebuilding
after -ccleanall
see - https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/783=
6

if I git fetch these repos from any of mirrors or upstream clones work
totally fine but git fetcher always complains. No idea whats going on
>
> Cheers,
>
> Richard

