Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94C5C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 23:40:53 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.4631.1664840451807483985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 16:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X4kZqb5s;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: petr.vorel@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id c7so11018252pgt.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 16:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SYDkDtzXPcwLYZuDn4HnHxZw2dxZ1tJe5LRANNS/bjk=;
        b=X4kZqb5sJ/D9C9LoFRQBeoLkSwgmcMnXcPJWK5i9uaIjW6Tn0eh4bRx91NdpJdZxQf
         Tj0cLUvdGSwA5vWRnBvammfp0roAEkH6qSkr6x8d3ymfPDjHmWwfCR22yfOpRPvxg1/T
         Ue177SCX2NIT34UBK8A06zsa1wnh7YzAbkZjM4abfRDAfdM5ul957Bia8VcCG8XjiZIf
         HUnxLoSSdJH28DQtatW0F2MdiNwZt/oyln5EVVwnJrb0OaGyf4YPAni/QD+smV2isegN
         3QYYH6q583ROoXbXe7+4+FJA2HPCJHcx8tofjrUCTw0SRZDameuqXNtNZzoFb/9xEiKl
         bV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SYDkDtzXPcwLYZuDn4HnHxZw2dxZ1tJe5LRANNS/bjk=;
        b=XjrL6j+B5MTVQ81+F2KZ0Ph85N+9xQcikprB9uYvGLTSFTxVSxrGbaIwEaAvsTrIGU
         /0LCG1zGznCD+vo01CzJN27goY36A49vfrMEVKLDnjFolumlT3b/fsLxehrd0VL3/0rt
         TFqQ3XxCRFt+6aXUL9GoHBr91orTUcd3NmvYvJLWurr+8Kd3zhjABKz3mTWOIInIOWpc
         VIJDVjJDhsrsrCqL7SXLAdI8uBqMmPv2zUMoHMiTzfxB1MHJZUTCJC78caC1KrwPMqiD
         of7cAbFo+qgnWbLN6s759Tc6pkrTMFBV+tmKKpMlq7FDtwQoUGltPvE3WQvc4I90vNeu
         YV2Q==
X-Gm-Message-State: ACrzQf2/i9YQH3GemJZAZXfWPnQGRkv0ef87k4erAbeNOgruPyfzO+hL
	gFVJqjvEGwjl5jYtYFU3CXBUWTa6c8wVDSw3I5A=
X-Google-Smtp-Source: 
 AMsMyM6HuJI3rmYwV6KCwF3ry9+1qf/fLSGEgMTQekYqViuxIkT8RfkRlUaDGM2H9Sh27Sji5YBlhYduYt8baM7FzhQ=
X-Received: by 2002:a63:2a89:0:b0:439:398f:cb43 with SMTP id
 q131-20020a632a89000000b00439398fcb43mr20504726pgq.187.1664840451168; Mon, 03
 Oct 2022 16:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221001172107.16226-1-pevik@seznam.cz>
 <YzoHnx9HCBBTdOiR@mail.local>
 <CAB1t1CwNFHbJG=not9MD3QELx2pqcoaibR2Q8fg7yNUs_NBXUg@mail.gmail.com>
 <CAMKF1sqf9=pEfaOOS1DQ1S7LD27BwVzi_x-RnW=Mb3-HGA4tmQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqf9=pEfaOOS1DQ1S7LD27BwVzi_x-RnW=Mb3-HGA4tmQ@mail.gmail.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 4 Oct 2022 01:40:39 +0200
Message-ID: 
 <CAB1t1CwjsMqnAsRhAZumvDR73eNAiWt-XiNam-2fjEK44MGGUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20220930
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Petr Vorel <pevik@seznam.cz>,
	openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 23:40:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171368

On Mon, 3 Oct 2022 at 23:33, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Oct 3, 2022 at 11:49 AM Petr Vorel <petr.vorel@gmail.com> wrote:
> >
> > Hi Alexandre,
> >
> > ...
> > > > Hi,
> > > >
> > > > could you please test this patchset?
> > >
> > > This causes the following warning:
> > >
> > > ltp-20220930-r0 do_package_qa: QA Issue: File /opt/ltp/testcases/open_posix_testsuite/config.log in package ltp contains reference to TMPDIR
> >
> > Thanks for a testing. I wonder why this is problem to use TMPDIR.
> > Also, there already has been many TMPDIR references before:
> >
> > $ git grep -l TMPDIR 20220527 | wc -l
> > 139
> >
> > $ git grep -l TMPDIR 20220930 | wc -l
> > 141
> >
> > And the same number of them in open posix:
> >
> > $ git grep -l TMPDIR 20220527 testcases/open_posix_testsuite/ | wc -l
> > 1
> >
> > $ git grep -l TMPDIR 20220930 testcases/open_posix_testsuite/ | wc -l
> > 1
>
> I think the problem is that these references are inside the config.log
> file which is getting installed.
> I wonder if this log file should be installed as part of testsuite on
> target or not. If this file
> /opt/ltp/testcases/open_posix_testsuite/config.log is
> not needed for running the testsuite then perhaps its better to just
> delete it from ${D} in do_install
> and that will fix it.
Thanks for a hint. It's not needed. BTW I don't have enough time to
test the environment,
feel free to take what I prepared and post v2 with your proposed fix and with:
Co-developed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

>
> >
> > Kind regards,
> > Petr
> >
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5988/steps/12/logs/warnings

