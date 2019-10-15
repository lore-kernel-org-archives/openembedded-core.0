Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7665A7F455
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 16:36:44 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id j19so20977148lja.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eCVtaD+WgdZ5i+772r3+2+4qK276NDn7NrIuo9LG2C4=;
	b=G/dbl3olyq6lsRbhgeOWZVrNj//uqF2oVMvEXUAGjJyCatW8mDBh262x6mYXndYAfg
	kngrg2ddIfUPS/xQjL7Xbvxcc1PLj4k0gMT1avULvOsG4U8BhU4DM3lD0d3vKzZ6R1sQ
	469tln44+kRNmBn/Lt26RsGkPOuHgnlXVmrj3yL9DOwP5Fo1OFeue/4A3S1NEbQ40X4b
	rntzCs2+A6MLUV5PXcMWUXM/uceABOgJEJH+Ply82TK5WQgNFZhLYAt6YTYIv7WhVCDd
	Eg/d34/I+KntxcGazn2yEud32AlPtaUnpmg9VszoRYKBsheFSJeDY+84W18jxX231t2N
	kqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eCVtaD+WgdZ5i+772r3+2+4qK276NDn7NrIuo9LG2C4=;
	b=pUoB8NX3wYKOcgaDOVNGo0wE4V/Z8PI7bgVBJ2BaiEVd1FSx1rh7Ol6ERFlpNZw7K9
	FL4UWTPepL3Pvezg3hAzqQlGPBcb1A3zioH2IzS2w7kP5oZ8b4aicBT578K+3a8aBBcR
	zm5wDgacbS/kAFV1tcDL9vITSJLpxdxHwbZKLDPYAzsqxP3BS2ZpceRv0SGErWPAz6v5
	w+7Mx3yuADt6gDhYOr5QK7lslMgdUivN8J8LUJ5ic3xcM903jUAWvPx4l3Zqe1dMZORK
	qOywq5Wd6q5JiJQOqvIXiNtGTfTCvCflDVM5JnAroAJGo4cICipCv4yotpK+Rw80yna0
	wnNA==
X-Gm-Message-State: APjAAAVR2A6pLvwZhE29NXP/WwTv/GPjmlKzHaYv0zpdoWI/UIckB3j2
	ro+3QmcE7tnHa3QmPC2X+2u7qjDO27ToewpuMyc=
X-Google-Smtp-Source: APXvYqzKILhJJLL0uEyn2Es8KJbI63+LexBpb7yrX81jCPqc9s9mPrjLTLfW0QKtrakHxwuP6x2KbKbWktEexA/RZ/Q=
X-Received: by 2002:a2e:63c7:: with SMTP id s68mr23393863lje.244.1571157404869;
	Tue, 15 Oct 2019 09:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190802023302.28370-1-bruce.ashfield@gmail.com>
	<9b6d2e15-1561-a13d-7337-afb4c8f63608@windriver.com>
	<CADkTA4NqO7YZrR_Aioy32B18veCTQNNsMOkYrLzJgb3zA9SNqw@mail.gmail.com>
In-Reply-To: <CADkTA4NqO7YZrR_Aioy32B18veCTQNNsMOkYrLzJgb3zA9SNqw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Oct 2019 12:36:33 -0400
Message-ID: <CADkTA4Mh=nsPxkZnP6MPfPHaDGh8uAPc_=yyEKj_u1A0AY7m7w@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Oct 2019 16:36:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 15, 2019 at 12:31 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Tue, Oct 15, 2019 at 12:25 PM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
> >
> > On 8/1/19 10:33 PM, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >   meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >
> >
> > > index 8c83620d39..96117ccf3f 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
> > >   SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> > >   SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> > >
> > > -LINUX_VERSION ?= "5.2-rc+"
> > > +LINUX_VERSION ?= "5.3-rc+"
> > >   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
> > >   PV = "${LINUX_VERSION}+git${SRCPV}"
> > >
> > >
> >
> > Should this recipe be dropped from releas branches such as
> > warrior and zeus?
>
> I wouldn't bother, since it has never caused any issues in the past.
> If someone wants to worth with a newer kernel on an older branch, it
> provides a mechanism to do so. We get patches from time to time as
> people do try and use newer kernels on those branches, so it isn't
> uncommon.

That being said, if someone wants to delete it on the release branches
(or suggest another mechanism to inhibit it on non-master), I wouldn't
object either

Bruce

>
> Bruce
>
> >
> > Doing so would ensure that users understand that the -dev kernel is
> > really only for development on the master branch.
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

