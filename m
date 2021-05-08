Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.5849.1620476650742461146
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 05:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IiiO/dz1;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id m37so9305811pgb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 08 May 2021 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vnTrQ8QrKEuhsEd8ICpDUNGOWZlekKCshEUW+V8AZps=;
        b=IiiO/dz1pOEP3ti7oMYHpH9KNsaBYpW4/f0cN/jPKnurkVT2ugZ++nGW9HPXsTAK+Q
         NCYBaOmIDRT+X3WgArMJwplI05/9TczpEYwNn/JOkbBPVbNTYsNjhtP5TXGYAcTOny1B
         d35P9WTCpn53gztv1bpHlRgR7ijcUwRV49gmzGDnBQQf/rA4srLbb4Mhd3sm6DxN4xHn
         hW3oKL9vqmF7t3ZA2OPhhJVcKIOCcMNqRUCijzdKrPOKCHSNWvCpyO2OlqpiXVMEpTIY
         2UjDeKvd2lqbv53WPiUqv1tHF9Ig/ZL2kKGgpKPz85gg6qKrAhlP0kaSl1L2ntDCP39w
         1dzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vnTrQ8QrKEuhsEd8ICpDUNGOWZlekKCshEUW+V8AZps=;
        b=WY9/0i2nBPxgsxCsEmn6z4z4g9nwDpm3YpxughVejHncsBajZBc7Do6hK8T20wbLHN
         oiIBk9ktJyu3rj8DjffySTRyN6SvxlglOi/JK0INOV/dIDrrrdqbxpnhjhUYUIivDXh7
         kGQEsTOT90f9bmwEpStkpsIGI1IY2sFq9ciK7HKIow9J2Hy6g0QljAay+XAbho/mL87d
         +UDuNtuJOsTIMXYmDUMaWOEHOFLgeAzc1n8/eu9zQ2rFN/SGMeT9tYWtbjafybLFDcjH
         IsYKWB1h1AT9V42cbdxfwVzfESSB3bD/1w83h0bl05KnXO/U1YTpai+Hr3w8Fj/Zs6ie
         kCKw==
X-Gm-Message-State: AOAM530OA0XQiEPD7BRNngqwrLuKLr9kRAx5aEWIm4K9rBqBhBJKAdyS
	7uTvubHWp483qJkkOnk+aJVojW9hpZXlOV8pKuA=
X-Google-Smtp-Source: ABdhPJzztofyGKqZsmOoijMzHNGkWamJKxcUK9zkQwB7jyUHVELRFbQXPQY+6RrRPjmoi0X8VtNeG/Rs/gBC5L+BVOM=
X-Received: by 2002:a62:3344:0:b029:28c:6f0f:cb90 with SMTP id
 z65-20020a6233440000b029028c6f0fcb90mr14963249pfz.58.1620476650097; Sat, 08
 May 2021 05:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210508121437.839561-1-schnitzeltony@gmail.com> <e53853537f647bff8284ead69df0cceda5f5d9d5.camel@linuxfoundation.org>
In-Reply-To: <e53853537f647bff8284ead69df0cceda5f5d9d5.camel@linuxfoundation.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 8 May 2021 14:23:58 +0200
Message-ID: <CALbNGRSrYWyJxBzUnMoh72=tJboAt6ReG+jNmDT1LDyZ5-xa0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: fix build with gcc11
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 8, 2021 at 2:18 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm guessing this only happens when qt is enabled? I was wondering
> why we hadn't seen this initially...
>
> Cheers,
>
> Richard
>
Wanted to write something like: 'What am I missing?' - now I know:
Have Qt enabled

Cheers

Andreas
