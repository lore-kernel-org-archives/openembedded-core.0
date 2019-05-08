Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B55997DE7D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:01:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44znR125zTz5k;
	Wed,  8 May 2019 22:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557345661;
	bh=3pbkJKGPWa9IcmzEVX6bJ4tgZyliMjxtxshTDCzrMzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpgQjlPKhL9UKNwxRz8f57qpM8I7d21bkGV/Bpx7aq6LwRp3sLayieZQLNw0Wn5OJ
	GeBcSmKEaW1aUJPkb+Qbz2rckTa+fHLtvBhfBpvquQ4XV/y5DesinHiFStMulu4PXU
	o3NpyUZm+7ixMiWZ9wMEFkpidgn0IGwFtf3jAzQZrg2+7pNzwsOW3wBbBMBLEnbHyD
	/InZD34nXptFtTuRHNG/SrH70cK53ERsvo9bpmKm8fWpA6iHNow9W2h5rYrof8BzcX
	tawmlLrRNqYXxriMU6HamkB4c3w9GbiCTjQmAGUgXHEUAXhbn+FQy3pIUnA7Kx9/Xj
	idqvrY9cNIOco4qniL4VTBM4EUPMjYDDVPvDF6Czx3xAY+s1trRpTt6yvSIbL3vxur
	Qjpz1dY+35yuclZX9EBYlPcXNs10u97tmO5mwE1OGoULm1kfKbTmhDvvh+eLEI7V9C
	IVjWzW06Kp6TC7J7OI6/mjnP1UBP5Io7xRyNZAF5t6xjiBe46/XAOXKaE0QNlH+mJt
	3xORClXHJ7g2sJzMxlOGVGn+E0ecdvEqX2pKB/EzJL/kURZwnLfO/ZRCr/yWfrDaKc
	cxDVz+Oe9gIWgIU9eEd+BryyMzHxoEF9oU8hsowzqKdlmEn0woGBRW2BIjDezKNfMY
	KMXjuz9UOb5ZqRX0PPX8h6aw=
Date: Wed, 8 May 2019 23:00:59 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190508200059.GA18736@localhost>
References: <20190507131151.31070-3-bunk@stusta.de>
	<ac92e6664c5856848367f40fddbdc53391f0388a.camel@linuxfoundation.org>
	<9e94caa227eac98a7a48a6433c722e2a309663de.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <9e94caa227eac98a7a48a6433c722e2a309663de.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ofono: upgrade 1.25 -> 1.29
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
X-List-Received-Date: Wed, 08 May 2019 20:01:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 08, 2019 at 01:48:14PM +0100, Richard Purdie wrote:
> On Wed, 2019-05-08 at 13:32 +0100, Richard Purdie wrote:
> > On Tue, 2019-05-07 at 16:11 +0300, Adrian Bunk wrote:
> > > Remove patch applied upstream.
> > > 
> > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > ---
> > >  .../ofono/ofono/use-python3.patch             | 27 ---------------
> > > ----
> > >  meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
> > >  meta/recipes-connectivity/ofono/ofono_1.29.bb |  8 ++++++
> > >  3 files changed, 8 insertions(+), 36 deletions(-)
> > >  delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-
> > > python3.patch
> > >  delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
> > >  create mode 100644 meta/recipes-connectivity/ofono/ofono_1.29.bb
> > 
> > A local build of this failed with what looks like a race:
> 
> Also on the autobuilder:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/570
> 
> I also confirmed that rerunning the compile did succeed confirming it
> is a race of some kind.

I was now able to reproduce exactly once, but not afterwards...

I'll send a v2 with a fix that matches the error message.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


