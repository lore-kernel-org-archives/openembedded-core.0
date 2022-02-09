Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B67C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:57:24 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.30041.1644429442647023873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f+bB5zTs;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id v10so2434532qvk.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+2irqPmjsgrsiXKLqZfihsdjCfA+xenAxcWRKapr204=;
        b=f+bB5zTs/zuCxxJ4pmoCVJT9tSqU4as+42aMwKEO/s887o31DLnczcmzVMWoT2rtic
         J69KejW4iJ64PY9r8rVWcvhq1T4pG5GdA62MB0yerXimcBnqmq8KuiWx49jl33c+N/It
         9CNzDI3SNrN44+DlFKXB4n8xSUKO9wN1YtO5cqKqUzZW6fTTc7jQL19bgtj7VIF6Xk4b
         9STbFaJ47XY3RD+uwND5GaUsCNEH1zhTADA+dWDj7jkFFXjBkKZU7Rw7Q4gDQ5/nZJp0
         R11J6JvkxCxxTdyHjpTaQZWuTidgE2EY88uUKbXc6ZHbmSSwtvVJsLYdKwEWRzlEv6dL
         2Q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+2irqPmjsgrsiXKLqZfihsdjCfA+xenAxcWRKapr204=;
        b=R9+fC/Ba038Aix1zbOFQMsKXUdo6INwTnMwYk8PlZWY//FY2uSHsSumlSr9iOWdmnh
         OSHhcPv71jmoKhR8iqobT7m+UQJ524SWaimcKTE83zxj70RulTNvUfd8YfaPQ3N8ISSg
         vS2avTtmTOK14YyNIoPF8+q0uVQsqqI8qcDSOhH4L5Q1rINpuahXBp9iUsS8411cRUi4
         Kr9wzoPQSCrDMEbyIbqZppiBoDb3Vn7qRN/N4M0gDW+iKFgSiTZQQwywAl//kbiuym6Y
         P5n/xrWDnRMUTqEz0H0obJPhQyFJhpx+quZh5NYS9bcOtmZlc//kx5Vrk/FqfFN/lxEq
         7mmw==
X-Gm-Message-State: AOAM533exB2uTzGOgFvBrb+NBcDrADCVvimIv7RnSm/QGKXhrSCEXc8c
	okk/vrYAwWeJNsrxfJS+ZkpsCxA7iiWJyYAsojw=
X-Google-Smtp-Source: 
 ABdhPJxuXqUSjvM7uVjs1AcToecm2kecYAPHcpE1YFScPjQ3dUqMYxYMiCHbEmZZELjA/L0ROvfDpUJ7tJITDmGljis=
X-Received: by 2002:ad4:576f:: with SMTP id r15mr2405104qvx.16.1644429441745;
 Wed, 09 Feb 2022 09:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20220209173036.3823144-1-ross.burton@arm.com>
 <20220209173036.3823144-2-ross.burton@arm.com>
 <CADkTA4NG8wAoMQtpwbvf2hia23JnGsbboERY4H61GxMpyms5JQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NG8wAoMQtpwbvf2hia23JnGsbboERY4H61GxMpyms5JQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2022 09:56:55 -0800
Message-ID: 
 <CAMKF1sqpxq1UX7wtDw1oOJS8V3Z30FuSV7XA1cNscOMLgA4k7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] kernel-module-split: modules should
 recommend the kernel image
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:57:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161582

On Wed, Feb 9, 2022 at 9:36 AM Bruce Ashfield <bruce.ashfield@gmail.com> wr=
ote:
>
> On Wed, Feb 9, 2022 at 12:30 PM Ross Burton <ross.burton@arm.com> wrote:
> >
> > Currently each split-out kernel module RDEPENDS on the top-level kernel
> > package (e.g. kernel-5.15-yocto-standard). Whilst at first this seems
> > correct, as modules obviously need their matching kernel, there are man=
y
> > situations where the kernel is provided out-of-band and forcing the
> > kernel in via RDEPENDS in the wrong thing to do, for example an
> > initramfs really shouldn't contain a kernel image, but can contain
> > kernel modules.
> >
> > Change the module splitting logic to use RRECOMMENDS instead of
> > RDEPENDS, and tighten the dependency to kernel-image instead of kernel
> > to pull in just the image, which also means PACKAGE_EXCLUDE =3D
> > "kernel-image-*" is sufficient to ensure the image doesn't get pulled
> > into an image.
> >
>
> As much as I hate to suggest it, I think the strength of the image
> dependency needs to be configurable. I know of situations were
> rrecommends are disabled AND they use quite a few out of tree
> modules. While I can't say that they are counting on RDEPENDS
> heavily in this situation, I also can't rule it out .. so this is a break=
ing
> change in behaviour for those configurations.
>
> That being said, if RP doesn't want/like a conditional at this particular
> spot, I can understand that as well .. and am happy to be ignored
> in that case :)

I see that this change eases container image generation. I would be incline=
d
to support this change.

>
> Bruce
>
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/classes/kernel-module-split.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/ke=
rnel-module-split.bbclass
> > index a29c294810e..4429fee4b51 100644
> > --- a/meta/classes/kernel-module-split.bbclass
> > +++ b/meta/classes/kernel-module-split.bbclass
> > @@ -175,7 +175,7 @@ python split_kernel_module_packages () {
> >      module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
> >      module_pattern =3D module_pattern_prefix + kernel_package_name + '=
-module-%s' + module_pattern_suffix
> >
> > -    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/mo=
dules', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descrip=
tion=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=
=3DTrue, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_na=
me, kernel_version))
> > +    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/mo=
dules', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descrip=
tion=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=
=3DTrue, hook=3Dfrob_metadata, extra_recommends=3D'%s-image-%s' % (kernel_p=
ackage_name, kernel_version))
> >      if modules:
> >          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> >
> > --
> > 2.25.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161577): https://lists.openembedded.org/g/openembedde=
d-core/message/161577
> Mute This Topic: https://lists.openembedded.org/mt/89026749/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

