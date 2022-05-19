Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EBAC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 14:14:29 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.8068.1652969666137673440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 07:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XGKrlUp2;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id y7so8748397ejr.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zokXEFClYpSS2z783by/ZqCq6jsh3W8zeAc1GXO0YB4=;
        b=XGKrlUp2jFg76IoZ+uf9WIuYY71cf3l1gaIrQC1QEX5wLp3DhVBSIm/N6AYAJrjU5e
         4nFwaoKy+gxmMb/2bzyFCv9GU74tc/nFI5cuIa/EVLTntS0uPQNfyyUbOCBJNUen4BH8
         ES7Fp3vtBqjlWIZeMA8rBFZNe/wzC+8SWI3rfm3Q71msZnkEu5FeANZ2Kg2u3V/suCKv
         xvPc2yQXlEzpSydbpGliNTKGLc/7b/8WAUARIrHLTnWbjpVqN4pxm7MSoF7nogtfdc/j
         ykIYMA0nX4g290fk+vjpEsJAoSB7LbMxFmyGEvboKXl22/Y6bG78nWDKeFZ+aS6SuO8J
         cEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zokXEFClYpSS2z783by/ZqCq6jsh3W8zeAc1GXO0YB4=;
        b=AjMT1vdTzEF0i4pN3BNT48flkZ5HswPL135mTITbUCYOeFEqdHbD7cZbd46apA6JWJ
         RSd6UkbGhs/WCBYx08qKFNZtPfSv4M+cGa+D+cX0fyw2U48rg5S0foKvpKtKRQGQBdaV
         z1ONqWdbn/R+4yUQg2Nb0TLt3+YdLJSSBg1XYaDHjPricsUjAylS57s/co52Ar5XlVDG
         0nMgaHWA1l5O1Sgm97T/uURMW2ojf/ViFf6P4l0DyZn6lXI9Ujlhqpidf81fUwMkzA8Y
         qRw9b2NWgHVGlHAImyAqPjZ7rf/EAFnWq3wD3Bky+NDl3Y2ZtcNy2jMFaLd9VsIjP9OV
         esaQ==
X-Gm-Message-State: AOAM532oK8XAKmu7q8mL5nmXZlHXJuUqaEiu9dwb7yUHbBF4NSm0Z5QA
	ZfhxlX1EEb/gNW2kOsU7V1NkvOOOv8au5J8maec=
X-Google-Smtp-Source: 
 ABdhPJzTtsJ1VmsVKpQ8a5D425RDCSwpfFSZkBsgv7Z9UdSkZVD9z5mFqrF5myMAI9b7/7RawVRnDSfv4l/utQSPw9A=
X-Received: by 2002:a17:907:9813:b0:6fa:78b0:9be2 with SMTP id
 ji19-20020a170907981300b006fa78b09be2mr4605926ejc.159.1652969664575; Thu, 19
 May 2022 07:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220519085658.3796309-1-changqing.li@windriver.com>
In-Reply-To: <20220519085658.3796309-1-changqing.li@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 19 May 2022 15:14:12 +0100
Message-ID: 
 <CAO5Uq5TFbM9gZmNk+Zm5sFgyu6PQgKmOPBnknv=u1Wkm_mhubA@mail.gmail.com>
Subject: Re: [PATCH] eudev: create static-nodes in init script
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 14:14:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165890

On Thu, May 19, 2022 at 9:57 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> dev in modules.devname should be populated in /dev on boot.  remove
> create static mode from udevd will make these devices cannot be
> populated. Since commit [1], when use sysVinit, devices like
> /dev/net/tun will not be created.
>
> more info:
> udevd in systemd also remove create static mode in udevd, but using
> service kmod-static-nodes.service and systemd-tmpfiles-setup-dev.service
> in systemd to create these node, so systemd works well.
>
> For sysV, parse kmod static-nodes and generate the device nodes in init
>
> [1] https://gitweb.gentoo.org/proj/eudev.git/commit/?id=2b7abd5ec9cc47a8b895df6db77fb1537c6f1a39
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/udev/eudev/init      | 36 ++++++++++++++++++++++++++
>  meta/recipes-core/udev/eudev_3.2.11.bb |  2 ++
>  2 files changed, 38 insertions(+)
>
> diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
> index c60dbbf6d5..5c2fb4a9fb 100644
> --- a/meta/recipes-core/udev/eudev/init
> +++ b/meta/recipes-core/udev/eudev/init
> @@ -23,6 +23,41 @@ kill_udevd () {
>      [ -n "$pid" ] && kill $pid
>  }
>
> +make_static_nodes () {
> +    [ -e /lib/modules/$(uname -r)/modules.devname ] || return 0
> +    [ -x @KMOD@ ] || return 0
> +
> +    kmod static-nodes --format=tmpfiles --output=/proc/self/fd/1 |

Is that --output=... really needed? Also if we're substituting for the
full kmod path with @KMOD@ we should do the same here.

> +    while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
> +    case "${TTYPE}" in
> +    'd')
> +            test -d "${TPATH}" || mkdir -p -m "${TMODE}" "${TPATH}"
> +            ;;
> +
> +    'c!')
> +            if [ ! -c "${TPATH}" ]; then
> +                    old_ifs="${IFS}"
> +                    IFS=:
> +                    set -- ${TARG}
> +                    IFS="${old_ifs}"
> +                    mknod -m "${TMODE}" "${TPATH}" c "$@"
> +            fi
> +            ;;
> +
> +    *)
> +            echo ERROR
> +            exit 1

I don't know what the right answer is if you end up here - blundering
on regardless I guess is more typical behaviour for sysvinit, so just
use a better error message and don't exit?

> +            ;;
> +    esac
> +    if [ "${TUSER}" != "-" ]; then
> +            chown "${TUSER}" "${TPATH}"
> +    fi
> +    if [ "${TGROUP}" != "-" ]; then
> +            chgrp "${TGROUP}" "${TPATH}"
> +    fi
> +    done
> +}
> +
>  case "$1" in
>    start)
>      export ACTION=add
> @@ -51,6 +86,7 @@ case "$1" in
>      # make_extra_nodes
>      kill_udevd > "/dev/null" 2>&1
>
> +    make_static_nodes
>      # trigger the sorted events
>      [ -e /proc/sys/kernel/hotplug ] && printf '\0\n' >/proc/sys/kernel/hotplug
>      @UDEVD@ -d
> diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
> index 841039f6d7..e4f78c2b0c 100644
> --- a/meta/recipes-core/udev/eudev_3.2.11.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.11.bb
> @@ -41,6 +41,7 @@ do_install:append() {
>         install -d ${D}${sysconfdir}/init.d
>         install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
>         sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
> +       sed -i s%@KMOD@%${base_sbindir}/kmod% ${D}${sysconfdir}/init.d/udev
>
>         install -d ${D}${sysconfdir}/udev/rules.d
>         install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
> @@ -73,6 +74,7 @@ FILES:libudev = "${base_libdir}/libudev.so.*"
>  FILES:eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
>
>  RDEPENDS:eudev-hwdb += "eudev"
> +RDEPENDS:eudev += "kmod"
>
>  RPROVIDES:${PN} = "hotplug udev"
>  RPROVIDES:eudev-hwdb += "udev-hwdb"
> --
> 2.25.1
>


-- 
Alex Kiernan

