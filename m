Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id EF17E607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:14:29 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id g80so2682906ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wwv6IwBj9qTSs4+MsozTIpgLW/1ZT8vyLSY/JCCrzjE=;
	b=r+WteIlO0J+AKzR/2ULKiKn0SC0Rgj2V6kpSBoVrd6ItkO5h07doGxBnn+dNJxw6SL
	zvJDORv2K6TFyHksBHuwYcVU85lzVXWusU6bynZPuTNPWRx6z5AsjhJXrgKt7neoupdG
	f2b7MZ0/D1kUO/Xd3vxXK3XQrd0ZAjq2L8eEQEur7JHRUyHmnUAIjW84uj5YwgKNYbVi
	uCgxWVSO1715aMUynQKavVUP4xalLLrYJjJFoXh3UnO45Znb9bTOcMAIIQhh5BoddPCM
	ei8D5cWORxCOKWxTVIYKIu43jfOFiFQOJGrOFXl1bgr9GupThBExQ1N7dUwiKgYEvRqd
	Stvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wwv6IwBj9qTSs4+MsozTIpgLW/1ZT8vyLSY/JCCrzjE=;
	b=UIk744Voni7fr00bzcopRPlxZbIAoQc12X/h5IJLU+/GF/sm0f0nkrK5Q6wZmD3tuz
	iY5cioveQBP4H74gBkjJeW+4uI0jcItWyD6/NxIgQDnLd5GQuVIQ0Om5IEU7DG/XH+mZ
	aFu1SoYN9YHV+9G6YWCvdfiyTCLFlUzL7ByoalW9Eeri+tZZuW9Uupjf90Y+KVU7wNJT
	nH32eC9iUlNBBlqnJ4FhrTwFDMN8FvktGELhFJdxBUvO0LPliN1GlNkq/H2TcZdALNy6
	oHYfO/muFe/QBjHOFwU6QuNEYgEdcdRnZ2l12AdGq7Bffeby4imznNLcOe8FPP1/NuNp
	YX4Q==
X-Gm-Message-State: APjAAAVEEmVqJ60aHEE0BDMiL7sw417GDx+yUL9tC8XL004kTQK8Unbj
	PtEyuCNojRyufBsXmab+Ju6vjfz7BLbC5JZTfrI=
X-Google-Smtp-Source: APXvYqw7oDEzfgRodnKc4o8uw3Q34UIYnz9WDs7BGeqALc3B/v3f5OaKf1VVPAVe0U0H2N36ofyxabwevbecEKKmyKw=
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr15380765ljj.84.1552274070104; 
	Sun, 10 Mar 2019 20:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<05adfd2c8d029ee397c9d2046ebb11aec8d3e952.1551889557.git.bruce.ashfield@gmail.com>
	<751a6405-4e20-89d6-daf5-664ec775bb7d@betafive.co.uk>
	<CADkTA4OjYBPDUkzY=GHGSMfZmKW5=Hg6nrjikwD2vxBCb01hqQ@mail.gmail.com>
In-Reply-To: <CADkTA4OjYBPDUkzY=GHGSMfZmKW5=Hg6nrjikwD2vxBCb01hqQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Mar 2019 23:14:19 -0400
Message-ID: <CADkTA4O+Cu0H38xqHoaXWtJE_MGoZg-sRsacQN4YHthzXA3S1A@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Mar 2019 03:14:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 10, 2019 at 10:35 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Sat, Mar 9, 2019 at 5:10 PM Paul Barker <paul@betafive.co.uk> wrote:
> >
> > On 06/03/2019 16:37, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > For testing purposes, it is often easier to patch a fragment
> > > in a kernel-meta repository versus needing to make a copy or
> > > modify the source repository.
> > >
> > > We can allow this sort of patching when a patchdir of kernel-meta
> > > is passed (to indicate the nested kernel-meta repository).
> > >
> > > Also note that we must patch the meta data before they are
> > > processed/gathered, since migrated copies to the kernel source
> > > directory will be used later.
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >   meta/classes/kernel-yocto.bbclass | 29 +++++++++++++++++++++++++----
> > >   1 file changed, 25 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > > index 496c8a7f68..d2b194dd55 100644
> > > --- a/meta/classes/kernel-yocto.bbclass
> > > +++ b/meta/classes/kernel-yocto.bbclass
> > > @@ -5,12 +5,21 @@ PATCH_GIT_USER_NAME ?= "OpenEmbedded"
> > >
> > >   # returns local (absolute) path names for all valid patches in the
> > >   # src_uri
> > > -def find_patches(d):
> > > +def find_patches(d,subdir):
> > >       patches = src_patches(d)
> > >       patch_list=[]
> > >       for p in patches:
> > > -        _, _, local, _, _, _ = bb.fetch.decodeurl(p)
> > > -        patch_list.append(local)
> > > +        _, _, local, _, _, parm = bb.fetch.decodeurl(p)
> > > +        # if patchdir has been passed, we won't be able to apply it so skip
> > > +        # the patch for now, and special processing happens later
> > > +        patchdir = ''
> > > +        if "patchdir" in parm:
> > > +            patchdir = parm["patchdir"]
> > > +        if patchdir:
> >
> > Did you mean 'if subdir:' here?
>
> Nope. I did mean if patchdir: here, that doesn't mean it is working perfectly,
> but I did definitely mean patchdir.
>
> >
> > I'm seeing duplicate attempts to apply a patch listed on SRC_URI in the
> > linux-raspberrypi_4.14.bb recipe from meta-raspberrypi. The first
> > attempt is in do_kernel_metadata and this succeeds, the second is in
> > do_patch and this fails as the patch has already been applied.
>
> Hmm. The only thing that should be patchable in the meta data
> gathering is the meta data. Not the kernel source tree. It is just
> there as a rough debug / devel trigger. kernel-meta is a separate
> repo, so patches are only applied there.
>
> Something that triggers in do_patch can't be patching that same
> repo, since the kernel tree is separate ..
>
> Is the raspberrypi recipe using the upstream kernel-cache repo
> or is it doing something else ?
>
> Is it also using patches with patchdir specified in the src_uri ?
> If it isn't, I can't see how any of this is triggering.
>
> I'm out of the office this week, but this is something I can sort
> out .. can you send me the exact set of layers (and any
> local.conf I'd need) to trigger this ? I'll have some time tomorrow
> night to poke at it a bit.

I just did a build with meta-raspberrypi and did recreate the issue,
I'll have a look at see what I can do. I'll need to test some other
use cases against any changes I make, so it'll be a bit touchy :P

Bruce

>
> Bruce
>
> >
> > In this case, patchdir = '' as there is no patchdir set for this in the
> > recipe. The patch is still picked up when find_patches() is called with
> > subdir='kernel-meta' since the test here is false and the comparison
> > below is not performed.
> >
> > > +            if subdir == patchdir:
> > > +                patch_list.append(local)
> > > +        else:
> > > +            patch_list.append(local)
> > >
> > >       return patch_list
> > >
> > > @@ -119,8 +128,20 @@ do_kernel_metadata() {
> > >               fi
> > >       fi
> > >
> > > +     # was anyone trying to patch the kernel meta data ?, we need to do
> > > +     # this here, since the scc commands migrate the .cfg fragments to the
> > > +     # kernel source tree, where they'll be used later.
> > > +     check_git_config
> > > +     patches="${@" ".join(find_patches(d,'kernel-meta'))}"
> > > +     for p in $patches; do
> > > +         (
> > > +             cd ${WORKDIR}/kernel-meta
> > > +             git am -s $p
> > > +         )
> > > +     done
> > > +
> > >       sccs_from_src_uri="${@" ".join(find_sccs(d))}"
> > > -     patches="${@" ".join(find_patches(d))}"
> > > +     patches="${@" ".join(find_patches(d,''))}"
> > >       feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
> > >
> > >       # a quick check to make sure we don't have duplicate defconfigs
> > >
> >
> > --
> > Paul Barker
> > Beta Five Ltd
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

