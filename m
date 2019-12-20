Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8EFD47FCB7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 15:09:40 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id j17so8549510edp.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 07:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hn9wc2o+TKpGf85LSFG48F9vgf1jEYhfmrI9gT0qtac=;
	b=oVQ4cDZRohwNYsNABJvFjsG84WIgaCQBiqSDWO/syQCegqEJtD2ddyq5rytNImfuJl
	5Wkw2/54cgp3nwdpnVc/oIDajIh9q7aWFWFV65SU35K/mfLp2bLcbNdMjMminI6KSsTL
	O2fHIaxGE5nxbdbaIq+a0E5gSttvVc2WDaiBcoYCDk4LQ22perinKBYv4HgFQXF1mcDD
	lR18TiOSnfijl816q4WAYZWKEvQKnx9B/cyWRQIf6xoTLAFEALcp9ggCJVo0tR/1Fjp2
	WmpjKhdbnd/0a0HihTZqb26N7vOsQ8mV+/KQ8MFuxbNteIP7tTZzxUxorK5O5sK8iB6y
	JrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hn9wc2o+TKpGf85LSFG48F9vgf1jEYhfmrI9gT0qtac=;
	b=ltrQWTjAsdFFTfBu3fLksz2us/6AVRVYR5/m06pRCcH0ZHVp1STZ2VQvSxRIUSt8oy
	iThS5yUEkmyk3raBfXWNWhn8CMFiffUdgPq2njj7i1vroHmuWNCB+QnG3wNitq6R0k6j
	EPYcOMEYcf0mswf8gYw98zSJ2KJNE/qWEPb/QVDYgFPaXIyXbZ21rEJU4aLmcE2Oww6l
	xBgevqGOniEOAwtL4FR1wjksZymZXfB10mnuARslVMQXnl+oxRuYypXOt0dwzv8lMzEf
	FfRkqcfNLkMF8nZHbeR1QMzy0xdsv1xtQzyTifGU8ZO4RJlqB16YLBJPMFInKHlkRdv8
	OpIQ==
X-Gm-Message-State: APjAAAWQA3ctFjoIJo2ahVhqtl6bTO2GzVhMVXbjCl5JuYS/fCMn6q7i
	7KDo61F59E4kfg0GyK3SwOQspSQwBBq4F9QATiM=
X-Google-Smtp-Source: APXvYqwSprjq3YClKx7hx0zsmiwzTsxrnD83qMpV2lH83i2sAT2jku35EAZq/eh+pXf5YokzAfB002QTc37Jlr92yao=
X-Received: by 2002:a50:ef17:: with SMTP id m23mr16005884eds.106.1576854581041;
	Fri, 20 Dec 2019 07:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20191219183759.3122153-1-JPEWhacker@gmail.com>
	<CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
	<9365317d-d1d5-33f9-6769-14bf8af5a7a4@gmail.com>
	<CADkTA4OBW-n0ki0HsbS1xrSX9ehDawboieMCxOMeyEhH_2=mMw@mail.gmail.com>
	<CAJdd5GZF4HT_UOkYdOMVGMtp2z_A5bCeWW3bEG9+aU6RgeDyQw@mail.gmail.com>
	<CADkTA4N_P0B+GrwUumub+dFCM3mDEb5NMSb-JpUJN+7zK9n28Q@mail.gmail.com>
	<969ab908-f227-7e8c-2467-3e1ac72d98da@gmail.com>
	<CADkTA4PZMTpYXVn8opms9Z08qSJxmmwPLmU1YehnGsgk-x4Q2g@mail.gmail.com>
	<CAJdd5GYYN73JpeqU9y5B=8K2sdvJd40L2cGNMs3WanHE_OEvqw@mail.gmail.com>
In-Reply-To: <CAJdd5GYYN73JpeqU9y5B=8K2sdvJd40L2cGNMs3WanHE_OEvqw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Dec 2019 10:09:29 -0500
Message-ID: <CADkTA4NFx6HpkGYg68WQaOg_2n_Nn70YfMOweV7t22Fro-KLCQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Apply patches from BSP
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
X-List-Received-Date: Fri, 20 Dec 2019 15:09:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 20, 2019 at 10:07 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> On Thu, Dec 19, 2019 at 4:14 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Thu, Dec 19, 2019 at 4:53 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> > >
> > >
> > > On 12/19/19 3:18 PM, Bruce Ashfield wrote:
> > > > On Thu, Dec 19, 2019 at 3:32 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> > > >> On Thu, Dec 19, 2019 at 1:30 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > >>> On Thu, Dec 19, 2019 at 1:53 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> > > >>>>
> > > >>>> On 12/19/19 12:45 PM, Bruce Ashfield wrote:
> > > >>>>> On Thu, Dec 19, 2019 at 1:38 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> > > >>>>>> 0f698dfd1c8 ("kernel-yocto: streamline patch, configuration and audit
> > > >>>>>> phases") appears to have inadvertently broken support for BSP .scc files
> > > >>>>>> to provide patches for the kernel. Restore this behavior by adding
> > > >>>>>> $bsp_definition to the list of files processed for patches.
> > > >>>>>> Additionally, the logic can be simplified now that the same elements are
> > > >>>>>> used for both configuration fragments and patches
> > > >>>>> Unfortunately no, we can't do this.
> > > >>>>>
> > > >>>>> It would reapply all the patches that are already integrated into the
> > > >>>>> tree, and that distinction is the key part of that change.
> > > >>>>>
> > > >>>>> What exactly are you trying to do ? Define a userspace BSP ? If so,
> > > >>>>> there are examples of this and I can dig them up and send them along.
> > > >>>> We have a lot of boards running different SoCs (each with a different
> > > >>>> vendor provided kernel) and we are trying to keep our sanity managing
> > > >>>> all of the by using a metadata repo. So for example, we have a recipe
> > > >>>> that pulls in vendor A's kernel directly from the upstream source, then
> > > >>>> our local metadata repo which provides the scc files we need to
> > > >>>> configure that repo. Inevitably, we end up needing to patch these
> > > >>>> kernels, so I was hoping that we could provide the patches in the
> > > >>>> metadata repo and add them to the BSP .scc file, but that wasn't working.
> > > >>>>
> > > >>> Right! It does make sense to keep the configs and patches together in
> > > >>> that meta data repo.
> > > >>>
> > > >>> So you have your own kmeta repo, and that's where the BSP definitions
> > > >>> that are being searched and found. Are those definitions completely
> > > >>> standalone, or are they including some of the common yocto ktype
> > > >>> definitions ? (It makes a difference to how they can be included).
> > > >> I think they are standalone (e.g. they don't include any of the ktype files).
> > > >>
> > > >>
> > > >>> I explained the details of the behaviour in an email on Oct 9th, with
> > > >>> the title: "[yocto] Kernel patches pulled from BSP definition file are
> > > >>> not applied.", so I won't repeat that long description here .. except
> > > >>> to say that it is working as intended (but that doesn't mean it is set
> > > >>> in stone .. see below ..). And yes, there are doc updates that need to
> > > >>> happen for this to more clearly explain the design and options.
> > > >>>
> > > >>> That being said, there are a couple of things that can be done, and
> > > >>> one that works right now:
> > > >>>
> > > >>> - The BSP definition SCC needs to be on the SRC_URI itself (as I
> > > >>> describe in that other email), if your kernel recipe's have different
> > > >>> names, that's doable. If they are under a common recipe, that of
> > > >>> course would be harder (but you could use a variable for the MACHINE
> > > >>> and have it work that way).
> > > >> Does that mean the BSP scc files need to be moved from our metadata
> > > >> repo to live alongside the recipe, or is there some special sauce that
> > > >> allows the scc to be specified in SRC_URI, but pulled from our kmeta
> > > >> repo?
> > > > At the moment, yes.  Since you need to specify it in SRC_URI where the
> > > > fetcher can find it (obviously :D), which implies that it isn't in
> > > > that separate kernel meta repository.
> > > >
> > > > What, if anything, do you currently have on your SRC_URI ? Just the
> > > > kernel repo and your kernel meta data repo ?
> > >
> > > Yes, that is all we have.
> > >
> > > >
> > > > Let me see if I can come up with a simple way (probably patch) to avoid that.
> > >
> > > That would be great! Thanks.
> > >
> >
> > Attached is my proposed solution. Hopefully the commit log is detailed
> > enough to explain what I'm trying to do :D
> >
> > I've only tested that it doesn't break a standard BSP build, so let me
> > know if this solves your use case, and I'll run some additional tests
> > and send it to the list.
>
> I had to make one minor fix to your patch (the assignment of the sccs
> variable needs the spaces around the "=" removed to be valid shell
> code), but other than that your patch works great for me and does
> exactly what I want.
>

ahah. Right you are. I'll make that tweak and send it to the list.

Bruce

> Thanks!
>
> >
> > Bruce
> >
> > > >
> > > > Bruce
> > > >
> > > >>> That's the one that works now.
> > > >>>
> > > >>> A second option would be if I inject some logic to differentiate an
> > > >>> integrated BSP versus one that requires patching. That's a slippery
> > > >>> slope back into the complex logic that used to be in place, but I can
> > > >>> think of a few viable ways to do it.
> > > >>>
> > > >>> Definitely a use case we can support, it'll just take some tweaking.
> > > >>>
> > > >>> Cheers,
> > > >>>
> > > >>> Bruce
> > > >>>
> > > >>>
> > > >>> Bruce
> > > >>>
> > > >>>
> > > >>>
> > > >>>
> > > >>>
> > > >>>>> Bruce
> > > >>>>>
> > > >>>>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > >>>>>> ---
> > > >>>>>>    meta/classes/kernel-yocto.bbclass | 7 ++-----
> > > >>>>>>    1 file changed, 2 insertions(+), 5 deletions(-)
> > > >>>>>>
> > > >>>>>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > > >>>>>> index ed9bcfa57c..08c02a8f50 100644
> > > >>>>>> --- a/meta/classes/kernel-yocto.bbclass
> > > >>>>>> +++ b/meta/classes/kernel-yocto.bbclass
> > > >>>>>> @@ -193,12 +193,9 @@ do_kernel_metadata() {
> > > >>>>>>                   if [ $? -ne 0 ]; then
> > > >>>>>>                           bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> > > >>>>>>                   fi
> > > >>>>>> -       fi
> > > >>>>>>
> > > >>>>>> -       # run2: only generate patches for elements that have been passed on the SRC_URI
> > > >>>>>> -       elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
> > > >>>>>> -       if [ -n "${elements}" ]; then
> > > >>>>>> -               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
> > > >>>>>> +               # run2: generate patches
> > > >>>>>> +               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> > > >>>>>>                   if [ $? -ne 0 ]; then
> > > >>>>>>                           bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> > > >>>>>>                   fi
> > > >>>>>> --
> > > >>>>>> 2.23.0
> > > >>>>>>
> > > >>>>>> --
> > > >>>>>> _______________________________________________
> > > >>>>>> Openembedded-core mailing list
> > > >>>>>> Openembedded-core@lists.openembedded.org
> > > >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > >>>>>
> > > >>>
> > > >>>
> > > >>> --
> > > >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > >>> thee at its end
> > > >>> - "Use the force Harry" - Gandalf, Star Trek II
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

