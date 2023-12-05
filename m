Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E972C10DCE
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 18:03:01 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.645.1701799372299954074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 10:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxyerdgg;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-423c944352fso40745701cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 10:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701799371; x=1702404171; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQGsMEs9+0nWfVCfrFj7nfN1RfIZTo6NdG3mAvKR+Qg=;
        b=hxyerdggCEwsfBxKScp34F1Ik0ZFQyfoMnIZK+ViyqZ7hhpbGvwLOHy2V/6cnbb4T0
         3kB/ZSPHILXeuos6CMnjsRr5jNq9zkJ9CK1kBWGnuI1mjDCaDrdwsjlPL3fWDdwLscje
         BoDOxu9usbBcBQC6VRROiqcLvYv1VZtufs6q5BKtMCI7tC+muDC2Nvxz3uGCteYmqnhS
         dG2J/gyi1xq3Zd2YQLyShRikohKmL8kNYo8pQE3fKrJmXrLdCQOZPASqfP9QcYlOD3fP
         iYxme7MBOUfp0WS5PCrXk+6N8pIfSh89kFu9W3ePP2TBEO1LncAIJ6SLcd0F2UkNjIaV
         kBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799371; x=1702404171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQGsMEs9+0nWfVCfrFj7nfN1RfIZTo6NdG3mAvKR+Qg=;
        b=sp6iF9E0aug4K0ptTKyPIDIfhZ5jqWTS+Tr8t8khVEJuwrOZAM4P+kCqCy0kgqhiDV
         1RENYDylVitdvlApWtE/ekzAsTpyckJxgxhymzJMoVW9o9l9uulao1Rq3AOTBzM5c+NE
         Zqfra3uLBWokj5ON4uZs1BydiUbfDYOE0hGyGy49rYA+Tbq0vuBmhMBzrrhgIMNOqxgU
         0FMnpFIeM4SXjw1NS+SMS4cf261CJKWr8lm5diLYHVvLdRJo71tOoP93QzBQjjfdiWQo
         9Pj1hp3cwofHpyoHhTpeKfkA4wJhNHrP3VY3KmWTww8VXVIYI2dqTqFtT++nTcLtRiRf
         /jMQ==
X-Gm-Message-State: AOJu0Yz9Y8nElYkUcD7UceZSXqj5ea7VUfN07Wc/w3704rmrvlEQH5S3
	ZA1vXRu0TIlnKOxgpcBUZc0=
X-Google-Smtp-Source: AGHT+IGRrFEb4ysBY3bOcBCsHqCFB87TUFKt1XfHXYTdOPRvDWQjFvdx0a6ESvzZt5qSpfhpbZuVOA==
X-Received: by 2002:a05:622a:cf:b0:400:a2b8:1c97 with SMTP id p15-20020a05622a00cf00b00400a2b81c97mr1857639qtw.17.1701799370978;
        Tue, 05 Dec 2023 10:02:50 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w2-20020ac87182000000b00423de58d3d8sm5328494qto.40.2023.12.05.10.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:02:50 -0800 (PST)
Date: Tue, 5 Dec 2023 13:02:48 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][kirkstone 0/4] linux-yocto: -stable updates
Message-ID: <ZW9lyDoHaQiG1VZf@gmail.com>
References: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
 <CAOSpxdZDYpzoaK01uMKmgzjPqm=Tup2EZO2+w39DSvz3HY1Vrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOSpxdZDYpzoaK01uMKmgzjPqm=Tup2EZO2+w39DSvz3HY1Vrg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 18:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191853

In message: Re: [OE-core][kirkstone 0/4] linux-yocto: -stable updates
on 05/12/2023 Steve Sakoman wrote:

> On Mon, Dec 4, 2023 at 6:40 PM <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Steve,
> >
> > Much like my last pull request to Richard, this has been
> > generated from a newly provisioned machine after my old machine
> > of 10 years had a disk failure.
> >
> > Let me know if you have any issues with this, and I'll debug
> > what I missed when configuring the new box.
> 
> Hi Bruce,
> 
> I'm also seeing an issue with 5.15.141.
> 
> Local testing fails with:
> 
> WARNING: linux-yocto-5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0
> do_fetch: Failed to fetch URL
> git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=kernel-meta,
> attempting MIRRORS if available
> ERROR: linux-yocto-5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0
> do_fetch: Fetcher failure: Unable to find revision
> 92bd0a656f0f9db955fb53c52be71cce9296bdb2 in branch yocto-5.15 even
> from upstream
> ERROR: linux-yocto-5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0
> do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from
> any source.', 'git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=kernel-meta')
> ERROR: Logfile of failure stored in:
> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/qemux86_64-poky-linux/linux-yocto/5.15.141+gitAUTOINC+92bd0a656f_54a3472506-r0/temp/log.do_fetch.3515498

This was a repository misconfiguration. Only the current
branch of the kernel-cache was pushed, where I've always
had all branches to be pushed by default before.

I've tweaked it, and the revision should be in place now.

Bruce

> 
> Steve
> 
> >
> > Bruce
> >
> > Bruce Ashfield (4):
> >   linux-yocto/5.10: update to v5.10.198
> >   linux-yocto/5.10: update to v5.10.200
> >   linux-yocto/5.10: update to v5.10.202
> >   linux-yocto/5.15: update to v5.15.141
> >
> >  .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
> >  .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
> >  .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
> >  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
> >  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
> >  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
> >  6 files changed, 38 insertions(+), 38 deletions(-)
> >
> > --
> > 2.39.2
> >

