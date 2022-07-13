Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FD2C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:56:18 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.320.1657731371556918146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BvJQ3Osi;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id r18so14866761edb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=34DHr6z2srqHe2KMOtYRK5ZCWdcN7fIFbCcjFOJu4p8=;
        b=BvJQ3OsiY2ni9KgI64ZFCq4G0jnlwPHLWTV0TmemIbsoAobd6s01ejoa90+hNSVt6A
         IjEpcHCx7NJWQJYjKx6AsylfaEKRWjkMvmgdS9D0X+n7Rf6xvOgEyevsQnI9lhlUuEGp
         NE1phYuQi/UAibGb1h3n6aJZjgARPio0amMvCXTYF5YnWaz6FWCTAzJ+dxoRQ1TunOL9
         k2395wYLz5O1qYsCONBlV4jOMJhq6IQ549OsrKHnBsMG9wCrCVBqVofx3fR2Ni0SIEe0
         PiBmxGq8MmfnNWIIYFEXwNhbvIi6Y0oubJgUBkr7oF5bBmJdSy+y2SYL3lc3t/yFBSRy
         qy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=34DHr6z2srqHe2KMOtYRK5ZCWdcN7fIFbCcjFOJu4p8=;
        b=LeYVCUjuyIjmvfFCkxMuof3Y5ca4T08lhY3BJwP0Gqx2WcXjtlchzNJ621MAmMYQYD
         NUJvP6hJI3q+11ydkFKRyT7yF0wesvBoBBj2SZOiAWXUx2mdTE87Si6F+SAmPEF389y2
         rIa1UrdE9st6FFHr/yp/MgEUnnVeP4AaBoeOSwzCfmeDzuqCcOYOY2einWnc79VJQ18R
         FzUKnlbnYgDeXjk8y6r6tg5+VvP+MqFgdm1/q5lp55oJ9Aczgf1rr/TFsG3CUaqRphgN
         0AxfbnFTQCPyNdVBmtD/4RYJ4LJaT6xE9Sl7dr/WKXWLmFYD610NFOxqGQvSNoEEzzpd
         qCLA==
X-Gm-Message-State: AJIora9yoV8MFI9xef3n+Gra6bdv9ULQ8xsM0Go35Z9UbNIm3m4pAgcV
	ysQcDXTKK4AaPkO6xPlnhyzl6vkLZd6N+uBnFw+yGGVn
X-Google-Smtp-Source: 
 AGRyM1vjoIRkc09YCmmkCWQiraDuYd8IdT1zs1E/vuuwJyGGd/UTGr4EZFau6SC1wCtZ8DsE9tdmrgdwNPdOXo4YgGM=
X-Received: by 2002:a05:6402:3290:b0:43a:86c4:af70 with SMTP id
 f16-20020a056402329000b0043a86c4af70mr6004189eda.313.1657731370050; Wed, 13
 Jul 2022 09:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <20220713154139.101744-1-luca.boccassi@gmail.com>
 <20220713154139.101744-2-luca.boccassi@gmail.com>
 <fb71b30dec53dc6d2a84416ceeb4056455c1f110.camel@linuxfoundation.org>
In-Reply-To: 
 <fb71b30dec53dc6d2a84416ceeb4056455c1f110.camel@linuxfoundation.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 13 Jul 2022 17:55:58 +0100
Message-ID: 
 <CAMw=ZnS0_cfc9Pwm4utpM=10c2X_uChyTpHw1A-C3zb2F_xdOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:56:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167977

On Wed, 13 Jul 2022 at 17:26, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-07-13 at 16:41 +0100, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >
> > Support for unmerged-usr is deprecated upstream, taints the system and will be
> > removed in the near future.
> > Enforce building merged-usr images when using systemd.
> >
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v2: use :append in each recipe
> >
> >  meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
> >  meta/recipes-core/systemd/systemd-serialgetty.bb  | 2 +-
> >  meta/recipes-core/systemd/systemd.inc             | 5 +++++
> >  meta/recipes-core/systemd/systemd_251.2.bb        | 2 +-
> >  4 files changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
> > index 55ebf99117..9085075a78 100644
> > --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> > +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> > @@ -14,7 +14,7 @@ INHIBIT_DEFAULT_DEPS = "1"
> >
> >  ALLOW_EMPTY:${PN} = "1"
> >
> > -REQUIRED_DISTRO_FEATURES = "systemd"
> > +REQUIRED_DISTRO_FEATURES:append += "systemd"
> >
> >  SYSTEMD_DISABLED_SYSV_SERVICES = " \
> >    busybox-udhcpc \
> > diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > index fd888bb834..60e18c4298 100644
> > --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> > +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > @@ -14,7 +14,7 @@ S = "${WORKDIR}"
> >
> >  # As this package is tied to systemd, only build it when we're also building systemd.
> >  inherit features_check
> > -REQUIRED_DISTRO_FEATURES = "systemd"
> > +REQUIRED_DISTRO_FEATURES:append += "systemd"
> >
> >  do_install() {
> >       if [ ! -z "${SERIAL_CONSOLES}" ] ; then
> > diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> > index b8dbe2263a..f9e109bba4 100644
> > --- a/meta/recipes-core/systemd/systemd.inc
> > +++ b/meta/recipes-core/systemd/systemd.inc
> > @@ -21,3 +21,8 @@ SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${S
> >  "
> >
> >  S = "${WORKDIR}/git"
> > +
> > +# unmerged-usr support is deprecated upstream, taints the system and will be
> > +# removed in the near future. Fail the build if it is not enabled.
> > +inherit features_check
> > +REQUIRED_DISTRO_FEATURES = "usrmerge"
> > diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
> > index bb3c59f418..b1358420eb 100644
> > --- a/meta/recipes-core/systemd/systemd_251.2.bb
> > +++ b/meta/recipes-core/systemd/systemd_251.2.bb
> > @@ -12,7 +12,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu
> >
> >  # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
> >  # that we don't build both udev and systemd in world builds.
> > -REQUIRED_DISTRO_FEATURES = "systemd"
> > +REQUIRED_DISTRO_FEATURES:append += "systemd"
> >
>
> We shouldn't need :append here, just go with += "systemd".

Mh I could swear with that I was getting:

missing required distro feature 'usrmergesystemd' (not in DISTRO_FEATURES)

It's in the scrollback, but now it doesn't happen anymore, so I
probably had borken it in a different way. One day I'll get the
appends right on first try, one day...

Kind regards,
Luca Boccassi

