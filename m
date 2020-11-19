Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web12.14630.1605815092185970319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 11:44:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rv2tuav3;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id h185so3731278vsc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 11:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UeXUIN9X3GQr3GCVabD6oQgmaxFYlriqrzIE3G+Pvd0=;
        b=Rv2tuav3F2FT7KY4xfYSlN6p4F3Q8qeoAWc/GhbN+zGjdvSJdExz89PV/6SA9+FoFw
         kHRwwFVd+2Hyu22socZpPu9cXYZVZrpd6tfX0g47zqAcXrScRm6QnwOkCgvgahUR/YIF
         uW5wHX4Qjxch9xTjs49AyoMOLBiDK0eiSQal8WCrxjDUNfdcmdfS1aC7SP5T/ATIg6Zo
         34/e9DMXO/hOvROsZfcEqPu4XUYocJYgUoBr7tUgVpZKWKugW6TtueusbCpKJCg+jiGi
         LAGYDbYnA1AMFSR5LJXFtVrwDSdSTCH4hU01jAEuDEVGbG0T6a/Gho8Fl9Yl292fq8KF
         yLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UeXUIN9X3GQr3GCVabD6oQgmaxFYlriqrzIE3G+Pvd0=;
        b=CYCe+nErm880Gcb7C3aYFkuVm29EUVHQbG66Vy8DWfrH5rREF2hUB1jzD0DE7dir0i
         Rf9rlQhuCKraFREhTMVwkyMdcA0FFVPF6H3KCdqJgbtat322X9kHr2WDkBg2M1bF3lx1
         qnNKNNeWsXQ+H6Z217rTLPyBKg2HFFEbOX2thBxzdPKA25Smsma5ww1SSmKQef3gBDns
         WsR530yWChB8P5n9DPCsx1ApCcfxUmQFo4e5gycn7IVHvCgmnWBkqHdOwBcdfX4MsRcw
         sbBiPiBe8TYNpS+JqpXS+YwBGI7w374r+9e978fYoOEQJgtE6Yo9HCN85baVnGlWTG5G
         5ddw==
X-Gm-Message-State: AOAM530N07/jZ+it7v4DtAHj1pCkXwBgrPMmZt8OkH1OFY9QxkckhKi+
	WANR5JDnO/pV4k08qQ+YhYIS/ORPN6Z976xSfQU=
X-Google-Smtp-Source: ABdhPJwEBtB5w8bLaMLJf7Ro1la01GCTIL+oMzAJkQNeXYVWsq60aBcNvD9VM86MBeVjRIIsd2Ox+ay0qNMD1W0i2Lo=
X-Received: by 2002:a67:2d84:: with SMTP id t126mr10830494vst.0.1605815091276;
 Thu, 19 Nov 2020 11:44:51 -0800 (PST)
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
In-Reply-To: <AM0PR08MB3617AF5C09483DC0B5A2996BC5E00@AM0PR08MB3617.eurprd08.prod.outlook.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 19 Nov 2020 11:44:42 -0800
Message-ID: <CAJ86T=UPJZyjYmZ6u4nnCXrqRmyQWGe7pc=vGoaF7wkLkvWTCA@mail.gmail.com>
Subject: Re: [OE-core] YPBZ 14125: busybox wget: where to add openssl-bin dependency?
To: Shachar Menashe <shachar@vdoo.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, "steve@sakoman.com" <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 10:46 PM Shachar Menashe <shachar@vdoo.com> wrote:
>
> Hi Andre,
> The way I see it - even if something is declared, it does not mean it is =
reasonable or even expected
> I mean - do you earnestly believe that every Yocto user (or busybox wget =
user for that matter) read the help text associated with the config option =
that their tool is built with?

No, but I expect them to notice the "TLS certificate validation not
implemented" warning which Busybox wget outputs.

> From my perspective, they could not care less, they have the prebuilt bin=
ary and they just use it and expect it to work, they have no idea what conf=
ig flags were used when building the tool...
> In the year 2020 it is expected that tools that come pre-shipped with you=
r OS aren't exposed to na=C3=AFve attacks such as SSL MitM, that can be exe=
cuted by automated tooling

Trying to be secure by default is a good argument. The solution is
probably just to disable FEATURE_WGET_HTTPS though. Users who
understand the limitations can enable it manually. Users who want to
validate certificates should be guided towards using curl. Having
Busybox wget call out to the openssl command line tool is certainly a
creative solution, but feels too much like a hack to want to enable by
default.

> I think I can back this up with the fact that busybox maintainers chose t=
o integrate our patch that fixes the CVE, and not dismiss it
>
> Note that the GNU version of wget is not exposed to this attack, so this =
furthers the confusion
>
> If there are severe technical issues with shipping the openssl executable=
 with Yocto, then we should definitely think about it, but I think this end=
eavor is worthwhile
>
> -----Original Message-----
> From: Andre McCurdy <armccurdy@gmail.com>
> Sent: Thursday, November 19, 2020 3:45 AM
> To: Randy MacLeod <randy.macleod@windriver.com>
> Cc: Shachar Menashe <shachar@vdoo.com>; steve@sakoman.com; Patches and di=
scussions about the oe-core layer <openembedded-core@lists.openembedded.org=
>
> Subject: Re: [OE-core] YPBZ 14125: busybox wget: where to add openssl-bin=
 dependency?
>
> [External email: Use caution with links and attachments]
>
> On Wed, Nov 18, 2020 at 2:30 PM Randy MacLeod <randy.macleod@windriver.co=
m> wrote:
> >
> > Hi Shachar,
> >
> > On 2020-11-18 1:49 p.m., Shachar Menashe wrote:
> > > About the busybox patch, I realized that Dunfell doesn't come with
> > > the "openssl" binary built-in (only the library) but this fix will
> > > actually requires having the openssl binary (busybox invokes the
> > > openssl binary directly) Do you think it's reasonable to add it? The
> > > library is already getting built, so I don't think it's a huge deal
> > > to add the binary as well
> >
> > Hopefully someone opinionated about busybox will make a suggestion on
> > how to resolve this bug.
>
> The meaning of the busybox FEATURE_WGET_HTTPS configure option is made qu=
ite clear in the associated help message. Claiming it's a "severe CVE" is n=
ot correct - it's working as designed.
>
>   https://git.busybox.net/busybox/tree/networking/wget.c#n49
>
> The behaviour may not be suitable for everyone, but it's the default conf=
ig we've used for a long time. Users who need a wget which checks certifica=
tes should think about installing the full featured version (or try curl if=
 wget's GPLv3 license isn't acceptable).
