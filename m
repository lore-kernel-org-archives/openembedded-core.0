Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.13497.1602847940157592410
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 04:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zq2+ESyo;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id a1so1346849pjd.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D9Kt7WkXrCL+IEGLop2IzO61leS4gAEhVrxftypmifE=;
        b=Zq2+ESyoVnsmxhEm+wuKG/dbDqrtvlc8KMlcDfeXMSo0/wNG4JzhMGBqNhqmudLAyW
         mR8l1StzRKPC0459Jwh/c67bBtay3ZujFiB8sB26nFkpET0bZ9tZv276kPXcHHTq+18A
         yev9E76mM9ibhpDRhpe3LvXZutJSwh2SVlVtxM5G9m0LFu4E+Ti4n3rnd5sAaS/iovcd
         GqseqT9T1fPT3uJyP/PR0XR+P0nS1gWE+ieJmjfUnfPUDMsAWFN/HKS5rXAGS6P4JriO
         kvp3n52Q4eXalB3Xh+0CzNr21JlaWeIMK3j4zwzw06ENj+tH2bwR7CmWLbhj6KrY01W1
         cmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D9Kt7WkXrCL+IEGLop2IzO61leS4gAEhVrxftypmifE=;
        b=aZ0Z7jTCcjQYzYANq4T5Rotss3/mnsWM1E7wnP5T077mveCEbGwW6aVAsqiHyqZlD6
         fAUWhJ6NNte6+hivsmWsVdjVZCZoJ73TmmVsfeeG3SymW6hgBgRMaw4NmKtsP1LXeYVO
         X3+dt9otUbHpfK5PpH2uksk+aM3GGSZx2k7WUU3IscgkP/TtTsCv9msZhsEwHG5wYHHT
         v24aChZzi8N7fcdbbjiJ/GSG1Ou5FyjnuoDEXi6QQJihz6Iqy27Pu1/s4MJcXhnbOWiX
         pft9w7vgiZUSdJA7xMXjR8Ccv0A95nte6AYGBsy4UfJXyw6aEaVytBYPLS4vYutS6KYk
         4pMg==
X-Gm-Message-State: AOAM531OA5WjDdbr63bMDIt1rgzQqv9jmW9wt4Yn+McDdpcxjHlJbAl7
	DRbf6h0oaQGxs02lN7LezpV15ex6fq+dwsSSLNg=
X-Google-Smtp-Source: ABdhPJxI6XHDb8Tf4oB/YCD8WPXfIHHKrqykOZ37ws2mqpA0KiQ4mCq803khdU4gv2WLPuClmmonLvd2E0quuD20/h0=
X-Received: by 2002:a17:90b:4a10:: with SMTP id kk16mr3644320pjb.77.1602847939693;
 Fri, 16 Oct 2020 04:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201015200842.18834-1-idadelm@gmail.com> <c17959f4b0ac63d56b7b8d2c76d69af8025ae677.camel@linuxfoundation.org>
 <CALbNGRSw_-9XwrsXWt462MeccFKiFCzmVYT4ESLBcitkpFC4Eg@mail.gmail.com> <4721672db9f150456b07f95af172f65a56445a23.camel@linuxfoundation.org>
In-Reply-To: <4721672db9f150456b07f95af172f65a56445a23.camel@linuxfoundation.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 16 Oct 2020 13:32:07 +0200
Message-ID: <CALbNGRQPmptZVYWsdPGcUbGvqQ6TsEQq+LBB1VLVdULdOaKZDQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH v4] Update license file to match current SPDX names
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2020 at 12:55 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-10-16 at 12:54 +0200, Andreas M=C3=BCller wrote:
> > On Fri, Oct 16, 2020 at 10:42 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2020-10-15 at 21:08 +0100, Meh Mbeh Ida Delphine wrote:
> > > > Updated mappings of license fields of meta/conf/licenses.conf to
> > > > match latest SPDX naming.
> > > > Added missing mappings.
> > > > Renamed license files that were added in license mappings eg from
> > > > GPL-2.0 to GPL-2.0-only.
> > Is this intended to go into gatesgarth? As we see from the follow-up
> > fixes: This is an incompatible change at feature freeze time.
> > Asking this because up to this point I was happy that all my layers
> > are working fine on dunfell and master(gatesgarth).
>
> No, I will hold it until after release at this point, its too late to
> take a more invasive change like this.

Thanks!

Andreas
>
> Cheers,
>
> Richard
>
