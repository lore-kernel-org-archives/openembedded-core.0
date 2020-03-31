Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web11.11623.1585668747324492227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 08:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 48sCxj6GcHz1qs0p;
	Tue, 31 Mar 2020 17:32:25 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 48sCxj5sqyz1qqkQ;
	Tue, 31 Mar 2020 17:32:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id vNT2OjcYW5wr; Tue, 31 Mar 2020 17:32:24 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Tue, 31 Mar 2020 17:32:24 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id D37BB454069A;
	Tue, 31 Mar 2020 17:32:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new, port 10024)
	with ESMTP id vxynC_f6-41u; Tue, 31 Mar 2020 17:32:22 +0200 (CEST)
Received: from [IPv6:2001:a61:61b7:b701:d97c:c5f5:7ce4:45bd] (paperino.fritz.box [IPv6:2001:a61:61b7:b701:d97c:c5f5:7ce4:45bd])
	by babic.homelinux.org (Postfix) with ESMTP id 794F245400D4;
	Tue, 31 Mar 2020 17:32:22 +0200 (CEST)
Subject: Re: [PATCH v2] u-boot: Restore valid default environment for running system
To: Otavio Salvador <otavio@ossystems.com.br>,
 OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Stefano Babic <sbabic@denx.de>, Tom Rini <trini@konsulko.com>
References: <20200331151645.1030603-1-otavio@ossystems.com.br>
From: "Stefano Babic" <sbabic@denx.de>
Autocrypt: addr=sbabic@denx.de; prefer-encrypt=mutual; keydata=
 mQGiBEfdB5IRBADkpYcnh2BoAkGD5p186ysEkWlcp5DU07m7BKzvkEMRhFjeFUOU0klKNmh0
 ZM6rKpYpAYPYBm9YahMyqvj9DmLrZ4yfJ5MssvW9SRETmHpva+h1rN+DzmEcwrqZmLG1JWGy
 LA5ruJaFSzxJHBoROoog1NDMbNDB8A9F7VKrePfkVwCgmODpW/uh2IuMYLVidzDeuvo7alED
 /iV8rwU7C+eBcKy2htuDsEmsqlkBxIDM7IO6h5XxdyqbZOYizuBP3Ksb6xK54weEaB5aQs7S
 8N9Soi0p1Xh0LMWj6PBCzTC4LF+OCGEMBPc6bBHNzivChgztJlUMioCDSVpOXB/QpBaK302G
 yP5WdmcB1Jn6neq/YRlxHN38MV2yA/46jnzeUotL9LliVZKA/ql4GmyWg2Ae1BUiCqEJQNwl
 knGJOmIS4uABLArB5HjsfDU5hA9FORaNGCIiZlezBkZ3JXA2uQMQhfgqBXrZt4j1fcw9I7E+
 7IZ2kSCeTPZFLd5FiGQPDOm3Z9eHrpK6pmBGMeBG0pDgUEbN9awyLNBLj7QeU3RlZmFubyBC
 YWJpYyA8c2JhYmljQGRlbnguZGU+iGMEExECACMCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIX
 gAUCT9deSgIZAQAKCRD09WXkmmjvppF1AKCRl8d49K4yxWzdBVRTTWG55cyo/gCfRD1RAttl
 R1ofs2wGLHNtXousyL25Ag0ER90HmBAIAIFfX4bKnOmCyB3nPh+jbXZuBSMZTuyDEnguRxl5
 N8Q0ayofQwucCBjXYv65sQ9Rq6FNhEnWqUZBu8A5CwvSakOFOGNC5ta/8VxVRLh0Z0ZTgEep
 SKiPonJyacCbmgWDECdVrKowV7QB9be3Wu67uAZ74rPw2Kd7f0FKnL3djvVRMaBWFIpyQ6SE
 bGOCJjhRQ5L1pIM1Soko+reU7eO+1g6IBw6YkFJisdQE6fzTwaSqUKPPsQLz/W03invQltOb
 Eg7ZwtFs0DFonr1DMm57ksiEhW6SN1wylRO/JzRYG1Qe7u1EVln6iV3ilBvbbfkyRssk4/0e
 kicpSnQknA72YOMAAwYH+QGpAiQ4hAMHrp1bUrtyGXYdeQpYufIZAM4etOnBy/G+e1nfu6y+
 jH4SN9sVK7bwBBAbhEJqkqR5LVsFIRapThJQOWB11rQxLpwkBU9wao/pRM+o95ujGo32WUzf
 wWrzWrkTDy7vMCZuUOLVi4n1GZlUAwpG4rzb6UxPC6GWymkVWGgXp1NC58og5i3Y+rKT7+Xi
 XT2BtvC6PDepoH4JhD+9OkHQO6UfTxPSmtgNbTgtl6L6tj+bm5dOHgkPJFMkEiG8qhUZYQzb
 bYz37orRbA72M2bxK76e9QKn0mVu+d/YCd8wRcvvJbGsozpzcxPvD5Wy5RNJCES8McPtAseU
 tMeISQQYEQIACQUCR90HmAIbDAAKCRD09WXkmmjvpv+3AJ9RakBsH1j0X/Kxp6t2lf0VUfS2
 qACfZ+J6ktk8PKNuyHf0J/I0mbCrhV4=
Message-ID: <04006361-dc62-45a3-3cff-7f00004180e0@denx.de>
Date: Tue, 31 Mar 2020 17:32:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200331151645.1030603-1-otavio@ossystems.com.br>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

Hi Otavio,

On 31.03.20 17:16, Otavio Salvador wrote:
> One significant change from previous OE-Core releases was the move from
> u-boot-fw-utils to libubootenv which offers a generic and not machine
> specific alternative. However, it is not fully functional as currently
> we don't provide the default environment nor the required configuration
> file to be used by it.

Fully agree - it was on my TODO list, then forgotten. Thanks for fixing
this !

> 
> This change address this and include on the default u-boot.inc the
> needed code to generate, install and deploy the default environment.
> 
> The side effect of this change are:
> 
> - new ${PN}-env

Agree.

> - u-boot-initial-env on deploy
> - fw_env.config on deploy

Why do we need both of them in deploy ? For making system functional, we
just need that both files are in /etc, that is ${PN}-env must be
installed (and then you set RRECOMMENDS). But why in deploy ? Am I
missing something ?

> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> This change is late in the cycle but it is critical in my opinion.
> 
> The lack of default environment as well as the configuration for the
> tool is a regression from the previous release and this mitigates it.
> 
> Changes in v2:
> - Fix wrong path on do_install
> - Change virtual/bootloader-env to u-boot-default-env (RP)
> - Add Tom Rini and Stefano Babic to Cc
> 
>  meta/recipes-bsp/u-boot/libubootenv_0.2.bb |  1 +
>  meta/recipes-bsp/u-boot/u-boot.inc         | 54 ++++++++++++++++++----
>  2 files changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> index 7a7ec4c8856..144c5c941df 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> @@ -23,5 +23,6 @@ EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
>  
>  PROVIDES += "u-boot-fw-utils"
>  RPROVIDES_${PN}-bin += "u-boot-fw-utils"
> +RRECOMMENDS_${PN}-bin += "u-boot-default-env"
>  
>  BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 648298da0bf..b13db224732 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -122,6 +122,11 @@ do_compile () {
>                              cp ${B}/${config}/${binary} ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
>                          fi
>                      done
> +
> +                    # Generate the uboot-initial-env
> +                    oe_runmake -C ${S} O=${B}/${config} u-boot-initial-env
> +                    cp ${B}/${config}/u-boot-initial-env ${B}/${config}/u-boot-initial-env-${type}
> +
>                      unset k
>                  fi
>              done
> @@ -130,6 +135,9 @@ do_compile () {
>          unset  i
>      else
>          oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
> +
> +        # Generate the uboot-initial-env
> +        oe_runmake -C ${S} O=${B} u-boot-initial-env
>      fi
>  
>  }
> @@ -143,19 +151,26 @@ do_install () {
>                  j=$(expr $j + 1);
>                  if [ $j -eq $i ]
>                  then
> -                    install -d ${D}/boot
> -                    install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> +                    install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
> +
> +                    # Install the uboot-initial-env
> +                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/u-boot-initial-env-${type}-${PV}-${PR}
> +                    ln -sf u-boot-initial-env-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${type}
> +                    ln -sf u-boot-initial-env-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
>                  fi
>              done
>              unset  j
>          done
>          unset  i
>      else
> -        install -d ${D}/boot
> -        install -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> +        install -D -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
>          ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +
> +        # Install the uboot-initial-env
> +        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/u-boot-initial-env-${PV}-${PR}
> +        ln -sf u-boot-initial-env-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
>      fi
>  
>      if [ -n "${UBOOT_ELF}" ]
> @@ -224,7 +239,16 @@ do_install () {
>  
>  }
>  
> -FILES_${PN} = "/boot ${sysconfdir} ${datadir}"
> +PACKAGE_BEFORE_PN += "${PN}-env"
> +
> +RPROVIDES_${PN}-env += "u-boot-default-env"
> +FILES_${PN}-env = " \
> +    ${sysconfdir}/u-boot-initial-env* \
> +    ${sysconfdir}/fw_env.config \
> +"
> +
> +FILES_${PN} = "/boot ${datadir}"
> +RDEPENDS_${PN} += "${PN}-env"
>  
>  do_deploy () {
>      if [ -n "${UBOOT_CONFIG}" ]
> @@ -235,25 +259,37 @@ do_deploy () {
>                  j=$(expr $j + 1);
>                  if [ $j -eq $i ]
>                  then
> -                    install -d ${DEPLOYDIR}
> -                    install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> +                    install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
> +                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/u-boot-initial-env-${type}-${PV}-${PR}
> +
>                      cd ${DEPLOYDIR}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
>                      ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
> +
> +                    ln -sf u-boot-initial-env-${type}-${PV}-${PR} u-boot-initial-env-${type}
> +                    ln -sf u-boot-initial-env-${type}-${PV}-${PR} u-boot-initial-env
>                  fi
>              done
>              unset  j
>          done
>          unset  i
>      else
> -        install -d ${DEPLOYDIR}
> -        install -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> +        install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> +        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/u-boot-initial-env-${PV}-${PR}
>          cd ${DEPLOYDIR}
>          rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
>          ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>          ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> +
> +        ln -sf u-boot-initial-env-${PV}-${PR} u-boot-initial-env
> +    fi
> +
> +    if [ -e ${WORKDIR}/fw_env.config ] ; then
> +        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config-${PV}-${PR}
> +        cd ${DEPLOYDIR}
> +        ln -sf fw_env.config-${PV}-${PR} fw_env.config
>      fi
>  
>      if [ -n "${UBOOT_ELF}" ]
> 

Regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================
