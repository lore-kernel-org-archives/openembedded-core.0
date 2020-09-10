Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.10762.1599698320619643567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 17:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0061A40C1C;
	Thu, 10 Sep 2020 00:38:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MvsTHruWFhO; Thu, 10 Sep 2020 00:38:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D708440B96;
	Thu, 10 Sep 2020 00:38:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 31A55174470; Wed,  9 Sep 2020 20:38:38 -0400 (EDT)
Date: Wed, 9 Sep 2020 20:38:38 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cryptodev: bump 1 commit past 1.11 to fix 5.9-rc1+
Message-ID: <20200910003838.GC17660@denix.org>
References: <1599688063-38109-1-git-send-email-denis@denix.org>
 <a1c03ca8-5c09-ee52-7912-42c560ca689c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a1c03ca8-5c09-ee52-7912-42c560ca689c@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2020 at 05:24:05PM -0700, Khem Raj wrote:
> 
> 
> On 9/9/20 2:47 PM, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > There's one commit on top of 1.11 release that fixes builds against kernel 5.9-rc1+.
> 
> since we call the recipe as 1.11, perhaps its better to explcitly apply
> this patch via SRC_URI or alter PV to reflect this SRCREV changes,

Yeah, we went back and forth on this - in the past we had a separate patch 
applied, as well as just bump the SRCREV. There's no standard so far - we've 
done both ways. If you want, I can just append SRCPV.


> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
> > index 906f4fc..c050eda 100644
> > --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> > +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >  
> >  SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
> >             "
> > -SRCREV = "2299d39475e91392abd050ea09f2d20feecb4adf"
> > +SRCREV = "fabe5989a3dc9fba0cd0a40b612247cdde351c01"
> >  
> >  S = "${WORKDIR}/git"
> >  
> > 
> > 
> > 
> > 
> 
