Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9AFC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 18:03:36 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.30492.1644429815195508124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 10:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JU44uduG;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id m4so9624624ejb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 10:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zLL4QQ32ejnBXKo//o8LhQiyX2mH6xw+CHOtKQzIP/E=;
        b=JU44uduGByoHtcw0+9PFoVdbblebuD9Mw6pVD0U0cXXijZy+GRxf16C/On25ZzkIi0
         xDIQwPV+ZfvuQ9gnQrbs+PfXPnbdCqs4O+s18VkYHvX3cdudCD5eoINJ19TUN6nqxIjJ
         2+A0WTXvI/FtYDgzEkns/Hj33DShgMMQoKKGIYGcpBYRvZa1foIucz0grI10uzbAMqi6
         bejI0GNPa/wYG2D9afxU6Oz7VB7ist6eS3JvYfq8R/JA6yRwpwQRE2iSQiwp+D2POS4l
         gjvDoxC1YEoVK72lX25WECrWBZnaP35xUsa3XnvXPkh9VJtd0jD9bDyPx5YM48DvQ0eZ
         DMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zLL4QQ32ejnBXKo//o8LhQiyX2mH6xw+CHOtKQzIP/E=;
        b=PhvAUaGrxjSukxNnw4KYayGn+ns3n4Z5JSz6n3aTPeoWk+K+kN/NGgDET2Njcg0F9t
         /SKHAUXRlYYMFFlKZKqZFLy0yG1P19Q2YwaABTMGvurXMknMzTV+8bCiELd/KqHSeHSC
         m5TwCb4ukqb5u1Kr5MzyW70bdEsF+w1JcPs1TMvCE7bZ1vQrgo1TKBb6bztR+ESCwB+6
         pb36PqHQmWuEfZso2cAMeAhlP8ps4SXGXxUsAxEqGuOcX/qoTwoQAsZjExqg8gAafptv
         8kH1JIPN5w3P8MX0bZwxMo7IozovEwhkculBfORfq4+qpgrkoEqQB03qWCt/QJQvfsSw
         fuiQ==
X-Gm-Message-State: AOAM532vXBus1cgEcVSd0D9tvnkGjEJziWjpbX1OQo6w2XaIeRqCfazs
	IjVI+GQVwCN4fSbKjLQlyRBN5l/kyK9CcGVoQH0=
X-Google-Smtp-Source: 
 ABdhPJx0vSTWOeqY6ogSGdpeqVmHl8PHDpccJy8eT9MwRVkZJUSY+2++Ix9YWUbVmmHlzNi3Gb4t+p6mG/6N8iZ6NYI=
X-Received: by 2002:a17:906:491b:: with SMTP id
 b27mr3128800ejq.141.1644429813268;
 Wed, 09 Feb 2022 10:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20220209173036.3823144-1-ross.burton@arm.com>
 <20220209173036.3823144-2-ross.burton@arm.com>
 <CADkTA4NG8wAoMQtpwbvf2hia23JnGsbboERY4H61GxMpyms5JQ@mail.gmail.com>
 <CAMKF1sqpxq1UX7wtDw1oOJS8V3Z30FuSV7XA1cNscOMLgA4k7Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqpxq1UX7wtDw1oOJS8V3Z30FuSV7XA1cNscOMLgA4k7Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 9 Feb 2022 13:03:22 -0500
Message-ID: 
 <CADkTA4PJ8CWwUooZQvhLZAcV28ZNsv=ae9Rh2O4ZgYy0G3YsvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] kernel-module-split: modules should
 recommend the kernel image
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 18:03:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161585

On Wed, Feb 9, 2022 at 12:57 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Feb 9, 2022 at 9:36 AM Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
> >
> > On Wed, Feb 9, 2022 at 12:30 PM Ross Burton <ross.burton@arm.com> wrote=
:
> > >
> > > Currently each split-out kernel module RDEPENDS on the top-level kern=
el
> > > package (e.g. kernel-5.15-yocto-standard). Whilst at first this seems
> > > correct, as modules obviously need their matching kernel, there are m=
any
> > > situations where the kernel is provided out-of-band and forcing the
> > > kernel in via RDEPENDS in the wrong thing to do, for example an
> > > initramfs really shouldn't contain a kernel image, but can contain
> > > kernel modules.
> > >
> > > Change the module splitting logic to use RRECOMMENDS instead of
> > > RDEPENDS, and tighten the dependency to kernel-image instead of kerne=
l
> > > to pull in just the image, which also means PACKAGE_EXCLUDE =3D
> > > "kernel-image-*" is sufficient to ensure the image doesn't get pulled
> > > into an image.
> > >
> >
> > As much as I hate to suggest it, I think the strength of the image
> > dependency needs to be configurable. I know of situations were
> > rrecommends are disabled AND they use quite a few out of tree
> > modules. While I can't say that they are counting on RDEPENDS
> > heavily in this situation, I also can't rule it out .. so this is a bre=
aking
> > change in behaviour for those configurations.
> >
> > That being said, if RP doesn't want/like a conditional at this particul=
ar
> > spot, I can understand that as well .. and am happy to be ignored
> > in that case :)
>
> I see that this change eases container image generation. I would be incli=
ned
> to support this change.

To be clear, i think the change is fine as well .. I'm simply saying,
it should be configurable, as we are potential breaking the existing
use case for another.

Cheers,

Bruce

>
> >
> > Bruce
> >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta/classes/kernel-module-split.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/=
kernel-module-split.bbclass
> > > index a29c294810e..4429fee4b51 100644
> > > --- a/meta/classes/kernel-module-split.bbclass
> > > +++ b/meta/classes/kernel-module-split.bbclass
> > > @@ -175,7 +175,7 @@ python split_kernel_module_packages () {
> > >      module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX=
')
> > >      module_pattern =3D module_pattern_prefix + kernel_package_name +=
 '-module-%s' + module_pattern_suffix
> > >
> > > -    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/=
modules', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descr=
iption=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursiv=
e=3DTrue, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_n=
ame, kernel_version))
> > > +    modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/=
modules', file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, descr=
iption=3D'%s kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursiv=
e=3DTrue, hook=3Dfrob_metadata, extra_recommends=3D'%s-image-%s' % (kernel_=
package_name, kernel_version))
> > >      if modules:
> > >          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> > >
> > > --
> > > 2.25.1
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#161577): https://lists.openembedded.org/g/openembed=
ded-core/message/161577
> > Mute This Topic: https://lists.openembedded.org/mt/89026749/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

