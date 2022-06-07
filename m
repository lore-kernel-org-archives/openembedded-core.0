Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14185C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 17:00:04 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.31.1654621185692320547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 09:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lrtfgZ5p;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id o7so3163327eja.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bhbPMsr+PextLgv1fib+pZ7Q7RpLaUeFpNP658w/75k=;
        b=lrtfgZ5pnJEISuZuPQtt7YpcVI62Kx2FBzsXYy4PBrBTeMeFcTrtE6R4EiiuYdNopr
         r3GPZTcvsD9wsSMl5IGXOW+UofB4Q9ntxwbugDCCJ4bLVY9ENbNJBgkJWQCQWLFLRImC
         VZ+ZdF4grDo4u6g/KR15GqCQN2VINobfiZ64ZGwHDTjY7XQlKn33aV4dY8kL6C22juRo
         JFSLipmnzW+E4iofrmPcIl6ZSOrHmIhE1beS4N+WwYitbgykIjyUzE27klYYc4i+CoLw
         oEVwI/+DDWdiOj1QcQIOI2t0L2FyBOVQt826xlc+69u5xhtI01oOeIuRdZP4GQI4VjE8
         ukug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bhbPMsr+PextLgv1fib+pZ7Q7RpLaUeFpNP658w/75k=;
        b=T/xieOJNGrcVU2huYWE7jvvD/ZOQ3VzQM3NXJ57FI0hELg2NH1HStJYgx8r52XirDJ
         j52eFAAm55AtPrt8/DOSDLfgeCzCrJYwsWW49vWXB4g53i6yU6RmE7MrqgTn8CFB9rRc
         9AEwvHOwoUauO7FKdGzDyHco/wS0lvAVfO0aknGNkosVLxNRQoLGSN2sdBINShYsT7pQ
         2OAYI7vGJZFcujvQAhFhdsFNYJAZfAKq0BB36TM4nvL3SCf2S/RfJ4VaxJAeydgXR5px
         /EVDnWvqtavqEBhyyxSmLmao9EYmnctj6t7GhySFwXAZqAeyiW1ikgHW+vpu2WRoUrC6
         wA2A==
X-Gm-Message-State: AOAM530cgKjuKvKEefGconH9xDE+QGVCdSbw29qOKnUML/uKPdNGdyLA
	AnlK49BQhjFsScxhggH1Iw0mMFmXnMzXn9dhyXnjWQ==
X-Google-Smtp-Source: 
 ABdhPJxhvwi0KJlI9yU2wdp8wLYJKipHcSQOIT5u0KV9TZGmx79QrDuo4OeIR4IpWPs8TWKx1/UYwWE7pnbyIS9bjXU=
X-Received: by 2002:a17:906:f17:b0:6fe:94f6:cb8a with SMTP id
 z23-20020a1709060f1700b006fe94f6cb8amr27015167eji.456.1654621183561; Tue, 07
 Jun 2022 09:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220530170213.1562720-1-dmitry.baryshkov@linaro.org>
 <CAA8EJpoDyNDPz2GqYmqtvJZX3L71h8Gnn9Ofsse3jKVfhaWrbw@mail.gmail.com>
In-Reply-To: 
 <CAA8EJpoDyNDPz2GqYmqtvJZX3L71h8Gnn9Ofsse3jKVfhaWrbw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 7 Jun 2022 06:59:32 -1000
Message-ID: 
 <CAOSpxdak7SL7ry7SyGmYYXFORc9pf+P4EaSxyaWbZkcmGad6Lg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 0/2] linux-firmware: pull two patches
 from master
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 17:00:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166680

On Sun, Jun 5, 2022 at 8:47 AM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>
> On Mon, 30 May 2022 at 20:02, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > This pull request cherry picks two commits from master branch to split
> > several packages that are usable on Qualcomm platforms. Allow using them
> > directly rather than installing huge linux-firmware package.
> >
> > Dmitry Baryshkov (2):
> >   linux-firmware: package new Qualcomm firmware
> >   linux-firmware: split ath3k firmware
> >
> >  .../linux-firmware/linux-firmware_20220509.bb | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
>
> Gracious ping.

Fear not, the patches are in the set currently being tested!

https://git.yoctoproject.org/poky-contrib/log/?h=stable/kirkstone-nut

Steve

