Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6D5C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 14:35:17 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.31050.1655735714071452025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=W+W5U1tL;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id ej4so11446575edb.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IiRmvGmRPnAf7FVetWOs4qWU30C9YTOO4gja+8hrLBM=;
        b=W+W5U1tLzGKpOCvDRKj5DWdnYqp6HOZCnn2hs71ueJ5HuFmodw+DL8Z9Pn+u0rTYOL
         8lQtgA67B1yK9c74XZn+moZF1eePU7CGDzJdNB+CPjJGgXPpPvfDX8qe1P4bCBmKRQ+B
         wAq/2+b32Hu4k669uLpfnwmyHCYQnc6KWhatA8tYrGE7XiyYwhfMO+fgsW0orSZgaexX
         mjL9flOtAASpvIEe4yzkQ5Mgi8YCCKFuPtUc7NoSwAwpctA0ejOB6jvo0JD+JvTSiwZh
         m0Ada6zwIKFXnVsvk+/DO2BD5SpLSrPXabC4nu9Z/drnvatdVf6AYc5eBNuOj6S9bJas
         stbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IiRmvGmRPnAf7FVetWOs4qWU30C9YTOO4gja+8hrLBM=;
        b=dGdx7PNcf7D2ULPhHJZGpJrC4KumTG27Cm2I+AcZozTkHW75ZcVCMqWNLSGkLoBgeN
         yEhrIDnNDxCGgsUWzX6gVInyL+ezboy2qZrSw9sePp/2oKi4ZrxJsmjh5Pvslk21SGZy
         kx8H7sPZ0vQVoMV2W8PuEKOvPGF10orMBkf9z+03xajXKy4t287eNXbTxmhqpGfVO/kt
         Hs9K2DtoYWQW7plI0xItmx7He6dMmtq17pzAeQlgShocbS1YB+KM7vuCHRbmfsuqZkNy
         fDQaVXGIoySlTrrB+5C2aF5fd2j8uZLHWrWvQTc/GZuWmoHTEdPe39d2SWgp33BXOGqd
         Tz1A==
X-Gm-Message-State: AJIora/4iTlzdbN4RDlfY7lzJGgQ1iSMJ1wmRAcJkPuUAHwDJp45zE3D
	xz3QLhD5xFbCyrYFN6RuC3jyLNRO8PyrBzi92AL9ZQ==
X-Google-Smtp-Source: 
 AGRyM1tpgAUUsQNUXeX9JXBXuAnrk4ff1U//wKOM4FJISxWUciDjv1+2h3v+6QaQV53Sb29qjAEOaGugN8pulWuvGg8=
X-Received: by 2002:a05:6402:1597:b0:435:88fb:5b1d with SMTP id
 c23-20020a056402159700b0043588fb5b1dmr3957184edv.316.1655735712419; Mon, 20
 Jun 2022 07:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220602122005.17173-1-anolgajbhiye99@gmail.com>
 <22204.1654618205983575596@lists.openembedded.org>
 <CAOSpxdYoYPS0Fjgfyt8uug8ozGdrU2qKSq2DaYY6P3oW_H75CQ@mail.gmail.com>
 <2964701f-1022-07e1-12b5-5ce8c4f178ea@windriver.com>
In-Reply-To: <2964701f-1022-07e1-12b5-5ce8c4f178ea@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 20 Jun 2022 04:35:01 -1000
Message-ID: 
 <CAOSpxdYzOe6HLXfPa9qjfgWXwXgrmHjeg3oMbm8dRWPDw_+_8g@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] systemd: Whitelist CVE-2018-21029
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 14:35:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167116

On Tue, Jun 7, 2022 at 1:24 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-06-07 12:18, Steve Sakoman wrote:
> > On Tue, Jun 7, 2022 at 6:10 AM Ranjitsinh Rathod
> > <ranjitsinhrathod1991@gmail.com> wrote:
> >
> >> Is there any reason to not take this?
> > I'm puzzled by this question! A patch with this subject line hasn't
> > been submitted to the list for dunfell.
> I see the original patch, with a timestamp of 2022-06-02, 08:20 ET.
> Do you need it to be resent?

Sorry for the delay in responding, I've been having some email
strangeness the past couple of weeks.

Gmail decided the original patch was spam and moved it to the spam
folder (along with this followup)  Seems to have gotten more
aggressive in spam detection lately, since I see other patches there
too :-(

> >   Also, the referenced CVE
> > doesn't show up on the CVE report for dunfell.
> That's odd. Are you looking into that or is
> the CVE report ignoring it since only version:
>     systemd 239 <= v < 243 are vulnerable and dunfell has 245.5

This is indeed the reason it doesn't show up in the report: our
version is not affected.  Hence no need for this patch.

> I'm woefully ignorant of the YP CVE report. Yet another thing to make
> time for...

Never enough hours in the day . . .

Steve

