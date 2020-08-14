Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.12084.1597381520067422061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bRe2kXIw;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 62so7390008qkj.7
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 22:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V47LHP0oBH2m2fVQWOiHgRM3Mz7LYjrretPjauYJQAk=;
        b=bRe2kXIwJ94b0HcNWUJRkKYKCkYLrzbktFURbB53eXMQLVbtnOaWCA44SLb52r3cen
         BmtNTXWf8tM3ETVLZ/jr0rsWPdloPwv5gXUijTbUQSiv8xu9agLUzizFInmhEuoSRBgs
         3yl7aNMG15a59SOdUHffpwaZwc5zs+C3SAtXvtjWpy7s9lGImappv/ZesTsK6WTo+Z6E
         D9gWrX3iZ4CCBMRrZH6R/XS1HWvcdktvOAUahT3iZMIdhcmk+JVsEYIOYcRnWYX6DZdL
         HI+tXJO4Oe8raBjEFQRFmuUQhVeauRQaNxtavX7Z9+9hxxYQrO9l+xuEZbVQdJiWy4fe
         oROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V47LHP0oBH2m2fVQWOiHgRM3Mz7LYjrretPjauYJQAk=;
        b=GfjJ5FTBpwAXPWf30VuJy4kYp0C4X4nR9v79nBuB0OfDELkUKcdomekHfU096grRl8
         o1NCJrk+WjNfA9k1tVaRG+Yp0Hv8LDjBLi2QL8I5t1pCqAvoE/sWphET9hFlL/P/yQ9f
         NUKb6w3UT34aQjMffpgpiGV7Nurv5H7P6VcQfqFDNRWTedOkc+eOel+yvASNlMk9KSTg
         rqhToq8rin9K3UzF6XD0dsp/N+ybFjuBm9+trKgPfK2Y33uwCA1PvaODblh/JCkOW64x
         Cvq7GkbDbzg2MWNcrTYj3JAiOxPikP5ttGGFCiLz4AEt0N5+zn7mNy9pe3oEokUEKhY6
         oSew==
X-Gm-Message-State: AOAM530kqHHNzXqyhoK7ZFKb+sPgpWE07q3U1/6mgA+Y5psxYKU5jU1n
	OIek72uypMZCR6XBlpF4B90j+62otSWIXepinI4=
X-Google-Smtp-Source: ABdhPJweJpH4y1yD8qgZqEOjx7zYJSwDFMSwotWAfuJXLbKd7gmH+eh8ObrpWvExqbx4yMh92RuCcJm10gCgHKiI/Xs=
X-Received: by 2002:a37:7081:: with SMTP id l123mr518730qkc.225.1597381519102;
 Thu, 13 Aug 2020 22:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200813102117.8726-1-liu.ming50@gmail.com> <20200813102117.8726-3-liu.ming50@gmail.com>
In-Reply-To: <20200813102117.8726-3-liu.ming50@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 13 Aug 2020 22:04:53 -0700
Message-ID: <CAMKF1sr7W8s1X_zZUR1DoKJHgcYxFD3kQ-PzyL2S1VCvFOD-QQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 2/2] libubootenv: uprev to v0.3
To: Ming Liu <liu.ming50@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Stefan Agner <stefan.agner@toradex.com>, sergio.prado@toradex.com, 
	Max Krummenacher <max.krummenacher@toradex.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 13, 2020 at 3:21 AM Ming Liu <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> Update libubootenv to the latest 0.3 release, which comprises the
> following commits:
>
> ```
> 1efed83 Increase max length for device name
> 6f4fc1c uboot_env: Use canonicalized pathname when reading device
> 23b3086 Fix bug introduced by commit 52a70114
> ed1a53e Dont store to device if no value changes
> 4a0a466 Merge pull request #7 from TomzBench/cmake-fix
> 6117831 Added Coverity badge
> 49372a1 Fix coverity #293496
> 69a6819 Fix coverity #293503 and #293507
> 258bf52 Fix coverity #293501
> aa52e61 Fix coverity #293505
> 52a7011 Fix coverity #293504 and #293506
> e822218 Fix coverity #293495 and #293497
> 23b305f Fix coverity #293499
> 25ef1f6 Add coverity setup for Travis
> 41b5188 fixed install for static target, fixed BUILD_DOC acknowledgement
> 86bd30a Restore ability to feed script file via stdin, using `-s -`.
> c91dcca ubi, write: fix invalid envsize ptr to UBI_IOCVOLUP
> f4b9cde Allow negative offsets
> 45bf92a Detect sector size if not found in config
> 9f59db6 uboot_env: remove unused variables
> 65d243e README: libubootenv is now in oe-core
> ba952d0 BUG: variable lists not released in close()
> 690f868 Variables are not removed when loading from file
> 9e3586a Make sure there's no file descriptor leakage in case of error
> 03647c4 Check config file defines a non-zero Sector size
> 3b2d4f1 Check environment size from fw_env.config
> 879c073 Do not hardcode path for install
> d9c639b libubootenv: add pkg-config support
> cc628ee libuboot: wrap libuboot in extern "C" for C++
> ```
>
> Also change it to be a git recipe, and add u-boot-default-env to
> RRECOMMENDS since /etc/u-boot-initial-env is being referred in
> libubootenv source.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../u-boot/{libubootenv_0.2.bb => libubootenv_git.bb}       | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_git.bb} (84%)
>
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_git.bb
> similarity index 84%
> rename from meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> rename to meta/recipes-bsp/u-boot/libubootenv_git.bb
> index 3820ba262e..59b9703d61 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_git.bb
> @@ -10,9 +10,9 @@ LICENSE = "LGPL-2.1"
>  LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
>  SECTION = "libs"
>
> -PV = "0.2+git${SRCPV}"
> +PV = "0.3+git${SRCPV}"
>  SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
> -SRCREV = "86bd30a14e153a18f670b25708795253d8736f0f"
> +SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
>
>  S = "${WORKDIR}/git"
>
> @@ -24,4 +24,6 @@ DEPENDS = "zlib"
>  PROVIDES += "u-boot-fw-utils"
>  RPROVIDES_${PN}-bin += "u-boot-fw-utils"
>
> +RRECOMMENDS_${PN}-bin_class-target += "u-boot-default-env"
> +

should this be
RRECOMMENDS_${PN}-bin_append_class-target = "u-boot-default-env"

I see

ERROR: Nothing RPROVIDES 'u-boot-default-env' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_git.bb
RDEPENDS on or otherwise requires it)


>  BBCLASSEXTEND = "native"
> --
> 2.28.0
>
> 
