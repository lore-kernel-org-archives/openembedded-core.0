Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id D1B377FDD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 18:46:49 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id 203so5048701lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 10:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Un2DExlu6wNEEGKOYEtfyESqND13js9bVuieId6+jEk=;
	b=ULKB0J5dtlvYt3qa/+tRy2vVZzQ06PycFCG7vU24FVJWP/lu1DfgOfH1EUWpiJwXiZ
	vak40Xljae9Z991DGzDMXxAV1VbSoIGpyMnE0hknt6WT0IdwWxsEjKNOlQcs1QCP1sVc
	GGUWSBZezkktcOizneJ46cgdjqAHwgbV59KmQgzW8opcAC9eVADcn11PkLn9xT0XTaOk
	RoLKkomrmrcAhPsSQbIc2ENxzbitHbxhZTjXfKoiByGP2y/RtWGXla2p94JA2NVLu2QR
	tpju8GEom08MqHfJw1TRRF54hNXZpcWzvZnlTdU3MV+eqLiIgs66tpf1X1uB4JtTbpDq
	zDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Un2DExlu6wNEEGKOYEtfyESqND13js9bVuieId6+jEk=;
	b=QfuV9nS2rIg+hv60DmNmgY/Z4BcieA7QZJ3Oyrlt596J4vILeeKGlDrIR490L0uixS
	q18y9ifn7GQGXbLkI4sAdw03cfona33hCcvAjMrJukFIaHaDB5vS371hjGuAKOCtJTUC
	2vKSf1h/8hSNWFSjpjCFXT4bznpUVpvhss2fcBoSdiUjs+X5W6g38us5AfQgcsfuhSyN
	6cdYRGQ09aaT5//QRcnuSS7SLQB/ohS0VsAh2XtX5Kt3Zya2qsQqPxyB9u1pIFZtjaGf
	949PRFdj9mmEdDcE1MDXrgH1XQuJ/i+lPvDjL++ij5rIzp95gDgJ6qWpnqHkNiu/VVTu
	7ngg==
X-Gm-Message-State: APjAAAUSFSntaSuQipxXvCt/3zWOKX7PDy9tnfigiFBVYOEQe6TOwgTW
	UQSaQbGJ1kq9EILQHYTeOMReTxAmJIkwdbldUGw=
X-Google-Smtp-Source: APXvYqySr9GVw1rwfOAyGc9l0BmTNhOIqNTIzbJ22j9ScYOnbPv8e0Tw3jMhnsYBaUDx60YaFYT4A3BYIyDnxP6GMsY=
X-Received: by 2002:ac2:57cc:: with SMTP id k12mr6694988lfo.36.1576781210361; 
	Thu, 19 Dec 2019 10:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20191219183759.3122153-1-JPEWhacker@gmail.com>
	<CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
In-Reply-To: <CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Dec 2019 13:46:39 -0500
Message-ID: <CADkTA4PzLqCKrY1Aa4xqwxh_4YW096Om0GybkQ84+EkiEcLvyw@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Dec 2019 18:46:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 19, 2019 at 1:45 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Dec 19, 2019 at 1:38 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > 0f698dfd1c8 ("kernel-yocto: streamline patch, configuration and audit
> > phases") appears to have inadvertently broken support for BSP .scc files
> > to provide patches for the kernel. Restore this behavior by adding
> > $bsp_definition to the list of files processed for patches.
> > Additionally, the logic can be simplified now that the same elements are
> > used for both configuration fragments and patches
>
> Unfortunately no, we can't do this.
>
> It would reapply all the patches that are already integrated into the
> tree, and that distinction is the key part of that change.
>
> What exactly are you trying to do ? Define a userspace BSP ? If so,

s/userspace/recipespace/

Bruce

> there are examples of this and I can dig them up and send them along.
>
> Bruce
>
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > index ed9bcfa57c..08c02a8f50 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -193,12 +193,9 @@ do_kernel_metadata() {
> >                 if [ $? -ne 0 ]; then
> >                         bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> >                 fi
> > -       fi
> >
> > -       # run2: only generate patches for elements that have been passed on the SRC_URI
> > -       elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
> > -       if [ -n "${elements}" ]; then
> > -               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
> > +               # run2: generate patches
> > +               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> >                 if [ $? -ne 0 ]; then
> >                         bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> >                 fi
> > --
> > 2.23.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
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

