Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.505.1590188727808169440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 16:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dor7Ipa0;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id z12so4344021uap.6
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 16:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Umhe52cfn4HOxt4QhN5m1iip1vQikpFT1HAemDIYyKQ=;
        b=dor7Ipa0YioPXEKH1R8BxJlcHhSeZ3FKxg6IDQ3r4LmjO+T/c9M07KeoOoPuy7o2T0
         6yZL/lj4NaYbEwyySoApFomjATfTlxyXWx69Ip6X/EubZ+mGeL3KOHLawEcS+xKJGL6a
         IeRraj84WVH8Xt7iFaSMNQx3QXmXEZkZ/SijV9+a8xOsHL5+Sdz1z6S0zFRK6rLACfvX
         datTTuN2l+wJJovEt3xsMO8LrtxbhPN40Qx7RHs4JZXIwu+S4eH40aCLbPk6KXXBHO1m
         pCUQtvwjlOaLY+UL5sQ4WYuXPcYkC1M8C8fE6mgbjykT0YrdMrS0v/tV7lBS0FSoV00E
         w7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Umhe52cfn4HOxt4QhN5m1iip1vQikpFT1HAemDIYyKQ=;
        b=n7oJ0r40BkriSXF04Z3UAp5drB8ZxZp9wF2SpBPOljV8SLsBtq40phrtRU62i2U4k7
         xPTRKR44plMJ+1lGgiFjvtIyw1w3a6vCnkhsi4TcgtLm9kaE+XDexwi5Gw9UxWpk4/jv
         7uNlumGrXnBU0ArF5fdxEg+pNyyp7EYe4OilCvtzPJSLQ/yzdt/TCfUm2rrNHnCbmm1q
         Zxncn4pRnH7ZD9fI/wYMfno+MyaWosjSk+00gy7oykHFju+PgOkzCNYNi3Gq8LKky7HT
         vZo6pTLIhd6IIWJ+rzIN999so2RsrBSD5iqhjrjrWBChh8Ih5RhAsuflvjtwn+kdNljX
         vP/Q==
X-Gm-Message-State: AOAM532I5H3MmvNN6Dn3NzRT2GTlbjMnH+ZWAZj7qKo2qRUM7EKSvt/S
	fNTAjKA1wHrrssEAHRlS3LbwNoL6bupSRpQ2hgQ=
X-Google-Smtp-Source: ABdhPJy3VpMu5hMIc0/Q5Tr1o9nvXxyxVuwuN9I/eWd7Xvhy8HN+w1miHeq+fc1SUxfm8L1os5aVi68P+416ypPvook=
X-Received: by 2002:ab0:d97:: with SMTP id i23mr12891802uak.106.1590188725475;
 Fri, 22 May 2020 16:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ86T=VDtvME1EVBfVOBW5U+84dkpD03ksHJdik15CSOG84Xgg@mail.gmail.com>
 <22249.1590187832432063263@lists.openembedded.org>
In-Reply-To: <22249.1590187832432063263@lists.openembedded.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 22 May 2020 16:05:13 -0700
Message-ID: <CAJ86T=XCcNzYqkjPxy7fe5eEyfkVHhbRa=GtAowZm_cM6RHF9Q@mail.gmail.com>
Subject: Re: [OE-core] gtest and gmock not added to SDK
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 22, 2020 at 3:50 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
> On Fri, May 22, 2020 at 03:33 PM, Andre McCurdy wrote:
> On Fri, May 22, 2020 at 5:48 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
>
> The gtest and gmock packages provided by googletest are not added to the SDK by default. I assume it is because the googletest main package is empty?
>
> Are you including googletest in the image used to create the SDK or
> gmock and gtest?
>
> It looks like gmock and gtest are only mentioned in the googletest
> recipe as PROVIDES, so they are aliases for build time dependencies
> only. For run time dependencies you should use googletest.
>
> Right, I should have mentioned that. I have a DEPENDS on gtest for a package in my image. To fix the SDK, I added an RDEPENDS on googletest from the same package.

What you have done is probably the best solution. You could
alternatively add googletest to the image.
