Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.8685.1630073645607571036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 07:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u20a53Iw;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id x11so14292841ejv.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P2U/pYgOsuj7m61foAhqV3BfwizElf7JV3PqgnGwVVo=;
        b=u20a53IwlY070n4EH5dlHPSG49ZrxqrGnuMrbdkvcHHRF8oUYHUAl8LYqSxvHUXbQI
         3YEdCQhjmh+Q3J4kc05HI2RwZPckEQOqIE3IKSep+2A/yTVQ1g/80aG4ZkxhqCREGzQi
         WWESI9SZgoJrANqQN1c3Kfu4XeWAb/tPYjABCf4sQ/cYVSwK6+55An8LQXfmglFs4dFz
         KZ2+h8UcKKuApS4KxSoTCDXLkUhPlLPAdRDtSfn4EkPqMWzW4516IAcLttq66lmmBncj
         KcWJXHBMwgKgWOa213QzSIWrnV2mpIGZrbOCNSa4WPBgN7Bwv4mUC2JiqFu/sh3m22NF
         TYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P2U/pYgOsuj7m61foAhqV3BfwizElf7JV3PqgnGwVVo=;
        b=Hn5VMGkMBTjkeoVY7Y/B5MJjHM1QcIYadB0mPZ/QIeNIwiw8aRxFElh5fjuus1tSTf
         6npu4Zpqc/3HS9sl1B/lx2k+AG0TaNVfvh8Cqtpo6pK7uRMq9XY680rXWE9xODyuzX2V
         7hyRDdQwTXGiYP18/jtHc/iymcNyoukB211dOgkxkLfKWPqwe/jyTNOnrTltSK/TKXAs
         lmyoS/bQ+4jomolo04k18zvL5uDihYEjwWzw5yS0hTQqLRr3C9AGdsCEusp5RAmTEn7I
         M8pQVv2zfc1dZNg+te3mL/m8f6kHBJq+hPvxQjArrR1YRTWMgStrZLzs2nL9p6WZffQn
         1iIw==
X-Gm-Message-State: AOAM532ZZQv5UgBoFGz/5Q8I0qEkdu6XJKbP634xum9yMyIQnUeodP2U
	P27yuDMm2gASX6BbTH741PqjiK0w9wzMS5L6nhI=
X-Google-Smtp-Source: ABdhPJxX6Yk9pLY5xq8AehCdtYdY7Q+NsE1BkKc/0eRg+UImkJH2v6Ao//XE/sb9RlYt/7AUObpSeM4PfYMzFoxo8SY=
X-Received: by 2002:a17:906:a3c3:: with SMTP id ca3mr10190687ejb.337.1630073643593;
 Fri, 27 Aug 2021 07:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210827135140.22421-1-jdmason@kudzu.us>
In-Reply-To: <20210827135140.22421-1-jdmason@kudzu.us>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Fri, 27 Aug 2021 16:13:51 +0200
Message-ID: <CAAQYJAtAiT2TK+AMCTs9UqVECy4LkUJUNOBXozv-uO4kG4nEjQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] tune-*: Use more specific DEFAULTTUNE
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 3:51 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> These files are using a more generic DEFAULTTUNE in their targeted tune
> file.  This is contrary to what is being done in other tune files, and
> this changes them to match.  It is still possible to use the more
> generic DEFAULTTUNE in a machine's config file by simply specifying it.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/conf/machine/include/arm/armv4/tune-arm920t.inc       | 2 +-
>  meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc      | 2 +-
>  meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc | 2 +-
>  meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc    | 2 +-
>  meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc    | 2 +-
>  meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc     | 2 +-
>  meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc     | 2 +-
>  meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc     | 2 +-
>  meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc     | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/armv4/tune-arm920t.inc b/meta/conf/machine/include/arm/armv4/tune-arm920t.inc
> index 8a615792dfb1..1b1cbdb5a7d1 100644
> --- a/meta/conf/machine/include/arm/armv4/tune-arm920t.inc
> +++ b/meta/conf/machine/include/arm/armv4/tune-arm920t.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv4t"
> +DEFAULTTUNE ?= "arm920t"
>
>  require conf/machine/include/arm/arch-armv4.inc
>
> diff --git a/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc b/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
> index 5ab286b5767e..78b890b43c3e 100644
> --- a/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
> +++ b/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv4t"
> +DEFAULTTUNE ?= "arm9tdmi"
>
>  require conf/machine/include/arm/arch-armv4.inc
>
> diff --git a/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc b/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
> index 6f5033bbc12a..38ea9b7dd596 100644
> --- a/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
> +++ b/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv4"
> +DEFAULTTUNE ?= "strongarm"
>
>  require conf/machine/include/arm/arch-armv4.inc
>
> diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
> index 66bc124dc0bc..e827afb2a08f 100644
> --- a/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
> +++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7vethf-neon"
> +DEFAULTTUNE ?= "cortexa15thf-neon"
>
>  require conf/machine/include/arm/arch-armv7ve.inc
>
> diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
> index 324673d44007..3ad00b16d81f 100644
> --- a/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
> +++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7vethf-neon"
> +DEFAULTTUNE ?= "cortexa17thf-neon"
>
>  require conf/machine/include/arm/arch-armv7ve.inc
>
> diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
> index 817eb166d6ed..0de5aadaaa3f 100644
> --- a/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
> +++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7athf-neon"
> +DEFAULTTUNE ?= "cortexa5thf-neon"
>
>  require conf/machine/include/arm/arch-armv7a.inc
>
> diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
> index 5384369b5994..1ada527d8b32 100644
> --- a/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
> +++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7vethf-neon"
> +DEFAULTTUNE ?= "cortexa7thf-neon"
>
>  require conf/machine/include/arm/arch-armv7ve.inc
>
> diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
> index e27002a29a61..952302afa210 100644
> --- a/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7athf-neon"
> +DEFAULTTUNE ?= "cortexa8thf-neon"
>
>  require conf/machine/include/arm/arch-armv7a.inc
>
> diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
> index d046a11a513a..4b4a52884d90 100644
> --- a/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
> +++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
> @@ -1,4 +1,4 @@
> -DEFAULTTUNE ?= "armv7athf-neon"
> +DEFAULTTUNE ?= "cortexa9thf-neon"
>
>  require conf/machine/include/arm/arch-armv7a.inc
>
> --
> 2.20.1
>
>
> 
>
Agreed, at least for the older machines do enable optimized builds.

I tried in the past w/o luck but it is really a corner-case:
https://patchwork.openembedded.org/patch/153752/
https://patchwork.openembedded.org/patch/153723/

Cheers
Andrea
