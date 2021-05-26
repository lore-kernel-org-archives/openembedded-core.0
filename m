Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.8751.1622041372273051382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 08:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=C9ofG8eZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.44, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f44.google.com with SMTP id n2so1550673wrm.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lcx+JrTUtnzjnMcC+UGgCHlzvTJMvkiyTiaH8fK7IBo=;
        b=C9ofG8eZhRQCvIRjbl0s+Uj+3zDpyTu3+emaSXAL6lO+9N/mU8nNpYVJ2Q/z6RCJ5H
         MderXaH49LXpkCG46B7ekcCESVWGw3Y4rumz/LzdMmae+S2nYUbyWyysFLs72kUOFv8O
         pnexx7x/Ob6SY5bRBwwFQ9sxjXcSPiH6dgjKjYwhhrbsH+LXurJ0iNHiws6Eva+DdSjb
         X5fiBRRsjczsdQpKCzuUYvfT07Ba2Wx2mmaPF9mBwDY+KyVamSQTIBveZNOTQ9ckVJC4
         ugquKuWAYsWOPVroWgwRE4NLKGnym8x6yrXiCI38IokkEibSolBgTdgkyOjzRty0/XoV
         5ezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lcx+JrTUtnzjnMcC+UGgCHlzvTJMvkiyTiaH8fK7IBo=;
        b=gcQyCRX5CwkahOVfFWd1f9GdOGVlTgyFRxc7vwMWq1HtdmMWA1PRm7RTrdN/L6Jdqj
         V8N1ATu6NkfetJdMiOW8/VqhpgN/mBo1iTcslnq/dN+IGzve63f4UmVlredfIDEeMfYJ
         Lo75o0Z22+QiSGg/C4Xx756nC2hSPhsh6FtFqp0NjPAEt1A/UyL347W9w7vIOPnIn3gu
         1TKPKggHSc9/XVcv9WWxHJHLrOZ46dVWkyJWgjpw2kcqKDEtqk8RJVVJ8PjZBRB/6iLR
         J7ylN7EOKyplhHZjVjKrEiUqHRFumvprP/WUnk9RrEz/w2spputKG4b+sXF5gUXg6S6Q
         KmtQ==
X-Gm-Message-State: AOAM5310X3//bzEIxqba5rH1qkD+arci4ACYH4/ndxzc470pXXjDSm43
	093slhjGkjQUdXzMv0td3PzGUfJ7sGks1jEYwQBTUQ==
X-Google-Smtp-Source: ABdhPJy5kn+n4nN9+sdSVPaWc05Hz3G6egMDcwGUACEpJE5uUwCMQItKpccSLicNlJLX2hzrGjocrWB2J0Pw/bJI9RU=
X-Received: by 2002:a5d:514b:: with SMTP id u11mr32931411wrt.350.1622041370796;
 Wed, 26 May 2021 08:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210525090910.11581-1-andrej.valek@siemens.com>
 <168247B8E1E1063C.25934@lists.openembedded.org> <DB8PR10MB397786AA74112101B3D9845192259@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
 <8de2b83c408696703284e7204da5285c0b594a47.camel@linuxfoundation.org>
 <CAOSpxdZa15LkX2nBPND0SyD7cRGWaLQ4KOkVJ=E074rso8d0Qw@mail.gmail.com> <DB8PR10MB3977521110D5C9479417ACFD92249@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB8PR10MB3977521110D5C9479417ACFD92249@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 26 May 2021 05:02:39 -1000
Message-ID: <CAOSpxdYvyTMUyQjwMPjByAK8usy_qygP=Hsp9TGPbc67V3OwXw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 25, 2021 at 8:24 PM Valek, Andrej <andrej.valek@siemens.com> wrote:
>
> Hello Steve,
>
> Thank you, that you're taking care of it.
> Sorry, but maybe I didn't catch the right approach about the patching. Are you going to create a "fixing CVE" patch or just patch to set "CVE_PRODUCT" ?

I will submit a patch to set CVE_PRODUCT, since we are currently not
detecting expat CVE's.  I'm not planning to do a patch to fix
CVE-2013-0340, I will leave that to someone who is more familiar with
expat.

Steve

>
> Thanks,
> Andrej
>
> > On Tue, May 25, 2021 at 12:17 PM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Tue, 2021-05-25 at 12:50 +0000, Andrej Valek wrote:
> >> > Hello everyone,
> >> >
> >> > I have an another question regarding to backporting this to dunfell branch.
> >> > Is it possible to apply this upgrade to this branch? I would like to
> >> > have an very important fix for CVE-2013-0340
> >> > (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fg
> >> > ithub.com%2Flibexpat%2Flibexpat%2Fpull%2F220&amp;data=04%7C01%7Candr
> >> > ej.valek%40siemens.com%7Cc9695097e1bc47d8261708d91fcbba17%7C38ae3bcd
> >> > 95794fd4addab42e1495d55a%7C1%7C0%7C637575782123699324%7CUnknown%7CTW
> >> > FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
> >> > I6Mn0%3D%7C1000&amp;sdata=jBk29qyJpIq%2BsG0iXhnMoSbv%2F2%2Bd8dKIbuV7
> >> > GqP3YA8%3D&amp;reserved=0) there. But there is a lot of changes,
> >> > means just applying the patch is not very promising.
> >> >
> >> > How we can handle it?
> >>
> >> Adding Steve to Cc. It is possible if there is a good case for it and
> >> there aren't bad side effects from the change. I don't know enough
> >> about expat here to comment on that.
> >
> > Our responses crossed in the mail :-)
> >
> > I don't know enough about expat to comment on this either.  But if someone who is familiar with expat would care to chime in I am open to consider whether an exception should be made.
> >
> >> I suspect we should be adding something to the expat recipe to make it
> >> match libexpat CVEs, maybe CVE_PRODUCT = "libexpat"?
> >
> > Yes, good catch, that does appear to be the case.  I'll do a little testing to verify that and will submit a patch.
> >
> > Steve
