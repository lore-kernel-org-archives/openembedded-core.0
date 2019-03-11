Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3DCC27C757
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 04:17:35 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 199so2762349ljj.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 21:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7gnHfPHA8M4n1iWL0KWTx01R4uGM3r+AcJ9APGcOfIk=;
	b=hzexEFoYy6w6JJqGgc5t0LmeIKml5FnRpM5494Vl9aUB+rTTIuPRIcUhweCSzsSxG2
	JP2xxm5CrZ4/cxqf4P2+VDceMcIa/KD+YQjNOBuKv+mE8mQl+5zkE0/oNbGN25GsARUS
	VC88lmDiNPoVOOYEoIiBxfWUgi4j65jG8WKxB5DrjdJDavG8z3/ebabd7e888AEPaMUQ
	grjoEpN/WSAhe3cyB3NYxD1Zuq3nqWuJzi5RSVrHGc9l2TyFq4cWL4Q0Ql3J7ardD59L
	RXB3c/vLhpRR8pSnrkELymwNiEdi2seBTDs7amheGvsuNyH5ob9GvfT/dTRswBeo7+yj
	Z8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7gnHfPHA8M4n1iWL0KWTx01R4uGM3r+AcJ9APGcOfIk=;
	b=UpLJjYjENZ8IIzpRvimMiY5ETAnRO21BceVRvrBIYyfdyETPeLz4xXOcUKR3AcQEwk
	qdXelmKBovIEffqofDqrUABRIt41BY0A8DeeeEzEJqAptCq8KA/3XdSDG8BacIkSUgEO
	EQw0Pqii7BzEV9bzF08L5J8BC0gsPglZiGRJ9q2TevxRWU63pas5XqBzE2gkJe6pg2ac
	5A3ebpzpjFOoeb526mbcRS7yd9iNmuEQjv+VR9HGygjQaHhYKswut+9VED/mmMDTi0F8
	hSyJxmqeOgAR0GtJ3YEYM7ohR5UhcZ/yW9acN3/T5oKViKIw36ucTsbJa/6S8wvCIQ0V
	E0Jg==
X-Gm-Message-State: APjAAAXMi24G+rBiKhPU83sOcWHpL8KBKONgoXnca5pJC1e8mZd1O0pc
	gzB+PIk2n43wlkuP7oSCY1xsrar+1DEJsVfJApA=
X-Google-Smtp-Source: APXvYqwUfwhQ/Dd9qWSRy9tVzq/ejfdHJhjBgTUSiynf/iE/YDfFHW4HOOnKfwDcxyNqja2NUmPZG3w7oaYzon+V26E=
X-Received: by 2002:a2e:6309:: with SMTP id x9mr14955109ljb.75.1552277855445; 
	Sun, 10 Mar 2019 21:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<05adfd2c8d029ee397c9d2046ebb11aec8d3e952.1551889557.git.bruce.ashfield@gmail.com>
	<751a6405-4e20-89d6-daf5-664ec775bb7d@betafive.co.uk>
	<CADkTA4OjYBPDUkzY=GHGSMfZmKW5=Hg6nrjikwD2vxBCb01hqQ@mail.gmail.com>
	<CADkTA4O+Cu0H38xqHoaXWtJE_MGoZg-sRsacQN4YHthzXA3S1A@mail.gmail.com>
	<CADkTA4Osh8ZLUWQE6-SaOH3BExDmyjnkSwCuz6S=5p-iUUaq5g@mail.gmail.com>
In-Reply-To: <CADkTA4Osh8ZLUWQE6-SaOH3BExDmyjnkSwCuz6S=5p-iUUaq5g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2019 00:17:23 -0400
Message-ID: <CADkTA4PJA=GrOB+HrT8DBicU-++0SMvdVQF-VVD24AM6yXy8bg@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] kernel-yocto: allow kernel-meta repositories to be patched
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
X-List-Received-Date: Mon, 11 Mar 2019 04:17:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 11, 2019 at 12:01 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Sun, Mar 10, 2019 at 11:14 PM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > On Sun, Mar 10, 2019 at 10:35 PM Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Sat, Mar 9, 2019 at 5:10 PM Paul Barker <paul@betafive.co.uk> wrote:
> > > >
> > > > On 06/03/2019 16:37, bruce.ashfield@gmail.com wrote:
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >
> > > > > For testing purposes, it is often easier to patch a fragment
> > > > > in a kernel-meta repository versus needing to make a copy or
> > > > > modify the source repository.
> > > > >
> > > > > We can allow this sort of patching when a patchdir of kernel-meta
> > > > > is passed (to indicate the nested kernel-meta repository).
> > > > >
> > > > > Also note that we must patch the meta data before they are
> > > > > processed/gathered, since migrated copies to the kernel source
> > > > > directory will be used later.
> > > > >
> > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > ---
> > > > >   meta/classes/kernel-yocto.bbclass | 29 +++++++++++++++++++++++++----
> > > > >   1 file changed, 25 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > > > > index 496c8a7f68..d2b194dd55 100644
> > > > > --- a/meta/classes/kernel-yocto.bbclass
> > > > > +++ b/meta/classes/kernel-yocto.bbclass
> > > > > @@ -5,12 +5,21 @@ PATCH_GIT_USER_NAME ?= "OpenEmbedded"
> > > > >
> > > > >   # returns local (absolute) path names for all valid patches in the
> > > > >   # src_uri
> > > > > -def find_patches(d):
> > > > > +def find_patches(d,subdir):
> > > > >       patches = src_patches(d)
> > > > >       patch_list=[]
> > > > >       for p in patches:
> > > > > -        _, _, local, _, _, _ = bb.fetch.decodeurl(p)
> > > > > -        patch_list.append(local)
> > > > > +        _, _, local, _, _, parm = bb.fetch.decodeurl(p)
> > > > > +        # if patchdir has been passed, we won't be able to apply it so skip
> > > > > +        # the patch for now, and special processing happens later
> > > > > +        patchdir = ''
> > > > > +        if "patchdir" in parm:
> > > > > +            patchdir = parm["patchdir"]
> > > > > +        if patchdir:
> > > >
> > > > Did you mean 'if subdir:' here?
> > >
> > > Nope. I did mean if patchdir: here, that doesn't mean it is working perfectly,
> > > but I did definitely mean patchdir.
> > >
> > > >
> > > > I'm seeing duplicate attempts to apply a patch listed on SRC_URI in the
> > > > linux-raspberrypi_4.14.bb recipe from meta-raspberrypi. The first
> > > > attempt is in do_kernel_metadata and this succeeds, the second is in
> > > > do_patch and this fails as the patch has already been applied.
> > >
> > > Hmm. The only thing that should be patchable in the meta data
> > > gathering is the meta data. Not the kernel source tree. It is just
> > > there as a rough debug / devel trigger. kernel-meta is a separate
> > > repo, so patches are only applied there.
> > >
> > > Something that triggers in do_patch can't be patching that same
> > > repo, since the kernel tree is separate ..
> > >
> > > Is the raspberrypi recipe using the upstream kernel-cache repo
> > > or is it doing something else ?
> > >
> > > Is it also using patches with patchdir specified in the src_uri ?
> > > If it isn't, I can't see how any of this is triggering.
> > >
> > > I'm out of the office this week, but this is something I can sort
> > > out .. can you send me the exact set of layers (and any
> > > local.conf I'd need) to trigger this ? I'll have some time tomorrow
> > > night to poke at it a bit.
> >
> > I just did a build with meta-raspberrypi and did recreate the issue,
> > I'll have a look at see what I can do. I'll need to test some other
> > use cases against any changes I make, so it'll be a bit touchy :P
>
> On a closer look, yes, it is safer to just have the test on subdir versus
> some other compound conditions that I was using.
>
> That being said, even with that fixed, I'm not able to complete the
> patch process for the linux-raspberrypi kernel, I'm seeing and error
> in do_patch itself, and it doesn't look related to the change in
> question.
>
> Are you seeing something similar ?

Never mind. I was carrying a local patch that was causing an issue
.. this is why you shouldn't try and work quickly while in a non-optimimal
environment.

I have the kernel patching here. For now, I'll send patch that follows your
original suggestion and I'll revisit the other workflows later.

Bruce

>
> Bruce
>
> >
> > Bruce
> >
> > >
> > > Bruce
> > >
> > > >
> > > > In this case, patchdir = '' as there is no patchdir set for this in the
> > > > recipe. The patch is still picked up when find_patches() is called with
> > > > subdir='kernel-meta' since the test here is false and the comparison
> > > > below is not performed.
> > > >
> > > > > +            if subdir == patchdir:
> > > > > +                patch_list.append(local)
> > > > > +        else:
> > > > > +            patch_list.append(local)
> > > > >
> > > > >       return patch_list
> > > > >
> > > > > @@ -119,8 +128,20 @@ do_kernel_metadata() {
> > > > >               fi
> > > > >       fi
> > > > >
> > > > > +     # was anyone trying to patch the kernel meta data ?, we need to do
> > > > > +     # this here, since the scc commands migrate the .cfg fragments to the
> > > > > +     # kernel source tree, where they'll be used later.
> > > > > +     check_git_config
> > > > > +     patches="${@" ".join(find_patches(d,'kernel-meta'))}"
> > > > > +     for p in $patches; do
> > > > > +         (
> > > > > +             cd ${WORKDIR}/kernel-meta
> > > > > +             git am -s $p
> > > > > +         )
> > > > > +     done
> > > > > +
> > > > >       sccs_from_src_uri="${@" ".join(find_sccs(d))}"
> > > > > -     patches="${@" ".join(find_patches(d))}"
> > > > > +     patches="${@" ".join(find_patches(d,''))}"
> > > > >       feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
> > > > >
> > > > >       # a quick check to make sure we don't have duplicate defconfigs
> > > > >
> > > >
> > > > --
> > > > Paul Barker
> > > > Beta Five Ltd
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
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

