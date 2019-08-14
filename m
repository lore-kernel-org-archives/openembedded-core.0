Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id E4C1E7EC92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:33:40 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id h15so11524672ljg.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6/2lsM8kxL1KijT1F6wKm6wLGUkeQUgwJlxS0x0Viiw=;
	b=d0ojghqaJWjDJ39QxMolI24Gd+NK4GPoMZrZI3AinfkbbXFd61925ph6HUAPE9Ak8v
	QBU4M44BdoyTuz33Y2wt52jFz7z8LB5mmp0M9SzXkRTxwL4VcZ4Nebi1VDAE5mOduFv8
	G9a/iJnTUpA0kFX5wem3v1+hxDn29XXNC3qzfjLRi24RR1gWa98ckWIo4DUdc7IaYWc8
	TrXLPMLks5ZfsC/ECQy1dseoW7bngOOYOYAIjoSBjcOZUKAAYHvuFmIse1cGoZWL73PH
	hE5buF1uxIo7Lt5BE8LyqGR9oPJRT9cOpP4RAvWDBpLUTKFQ0UrcaDIPzi5hp3hPqYUu
	16Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6/2lsM8kxL1KijT1F6wKm6wLGUkeQUgwJlxS0x0Viiw=;
	b=nnr/3GbASOS3mV12TNPLXhwH6pvfn2HryUD5zORrniXuyj8+6Y49wKRQNwrNnTZZuJ
	kzfv7L6KbpsC6s4nA/yfl03gcupnHQIG8s8szxqjF9++71lT4TX+SxV85b7ivdxt9a7N
	BEeAeAickAK92Mhk0ZaoY6yOhJnKQTgfnfyT+kvTg5iRQ6Y8YuGf1ia5FHIeFta7+i7Z
	U9M7vFfmnGCxLUlrn+vDJTFdotxKjVZnqa252l/Imd9JlRex/gx+a2wHP5jBwTsfmDgT
	hlCo+5Wdq99fLY0JkTWVlRi9TRjYKVd9d44AAhX3pnq9m1Y7+4U/dT4Fbk8NOTe5hjXH
	yLqA==
X-Gm-Message-State: APjAAAUyp4uF5pDEHs5e+ASStA4yMM6URLXH+tDRQigyxV1YNDtVicZp
	fWGlQwDksAOoZvTOi1nW22/qghsUrLCuU7kUHQU=
X-Google-Smtp-Source: APXvYqxfpVxrV3w+Vpe7j9eLm3LEE3NWi/44vfzLtHDeWADmFfGcfjlcG+iBpFP8lhnBjrjCt3IvRc/Vbmy6rI6ye7A=
X-Received: by 2002:a2e:9115:: with SMTP id m21mr195728ljg.232.1565796821262; 
	Wed, 14 Aug 2019 08:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <1565674414-112937-1-git-send-email-hongzhi.song@windriver.com>
	<CADkTA4PCeER9wP28NOaUtKEFBLKmqUfda7Cz+M0q2cgp5DiYew@mail.gmail.com>
	<abef39b8-e8b0-db67-70e7-da17666d1056@windriver.com>
	<CADkTA4Nwi1sSu-W2asM0SXUEhHE94jAEQcSWoCsW7f9ThWP4Tw@mail.gmail.com>
	<35a10637-eac6-0142-fc53-2675fb700375@windriver.com>
	<CADkTA4Pma8h6rk6nnRUAGi2gu8gXVCT0GiTYH7vrYT1OQzJoag@mail.gmail.com>
	<CADkTA4NHx7S6NekA5hz_rpL0Fb5aaoFDop50o+rQjOZ1hvPbYA@mail.gmail.com>
	<CADkTA4MGDvr8CxbkJ99d9_KioN3hYNdE2-ziG95kMzOSaHYNnw@mail.gmail.com>
	<77d97701-d19c-7a2b-d334-a97127f74b7f@windriver.com>
In-Reply-To: <77d97701-d19c-7a2b-d334-a97127f74b7f@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Aug 2019 11:33:29 -0400
Message-ID: <CADkTA4MuXp_LQ-7RMk1+XD40DXbHMDjESGJC0FthivrcpktdSA@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: cp Documentation/ to sdk kernel
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
X-List-Received-Date: Wed, 14 Aug 2019 15:33:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 14, 2019 at 5:48 AM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
>
> On 8/14/19 11:48 AM, Bruce Ashfield wrote:
> > On Tue, Aug 13, 2019 at 11:39 PM Bruce Ashfield
> > <bruce.ashfield@gmail.com>  wrote:
> >> On Tue, Aug 13, 2019 at 11:04 PM Bruce Ashfield
> >> <bruce.ashfield@gmail.com>  wrote:
> >>>
> >>> On Tue, Aug 13, 2019 at 11:01 PM Hongzhi, Song<hongzhi.song@windriver.com>  wrote:
> >>>> On 8/14/19 10:53 AM, Bruce Ashfield wrote:
> >>>>> On Tue, Aug 13, 2019 at 9:59 PM Hongzhi, Song
> >>>>> <hongzhi.song@windriver.com  <mailto:hongzhi.song@windriver.com>> wrote:
> >>>>>
> >>>>>
> >>>>>      On 8/13/19 8:27 PM, Bruce Ashfield wrote:
> >>>>>      >
> >>>>>      >
> >>>>>      > On Tue, Aug 13, 2019 at 1:35 AM Hongzhi.Song
> >>>>>      > <hongzhi.song@windriver.com  <mailto:hongzhi.song@windriver.com>
> >>>>>      <mailto:hongzhi.song@windriver.com
> >>>>>      <mailto:hongzhi.song@windriver.com>>> wrote:
> >>>>>      >
> >>>>>      >     A new patch let kernel source Documentation/Kconfig in top
> >>>>>      Kconfig
> >>>>>      >     So kernel-devsrc should include Documentation/ too.
> >>>>>      >     Otherwise "make scripts" will fails.
> >>>>>      >
> >>>>>      >     patch:
> >>>>>      >     commit b1663d7e3a7961fc45262fd68a89253f2803036c
> >>>>>      >     Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org
> >>>>>      <mailto:mchehab%2Bsamsung@kernel.org>
> >>>>>      >     <mailto:mchehab%2Bsamsung@kernel.org
> >>>>>      <mailto:mchehab%252Bsamsung@kernel.org>>>
> >>>>>      >     Date:   Tue Jun 4 09:26:27 2019 -0300
> >>>>>      >
> >>>>>      >         docs: Kbuild/Makefile: allow check for missing docs at
> >>>>>      build time
> >>>>>      >
> >>>>>      >         While this doesn't make sense for production Kernels, in
> >>>>>      order to
> >>>>>      >         avoid regressions when documents are touched, let's add a
> >>>>>      >         check target at the make file.
> >>>>>      >
> >>>>>      >         Signed-off-by: Mauro Carvalho Chehab
> >>>>>      >     <mchehab+samsung@kernel.org
> >>>>>      <mailto:mchehab%2Bsamsung@kernel.org>
> >>>>>      <mailto:mchehab%2Bsamsung@kernel.org
> >>>>>      <mailto:mchehab%252Bsamsung@kernel.org>>>
> >>>>>      >         Signed-off-by: Jonathan Corbet <corbet@lwn.net
> >>>>>      <mailto:corbet@lwn.net>
> >>>>>      >     <mailto:corbet@lwn.net  <mailto:corbet@lwn.net>>>
> >>>>>      >
> >>>>>      >     Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com
> >>>>>      <mailto:hongzhi.song@windriver.com>
> >>>>>      >     <mailto:hongzhi.song@windriver.com
> >>>>>      <mailto:hongzhi.song@windriver.com>>>
> >>>>>      >     ---
> >>>>>      >      meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>>>      <http://kernel-devsrc.bb>
> >>>>>      ><http://kernel-devsrc.bb>  | 2 +-
> >>>>>      >      1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>      >
> >>>>>      >     diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>>>      <http://kernel-devsrc.bb>
> >>>>>      ><http://kernel-devsrc.bb>
> >>>>>      >     b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>>>      <http://kernel-devsrc.bb>  <http://kernel-devsrc.bb>
> >>>>>      >     index 5ec5929..a874e06 100644
> >>>>>      >     --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>>>      <http://kernel-devsrc.bb>
> >>>>>      ><http://kernel-devsrc.bb>
> >>>>>      >     +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>>>      <http://kernel-devsrc.bb>
> >>>>>      ><http://kernel-devsrc.bb>
> >>>>>      >     @@ -65,7 +65,7 @@ do_install() {
> >>>>>      >          )
> >>>>>      >
> >>>>>      >          # then drop all but the needed Makefiles/Kconfig files
> >>>>>      >     -    rm -rf $kerneldir/build/Documentation
> >>>>>      >     +    #rm -rf $kerneldir/build/Documentation
> >>>>>      >
> >>>>>      >
> >>>>>      > In the spirit of keeping kernel-devsrc as small as possible (I have
> >>>>>      > another patch pending if you really want the full kernel
> >>>>>      source), this
> >>>>>      > should only keep the Documentation/ files that are required to pass
> >>>>>      > the check, not keep all of Documentation.
> >>>>>
> >>>>>
> >>>>>      If you have a better patch, I am pleasure to accept it.
> >>>>>
> >>>>>
> >>>>> ???
> >>>>>
> >>>>> This is where you'd typically do a v2 of the patch after getting a
> >>>>> review of a change.
> >>>>>
> >>>>> But if you are refusing the feedback, then yes, I'll do a version of
> >>>>> the patch myself rather than just blindly copying in all of the
> >>>>> documentation. I'll submit it myself.
> >>>>>
> >>>>> RP/Ross, whoever is taking in patches, drop this version, and I'll do
> >>>>> my own.
> >>>> I am not very familiar with the kernel-devsrc.bb. I have no objection
> >>>> for your decision.
> >>> At a minimum, we shouldn't leave the commented out #rm -rf $kerneldir/build/Documentation, so I can do that and tweak the commit message a bit as well.
> >>>
> >>> Leave it with me, and I'll send it to the list (hopefully tomorrow) to be sure it still solves your problem.
> >> Aha. Now I see what is actually happening. On reading the patch, I
> >> thought you were requiring the existence of the *entire* Documentation
> >> directory, not just the Kbuild infrastructure that would be triggered
> >> if the documentation warning is enabled.
> >>
> >> I still want to change things just a bit, but I'll leave your
> >> Signed-off-by on the patch, since it won't be a structural change as I
> >> thought.
> >>
> >> But can you provide me your test steps ? Do you have a tweaked kernel
> >> config that is enabling WARN_MISSING_DOCUMENTS and COMPILE_TEST ?
>
>
> My steps:
>
> 1. git clone git://git.yoctoproject.org/poky
>
> 2. TOOLCHAIN_TARGET_TASK_append = " python-dev kernel-dev kernel-devsrc"
>
>      TOOLCHAIN_HOST_TASK_append = " nativesdk-openssl-dev
> nativesdk-bison nativesdk-flex"
>
>      >> local.conf
>
>
> 3. bitbake core-image-minimal && bitbake core-image-minimal -c populate_sdk
>
> 4.
> tmp/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-64-qemux86-64-toolchain-2.7+snapshot.sh
>
> 5. cd [sdkdir]/
>
>      source environment-setup-core2-64-poky-linux
>
> 6. cd [sdkdir]/sysroots/core-xxx/usr/src/kernel/
>
>      make scripts
>
>
> And then you will meet the error:
>
>      scripts/kconfig/conf  --syncconfig Kconfig
>      Kconfig:34: can't open file "Documentation/Kconfig"
>
>
> My previous project has been deleted. Then I build a new poky, it looks
> like has another
>
> new error of kernel-devsrc do_install. Maybe the linux-yocto-dev is
> update recently.
>
>
> Attachment is my .config. I find WARN_MISSING_DOCUMENTS and COMPILE_TEST
> are disabled.


I've tested in with the configs on and off, and have a patch in the
series I just sent to the list (see kernel-devsrc: tweak for v5.3+),
and it should solve the issue you are seeing.

Let me know if that isn't the case.

Bruce


>
>
>
>
> > Sorry for all the email. It's late, and I'm sending before reading the code.
> >
> > I assume it is just 'make scripts' for the test and the missing Kbuild
> > is what errors. So no need to follow up.
> >
> > I'm a bit concerned that if we leave this file in devsrc AND those
> > options I mentioned are enabled that we'll run into an error with some
> > missing tools or generate a warning.
> >
> > I'll test both scenarios to make sure everything works.
>
>
> Thanks for your work.
>
> --Hongzhi
>
>
> >
> > Bruce
> >
> >> Bruce
> >>
> >>> Bruce
> >>>
> >>>> Thanks,
> >>>>
> >>>> --Hongzhi
> >>>>
> >>>>
> >>>>> Cheers,
> >>>>>
> >>>>> Bruce
> >>>>>
> >>>>>
> >>>>>      Thanks,
> >>>>>
> >>>>>      --Hongzhi
> >>>>>
> >>>>>
> >>>>>      > Bruce
> >>>>>      >
> >>>>>      >          rm -rf $kerneldir/build/scripts
> >>>>>      >          rm -rf $kerneldir/build/include
> >>>>>      >
> >>>>>      >     --
> >>>>>      >     2.8.1
> >>>>>      >
> >>>>>      >     --
> >>>>>      >     _______________________________________________
> >>>>>      >     Openembedded-core mailing list
> >>>>>      >Openembedded-core@lists.openembedded.org
> >>>>>      <mailto:Openembedded-core@lists.openembedded.org>
> >>>>>      >     <mailto:Openembedded-core@lists.openembedded.org
> >>>>>      <mailto:Openembedded-core@lists.openembedded.org>>
> >>>>>      >http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>>>      >
> >>>>>      >
> >>>>>      >
> >>>>>      > --
> >>>>>      > - Thou shalt not follow the NULL pointer, for chaos and madness
> >>>>>      await
> >>>>>      > thee at its end
> >>>>>      > - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>      >
> >>>>>
> >>>>>
> >>>>>
> >>>>> --
> >>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>>>> thee at its end
> >>>>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

