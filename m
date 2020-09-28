Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web11.35974.1601297727227508327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=P5bgt24C;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.195, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f195.google.com with SMTP id s88so1089961ilb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kkr+admmzxCoGjggnKtw4sFQopV3Z9zL4E2MmjFSS8=;
        b=P5bgt24CoWLdW5IWlmrpxGT56Cp/fGZxkULxLm9Xomimsf3Kr020swW5afxIfqKINR
         oHtTtGVAUeRzMjtKrqHXj3MRZcJa0UTysQSzb+OPn3R2sgeVPRw+9Za2Awp1W7j9nxzl
         ebfDhvBoMnI1UQy/dNTTpGLtm+3H+RJgUP+LRrjUHIOgl6FcRaTa0v3Ak38cCAnonWjt
         EE82IYARc7Ad7UWNkd9jzHIF3DCI7ux2vDG+pen3sRzwxrUFJcuCh7hkE6ngRvkau5rx
         EepaStWQu5xs5fODnvlTkBRrd8ZtMhUg4ctbmjIhVF/40oDBNDC4d3PEZmSwzYqeNAA5
         rE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kkr+admmzxCoGjggnKtw4sFQopV3Z9zL4E2MmjFSS8=;
        b=VimUTWRxJgeNlcdy55Ds2wIk9hDVNe7VxwMMA/b57Y5s6yhmCIImyR8KiPpYVxwaFF
         zhnUdMzVqNztchN4b/FhqhQJdK/gBdMWv5Pjlw/VPrG7EeR3mQWuYspxS1Z5JrFZKqoW
         R6Sd5T8yY89cjWrnEnnzJQjUroKtC1WcyD3OWsBJO6rcOMnnB8ljmdPhqLs3J3WgCIEF
         YpuKOSVUNWwb1WZpZkHDtkhAPaarE0mMcC1x1jzUtPnK209K/m8Vh2A1iWzmX/RMOmqQ
         v3EJemu9XbfymuuUgXbsJP5Qqh80dSpEYJNsAUiyPnbS704DeVVEufgWYcgh98mWk4pR
         ggrg==
X-Gm-Message-State: AOAM533XKL4enE6If9jxhV/XqqfmM0lfSqGU5FhsPIMVh979Yj0Rqohr
	8L8hAh2OBdzYJcCUJ1Du4EFqTtyoKk+slPqi3sRfy93diOn4QQ==
X-Google-Smtp-Source: ABdhPJzunZ//64T8JBDR4JyimlIudh9VN2/FNTpTUBSbWwVzSH6ajD6pbYEjS/f4JwrUCjRKOcOtuXYd48ZTbcAIL38=
X-Received: by 2002:a92:89c3:: with SMTP id w64mr1044519ilk.49.1601297726390;
 Mon, 28 Sep 2020 05:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200928020142.5706-1-jon.mason@arm.com> <20200928020142.5706-4-jon.mason@arm.com>
 <20200928082504.08014c32@opendreambox.org>
In-Reply-To: <20200928082504.08014c32@opendreambox.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Mon, 28 Sep 2020 08:55:15 -0400
Message-ID: <CAPoiz9y4J0gD9LbLObhJRcj0p1ZPHZzEzRncmnZJwHPukYMgGg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v3 3/6] armv8/tunes: reference parent's TUNE_FEATURES
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 2:25 AM Andreas Oberritter <obi@opendreambox.org> wrote:
>
> Hi Jon,
>
> On Sun, 27 Sep 2020 22:01:39 -0400
> "Jon Mason" <jdmason@kudzu.us> wrote:
>
> > diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
> > index 66a5d0c437ee..51842e9edda9 100644
> > --- a/meta/conf/machine/include/tune-cortexa55.inc
> > +++ b/meta/conf/machine/include/tune-cortexa55.inc
> > @@ -8,6 +8,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
> >  # Little Endian base configs
> >  AVAILTUNES += "cortexa55"
> >  ARMPKGARCH_tune-cortexa55             = "cortexa55"
> > -TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crypto"
> > +TUNE_FEATURES_tune-cortexa53          = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa53"
> >  PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
> >  BASE_LIB_tune-cortexa55               = "lib64"
>
> cortexa55 somehow became cortexa53 in this hunk.

Good find.  :(

I'll fix this in v4.

Thanks,
Jon

>
> Best regards,
> Andreas
