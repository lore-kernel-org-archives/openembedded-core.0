Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.5506.1593693487668613747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 05:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FqxisZq5;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id h28so23599872edz.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 05:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QhqmpO5LkQHAqyzphamkXkuIboz/zOQyLFeQAmIdrsE=;
        b=FqxisZq5XjgPTNakguLcVzEmopgz/qW+kIlI1F78eBHWRqBBHJ6cGFrwjn3SjPsPkA
         YkkjRMDlFaHbHedvGR7XPkIjMDzcHi8aZqIu4hamwpK8D8MIO8pcugawPsPlDp6espXf
         DqTDFMyew1jeGNoi4kJhck5kap14oRbQRye5WuW6GnX8pN6/aK8H2IupKOf98PjKfauL
         8sKbeeWww6k+Erx2k5EBsvKqpwn9JkRVlWpV8NWeCGAOjFL6ZtaFWVw4tOswOVOb5opK
         /cFA/+JXccqRWrmWK+SBwrt40BysSQUemNQkBsn4wkW6MeuSV2E78ASuaImn3Hxamu09
         OjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QhqmpO5LkQHAqyzphamkXkuIboz/zOQyLFeQAmIdrsE=;
        b=gILqYgVQZVlt/QqS9GLHgbWCGBMzucCBdpUPlyQQuoR5O2aUHOikLJRjvycjilZOhF
         lap632svL2AJkPnhYDCSU3XXMSK3c53yPfpsv2olXc4hcac8UebwUEwpmIYOd96LBe5s
         SejeY5Gc7/R3m515FNnjTM5sljIh2McQF15iCfQauJc+ER0sXH+0Z3fe/IIvZ45m59m2
         H8E6yFvYwyTcK8/v2DJQpLQnLA6LxsKBeAQE5Zt4iQsHJj0Uzdoov5bDLcFcwrq5THql
         Pi4QFID7ZCaZfKtx51FjWotPYRK8YN6qJ7S50J1KBEBMC6BOqIMwfOg/mShAXA02QGCy
         faUw==
X-Gm-Message-State: AOAM532t7HjsgInYepXZXFVcdAYLnmpREFrZ9iVEQlOysjjHrAZN4cOj
	HZVPw1L0hcsYPBJ9tQiWLT2IcgEkfih3l1PKB50=
X-Google-Smtp-Source: ABdhPJyx1YBivhlcU1T4UCnW4ilX3DV3zvJ54Q2jd239WnqmLJiIOs8f9XNl0B3C5OPFx+ZepEUumOLTvn29/FCeUhw=
X-Received: by 2002:a50:e04e:: with SMTP id g14mr29482094edl.352.1593693486028;
 Thu, 02 Jul 2020 05:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200619114727.40142-1-yanfei.xu@windriver.com>
 <20200619114727.40142-2-yanfei.xu@windriver.com> <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
 <144b99d5a5b327d660925ff5ee18139d7dc088c3.camel@linuxfoundation.org>
 <7d7b57ca-5419-971d-6701-4cd2e8958960@windriver.com> <b456775facefdc593552db94bf2de51f5725aa97.camel@linuxfoundation.org>
 <77c7e877-527a-3e39-ad58-2b34c4cffa05@windriver.com> <764ae03515c1e73c6eaa394a68b4b98877b38577.camel@linuxfoundation.org>
 <777044a4-8a9b-ea9b-fc05-636caa004c3d@windriver.com> <d2119fa2-2d1f-27c6-bf73-055422e6819b@windriver.com>
 <CADkTA4NHXAF3Hfm9ryw5OvrM+pFM3FTjQNpvhpGfTyiiYEDb8g@mail.gmail.com>
 <ec894ebd-6116-4e68-04b3-6be656108405@windriver.com> <992d7721671aa464f6a59209d0346a55dc569db6.camel@linuxfoundation.org>
 <ac5b5d5b-13df-5c4b-b293-fd0965e508ff@windriver.com>
In-Reply-To: <ac5b5d5b-13df-5c4b-b293-fd0965e508ff@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 2 Jul 2020 08:37:54 -0400
Message-ID: <CADkTA4Nh8n6N-xb=oMe4SUpE_-zX4Sx0gQAFVLz994C9rGip6Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2020 at 5:49 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
>
>
> On 7/2/20 3:46 PM, Richard Purdie wrote:
> > On Thu, 2020-07-02 at 10:43 +0800, Xu, Yanfei wrote:
> >>
> >> On 7/1/20 9:42 PM, Bruce Ashfield wrote:
> >>> On Wed, Jul 1, 2020 at 4:22 AM Xu, Yanfei <yanfei.xu@windriver.com>
> >>> wrote:
> >>>>
> >>>>
> >>>> On 6/28/20 8:21 PM, Xu, Yanfei wrote:
> >>>>>
> >>>>> On 6/25/20 12:18 AM, Richard Purdie wrote:
> >>>>>> On Wed, 2020-06-24 at 23:57 +0800, Xu, Yanfei wrote:
> >>>>>>> On 6/24/20 9:08 PM, Richard Purdie wrote:
> >>>>>>>> On Wed, 2020-06-24 at 09:47 +0800, Xu, Yanfei wrote:
> >>>>>>>>> On 6/24/20 5:51 AM, Richard Purdie wrote:
> >>>>>>>>>> On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield
> >>>>>>>>>> wrote:
> >>>>>>>>>>> On Fri, Jun 19, 2020 at 7:47 AM <
> >>>>>>>>>>> yanfei.xu@windriver.com>
> >>>>>>>>>>> wrote:
> >>>>>>>>>>>> From: Yanfei Xu <yanfei.xu@windriver.com>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Some filesystems don't support symlink, then you
> >>>>>>>>>>>> will get
> >>>>>>>>>>>> failure
> >>>>>>>>>>>> when
> >>>>>>>>>>>> you install or update the kernel rpm package. Now
> >>>>>>>>>>>> we use a
> >>>>>>>>>>>> copy
> >>>>>>>>>>>> of
> >>>>>>>>>>>> image for these filesystems instead of symlink.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Suggested-by: Bruce Ashfield <
> >>>>>>>>>>>> bruce.ashfield@gmail.com>
> >>>>>>>>>>>> Suggested-by: Richard Purdie <
> >>>>>>>>>>>> richard.purdie@linuxfoundation.org>
> >>>>>>>>>>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com
> >>>>>>>>>>>>>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>>       meta/classes/kernel.bbclass | 19
> >>>>>>>>>>>> ++++++++++++++++---
> >>>>>>>>>>>>       1 file changed, 16 insertions(+), 3
> >>>>>>>>>>>> deletions(-)
> >>>>>>>>>>>>
> >>>>>>>>>>>> diff --git a/meta/classes/kernel.bbclass
> >>>>>>>>>>>> b/meta/classes/kernel.bbclass
> >>>>>>>>>>>> index 20a0135fc9..1269b54343 100644
> >>>>>>>>>>>> --- a/meta/classes/kernel.bbclass
> >>>>>>>>>>>> +++ b/meta/classes/kernel.bbclass
> >>>>>>>>>>>> @@ -94,6 +94,22 @@ python __anonymous () {
> >>>>>>>>>>>>               d.appendVar('RDEPENDS_%s-image' %
> >>>>>>>>>>>> kname, ' %s-
> >>>>>>>>>>>> image-
> >>>>>>>>>>>> %s' %
> >>>>>>>>>>>> (kname, typelower))
> >>>>>>>>>>>>               d.setVar('PKG_%s-image-%s' %
> >>>>>>>>>>>> (kname,typelower),
> >>>>>>>>>>>> '%s-
> >>>>>>>>>>>> image-
> >>>>>>>>>>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname,
> >>>>>>>>>>>> typelower))
> >>>>>>>>>>>>               d.setVar('ALLOW_EMPTY_%s-image-%s' %
> >>>>>>>>>>>> (kname,
> >>>>>>>>>>>> typelower),
> >>>>>>>>>>>> '1')
> >>>>>>>>>>>> +        d.setVar('pkg_postinst_ontarget_%s-
> >>>>>>>>>>>> image-%s' %
> >>>>>>>>>>>> (kname,typelower), """
> >>>>>>>>>>>
> >>>>>>>>>>> You were previously concerned about boot issues if
> >>>>>>>>>>> the
> >>>>>>>>>>> unversioned
> >>>>>>>>>>> image link/copy was deferred until boot. I don't
> >>>>>>>>>>> see a
> >>>>>>>>>>> summary of
> >>>>>>>>>>> why
> >>>>>>>>>>> that's no longer a concern in the v3 of the patch.
> >>>>>>>>>>> Can you
> >>>>>>>>>>> confirm
> >>>>>>>>>>> that it isn't an issue ? Is it simply because the
> >>>>>>>>>>> booted
> >>>>>>>>>>> image
> >>>>>>>>>>> isn't
> >>>>>>>>>>> installed via this package, and hence we are fine ?
> >>>>>>>>>>
> >>>>>>>>>> I'm suspecting this patch is why we're seeing
> >>>>>>>>>> selftest
> >>>>>>>>>> failures:
> >>>>>>>>>>
> >>>>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/bu=
ilds/1055
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>> Do you mean this patch has been applied? and introduce
> >>>>>>>>> new
> >>>>>>>>> issues?
> >>>>>>>>
> >>>>>>>> Yes, I reverted it and retested and confirmed this patch
> >>>>>>>> causes the
> >>>>>>>> selftest failure in the link to the build above.
> >>>>>>>>
> >>>>>>> OK, I am trying to analyse the log. But I haven't figured
> >>>>>>> out what
> >>>>>>> cause
> >>>>>>> it fialed=EF=BC=8C and how to reproduce it on my mechine. I'd
> >>>>>>> apprecate any
> >>>>>>> information.
> >>>>>>
> >>>>>> The command to reproduce should be:
> >>>>>>
> >>>>>> oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
> >>>>>>
> >>>>> I've addressed this failure why due to boot partation in wic
> >>>>> doesn't
> >>>>> contain no-versioned image. This result is different from the
> >>>>> previous
> >>>>> I verified, because of the different configuraions in wks.
> >>>>>
> >>>>> "--source" field in wks decides where the files in boot
> >>>>> partation come
> >>>>> from. So no-versioned image may come from ${IMAGE_ROOTFS}/boot
> >>>>> which is
> >>>>> installed by rpm package. Blow is the wks used by 'oe-selftest
> >>>>> -r
> >>>>> efibootpartition.GenericEFITest.test_boot_efi'
> >>>>>
> >>>>> bootloader --ptable gpt
> >>>>> part /boot --source rootfs --rootfs-dir=3D${IMAGE_ROOTFS}/boot
> >>>>> --fstype=3Dvfat --label boot --active --align 1024 --use-uuid
> >>>>> --overhead-factor 1.0
> >>>>> part / --source rootfs --fstype=3Dext4 --label root --align 1024
> >>>>> --exclude-path boot/
> >>>>>
> >>>>> Hence we still should keep the no-versioned iamge in kernel-
> >>>>> image*.rpm
> >>>>> which is like the previous v2 patch.
> >>>>>
> >>>> Any opinions? It does cause the kernel rpm larger. However, the
> >>>> kernel
> >>>> image is not always large, only a few MB. And it will be changed
> >>>> to
> >>>> symlink when installed on targe. So this patch's only negative
> >>>> effect
> >>>> is the little increasement about update payloads.
> >>>
> >>> I'm trying to follow the description that you had about the
> >>> oe-selftest and I'm missing something.
> >>>
> >>> Can you describe it again ? In a way that someone not familiar with
> >>> that the selftest is seeing as a failure can grok ?
> >>>
> >>> i.e. in the selftest configuration are we not getting the
> >>> (un)versioned kernel image because the symlink (or copy fallback)
> >>> is
> >>> in an on-boot post install hook ? And the test is looking for the
> >>> versioned/unversioned kernel image at image construction time ?
> >>>
> >>> So that leaves us at either installing both the versioned and
> >>> unversioned, or some sort of package install time testing of the
> >>> target filesystem ? Does that partition exist at package install
> >>> time
> >>> ? Is that the approach we tried in v1 of the patch (I know v2 was
> >>> keeping both as copies in the package, and converting it to a
> >>> symlink
> >>> on boot).
> >>
> >> Sorry for the uncleared discription.
> >>
> >> For the os-selftest failure: The failure happened at qemu booting
> >> with
> >> its wic image. Qemu could not find the unversioned kernel image in
> >> wic
> >> image for booting itself ,then caused the test failed.
> >>
> >> Why the booted partition in wic image doesn't contain the unversioned
> >> kernel image? Cause the wks can decide where the unversioned kernel
> >> images in wic image comes from. For this test, it comes from
> >> ${IMAGE_ROOTFS}/boot which is installed by kernel rpm package.
> >> Actually
> >> it didn't get unversioned kernel image because the symlink=EF=BC=88or=
 copy
> >> fallback=EF=BC=89 is in an on-boot post install hook.
> >>
> >> Hence we should keep a unversioned kernel image in kernel rpm
> >> package.
> >> And patch v2 did it.=EF=BC=88 v1 and v2 are similar, but v2 improves =
print
> >> messages.=EF=BC=89
> >
> > This does bring us to a bit of an impasse as I don't really like the
> > idea of duplicating the kernel binaries twice in the packages just to
> > work around fat filesystem limitations.
> >
> > Today its this file, you could argue we have to replace a load more
> > files with duplicate copies and postinstalls which would seem to be th=
e
> > wrong direction to go in.
>
> Yes, I agree that duplicate copies is not a good way to solve these
> symlink problems for normal rpm. Users should be awared the
> disadvantages of vfat filesystem. But kernel rpm maybe more important
> than others rpm? so we could make its compatibility more all-around?
>
> >
> > Which tools does the extraction of the files onto this fat system?
> > Could we ignore the symlink errors there and rely on a postinstall to
> > create if not already created?
>
> It may not. Cause if the extraction of the files runs failed, the
> postinstall of this rpm package won't excute. So...

Is that true even if it is a "normal" post install hook (not the
on-target/boot one, just a standard package post install hook) ?

We can programatically create a package post install the same way the
ontarget one was being created (or at least it was when I last
checked). Wouldn't that make the /boot partition and filesystem
available and before wic runs ? So we could have the "try symlink,
fail to a copy" before anything ever looks for it. It would also cover
the on-target package upgrade path. My apologies if we've already
discussed that, and discarded it due to technical issues.

Bruce

>
>
> Cheers,
>
> Yanfei
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
> >=20
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
