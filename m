Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.163.1599767734695645918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 12:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 11CF140C1C;
	Thu, 10 Sep 2020 19:55:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDG6oy6tOVbP; Thu, 10 Sep 2020 19:55:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DEA7940BFD;
	Thu, 10 Sep 2020 19:55:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 49EF217446F; Thu, 10 Sep 2020 15:55:32 -0400 (EDT)
Date: Thu, 10 Sep 2020 15:55:32 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] cryptodev: bump 1 commit past 1.11 to fix 5.9-rc1+
Message-ID: <20200910195532.GE17660@denix.org>
References: <1599700598-39322-1-git-send-email-denis@denix.org>
 <CAMKF1sp9wrwonL4iW2MWcGqK557vP5Ci-hprdu+zLx0bbm1FwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp9wrwonL4iW2MWcGqK557vP5Ci-hprdu+zLx0bbm1FwA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 10, 2020 at 08:46:36AM -0700, Khem Raj wrote:
> On Wed, Sep 9, 2020 at 6:16 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > There's one commit on top of 1.11 release that fixes builds against kernel 5.9-rc1+.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > v2 - append SRCPV to PV
> >
> >  meta/recipes-kernel/cryptodev/cryptodev.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
> > index 906f4fc..027d636 100644
> > --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> > +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> > @@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >
> >  SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
> >             "
> > -SRCREV = "2299d39475e91392abd050ea09f2d20feecb4adf"
> > +SRCREV = "fabe5989a3dc9fba0cd0a40b612247cdde351c01"
> > +PV .= "+git${SRCPV}"
> 
> I just saw that this change does not go well with some of
> meta-freescale changes which uses the inc file paired with PV, so
> perhaps keeping the version at same PV
> or creating a single patch is better.

Well, it's unfortunate that it affects some downstream layers, but that never 
stopped changes in OE-Core before - as a maintainer of few downstream layers 
myself, I had to adapt to such changes in the past many-many times...

Anyway, alternative would be to use v1 of the patch.


> now ends up with.
> 
> ERROR: ParseError at
> /mnt/b/yoe/master/sources/meta-freescale/recipes-kernel/cryptodev/cryptodev-qoriq-tests_1.11.bb:2:
> Could not include required file cryptodev-qoriq-1.11+git${SRCPV}.inc
> 
> 
> >
> >  S = "${WORKDIR}/git"
> >
> > --
> > 2.7.4
> >
> > 
> 
