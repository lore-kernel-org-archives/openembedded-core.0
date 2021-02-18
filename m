Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.3107.1613626005946790997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 21:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RhkdKcd5;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id t62so1072807qke.7
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 21:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5VMzo3167oAHTstVOWnZ1uXjze0I3hjgxy1qpPAl8xE=;
        b=RhkdKcd53Ru7XPx5l6fcSAg18ero9v5vEtCzK+AABlUduQrsqcWKOE2qS7nhoSD0ya
         Rrq/cHOuvzFs9D4D7C5YqDXyAtkRN57WE1BzdVFyNsPPwRhJDj1eUpKk3NkAhZPZBpt2
         91YaFZ2BIbmhx05ul8xsn7aTGiqsC5soCLQrFamYLVH0DQjFpO+9fx3Ws3UUfmB6YzNX
         CF1m5jwtNWGquYGtmSVTBFhba6Sgakggmv193kSWTNeVn6tXg9dU3wKJQ6zIixaY/urw
         2F0MHOA2jX682FUS8UQWQZ+a6R8MIZe9mBB1IKemomTJ1U78+pwC+HXKiFY3wsnxbUfb
         lY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5VMzo3167oAHTstVOWnZ1uXjze0I3hjgxy1qpPAl8xE=;
        b=RYS8cpoksz0IO51DgjizrYJODFB0MLMmDOu1a3N+sHgQkDNFN03YDuq3o40Cj+gXCc
         99NC4AdyPmAgrqTgf4M2NCYbkdydNtXPhElLKnMn0lB2nVkd3a7Vva6+AXEJvWgcKp3/
         Y/vjct5JJoPX5k2eemaetA1Xhn+4T5PlvJ/VWtR6jAQYYWRQes0b5PbsvE72YgFoy1/E
         97XBVOyN+XQGa8Cu+ERgaOR3/qfqSlNZiwyL6igfT9QW1nMpYl1e8D1bV58SX+THCvgd
         4vqHtYn22TSDUgqOyL7gt+p2NnRkOo+3qLOUhtruQHL2q3jbYVm+u3pz7l82a4x0doI/
         ieiA==
X-Gm-Message-State: AOAM533xrvgnZWC0bBoWVt9j7fsqotoPrU998QI67E9KIev8CNOj8bzz
	3ZP+Lw6235S5djie8Wqsj6PhbfVZyL7F5m9GW5Y=
X-Google-Smtp-Source: ABdhPJyOGwqQRIEHUBvQxmCLHZPjmCjRN2tHi4hc4BNawTK53aBcJrsDFM2MF8oC+2LBPCU/QAeTAZIbnFMrBUSJ4CM=
X-Received: by 2002:a05:620a:b95:: with SMTP id k21mr2710605qkh.125.1613626005022;
 Wed, 17 Feb 2021 21:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20201015204539.24549-1-idadelm@gmail.com> <1312e9f5502bee8d7667c598ae4fc5b7de61830f.camel@linuxfoundation.org>
 <CAN7sTgv1q_Am=HT_h4-3Uh7CDgtVx-6Se8i1BDPx6VoPQVJigg@mail.gmail.com>
In-Reply-To: <CAN7sTgv1q_Am=HT_h4-3Uh7CDgtVx-6Se8i1BDPx6VoPQVJigg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Feb 2021 21:26:18 -0800
Message-ID: <CAMKF1sqk3_xg05mU11Ej7DOmLPjw7Eq_sE8_pTFipZtY3fth8A@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH v6] Update license file to match current SPDX names
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this ends with considerable fallout in meta-openembedded

https://errors.yoctoproject.org/Errors/Build/117091/

On Wed, Feb 17, 2021 at 8:34 AM Meh Mbeh Ida Delphine <idadelm@gmail.com> wrote:
>
> Okay. Thanks you.
>
> Cheers,
> Ida.
>
> On Wed, 17 Feb 2021, 12:17 pm Richard Purdie, <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Thu, 2020-10-15 at 21:45 +0100, Meh Mbeh Ida Delphine wrote:
>> > Updated mappings of license fields of meta/conf/licenses.conf to match latest SPDX naming.
>> > Added missing mappings.
>> > Renamed license files that were added in license mappings eg from GPL-2.0 to GPL-2.0-only.
>> > Added "or later" versions of license mappings
>> > Added "or later" versions of common license files eg GPL-2.0-or-later
>> >
>> > Fixes: [YOCTO #13320]
>> >
>> > Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
>>
>> I really want to get this issue resolved so I've queued this patch.
>> There is a comment below.
>>
>> > Changes in V6:
>> >  * Added "or later" versions of common license files eg GPL-2.0-or-later in meta/files/common-licenses.
>> >
>> > Changes in V5:
>> >  * Added "or later" versions of license mappings in meta/conf/licenses.conf
>> >
>> > Changes in V4:
>> >  * Renamed license files that were added in license mappings eg from GPL-2.0 to GPL-2.0-only
>> >
>> > Changes in V3:
>> >  * Added missing mappings to meta/conf/licenses.conf
>> >
>> > Changes in V2:
>> >  * Corrected the email subject line.
>> [...]
>> >   #MPL variations
>> >  SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
>> >  SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
>> > +SPDXLICENSEMAP[MPL-1.0] = "MPL-1.0"
>> >  SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
>> > +SPDXLICENSEMAP[MPL-1.1] = "MPL-1.1"
>> >  SPDXLICENSEMAP[MPLv2] = "MPL-2.0"
>> > +SPDXLICENSEMAP[MPL-2.0] = "MPL-2.0"
>> > +
>> >   #MIT variations
>> >  SPDXLICENSEMAP[MIT-X] = "MIT"
>> > @@ -48,33 +66,43 @@ SPDXLICENSEMAP[openssl] = "OpenSSL"
>> >  #PSF variations
>> >  SPDXLICENSEMAP[PSF] = "PSF-2.0"
>> >  SPDXLICENSEMAP[PSFv2] = "PSF-2.0"
>> > +SPDXLICENSEMAP[PSF-2.0] = "PSF-2.0"
>> >
>> >  #Python variations
>> >
>> >  SPDXLICENSEMAP[Python-2] = "Python-2.0"
>> > +SPDXLICENSEMAP[Python-2.0] = "Python-2.0"
>> >
>> >  #Apache variations
>> >  SPDXLICENSEMAP[Apachev2] = "Apache-2.0"
>> >  SPDXLICENSEMAP[Apache-2] = "Apache-2.0"
>> > +SPDXLICENSEMAP[Apache-2.0] = "Apache-2.0"
>> >
>> >  #Artistic variations
>> >  SPDXLICENSEMAP[Artisticv1] = "Artistic-1.0"
>> >  SPDXLICENSEMAP[Artistic-1] = "Artistic-1.0"
>> > +SPDXLICENSEMAP[Artistic-1.0] = "Artistic-1.0"
>> >   #Academic variations
>> >
>> >  SPDXLICENSEMAP[AFL-2] = "AFL-2.0"
>> > +SPDXLICENSEMAP[AFL-2.0] = "AFL-2.0"
>> >  SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
>> > +SPDXLICENSEMAP[AFL-1.2] = "AFL-1.2"
>> >  SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
>> > +SPDXLICENSEMAP[AFL-2.0] = "AFL-2.0"
>> >  SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
>> >
>> >  #CDDL variations
>> >  SPDXLICENSEMAP[CDDLv1] = "CDDL-1.0"
>> >  SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
>> > +SPDXLICENSEMAP[CDDL-1.0] = "CDDL-1.0"
>> >   #Other variations
>> >  SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
>> > +SPDXLICENSEMAP[EPL-1.0] = "EPL-1.0"
>> >
>> >
>>
>> >  #Silicon Graphics variations
>> >  SPDXLICENSEMAP[SGIv1] = "SGI-1"
>> > +SPDXLICENSEMAP[SGI-1] = "SGI-1"
>> >
>>
>> I removed the above pieces where the piece in [] is the same as the
>> value at the end. We don't need mappings where the two pieces are
>> identical. Everything else in the patch looked ok.
>>
>> I also realised that we have recipes which reference some of the names
>> which have been renamed in LIC_FILES_CHKSUM entries. The following
>> files look to be affected:
>>
>> meta/recipes-connectivity/connman/connman-conf.bb
>> meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
>> meta/recipes-core/systemd/systemd-serialgetty.bb
>> meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
>> meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>
>> I've queued a patch to fix these.
>>
>> Cheers,
>>
>> Richard
>>
>>
>
> 
>
