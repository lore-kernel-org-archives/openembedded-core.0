Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A18C19F2C
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 12:22:32 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web10.5349.1659442943046604852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 05:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UZY5dmUk;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id b4so4390810uaw.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 05:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=jrV2HCXKpECD7ytT8pN4RXxYQYOoJNfRLUhvZzHlLcA=;
        b=UZY5dmUk3oVuGpdm3lsI+/cxQ/Mdh1dHoKsTUg0SYgucn/rIWfK41562AHH5DKHkBI
         LcM6ZTC+VHNp5wi4ZUW7nn8ufkFZytE2dVStvfl/xLy+qcZq7S+joTS+2OC9ltOmQgI4
         yYbnnCZBrhKJ2YLJ2xVN04mVsSsmFrBhr/U13Hvz1Fw0wbbagjCx6X07vPei5OPfj8CW
         HYzC7kE3vY4iousYefvAXR0eES0O17Jz9XOhw83J6hlCKZaYsqFYpx8UBBYHgi7hdYbC
         P+cKvPfUeRSkPbpUERibX7bt6VOezGzU7o01q1cn8BmRbSD94UXDBN92Gl+/8Or403fj
         UOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=jrV2HCXKpECD7ytT8pN4RXxYQYOoJNfRLUhvZzHlLcA=;
        b=TXRDOdJvc1C6PEFBU6+q99cnCyJRKVkJwp+YWLHorapJUyC0BJFIXBuwx5MTlQenk5
         UPPsjII7ZxCUrPwspbHce+0ryLLBWnMbavauyopLwBOdSYR2wYJEOdqhmb5EVfsR6Ss1
         A3pi71Dpqf8B/pQyeuwqsAwLLJGTml1iUt+3QFwg1ak5JhFb0Oi/bjs4uwuxOwRsCK2d
         pHhGvx9JGL6aFxOc7ASzfYxy3GZt8lu20xqDTDzHD0TD0HZtv0oAWk9ZGnZq76F7k/KG
         X6jY4w9pVB07qfKyjf8gqT2Xz1ubRWiv4HQ4FwhMZCIl4Mi5mLA6ddmnhDOkeZ5oDbRd
         5R8g==
X-Gm-Message-State: ACgBeo1pty6vinTD1JhsunDLE9QPBUAjleqqJN+BbcazDc1G4AWNzMBb
	CX/LaDww8ByJCL3wlizFSbA921tvgS/PqvHoNaE=
X-Google-Smtp-Source: 
 AA6agR4sdK5dEf4guFkOxLmRnfH4s8SH+BSiPk+SmqMT+MiFrxnWfauApSGq1UqhrKp92foArr7X5Ktp5Nm4C9fz/X4=
X-Received: by 2002:ab0:377b:0:b0:384:cbe5:25a6 with SMTP id
 o27-20020ab0377b000000b00384cbe525a6mr7856846uat.29.1659442942141; Tue, 02
 Aug 2022 05:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220802035352.1497111-1-pgowda.cve@gmail.com>
 <20220802103833.0b32b669@booty>
 <CALY4986e=cqifcHUNt0buU5+FtHjLju_29SwLhD14rwFd2zU_g@mail.gmail.com>
 <20220802115218.5eeb964c@booty>
In-Reply-To: <20220802115218.5eeb964c@booty>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Tue, 2 Aug 2022 17:52:11 +0530
Message-ID: 
 <CALY4985ybMcedM=sAxcLcCWWfVaFV9Ddd3uoVHtvFkBL-kaqBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] Rust Oe-Selftest implementation
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 12:22:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168779

Hi Luca,

Thanks very much for checking the patch and comment about the elf-tls.

An explanatory comment has been added as per your suggestion and patch
posted as:-
https://lists.openembedded.org/g/openembedded-core/message/168778

Thanks,
Pgowda

On Tue, Aug 2, 2022 at 3:22 PM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Pgowda,
>
> On Tue, 2 Aug 2022 14:37:54 +0530
> "Pgowda" <pgowda.cve@gmail.com> wrote:
>
> > Hi Luca,
> >
> > There were around 270 testcase failing when "has-elf-tls" has been
> > enabled while building llvm.
> > Hence, we had to remove the option to enable the proper working of these tests.
> > The patch has been tested on Ubuntu and also fedora (using docker image).
>
> Thanks for the explanation. Then why not adding an explanatory comment,
> as below?
>
> # Disabled because.....
> #    tspec['has-elf-tls'] = True
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

