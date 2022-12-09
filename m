Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1C1C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 16:48:14 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.6622.1670604494239513375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 08:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JxwDz/7t;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id q6-20020a4aa886000000b004a083f945a6so761504oom.6
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 08:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v0PtmiHAaxvohnmV7Htm6DagS+/GFFSKTVVugTXdXCw=;
        b=JxwDz/7taw46IYT9thUmt/hYOhhhCP7AKdpqKgEQuELHpxGOpI40Wol33n3TUjDha/
         sqOTG1YLFKa+WU3e03xB6x1v+rN2FciTLE453b6HNlR9FmoKPRnhAAQnisgW9lIrGb20
         y9eKRytupjbNl4STntgsU7IlAnVDFxO3LhVknpEw7qIjbPJQ53gknHUMB6kIa+bppAT2
         8LZhMRNYW1vAdWve4vaUywEvOc0O/uK0ugPLxxFvjno/PchmJEAwj3QUhc2OOKN8hhXm
         e9AvNN+UND0ZBXWqUc3SXLFcw79SoCKBVM1/8ZAft/zW3DK781hCC6sEp3X+qmnbd/gM
         9TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0PtmiHAaxvohnmV7Htm6DagS+/GFFSKTVVugTXdXCw=;
        b=IJTqp23+qzXdfhbO5KT8rSvKOTTyKZtYlp441j1BMIryTsiKXzUeaV2TjepKdxD/9F
         KTFJxSK9CjPCPcwf8M90JORGxaOZLJqcphUDjMXKINwJWJSIKtk61D6XdItoHCYxlay6
         Uh/XUZE2Ip8u96A4vhDECYTGheuRcCBqV43fK+3TLJzrEKrkZb2yuVLPinS+CxQjsjyp
         Ys7hnjfFFkhKuuNvPoNh1ZoU+n6zyDvLKDtaD2lzMl2Nr9wxmuBzCRGy02qatr3C2Yb3
         FJhFxCzzM5cipJh9yLH92I8T2o9Iqh13VrqKFJiQJ1hYsXbLW1w1SMjOkCvt7bwsHfXR
         GzYg==
X-Gm-Message-State: ANoB5pnp3e0MEFbgw36M8kCbY7b4qzWHB+0PweoQy2kA9KcyElL8GtfK
	zAqrNs5vnrQlAmh01ZILDMN/J8rt3FK7Q90+mf/s9ybgT54=
X-Google-Smtp-Source: AA0mqf54GrLDY5h1C/sFFLGCSRFeEttfhokNyI6Y3l7j7yp5M2okoIHqVNg7iStsFi3dklsoMS6Cv1mbJrgJ4HYUSyU=
X-Received: by 2002:a05:6820:131:b0:4a3:6eb4:2129 with SMTP id
 i17-20020a056820013100b004a36eb42129mr2405905ood.9.1670604493319; Fri, 09 Dec
 2022 08:48:13 -0800 (PST)
MIME-Version: 1.0
References: <20221208071136.1967696-1-olani@axis.com> <20221208071136.1967696-4-olani@axis.com>
 <08c1f279-d446-bc7c-f01d-4ebfb1da51d8@gmail.com> <jwq5yekdg24.fsf@axis.com>
In-Reply-To: <jwq5yekdg24.fsf@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2022 08:47:47 -0800
Message-ID: <CAMKF1so_bqFoQSE1t_ONA_0M2Y_2muJtoEtOnGbO7mYN4E2OOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 16:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174468

On Fri, Dec 9, 2022 at 2:31 AM Ola x Nilsson <ola.x.nilsson@axis.com> wrote:
>
>
> On Fri, Dec 09 2022, Khem Raj wrote:
>
> > Thanks for the patches
> >
> > On 12/7/22 23:11, Ola x Nilsson wrote:
> >> Signed-off-by: Ola x Nilsson <olani@axis.com>
> >> ---
> >>   meta/conf/distro/time64.conf | 23 +++++++++++++++++++++++
> >>   1 file changed, 23 insertions(+)
> >>   create mode 100644 meta/conf/distro/time64.conf
> >>
> >> diff --git a/meta/conf/distro/time64.conf b/meta/conf/distro/time64.conf
> >> new file mode 100644
> >> index 0000000000..99eb06dc0f
> >> --- /dev/null
> >> +++ b/meta/conf/distro/time64.conf
> >> @@ -0,0 +1,23 @@
> >> +GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> >> +
> >> +# TODO: Only for 32-bit architectures?
> >> +TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
> >> +TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
> >> +TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"
> >
> > We should enable it across all 32bit systems
> > something like
> >
> > TARGET_CC_ARCH += "${@'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64' if
> > d.getVar('SITEINFO_BITS') == '32' else ''}"
> >
> > would do it.
>
> I was looking for a way to identify 32-bit platforms but did not find
> SITEINFO_BITS.  I'll look into using that instead.
>
> > Also adding -D_LARGEFILE_SOURCE will ensure needed functions that LFS
> > needs is enabled as well, usually its automatically defined when
> > -D_GNU_SOURCE is set but that may not be case all the time.
>
> As far as I can tell, _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE are
> independent of _TIME_BITS=64 and _FILE_OFFSET_BITS=64 (while
> _TIME_BITS=64 requiress _FILE_OFFSET_BITS=64).
>
> I thought the _LARGEFILE* options were controlled by the largefile
> DISTRO_FEATURE but there seems to be some confusion about that.
>

this was transitional it was removed because we wanted to enable it
globally by default
however, we might want to add --enable-largefile unconditionally to
autotools.bbclass
for some autotooled packages which still need it for others we have to define
-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64, in this case 64bit off_t
is common need between both LFS and 64bit time_t

Also see this discussion on same topic
https://sourceware.org/pipermail/libc-alpha/2022-November/143386.html

> It looks like you (Khem) made largefile default instead of using the
> distro feature in all of the OE-core recipes, and the largefile distro
> feature is no longer mentioned in docs.  It is mentioned as removed in
> the transition notes.  But it is still in poky-tiny.conf and
> POKY_DEFAULT_DISTRO_FEATURES.  Probably an oversight?

yes seems so, it should be removed from there.
>
> I do not see the _LARGEFILE*_SOURCE options defined globally anywhere.
>
> Am I missing something?

most of packages are enabling it indirectly via enabling _GNU_SOURCE macro
on glibc systems. So we are fine but it will be better to be explicit about it.

>
> >> +
> >> +GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
> >> +GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
> >> +# pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
> >> +# both 32 and 64 bit file APIs.  But it does not handle the time side?
> >> +# Needs further investigation
> >> +GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
> >> +GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
> >> +
> >> +INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_libstd.so]
> >> = "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioctl
> >> lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
> >> +INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] = "fcntl fstat64 prctl stat64 clock_gettime"
> >> +INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] = "fcntl lstat64
> >> setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm
> >> fstatat64 prctl mktime gmtime_r recvmsg stat64 clock_gettime
> >> localtime_r"
> >> +
> >> +# libpulsedsp.so is a preload-library that hooks libc functions
> >> +INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] = "setsockopt fcntl"
> >> +
> >> +
> >>
>
> --
> Ola x Nilsson

