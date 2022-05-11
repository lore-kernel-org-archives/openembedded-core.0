Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F326C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 12:01:02 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.10401.1652270456868733953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 05:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YLQni5UE;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id d19so3151137lfj.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 05:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=obX8Z1u5GH2QLV+H1LI4+7y9UrjVQc/14kJV5VS9aLQ=;
        b=YLQni5UEGwrkCmRxw7gDk9d/zFSPeSkdsFtOvLi3IlEOHwUm0FABddtdIDDZj2yLYk
         O3oeWVqfTZ3QxNJkMuIYmMRt+oDmmpybSs+CyFbrcXNO7XlD5P1/U0gPGWWOtUShqPS2
         FQxV/xJRhKTJQJ2JJeeRL4SNwbM/GMc4bt5/xrGahgpEchYFfY+3of/6/Lh0zxVAj0ee
         eOjikvrXHuJeHEgOhrTGDJOmAltUX0aeu6YpSe/q9MYVXqrCIP6Aq/aRB1Vf9a39Jw5c
         EWeKrZm+6GKFMF6OpD7Oz1Vf26swb0+FBcXOtrYGN7Y/NiatvCTawfuNwbsgk+1lybPK
         Tqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=obX8Z1u5GH2QLV+H1LI4+7y9UrjVQc/14kJV5VS9aLQ=;
        b=ukmiRJt1AjRJuMzWCv2+/5qa4AKu2YDb1o/YmNHgr+WTAt10pwOKVJKJgq/RZSQdEM
         Wcm4sc0v1nZB1Er6zE1ggZGaVmlfSr78Yo0UHlLs5d32OkrHrPsSjgjGD+gqod5VJv+S
         f6SMy+hA82mShm9PcHc2ASP3eexR10N6rrdcfMDKavjB3ZWI4zKDh3e8TJ4v+tVwbhMb
         04TSkVwo+9kX/z7xjQ23I/xeHUlFILsW+ojxdKzLW00kf2k6mR6BgGWWQngiOwx8AeEk
         yE9qsZrxGS1o7O7ENJvlC3Wrfl87+/G6KHDHy1VYpPTTA85Bp0Nagc9gMT0xXuzXtYec
         iWzA==
X-Gm-Message-State: AOAM532DgjQwdcV2Fpim4GrEZrk7Xo83uPOT43CJ4ctNKH9S6HkizpPg
	nITkhh9i3xehEpvqhF16XEKuE3nLroTDmKncOKE=
X-Google-Smtp-Source: 
 ABdhPJxmbVApBy50C9MolXeXePC9S2QTCmZPAR7TVDv4wiyuWsjlqUgE8/O/3agHZBeoLWgiNshwlgvPQ2orn6bQ8mw=
X-Received: by 2002:a05:6512:3047:b0:473:cf43:6d8f with SMTP id
 b7-20020a056512304700b00473cf436d8fmr20659665lfb.380.1652270455021; Wed, 11
 May 2022 05:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <92f812a6-ab9b-71c-96c4-7f4ec307ddf@crashcourse.ca>
 <CANNYZj97C4Oy9fvkuTFSZM5hqJ4UU6xqdkQpGAKPpzVhNV0_Lg@mail.gmail.com>
 <d67b5988-49bf-b8e8-e8c3-2665f830d139@crashcourse.ca>
In-Reply-To: <d67b5988-49bf-b8e8-e8c3-2665f830d139@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 May 2022 14:00:43 +0200
Message-ID: 
 <CANNYZj_-cRamxbQP6EUgmdz9Mt6x1bN0Aiz24ASo5G5a=pqPrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] local.conf.sample: add comments for missing
 machines
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 12:01:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165498

I would rather just refer to the directory where 'additional, less
well tested machines are'.

Alex

On Wed, 11 May 2022 at 13:14, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Wed, 11 May 2022, Alexander Kanavin wrote:
>
> > I have to note that the project does not test these machines, and they
> > may not necessarily work. Advertising them in local.conf may result in
> > frustrating fails for people who are running bitbake for the very
> > first time.
> >
> > Alex
> >
> > On Wed, 11 May 2022 at 12:48, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > >
> > > Fill out the commented list of supported machines for completeness.
> > >
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > >
> > > ---
> > >
> > > diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> > > index c05691de58..f0b8952947 100644
> > > --- a/meta/conf/local.conf.sample
> > > +++ b/meta/conf/local.conf.sample
> > > @@ -20,9 +20,13 @@
> > >  #
> > >  #MACHINE ?= "qemuarm"
> > >  #MACHINE ?= "qemuarm64"
> > > +#MACHINE ?= "qemuarmv5"
> > >  #MACHINE ?= "qemumips"
> > >  #MACHINE ?= "qemumips64"
> > >  #MACHINE ?= "qemuppc"
> > > +#MACHINE ?= "qemuppc64"
> > > +#MACHINE ?= "qemuriscv32"
> > > +#MACHINE ?= "qemuriscv64"
> > >  #MACHINE ?= "qemux86"
> > >  #MACHINE ?= "qemux86-64"
> > >  #
>
>   that's the first thing i thought of, but what is a cleaner solution?
> if those machine definitions come with OE, then why should they be
> treated as second-class citizens? if those machines aren't tested,
> then maybe an extra comment pointing that out would be appropriate.
>
>   i just think this should be consistent. thoughts?
>
> rday

