Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.4546.1594326996107333515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 13:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pE2UDz3j;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id z2so3743100wrp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 13:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0wEPy6Tu6HxKn09huX//S0ke7oCVEBGL47YdvfMoN6M=;
        b=pE2UDz3jnCQRXibjcMXSG/4dfMfG/4HI5N/qdPosoNscHhfNAVQV+THOqNhAYmCjbH
         eY97ZOXP4a3kg0cvWx4jSWLapwZJDR7eZxXCjgw6u6EU1aDgkVHzFF7CpvDrW2VZPeyo
         dIJSdNwfNfLrYEg4Bx65NKOfn/DVJBrU0g06x3mpPqID5ZEv3SG7f81OXsB0fRnsn4tV
         sPsPf9eDANS5f2BfDA/XtsOoa7tC+7Mz8Ha6EtJWA73MRYKOGb/KAqMTDg3PQvL0Ex+q
         b0YMPYiRO6oxNr2uy0KtzTuDotbx5WW13Ww6ccRBEayW4JUsOiFIdkCEndGtSKBbm8Pk
         o2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0wEPy6Tu6HxKn09huX//S0ke7oCVEBGL47YdvfMoN6M=;
        b=JwRWQcP17/E2AgH70n35jf59gL3EX4lTDTeT0xgcRSm7olNPvmAanakOqCBmGXAunl
         ggF19f/4ncKh1dxFK8mJrgPTtow9A5KcD+JNrJHWF8cMbgc2Coup98FmKeruhEcWAwZX
         o5B33j9RgKiEEyyg+2bbAJVun0XembGp10kyLU0S+rhYryDca7kOcAwEiElKD5gie5jZ
         w6Rp+Er1JG2rhBwnL/Iov2TBgxJGgs8+4RpgPEXnj1hApmQiZPfPODTcKj+/Hwd2mysH
         08XPKhNqkE5WD+2aKeshC16QLxiGWXzIw7qhdrlRT5LzNUoslT56Lq+vhOxZ9RKc43zr
         2ULg==
X-Gm-Message-State: AOAM5302W7rDg/BU1JtiG2T9LzAuCQrDZsaun2SmOCblch6PZTicPTDt
	kuB6hgE1edEKNqxC2Qf31Atkr7xMlt6abqBiCjo=
X-Google-Smtp-Source: ABdhPJy+klWbFHUMyGgF/U3nuajBNjpalpSnei/6NgWzqUHrGc5YOCfKnDUyQAA1YceMA2XJLtHdt8B3IyYAAYOgWb0=
X-Received: by 2002:a5d:6987:: with SMTP id g7mr64277879wru.79.1594326994608;
 Thu, 09 Jul 2020 13:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200709192208.137165-1-charles.davies@whitetree.xyz>
In-Reply-To: <20200709192208.137165-1-charles.davies@whitetree.xyz>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 9 Jul 2020 10:36:21 -1000
Message-ID: <CAGDS+nkfm2XnC4cVnnsHYnRSqDfMjvx7wgZfZqUFOzxREJwG6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] u-boot: fix bug to allow use of *.cfg
To: Charlie Davies <charles.davies@whitetree.xyz>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Charlie,

This same code (and bug) is present in the master branch, so you would
need to submit your patch there first before I can take it for
dunfell.  We have a strict "master first" policy so that we don't fix
things in stable branches that haven't been fixed in master first.

Steve


On Thu, Jul 9, 2020 at 9:22 AM Charlie Davies
<charles.davies@whitetree.xyz> wrote:
>
> Fixed a bug in u-boot.inc where logic to apply *.cfg
> files never runs.
>
> U-boot should allow *.cfg files to be specified in recipe's
> SRC_URI.
>
> Charlie Davies (1):
>   u-boot: fix condition to allow use of *.cfg
>
>  meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --
> 2.27.0
>
> 
