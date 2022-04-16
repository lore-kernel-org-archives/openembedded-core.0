Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87B5C43219
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.16598.1650095821106321228
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 00:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XVaol38+;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id g19so3181552lfv.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M8DAEKF7cWJ8ng2nOuBq9rtrIaPzXLZdQxobloiXZLE=;
        b=XVaol38+I1EYE0LBsXlC+uoSybpYNLUUAGy7NDI1SUVpkTuUeony7KTaovxIBTSDb2
         trLY1tt2i+UYbnY0eBjv++8IikpRVBtDUTdmlzaml6qCnFpdPuZzAnDTsuMFIjel9g3o
         GxLcR2kc1uEbhsuBqD9ambgrjUVQ+GlkWjLxAQ8T0hx2NXowCp2azdX4ymJQX60Gu93t
         DLBVNbAhKQU/b20RkIh8dfP53fI7CXlMTX9Ge4rni45P8fwboTMR3fAzG2YUdfYzoEq7
         YsQ2be+seNKrednLNcqWzSB+kPe6rwWWxMQFJMSgsvaLUfHfxRR9ea6qiypLBFrWNbVd
         81pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M8DAEKF7cWJ8ng2nOuBq9rtrIaPzXLZdQxobloiXZLE=;
        b=bKBA0gP/arCj1ArMGTF2klTR+2DnSiVRhEa7HcbAV8CEZo7Pi+7t/vp/e7HiUMAAVB
         YJSwZtHqWJ7Z+/9VuzPW6Eo6QFSSmncP1/ajXeg0YnYQlLBYrjZStujTU9bDUkPlgKxi
         eyLAd5GjtMMyr/vFDkbDgnRBVLPAgSBD+Vj95UOFntTfzorJvf6X6mguijUQsGAC6VXH
         +08Yvf+9QIi1Dxfw7sSnil3WcQZYy39dN1XDqCiWgNWtzv3YKLc+IGhPIOwMw9be35ED
         9t/O4PSwE7iv2OTaMUW+K3H9PN6w/8FFYDisQOeJqmtJO7KmoMFvWnCJXk6ghugs6fRN
         lReg==
X-Gm-Message-State: AOAM533MbvVde3ueqk1065bft99aJCJFIoLus6diKNlq7sSx0fUjm8Br
	o3c5bjf9x9scG9cFmakKYujXcCySbJiExgjHpZ8=
X-Google-Smtp-Source: 
 ABdhPJxBMuiESrfJ49K0+XxgqjlJ6oxjRxli5b8kuUlpm16R3xsayRHLKcVWNxaKdh44N7b/dVd9Nj9L/U6ReuNyY6I=
X-Received: by 2002:ac2:5ddc:0:b0:46b:85a3:9c3 with SMTP id
 x28-20020ac25ddc000000b0046b85a309c3mr1844730lfq.130.1650095819238; Sat, 16
 Apr 2022 00:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220415111159.120195-1-pgowda.cve@gmail.com>
 <a9c706aeb3190c88e52eafd215a2184d3dfd5446.camel@linuxfoundation.org>
In-Reply-To: 
 <a9c706aeb3190c88e52eafd215a2184d3dfd5446.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Sat, 16 Apr 2022 13:26:48 +0530
Message-ID: 
 <CALY4987=ZgZZyCQCB08GL2_2Ga0ZLPuHX11z927fEkUzdK825w@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] glibc: ptest: Fix glibc-tests package issue
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164525

Hi Richard,

Thanks very much for mentioning the correct way of fixing the issue.

The modified patch is posted as:-
https://lists.openembedded.org/g/openembedded-core/message/164524

Please let me know whether it's the way you mentioned it.
Or Can you please point me to other instances where it's been implemented.

Thanks & Regards
Pgowda

On Fri, Apr 15, 2022 at 6:32 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-04-15 at 04:11 -0700, pgowda wrote:
> > The current default DISTRO_FEATURES does not support ptest.
> > Hence, the following error is generated during "bitbake glibc-tests".
> > ERROR: glibc-tests-2.35-r0 do_package: QA Issue: glibc-tests:
> > Files/directories were installed but not shipped in any package
> > The issue is not reproduced with "DISTRO = Yocto" as DISTRO_FEATURES
> > in Yocto supports ptest. However, when we run "glibc-tests" using
> > Open-embedded master sources; it generates the error as default
> > DISTRO is used.
> >
> > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > ---
> >  meta/conf/distro/include/default-distrovars.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> This isn't quite the right approach, we should probably skip parsing of glibc-
> tests if ptests aren't in DISTRO_FEATURES?
>
> Cheers,
>
> Richard
>

