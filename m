Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.126.1589990416700115554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KhbGBozC;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id p12so2895961qtn.13
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 09:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ja33iH1Z9nFHtEnEIJy4KReMKv/puIU+a8FWyM9L5Hw=;
        b=KhbGBozCH0jnHNM2cWIDF6h4+qVYohrMSuUbhIRki8qZ4HuLGF6t6c56cfD0HSVfRh
         A94A82G7sNeRG7fk4BsZhcQMcD7Fb23KtDqjZFTN2UkdZIpeC6Y7o7C4QFmeJkS53/gf
         QCx4MtlnNgH5pJc+2NanOV364cRJULUi523DcbD0ahBk33BqqMBaZl99mehjVJkfjfMK
         nmCrSGX+NbB3M7z3M40RPVMIXVS/wHjCv8TqeiMNNWc32pXJz9eksrHIIduG4uFn/ODI
         xLWnJYyGl3Wawq2L7MVkXcsLGpYLxhQ7Am5bE0HXh394c8oQ+YMzn9CmaZ5Sn0/IgS54
         wm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ja33iH1Z9nFHtEnEIJy4KReMKv/puIU+a8FWyM9L5Hw=;
        b=ZBuAHvDEcagHKVOruQNzXsYZ0yu4GlOr9R9LN+aZ25/2WaKEcpPKw/nWCGRoYB1BKj
         YLMV6Zl9WDdj6YbdXASFIxxQzrGPzYTJp0U0F2f3icZ2PyW0kdoyi8ZdJvbO2spQ/Upw
         yXaeNiHFXha48yt1/sK1t4uYyYnVMESbQMy1gN131nWeQpAy5/sNtTHcKA7B1+pHkc1b
         z7WEfdTb5gr8AXYseo0QTMqpBB2Moyr8kCrgLNpaYRsV1qa9Fn6o6SDW0wX0HMZaFHk1
         JDp+CnLRjo77gZwPql734ogAvmUO8iWkzqWhN4TdEDdEsRiOiHI8Q8XtN428KDbHzBLm
         wofA==
X-Gm-Message-State: AOAM530xjZ67yC6M8bTt4mQdp9oBFbGDswTyYDX+QtC0jg65/r6xTEQL
	6hAmDqh8cmSOm6AdsYwRAMxNSkJzWs+tYJv7VWI=
X-Google-Smtp-Source: ABdhPJy1fdyN2W2v8PH+nsGen7HpTghPqYtNF82ug8h4lPhFFejE+KGV3C3Ua3wjdq5XjDH5pNeioQDmPHQsaO1keR8=
X-Received: by 2002:aed:308e:: with SMTP id 14mr6053128qtf.146.1589990415745;
 Wed, 20 May 2020 09:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqLxWZD6U1YHrr3Ngb1Vh8JpjCvUXRD7ybarit9wz5KfA@mail.gmail.com>
 <CAGDS+n=taO-HkbecAKihO_oD=WGusAjoL4UoJV-7mgmYwXa5ow@mail.gmail.com>
In-Reply-To: <CAGDS+n=taO-HkbecAKihO_oD=WGusAjoL4UoJV-7mgmYwXa5ow@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 20 May 2020 08:59:49 -0700
Message-ID: <CAMKF1spt-rNn-SsC1qfC_aQZa4H60m8-f=7aDZwe0xq_j7vHTg@mail.gmail.com>
Subject: Re: Dunfell backport request
To: Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I think I can create a pull

On Wed, May 20, 2020 at 8:44 AM Steve Sakoman <sakoman@gmail.com> wrote:
>
> On Mon, May 18, 2020 at 12:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> > I would like to request backporting following master commits into dunfell
> >
> > https://git.openembedded.org/openembedded-core/commit/?id=fd4a454b5a357c7a26792bf486212957c698839c
> > https://git.openembedded.org/openembedded-core/commit/?id=882df891e13ce5c64718c364efb9ef2bf189eabf
> > https://git.openembedded.org/openembedded-core/commit/?id=2c7e0e0bf32eb1ed0b7d8acddb16c0d1e93f2aa1
> > https://git.openembedded.org/openembedded-core/commit/?id=48b6f7e31ff042a4900307e830f9ed9375a8041a
> > https://git.openembedded.org/openembedded-core/commit/?id=ce6c50ea68c34e02b487d54fdd9288e04833cdef
> > https://git.openembedded.org/openembedded-core/commit/?id=886333c5d1c336da99300d24fb3c15ab0b37d1cb
> > https://git.openembedded.org/openembedded-core/commit/?id=03b04fcfa5549a54fe6f335df14433934a7d5128
> > https://git.openembedded.org/openembedded-core/commit/?id=e114c670d1e670397c1c04292688b7550f54027c
> > https://git.openembedded.org/openembedded-core/commit/?id=030cd9021ef50d71482f6acf0e05fe425038c822
> > https://git.openembedded.org/openembedded-core/commit/?id=a5331c5a8bbe63c6c2e56ebec496b28968d4663d
>
> These changes are intrusive enough that I'd really like to see some
> discussion on the list before I decide to take them.
>
> In the future it would make it much easier for people to review the
> backport request if you sent it as a traditional patch series.  A list
> of commit IDs is much less likely to get the attention of the right
> people!
>
> Steve
