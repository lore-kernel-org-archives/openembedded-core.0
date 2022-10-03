Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A263C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 21:34:03 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.3384.1664832833075619216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 14:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MEYUgaUP;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-12c8312131fso14509961fac.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 14:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=R1yUc87Vke4LRh/a4EgGFjEBgSek+C3ZQQ3yD7i5VdQ=;
        b=MEYUgaUPA+R9QNKshRdPQMChJ/t0ga7VulSh8UINppIIViDE4IzIx2nj72pBDvPoMm
         HIklrDYlPY+t4sxeq5b/8r8bQPy5Va1CfCDIdMwoQDjkZgDWVUFq+iiFjx57Gx1EFb2M
         EWUdzAve+rNtf0tuQ2Xt7uu0/jcqhxyiTCr7x3YyDsj4KuePcNe95f6xnxmrhhtLA6Lz
         vPcocO4X0U4+IhA5hN8oHeAoy1y1pA08t6//tiojnXLIZ9MBK0VGZUuY50fFpAi0iew0
         Jz8PMO+uxsSISd1qnw31zwyyofH/4msJ/DZhZ/I7Hh5LO570TlFbRZPI7IjQq2sry56G
         YMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=R1yUc87Vke4LRh/a4EgGFjEBgSek+C3ZQQ3yD7i5VdQ=;
        b=LpG3vEIaKTdOixLqYsNgmThjEKLTuf3zuZLfABa1hgxUg9r6e4D+EMEmFBL+6J5oKG
         q3oD0s/ok7BOSvFyBTsv5UytEyielZLQD1tdypuYGa5giPdrULkEqYV4MlHJi4Fe9c1n
         QyhmDgzRM3XLPY95cRr0DhXwUCToeq9CybYr+nQkjFYmyjxOLS91IrEzvKB5gtm28nBK
         15oPk3O2lPE42AOQO9Z4K1ynfdjReSNmln2+zO+jLyPw2QqR4wiciKfK9YmjQiX7HdMV
         dbqMVYVtxlXqMk0mi+hZy+3nSzNzotoOpJlTPie7h+HX8C3hy84BoKU1312n0OGqLmX5
         t0Dg==
X-Gm-Message-State: ACrzQf2XVJZEHmPkObAXzCw2/rcxZdL3eZP8zGA4g3eLMpPAuozZwCGc
	hLmuIsGULzQ0qzzWsgP8lmXfg24Oal+D2mH6bss=
X-Google-Smtp-Source: 
 AMsMyM6xmWwGshCIY8bUR7Dlgps+E3lcKfTo7jIMGgDsj8SenaqHbq8Wtx5Vt/leNUm1jM8mrUkxrdOZn44Si169CJE=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr6120760oae.262.1664832832321; Mon, 03
 Oct 2022 14:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221001172107.16226-1-pevik@seznam.cz>
 <YzoHnx9HCBBTdOiR@mail.local>
 <CAB1t1CwNFHbJG=not9MD3QELx2pqcoaibR2Q8fg7yNUs_NBXUg@mail.gmail.com>
In-Reply-To: 
 <CAB1t1CwNFHbJG=not9MD3QELx2pqcoaibR2Q8fg7yNUs_NBXUg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Oct 2022 14:33:26 -0700
Message-ID: 
 <CAMKF1sqf9=pEfaOOS1DQ1S7LD27BwVzi_x-RnW=Mb3-HGA4tmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20220930
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Petr Vorel <pevik@seznam.cz>,
	openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 21:34:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171367

On Mon, Oct 3, 2022 at 11:49 AM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi Alexandre,
>
> ...
> > > Hi,
> > >
> > > could you please test this patchset?
> >
> > This causes the following warning:
> >
> > ltp-20220930-r0 do_package_qa: QA Issue: File /opt/ltp/testcases/open_posix_testsuite/config.log in package ltp contains reference to TMPDIR
>
> Thanks for a testing. I wonder why this is problem to use TMPDIR.
> Also, there already has been many TMPDIR references before:
>
> $ git grep -l TMPDIR 20220527 | wc -l
> 139
>
> $ git grep -l TMPDIR 20220930 | wc -l
> 141
>
> And the same number of them in open posix:
>
> $ git grep -l TMPDIR 20220527 testcases/open_posix_testsuite/ | wc -l
> 1
>
> $ git grep -l TMPDIR 20220930 testcases/open_posix_testsuite/ | wc -l
> 1

I think the problem is that these references are inside the config.log
file which is getting installed.
I wonder if this log file should be installed as part of testsuite on
target or not. If this file
/opt/ltp/testcases/open_posix_testsuite/config.log is
not needed for running the testsuite then perhaps its better to just
delete it from ${D} in do_install
and that will fix it.

>
> Kind regards,
> Petr
>
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5988/steps/12/logs/warnings

