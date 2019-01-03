Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 867E2747E7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 22:57:15 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id t18-v6so31039222ljd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 14:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2X4/0TAm23z4c0kiUvzz+3lZDLLCdZXekXuyA3k4Dzg=;
	b=rJcW/mCz8coyxIK8zykaakJoVZl1pG/x+yCeLPmn15TKIkfMrBR87su5RKZn51gIqF
	jw10dXjPLz06NETB9BSCn55ot3pJjM6pjWhxL42TE5swwo4XKkuNSnPxKcQooWxgtXRh
	YNwKtbSsSwONs597qkbfwKHlgROVgfo9KqNFAaLg4PdfzDkfmIJ+1n8m1m+mRcTYLinu
	czCeKwQXUBx7r1W5KbjTmFuWZFwwBdKebUM9pGlPk0rvkr/00AglZdHi+Pxg6hCN/wZF
	a/k8Iu85Xxbq+lJlR1kqP07nTnMki90YZ44mM3ydgsQFHIyoynLHDdUioArivTP8HJJI
	vC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2X4/0TAm23z4c0kiUvzz+3lZDLLCdZXekXuyA3k4Dzg=;
	b=F1xfCEgmktdasKHFSZyi2hGctX/Qbok8wCePFWNB6lmDCqEgz7yPCxW2biMUvLdoY7
	i7BJ1sD3MvWmlvCahUlqfHXUdytx6yy2TeU30P6GtZ+wxob8WxN0y5d47GySpAbXX0td
	PNdIAFuxQt+AP/s/k17EBrenBIcAsXpdy6uy9uD36T22JZR3mAfIe4spjjDokctlZ01c
	xuncZWn1JhpgR248rEiXRUUQT5urH5WuYfo41qUtfFXroPBmZP7f3hC7yuKTXuyJgzkt
	weJECALSfk9aMRZ1TBB0bg8ro2ZqiEAdb5gXlx8p/WVvW0Oja4/DVsTRmcGR1o3Bx/WC
	4wAw==
X-Gm-Message-State: AJcUukcNiOd4cRyo/27Xqxq7s5HzYRjlSDU2GPuKiHMiGhe8iSX2Z/SO
	qGhbgZyp4hACHBAODazWqIurv0tINiVTgXcQvKQ=
X-Google-Smtp-Source: ALg8bN7tjNhcVHCgguDW5ffdnnSJcLsNpnjQ96rN1z9a6RaWcewB+/YEqHcx/Y5uXQqyhU2iICkDgyBw51gTKbif2es=
X-Received: by 2002:a2e:449b:: with SMTP id
	b27-v6mr26915164ljf.47.1546556235995; 
	Thu, 03 Jan 2019 14:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20190103223016.17799-1-alistair.francis@wdc.com>
	<CAMKF1sqHkyX6dvC6WWZW-LtDthFDCvFEfd5VP2d1STSeamx+EQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqHkyX6dvC6WWZW-LtDthFDCvFEfd5VP2d1STSeamx+EQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Jan 2019 14:56:47 -0800
Message-ID: <CAKmqyKOjrjFKuqx6vhL=J1bY+Li1Cd28j6hYRFu=XUv+E=796A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] swig: Fix the build
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
X-List-Received-Date: Thu, 03 Jan 2019 22:57:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 3, 2019 at 2:33 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Jan 3, 2019 at 2:30 PM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
> >
> > Fix the swig build by calling autogen.sh before running configure.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/recipes-devtools/swig/swig.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
> > index aec544997f..49da68c544 100644
> > --- a/meta/recipes-devtools/swig/swig.inc
> > +++ b/meta/recipes-devtools/swig/swig.inc
> > @@ -11,7 +11,7 @@ DEPENDS = "libpcre"
> >
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> >
> > -inherit autotools python3native pkgconfig
> > +inherit autotools-brokensep python3native pkgconfig
>
> this seems to be going backwards.
>
> >
> >  EXTRA_OECONF = " \
> >      --with-python3=${PYTHON} \
> > @@ -45,6 +45,7 @@ do_configure() {
> >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/Tools/config
> >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
> >      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
> > +    ./autogen.sh
>
> may be just (cd ${S} && ./autogen.sh)

That seems to work, I'll send a v2.

Alistair

>
> >      oe_runconf
> >  }
> >
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

