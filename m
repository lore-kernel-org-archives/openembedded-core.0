Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id DC26E789A8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 03:18:57 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 93-v6so6768252plc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 19:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nvbc3nkUuHgtHXB4X5j2/5ULgtTPr/0y+EL3iOn7gRM=;
	b=T8HMl2JFksSC+GaJxMlYrFTL4oUK2Rcxxwm3LyndnXY5jByoQZa3tURqvP1r/G3WsN
	BAlpBHXPmAJQFr7OwvOHoFxjpnOZP1lntQRgg49JB0ehWXlF8jInsoHWxZWucXXcpWB4
	AEWAUV5T9oXyjj79VHBD0Ju9rb/Lxf1DtAQHZ89Vw/br3YNUnGdGZ+djfz+bi6w7OaG4
	74esqbBqpah3EwqIYIK9LyJcrPDdJdTf2emh6cwWjFuHYBEAieWht45te/GFJiP9Ucus
	4uiouilWWUMZZPkCJNIG+DI931xj8x9c1ri+pVdYG4jir2/5a5Ig/46Wr5UNrAJ9/MBS
	jsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nvbc3nkUuHgtHXB4X5j2/5ULgtTPr/0y+EL3iOn7gRM=;
	b=cKqFfFvfADCGaFP0fIHj150s3m02OXJjr+c1+3oJcMdMLMIf9j59QVe7essaBMQlOL
	cfRva6s/NnXbf4UISS/b3+lKbKSSWR0DWeSewaqdOf4tXqONc4tVt704cXTiw8N+twMg
	G5k7NbaNc+Lm+TPXDge8PG4nwIHN3w6Tc4CwgIngWYWhYzQb0klHs+QzBJiPaY4hCSUT
	eigHkXz08B3vl5xlfVwGqfUWWDjEjrynQ0AgEpWS/YAI1JK7RO/jNpFbHlwL+TLUmIec
	DrjaqZPmd7FpX8MR488U9Iejamg24WprHZbqjVXFi61qZKS46NZ6/UGRYyrhmSkybb0m
	wIAw==
X-Gm-Message-State: APf1xPA/bvxwfY9sMMyq+OPvVtwq+82hpGF+O71cCnem0Hi4U0CntCVV
	witEL7xgFccjx9wvCpulVvZmbt8S
X-Google-Smtp-Source: AG47ELs3Uowt676Wf1r0nyOEvpL2P0MO9qBUhCoEUpo0fOmvNnNUP50YhuMFhfGPWL+OMCmSsTbYjA==
X-Received: by 2002:a17:902:6504:: with SMTP id
	b4-v6mr7160758plk.451.1520047138930; 
	Fri, 02 Mar 2018 19:18:58 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:a564:75fb:6e2a:d708?
	([2601:646:8880:466c:a564:75fb:6e2a:d708])
	by smtp.gmail.com with ESMTPSA id
	f11sm14671256pfa.166.2018.03.02.19.18.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 19:18:58 -0800 (PST)
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
References: <1520041611-39622-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <fc15995e-5e85-bd72-2454-cde432b68051@gmail.com>
Date: Fri, 2 Mar 2018 19:18:57 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <1520041611-39622-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 1/2] busybox: separate inittab into own package, due to SERIAL_CONSOLES being machine-specific
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2018 03:18:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/2/18 5:46 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> * Create busybox-inittab recipe to produce machine-specific package with /etc/inittab
>   and necessary getty calls for a machine, based on SERIAL_CONSOLES, similar to how
>   sysvinit-inittab was done
> 
> * Since CONFIG_FEATURE_USE_INITTAB is controlled by VIRTUAL-RUNTIME_init_manager, make
>   main busybox package RDEPENDS on busybox-inittab when init_manager is set to busybox
> 

thanks for taking care of this. I atleast owe a review to it. So here it
looks good to me.

> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/busybox/busybox-inittab_1.27.2.bb | 32 ++++++++++++++++++++++
>  meta/recipes-core/busybox/busybox.inc              | 12 ++------
>  2 files changed, 34 insertions(+), 10 deletions(-)
>  create mode 100644 meta/recipes-core/busybox/busybox-inittab_1.27.2.bb
> 
> diff --git a/meta/recipes-core/busybox/busybox-inittab_1.27.2.bb b/meta/recipes-core/busybox/busybox-inittab_1.27.2.bb
> new file mode 100644
> index 0000000..a83620e
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox-inittab_1.27.2.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "inittab configuration for BusyBox"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +
> +SRC_URI = "file://inittab"
> +
> +S = "${WORKDIR}"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +do_compile() {
> +	:
> +}
> +
> +do_install() {
> +    install -d ${D}${sysconfdir}
> +    install -D -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
> +    tmp="${SERIAL_CONSOLES}"
> +    for i in $tmp
> +    do
> +            j=`echo ${i} | sed s/\;/\ /g`
> +            id=`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
> +            echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> +    done
> +}
> +
> +# SERIAL_CONSOLES is generally defined by the MACHINE .conf.
> +# Set PACKAGE_ARCH appropriately.
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +FILES_${PN} = "${sysconfdir}/inittab"
> +CONFFILES_${PN} = "${sysconfdir}/inittab"
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 157aea3..ac6d7ca 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -48,6 +48,8 @@ CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
>  
>  RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
>  
> +RDEPENDS_${PN} = "${@["", "busybox-inittab"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]}"
> +
>  inherit cml1 systemd update-rc.d ptest
>  
>  # internal helper
> @@ -310,16 +312,6 @@ do_install () {
>                  install -D -m 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
>                  install -D -m 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
>                  install -D -m 0755 ${WORKDIR}/runlevel ${D}${base_sbindir}/runlevel
> -                if grep "CONFIG_FEATURE_USE_INITTAB=y" ${B}/.config; then
> -                        install -D -m 0777 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
> -                        tmp="${SERIAL_CONSOLES}"
> -                        for i in $tmp
> -                        do
> -                                j=`echo ${i} | sed s/\;/\ /g`
> -                                id=`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
> -                                echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> -                        done
> -                fi
>          fi
>  
>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> 


