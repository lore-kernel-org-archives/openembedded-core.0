Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id A016D7FCB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 01:59:58 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id y18so2286888qve.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+XIxcH5bztR127hDay6SkJzIcMxHWhwPVRSGRY/IWKA=;
	b=MZYQ4Cc+DGidR/dMTmaWRGRw1pb5GswnwaC00t7RMiUm4OBRamDvwgdpPT8nWJxI4n
	AZcTb21G1XrEo5ZT/yZYLHuqGI3I9Ssx8troHW+5qZgKmMRK9z8cV87g8h6yqnqZBHr4
	NYYnUHgwI1luuQw3x5DO/zoie++LCSGOybZOpCd9oPZl6Bk1ibto4N0VRY/fLmiAxdg3
	GMsu6uEd86kBnRQ20B2JGvFr4OAip4bKikSmLuPAUYvPd6OFVk8Xae4/BKJBr2NsEmoG
	0g9XBg/dMxTeprIJnvN3XixugwJi9saehl5tqCZqhiMoanjK8pPp+F9r8ScW3yK248Ie
	uXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+XIxcH5bztR127hDay6SkJzIcMxHWhwPVRSGRY/IWKA=;
	b=t6WQrtsZaC0+DTRJUA0prWZu7HJNbnze5OLNyvUDDSsywfnKTgLj/K0g82Z/OihrMr
	hzCoqDTvtCFhTW4sIEoSIRQFI8CSBMMzTqmOt7Y8HBmNOTgY4fUnghqfUejsjxaG9EWF
	cEUNLXUFXIZmZulaHyvAJTptEpITfd132iZR9BZfMucqo9lKjZ817OQrI2KrFNaPKh0l
	xhVVtBvAMMXHn+3gL/+lFl37DhmSb3yrJKNv81yG5oviUZ0fWbv3pfljXYPwVGcmr7EK
	VGaLL3IxshgdAnkZEOqEoWnY3c5YGxyYUxVlxFUjBuRvvjiKj7c2dbiuA5I2aTh74MP2
	j46Q==
X-Gm-Message-State: APjAAAULIyv4dfYql1RTyhZt6vk9XNIn0tut7sgrsdGp0KFYvNLj0Bke
	a1sl1FDsAZytxnk7ut/W9D46ZfmbF7Hck6DVO+k=
X-Google-Smtp-Source: APXvYqyI04u+X+Sq0yaBetlqLUu6yZ2q+UWyoKEpbsYrlOU56iVMgJANw5yi6t8WPIv41aaG1MivzIniE+8vict/lLc=
X-Received: by 2002:ad4:4789:: with SMTP id z9mr11654472qvy.109.1574387998847; 
	Thu, 21 Nov 2019 17:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20191121165824.1220075-1-JPEWhacker@gmail.com>
	<b8353d8a56480ad4eb725933e3f9c93e5c79d68f.camel@gmail.com>
	<CAJdd5GZAEX_tUx7MaKffyUZnCtLB52hTO4p8wHNB0kOu61qYDg@mail.gmail.com>
In-Reply-To: <CAJdd5GZAEX_tUx7MaKffyUZnCtLB52hTO4p8wHNB0kOu61qYDg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2019 17:59:32 -0800
Message-ID: <CAMKF1sp1tO3hEmzbV6N3gWHtjMK3vwSrFEoUkHh1e6naa6PijA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] librsvg: Fix build reproducibility
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
X-List-Received-Date: Fri, 22 Nov 2019 01:59:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 21, 2019 at 5:40 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> On Thu, Nov 21, 2019 at 7:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, 2019-11-21 at 10:58 -0600, Joshua Watt wrote:
> > > librsvg was encoding the path to the build directory in order to find
> > > a
> > > font file for testing. This wouldn't work in OE anyway since the
> > > build
> > > directory isn't present at that exact location on the target, so
> > > remove
> > > the offending path to make the build reproducible.
> > >
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  .../0001-Remove-non-reproducible-SRCDIR.patch | 30
> > > +++++++++++++++++++
> > >  meta/recipes-gnome/librsvg/librsvg_2.40.20.bb |  1 +
> > >  2 files changed, 31 insertions(+)
> > >  create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Remove-
> > > non-reproducible-SRCDIR.patch
> > >
> > > diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-
> > > reproducible-SRCDIR.patch b/meta/recipes-gnome/librsvg/librsvg/0001-
> > > Remove-non-reproducible-SRCDIR.patch
> > > new file mode 100644
> > > index 00000000000..75fc7f9d0b9
> > > --- /dev/null
> > > +++ b/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-
> > > reproducible-SRCDIR.patch
> > > @@ -0,0 +1,30 @@
> > > +From bea5156cd7e7122715b26c769c35928141a1da2c Mon Sep 17 00:00:00
> > > 2001
> > > +From: Joshua Watt <JPEWhacker@gmail.com>
> > > +Date: Mon, 18 Nov 2019 14:46:34 -0600
> > > +Subject: [PATCH] Remove non-reproducible SRCDIR
> > > +
> > > +Removes SRCDIR as the prefix for finding the test font. This
> > > wouldn't
> > > +work anyway, since that path is not present on the target.
> > > +
> > > +This patch is specific to OE, since it appears that this entire
> > > method
> > > +of testing was removed when upstream was re-written in rust
> > > +
> > > +Upstream-Status: Inappropriate [OE-specific, no longer present
> > > upstream]
> >
> > what replaced it ( just curious ), can we backport the fix that removed
> > it or made obsolete ?
>
> A significant portion of the library was re-written in rust. This code
> appears to be only for internal testing and wasn't preserved when it
> was re-written (at least I couldn't find it in my cursory inspection).
> We haven't been able to upgrade the library due to lack of rust
> support in oe-core.
>

ah thanks. perhaps librsvg should be moved to meta-gnome or other layer
which can depend on meta-rust. there are 3 recipes in oe-core which seem
to depend on it and they all can use packageconfig to use it.

> >
> > > +Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > +---
> > > + rsvg-cairo-draw.c | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/rsvg-cairo-draw.c b/rsvg-cairo-draw.c
> > > +index caa9104..cfb7ed2 100644
> > > +--- a/rsvg-cairo-draw.c
> > > ++++ b/rsvg-cairo-draw.c
> > > +@@ -398,7 +398,7 @@ set_font_options_for_testing (PangoContext
> > > *context)
> > > + static void
> > > + create_font_config_for_testing (RsvgCairoRender *render)
> > > + {
> > > +-    const char *font_path = SRCDIR
> > > "/tests/resources/LiberationSans-Regular.ttf";
> > > ++    const char *font_path = "/tests/resources/LiberationSans-
> > > Regular.ttf";
> > > +
> > > +     if (render->font_config_for_testing != NULL)
> > > +         return;
> > > diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> > > b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> > > index 7f98127fd01..6dd0533a5de 100644
> > > --- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> > > +++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> > > @@ -20,6 +20,7 @@ inherit gnomebase gtk-doc pixbufcache upstream-
> > > version-is-even gobject-introspec
> > >
> > >  SRC_URI += "file://gtk-option.patch \
> > >              file://0001-Auto-detect-Bsymbolic-fixes-configure-on-
> > > macOS.patch \
> > > +            file://0001-Remove-non-reproducible-SRCDIR.patch \
> > >  "
> > >
> > >  SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
> > > --
> > > 2.23.0
> > >
> >

