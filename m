Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D134C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:33:22 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.12227.1643996001359852302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H5pJOelY;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id o9so5847203qvy.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UyjOZH9SPexI7zWBwwc6EJOqIptCFMlauCeud362qtE=;
        b=H5pJOelYfmIo77Y6c/mK9EomSZJ5wqlqca4cNhzJB+CJLJwpXWujH1jEE39OI2nUj9
         MaHUhAAMrAdHz55tHVZVRqpBAWMORmj4MAArpXjWyuhzHTGn0gDZxtUK6ReOMV6bFJLv
         H85kdpatVf2GW1/UCUkcCZ/VbEs8j/ceHgriH3YRv9RlmI5MESXE9TdfVzNKzPn9+P1m
         AWuTTmrOjKMiDTCV9ZH5LB3wMlJdmgdWBseMgD8uY/nCqgV+ldMssHETWD8Ss5e2sTdh
         2Bnsw0OEocm1MV48/UW5X1RvMdRm5eav6MIW71A33zTAOKZyYlCleZLe9b2LvtxnOPzi
         SQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UyjOZH9SPexI7zWBwwc6EJOqIptCFMlauCeud362qtE=;
        b=pb0HP6tsoKH0pAcgv+SsSr0bqf91QmVIzPsEfq/+utRiDtURU7I6stB1EP+P0TqgWU
         YhVanZgf7vaGIpo5xod5hOArCgNMx/u/3yQCO5UW5QI77xbYL0eoobhL9jdB0UFvhsuF
         hdk1aQ07gd7hN72g54Xn1XHPp+5Q+ci68iV2kuUJ5TcMDBr6V/e+3bOzEedRXcfbxKuJ
         DAE3Wg+UzoaZ5gHmKMrmVFk0EHSIPoRhczZL47gVso3WIjRHLtK+uzuZ8WeMvlq6LvXk
         Czb3Fh8kjduk28Xx47cO1Gv+RP034j0+S1tN5CkD44qYdrjyEiwt9TdyOtZRkbb8GSwk
         ldvA==
X-Gm-Message-State: AOAM533njE0DE2UKQjwmA+aVLjCtRPhDXXP5trJEHoicvOAxm4vL3VUR
	dB5EgdXU1v2956ekTSaVbi+PlvmEB0SsSIzQcjk=
X-Google-Smtp-Source: 
 ABdhPJyRO1d3zwc50Z/U81goMj/Ie+gjaJ5EvR5wLZJ3m84fAz6mLTFhZY0KAgf89mB3FVMqOgvHEdlz79H8JDO/baE=
X-Received: by 2002:a05:6214:27e8:: with SMTP id
 jt8mr2628225qvb.110.1643996000355;
 Fri, 04 Feb 2022 09:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20220202182758.919991-1-alex@linutronix.de>
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Feb 2022 09:32:54 -0800
Message-ID: 
 <CAMKF1soxm1ctSTvGq++bKF0fVKcDY64O5YOzCGqCm=eyNHge3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/33] seatd: add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 17:33:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161375

fails on mips/arm64

https://errors.yoctoproject.org/Errors/Details/623915/

you might need something like
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch

On Wed, Feb 2, 2022 at 10:28 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This is needed to run weston properly as non-root in the absence
> of systemd-logind, and other compositors will likely require seatd
> as well.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc |  1 +
>  meta/recipes-core/seatd/seatd/init       | 45 ++++++++++++++++++++++++
>  meta/recipes-core/seatd/seatd_0.6.3.bb   | 29 +++++++++++++++
>  3 files changed, 75 insertions(+)
>  create mode 100644 meta/recipes-core/seatd/seatd/init
>  create mode 100644 meta/recipes-core/seatd/seatd_0.6.3.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index ae25287c11..cb289a0eee 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-sbc = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-screen = "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-seatd = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-serf = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-setserial = "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-core/seatd/seatd/init b/meta/recipes-core/seatd/seatd/init
> new file mode 100644
> index 0000000000..0589c765ac
> --- /dev/null
> +++ b/meta/recipes-core/seatd/seatd/init
> @@ -0,0 +1,45 @@
> +#!/bin/sh
> +#
> +### BEGIN INIT INFO
> +# Provides: seatd
> +# Required-Start: $local_fs $remote_fs
> +# Required-Stop: $local_fs $remote_fs
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +### END INIT INFO
> +
> +killproc() {
> +        pid=`/bin/pidof $1`
> +        [ "$pid" != "" ] && kill $pid
> +}
> +
> +case "$1" in
> +  start)
> +        seatd -g video -n 1 > /tmp/seatd-start-notify &
> +        [ -s /tmp/seatd-start-notify ] && exit 0
> +        sleep 0.1
> +        [ -s /tmp/seatd-start-notify ] && exit 0
> +        sleep 0.5
> +        [ -s /tmp/seatd-start-notify ] && exit 0
> +        sleep 5
> +        [ -s /tmp/seatd-start-notify ] && exit 0
> +        exit 1
> +  ;;
> +
> +  stop)
> +        echo "Stopping seatd"
> +        killproc seatd
> +  ;;
> +
> +  restart)
> +       $0 stop
> +        sleep 1
> +        $0 start
> +  ;;
> +
> +  *)
> +        echo "usage: $0 { start | stop | restart }"
> +  ;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-core/seatd/seatd_0.6.3.bb b/meta/recipes-core/seatd/seatd_0.6.3.bb
> new file mode 100644
> index 0000000000..0e1a79dddf
> --- /dev/null
> +++ b/meta/recipes-core/seatd/seatd_0.6.3.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "A minimal seat management daemon, and a universal seat management library."
> +DESCRIPTION = "Seat management takes care of mediating access to shared devices (graphics, input), without requiring the applications needing access to be root."
> +HOMEPAGE = "https://git.sr.ht/~kennylevinsen/seatd"
> +
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
> +
> +SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
> +           file://init"
> +SRCREV = "88db55f6068c1c01d85b61aa6adff0a6b2a8dce8"
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig update-rc.d
> +
> +PACKAGECONFIG ?= "libseat-builtin"
> +
> +PACKAGECONFIG[libseat-builtin] = "-Dlibseat-builtin=enabled,-Dlibseat-builtin=disabled"
> +
> +do_install:append() {
> +        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
> +                install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/seatd
> +        fi
> +}
> +
> +INITSCRIPT_NAME = "seatd"
> +INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> +INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
> +
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161226): https://lists.openembedded.org/g/openembedded-core/message/161226
> Mute This Topic: https://lists.openembedded.org/mt/88865275/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

