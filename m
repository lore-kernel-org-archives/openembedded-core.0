Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web12.42700.1602513586982382672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 07:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o953sQC0;
 spf=pass (domain: gmail.com, ip: 209.85.219.194, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f194.google.com with SMTP id n142so13568014ybf.7
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kwTj1WZakLhTl0BrioNvI/XPjmtGGk74tlmEfFuMsag=;
        b=o953sQC0+ByGVPiljc2n6Gj7A+Ud0RZgO3AbxcwnNl1vBdvgAy6XfSP24mhzAcfNTj
         tnmauz0JQoZPFB2GQ2NlqbxZfvXzMJJQDsdHl6wc1k5YRnBbrSCst2VhGFQaP/1rvrQK
         mMDFN+tiokqYv4mbg55AE0mfDOTM/wMQ+LlBV8uIlAziFM9OiLDmkkdYgvGFJM19fuAR
         w/mJ5KjDqvUvGzZvUXB2AhdrNeiUI8NANofdGTMYBNaQnHfjD2SxIxZq0ao3vHY+AcSO
         WkcQgfMwLKQJSQDonWvg68/gdL9L7KMJ7hDs2N2xznVMJjlYoeHZ7YFFPgThgSuqxUvH
         EHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kwTj1WZakLhTl0BrioNvI/XPjmtGGk74tlmEfFuMsag=;
        b=h/JZhUSVDYT8GDLmZXhlQIbBgauYQRsNBtHmSG1kgw8GPrf1u04+ygXExJPILw+nH5
         JHwTaHj7hx7H0RpCcAIIUmKLx4eZhAA1tGC0mL+djiyiV+NWN4aBbKpZhKR8R0QC51Qq
         FKPHx0dbG35vn+YCkipQXVzsIJHzp1bRjaXWxpFMz+cE7RF6ap0Pb9WNoQED/XcNI1k2
         zcFCBX6/gUYQeePz2xv9YG1JjPys0mJkXdMfvmZL7iVRrQVjLhX/eNLNICf1t0sT2nuw
         Dhdra7UFxoj0fr2MVWsba3pxPvB5Czcx/JpA36O1PE6F/0bKnG8+PFFwsLtUFOnae6Cz
         UDSg==
X-Gm-Message-State: AOAM5319A8okcfIUGMJLfccCOVH7ubTw6O/TOIHNmuWsQl6p+ZuhXJRy
	qvNybUg3W39Ipw9yTk2t/ky+pBQCr3QVIJpavvM=
X-Google-Smtp-Source: ABdhPJzNRTnN8WPofxPkAECI4TjE2hnoquHaI/vHcal3N5diKnyV3GSgkiTKTIJsBgmydo3Wwdj+ZuiB+YcYZ9pXjRc=
X-Received: by 2002:a25:3417:: with SMTP id b23mr9002130yba.97.1602513586153;
 Mon, 12 Oct 2020 07:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602253014.git.steve@sakoman.com> <182869203b57860695e818b620e40b398ef4e921.1602253014.git.steve@sakoman.com>
 <1d2bfd98-69d7-2f43-7b6b-7ea5c2b2719e@gmail.com> <CAOSpxdZEuXWm0Ed36nVmC4z8q9-Hzdq+ymCW0AkA4b-oDNeBoA@mail.gmail.com>
 <CAMKF1soV7Pgx-1OAjUvxXywd00p7_B4oX3+3QZW6_urcL0hofA@mail.gmail.com>
In-Reply-To: <CAMKF1soV7Pgx-1OAjUvxXywd00p7_B4oX3+3QZW6_urcL0hofA@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 12 Oct 2020 04:39:35 -1000
Message-ID: <CAGDS+n=qmkUn00vBBJK8ZXonHOuQ3=W6tKyv77_6HkNR0VNscQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 13/14] qemu: add 34Kf-64tlb fictitious cpu type
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	akuster808 <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2020 at 10:45 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Oct 9, 2020 at 12:28 PM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> On Fri, Oct 9, 2020 at 9:23 AM akuster808 <akuster808@gmail.com> wrote:
>> >
>> > Can we make an  Arch change like this in a stable release?
>>
>> My vote is yes since it will reduce the number of intermittent
>> autobuilder failures and seems very unlikely to have any side effects
>> for normal users.
>>
>> Of course if others object I'm willing to bow to the will of the communi=
ty.
>
>
> I would be fine but let=E2=80=99s soak it in master for few weeks first a=
nd then see what happens

OK, I'll pull the two patches from my pull request and will resubmit
in a couple of weeks.

Steve
