Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBF1C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 18:49:22 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.1397.1664822952595883462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 11:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nFTCptka;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: petr.vorel@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id l12so10476304pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 11:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=aUhRCcjj74YFstTr0m/S1/Fo5G4kZawyK1+MzA9apXo=;
        b=nFTCptkaQxFeFiQ9NZn6WtKpsPOKlF2KygIuyUQacE71ESheXALbdpvZYhN6hjD0lG
         YpHRD3w/Sas6fxsW5ej3STcPkQKFdIofAVMZfO+pcvUxm/p4ze38LjqiIcgyAGp+5UhL
         FG/iVi3O66fvuwMRCKxkvabSl4ZYJUnIy3n8ENkOA3QcSyxiaWm4i9O+3IGBSlMpH4yk
         QotCgF/Gt1j/KSThV5lPSZBoE5nIEju0stufFbaDNJWpVhHPePFe1t7Z9U8qdnvUSEeH
         bUQsJJXOhspmLi+wPp8FSgsIsF0I4VJSDeCJgZWewLwZFW134QQp8lnXASgP2q27A9Kc
         B2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=aUhRCcjj74YFstTr0m/S1/Fo5G4kZawyK1+MzA9apXo=;
        b=tsGSQboeOe70luX7Qii5imUIpGxKYkhXAU3DFczDbX+dRj0YNGNU/HTzxW+vviIovF
         nqk0dASaSEa0vO4ucP6w+AwtpNmkKYVdZ++9D4ZW2ndEJGGixM5mmmtnffOsji8ApzBZ
         tVsIqcFCuKln/jJa1b3FvHSW50pUxZCY69zP2tKul4e8qwyIX0FjInTClIvzU/tMlGVB
         pJ3DtGNHGFDnT0gBKTqbThRVJk9wTBtb1GDXnZfKLLwribWn7rrq29iwxY5GoPlwSfNe
         pmkdv3FRNi9zQmSLXxJXMXZb+QHa9KDYhszT5zIf1HBp8W+oZ8A6zieVXQiXgA4TUXPX
         Nmkg==
X-Gm-Message-State: ACrzQf3eAZY+TW7MNi86jTXMRmQFBIYKkKdsY8yZLnRrSMBl63zWPFky
	Yc74hBh0hVEEEvlKw7xesFWJIqnt4UHBeUC6XtA=
X-Google-Smtp-Source: 
 AMsMyM54X7apT5SZTfb0hvDUGjjRFbrQEilCbPvTpoUzKgjTTg9IpJuIFrMGFwFnETfMDzArOxVJekJ/cn+e4vrhjT0=
X-Received: by 2002:a17:90b:1805:b0:20a:cd8e:abd with SMTP id
 lw5-20020a17090b180500b0020acd8e0abdmr1035545pjb.94.1664822952049; Mon, 03
 Oct 2022 11:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221001172107.16226-1-pevik@seznam.cz>
 <YzoHnx9HCBBTdOiR@mail.local>
In-Reply-To: <YzoHnx9HCBBTdOiR@mail.local>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 3 Oct 2022 20:49:01 +0200
Message-ID: 
 <CAB1t1CwNFHbJG=not9MD3QELx2pqcoaibR2Q8fg7yNUs_NBXUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20220930
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Petr Vorel <pevik@seznam.cz>, openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 18:49:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171365

Hi Alexandre,

...
> > Hi,
> >
> > could you please test this patchset?
>
> This causes the following warning:
>
> ltp-20220930-r0 do_package_qa: QA Issue: File /opt/ltp/testcases/open_posix_testsuite/config.log in package ltp contains reference to TMPDIR

Thanks for a testing. I wonder why this is problem to use TMPDIR.
Also, there already has been many TMPDIR references before:

$ git grep -l TMPDIR 20220527 | wc -l
139

$ git grep -l TMPDIR 20220930 | wc -l
141

And the same number of them in open posix:

$ git grep -l TMPDIR 20220527 testcases/open_posix_testsuite/ | wc -l
1

$ git grep -l TMPDIR 20220930 testcases/open_posix_testsuite/ | wc -l
1

Kind regards,
Petr

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5988/steps/12/logs/warnings

