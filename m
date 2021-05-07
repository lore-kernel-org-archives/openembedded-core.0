Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.12932.1620404941316665309
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 09:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=F2/iGwwI;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.46, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f46.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so5227755wmb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 May 2021 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w/fBqDM7DKnBXJtrHIfen81OP1MC5Uc4gIz5a1bHhDE=;
        b=F2/iGwwIbivFDdPJsCd94XMyTvHBKlPRxoj9Tajzp+SbZCRFBeQL6sxNQGyKX8/wg9
         cLzBNWENa5d8+hQ0lAkQAty26m2qSxPAEkyWe75cEGQDYAf1MjIr/K8RQJKXVz7nU2cW
         PrpZ6oZerZecyQFaoDYoW9YaTAbHPgfbmhLHc7scFuGTSCNMJkiR1LyXCjoWOmVT14xm
         6M07O7sYXRfaXjxGqqor4qIkU9MAEqzmm9pErlWWPC437QLUKvo/imfLMc+l69YIVLkv
         /6Ze94KM5gaXmYp8FEze10A9lwlD7MQ5FrDk55ngCxvZ/FMb6Ov4Gav3SfWUMsAmFJYQ
         M2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w/fBqDM7DKnBXJtrHIfen81OP1MC5Uc4gIz5a1bHhDE=;
        b=fun7ysR4GmBRa3lKlwWR0S54CMWNnAaTIV8I4BuVBlTcFt5Fa0ZmwIQHdEXh1VVkg1
         0evI5ZH1STp+9UjnrpWY0PSmLqK8kL/YkPNw++4u1+mRyTo7wfqyvBJJzbbY6v5qj9AJ
         cWcdSl47aHM65n2vPZg5VP0hFIRjoE5BnrPL8Q5Ilcr+X5MTq2kbNIALFRrhyfBGFexD
         3c6HzWH41GaReyH7wRA6bq56CnNQiKD1PNA2+5Pev1ZcG8jRErgoAXdYKB5vjCg+Db4p
         yGgAxLK1cr/b5vCM4wHNvYDF6qB9B6URVaITFfg6mv8JhNbFj1U1FNQYBdG8caa7Rhfu
         Yofw==
X-Gm-Message-State: AOAM53125zEfX8WU1hisoiBvoGAC9D11kSa19O9kgugu3M/zELV9IRtl
	wnVO2ECpi4EoGy3w9xzo2u3h8aDIlAAblmhUn+/RLg==
X-Google-Smtp-Source: ABdhPJwjTNVjP0DNBY1EYsRyvlpbetn5ysKMXV2d5xnHZyw34AgE/ilobX6HbspbIwfUo+DKIfEgvmMayKyGQh8gaKk=
X-Received: by 2002:a1c:545c:: with SMTP id p28mr22290139wmi.118.1620404939640;
 Fri, 07 May 2021 09:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210506125721.27515-1-bruce.ashfield@gmail.com>
 <CAOSpxda+ArVQ78hweJm6ckd7ga=aXhzssMGVPv9317b_e++hEQ@mail.gmail.com>
 <52a724c1ec9c0184f7153c4b9359b4681f915ea1.camel@linuxfoundation.org> <CADkTA4PE+ay-rftL=K24XgF8O7jmC6HqgNBE6jhi_EiDWE-GYw@mail.gmail.com>
In-Reply-To: <CADkTA4PE+ay-rftL=K24XgF8O7jmC6HqgNBE6jhi_EiDWE-GYw@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 7 May 2021 06:28:46 -1000
Message-ID: <CAOSpxdbzjWSZi8LuOc1mCUxtLPPGe4-v0re+2JK8+EHQCht-Cw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] linux-yocto/5.10: qemuppc32: reduce serial shutdown issues
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 7, 2021 at 6:23 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, May 7, 2021 at 11:52 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2021-05-07 at 05:18 -1000, Steve Sakoman wrote:
> > > Would it make sense to do a version of this patch for 5.4?
> > >
> > > Though much less frequent on dunfell, we do see it on occasion.
> >
> > The change is a simple removal of a defconfig option so should be relatively
> > simple/safe...
> >
>
> I did the cherry-pick to the 5.4 meta-data and just send the patch.

Thanks Bruce!  I'll cherry-pick it once it hits master.

Steve
