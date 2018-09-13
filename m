Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id DF16A796B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 16:21:03 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id b19-v6so3506482qkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TTVArdj0Op14s33U6GyO/KdZtqmrJgGubFjxuGhkvZc=;
	b=Rz3L2seXt/k3Bn16AyY+f9j6hZN2N3PHfvKezIXU+8FoqAr68Pjx+CECbhRtOE/kUp
	IFhavEreUNuGU17dIGo0L+FZd6Kjyc/LhLOhC0nWMIcPhYW8a7+QlTQQbn30+8mrKYh1
	C14NAPZV/+uy97jylXeu6sYFKd+Tvp3ETf7U4+qGiAo+Br74Vhe072DlW3fpB1kiToxx
	GR7zsL5Wb/eYf5wEv6miyiiOGns+HCHzzcIcys/vdMDwn0fRangPyh8CF8/BvxGat6Z5
	J+DItcWgfRMha7PRQwTY+ikPVtCJBzBaL5afWpg/4HJQIVtRLMWBNrjfxN8e+M3XevLB
	Tx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TTVArdj0Op14s33U6GyO/KdZtqmrJgGubFjxuGhkvZc=;
	b=qK9fjZs5Y+VEihSEJA3tGcL3rBM1kWqgpW3VsYPtbWJ0iD6mNSpRc1phcXa7fzUp9A
	KHTmahWtICgOwo4gKtKTt0ySKWUTXdh4/sNM9zL1GlktjH7VQVnM+jngwX6Ecmhs+nxl
	5WTOLvlIM6hkTYCSp2HCE8iPmpqDmNi3kpjitc/47tfyidBiPnCamYUiX05cEl4SIIWa
	/LdpdIws4ciNdhPW0avqXX6q3Q7muSrnP6/rcIePilyeq2doPN5AumY3cnLCTRSqZZ18
	vnGM1AxWA+RpV8IH5Vwk/CZZCWK8nExm43U/SeVeGZlnBOGOZVWHypl3WzkfCurZRM0g
	0S1w==
X-Gm-Message-State: APzg51Dg30CMbZ/DjptcKGqxG/+PwqM6Nb84ots+6FhMCZesMV6dUwA5
	+/OPxbdGN1Dc2PTx6qUbsKkX/rIsiEBD12k8xSehSg==
X-Google-Smtp-Source: ANB0VdaTB3ZuNhjETuzGo9XoALq+dqoKeKyd3K08rkAY4AceyH5laqVpMg+zhdPdC6rAdiQ6bSnEedtwrZD2jelmoMw=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr5689358qkm.2.1536855664510; 
	Thu, 13 Sep 2018 09:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20180910124238.20745-1-nathan@nathanrossi.com>
	<CAMKF1sqRh69ZgpqRLu6zpgaQWeS0+sdLvxZQxupEikONSvgKhQ@mail.gmail.com>
	<CA+aJhH325FkQK37U6DCDaRSkMUZ9ZCcgeN94iQvnqoMmr2Pf1A@mail.gmail.com>
In-Reply-To: <CA+aJhH325FkQK37U6DCDaRSkMUZ9ZCcgeN94iQvnqoMmr2Pf1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Sep 2018 09:20:37 -0700
Message-ID: <CAMKF1srcBv+X20CzWxoviY_fEknjf91bsiB9wGGdBxKj79DNxQ@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgloss_3.0.0.bb: Fix up mv pattern to include libnosys
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
X-List-Received-Date: Thu, 13 Sep 2018 16:21:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 11, 2018 at 1:28 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> On Tue, 11 Sep 2018 at 02:19, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Sep 10, 2018 at 5:43 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
> > >
> > > When installing libgloss libraries handle the ${TARGET_SYS}/lib contents
> > > so that it is placed in ${libdir} instead of ${libdir}/lib. This
> > > resolves a packaging QA issue.
> > >
> > >   ERROR: libgloss-3.0.0-r0 do_package: QA Issue: libgloss:
> > >   Files/directories were installed but not shipped in any package:
> > >     /usr/lib/lib
> > >     /usr/lib/lib/libnosys.a
> > >     /usr/lib/lib/nosys.specs
> > >   Please set FILES such that these items are packaged. Alternatively
> > >   if they are unneeded, avoid installing them or delete them within
> > >   do_install.
> > >   libgloss: 3 installed and not shipped files. [installed-vs-shipped]
> > >
> > > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > > ---
> > >  meta/recipes-core/newlib/libgloss_3.0.0.bb | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/newlib/libgloss_3.0.0.bb b/meta/recipes-core/newlib/libgloss_3.0.0.bb
> > > index 664a922815..727062ca5d 100644
> > > --- a/meta/recipes-core/newlib/libgloss_3.0.0.bb
> > > +++ b/meta/recipes-core/newlib/libgloss_3.0.0.bb
> > > @@ -18,9 +18,10 @@ do_install_prepend() {
> > >
> > >  do_install_append() {
> > >         # Move libs to default directories so they can be picked up later
> > > -       mv -v ${D}${prefix}/${TARGET_SYS}/lib ${D}${libdir}
> > > +       mv -v ${D}${prefix}/${TARGET_SYS}/lib/* ${D}${libdir}
> >
> > seems to some indentation problem, please check.
>
> Hmm, its all tabs (which is what the rest of the file is) and git-am
> seems to apply without issues. What am I missing?

perhaps if you can.

