Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.10945.1631105660947133357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 05:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C59B8FF808;
	Wed,  8 Sep 2021 12:54:18 +0000 (UTC)
Date: Wed, 8 Sep 2021 14:54:18 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 7/7] package_rpm: use zstd instead of xz
Message-ID: <YTiyelo2c53gbo8Y@piout.net>
References: <20210830184800.954770-1-alex.kanavin@gmail.com>
 <20210830184800.954770-7-alex.kanavin@gmail.com>
 <YTie/qN+H1Yo4qjp@piout.net>
 <CANNYZj9BCohUTvCt0GJs-VLtih47xi4k=ptVrSYjV2Z9abJLdQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9BCohUTvCt0GJs-VLtih47xi4k=ptVrSYjV2Z9abJLdQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08/09/2021 14:05:34+0200, Alexander Kanavin wrote:
> On Wed, 8 Sept 2021 at 13:31, Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
> 
> > On 30/08/2021 20:48:00+0200, Alexander Kanavin wrote:
> > > zstd has similar time and space performance in compression but is
> > > vastly faster in decompression, which benefits rootfs creation
> > > (especially when installing very large packages) and on-target
> > > package installation.
> > >
> >
> > I believe this caused the following repo failures:
> >
> >
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210907-bv62etev/packages/diff-html/
> >
> > I started a subsequent build without the patch and it have the issue.
> >
> 
> Can you provide the link to the build itself please?
> 

Sure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/641/steps/13/logs/stdio


I also have this one with the patch removed but with the previous lua
patches and it only has a lua issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/628/steps/12/logs/stdio


> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
