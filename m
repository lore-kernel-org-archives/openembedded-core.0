Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3087F80F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 15:07:54 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g17so9743832wro.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 07:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n49m4WLEMvMXP9mUIRGH+QnwwobVObR9ElwQRYz6Glk=;
	b=coLgZJPgPKd06RrtfsI/9NEwa3NdMwTaQSzmailjq+WlPRFDKlTLEaUcWOxpYvI6FK
	6O8lsIm8HuZZIwkaneaaAp5JR9so8cFV/EVPRAcYBFuavFbJQwArbZeKP4mpMk0kxgzI
	YRgL3pfyOnib5iGXa4BQwyY9wtqAwUZ7UCZ/PI8Wud9Rnn2G5KaNELAtW7+I3sDAGaXl
	i3yIio7wM32VWd0lzSknAewxBaHV/2IXEEaNpfPj73YEGsJwbqjMF1qSyCegJPnqX97k
	KHO/GaaaSeFlS5UBA254M0MOBD+7PqO++Wd4nz7vq7sy3i8tcFUMFcWsLN9m/zvxq1T/
	735Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n49m4WLEMvMXP9mUIRGH+QnwwobVObR9ElwQRYz6Glk=;
	b=mjI4Wwdx5NDLwNnpXOTUAz4QHL/oEmDSLzW9HUujmyLQOZG8UmY5qmmoBCF3PtOABp
	SWCjys/vVQhRogS0f9xbCV0v9VoPk5ypvEzMUJ8bB6AvHLIW8r+ydXcqqapmEyiRKvJZ
	Gk8EvUW0lDQHP+64FMk17e24PdWRlK8vJ96NV0dgzClhDQnu9g8GsIX3uB5CqN6pr7YG
	K3b+YL9EcWl0p1CNeFvrVsR7Bcw6xooOzDf9C8TGO9epN/Ccub8XvpcSguzKsEg2WwVn
	C7uh2CQV7LST7UjzSjnvl0Z/RJQOh770nbs0P6yIhmA54xMHDOVdgaOKjNzS7iI9nh0/
	zvWw==
X-Gm-Message-State: APjAAAW1b+W0uUU5fCH1jXiyaXcMssWePPvCjZKO8TXE0iA6xetJZaj5
	0i9cCulyrxo7WrAK6twr2XUiDR0DEnHTSvKuutI=
X-Google-Smtp-Source: APXvYqy8G950rc2CObxaklalVQ6iM7fkSdP/p9Wm/pc6VHaI3GGE8dL4wBKredofv+9dAxz+k7CEXRaLvZD2vNIEenY=
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr14918439wrk.53.1576854474712; 
	Fri, 20 Dec 2019 07:07:54 -0800 (PST)
MIME-Version: 1.0
References: <20191219183759.3122153-1-JPEWhacker@gmail.com>
	<CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
	<9365317d-d1d5-33f9-6769-14bf8af5a7a4@gmail.com>
	<CADkTA4OBW-n0ki0HsbS1xrSX9ehDawboieMCxOMeyEhH_2=mMw@mail.gmail.com>
	<CAJdd5GZF4HT_UOkYdOMVGMtp2z_A5bCeWW3bEG9+aU6RgeDyQw@mail.gmail.com>
	<CADkTA4N_P0B+GrwUumub+dFCM3mDEb5NMSb-JpUJN+7zK9n28Q@mail.gmail.com>
	<969ab908-f227-7e8c-2467-3e1ac72d98da@gmail.com>
	<CADkTA4PZMTpYXVn8opms9Z08qSJxmmwPLmU1YehnGsgk-x4Q2g@mail.gmail.com>
In-Reply-To: <CADkTA4PZMTpYXVn8opms9Z08qSJxmmwPLmU1YehnGsgk-x4Q2g@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 20 Dec 2019 09:07:43 -0600
Message-ID: <CAJdd5GYYN73JpeqU9y5B=8K2sdvJd40L2cGNMs3WanHE_OEvqw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Fri, 20 Dec 2019 15:07:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 19, 2019 at 4:14 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Dec 19, 2019 at 4:53 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> >
> > On 12/19/19 3:18 PM, Bruce Ashfield wrote:
> > > On Thu, Dec 19, 2019 at 3:32 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> > >> On Thu, Dec 19, 2019 at 1:30 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >>> On Thu, Dec 19, 2019 at 1:53 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> > >>>>
> > >>>> On 12/19/19 12:45 PM, Bruce Ashfield wrote:
> > >>>>> On Thu, Dec 19, 2019 at 1:38 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> > >>>>>> 0f698dfd1c8 ("kernel-yocto: streamline patch, configuration and audit
> > >>>>>> phases") appears to have inadvertently broken support for BSP .scc files
> > >>>>>> to provide patches for the kernel. Restore this behavior by adding
> > >>>>>> $bsp_definition to the list of files processed for patches.
> > >>>>>> Additionally, the logic can be simplified now that the same elements are
> > >>>>>> used for both configuration fragments and patches
> > >>>>> Unfortunately no, we can't do this.
> > >>>>>
> > >>>>> It would reapply all the patches that are already integrated into the
> > >>>>> tree, and that distinction is the key part of that change.
> > >>>>>
> > >>>>> What exactly are you trying to do ? Define a userspace BSP ? If so,
> > >>>>> there are examples of this and I can dig them up and send them along.
> > >>>> We have a lot of boards running different SoCs (each with a different
> > >>>> vendor provided kernel) and we are trying to keep our sanity managing
> > >>>> all of the by using a metadata repo. So for example, we have a recipe
> > >>>> that pulls in vendor A's kernel directly from the upstream source, then
> > >>>> our local metadata repo which provides the scc files we need to
> > >>>> configure that repo. Inevitably, we end up needing to patch these
> > >>>> kernels, so I was hoping that we could provide the patches in the
> > >>>> metadata repo and add them to the BSP .scc file, but that wasn't working.
> > >>>>
> > >>> Right! It does make sense to keep the configs and patches together in
> > >>> that meta data repo.
> > >>>
> > >>> So you have your own kmeta repo, and that's where the BSP definitions
> > >>> that are being searched and found. Are those definitions completely
> > >>> standalone, or are they including some of the common yocto ktype
> > >>> definitions ? (It makes a difference to how they can be included).
> > >> I think they are standalone (e.g. they don't include any of the ktype files).
> > >>
> > >>
> > >>> I explained the details of the behaviour in an email on Oct 9th, with
> > >>> the title: "[yocto] Kernel patches pulled from BSP definition file are
> > >>> not applied.", so I won't repeat that long description here .. except
> > >>> to say that it is working as intended (but that doesn't mean it is set
> > >>> in stone .. see below ..). And yes, there are doc updates that need to
> > >>> happen for this to more clearly explain the design and options.
> > >>>
> > >>> That being said, there are a couple of things that can be done, and
> > >>> one that works right now:
> > >>>
> > >>> - The BSP definition SCC needs to be on the SRC_URI itself (as I
> > >>> describe in that other email), if your kernel recipe's have different
> > >>> names, that's doable. If they are under a common recipe, that of
> > >>> course would be harder (but you could use a variable for the MACHINE
> > >>> and have it work that way).
> > >> Does that mean the BSP scc files need to be moved from our metadata
> > >> repo to live alongside the recipe, or is there some special sauce that
> > >> allows the scc to be specified in SRC_URI, but pulled from our kmeta
> > >> repo?
> > > At the moment, yes.  Since you need to specify it in SRC_URI where the
> > > fetcher can find it (obviously :D), which implies that it isn't in
> > > that separate kernel meta repository.
> > >
> > > What, if anything, do you currently have on your SRC_URI ? Just the
> > > kernel repo and your kernel meta data repo ?
> >
> > Yes, that is all we have.
> >
> > >
> > > Let me see if I can come up with a simple way (probably patch) to avoid that.
> >
> > That would be great! Thanks.
> >
>
> Attached is my proposed solution. Hopefully the commit log is detailed
> enough to explain what I'm trying to do :D
>
> I've only tested that it doesn't break a standard BSP build, so let me
> know if this solves your use case, and I'll run some additional tests
> and send it to the list.

I had to make one minor fix to your patch (the assignment of the sccs
variable needs the spaces around the "=" removed to be valid shell
code), but other than that your patch works great for me and does
exactly what I want.

Thanks!

>
> Bruce
>
> > >
> > > Bruce
> > >
> > >>> That's the one that works now.
> > >>>
> > >>> A second option would be if I inject some logic to differentiate an
> > >>> integrated BSP versus one that requires patching. That's a slippery
> > >>> slope back into the complex logic that used to be in place, but I can
> > >>> think of a few viable ways to do it.
> > >>>
> > >>> Definitely a use case we can support, it'll just take some tweaking.
> > >>>
> > >>> Cheers,
> > >>>
> > >>> Bruce
> > >>>
> > >>>
> > >>> Bruce
> > >>>
> > >>>
> > >>>
> > >>>
> > >>>
> > >>>>> Bruce
> > >>>>>
> > >>>>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > >>>>>> ---
> > >>>>>>    meta/classes/kernel-yocto.bbclass | 7 ++-----
> > >>>>>>    1 file changed, 2 insertions(+), 5 deletions(-)
> > >>>>>>
> > >>>>>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > >>>>>> index ed9bcfa57c..08c02a8f50 100644
> > >>>>>> --- a/meta/classes/kernel-yocto.bbclass
> > >>>>>> +++ b/meta/classes/kernel-yocto.bbclass
> > >>>>>> @@ -193,12 +193,9 @@ do_kernel_metadata() {
> > >>>>>>                   if [ $? -ne 0 ]; then
> > >>>>>>                           bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> > >>>>>>                   fi
> > >>>>>> -       fi
> > >>>>>>
> > >>>>>> -       # run2: only generate patches for elements that have been passed on the SRC_URI
> > >>>>>> -       elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
> > >>>>>> -       if [ -n "${elements}" ]; then
> > >>>>>> -               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
> > >>>>>> +               # run2: generate patches
> > >>>>>> +               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> > >>>>>>                   if [ $? -ne 0 ]; then
> > >>>>>>                           bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> > >>>>>>                   fi
> > >>>>>> --
> > >>>>>> 2.23.0
> > >>>>>>
> > >>>>>> --
> > >>>>>> _______________________________________________
> > >>>>>> Openembedded-core mailing list
> > >>>>>> Openembedded-core@lists.openembedded.org
> > >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >>>>>
> > >>>
> > >>>
> > >>> --
> > >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> > >>> thee at its end
> > >>> - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

