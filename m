Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA817FD1C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 20:32:51 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 20so6912985wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 12:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JLuCLqAdTkS+lFcpOI4cYThpXrAUMVjw8q4yxJRAiJY=;
	b=rqvPYDreENTFXiC/T6yO7/N6Dma2e6JJRfGn4UPCnEGLXHD8PWBNfsTRt2/0AegShc
	UUOoQPcJ3v/YKzesvNk4wzdgNqKjfnjluxLO+ondbdpiF9XKbYpDQf+xQqya32fK2XTg
	bM6YUJjlMZgXrNKgPP/FiMPqdmhifmE23w4g6dQHKKljfUzf7KRRGaHO9t5mlYN3Tpih
	nJBCoo0IjZjbxLWJ6LLs0qdtGViCpXX8fU22TfD86iRIYcHBEWIIrbjwazZU/rp2zkp5
	2SJAIDIbjVhXZCxLKnoFC/0ZGcLeNaUT2Duv1yIr7lgCwukf5vQubQu1bkKU8EBVBFNG
	u+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JLuCLqAdTkS+lFcpOI4cYThpXrAUMVjw8q4yxJRAiJY=;
	b=TpQ2r93ybfsZfghZxW+ZOlogVmp8JtoiIR2LZmfpqmFY8feC8wxyPPpNmLLLPQewgh
	Vv+K8HZFTcZ7G0+APQxCkB0E86Dnp3poVBNFKlNRj3sLklh8T0rRmGTb+CakjL9fZzPU
	XlqPQYXlX40EoFpkXLUClbtuLxGGzdxErtmIFW+wMfRAaJ1mTNV2UW8xA3Ry+aWy9iuG
	Qk4pIdlsBJgALw4+sNlbWoOx2p12LqzKcK96svb37janFrLK/4DD+dujwFk7Y5yhjp6+
	9S9rd2VCkek6/wI49/BWzFxlH/EnmV1XuhQclzKbJG35FISgqZIYke5ujQjQrzeK1F2Q
	/mJw==
X-Gm-Message-State: APjAAAW8TZRN474ti144jZqTBv+GTJXS1o1TWD7/5TfGQPYFEEaAmpX3
	whZpZEShhC/LzSqPjsdUh/3mDzYj8roy7UY9va8=
X-Google-Smtp-Source: APXvYqxJHL34zaEHvJ9Z+qwHbbBflz3nKxOKbyZZIOLy35SXCAF9i21BuHfAsB0ZDMD49geVQrA74pdvBm4uQYMlUDg=
X-Received: by 2002:a1c:f001:: with SMTP id a1mr11531689wmb.76.1576787572496; 
	Thu, 19 Dec 2019 12:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20191219183759.3122153-1-JPEWhacker@gmail.com>
	<CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
	<9365317d-d1d5-33f9-6769-14bf8af5a7a4@gmail.com>
	<CADkTA4OBW-n0ki0HsbS1xrSX9ehDawboieMCxOMeyEhH_2=mMw@mail.gmail.com>
In-Reply-To: <CADkTA4OBW-n0ki0HsbS1xrSX9ehDawboieMCxOMeyEhH_2=mMw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 19 Dec 2019 14:32:41 -0600
Message-ID: <CAJdd5GZF4HT_UOkYdOMVGMtp2z_A5bCeWW3bEG9+aU6RgeDyQw@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Dec 2019 20:32:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 19, 2019 at 1:30 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Dec 19, 2019 at 1:53 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> >
> > On 12/19/19 12:45 PM, Bruce Ashfield wrote:
> > > On Thu, Dec 19, 2019 at 1:38 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> > >> 0f698dfd1c8 ("kernel-yocto: streamline patch, configuration and audit
> > >> phases") appears to have inadvertently broken support for BSP .scc files
> > >> to provide patches for the kernel. Restore this behavior by adding
> > >> $bsp_definition to the list of files processed for patches.
> > >> Additionally, the logic can be simplified now that the same elements are
> > >> used for both configuration fragments and patches
> > > Unfortunately no, we can't do this.
> > >
> > > It would reapply all the patches that are already integrated into the
> > > tree, and that distinction is the key part of that change.
> > >
> > > What exactly are you trying to do ? Define a userspace BSP ? If so,
> > > there are examples of this and I can dig them up and send them along.
> >
> > We have a lot of boards running different SoCs (each with a different
> > vendor provided kernel) and we are trying to keep our sanity managing
> > all of the by using a metadata repo. So for example, we have a recipe
> > that pulls in vendor A's kernel directly from the upstream source, then
> > our local metadata repo which provides the scc files we need to
> > configure that repo. Inevitably, we end up needing to patch these
> > kernels, so I was hoping that we could provide the patches in the
> > metadata repo and add them to the BSP .scc file, but that wasn't working.
> >
>
> Right! It does make sense to keep the configs and patches together in
> that meta data repo.
>
> So you have your own kmeta repo, and that's where the BSP definitions
> that are being searched and found. Are those definitions completely
> standalone, or are they including some of the common yocto ktype
> definitions ? (It makes a difference to how they can be included).

I think they are standalone (e.g. they don't include any of the ktype files).


>
> I explained the details of the behaviour in an email on Oct 9th, with
> the title: "[yocto] Kernel patches pulled from BSP definition file are
> not applied.", so I won't repeat that long description here .. except
> to say that it is working as intended (but that doesn't mean it is set
> in stone .. see below ..). And yes, there are doc updates that need to
> happen for this to more clearly explain the design and options.
>
> That being said, there are a couple of things that can be done, and
> one that works right now:
>
> - The BSP definition SCC needs to be on the SRC_URI itself (as I
> describe in that other email), if your kernel recipe's have different
> names, that's doable. If they are under a common recipe, that of
> course would be harder (but you could use a variable for the MACHINE
> and have it work that way).

Does that mean the BSP scc files need to be moved from our metadata
repo to live alongside the recipe, or is there some special sauce that
allows the scc to be specified in SRC_URI, but pulled from our kmeta
repo?

>
> That's the one that works now.
>
> A second option would be if I inject some logic to differentiate an
> integrated BSP versus one that requires patching. That's a slippery
> slope back into the complex logic that used to be in place, but I can
> think of a few viable ways to do it.
>
> Definitely a use case we can support, it'll just take some tweaking.
>
> Cheers,
>
> Bruce
>
>
> Bruce
>
>
>
>
>
> >
> > >
> > > Bruce
> > >
> > >> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > >> ---
> > >>   meta/classes/kernel-yocto.bbclass | 7 ++-----
> > >>   1 file changed, 2 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > >> index ed9bcfa57c..08c02a8f50 100644
> > >> --- a/meta/classes/kernel-yocto.bbclass
> > >> +++ b/meta/classes/kernel-yocto.bbclass
> > >> @@ -193,12 +193,9 @@ do_kernel_metadata() {
> > >>                  if [ $? -ne 0 ]; then
> > >>                          bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> > >>                  fi
> > >> -       fi
> > >>
> > >> -       # run2: only generate patches for elements that have been passed on the SRC_URI
> > >> -       elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
> > >> -       if [ -n "${elements}" ]; then
> > >> -               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
> > >> +               # run2: generate patches
> > >> +               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> > >>                  if [ $? -ne 0 ]; then
> > >>                          bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> > >>                  fi
> > >> --
> > >> 2.23.0
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

