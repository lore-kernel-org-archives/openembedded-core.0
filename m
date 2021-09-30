Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5842DC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 04:31:49 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web12.8025.1632976308086383729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 21:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UN0ImyIh;
 spf=pass (domain: gmail.com, ip: 209.85.217.47,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id y141so5748722vsy.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 21:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1xcxrkbGjSOP5p9SLecnnrOHLVY4rQy55fBXJvLJlBM=;
        b=UN0ImyIhmTF7/mNh8nJ4rYNopnlQCjd0r6XTRreukPpSxFtX0WVWZlYlTuQ90SMwwe
         JV97G0BoRMN17LNQME/YUt4eGuvWTYc7St17EGwWRPrc/2wy7wnkC1jCKrA3WOUZgfxO
         A2j3eusLL07/Siu/WIJ+p86yrxI0RYsYNsCs9Y4mLozP2r7yI0m5xjsW5xzUxyy0OPrC
         lYm6reuZMoI/kUPXZraWVNPfmKguVW+Q+MC5OpxoOWybpKdi55DpEZbHddY3NGRHyloo
         DW6AyzlHr1jnWyfFmMDkXafCGFFcjQFZMIj9KVTmJjM32EOgwJdiS2JAx++BsJ+IZFZn
         qSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1xcxrkbGjSOP5p9SLecnnrOHLVY4rQy55fBXJvLJlBM=;
        b=5WcHw0vSy+tAwZDTc8WqOHPBDM2dvRWU/vBnNN/1v+BerFyl1bNhS6cl1U4NnbbPtn
         vLTjLJpFRuiOLX7VX424V/b49vRF8yPQpth1hDTICuiG10p4VpmTQEC+0YixCwAb6du9
         iP066xM8uqC0U23d5yE3FeUTfqix2zp2i119CVWlOs36FgmURln58QZjSRM4MKI2oAg2
         JxmkB1uRIZjUPgFsX3G95s07908NRHF/nqX3OrM6Gq1XE2FL/uI4aQVY2ND0hBw5vG8y
         wWjWngPqNOyst7ub2mEAYPFrm+AN74u4RNtYwwO7/mzrCjN+DC05i7pVerFkGJk33mPW
         PDOA==
X-Gm-Message-State: AOAM532R9Hm99J4fqrQDuQ8eIh2lafK74KocyV/O9vilAlzy6ndyTdZx
	Fpk74ZkjokFTJIHHHylVI7BOyLrRwCT3uwh9iMk=
X-Google-Smtp-Source: 
 ABdhPJztW0BeG3xRny20f8/G7JMTR5WUI8wUdS42/f8ke8hb/9IOXrAYrSds2Rw+AzdBRnho8cA7EXEEfbbobhailRg=
X-Received: by 2002:a67:e30a:: with SMTP id j10mr2138027vsf.58.1632976307143;
 Wed, 29 Sep 2021 21:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210929080448.16224-1-pgowda.cve@gmail.com>
 <20210929080448.16224-3-pgowda.cve@gmail.com>
 <YVTv6yOlPK6LmW5d@piout.net>
In-Reply-To: <YVTv6yOlPK6LmW5d@piout.net>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Thu, 30 Sep 2021 10:01:38 +0530
Message-ID: 
 <CALY4987_k43oqQKiGP0Znf9FYaJ50YzpQqejBbqUvvObqhxdXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] Rust oe-selftest file
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	alex.kanavin@gmail.com, umesh.kalappa0@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 04:31:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156480

Hi Alexandre,

Thanks for mentioning it.

It's already been taken care of as the following patch:-
http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=50f7a13e69e8987b3629d455f9f56720c376e89b

Thanks & Regards,
pgowda


On Thu, Sep 30, 2021 at 4:29 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 29/09/2021 01:04:48-0700, Pgowda wrote:
> > Add file for rust oe-selftest
> >
> > Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > ---
> >  meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >  create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
> >
> > diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
> > new file mode 100644
> > index 0000000000..ad758b71f4
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
> > @@ -0,0 +1,3 @@
> > +require rust-testsuite.inc
> > +require rust-source-${PV}.inc
> > +require rust-snapshot-${PV}.inc
>
> Unless I missed something, this is missing a maintainer entry:
>
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> rust-testsuite (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb)
>
> > --
> > 2.31.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156450): https://lists.openembedded.org/g/openembedded-core/message/156450
> > Mute This Topic: https://lists.openembedded.org/mt/85943726/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

