Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web12.12576.1608649760505754353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 07:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OLRrtCNk;
 spf=pass (domain: konsulko.com, ip: 209.85.167.169, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f169.google.com with SMTP id d203so15080354oia.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 07:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YZ06tX0ASXxDUK8vCAp1BGB8uxXSXJENcVphDDmD/mo=;
        b=OLRrtCNkiyniaelE9dkyzyut6D7DclFxDvux55h/XZZbyiJYjM0sZ3Z7XGIHIf1GhN
         1DnPIFsrYywttJFvDhaRdWP/vXS+xSsg/9t6VxmUqT69jK84aqFCrCXmFUSUWRxtlKU1
         68dehIGFsIz/sFrAfpMB0tP6dS58C/umgMahM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YZ06tX0ASXxDUK8vCAp1BGB8uxXSXJENcVphDDmD/mo=;
        b=f0Jrw6LTE6CntfLEWggDMsx5NpVrFpL6v4CdxmHq3U3tXqujvBJ3mRtcR/AdTr0r3z
         3fludbjT9rT2P0+uvtXDHEODOUDRRjJUl6tqHvb3tFrhhOsLU3yVT+eA453rvIGFoYCa
         s5yrKCZxy478coRaMTCpyfUn09Wfq8T1KR96bc2nayelo+aC2kp/MHuzXd/B7EvcrDM1
         gzOiMfRPwmsFv6jSyehtTiMl2FNFFkN4T/2MJZ12EbHHo2dkp6/iHDR3FAlvb9b5qTlw
         UtNnXO35eJCs0mciuvWBfph7rmj7028F27k8haaop2mUrllJ6gvaOOAEMfXZL/F7apAD
         VOLA==
X-Gm-Message-State: AOAM530bGvAyKMSVlZp0bskrV6vYsVXb3l8m3Bslg/qRXgk51NfcT+G1
	+Y1u3Ya1qJzyCI75fClCTqYomJ3ZtWm2OoyNR5pLDg==
X-Google-Smtp-Source: ABdhPJyEueNPsOliQ8cnFp6EnyxO1vEDZ78pSkxuqtLxMuoB/stgrYddHQsLd/9y47fnTZxpbZtO5JahEkJ5RqzW2aQ=
X-Received: by 2002:a05:6808:a95:: with SMTP id q21mr14775054oij.6.1608649759870;
 Tue, 22 Dec 2020 07:09:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607007208.git.steve@sakoman.com> <CA+chaQeEFu6++N5J2qkEjU9HZPqjAahuDVGZAcfsma-9zjDLZw@mail.gmail.com>
 <CAOSpxdaJXGM5HMR0yvobzN2sa2cy-+AxLqsa99tD4pn6fiN7+g@mail.gmail.com>
 <CALNvYWMznudnN+_6yCkxcwxhtv=8M=hRC1nNpQP6Ww7ZTedvPg@mail.gmail.com>
 <45cc5593b9b9bfbdfde689a5f72a678a99eb5d2b.camel@linuxfoundation.org>
 <CAM9ZRVvCueC0+9b+Tvwv2pHm+44OGwU18O5zDH2wBUgghW_gjg@mail.gmail.com> <CALNvYWPbzRzC_B7FEUTZX7t5ts_Si+vqPaD8cy99JOsEF4+LUQ@mail.gmail.com>
In-Reply-To: <CALNvYWPbzRzC_B7FEUTZX7t5ts_Si+vqPaD8cy99JOsEF4+LUQ@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 22 Dec 2020 15:09:09 +0000
Message-ID: <CAM9ZRVvOXxc1GsZu9BS2s44ipunQhz=cPvdDHy+s8nx-5UDAmg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/28] Patch review - pseudo file mode corruption fix series
To: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	Martin Jansa <martin.jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Dec 2020 at 14:57, Erik Bot=C3=B6 <erik.boto@gmail.com> wrote:
>
> On Tue, Dec 22, 2020 at 2:50 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Tue, 22 Dec 2020 at 10:03, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2020-12-22 at 10:08 +0100, Erik Boto wrote:
> > > > There's a bug affecting wic in combination with --exclude-path /
> > > > --include-path that would then be backported into the LTS version.
> > > > See
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14129.
> > > >
> > > > Maybe the issue that is being fixed is more serious then the issue
> > > > being introduced so it's a valid trade-off, I just wanted to mentio=
n
> > > > it so it's known.
> > >
> > > I've been suggesting Steve hold off this until we sorted out master,
> > > having a patch queue ready is helpful though so we don't lose track o=
f
> > > all the patches.
> > >
> > > There were some fixes from Peter/Paul around pseudo which we needed a=
nd
> > > have now merged which leaves the above issue...
> > >
> > > Cheers,
> > >
> > > Richard
> >
> > Looking at that bug (#14129) I wonder why "${WORKDIR}/build-wic" was
> > added to PSEUDO_IGNORE_PATHS in
> > https://git.openembedded.org/openembedded-core/commit/?id=3Dad8f5532ffa=
ead9a5ad13e1034fe9e5e1b7979f4.
> > Is anything likely to explode if we drop that addition?
>
> Yes, if you try to build an image a second time it breaks and you have
> to "bitbake -c clean <image>" in order to build it successfully again.
> I don't recall the exact error at this time, but it was related to the
> partition files wic created under build-wic.

Ok. Sounds like we need to move the directory wic uses when copying
the rootfs out of "${WORKDIR}/build-wic" so that it can be tracked by
pseudo. The partition files should stay in the build-wic directory.

--=20
Paul Barker
Konsulko Group
