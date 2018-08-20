Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 48D0579096
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 17:14:35 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id r21-v6so17032278qtm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yCmpeChyD6GU5rSRMng8IVeTO6CnB7SzloSho3tBKPo=;
	b=TAyvz1aB1RWmR7THzuwy0uT+O/wAcsnU+DfnQa1jpncQlxn7g2kZuJI819Rm/Gqld6
	gPM1Si1MdSoQAU2jlY0Hr3TKz8Lflkp2/YVEjJw2zXS9GLpTpsBNVUOTLkLTKLCWpkzJ
	sWkMtxJWz0u9vqLPXMByzj5DL20aM9KqL+k3VyoMHzm3Z/NwstwCDkTW4UMNQ62+40lN
	oJmuKVlJCAUTQYiuCzH3rP+ThkR9HdPuetWsIp0Dn3G3jPvplPxdXe5YtdSomw22+wPS
	EJPOJyt5edB19WZ8n7YBvZ/KzDwxU8NT+LRax5KFKvpCrc7pmT/CbBv/2LOkKxgOX077
	Xxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yCmpeChyD6GU5rSRMng8IVeTO6CnB7SzloSho3tBKPo=;
	b=irzprDE4hPJ+FuPUgy973LODMObaNFFQP3lrLrEvZaGCX0xet42+6dvF/5961ML1C2
	Hzquef/SYZyPEb1I5ZypBLyUDJBsLBw2FndVOYpnsRaZHAHuvI9Df44Zrs9w7FBEvb0+
	QMir9xHrd08KZW9On6p1ydX7VswAhwsbihfzAduHwwkkVVBj9U6nG3k3CRKLFrvAHl7+
	z9po9vd2Arz5kRkDpBgrJD8cCCuelY9pCi5Owq3dNcY/EA421oBUcfRrLjAavZ7t3E3W
	pPgFhehNOf4NwrWqm6cOhR5lE70Ebo9nb4FO7diKDQxMb1ZiqA1oMRf1QHbx+FpXUZV2
	ntwA==
X-Gm-Message-State: AOUpUlHzfMztfSxa85Bb986tq6oWFDs+0groMW6bJar5Il7AX/DxdKit
	KDenR+inYHSDMqtlaS1kGN+afTa9d9/HpWp68Fs=
X-Google-Smtp-Source: AA+uWPzc/EbFu8rQ8CDj3ZntB3hV8QVthYp/nGAFPUW3NDTR4KtqDlu8MvcRwmt8pY6b0226Zvya6apFXxSM5zaSQKA=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr45553532qta.117.1534785276001; 
	Mon, 20 Aug 2018 10:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534699224.git.raj.khem@gmail.com>
	<0d484e3706a46b34f4edfc3fec906e576a29a9bd.1534699224.git.raj.khem@gmail.com>
	<9b1b218cfaba5dbc2d582f1b570674a4577db7ba.camel@linuxfoundation.org>
In-Reply-To: <9b1b218cfaba5dbc2d582f1b570674a4577db7ba.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2018 10:14:09 -0700
Message-ID: <CAMKF1srzRT2s0GGR34wu-TNHqgxTPZJf=UMjtc8tyBxkGTFWNA@mail.gmail.com>
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
X-List-Received-Date: Mon, 20 Aug 2018 17:14:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 20, 2018 at 2:40 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2018-08-19 at 10:23 -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
> >  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-
> > graphics/cairo/cairo.inc
> > index 20e0d2c92a..7347f223ff 100644
> > --- a/meta/recipes-graphics/cairo/cairo.inc
> > +++ b/meta/recipes-graphics/cairo/cairo.inc
> > @@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender
> > libxext"
> >  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
> >
> >  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> > 'x11 xcb', '', d)} \
> > -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
> > +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> > 'opengl', '', d)}"
> >
> >  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --
> > disable-xlib,${X11DEPENDS}"
> >  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> > graphics/mesa/mesa.inc
> > index 6aedeee9dc..2671d4de4d 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -47,6 +47,9 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATU
> > RES', 'wayland vulkan', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> > vulkan', 'dri3', '', d)} \
> >                  "
> >
> > +PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
> > +PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
> > +
> >  # "gbm" requires "dri", "opengl"
> >  PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
>
> Adding this patch causes:
>
> "oe-selftest -r sstatetests.SStateTests.test_sstate_32_64_same_hash"
>
> to fail. I've not looked into it in more detail other than to narrow it
> down to this patch.
>

 my hunch is that its due to new env variables
probably we need to add them to exclude list...?
see
YOCTO_ALTERNATE_* vars

http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=c5a27bd4d450911afa38846bc00ef762e4414eda

> Cheers,
>
> Richard
>

