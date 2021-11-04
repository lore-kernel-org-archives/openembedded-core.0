Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DBBC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:47:34 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.12812.1636037253449406746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RBKKRv/A;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d13so9006424wrf.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vkTLe4k1fxebODo7dOOCXyxjXoMLX2linfnz/AypAsM=;
        b=RBKKRv/Am/ffLmiOBxfJ5MJiCCwgkS0ite0arn+M3xF6pnCYQKof9wF+ymCp/jpREl
         XEmc5qo04p1sVQGoWwLRrj6ty9hti6wDDmA7gB0WjjbAnuWmx1vh2xPf3RDpWtP/+yef
         CSqxNsrw3P8R4kp4GJfAkA6LtRklIQ5slegN91TUSQdaRweyU4ftxUlw/Fd4Y0WcZ8rM
         Rp2b4fAfl8+dC/IjgfdLu+EPBV6yQsqC46joUWF5hGe6yGZjsQ4a4OCoY/AeyGxiN/Ks
         FotG4EILxdtqGNVgtPfzKHRbzrafhOolyeCV5dYKOJxI0wqTerL28+14v6AKc2EnBVO3
         AfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vkTLe4k1fxebODo7dOOCXyxjXoMLX2linfnz/AypAsM=;
        b=UOtqxmWLgI3uefcMXODq6pY/KFVszKJZFj8OlnD9VGvw0oOEEIfhEvsLkvZZqSnKwf
         1YAeKIQyRHEL+kWa1Hz8/vSXXVDyg10gbKz+xq9UR1bVBnVwluwgbTW6SX3lLkFznKC4
         gZzXTqcZXtqhfBmLZFe+ShbMk6odCGvgvN6ctgfWNUSfIXwVtvRxXbIV4vGQmakAOVyM
         3waXkfVVIDpU2cCmePHZ1ImCjkM0D4Y+ssU1cOZ0phzXCai3PB6fjLUQeeaqVdk+51uB
         d4qhNRMfeA+p/nlAeVmaef+4XHuOF+hyvLwPYiz6m9p2xvvQqANllzyD3P+4qHj5+KZM
         /9Mw==
X-Gm-Message-State: AOAM532Onc2wNA+NvSq95fsqHno5dHlEEhWGK/dz6I/9/opqa5IpkcC2
	NpnzUrZNpZP7K2Rx4spqriL294OlyBSlaUahpTU=
X-Google-Smtp-Source: 
 ABdhPJy7cwcLLJFzsoKwbYtMRq3aBb7fv+HTkpy0fuig3DHr5MUeNhIm34dAKXOpeOw3+qN5hegG+2/taixrTd2hd5Y=
X-Received: by 2002:a5d:64cd:: with SMTP id
 f13mr10735887wri.382.1636037251933;
 Thu, 04 Nov 2021 07:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210902162435.1375245-1-ross.burton@arm.com>
 <20210902162435.1375245-11-ross.burton@arm.com>
 <16B23C3CDA8BCB16.30289@lists.openembedded.org>
 <ce5f46365f6d4d38a6017b04ee1564f0@axis.com>
 <CAAnfSTt6OZp8Kh-DT8NrPBB+DDreRpM6rzmOANak1+sNrJL-pQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTt6OZp8Kh-DT8NrPBB+DDreRpM6rzmOANak1+sNrJL-pQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 4 Nov 2021 09:47:21 -0500
Message-ID: 
 <CAJdd5GYHDprn8OO=qLsAZxi7gEszisctoWPvfMEnsXh8fu8vww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
 license
To: Ross Burton <ross@burtonini.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 14:47:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157850

On Thu, Nov 4, 2021 at 6:33 AM Ross Burton <ross@burtonini.com> wrote:
>
> Sorry, missed this email.
>
> I copied the license from libx11, as it is the same tarball.  It was
> Joshua Watt who introduced the expanded licenses in
> 44fd2aa731956fe0a0f74d36959c88b0b87adab5.

I don't recall the reasoning for BSD-4-Clause in that specific recipe.
I can go back and look again. It's also possible I just got it wrong;
if you have a better idea what it should be, that would save me the
trouble :)

>
> Ross
>
> On Thu, 4 Nov 2021 at 11:19, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > Ross: any comment to my question below?
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > Sent: den 28 oktober 2021 17:44
> > > To: Ross Burton <ross@burtonini.com>
> > > Cc: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
> > > license
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > core@lists.openembedded.org> On Behalf Of Ross Burton
> > > > Sent: den 2 september 2021 18:25
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: [OE-core] [PATCH 11/14] libx11-compose-data: set precise BSD
> > > > license
> > > >
> > > > "BSD" is ambiguous, use the precise licenses BSD-2-Clause BSD-4-Clause.
> > > >
> > > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > > ---
> > > >  meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > > > b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > > > index 7519b4c018d..e53ccc6aea8 100644
> > > > --- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > > > +++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
> > > > @@ -8,7 +8,7 @@ python () {
> > > >
> > > >  require xorg-lib-common.inc
> > > >
> > > > -LICENSE = "MIT & MIT-style & BSD"
> > > > +LICENSE = "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
> > >
> > > Why is this marked as BSD-4-Clause? Looking at the COPYING file and
> > > searching the code I can find no trace of any license text with the
> > > advertising clause from BSD-4-Clause. What am I missing?
> > >
> > > >  LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
> > > >
> > > >  SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
> > > > --
> > > > 2.25.1
> > >
> > > //Peter
> >
> > //Peter
> >

