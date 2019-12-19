Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13FB57FE4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 19:30:49 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m8so5993627edi.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 11:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qa9sYf9wTEVyOGIod+XThdg9XmquS/9es2DU8/BcI34=;
	b=gL+sRBIjasIFmYmFx7ZEoJHBFz5F+3oRDi6p8k0yetMLJinRzU8ExtnLqF0paYR1NS
	OsYGko0WO6wQtMwDHoYEfAQX+42sDrHjdeWtEnq7Er2mzawpa/aa0myoysSxYo5a1J+W
	kRRyjglEr5m/++yvZdN5PP8wMXjgJGQwVu+w6kRTdQ+/4m3GnKjgDOiAbTHfXnEqHJgJ
	z5R1mh4ogp4r2qNQS/8DGbXnxj6ftEfbG6cbMu+kHwV9Y5mX1C8mzmLd6FJOtMt4i0m1
	60e0+Ww5lgS0CuzO4b8b0QeIruODKWhF4kNdcTbMLOxvslQIQsKZHUjJ4cC9Ok0m8Ore
	IM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qa9sYf9wTEVyOGIod+XThdg9XmquS/9es2DU8/BcI34=;
	b=bHfb6fJaS/hD4+8FSaR71TC75a06IM70PxGaPMu9RLmDEvxRY3sM38BWkn/orWIlaA
	jEntkXiWJtFaePUvqtpAjNxZJyzOXTHRj5DigBUqZIQ167FDwArC5pP0cQZGJO97Zw0T
	GWgO3zqikO0AaoTHYOmwM3/kOiOvJdZmcDoUCqU6yXch+lKSqHB/VOnw7mIcZkdSrKmy
	PD83xxlgH4l+JRAQA2/mmseaCmwq870TB56HNRmcQ6NMiQdu48IBCYWxRLzMOCQfamJg
	3l2DlH9jwpl059Yb03thaq4LlQ7nMCxx3ATsdLL2aW50Xu3KUCmsKENRmTmK7FAoPHMf
	apfA==
X-Gm-Message-State: APjAAAWipbUgrMsn7Q6RyDPyNCIGpybd6/tHRv1z0M0MHaEWtpfCedQU
	iz+yL0lgu0gVe49nQsK6FzGCsE23fz5HF/2dQOI=
X-Google-Smtp-Source: APXvYqwUx2fiIt8Wl7KHi/s0GCb36fw7bX3XEH7IqOiZCn0eOYSOeqLaOvlM+9a48GQbjK1o3boq2YvPoqUYrJ1BRqE=
X-Received: by 2002:a17:906:680b:: with SMTP id
	k11mr11684907ejr.0.1576783850574; 
	Thu, 19 Dec 2019 11:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20191219183759.3122153-1-JPEWhacker@gmail.com>
	<CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
	<9365317d-d1d5-33f9-6769-14bf8af5a7a4@gmail.com>
In-Reply-To: <9365317d-d1d5-33f9-6769-14bf8af5a7a4@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Dec 2019 14:30:39 -0500
Message-ID: <CADkTA4OBW-n0ki0HsbS1xrSX9ehDawboieMCxOMeyEhH_2=mMw@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Dec 2019 19:30:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 19, 2019 at 1:53 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
>
> On 12/19/19 12:45 PM, Bruce Ashfield wrote:
> > On Thu, Dec 19, 2019 at 1:38 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >> 0f698dfd1c8 ("kernel-yocto: streamline patch, configuration and audit
> >> phases") appears to have inadvertently broken support for BSP .scc files
> >> to provide patches for the kernel. Restore this behavior by adding
> >> $bsp_definition to the list of files processed for patches.
> >> Additionally, the logic can be simplified now that the same elements are
> >> used for both configuration fragments and patches
> > Unfortunately no, we can't do this.
> >
> > It would reapply all the patches that are already integrated into the
> > tree, and that distinction is the key part of that change.
> >
> > What exactly are you trying to do ? Define a userspace BSP ? If so,
> > there are examples of this and I can dig them up and send them along.
>
> We have a lot of boards running different SoCs (each with a different
> vendor provided kernel) and we are trying to keep our sanity managing
> all of the by using a metadata repo. So for example, we have a recipe
> that pulls in vendor A's kernel directly from the upstream source, then
> our local metadata repo which provides the scc files we need to
> configure that repo. Inevitably, we end up needing to patch these
> kernels, so I was hoping that we could provide the patches in the
> metadata repo and add them to the BSP .scc file, but that wasn't working.
>

Right! It does make sense to keep the configs and patches together in
that meta data repo.

So you have your own kmeta repo, and that's where the BSP definitions
that are being searched and found. Are those definitions completely
standalone, or are they including some of the common yocto ktype
definitions ? (It makes a difference to how they can be included).

I explained the details of the behaviour in an email on Oct 9th, with
the title: "[yocto] Kernel patches pulled from BSP definition file are
not applied.", so I won't repeat that long description here .. except
to say that it is working as intended (but that doesn't mean it is set
in stone .. see below ..). And yes, there are doc updates that need to
happen for this to more clearly explain the design and options.

That being said, there are a couple of things that can be done, and
one that works right now:

- The BSP definition SCC needs to be on the SRC_URI itself (as I
describe in that other email), if your kernel recipe's have different
names, that's doable. If they are under a common recipe, that of
course would be harder (but you could use a variable for the MACHINE
and have it work that way).

That's the one that works now.

A second option would be if I inject some logic to differentiate an
integrated BSP versus one that requires patching. That's a slippery
slope back into the complex logic that used to be in place, but I can
think of a few viable ways to do it.

Definitely a use case we can support, it'll just take some tweaking.

Cheers,

Bruce


Bruce





>
> >
> > Bruce
> >
> >> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> >> ---
> >>   meta/classes/kernel-yocto.bbclass | 7 ++-----
> >>   1 file changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> >> index ed9bcfa57c..08c02a8f50 100644
> >> --- a/meta/classes/kernel-yocto.bbclass
> >> +++ b/meta/classes/kernel-yocto.bbclass
> >> @@ -193,12 +193,9 @@ do_kernel_metadata() {
> >>                  if [ $? -ne 0 ]; then
> >>                          bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> >>                  fi
> >> -       fi
> >>
> >> -       # run2: only generate patches for elements that have been passed on the SRC_URI
> >> -       elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
> >> -       if [ -n "${elements}" ]; then
> >> -               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
> >> +               # run2: generate patches
> >> +               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> >>                  if [ $? -ne 0 ]; then
> >>                          bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> >>                  fi
> >> --
> >> 2.23.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

