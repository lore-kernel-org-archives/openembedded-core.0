Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.390.1589904658750390017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 09:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M+/jYEFs;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id f83so15795582qke.13
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sMZEtPgXz2U+92FIu66WeCyGIPVHhrVVhKuXl/KUezw=;
        b=M+/jYEFspv45ral/6cHXTsI0QK0N/hS5100DfL8yDtcJkcoQMqaTo1mCZJvLseSUKk
         ajrEN110D9Ic8NaKE6OKATPphPdIVnVhgPNJdnxdiNB6wlHGsZUd3+S/BxJDQF/HjomE
         AXdHmm6f78w6ZTodxvOTYKV8HI+zyHB8qohJIoutRJPhp4orDUUx8sriTOe4pqHvOF5J
         MwYLZYcu15aAp/KAhoPlQkXpUltbZ6A7CG2eimUaKchxpv0pSaWAWy2g+WW+Cr1v+LXB
         mEhQMrZMS2quXKlS7xCFkAmWkLmLYITXK2vkU0wi/xPgf4rJK+jrmUlDyIaMx6TPQToh
         hpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sMZEtPgXz2U+92FIu66WeCyGIPVHhrVVhKuXl/KUezw=;
        b=i7BtQo2MZ44un69TvXbdessgVzxI+bCPZ5KmvUxAONaEBrt+nz69eXg07tsNpK9d8j
         UBtx+eWE7wHhXM7ek66GhgzB0/Z2VemQqbozw4ngD8MDpc7wDb5Rp8NR++C0lqu7eEwv
         zoYHKQlQkmVT2/B+L3wr2hu3xBgkrNkE8hHqQ2mYlrZOKhzZeHbNmEcXIkIW5P2L2wLc
         vbQiUf++zvc2y3XpMICkO+imao35x5vzDqmD1gKldNKBCWWG/l5QBjFjkMLbuEQnwQ+m
         er9zBVWud6wdz7s7tqFRCZ9YIZCbKrkML+LEGXNAc1uH354nTy+RhgWlXS57ByKtgMGT
         bHXw==
X-Gm-Message-State: AOAM533u4PoD4goka3bKoNS4deeQMgdrEzpZqRRF4HFpbDPyklVWJoCu
	XUpQhAAljRgEt6A2khqghBl0TVRtbRWeDAcQqShKSgwJ
X-Google-Smtp-Source: ABdhPJzTNcpixaTYU9tdq3aswurhCoWErukO3OAfVthJJvL4zyTYG4wpwbwpWkmRQLjgr/qrhQZ9oSEN1T23ZSyqnG4=
X-Received: by 2002:a37:a5d0:: with SMTP id o199mr70816qke.225.1589904657556;
 Tue, 19 May 2020 09:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200518082755.4198-1-marex@denx.de> <CAMKF1spr8k9Tju-8DBfbpdMpY20aDac_+jSeYGZv=_PShvQ9Ag@mail.gmail.com>
 <4a485107-4ae7-5157-b2c8-87ba6e929b6d@denx.de>
In-Reply-To: <4a485107-4ae7-5157-b2c8-87ba6e929b6d@denx.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 19 May 2020 09:10:31 -0700
Message-ID: <CAMKF1spJ-2D+c8q_8n2LumZMTN5HnVFYZRdTZQvSYg2dju0g1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libubootenv: Depend on zlib
To: Stefano Babic <sbabic@denx.de>
Cc: Marek Vasut <marex@denx.de>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 19, 2020 at 9:07 AM Stefano Babic <sbabic@denx.de> wrote:
>
> Hi Khem,
>
> On 19.05.20 17:56, Khem Raj wrote:
> > On Mon, May 18, 2020 at 1:28 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> The libubootenv depends on zlib as it calls at least crc32() from
> >> there and links against it. Add the DEPENDS entry.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Stefano Babic <sbabic@denx.de>
> >> ---
> >>  meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> >> index 3251d0f05b..fa90a12bf8 100644
> >> --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> >> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> >> @@ -1,5 +1,5 @@
> >>  SUMMARY = "U-Boot libraries and tools to access environment"
> >> -DEPENDS += "mtd-utils"
> >> +DEPENDS += "mtd-utils zlib"
> >>
>
> It can't, it is not an option. U-Boot requires a CRC-32 on the
> environment and zlib is always linked to the binaries fw_setenv /
> fw_printenv.
>

OK thanks

> Stefano
>
> >
> > should this be a packageconfig
> >
> >>  DESCRIPTION = "This package contains tools and libraries to read \
> >>  and modify U-Boot environment. \
> >> --
> >> 2.25.1
> >>
> >> 
>
>
> --
> =====================================================================
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
> =====================================================================
