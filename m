Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web10.3277.1605750293647817918
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 17:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rZrQh8pL;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: armccurdy@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id o73so978674vka.5
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 17:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAIBaSnISAFqKXZsHxslscyU8kLqHFHpQ+PQpkKnmY4=;
        b=rZrQh8pLwzHAhjjI6ExWagDEKDDgykGVU12OeRqZc19mIA8thHtBKbc18CmPNPS0Aa
         F6gXfN0j8ihNHrB5zlCMd4zVhADfVX8by3PWflOd1h0Kz377OPaNfxO2LBtRaROuzi61
         WEst52W2IIRuGXJ2EhwR7N7tF9SiGuWi38gTtzJKeD0MXNvZ/mZqLTWPvnenMoW7LrTY
         rm+wiCp5g8oUmrT+5+ONMRO97ZlhKNjBD4nuTwAeypcB2J6Q6ZBQHQr8OUVo2FZhjICG
         zEV/nPdo0pJ1Plpw4Gw+RBhxb+SL1ElJAOXkLimklzPa302SozLHXUIlgZaFpcD7gmYp
         BY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAIBaSnISAFqKXZsHxslscyU8kLqHFHpQ+PQpkKnmY4=;
        b=gQ/Jsztd53eUiSLDKRnYOeAuyFyN6NZr1pJGvWhzXzc7gOrQ5iuPVPN8Jfab0rCp+q
         vCeuMUbVVqZl8R8NVJKXiQ8s05UIqiof9oXvtizSd6yRegtfDrYFIB0DW2n3Uj3YZhDv
         GgGCPkPH5CaPCR5oeA5zx1i5+qeXn2VvCD5/uieQOIFQftzZB9VBGzpatYz5VxbL7rzE
         JTSJ9gsT2u6Ir5Hwp8mDVLo1ZOAQXbjMJELMlndlxoVtx8wbaHa7yNtutZNWMPnbX7oW
         Zr5i9VhTFDvO/04FSpU/u4qm2ERH7Sz2v7rWDmx19aaAhqdk7Oyg9xMnp1ri5k5FrsvC
         /5XA==
X-Gm-Message-State: AOAM533LUbUGV/PZtpd95A36BRXovGSm/IFyUJEK//jupm01tzdJZxlp
	sRopF3m8lTjCYCkezhJehwoz8N3psQc4CK+zquI=
X-Google-Smtp-Source: ABdhPJzh0YHkdlgS5WExd5wMZIC305iNIf+OwSuDvDx64B9/mKeDkRWwfj/WkDmE66fy9X1JHBnYcs4/ob5YDIN+Frg=
X-Received: by 2002:a1f:1b14:: with SMTP id b20mr6635405vkb.7.1605750292763;
 Wed, 18 Nov 2020 17:44:52 -0800 (PST)
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
 <34d371b7-8552-0dec-d322-7ea1932f7bed@windriver.com>
In-Reply-To: <34d371b7-8552-0dec-d322-7ea1932f7bed@windriver.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 18 Nov 2020 17:44:42 -0800
Message-ID: <CAJ86T=X9+Eeyg5-a-4p4PviHFw0e-cq1=yTQoJV1m5LhUd3_cg@mail.gmail.com>
Subject: Re: [OE-core] YPBZ 14125: busybox wget: where to add openssl-bin dependency?
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Shachar Menashe <shachar@vdoo.com>, "steve@sakoman.com" <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2020 at 2:30 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Hi Shachar,
>
> On 2020-11-18 1:49 p.m., Shachar Menashe wrote:
> > About the busybox patch, I realized that Dunfell doesn't come with the "openssl" binary built-in (only the library) but this fix will actually requires having the openssl binary (busybox invokes the openssl binary directly)
> > Do you think it's reasonable to add it? The library is already getting built, so I don't think it's a huge deal to add the binary as well
>
> Hopefully someone opinionated about busybox will make a suggestion
> on how to resolve this bug.

The meaning of the busybox FEATURE_WGET_HTTPS configure option is made
quite clear in the associated help message. Claiming it's a "severe
CVE" is not correct - it's working as designed.

  https://git.busybox.net/busybox/tree/networking/wget.c#n49

The behaviour may not be suitable for everyone, but it's the default
config we've used for a long time. Users who need a wget which checks
certificates should think about installing the full featured version
(or try curl if wget's GPLv3 license isn't acceptable).
