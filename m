Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0C39E7F455
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 16:31:30 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f5so20934982ljg.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7Lvd7I44N4GF8sVFu4pkC9Zu3DvDnaSdn7rndVYi/Go=;
	b=pZKKNv/lAvjoHceiqzpFRhdoEX9DsWAvYgkSqZsOqN7RvGV7zX0fqGaiEPZkx/DzVq
	wZBeVD+SiB8Yhs9MqgjBRjcaWfCjJszRbnrAWPwIlN4i4Mn3FZjr6LRN/ZNulOHUnSnF
	TpiRs5jChk22BuCP9CZMMz1RY74ETp013ZeGPy2XC1SwK6M5O+eOuvNuBSqyO0wVAtDv
	L5fPSmIfjmCF7KbDnFcupSISGuKDoxWSxjEe1adZS1Yv8dCy05A71X4IhpNAKD0k1/ui
	Pj8gm5Dk9jQmLmyO4dbe9dIqQFduYj2SiG4ZtFljoANDUtpoXGj6/RGQBpsM3JZokoZ+
	eqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7Lvd7I44N4GF8sVFu4pkC9Zu3DvDnaSdn7rndVYi/Go=;
	b=d9LhwZLsEclofZsHr04h3jYl/X7zhezplKl6A0ZKld47hPsQqA46s9Nfx0ors7uCi2
	x49byqGntS90arnHDr8AgBK/NlRw54NhnaeLjSqvEBfZTOuch7O8grWfTRPUEtlnBfOE
	zlSy1d7T1DaeAWwWfwiZkl3l3mE/ZwUWHPNF9c82zWxnnLRkf2G9iDQfXmzpup/e55QY
	OV+dDszMG813yfIpcxPrk2cMpfxccplPGl69+4ewHzoULFpFsAgfPOABdqAaxpn1iuzz
	5G7Vz+OVgr+GtYQMWoCXXudwz/7qGuOdM87pX5O6r5X7U+3ihBO5q6daa9XKOv49r5ld
	dFgQ==
X-Gm-Message-State: APjAAAVbkx9qu1CwRZiFQPGEfmQWRYX3vGFy19H8B2ltNklQ1DD9kApI
	ASM98iCnuzNXpFl7pjBM3qy2FmJlD0XRIh1X6Ws=
X-Google-Smtp-Source: APXvYqxwbmvov16rkh7iwMGdV1rKvmxiy6Cv7INOWSu3R/2qytYnXTefcO9fIu5F0+7PTYV4eUzaKm1uM/tzmeSqufk=
X-Received: by 2002:a2e:9449:: with SMTP id o9mr1780443ljh.110.1571157091444; 
	Tue, 15 Oct 2019 09:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190802023302.28370-1-bruce.ashfield@gmail.com>
	<9b6d2e15-1561-a13d-7337-afb4c8f63608@windriver.com>
In-Reply-To: <9b6d2e15-1561-a13d-7337-afb4c8f63608@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Oct 2019 12:31:20 -0400
Message-ID: <CADkTA4NqO7YZrR_Aioy32B18veCTQNNsMOkYrLzJgb3zA9SNqw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-dev: bump to 5.3-rcX
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2019 16:31:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 15, 2019 at 12:25 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 8/1/19 10:33 PM, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >   meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>
>
> > index 8c83620d39..96117ccf3f 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
> >   SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >   SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >
> > -LINUX_VERSION ?= "5.2-rc+"
> > +LINUX_VERSION ?= "5.3-rc+"
> >   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
> >   PV = "${LINUX_VERSION}+git${SRCPV}"
> >
> >
>
> Should this recipe be dropped from releas branches such as
> warrior and zeus?

I wouldn't bother, since it has never caused any issues in the past.
If someone wants to worth with a newer kernel on an older branch, it
provides a mechanism to do so. We get patches from time to time as
people do try and use newer kernels on those branches, so it isn't
uncommon.

Bruce

>
> Doing so would ensure that users understand that the -dev kernel is
> really only for development on the master branch.
>
> --
> # Randy MacLeod
> # Wind River Linux



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

