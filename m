Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.21906.1593610950164356896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 06:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DbEdEJrD;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id lx13so6047041ejb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 06:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ws1oBJadWDEPCQzcuYHU9uj2U4Wi0axwBtH3+YBG9Vo=;
        b=DbEdEJrDqfNyqAoKMajnCzW97pdj3nHdCbOYkYRbV1BbyoykDMCxLsL4Gp0kEpbevU
         fHDrJdFYEmyMMvTA8PdSxbd0P+Yyn3IYVmbfL8K3IrmQDUvvKFyC9F8+THjmDaeOe7d9
         VYAjzIuYKAlPf9cFHk+Mbc3MJtNUePzQtDB5j7C4FFoIdN7/Oitk2a1uAKO4kreL4J/3
         XpD9ERw8lQlKUS1x8qZL/BJWj0iWEqDMRRcC6YRZHPjXLyBcR+DRGI8aChcavausoGhN
         4/iA3P+0rYeGt38H57SyaoMbqK5XzTWUhhhVd4p9a8lNXoezMBkeS8ppNUUvCAdoyLYj
         L8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ws1oBJadWDEPCQzcuYHU9uj2U4Wi0axwBtH3+YBG9Vo=;
        b=HSHHReqlkkbCvFcEPJs30G1MxkoS2Vc5I2QxvH+v7KSl0Xlvv/OG3dF5ou029nHyr/
         0VX5CJew3FZ7q6pxL1zKyVYKubXV+V4euVaJgZHiSxqkXBH6pJMl2fNhFVVx3tXnQL5s
         mx3zTTdhkK3w2kPfZkUT2gyWEu8nh0AstiYNQ4haEQzYh8d6MGCOR8tv86UoWO4sT3mU
         V80n/0eLUdImvf9P+afa8cafYiCVlqwIgfYhXCiUNtRszKuLkDy0Cf5MpX8wlUzcMaoV
         o1fRCpxDOHVMszcf0wcdrGXBQDNOWxcC/d4MqgKwmtAtWx5e/SWKdaPO4lPXeU8+HFWI
         o13g==
X-Gm-Message-State: AOAM531GdAWv7rA33dJ+iV+SKVEPrtUu8rkmLSiDWO8Xq4XiUKB/pPe2
	Zrp1Xjx4O6YVzswl3MYwfG7ti3AXC/T/uiKiCYg=
X-Google-Smtp-Source: ABdhPJxUYMJqDGZHO5xNvp5n6WAyxm3CHqzzBfMjfvzIknw/oUdARJPrPj/NVb9yEMOiLsBj+jiwon6DgEixJmw1nIc=
X-Received: by 2002:a17:906:4145:: with SMTP id l5mr22634678ejk.334.1593610948561;
 Wed, 01 Jul 2020 06:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200619114727.40142-1-yanfei.xu@windriver.com>
 <20200619114727.40142-2-yanfei.xu@windriver.com> <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
 <144b99d5a5b327d660925ff5ee18139d7dc088c3.camel@linuxfoundation.org>
 <7d7b57ca-5419-971d-6701-4cd2e8958960@windriver.com> <b456775facefdc593552db94bf2de51f5725aa97.camel@linuxfoundation.org>
 <77c7e877-527a-3e39-ad58-2b34c4cffa05@windriver.com> <764ae03515c1e73c6eaa394a68b4b98877b38577.camel@linuxfoundation.org>
 <777044a4-8a9b-ea9b-fc05-636caa004c3d@windriver.com> <d2119fa2-2d1f-27c6-bf73-055422e6819b@windriver.com>
In-Reply-To: <d2119fa2-2d1f-27c6-bf73-055422e6819b@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 1 Jul 2020 09:42:17 -0400
Message-ID: <CADkTA4NHXAF3Hfm9ryw5OvrM+pFM3FTjQNpvhpGfTyiiYEDb8g@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2020 at 4:22 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
>
>
> On 6/28/20 8:21 PM, Xu, Yanfei wrote:
> >
> >
> > On 6/25/20 12:18 AM, Richard Purdie wrote:
> >> On Wed, 2020-06-24 at 23:57 +0800, Xu, Yanfei wrote:
> >>>
> >>> On 6/24/20 9:08 PM, Richard Purdie wrote:
> >>>> On Wed, 2020-06-24 at 09:47 +0800, Xu, Yanfei wrote:
> >>>>> On 6/24/20 5:51 AM, Richard Purdie wrote:
> >>>>>> On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield wrote:
> >>>>>>> On Fri, Jun 19, 2020 at 7:47 AM <yanfei.xu@windriver.com>
> >>>>>>> wrote:
> >>>>>>>> From: Yanfei Xu <yanfei.xu@windriver.com>
> >>>>>>>>
> >>>>>>>> Some filesystems don't support symlink, then you will get
> >>>>>>>> failure
> >>>>>>>> when
> >>>>>>>> you install or update the kernel rpm package. Now we use a
> >>>>>>>> copy
> >>>>>>>> of
> >>>>>>>> image for these filesystems instead of symlink.
> >>>>>>>>
> >>>>>>>> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>>>>> Suggested-by: Richard Purdie <
> >>>>>>>> richard.purdie@linuxfoundation.org>
> >>>>>>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> >>>>>>>> ---
> >>>>>>>>     meta/classes/kernel.bbclass | 19 ++++++++++++++++---
> >>>>>>>>     1 file changed, 16 insertions(+), 3 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/meta/classes/kernel.bbclass
> >>>>>>>> b/meta/classes/kernel.bbclass
> >>>>>>>> index 20a0135fc9..1269b54343 100644
> >>>>>>>> --- a/meta/classes/kernel.bbclass
> >>>>>>>> +++ b/meta/classes/kernel.bbclass
> >>>>>>>> @@ -94,6 +94,22 @@ python __anonymous () {
> >>>>>>>>             d.appendVar('RDEPENDS_%s-image' % kname, ' %s-
> >>>>>>>> image-
> >>>>>>>> %s' %
> >>>>>>>> (kname, typelower))
> >>>>>>>>             d.setVar('PKG_%s-image-%s' % (kname,typelower),
> >>>>>>>> '%s-
> >>>>>>>> image-
> >>>>>>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
> >>>>>>>>             d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname,
> >>>>>>>> typelower),
> >>>>>>>> '1')
> >>>>>>>> +        d.setVar('pkg_postinst_ontarget_%s-image-%s' %
> >>>>>>>> (kname,typelower), """
> >>>>>>>
> >>>>>>> You were previously concerned about boot issues if the
> >>>>>>> unversioned
> >>>>>>> image link/copy was deferred until boot. I don't see a
> >>>>>>> summary of
> >>>>>>> why
> >>>>>>> that's no longer a concern in the v3 of the patch. Can you
> >>>>>>> confirm
> >>>>>>> that it isn't an issue ? Is it simply because the booted
> >>>>>>> image
> >>>>>>> isn't
> >>>>>>> installed via this package, and hence we are fine ?
> >>>>>>
> >>>>>> I'm suspecting this patch is why we're seeing selftest
> >>>>>> failures:
> >>>>>>
> >>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/=
1055
> >>>>>>
> >>>>>>
> >>>>> Do you mean this patch has been applied? and introduce new
> >>>>> issues?
> >>>>
> >>>> Yes, I reverted it and retested and confirmed this patch causes the
> >>>> selftest failure in the link to the build above.
> >>>>
> >>> OK, I am trying to analyse the log. But I haven't figured out what
> >>> cause
> >>> it fialed=EF=BC=8C and how to reproduce it on my mechine. I'd appreca=
te any
> >>> information.
> >>
> >> The command to reproduce should be:
> >>
> >> oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
> >>
> > I've addressed this failure why due to boot partation in wic doesn't
> > contain no-versioned image. This result is different from the previous
> > I verified, because of the different configuraions in wks.
> >
> > "--source" field in wks decides where the files in boot partation come
> > from. So no-versioned image may come from ${IMAGE_ROOTFS}/boot which is
> > installed by rpm package. Blow is the wks used by 'oe-selftest -r
> > efibootpartition.GenericEFITest.test_boot_efi'
> >
> > bootloader --ptable gpt
> > part /boot --source rootfs --rootfs-dir=3D${IMAGE_ROOTFS}/boot
> > --fstype=3Dvfat --label boot --active --align 1024 --use-uuid
> > --overhead-factor 1.0
> > part / --source rootfs --fstype=3Dext4 --label root --align 1024
> > --exclude-path boot/
> >
> > Hence we still should keep the no-versioned iamge in kernel-image*.rpm
> > which is like the previous v2 patch.
> >
> Any opinions? It does cause the kernel rpm larger. However, the kernel
> image is not always large, only a few MB. And it will be changed to
> symlink when installed on targe. So this patch's only negative effect
> is the little increasement about update payloads.

I'm trying to follow the description that you had about the
oe-selftest and I'm missing something.

Can you describe it again ? In a way that someone not familiar with
that the selftest is seeing as a failure can grok ?

i.e. in the selftest configuration are we not getting the
(un)versioned kernel image because the symlink (or copy fallback) is
in an on-boot post install hook ? And the test is looking for the
versioned/unversioned kernel image at image construction time ?

So that leaves us at either installing both the versioned and
unversioned, or some sort of package install time testing of the
target filesystem ? Does that partition exist at package install time
? Is that the approach we tried in v1 of the patch (I know v2 was
keeping both as copies in the package, and converting it to a symlink
on boot).

Bruce

>
> BTW, should I resend the v2 patch?
>
> Cheers,
>
> Yanfei
>
> > Cheers=EF=BC=8C
> >
> > Yanfei
> >
> >> Cheers,
> >>
> >> Richard
> >>
--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
