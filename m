Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1079B7C99C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 18:58:17 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id y15so1222358qki.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 10:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Bf54zvPeCWmScFWKrJWTZl2g5oFdleKLxEtEBdFxCmM=;
	b=oBXbzUrcdSqVqfoyx76GnsXIZJNUkbj1bW1V763gyDWMDootabW9s68Ctt7xRnteEy
	deBg5L6/7NggYg+Ygbyc7/dKyCIAQeVqFzHAF6nplF7WLXyxo4Ax2APkiHkOkhhKghPI
	2AG8fUzZeIvtWZc/gOJlkeMvOA9qcblzYBexRVoqhsNEYJxNE02TUzCxj6yUDFwhXPa0
	daR9JlG0DHfkPID2nekzdH7jFESVvz25a+2aIivCn6zOp4drvkxhIxTeaFm95vn3RexA
	9wjKoA+CJ+/IFZOrx4GKnvALAU3imLTRRH6x2i+MHW6B/6b8nicYtKwrHSLsa7K9KEJM
	tkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bf54zvPeCWmScFWKrJWTZl2g5oFdleKLxEtEBdFxCmM=;
	b=AsLo+kqdkU8+KWMKhviqTBwIx0XN8iQOJ2NK3CMV55yqJ6p+MeU0scaqS9W3ABAQ58
	SiTUWjdwLZne1F9xptOGr+1Ri+XnE8GJT3FyF6m23WL3BszV+yOj1LyMK8beZdEZ5rt7
	OKjZnebuMUa/77xHLCDKk7kYMImY2bKf9S0fnn8A30wzrvMoOOxylvsZTrm/1i4XJ8Jn
	PuU+a5Ug7ro1CRwx4AQStTSrnEVHXd4lV018mjEzCVHAfEd+ANAugA74KIylXM1oKJ6W
	itw4edSzy7fKep0Uzn63VFwtEdNUazD4lp+ffwfokt+I+Hv1kaXrbZt0W6NAtMJCux0A
	41aA==
X-Gm-Message-State: AHQUAubislSrGeVkSWXnSEySAV2rY3FK6GIjLAkNVFzSNCk0zP56ODOw
	9sz52WPpzvz1AFTy29UNzoCz0gZd2SQiZuDU0xw=
X-Google-Smtp-Source: AHgI3IbI65XH5maKFXi9h9XKgCHWY+qyRnI3QvarCxlDTkF6XPw0OuLsanLgfoxmwVSiTqZski1Z39gaT+WNNK9kDcQ=
X-Received: by 2002:a37:9e15:: with SMTP id h21mr27079470qke.2.1550689097918; 
	Wed, 20 Feb 2019 10:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
	<20190219000849.6177-3-richard.purdie@linuxfoundation.org>
	<CAMKF1sqKePayLE9-WXUe5Q9uv2qqFY7BRzfw67PdPbfDLAPijw@mail.gmail.com>
	<CAMKF1sp85fu5chPQfwL9TRQ+WHHrzddAj9FLJxQEd9VybW4mjg@mail.gmail.com>
In-Reply-To: <CAMKF1sp85fu5chPQfwL9TRQ+WHHrzddAj9FLJxQEd9VybW4mjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Feb 2019 10:57:51 -0800
Message-ID: <CAMKF1srTw-PdeNHswDubfXSAnuQ6-1KvSS7QUL94y-Phfy=XPQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] gtk+3: upgrade 3.24.1 -> 3.24.5
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
X-List-Received-Date: Wed, 20 Feb 2019 18:58:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 20, 2019 at 10:56 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This has been applied to master but here is another failure on musl/x86

I suspect this happens with gold linker and not really musl specific.

>
> https://errors.yoctoproject.org/Errors/Details/229302/
>
>
> On Mon, Feb 18, 2019 at 11:07 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > on ubuntu 14.04 https://errors.yoctoproject.org/Errors/Details/228774/
> >
> > On Mon, Feb 18, 2019 at 4:10 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/recipes-gnome/gtk+/{gtk+3_3.24.1.bb => gtk+3_3.24.5.bb} | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-gnome/gtk+/{gtk+3_3.24.1.bb => gtk+3_3.24.5.bb} (83%)
> > >
> > > diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> > > similarity index 83%
> > > rename from meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
> > > rename to meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> > > index 6de3e73f2f0..799cbd4707e 100644
> > > --- a/meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
> > > +++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> > > @@ -7,8 +7,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
> > >             file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
> > >             file://0003-Add-disable-opengl-configure-option.patch \
> > >            "
> > > -SRC_URI[md5sum] = "9dfe16f486573815f242fa400763feb7"
> > > -SRC_URI[sha256sum] = "68387be307b99aadcdc653561d7a2a7f0113b93561fb18ded7075ec9ced5b02f"
> > > +SRC_URI[md5sum] = "32862355c08f6af3e7848c695cd4081b"
> > > +SRC_URI[sha256sum] = "0be5fb0d302bc3de26ab58c32990d895831e2b7c7418d0ffea1206d6a3ddb02f"
> > >
> > >  S = "${WORKDIR}/gtk+-${PV}"
> > >
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

