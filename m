Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF1F97C946
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 18:56:51 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id b8so28425693qtr.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 10:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M2pnl+Pln+dM02h/r+SsYePS2/8R5Tq3FXo4h4iN/z8=;
	b=Y3V/vslr7JLytXYf51abod4GMNJ4v0nIHK6gNES1v0cXFG8cRhFGezuiQ2FiC45MTO
	TL4n7e3p+Dz1RPTwKiTaJLZU448Q/wljXJvkNWR7n7V2oEOYmYngVgSqjkq0rPM+V39g
	Ex7/Z4uJlqavLD1kR5EnftnyKKXJWUrfo8PFhkC2LKc0tQ/kPSdRE1eoshI1IxE4WVKE
	zNLRDaxh+f9VzUWuOzVcgV5UHreJulN/MlXTY3x+anEfpE4xCOh9m3tQSXL3SVgXK1bk
	qVyv7Wytgmv2hhqBzeA/677KibEp81vn/UWNBzTjRtiUrxBV9gSDE2syxckf28pdJAVS
	wTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M2pnl+Pln+dM02h/r+SsYePS2/8R5Tq3FXo4h4iN/z8=;
	b=YekCKqEEkfqPUkhpuJ9P3594BsbZ/V0krFQHa4FieTTnf0i+b09Ywg7n1ZytYzTjtb
	q3hbC+MRdKW9yVsRnE6ocrfl0wklf3T9UdxUE6ZndbxcFedw+Z2pxGxFj89XI264RPm1
	RB9SDOkpPTOJJcSOnE5v0uu8NIhcD7ZQhVTLDzf0IDAfZOU8qyzFhJBr9c6V87qfO9DA
	OZXxoECMojtvo+0WoehIpNTFCohGc3bvLQW78iXPx84A5Tk+C05hZ1OSmEz3zbNfTYJB
	IKu5qNtydNBHcj6UBV9yCCTLoBIAjAAbXs+vbLctuT9oxYbVpIVL2BiV9SNeYhGadWul
	Z9rA==
X-Gm-Message-State: AHQUAuZsh4S36hKdNgu6FQtHBCwAowfkxVr255H5IFHVbswgaTHhUbW6
	idosnphOra8OJSjCZJG8uqEhM+k42Q1i0RXdLZI=
X-Google-Smtp-Source: AHgI3IYjzUT3NQA9wpmhktSVkJR6FpbBGn/FobGvjMbve/KGhP4165H3/tL8+gERJNqUX62Ci2MiKNOKhuBQ91VkPRA=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr28799738qtn.253.1550689012553; 
	Wed, 20 Feb 2019 10:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
	<20190219000849.6177-3-richard.purdie@linuxfoundation.org>
	<CAMKF1sqKePayLE9-WXUe5Q9uv2qqFY7BRzfw67PdPbfDLAPijw@mail.gmail.com>
In-Reply-To: <CAMKF1sqKePayLE9-WXUe5Q9uv2qqFY7BRzfw67PdPbfDLAPijw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Feb 2019 10:56:26 -0800
Message-ID: <CAMKF1sp85fu5chPQfwL9TRQ+WHHrzddAj9FLJxQEd9VybW4mjg@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Feb 2019 18:56:52 -0000
Content-Type: text/plain; charset="UTF-8"

This has been applied to master but here is another failure on musl/x86

https://errors.yoctoproject.org/Errors/Details/229302/


On Mon, Feb 18, 2019 at 11:07 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> on ubuntu 14.04 https://errors.yoctoproject.org/Errors/Details/228774/
>
> On Mon, Feb 18, 2019 at 4:10 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-gnome/gtk+/{gtk+3_3.24.1.bb => gtk+3_3.24.5.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-gnome/gtk+/{gtk+3_3.24.1.bb => gtk+3_3.24.5.bb} (83%)
> >
> > diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> > similarity index 83%
> > rename from meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
> > rename to meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> > index 6de3e73f2f0..799cbd4707e 100644
> > --- a/meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
> > +++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> > @@ -7,8 +7,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
> >             file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
> >             file://0003-Add-disable-opengl-configure-option.patch \
> >            "
> > -SRC_URI[md5sum] = "9dfe16f486573815f242fa400763feb7"
> > -SRC_URI[sha256sum] = "68387be307b99aadcdc653561d7a2a7f0113b93561fb18ded7075ec9ced5b02f"
> > +SRC_URI[md5sum] = "32862355c08f6af3e7848c695cd4081b"
> > +SRC_URI[sha256sum] = "0be5fb0d302bc3de26ab58c32990d895831e2b7c7418d0ffea1206d6a3ddb02f"
> >
> >  S = "${WORKDIR}/gtk+-${PV}"
> >
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

