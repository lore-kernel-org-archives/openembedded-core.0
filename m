Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.9589.1592580533900149961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 08:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rk6gd7I0;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.66, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f66.google.com with SMTP id e12so7954402eds.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 08:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6UKoEP9fegeZzwyZ+LM1N+iR1sXOGkc9h/g8W9cZd8g=;
        b=rk6gd7I0Qzk6Oyw4GTBNuhHApg7JiwuwugJnEANdLAO7pUEZcgxAcVmbJHaMl5D/dp
         FEA+9ci93nkMgsB2u3LJbyFva9Yrvhb5qyDpp5tylLNQgxVAe/nZFCNyjm8IrPb8dXNk
         kcN+/OXMpBOQS+pvZcw5MQJ0Kx0PLEp1BKGpb3Mf1O3SY2H5MJjTPKVIfZHdV818hKrC
         pZhMN9BX5UHczlC+hNFrwRJmqCzHQeYMGoKCnuPXsw9IZqgeAMTSSVxEPbzueujho9xw
         x0yeYEpPl04kRBY17BKIndkDx6W4tcJUZ+djFOcUVjMUtdr0roeDw7xFB/n4TgZEbGdp
         KstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6UKoEP9fegeZzwyZ+LM1N+iR1sXOGkc9h/g8W9cZd8g=;
        b=Tfn9i/S5E3yFcAkx6f1c31bhM9aiI7EB62Ekowgr6dVSPSFMSFp95D5FZi0EGXsauV
         AonOaXC+PmTxgoqVtxs24QeIsIe6gD+Zn15a07syqWS2rXPUchNCQTOAA86poLBGiEO3
         A0yxzk0iWhZq4Bwzh39kZn9CI1Vut3WMXvCQ/PySklslMEV9ozBGOWZzKSruxOIbqIUE
         ihlZcRIefUvAt0YvIphHuXC8cq5KQueUS6aWQmCV1yJb2Gf+ovyNXbg2TbG4WY2AkFnf
         HanHTED4un2or/JQcLubCRU83JSaYaU43Q6/HLLyIzfa+VgtOq0lxsXzFCmDZkht+P/x
         Cx8w==
X-Gm-Message-State: AOAM530Zzz3fm1OyOj9ZAOAJ4i20cHAKZ5n7ZEsKPfsV+jAx8WKlW7iS
	/NWYo2OreIppFwuenuFW9UPOyl58DQ9jahMMGVvdMg==
X-Google-Smtp-Source: ABdhPJz0jnm7S47CAs2IbqB+HfmZHGEgUDJZhQxeAkw+y5RouW4cDNDUvd20uKqg/AQVbHMxYJSRFimNODNtWVBImYE=
X-Received: by 2002:a50:fc0d:: with SMTP id i13mr3836142edr.260.1592580532355;
 Fri, 19 Jun 2020 08:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200603115601.13841-1-liu.ming50@gmail.com> <344a06c00c694445ad70c974e5347d5a@svr-ies-mbx-02.mgc.mentorg.com>
In-Reply-To: <344a06c00c694445ad70c974e5347d5a@svr-ies-mbx-02.mgc.mentorg.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 19 Jun 2020 05:28:39 -1000
Message-ID: <CAOSpxdYJRd7102hquAJPEyx7nBS3fkL2G88bQ9UChs+_Fw9Maw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] u-boot: support merging .cfg files for UBOOT_CONFIG
To: Noor Ahsan <noor_ahsan@mentor.com>
Cc: Ming Liu <liu.ming50@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"stefan.agner@toradex.com" <stefan.agner@toradex.com>, 
	"max.krummenacher@toradex.com" <max.krummenacher@toradex.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"

This is a new feature (as opposed to a bug or cve fix) so we need to
have some list discussion on why it should be taken.

I also see that this patch causes breakage and there is a follow-on
fix patch (u-boot: avoid blind merging all *.cfg)

To get the discussion going please submit a patch series to the list
(tagged with [dunfell]) including a cover letter that makes the case
for adding the feature.

Thanks!

Steve

On Thu, Jun 18, 2020 at 9:15 PM Noor Ahsan <noor_ahsan@mentor.com> wrote:
>
> Can this be ported/merged to dunfell also?
>
> Noor
>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org [mailto:openembedded-core@lists.openembedded.org] On Behalf Of Ming Liu
> Sent: Wednesday, June 3, 2020 4:56 PM
> To: openembedded-core@lists.openembedded.org
> Cc: stefan.agner@toradex.com; max.krummenacher@toradex.com; Ming Liu <ming.liu@toradex.com>
> Subject: [OE-core] [PATCH V2] u-boot: support merging .cfg files for UBOOT_CONFIG
>
> From: Ming Liu <ming.liu@toradex.com>
>
> U-boot recipe supports .cfg files in SRC_URI, but they would be merged to .config during do_configure only when UBOOT_MACHINE is set, we should also support merging .cfg files for UBOOT_CONFIG.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
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
> 2.26.2
>
> 
