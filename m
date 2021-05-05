Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.8567.1620223436598130376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 07:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o+UzVD9X;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id z9so2707381lfu.8
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 07:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ddu0cmKQxoZOvYp4Rtgswqfe74f3gExO8hII7cdJ32U=;
        b=o+UzVD9XAC+i8InHk7bs0vuodTejT0KRV/FZhiQ2SNdwaRkCe0jU1l4G/3HMD7fH18
         HU4XLd3mVnBrI1TSG5dos6FnhJaVa3bsDPSscKtQQT6X5MYHJUzpYzCG75Rki+81Oq8d
         9PA7GXWkL3Wee2XnZXLNaJuO+KWVu++smAqOgjq4o3a8Rd+g5784ynV8DWjuThBhYSdu
         cDWHb4RV2gSCNQL14Ae8rbi94jIPcr4nSPz6xy+stzYhhY4+/blQ26pwoHaDLdKs7cLS
         LpKf5pLYQD7aviejjTaVEbfmRvkb0vPIpgX4jSWCbaH+HRPe5btGTSlrhqbkuLwgZw4z
         NNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ddu0cmKQxoZOvYp4Rtgswqfe74f3gExO8hII7cdJ32U=;
        b=datlNLrx+06gjd7JWcz2pxRGxj7pIYqUD902kXq8D38T94MCar3as22IYge12kaGgU
         zidVZAutI/lC42dGhRlG1q2DwJkARLKUkerXLmlfuaEJ7N6Bw/EaX0s7zuxmHoKWCeUg
         CVOIIlvBDmUXmxKJWanVvSlHDZmi3Ph9Z82lbJNkuqF2W44a0Bb2OJN7uAiOG6Z3Ii7l
         Tb64DPbu3OispPCTiDuzZ/QeOFAnCHYv4ACgx3lJntTjeGy4PSbRy/6FHN3lRpmQJJ4I
         q6+zeDYHSi9Du4WmDbYoMB4EbRB8lJ8QYLybRKLZzXUUHB5Xkf/oT1SSfBmyAb/v6T7/
         76Dw==
X-Gm-Message-State: AOAM531LbCAQ/8VWrSfhdam/iZcwpMo3bQCXRbttrwSAIHGXo/aLhoWw
	XQWREKDPwF6nfwogAF463aMz5JWDc9zUi31mnUE=
X-Google-Smtp-Source: ABdhPJw+B3StMQkGc4iMxoEqhh4TJY8mPrgodS5tTTTIziGdj9QI0EsU2pcMMRA99xUGVtqn6Arxt1HUkSAY3lW38xU=
X-Received: by 2002:a19:691c:: with SMTP id e28mr2874516lfc.434.1620223434493;
 Wed, 05 May 2021 07:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210429113046.172473-1-vinay.m.engg@gmail.com>
 <CANUMPcVfOziaV8Y3OW_XR3-Ysyjor6Ci8bA8y8kU2HYyvjSojQ@mail.gmail.com> <94f2fcf456e059128fc7b4804a52b4c21ee9dfd6.camel@linuxfoundation.org>
In-Reply-To: <94f2fcf456e059128fc7b4804a52b4c21ee9dfd6.camel@linuxfoundation.org>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Wed, 5 May 2021 19:33:42 +0530
Message-ID: <CANUMPcVgMD6YjxyNCOP_0wyKKwkG_F-15-E+3SWKCGy5AjjCbQ@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] Binutils: Fix CVE-2021-20197
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	vinay.kumar@blackfigtech.com, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi RIchard,

Will send patch for the Master branch.

Regards,
Vinay

On Wed, May 5, 2021 at 6:51 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-05-05 at 17:02 +0530, Vinay Kumar wrote:
> > Hi Steve,
> >
> > Any update on considering this patch in the "hardknott" branch ?
>
> Anuj is maintaining hardknott, not Steve. Also, doesn't this patch
> need to be applied to master first before we can backport it?
>
> Cheers,
>
> RIchard
>
