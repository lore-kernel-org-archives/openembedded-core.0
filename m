Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 684C6790C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 17:51:58 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id p71-v6so6215264qka.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U3pVrsiENBPFS2MSz6c4jbblI4SZhdZr+/ivYal/2zE=;
	b=uMTYu23/TUC/FpG3DmjcJDSeHUIdO0VAVu3LOMzsFyRxkPrZ1J42z0DQ+LzjYnhSdc
	tHGiWNxYE/lY1hbV9hN0eIAthniF/u4rh33+pDk1Y8pfqr6GU7kqLVSdVIvm31ZZlZGk
	dXBEDEh/jed4UuilGb4/FscuFxBZGGe065wj6zmSWaib0EtZ8Y++2uO4blDKxTmdEn9m
	1Qaaz8N77VQnKywtU7vFapEt8Oqc7zlcClOr0LSlSG4Grhrfm+xXLcLRnQNObM9hdWAW
	G6rjbl4p0JBKdF8YgWoDfnw0lIp0cL1jspb9ac67Jp+APCNq5ULiby9ChEd7UvTedycm
	roxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U3pVrsiENBPFS2MSz6c4jbblI4SZhdZr+/ivYal/2zE=;
	b=XXlykrrkL43kOs8Mr4AoOs2J+hd8/ZXYuJhCrDMRCfFeDU2UYmdR+uULoUO2CFUH3U
	6HYpq3Mt9+Dud/1NKXXugsPtbOtiNvtFlqZbj4Lt0UJxaXs4Rp+nWu1Nm5ny4ssKS6LP
	xEo2zkmOCrCeZX5j0pX1eHsDJITJj+c3+3laQjfoELoIwTGrn0ylGoPJjchG0+0VFJHQ
	7deH2jyM9HdwkRKbAoLREv9AMm7JA0yDGL3fCAIdprgTlDOk3DelajMQDnBe0PD4vqh0
	CiFyrFv/v4eVqC+g4h8cQt41GsTWq6FLuMMprUU0mZ6EmrQxRKv/Qvi5H53H5OpMrn9e
	FKNQ==
X-Gm-Message-State: AOUpUlENnkk3zJdCeEiW9tdse8kjrfnepXAqdUOSTGYe3lWLWam7wIh9
	A3x71ikVzoTxWIqNlsfhiWiePQ7q+oDgqv2Nepg=
X-Google-Smtp-Source: AA+uWPxBPwc7qkRqLUN+gVjr906im7EtfwnCcu0Uub0wBgHhY50+iJtKJ1S0XBZMuqHsmOMXebTkH9yXTWbew2wo+d8=
X-Received: by 2002:a37:1be4:: with SMTP id
	m97-v6mr15098995qkh.12.1534787518998; 
	Mon, 20 Aug 2018 10:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534699224.git.raj.khem@gmail.com>
	<0d484e3706a46b34f4edfc3fec906e576a29a9bd.1534699224.git.raj.khem@gmail.com>
	<9b1b218cfaba5dbc2d582f1b570674a4577db7ba.camel@linuxfoundation.org>
	<CAMKF1srzRT2s0GGR34wu-TNHqgxTPZJf=UMjtc8tyBxkGTFWNA@mail.gmail.com>
In-Reply-To: <CAMKF1srzRT2s0GGR34wu-TNHqgxTPZJf=UMjtc8tyBxkGTFWNA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2018 10:51:32 -0700
Message-ID: <CAMKF1sqx7DGs82WWrBehe_aU-99iLYPkRCgujm3paWeNM0DvNw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Mon, 20 Aug 2018 17:51:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 20, 2018 at 10:14 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Aug 20, 2018 at 2:40 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sun, 2018-08-19 at 10:23 -0700, Khem Raj wrote:
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
> > >  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
> > >  2 files changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-
> > > graphics/cairo/cairo.inc
> > > index 20e0d2c92a..7347f223ff 100644
> > > --- a/meta/recipes-graphics/cairo/cairo.inc
> > > +++ b/meta/recipes-graphics/cairo/cairo.inc
> > > @@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender
> > > libxext"
> > >  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
> > >
> > >  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> > > 'x11 xcb', '', d)} \
> > > -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
> > > +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> > > +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> > > 'opengl', '', d)}"
> > >
> > >  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --
> > > disable-xlib,${X11DEPENDS}"
> > >  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> > > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> > > graphics/mesa/mesa.inc
> > > index 6aedeee9dc..2671d4de4d 100644
> > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > @@ -47,6 +47,9 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATU
> > > RES', 'wayland vulkan', d)} \
> > >                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> > > vulkan', 'dri3', '', d)} \
> > >                  "
> > >
> > > +PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
> > > +PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
> > > +
> > >  # "gbm" requires "dri", "opengl"
> > >  PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
> >
> > Adding this patch causes:
> >
> > "oe-selftest -r sstatetests.SStateTests.test_sstate_32_64_same_hash"
> >
> > to fail. I've not looked into it in more detail other than to narrow it
> > down to this patch.
> >
>
>  my hunch is that its due to new env variables
> probably we need to add them to exclude list...?
> see
> YOCTO_ALTERNATE_* vars
>
> http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=c5a27bd4d450911afa38846bc00ef762e4414eda
>

I think I see the problem, its because of DLLVM_TARGETS_TO_BUILD being used
for native llvm. I am testting this fix
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=7cc195f4f8850ad314ef9b93535f874f05a6f9ed



> > Cheers,
> >
> > Richard
> >

