Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE0E37F0EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 12:29:22 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id z15so27550856lfh.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O2ZFOOC7cm4eICN6RD5/n67kkPblOw4Xc4qDV31yxAc=;
	b=u908uFo9WKaZo4351rqldtQOO5WziGi+BajD14uCObx1ndjZcveiV2foduESrWp0es
	GOibdUMJWaj2sDhdX1RIIQs9zM1xeli82etMYNZIe+suGS1SwZU+GGcXElN0TGPPJ7mR
	wE+MiMHNI9e0IQ6CXzVbMkiggL9FgLJw4BFR40ql2iUcUAei3bOfyAIKQl5ghKlGpOTf
	IL7zoQI+QuWbKlYKrCfVl+VbyOZWoS2Gofnk1indfmZax+t3j6a+ApynMMJN5XL4BB17
	8sNb4oR5ftctDwd3V8yWJ+sa/+wp63sfOg27y4EA70QvMI+6CUJjdIWLQo5MHXtyYEWp
	e3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O2ZFOOC7cm4eICN6RD5/n67kkPblOw4Xc4qDV31yxAc=;
	b=aXWD2j4liuS+9HitENRJqd9bPz76HmTqIgXtEx2kNDAxxxyT0o5DUYiYYrdi20xN8g
	EyuRXC/LHENuN5ryane8MsB3HVD5/+PUEpn8RmR9bIjJN9xpzVrVc9F+UNicDy41kkup
	WWaXnKaGtVDktRlcLUpiWzX2GjJhTmjIWB2dieMy2XoTYZt3bfupH6hMWzEJiMD3m+II
	WQdSRgkglEj1h7sJ5Ncx4oigko45KwbCT6tkGMN3/pfs6jv9UyHo8ouVkXlqe5/hJIDq
	FxZ8rDUC+Qys55SjS+fO2zeJkIO0EyQJsvG9tXgOMEEEl6Vurde6nEWWy3ETcHjHg9uj
	qVNQ==
X-Gm-Message-State: APjAAAVC8CfLA78QxjOd62t8GG0o/KfXxj2KdKFKTGtwKC7zxhjez4nP
	Tz25kaudh94VoCrgApLLMX8RCVRlHbrTQAS3YKU=
X-Google-Smtp-Source: APXvYqzCk6RcM3I4EIEoyq3RgCkNJ5/hDu7zt29lyX/MowaeO7/4WLQpobcRGwBsejypIPmy9TDZadakkAk/w7asnXo=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr38028397lfi.140.1563971363184;
	Wed, 24 Jul 2019 05:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190724023833.13718-1-Qi.Chen@windriver.com>
	<CADkTA4Og9UDHziXHSdN2VFvziRXm=dxtpFvMJvueAJrniOB-pA@mail.gmail.com>
	<CAMKF1srTkebjpsQTYM0_VBZAF1zsF7BuowpiSCYL7M341tkZ8w@mail.gmail.com>
In-Reply-To: <CAMKF1srTkebjpsQTYM0_VBZAF1zsF7BuowpiSCYL7M341tkZ8w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Jul 2019 08:29:12 -0400
Message-ID: <CADkTA4N+kotHvxbpUkDxybpFXROqzckmR6u1QA_XY=OkiLTbEg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] container-image-busybox: add a reference container image
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
X-List-Received-Date: Wed, 24 Jul 2019 12:29:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 24, 2019 at 1:06 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Jul 23, 2019 at 8:03 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Tue, Jul 23, 2019 at 10:39 PM Chen Qi <Qi.Chen@windriver.com> wrote:
> > >
> > > Add a small busybox based container image.
> >
> > This really isn't a great container reference image. It isn't
> > manipulating many of
> > the things that you should be in a container image (linux-dummy, etc).
> >
> > Have you seen the reference images that have either been presented at the
> > various ELC conferences and/or the ones that are in meta-virtualization ?
> > Or the ones from Togan labs, meta-overc, etc ?
> >
> > IMHO, It would be better to collaborate on this in a non-core layer
> > for this release and
> > then consolidate things with the OCI image types, and when we sort out
> > if/what/when
> > makes sense from meta-virt into oe-core.
>
> I think this is very much suitable for OE-Core, and I would like us to
> have container reference image
> in core, however, I agree there is prework that should be includes
> from prior work in other layers and
> we should consolidate all that into a reference usable image in oe-core.

I definitely agree on that something belongs in oe-core, and yes, 100%
agreed that we shouldn't do this ad-hoc and should at a minimum have
documentation and some consolidated images / use cases from the
existing layers with container image types.

Cheers,

Bruce

>
> >
> > This is a topic of many opinions and different implementations and deserves some
> > cycles spent on documenting the choices, what we expect the base image to
> > do, etc.
> >
> > Cheers,
> >
> > Bruce
> >
> > >
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >  meta/recipes-core/images/container-image-busybox.bb | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >  create mode 100644 meta/recipes-core/images/container-image-busybox.bb
> > >
> > > diff --git a/meta/recipes-core/images/container-image-busybox.bb b/meta/recipes-core/images/container-image-busybox.bb
> > > new file mode 100644
> > > index 0000000000..a4d63b0eea
> > > --- /dev/null
> > > +++ b/meta/recipes-core/images/container-image-busybox.bb
> > > @@ -0,0 +1,8 @@
> > > +SUMMARY = "A small busybox based container image."
> > > +LICENSE = "MIT"
> > > +
> > > +IMAGE_INSTALL = "busybox"
> > > +IMAGE_LINGUAS = ""
> > > +IMAGE_FSTYPES = "container"
> > > +
> > > +inherit core-image
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

