Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id 403167CA61
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 02:36:07 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id g12so2200988lfb.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 19:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U04i4fTiGQKYcPmNWmSxGSmDOE2nkKb2W6sseGuNmEI=;
	b=XKo8rgLRraJ+0BefuQpzoO6kct81xUwGQk2HcwUaMQXkhZ4AFUvTVSyhEqQc0G5jXf
	5ChE72hmcgfF6dWqc+0f84eJ62y0ISuki//sYrTiRSK1VDeywZbYVTCaFzJWtv3JSYVz
	GcWHu36IbEUBAxILI8D9cnmOvJw25gTZey1nnzFpijUha8r5RZCR1jo5Qdc55jWiTym4
	Y29aKENMos71dhNg6qSCzp9g0pOtubALmdKZxILRQOYzbzNyB5q9rKuzSqkOMHU0wixn
	ctxvpEym2+E3W3Ndnl38BDNs2CmQTcq7GEGo73r2GsILEaTEp/5vOCbHIzHT3tv+wgnO
	ZB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U04i4fTiGQKYcPmNWmSxGSmDOE2nkKb2W6sseGuNmEI=;
	b=GdzwE6v27qVnE1PvRlWQJrvqN1MJimNYcy1sW733VkKBL2tB00wLheT05hTto4C7Yf
	C+2gOMu1c8/4UJz8IW2fdutGqP1O9CYQ7osJEqV7/UbHnvpzv76A/cY543KFopljMoBg
	VCDFDU12QSWkHleRJUF8HgzR5Ytkjv/yr891qz4gLPuvEaPge//+u7ID0BHHDbbFKmdj
	p/cHEGXK7/nt0lLv8Gts6s64Aq3Eg4BAqLLe8IaO4AI/TJNsrH+yDl5xwDQyon16X76/
	6gvkHw7wyuuGApPOkn+Uopb3dGj3jo9D7po90SqlwNnf0PR9cm/82gfXV4/66gQFehtB
	XGSg==
X-Gm-Message-State: APjAAAXY8KWdvPIGID4e5Vr6/LghZ9QBSu5LonbZv0t5UJu5hDuc8Rik
	bNKwTOIyqq8/vr+0MkDHU4+qFmR/DPzxAcHmv9vRRMjx
X-Google-Smtp-Source: APXvYqxclhyeJNOvahOHu2MfbQfH3sRib6hIOk8VwwNVGrjUXtHNKaDHyQUQLVDQiDSiU0qJ5Uh99Koekl3+0JsH49A=
X-Received: by 2002:a19:da1a:: with SMTP id r26mr14409790lfg.2.1552271767477; 
	Sun, 10 Mar 2019 19:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<05adfd2c8d029ee397c9d2046ebb11aec8d3e952.1551889557.git.bruce.ashfield@gmail.com>
	<751a6405-4e20-89d6-daf5-664ec775bb7d@betafive.co.uk>
In-Reply-To: <751a6405-4e20-89d6-daf5-664ec775bb7d@betafive.co.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Mar 2019 22:35:56 -0400
Message-ID: <CADkTA4OjYBPDUkzY=GHGSMfZmKW5=Hg6nrjikwD2vxBCb01hqQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Mar 2019 02:36:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 9, 2019 at 5:10 PM Paul Barker <paul@betafive.co.uk> wrote:
>
> On 06/03/2019 16:37, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > For testing purposes, it is often easier to patch a fragment
> > in a kernel-meta repository versus needing to make a copy or
> > modify the source repository.
> >
> > We can allow this sort of patching when a patchdir of kernel-meta
> > is passed (to indicate the nested kernel-meta repository).
> >
> > Also note that we must patch the meta data before they are
> > processed/gathered, since migrated copies to the kernel source
> > directory will be used later.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >   meta/classes/kernel-yocto.bbclass | 29 +++++++++++++++++++++++++----
> >   1 file changed, 25 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > index 496c8a7f68..d2b194dd55 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -5,12 +5,21 @@ PATCH_GIT_USER_NAME ?= "OpenEmbedded"
> >
> >   # returns local (absolute) path names for all valid patches in the
> >   # src_uri
> > -def find_patches(d):
> > +def find_patches(d,subdir):
> >       patches = src_patches(d)
> >       patch_list=[]
> >       for p in patches:
> > -        _, _, local, _, _, _ = bb.fetch.decodeurl(p)
> > -        patch_list.append(local)
> > +        _, _, local, _, _, parm = bb.fetch.decodeurl(p)
> > +        # if patchdir has been passed, we won't be able to apply it so skip
> > +        # the patch for now, and special processing happens later
> > +        patchdir = ''
> > +        if "patchdir" in parm:
> > +            patchdir = parm["patchdir"]
> > +        if patchdir:
>
> Did you mean 'if subdir:' here?

Nope. I did mean if patchdir: here, that doesn't mean it is working perfectly,
but I did definitely mean patchdir.

>
> I'm seeing duplicate attempts to apply a patch listed on SRC_URI in the
> linux-raspberrypi_4.14.bb recipe from meta-raspberrypi. The first
> attempt is in do_kernel_metadata and this succeeds, the second is in
> do_patch and this fails as the patch has already been applied.

Hmm. The only thing that should be patchable in the meta data
gathering is the meta data. Not the kernel source tree. It is just
there as a rough debug / devel trigger. kernel-meta is a separate
repo, so patches are only applied there.

Something that triggers in do_patch can't be patching that same
repo, since the kernel tree is separate ..

Is the raspberrypi recipe using the upstream kernel-cache repo
or is it doing something else ?

Is it also using patches with patchdir specified in the src_uri ?
If it isn't, I can't see how any of this is triggering.

I'm out of the office this week, but this is something I can sort
out .. can you send me the exact set of layers (and any
local.conf I'd need) to trigger this ? I'll have some time tomorrow
night to poke at it a bit.

Bruce

>
> In this case, patchdir = '' as there is no patchdir set for this in the
> recipe. The patch is still picked up when find_patches() is called with
> subdir='kernel-meta' since the test here is false and the comparison
> below is not performed.
>
> > +            if subdir == patchdir:
> > +                patch_list.append(local)
> > +        else:
> > +            patch_list.append(local)
> >
> >       return patch_list
> >
> > @@ -119,8 +128,20 @@ do_kernel_metadata() {
> >               fi
> >       fi
> >
> > +     # was anyone trying to patch the kernel meta data ?, we need to do
> > +     # this here, since the scc commands migrate the .cfg fragments to the
> > +     # kernel source tree, where they'll be used later.
> > +     check_git_config
> > +     patches="${@" ".join(find_patches(d,'kernel-meta'))}"
> > +     for p in $patches; do
> > +         (
> > +             cd ${WORKDIR}/kernel-meta
> > +             git am -s $p
> > +         )
> > +     done
> > +
> >       sccs_from_src_uri="${@" ".join(find_sccs(d))}"
> > -     patches="${@" ".join(find_patches(d))}"
> > +     patches="${@" ".join(find_patches(d,''))}"
> >       feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
> >
> >       # a quick check to make sure we don't have duplicate defconfigs
> >
>
> --
> Paul Barker
> Beta Five Ltd



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

