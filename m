Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.6532.1592484424594079427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 05:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YBGxFYEZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id w16so6264078ejj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iG+N7mWortUC3Iy/zderiv9pEaWFk3Q4ZFn33otXzgI=;
        b=YBGxFYEZh4gIOxU7BhygWelmP83f2iLQuItVLM9b/9pxNLqfp6BaAv7v6dx4H5lYGM
         i8yPxzBJx3g1oFUKkqeOcpXRxT14TbTiHXzQonT3EpIvfu+F/t1ePLPc88X0MVHyVhjm
         342t4YAQqRabClpHrSbzt29jFnDBcQbR+oWmPcRM6Fu36JSHBfcRV46lRJWQXsXWgPJ/
         /vEXbYmVASiA+Z9xS4m7T/d1fR1pAQeFHHYRq+LSgIFPz3l6FDLIzz6NsM52OUNhxfNm
         Dg5Ll4cyr/uwk8UhWSikAwa6hUFEh/nZDTzsw/FNjLEzM2DbtLO6XBYJ18gIk9FZw1lu
         7Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iG+N7mWortUC3Iy/zderiv9pEaWFk3Q4ZFn33otXzgI=;
        b=Nou3C2RNoUxDJW1eF+bvZion+4FAqpGPEKNLH837HW5ivcBSPleNvbGUJ0ut7eJA1t
         GIiF2ybyA4G8nfp4oEeMWuOgQJJHwCWEzk3W6tKxw1Qmd6PBDGg/3VzS3hYd4fAm9EOW
         odIQfKKzo/Ik0nM5vQOCv2YDu+8wsw1bdoNkhcN5q1z/6ZpobUxj6Ss9GeM/VxXxUOAT
         /oHrvxXM4ug7T33bixlgOJq1WXT6Qy0+yt15scuuIBk2f8j8iW5b4AduXmaRnf7HdWEv
         AmJGggcZvdbLDG+ucI1VYeTwtRt4fpHYHKsZX5rFMsZcByTm/KzuedPIGEUZkzokUNJj
         nJzg==
X-Gm-Message-State: AOAM530Efd0YAJAx1mHk6zdSe5+YN2IXBU3b0GtTQ2Y3ADW2Sy78A1nH
	sNbhuEj+weOdZDIuToGhrV6WRNJg31YjDB07By8=
X-Google-Smtp-Source: ABdhPJywfzKmwiYQvjGHlNMctSIztbsFw/pQxEnJ5do+2fuG3sVRb7Gw+94rartQLSm/aKL7xTbCI1FVbfhug0STcT8=
X-Received: by 2002:a17:906:5fcd:: with SMTP id k13mr3645404ejv.459.1592484423025;
 Thu, 18 Jun 2020 05:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200617062028.5542-1-yanfei.xu@windriver.com>
 <20200617062028.5542-2-yanfei.xu@windriver.com> <CADkTA4PiqVvnmZFEoBSTX1g7JxpqAkRQbAozScYtOWJ_6omQBg@mail.gmail.com>
 <c80a8d8c-1f18-198d-4d27-8c75fc113608@windriver.com> <1619A402D254EBD8.22873@lists.openembedded.org>
In-Reply-To: <1619A402D254EBD8.22873@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 18 Jun 2020 08:46:51 -0400
Message-ID: <CADkTA4N33NWxdgMFecoVk8UdtJQrsXjq1ZARWa8xfe=cj-pUbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] classes/kernel: Use a copy for kernel*.rpm when fs don't support symlink
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Xu, Yanfei" <yanfei.xu@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, He Zhe <zhe.he@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 18, 2020 at 8:44 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Thu, Jun 18, 2020 at 2:49 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
> >
> >
> >
> > On 6/17/20 9:48 PM, Bruce Ashfield wrote:
> > > On Wed, Jun 17, 2020 at 2:20 AM <yanfei.xu@windriver.com> wrote:
> > >>
> > >> From: Yanfei Xu <yanfei.xu@windriver.com>
> > >>
> > >> Some filesystems don't support symlink, then you will get failed when
> > >> you install or update the kernel rpm package. Now we use a copy for
> > >> these filesystems instead of symlink.
> > >>
> > >> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> > >> ---
> > >>   meta/classes/kernel.bbclass | 11 ++++++++++-
> > >>   1 file changed, 10 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > >> index 41101a64a0..e9b5a84de7 100644
> > >> --- a/meta/classes/kernel.bbclass
> > >> +++ b/meta/classes/kernel.bbclass
> > >> @@ -94,6 +94,14 @@ python __anonymous () {
> > >>           d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
> > >>           d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
> > >>           d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
> > >> +        d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,typelower), """
> > >> +set +e
> > >> +ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
> > >> +if [ $? -ne 0 ]; then
> > >> +    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlink, then use a copy."
> > >
> > > This could say "... doesn't support symlinks, falling back to copied
> > > image (%s)" (and fill in the image file we are actually using).
> > >
> > This discription is more clear. I will rewrite the message.
> > >> +fi
> > >
> > > I expected to see the fallback copy here in the postinstall, but this
> > > looks ok to me .. I'm going to just type in my process of reading the
> > At the beginning, I was going to only place versioned-image in rpm
> > package, then make symlink or copy in postinstall on target. But it will
> > cause rpm package don't contain no-versioned image. However, ARM device
> > may use the no-versioned image for booting in boot partation. So I
> > didn't implement it like that.
> > > patch so you can correct me if I'm wrong.
> > >
> > > The logic is split between the two places. Below during the build
> > > (do_install), and here in the postinstall.
> > >
> > > In do_install(), we no longer symlink, but instead copy the versioned
> > > image into the non versioned 'image' file. And then in the
> > > postinstall, we try and make a symlink (which may fail) to the same
> > > thing (the versioned image to a non versioned one), and that's a force
> > > symlink so it will clobber the previously copied one if possible, or
> > > implicitly fall back if the symlink fails.
> > Your understanding is right.
> > >
> > > So yes, that logic seems fine to me.
> > >
> > > The reason I went through all that, is that for on-target upgrades.
> > > You won't have the do_install() to place the versioned image, have you
> > > confirmed that the versioned image file is packaged and will be
> > I have confirmed that both non versioned image and versioned image are
> > packaged in rpm package.
> > [bcm_2xxx_rpi4]$ rpm -qpl
> > kernel-image-image-5.4.46-yocto-standard-5.4.x+git0+f8c88c4331_87b52c3030-r0.bcm_2xxx_rpi4.rpm
> >
> > /boot
> > /boot/Image
> > /boot/Image-5.4.46-yocto-standard
> >
> > Besides, I have tested "dnf install" on target, it did place files of
> > package and then run postinstall script.
> > > present on an on-target install ? So the logic is the same with the
> > > symlink ? It should be, otherwise this would never work, but I just
> > > wanted to be sure.
> > > Yes, the logic is the same with the original symlink, hence I also think
> > there is no new bug introduced to on-target upgrades.
> >
> >
> > >> +set -e
> > >> +""" % (type, type))
> > >>
> > >>       image = d.getVar('INITRAMFS_IMAGE')
> > >>       # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
> > >> @@ -386,7 +394,7 @@ kernel_do_install() {
> > >>          for imageType in ${KERNEL_IMAGETYPES} ; do
> > >>                  install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
> > >>                  if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
> > >> -                       ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
> > >> +                       install -m 0644 ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
> > >
> > > Looking at this, can the existing line:
> > >
> > >   install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
> > > ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
> > >
> > > be combined with the one you added ?
> > >
> > > We are copying the non-versioned image into a versioned image file,
> > > and then in the new logic, coping that versioned image into a
> > > non-versioned one. Couldn't we just have one copy of the non-versioned
> > > image, into the non-versioned image in KERNEL_IMAGEDEST ?
> > I don't think it could be. Cause the existing line :
> > "if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then"
> > can't be ingnored.
> >
>
> Ah yes, I suppose so. I never change KERNEL_PACKAGE_NAME, so I haven't
> run into that use case.
>
> The change looks fine to me.
>
> Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Cancel this. I see the v3 will be incoming shortly, I'll re-review then.

Bruce

>
> > Thanks for reviewing,
> >
> > Yanfei
> >
> > >
> > > Cheers,
> > >
> > > Bruce
> > >
> > >>                  fi
> > >>          done
> > >>          install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
> > >> @@ -602,6 +610,7 @@ pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
> > >>          fi
> > >>   }
> > >>
> > >> +
> > >>   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
> > >>
> > >>   python split_kernel_packages () {
> > >> --
> > >> 2.18.2
> > >>
> > >
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
