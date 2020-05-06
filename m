Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web12.1853.1588749562229165330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 00:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=FJKytcz/;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588749565; x=1620285565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kmf0WLOanvnaze9wM0sbcLxz1Pcy6C50AB2ah7MoxkQ=;
  b=FJKytcz/UH0W3WM5/YOCAPy3ovl1lgiEOh4/qU6yijkDwQYkCmDoox/7
   DEQp0HqmyJWjxEY2Sw2NQhhdX76Ffmv2Ni8s04/Oq8rk2Va1HdDC/jGne
   +y3/YPNNzJyH5AO3fHx5AN5+dv/EAvtVZtgqowEHzODmBvEwaM9RWtJ2R
   HXkuy/rRT5Yp1s447CljMTha8/tmSVbJrgL7fIQerBuDaBX/dwqUSHVee
   +A9aFjfCZ0nlJeYew/5/HhBoFdbuHG8XFtahjejgJ+DlEPzUJw54I8ER7
   extrBcZM5AwDE2cg49Gx+rNjEjcNJRE5PIsNV0q0ld/BQqSZ2VlLEYNtB
   g==;
IronPort-SDR: zPUIqT9dKmVgsXCupzyAQAsFNrLsusHT1pbZptkaECYzG0pVMKkTc6xQEkeZ8uIkIl2CD4iQ7G
 mdBN/ljI8gfPimgA4TFAfsBRnFMcqJ9WAt2HFJJKuG9qnRnPlX92Qa1DNOTBAZngVPO0dETQyB
 P4jFh9x5TnR+g8Y7RPDhT5YRAhX0CyvWLTJdwCQCFhb+AdoSf6N2g5VlToN3Hbn3v6TXHhf48Q
 NizEiQY611w6mSngp4W3RZmNS2laqENcsE9vRL2py9P2C24trdK+E3movkL3j7Jlz5VGi6dzJ2
 QNw=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="2575498"
Date: Wed, 6 May 2020 09:19:19 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Adrian Bunk <bunk@stusta.de>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] dtc: update to 1.6.0
Message-ID: <20200506071919.GC250994@pcleri>
References: <20200505115535.141557-1-richard.leitner@skidata.com>
 <20200506071016.GA31672@localhost>
MIME-Version: 1.0
In-Reply-To: <20200506071016.GA31672@localhost>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 06, 2020 at 10:10:16AM +0300, Adrian Bunk wrote:
> On Tue, May 05, 2020 at 01:55:35PM +0200, Richard Leitner wrote:
> >...
> > --- a/meta/recipes-kernel/dtc/dtc_1.5.1.bb
> > +++ b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
> > @@ -3,7 +3,7 @@ require dtc.inc
> >  LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >  		    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
> >  
> > -SRCREV = "60e0db3d65a1218b0d5a29474e769f28a18e3ca6"
> > +SRCREV = "v${PV}"
> >...
> 
> It is tempting to use tags, but it is a bad idea.
> Upstream might move a tag to a different commit.
> Someone might do a man-in-the-middle attack on a specific user,
> and there is no other verification of the sources apart from
> the commit hash.

Thanks for the info. Is this documented somewhere?

How should I proceed on this patch as it was already applied to
master-next? Should I send a v2 or a "fix patch"?

Furthermore I'll send a v2 for my other series which is not applied yet
(https://patchwork.openembedded.org/patch/172341/).

regards;rl

> 
> cu
> Adrian
