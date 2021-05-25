Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.77.1621981411912951819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 15:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=i/FGEv3R;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.48, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f48.google.com with SMTP id x8so33781543wrq.9
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 15:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oVndwOEEuvL9D/MaFDYPc1B1HMUenIuwSnto9f1eM8k=;
        b=i/FGEv3RF3mSwxJVTPGK04bzo3cj9wjWwz60cfK33VsA5cwPYL9LOQbefg4gbOtGvK
         BJw/0VyPHojz2L+CNJ7IJKV4l2k9j/jSu4JKJbwscYIwUGy0hk4lZ/wgdRoz1AcVWP9q
         8ry5aWHeO2FORiuSBR8j9ZjMjbkwtLdMuhbmOyRUCRsH+2pVx1epU0iiGvH/Ec5kdpon
         iB5ygomv3ZHyk+Bha+MJZujk/dtzLwz085KXhiwuQN0H3Q5K1cfKGPaTem8hC3IytnBM
         2WTnv6sCR2xiQW+s6aq7+POZjzxZd49VDBpqgeJL93Hx0l6JWNtv3bb6dfCTmW9uyOrq
         UJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oVndwOEEuvL9D/MaFDYPc1B1HMUenIuwSnto9f1eM8k=;
        b=pc+Nm7jcR0ccFCxObylGu3TpFndvUWjpr68/x5qK/zZVOgbfFWuLiloff69TrBa6jg
         8ch7uLaWgcjQ12CCRaM+0r+4W5u1gciqDVzDPQtefGAEvYjAKHIrmUOBZV+SSFDb3Bm+
         jcI5OxeShTbUHpSkUVg+BQvoALZMeffAZC24PBp4LCYCS/MoqGrRDTvoSythsw7ySban
         8pXWzaXHxdmcTeiKYQFVeU9RdAaXK5nsDrDkzLOf666crx/1XfoKSIzFgSSBvQa0ZGy/
         NHRSBy2+vNNHFAFmSEybBaYCp2aMWqcP6HWChkLdHGM3PCdGq2m6Yl13Uau41Vnk5Tat
         eY3w==
X-Gm-Message-State: AOAM530eouvxJz6vQBGNDvAYx/22vUD+6piiMmxjFua/gdD6Mgh0/HmH
	8YpzE6aO+KaiThXM5J0LQKQQsPYIXRRzUWiZymsYjw==
X-Google-Smtp-Source: ABdhPJxCKLMhZp3IO8GNWScXqkIM9HsLS4hM6jLafLwIQ6CxOnCuHZXaGNY7MKsP+CDnSlV04xexb2DOjbMVYJGj6Mo=
X-Received: by 2002:a5d:638e:: with SMTP id p14mr28856646wru.299.1621981410321;
 Tue, 25 May 2021 15:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210525090910.11581-1-andrej.valek@siemens.com>
 <168247B8E1E1063C.25934@lists.openembedded.org> <DB8PR10MB397786AA74112101B3D9845192259@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
 <8de2b83c408696703284e7204da5285c0b594a47.camel@linuxfoundation.org>
In-Reply-To: <8de2b83c408696703284e7204da5285c0b594a47.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 25 May 2021 12:23:19 -1000
Message-ID: <CAOSpxdZa15LkX2nBPND0SyD7cRGWaLQ4KOkVJ=E074rso8d0Qw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 25, 2021 at 12:17 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-05-25 at 12:50 +0000, Andrej Valek wrote:
> > Hello everyone,
> >
> > I have an another question regarding to backporting this to dunfell branch.
> > Is it possible to apply this upgrade to this branch? I would like to have
> > an very important fix for CVE-2013-0340 (https://github.com/libexpat/libexpat/pull/220)
> > there. But there is a lot of changes, means just applying the patch is not very promising.
> >
> > How we can handle it?
>
> Adding Steve to Cc. It is possible if there is a good case for it and there
> aren't bad side effects from the change. I don't know enough about expat here
> to comment on that.

Our responses crossed in the mail :-)

I don't know enough about expat to comment on this either.  But if
someone who is familiar with expat would care to chime in I am open to
consider whether an exception should be made.

> I suspect we should be adding something to the expat recipe to make it match
> libexpat CVEs, maybe CVE_PRODUCT = "libexpat"?

Yes, good catch, that does appear to be the case.  I'll do a little
testing to verify that and will submit a patch.

Steve
