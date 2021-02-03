Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.10760.1612365718503688410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TMyKYo/L;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id e11so160989qtg.6
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 07:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ekUPALeg+NU8QW5C2AaJ7ARTNt9bTpXxn2JX4aZfXw=;
        b=TMyKYo/LPw2NmtXK5rverF8VkXmv37siHbg1p1/dJ3yeOi1pokR8TFHt74oAeLeq8D
         MTbUGIM1H47/YkaMlOkg+ACBdHDV8gKODXpW3J8YNwg+jrOLTZu3wjiFeol6aXkxQsYl
         47/6MgwRWO3CgUBLwii6Wxcn8+enagFOo3djv5d0rdpULefVTGQnABgrTFZRumLwP+Fz
         dl6V6468gMOsz7D++IpxQa+xAfilgVFfX7hsFuLKQkKMakOB+IHhQ0SgswZCo5C7xJG+
         sK0fBIxh8D6wliwg8XeoBtnAobCsYuPeb5JNTicl/mAAaJbVHDA7n6K+QKAOwlfS6hff
         Y9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ekUPALeg+NU8QW5C2AaJ7ARTNt9bTpXxn2JX4aZfXw=;
        b=HV3hwh/FfC1mFCuMD9OdjzwZ9bkFzq09szuVvCE1s4vkjMp38EMM+hrWw5H2VnGCMx
         B+JCHhRJ8OXjD6rx7mlYBsCJNtfiUR+GyRTl3tiHdmtZYvePQo/BOClseCp0kmfyC7ro
         IFDmNnMhWFq7Pb32OGyjiz48xKEssBDDQdXDz423z8+9TmXZUVsr49E05xNX5rcy59Xq
         6itXNCWMKemggEc+7JbqMRtaVxd4ueDHvCBJR3o8X3Xa/9QaMDsReMJ+WQ90SX+W12pM
         b5VVu23QP7jjc85YrkXvcsknU5dFvjfGfc8i6rYqJDtoo+4yQK8Qt4GdC8wMEVqwLEs6
         1FAw==
X-Gm-Message-State: AOAM532jZQe4z6UKZdhcZrMNhDHTtftwfED1msMLT0pUTaU55Jw64RLP
	Iq/2AZF9yKpfQQTnlUNUh1+ZySTLbOkn+DBeRHs=
X-Google-Smtp-Source: ABdhPJxgYCsfT1JVbo9iGxizKFLQl45Pr2BlGKejTOgjbyXWmt+HaIVv/9q9Unx7mjdzMG8BxA0AR6eFqhVVJarBZV0=
X-Received: by 2002:ac8:7441:: with SMTP id h1mr2927441qtr.88.1612365717569;
 Wed, 03 Feb 2021 07:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20210201183910.145052-1-raj.khem@gmail.com> <6557c3fc0dfcfa0968186079d6db005856b745a9.camel@linuxfoundation.org>
In-Reply-To: <6557c3fc0dfcfa0968186079d6db005856b745a9.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 3 Feb 2021 07:21:30 -0800
Message-ID: <CAMKF1sqAKen0iJWEUHnfQu3vH6mNyTywwH3hThChBpCgHia4yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.33
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 3, 2021 at 2:30 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-02-01 at 10:39 -0800, Khem Raj wrote:
> > Drop backported patches
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Patches fail to apply, e.g.:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/1911
>
> (but basically everything failed)

yes there is a dependency for this patch where it has to apply before
the binutils 2.36 series.
I can rebase and send it to apply after it

>
> Cheers,
>
> Richard
>
