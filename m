Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 589667E1A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 11:45:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457Ypn08Jbz6p;
	Tue, 21 May 2019 13:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558439105;
	bh=/HxFY8Aq03eLGsYnt0NvH6Bmz66WM+uDDPTYPJRtrqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WoZQZYj+UM2wV8+Lkd1Md8sfvGTuzv/FH64iECbCfXFvfV5gzAFzpoaeNz2uRnWgK
	aA8z7Sr2irGxPdeq3MBWgGzw1pvv4S3OPZTVKwsMr+PlAHYchQeGwl7PrGtla0HDSc
	CaHlUOdcs4Fy0LKSxNY7drtzQtkkkZOuv9sGTNmJZYdsorJSon2vMpkVlY4/sTwjAt
	vrcIUCOXrMibbRNMU1qzwrAHNdHzpeIYYCfLZHVgjWwIFYEROPO7ASBtDiBklBiogO
	jKtiZ/UXi15W67SEk7aW92aod3ZVm9wnq5xQ3/whw3UpvfsJqSIyxGkCWDWpSjTgMq
	TfUk5FRkPZ215BT1q4Z/34iyE/LV0UYlZpfg6DXkjMvQNvf5LJgY16JggX5D2+rfXa
	/3Bd2n4hK413XzVmrJGP4AC10LhdzhtIb0qMpR3jyBpKQtsxLQqFBYlnXqMi97n/pO
	qhKEHvmf4lb/fiT1PBRgDkbEXyZmWEiebuQx1yWD/9u04rYj4Z/2PtFD4ZWVehsMXA
	QZL11trTL0afH4RVorT0kr0Q1UztB+EhCwj0Ojx4CYvk8ZQZscFkrLR0siP3QGj2le
	P/HH/fdvMHXsF1lrnxgDKp/0arOcMe7fjwU5BYHGKL5iyYRItDDSnWpazyyYoWLgiR
	Kg3Cq3XUilm3gQGY2tnJjxZ0=
Date: Tue, 21 May 2019 14:45:02 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190521114502.GA25364@localhost>
References: <20190516085636.9992-1-bunk@stusta.de>
	<3271f12b90cabf68ba0a2223b48aaf24b723d79e.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <3271f12b90cabf68ba0a2223b48aaf24b723d79e.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] ofono: upgrade 1.25 -> 1.29
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
X-List-Received-Date: Tue, 21 May 2019 11:45:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 21, 2019 at 11:42:04AM +0100, Richard Purdie wrote:
> On Thu, 2019-05-16 at 11:56 +0300, Adrian Bunk wrote:
> > Remove patch applied upstream.
> > Backport two fixes for build failures
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> > v3: Another buildfix backported.
> 
> I merged this but it seems there are still some other races in there
> which appeared in later builds:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/67/builds/612

Fix sent.

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


