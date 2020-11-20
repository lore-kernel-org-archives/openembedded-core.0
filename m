Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web08.22871.1605864038579389771
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 01:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WDPo1jxL;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id x11so4644793vsx.12
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 01:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9CUkRVVrsVuNiDGbFli+9zJit+W+K0zoDLO+WU3m7Uw=;
        b=WDPo1jxLWNCH/0zQU6FDINmJQNcrjoiP5G/DWKHXw8kvy11NlrD07FeDLX+0mHnYdO
         nck8W8+8OcbMbZ+qtEIiTBx1sf5sptpzctgrYT/CmaPnPUj1pmvYfgDsLY1gYFcFXVN7
         ppRFrr5az7Xa0r+d9I/fQVHgo6V8uxgws5oDrX3AsKAA1ITlufIjA/VaaDhvhCN9KiOj
         74Juyry4fx15Iy7/jhwMXq3JQ7XBxC0fnXJT+NMdxFM+gXYtrXeTquFu4fhFfOUr9A1r
         6gezKNPc1IA6XjdQBTOKs6P4ESfBgI4NGVNoylyfkn9zb1su3vr0he2PTNhkEeIUAQ/0
         ac0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9CUkRVVrsVuNiDGbFli+9zJit+W+K0zoDLO+WU3m7Uw=;
        b=DsuyffdJfeg/l9L0GlFgeypROuVNMdulPjVZcsc7kqsaXUfEQ687x7sW7J/FEpHAdb
         x1LziZl5fLxB7Fw2DPiPlyWwLyfzsON1G3Lb5uNaAv3f1xDyFc31BEZBoLsyXUk04Box
         ban5E207LvQpNM5o4v/q1pzJwRsFNRPY/J7Y69aApG01Q9qtNaswb2XorSSIDN+tHGut
         hZa2Mbpq6uWWG118+phDqTTCKIHQWUwaJn1oEZtEd7TsIt8VprAfRuhsxaLmMlQO65ta
         4MbDa4Km8fBgEtkuqedClIJZUyZ4sGYAKFLrHBM3P8RKFakArO+TSFvUw8ynA2UpchuM
         7krA==
X-Gm-Message-State: AOAM530IXu0NMCbyF4SzpmlwA0FOU4HGZn5Q+eA39n5gAC72Z9pP6/hx
	YJZDu6N0sUDPpKhzdallsoV8WxtURbsR768qtNc=
X-Google-Smtp-Source: ABdhPJw34F9r+s++krfgb6eca0qFaWk5239mzYLtENPV7Cx7qAjNm/nPxay8iGzvbypZMmrfXLJH9mLlF7VSUZ+2fFE=
X-Received: by 2002:a67:2d84:: with SMTP id t126mr12462927vst.0.1605864037599;
 Fri, 20 Nov 2020 01:20:37 -0800 (PST)
MIME-Version: 1.0
References: <AM7PR08MB5335A3F67A86A99D40F14979C13E0@AM7PR08MB5335.eurprd08.prod.outlook.com>
 <BY5PR11MB4167CE3E6868CDF84B723417EA140@BY5PR11MB4167.namprd11.prod.outlook.com>
 <AM7PR08MB5335FD6327DC339AD370110AC1140@AM7PR08MB5335.eurprd08.prod.outlook.com>
 <BY5PR11MB4167A2717FBFEE9C8838535BEA140@BY5PR11MB4167.namprd11.prod.outlook.com>
 <AM7PR08MB53350F08EB85F0EC65DC7798C1140@AM7PR08MB5335.eurprd08.prod.outlook.com>
 <40be87cf-d621-9382-494e-5d8f7593aded@windriver.com> <AM7PR08MB533582E4480B60D11B6DB3A9C1100@AM7PR08MB5335.eurprd08.prod.outlook.com>
 <efebc5dc-c5d4-6279-50f8-629877346691@windriver.com> <AM7PR08MB5335CCB3F970B45A09C4C416C1E20@AM7PR08MB5335.eurprd08.prod.outlook.com>
 <471a4868-05a9-5851-d52e-b145011721c5@windriver.com> <AM0PR08MB3617FDDCEE0A4B7988EE9986C5E20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <d5af9fd5-4395-df8e-9ab0-a0dff0ce80e2@windriver.com> <AM0PR08MB3617976199B253B75D1A7D30C5E10@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <34d371b7-8552-0dec-d322-7ea1932f7bed@windriver.com> <CAJ86T=X9+Eeyg5-a-4p4PviHFw0e-cq1=yTQoJV1m5LhUd3_cg@mail.gmail.com>
 <AM0PR08MB3617AF5C09483DC0B5A2996BC5E00@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <CAJ86T=UPJZyjYmZ6u4nnCXrqRmyQWGe7pc=vGoaF7wkLkvWTCA@mail.gmail.com> <AM0PR08MB3617B7B1D8683535C87D39A1C5FF0@AM0PR08MB3617.eurprd08.prod.outlook.com>
In-Reply-To: <AM0PR08MB3617B7B1D8683535C87D39A1C5FF0@AM0PR08MB3617.eurprd08.prod.outlook.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 20 Nov 2020 01:20:29 -0800
Message-ID: <CAJ86T=XOVtdS9mBKh5rPNUia9EK_x8o6hdF3BQ_K_V81Y2zfCw@mail.gmail.com>
Subject: Re: [OE-core] YPBZ 14125: busybox wget: where to add openssl-bin dependency?
To: Shachar Menashe <shachar@vdoo.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, "steve@sakoman.com" <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 11:11 PM Shachar Menashe <shachar@vdoo.com> wrote:
>
> I agree that replacing busybox wget with another tool to handle HTTPS is =
a cleaner solution, I am just a bit worried about backward compatibility...

Breaking backwards compatibility is not generally a big concern for OE
so long as any use cases within oe-core and its test suite are updated
and continue to work.

> If someone used Yocto and relied on HTTPS download functionality (and see=
ing there are no other suitable tools such as curl that are already supplie=
d with Yocto) then we are breaking that use case

oe-core provides both curl and wget, so alternatives to Busybox wget
are certainly available.

> So the question is whether we break compatibility by removing FEATURE_WGE=
T_HTTPS, or retaining compatibility by including the openssl binary (or doi=
ng nothing and retaining the security issue, which personally I think is pr=
oblematic)
>
> -----Original Message-----
> From: Andre McCurdy <armccurdy@gmail.com>
> Sent: Thursday, November 19, 2020 9:45 PM
> To: Shachar Menashe <shachar@vdoo.com>
> Cc: Randy MacLeod <randy.macleod@windriver.com>; steve@sakoman.com; Patch=
es and discussions about the oe-core layer <openembedded-core@lists.openemb=
edded.org>
> Subject: Re: [OE-core] YPBZ 14125: busybox wget: where to add openssl-bin=
 dependency?
>
> [External email: Use caution with links and attachments]
>
> On Wed, Nov 18, 2020 at 10:46 PM Shachar Menashe <shachar@vdoo.com> wrote=
:
> >
> > Hi Andre,
> > The way I see it - even if something is declared, it does not mean it
> > is reasonable or even expected I mean - do you earnestly believe that e=
very Yocto user (or busybox wget user for that matter) read the help text a=
ssociated with the config option that their tool is built with?
>
> No, but I expect them to notice the "TLS certificate validation not imple=
mented" warning which Busybox wget outputs.
>
> > From my perspective, they could not care less, they have the prebuilt b=
inary and they just use it and expect it to work, they have no idea what co=
nfig flags were used when building the tool...
> > In the year 2020 it is expected that tools that come pre-shipped with
> > your OS aren't exposed to na=C3=AFve attacks such as SSL MitM, that can=
 be
> > executed by automated tooling
>
> Trying to be secure by default is a good argument. The solution is probab=
ly just to disable FEATURE_WGET_HTTPS though. Users who understand the limi=
tations can enable it manually. Users who want to validate certificates sho=
uld be guided towards using curl. Having Busybox wget call out to the opens=
sl command line tool is certainly a creative solution, but feels too much l=
ike a hack to want to enable by default.
>
> > I think I can back this up with the fact that busybox maintainers
> > chose to integrate our patch that fixes the CVE, and not dismiss it
> >
> > Note that the GNU version of wget is not exposed to this attack, so
> > this furthers the confusion
> >
> > If there are severe technical issues with shipping the openssl
> > executable with Yocto, then we should definitely think about it, but I
> > think this endeavor is worthwhile
> >
> > -----Original Message-----
> > From: Andre McCurdy <armccurdy@gmail.com>
> > Sent: Thursday, November 19, 2020 3:45 AM
> > To: Randy MacLeod <randy.macleod@windriver.com>
> > Cc: Shachar Menashe <shachar@vdoo.com>; steve@sakoman.com; Patches and
> > discussions about the oe-core layer
> > <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] YPBZ 14125: busybox wget: where to add openssl-b=
in dependency?
> >
> > [External email: Use caution with links and attachments]
> >
> > On Wed, Nov 18, 2020 at 2:30 PM Randy MacLeod <randy.macleod@windriver.=
com> wrote:
> > >
> > > Hi Shachar,
> > >
> > > On 2020-11-18 1:49 p.m., Shachar Menashe wrote:
> > > > About the busybox patch, I realized that Dunfell doesn't come with
> > > > the "openssl" binary built-in (only the library) but this fix will
> > > > actually requires having the openssl binary (busybox invokes the
> > > > openssl binary directly) Do you think it's reasonable to add it?
> > > > The library is already getting built, so I don't think it's a huge
> > > > deal to add the binary as well
> > >
> > > Hopefully someone opinionated about busybox will make a suggestion
> > > on how to resolve this bug.
> >
> > The meaning of the busybox FEATURE_WGET_HTTPS configure option is made =
quite clear in the associated help message. Claiming it's a "severe CVE" is=
 not correct - it's working as designed.
> >
> >   https://git.busybox.net/busybox/tree/networking/wget.c#n49
> >
> > The behaviour may not be suitable for everyone, but it's the default co=
nfig we've used for a long time. Users who need a wget which checks certifi=
cates should think about installing the full featured version (or try curl =
if wget's GPLv3 license isn't acceptable).
