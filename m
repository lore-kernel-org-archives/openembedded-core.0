Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.11338.1593786323766316296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Dep80cq8;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.66, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f66.google.com with SMTP id e15so27916652edr.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 07:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=32Rw9ndkCibrWUAl7kM326D3R2TZbclq1iOq8AAqbhU=;
        b=Dep80cq8kHFFPbt+xyaCrobEhLPyhNbE+tcv4ewOLRglqib/PLngjWg0iheorPZq1V
         CsKU1T5/l5Mdd4F4teI8fab56bk67zAMAJQimFQE/ugRBWoxXZ+/g9B3scUG0wDzexQ2
         vo6w3O1ZyjLZ357Nqz35VkCUA/5YTm7ZmipBB7l/HERWKPI4m9wHaiTxT11BscY8ACNT
         TZbKuiWWjZ7X003w6H1UNGFT2cafzIejcbPImOh4q+j1hLyaxZAV+VtoF3Q2YSpqhJGc
         D/w+z60IOVUQVwyAVpOuN0mmT/4m4mpqyOokHPgJgN4qQAGVmL3/ch75H8NsJ8Jntqim
         fALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=32Rw9ndkCibrWUAl7kM326D3R2TZbclq1iOq8AAqbhU=;
        b=lHOv28da2HMW3/bnwcq6Nn9QY2cgXVdGhHUH/cADvP16QqF2AaIKZVRxVtZHmEUVnN
         xEsiCiXChZjTwR0r09PnhgNLYz66egQalM8f+dFTHePYqMHh2jbA3A259P7uu6oqr1kK
         W9+Uax7p/QHzMPhthIfFFmwEMh6sVUFPmHMGyl5fHTPg3B1ju0ZdaEylHFrqfFx3H34G
         uRYkfHyM5BbKmD1Sk0pLARTofRSIw8R1wQpOvcc7A1/gt621qb2VQOR1O677FJh0d9e/
         1Y4o2lmb107gTx0NSVLRBxgeXyrnBGePaGUtdQKQ2pD5E3amVWAbvPVEOtUMfwS/E6Eu
         uR6Q==
X-Gm-Message-State: AOAM530lAcafUrDnrdQKPxgrQhzwwNNxXpXgGCoSbpC+zXgd50KygBKd
	P8G/22/yunOmMgmxk+KuucFe9+8jS6GcYb53ld/fhw==
X-Google-Smtp-Source: ABdhPJyjoymIZC/daa2n+kdMjgDl4raBYYnkgoor+Bh1wo0KbHNTQKs3luw+cW8bHQr+FtCbyavdV20+SIR6VJTfh14=
X-Received: by 2002:aa7:c341:: with SMTP id j1mr42685692edr.197.1593786322277;
 Fri, 03 Jul 2020 07:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593420599.git.ahsan_hussain@mentor.com>
 <63967d5c25d4235fe0d80ec0399463e26d087faf.1593420599.git.ahsan_hussain@mentor.com>
 <43478b9e0d2e46da87bb23e97c124cbb@svr-ies-mbx-02.mgc.mentorg.com>
In-Reply-To: <43478b9e0d2e46da87bb23e97c124cbb@svr-ies-mbx-02.mgc.mentorg.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 3 Jul 2020 04:25:11 -1000
Message-ID: <CAOSpxdbGHn+hWwBbYhYSLKzs+OTXow4HH4rnEnmw4K5yWVqAFw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] u-boot: support merging .cfg files for UBOOT_CONFIG
To: Noor Ahsan <noor_ahsan@mentor.com>
Cc: "Hussain, Ahsan" <Ahsan_Hussain@mentor.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 3, 2020 at 3:39 AM Noor Ahsan <noor_ahsan@mentor.com> wrote:

> Can you merge this on Dunfell,

These two patches are in a group currently under test.  If all goes
well they should be in next week's pull request.

Steve

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org [mailto:openembedded-core@lists.openembedded.org] On Behalf Of Hussain, Ahsan
> Sent: Monday, June 29, 2020 2:16 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [dunfell][PATCH 1/2] u-boot: support merging .cfg files for UBOOT_CONFIG
>
> From: Ming Liu <ming.liu@toradex.com>
>
> U-boot recipe supports .cfg files in SRC_URI, but they would be merged to .config during do_configure only when UBOOT_MACHINE is set, we should also support merging .cfg files for UBOOT_CONFIG.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 80f828df52..8cfd25020c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -77,7 +77,23 @@ def find_cfgs(d):
>      return sources_list
>
>  do_configure () {
> -    if [ -z "${UBOOT_CONFIG}" ]; then
> +    if [ -n "${UBOOT_CONFIG}" ]; then
> +        unset i j
> +        for config in ${UBOOT_MACHINE}; do
> +            i=$(expr $i + 1);
> +            for type in ${UBOOT_CONFIG}; do
> +                j=$(expr $j + 1);
> +                if [ $j -eq $i ]; then
> +                    oe_runmake -C ${S} O=${B}/${config} ${config}
> +                    merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
> +                    oe_runmake -C ${S} O=${B}/${config} oldconfig
> +                fi
> +            done
> +            unset j
> +        done
> +        unset i
> +        DEVTOOL_DISABLE_MENUCONFIG=true
> +    else
>          if [ -n "${UBOOT_MACHINE}" ]; then
>              oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
>          else
> @@ -85,8 +101,6 @@ do_configure () {
>          fi
>          merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
>          cml1_do_configure
> -    else
> -        DEVTOOL_DISABLE_MENUCONFIG=true
>      fi
>  }
>
> @@ -114,7 +128,6 @@ do_compile () {
>                  j=$(expr $j + 1);
>                  if [ $j -eq $i ]
>                  then
> -                    oe_runmake -C ${S} O=${B}/${config} ${config}
>                      oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
>                      for binary in ${UBOOT_BINARIES}; do
>                          k=$(expr $k + 1);
> --
> 2.25.1
>
> 
