Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.7185.1586163844897338388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O9bNt8Qn;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id r24so13782478ljd.4
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 02:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qN+I/U0WWsIIZwo8Z9eM7oub1hkBH5j7A7SBi8tWaVE=;
        b=O9bNt8QnffkIBEL/iq3waPhvgSaaIHTgT4cjfpEm1zpTl9sExx5T4OL4Iv5QWHzohy
         mLi3vv4STJXM9fIUtNKfp6M2d/DDfpiGWH6HYxKo1p7J42xVIE7IVamjIjO0aHwmh5FG
         OOY19iH/hM3vZAt2VdOtldeASgxKNU8BICO5QLXMWEgeiJNUHlP/v1kd0+ddmcdQYNOH
         0oGx6nYFPSayzwZfJpdEDkwsVt+gQ4UlvDZnsTnCAgww08j+sqqWgY4AwAN7NR9FlJh6
         4SnoL+uo2EV3t7Y7DZaN4nghbE6dezCiCGfuDsMYuIAgqdaRPMsjn0fqeaHJzWukiH+y
         qUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qN+I/U0WWsIIZwo8Z9eM7oub1hkBH5j7A7SBi8tWaVE=;
        b=bwK2/PklfP9VGSScDIEgpA0QN6m44kYcXmPuffg5+1mPQOm/pYP1zBdJ5zkak3x8OF
         iD1yPR7Wx0E8V9y4yw5nKghacIc5LFfiCPlwFZDy0i2SFKBTVd+WNcDaw11amfxzFPR7
         O6eiursQP5pT2FG4p0NBZyHa6+r7uoL4s/inSQ2rmXJWD6RHm2yMKaEm3kF9Z8Lncg6u
         LE0lVk5PgLDfsjtTeMLlUmi/H5ROqfZyQLmTlncffXbTNfxlnD4ldTgxIzUJSaxx4x2f
         8ja6nilrqawb4mft8L/Ub5JAZXSUtNKEoRBb6N6Qw6x31DXUZajsp4LPhVLhKwdxeW2H
         YlPQ==
X-Gm-Message-State: AGi0PuaB4Xigdn14iQoPtpHHlvxTHH8FAkms+qqpbWHN53F1gGAo2b9s
	aywty1DTjs+T0tBlkM9Kf77MHhXSZgVznroEeUM=
X-Google-Smtp-Source: APiQypJtVFIVNAfTrfDOOOzqvCGXlxdz4K7QR6ACk01Guc+mZUaNtWRIVmK4f62rWd0Q0saSkmyR7DwUUQAcsWHysQY=
X-Received: by 2002:a2e:9959:: with SMTP id r25mr11711872ljj.200.1586163843203;
 Mon, 06 Apr 2020 02:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200304144936.2559106-1-ricardo@ribalda.com> <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
 <1602DB74B6717A3F.2403@lists.openembedded.org> <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
 <ed35318a96db8ac58bde7596f47bb0bfcd27b27b.camel@linuxfoundation.org>
 <CAPybu_0W9FAQaH17X7jt7+cJU05XaD+3J5owAMvoXurfGpc8fA@mail.gmail.com>
 <CAPybu_2LZgaDFL-jexc0DcnEb0nzsLpZq30nA4UNufztDsKs1w@mail.gmail.com>
 <db5856cec86de82a4feddf1cf739ce7eb37c6932.camel@linuxfoundation.org>
 <CAPybu_1ULyzXSJzYAHGRh7FeM9i0PX7g0N-v=XqeFPKJ8k0hzg@mail.gmail.com> <0d818b09b16f9a1156643217599f6b774d1ebc17.camel@linuxfoundation.org>
In-Reply-To: <0d818b09b16f9a1156643217599f6b774d1ebc17.camel@linuxfoundation.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Mon, 6 Apr 2020 11:03:46 +0200
Message-ID: <CAPybu_3+-BKzZGvWPA1v7KNdHGejKreLw1VvwOkCEUz1MHVJ7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, jpewhacker@gmail.com, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

Hi

On Mon, Apr 6, 2020 at 11:00 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2020-04-05 at 17:44 +0200, Ricardo Ribalda Delgado wrote:
> > Hi Richard
> >
> > Thanks for testing it out. Seems that I am either not very clever or
> > I
> > should not work on Sundays (or both), v1, and v2 where exactly the
> > same. I am terribly sorry to spam you.
> >
> > I know it is abusing your patience, but can you try again. I would
> > love to try it on my setup , but I cannot replicate the bug.
> >
> > As we speak I am running oe-selftest    --run-tests wic.Wic on
> > poky/fedora-30...
>
> I did re-run it, it took a while since a pseudo change invalidates
> sstate. It passed:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/838
>

Thanks a lot for testing it. I will prepare a new series including that patch.

> Cheers,
>
> Richard
>


-- 
Ricardo Ribalda
