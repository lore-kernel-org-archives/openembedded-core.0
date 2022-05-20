Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C752EC433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 06:55:20 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.6039.1653029712357571231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 23:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EU4B+PpR;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id g12so9606781edq.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 23:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lCCPG/jtTGrFk846F6ZR/iiIYYcK7StUCSDZh1jlx7c=;
        b=EU4B+PpR+Op6IirbhldmqMgQBgzPyYkb6YdWo3IrllYX0byYzKrtnPRUa9LYybCCTT
         lBHe27pwbMk7iDlfr2KT/XYf1uekPMKxWAqsRPTRar9XRk9N4RO3n79CTLAy22M2f1TB
         ESMxlaJB8WFmEjqiBdq46ctRicCyv85vxYjGJs/Fq/Huu7r/NZYTnknyu9EBP/PF0SXc
         UCGL8gAnipypuQUVdbJERCIqV7KQqjdXRnmqZroLN+gs/w4MitseE46ifDM/0Tuqq6sQ
         4kab1WDEhXOaFLQNQFRov0gIi7H1P+S1DeyNZGMPROHvk22mslFXP/mPtB3GVkhP5dOg
         f5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lCCPG/jtTGrFk846F6ZR/iiIYYcK7StUCSDZh1jlx7c=;
        b=VzSZG3HA30f8fjCS5FFwcw0Mv4F2iIqu+ggtvjuLNUL86aHZj7gXr2ZoMYrkx/kvYm
         Tz+ttyxCyuXsuRdw19meYueyUtDWhTSzzzahywDgVr116SVE4Q8vqdAQniBYo+BtQfON
         WaSUB1Rn0c2JUAr1qQiuj8ZXPPdEdXjNfT3WDc3Wb4guNssxcxX6txSnwaKUqcXxE+ut
         4bzmQYYjvGwWdOhIEEf0RgTubfHSMWynPA4WIkYmJO/UBQQ2sC1/+R01phLlAMBY5Di/
         f/XqdKemUwXZ5IGkBGFyFs6nkPqZWOtFzi89mOVCuUp3pFq+dddsE8ulVbAvZtVDTqAM
         JqAw==
X-Gm-Message-State: AOAM533XFFQ99ZPcJXukkTLGPVR41QR7cXnvvCYWdrKY5MNFMtTIQmea
	8D5gHm5Y5qhsDzbwpTHrejsVUD2+XlmbAZQi5T8=
X-Google-Smtp-Source: 
 ABdhPJzsiymRajVaIqioC4/0O0As5yj3nSVJs94eX9fueDc7VaVh8u9PqzYA6ioh94j+Xs9NRPJUJLhpO7wiwfEjgmc=
X-Received: by 2002:aa7:d94f:0:b0:42a:d1d6:4a17 with SMTP id
 l15-20020aa7d94f000000b0042ad1d64a17mr9356097eds.93.1653029710624; Thu, 19
 May 2022 23:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220519085658.3796309-1-changqing.li@windriver.com>
 <CAO5Uq5TFbM9gZmNk+Zm5sFgyu6PQgKmOPBnknv=u1Wkm_mhubA@mail.gmail.com>
 <SN6PR11MB25574BDFF88A33D9399205CF82D39@SN6PR11MB2557.namprd11.prod.outlook.com>
In-Reply-To: 
 <SN6PR11MB25574BDFF88A33D9399205CF82D39@SN6PR11MB2557.namprd11.prod.outlook.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 20 May 2022 07:54:59 +0100
Message-ID: 
 <CAO5Uq5TdDX837SOyX5zM-rfnfX2ED9NxK8UW7ckZ=9WRDuQtNA@mail.gmail.com>
Subject: Re: [PATCH] eudev: create static-nodes in init script
To: "Li, Changqing" <Changqing.Li@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 06:55:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165917

On Fri, May 20, 2022 at 6:32 AM Li, Changqing
<Changqing.Li@windriver.com> wrote:
>
>
>
> ________________________________
> From: Alex Kiernan <alex.kiernan@gmail.com>
> Sent: Thursday, May 19, 2022 10:14 PM
> To: Li, Changqing <Changqing.Li@windriver.com>
> Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>; Richard Purdie <richard.purdie@linuxfoundation.org>
> Subject: Re: [PATCH] eudev: create static-nodes in init script
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, May 19, 2022 at 9:57 AM <changqing.li@windriver.com> wrote:
> >
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > dev in modules.devname should be populated in /dev on boot.  remove
> > create static mode from udevd will make these devices cannot be
> > populated. Since commit [1], when use sysVinit, devices like
> > /dev/net/tun will not be created.
> >
> > more info:
> > udevd in systemd also remove create static mode in udevd, but using
> > service kmod-static-nodes.service and systemd-tmpfiles-setup-dev.service
> > in systemd to create these node, so systemd works well.
> >
> > For sysV, parse kmod static-nodes and generate the device nodes in init
> >
> > [1] https://gitweb.gentoo.org/proj/eudev.git/commit/?id=2b7abd5ec9cc47a8b895df6db77fb1537c6f1a39
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  meta/recipes-core/udev/eudev/init      | 36 ++++++++++++++++++++++++++
> >  meta/recipes-core/udev/eudev_3.2.11.bb |  2 ++
> >  2 files changed, 38 insertions(+)
> >
> > diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
> > index c60dbbf6d5..5c2fb4a9fb 100644
> > --- a/meta/recipes-core/udev/eudev/init
> > +++ b/meta/recipes-core/udev/eudev/init
> > @@ -23,6 +23,41 @@ kill_udevd () {
> >      [ -n "$pid" ] && kill $pid
> >  }
> >
> > +make_static_nodes () {
> > +    [ -e /lib/modules/$(uname -r)/modules.devname ] || return 0
> > +    [ -x @KMOD@ ] || return 0
> > +
> > +    kmod static-nodes --format=tmpfiles --output=/proc/self/fd/1 |
>
> Is that --output=... really needed?
>
> add output since kmod output to /dev/stdout by default,but we run make_static_nodes before udevd,
> /dev/stdout is created by udevd.
>

Oh, that's interesting - I suspect it's worth capturing as a comment
so the next person looking at it doesn't have the same question as me!

> Also if we're substituting for the full kmod path with @KMOD@ we should do the same here.
> OK.
>
> > +    while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
> > +    case "${TTYPE}" in
> > +    'd')
> > +            test -d "${TPATH}" || mkdir -p -m "${TMODE}" "${TPATH}"
> > +            ;;
> > +
> > +    'c!')
> > +            if [ ! -c "${TPATH}" ]; then
> > +                    old_ifs="${IFS}"
> > +                    IFS=:
> > +                    set -- ${TARG}
> > +                    IFS="${old_ifs}"
> > +                    mknod -m "${TMODE}" "${TPATH}" c "$@"
> > +            fi
> > +            ;;
> > +
> > +    *)
> > +            echo ERROR
> > +            exit 1
>
> I don't know what the right answer is if you end up here - blundering
> on regardless I guess is more typical behaviour for sysvinit, so just
> use a better error message and don't exit?
>
> Get this.
>
> > +            ;;
> > +    esac
> > +    if [ "${TUSER}" != "-" ]; then
> > +            chown "${TUSER}" "${TPATH}"
> > +    fi
> > +    if [ "${TGROUP}" != "-" ]; then
> > +            chgrp "${TGROUP}" "${TPATH}"
> > +    fi
> > +    done
> > +}
> > +
> >  case "$1" in
> >    start)
> >      export ACTION=add
> > @@ -51,6 +86,7 @@ case "$1" in
> >      # make_extra_nodes
> >      kill_udevd > "/dev/null" 2>&1
> >
> > +    make_static_nodes
> >      # trigger the sorted events
> >      [ -e /proc/sys/kernel/hotplug ] && printf '\0\n' >/proc/sys/kernel/hotplug
> >      @UDEVD@ -d
> > diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
> > index 841039f6d7..e4f78c2b0c 100644
> > --- a/meta/recipes-core/udev/eudev_3.2.11.bb
> > +++ b/meta/recipes-core/udev/eudev_3.2.11.bb
> > @@ -41,6 +41,7 @@ do_install:append() {
> >         install -d ${D}${sysconfdir}/init.d
> >         install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
> >         sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
> > +       sed -i s%@KMOD@%${base_sbindir}/kmod% ${D}${sysconfdir}/init.d/udev
> >
> >         install -d ${D}${sysconfdir}/udev/rules.d
> >         install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
> > @@ -73,6 +74,7 @@ FILES:libudev = "${base_libdir}/libudev.so.*"
> >  FILES:eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
> >
> >  RDEPENDS:eudev-hwdb += "eudev"
> > +RDEPENDS:eudev += "kmod"
> >
> >  RPROVIDES:${PN} = "hotplug udev"
> >  RPROVIDES:eudev-hwdb += "udev-hwdb"
> > --
> > 2.25.1
> >
>
>
> --
> Alex Kiernan



-- 
Alex Kiernan

