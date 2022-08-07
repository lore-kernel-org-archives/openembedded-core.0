Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE9AC19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 15:59:22 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.14973.1659887956161037236
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 08:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E6LjRmHD;
 spf=pass (domain: gmail.com, ip: 209.85.128.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-324ec5a9e97so60528337b3.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3PFD1i7Ge4Br/QtjbwVsaY5fGw/73LyXEt7Mw/yAPTg=;
        b=E6LjRmHDvj4LMx5+3VQaSsWlB9+gdbXZh7phOY0bqTdGpJMO1d9ZrilWleDWhGJiBD
         cH+/jk4kACKs8zojVaJvWwqLkRMOtudu3/UWHViFpB1Gf4d1n2gNIClc18zNiF1p0SXg
         OOsetaCObpgqb0T/xvPnFUT2uKtnmFL+iW5MDNUK60SghxLGclpvZr9hEjjpFXxi6BVz
         Ev11D1K8G7K9+1S7jSL0F49qfkchvxL7dbqVU12y7ztVQbImd/m42tXxgZop/QGkzUP/
         RLqQ7xXLZT5xAGLaIgR1L/+ljx+BB6DzSndKtPx7e3ZVM6B8SfywYc62ZPztdOBOj+oT
         kh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3PFD1i7Ge4Br/QtjbwVsaY5fGw/73LyXEt7Mw/yAPTg=;
        b=8SYbOkzTwOREpSTSDBAKMpzQiUviOTkWqs2XpA+HDEVicxEM+QMt7cVtZNGh4JQe6t
         QjlfP+XQuKcSg3269LY8LZ6FcmcsqDhqY/x3oHToQxiBm9GP4dM/2bPU97rrgPr++kVa
         GCL+A4b0T0PEKAmU+oKxnLBeW+rlu0nD3NQpG3cmbSWajnWHIy7flTY6/G3u+9Nl/5kq
         mbH4K+VScO8ha4L0x9u2+GlPvyBv0nr4Avwa8g7SvJxaVFizxor1yavi+lD7mK6+Fnx/
         vKMz2jufPjXJZGJKENsg0m0ebU7gMLn/E9z8zDyYVW76mGPsmpL73VSZeKOEYPpUes79
         pwMQ==
X-Gm-Message-State: ACgBeo2EGEpOeyJ+Az+bdVJRZHhvDC3erg7A1PMGKGESrsgijDYS8RJ9
	k39zzk6yan1oKf1kb3MmvBYZS2sKGH9P/6Mlvd8=
X-Google-Smtp-Source: 
 AA6agR78xuqWtJs0MM1TTIABy2rNNzZ4eq5VTVi/+NfFgX+dkzJpyFXuRUVXZBJfe1d73Lls3YoAycm8qSOJ3u/NDGc=
X-Received: by 2002:a81:e84:0:b0:328:9b2b:e98b with SMTP id
 126-20020a810e84000000b003289b2be98bmr14755794ywo.422.1659887955242; Sun, 07
 Aug 2022 08:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220807041541.2665647-1-raj.khem@gmail.com>
 <Yu/G9qK9Whx922Gw@jama>
In-Reply-To: <Yu/G9qK9Whx922Gw@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Aug 2022 08:58:47 -0700
Message-ID: 
 <CAMKF1sqPPWn6SE=pJsijA13CqF1-ub-NZvpDgwnsfoZ3LBCBPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] glibc: Bump to 2.36
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 15:59:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168994

On Sun, Aug 7, 2022 at 7:07 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Sat, Aug 06, 2022 at 09:15:35PM -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> ...
>
> > diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> > index 99017ce1d41..b6da2c345db 100644
> > --- a/meta/recipes-core/glibc/glibc-version.inc
> > +++ b/meta/recipes-core/glibc/glibc-version.inc
> > @@ -1,6 +1,6 @@
> > -SRCBRANCH ?= "release/2.35/master"
> > -PV = "2.35"
> > -SRCREV_glibc ?= "b6aade18a7e5719c942aa2da6cf3157aca993fa4"
> > +SRCBRANCH ?= "release/2.36/master"
> > +PV = "2.36"
> > +SRCREV_glibc ?= "c74bb93cfdb04d49155b0e30983a3c866167bbca"
> >  SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
>
> FWIW: The glibc-2.36 tag is 1 commit after c74bb93cfdb04d49155b0e30983a3c866167bbca
>

We are on tip of release/2.36/master branch. So tags are not as
important. I will update to tip of 2.36
in the next version of this patch which will have sync fixes for 5.19
kernel syscalls.

>
> commit c804cd1c00adde061ca51711f63068c103e94eef (HEAD -> master, tag: glibc-2.36)
> Author: Carlos O'Donell <carlos@redhat.com>
> Date:   Fri Jul 29 18:03:09 2022 -0400
>
>     Create ChangeLog.old/ChangeLog.25.

