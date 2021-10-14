Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6DBC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 23:23:13 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.2546.1634253793140519327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 16:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nfiWoMl4;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id r17so7284380qtx.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 16:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t3ZOZJG8CoKEPVh5vWLy06sUsA1MzA4vrYpsxZ5phFI=;
        b=nfiWoMl4PTRFLCgg5n2hx5eStfA9pTsq5AVN6Xkkr3t4IpGxDex0iKewzVH1fj+Pkx
         SklSPiS4Goc46MbXaxuqQ8dKlqyVsX8vnWDsF3OJ7w2nMmz2xXFp+LkYMUB78fP79Okr
         gMFqobwppmS54YLYVKL7rCAu0mq+/i2Jq/mvTxN5y03x7qgMHbNfJyivf4TiAtugbBGW
         bzLHAsOhfzveJdX3+jw2ktrDkJoeoFBkXVOnTz7AwnoOwiQ1DKAun8ds0Dm5V/qcKh7L
         EIq1BCNp8oIE5WznJuGLVkWwrdxACJoJ0A1eYq7hbsI1OCs+GVMgK3fCQDxB26ENBBrQ
         tllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t3ZOZJG8CoKEPVh5vWLy06sUsA1MzA4vrYpsxZ5phFI=;
        b=UWKt2mTnNy5QVmR0ZWOLQHa/TV5qZaGbunHW2kMjeh8wRnFxGI1I8kO5ALmq0dYhrX
         WP6X02lrdVZAQpCyeJIL0WcIdgZOToVZInEjT4TugGgSuXPH3NQpQHPAwfjIc6697BUb
         fucLP/PViUedq3UQmkGaz0ce7STJoQDjIFyp+XSYAwCF7EUeWoYPtkVDQuqKwykP8K0t
         mFP0bFBwzSeBuWq929a5an1I8r+v6lZmrUo8ytO+M/M4eo3uU4zt6b9B2GN6dUh69+jD
         R79F+lBiSSl2H9IYhTa9EaEwJp4xzc9YqQrY6FplsinFZ8mlaDZzMZWKwK/Tb9UCem07
         Y3Fw==
X-Gm-Message-State: AOAM530QSp0lFfnG1G9N7WaHym4t1o+6b4jwex49dL6hsRqphZTKwHCM
	8km6A1+ON8kw9AJEqUViLmBUoa+5Rft3H4tP9dw=
X-Google-Smtp-Source: 
 ABdhPJz66hBkFTPyX7duuT1DCSYfS9JoMmwCv65fIGhXJ4rstpPMiMQtznOEV0zHQWcn6WA68S938LRJ1CJuN+yFKDE=
X-Received: by 2002:ac8:6893:: with SMTP id
 m19mr10111021qtq.116.1634253792212;
 Thu, 14 Oct 2021 16:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
 <ca870211-18f1-8387-2d4a-354bd70a897f@gmail.com>
 <050ca4d9a76319a1b68820287daf73fe7e657138.camel@linuxfoundation.org>
In-Reply-To: 
 <050ca4d9a76319a1b68820287daf73fe7e657138.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Oct 2021 16:22:46 -0700
Message-ID: 
 <CAMKF1sq5RPcaty6TdhcV7ceJgOBKL=ZBXZjSCLuofwPQVtf7nQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] reproducible_build: Drop now unneeded
 compiler warning
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 23:23:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156980

On Thu, Oct 14, 2021 at 2:48 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-10-14 at 09:36 -0700, Khem Raj wrote:
> >
> > On 10/14/21 5:10 AM, Richard Purdie wrote:
> > > We now pass compiler options that mean the compiler will adjust these values to
> > > SOURCE_DATE_EPOCH, the compiler warnings are now unneeded.
> > >
> >
> > Is there a chance of it being overwritten by component's build system
> > in that case this warning may still be handy
>
> The warnings are basically lost as noise in the log.do_compile files so I'm not
> sure it buys us anything...

From system build POV perhaps right. This does seem helpful for folks
who are developing components using the project
and might be transitioning to use reproducible builds. Of course, they
can add the option to their project if that is important to them.
thirdly SOURCE_DATE_EPOCH is gcc specific and keeping it around helps
non-gcc ccmpilers too. But, I guess folks can always customize
so its fine if deleting it is solving some other problem.

>
> Cheers,
>
> Richard
>

