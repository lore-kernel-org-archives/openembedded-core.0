Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A14427FB46
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 15:02:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 471Lg64nsVz3P;
	Sun, 27 Oct 2019 16:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572188546;
	bh=Z818CvLprZiEaaY0m9ebTf4DQRwXwyu+KyHU2iXhYZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmZmEklrhwxxYpbN/qJYMj6xRMBpLNCTblhzYbI2nbt8RK4wXQUUvjWUkI6NwTSfG
	tb2DROAQ8txloht2UBcIul98wMBH5lTFLzgoM3i1k0UJfZDrWXX8GrRjM6dIHz/g+B
	FTZMfHOO+ri7xfI2L7S6YigY4TFeWaN9LrmJUA1Jr9KqEzU2ErXvtQ4F9kWoCYQZ1z
	RDS37EiBtrio5ryrpOobVi4iQ2AOVv8yHWPjGyCjGc4GAC73ZINkldeUEL02gGuznn
	4WtNDZ5Cq0WaOlWmhknuV+PMYaBg6SAMusfnpT9LG6j1hveSA432rXZDSlWDk3rsqq
	/UFoVzHHB8HPdV/yhFFw817codWnYEIKAe9FHoCRwlXFwEhUh9X+xMSezn0SwvsU+K
	vjHSjYt1XXqb44SvNmhD+Sl+jvh8bQUduJd7KNbzdBBMUxv4QevPzezzvAaX8YBU5M
	nyin7ZV9V+X1A9rZFfhmJoT6njA3of9QQTicfK6x1vatY019Of3v3U59nXrgwwSxOm
	PEXsaC1+LHQCYqMCe0fBDxFRERqyb8CqbGuMcVh3JakVMLAfuxc4izhipGiRJQ+Qxh
	GxAbZHrZKPxnX3LQpuDLcn6CLf3G2IhpAx/RizdRSqBPt9gZea9KkNMGGVBikYzfMD
	ixM+xhi1WPho00p+j3PAnTa4=
Date: Sun, 27 Oct 2019 17:02:24 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191027150224.GA31803@localhost>
References: <20191026204216.9298-1-bunk@stusta.de>
	<692a8a3168c76b755d96c5db51f2da0ee91f555d.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <692a8a3168c76b755d96c5db51f2da0ee91f555d.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnu-efi: Upgrade 3.0.9 -> 3.0.10
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
X-List-Received-Date: Sun, 27 Oct 2019 15:02:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Oct 27, 2019 at 11:48:38AM +0000, Richard Purdie wrote:
> On Sat, 2019-10-26 at 23:42 +0300, Adrian Bunk wrote:
> > Part of patch fixed upstream removed.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  .../gnu-efi/parallel-make-archives.patch       | 18 ----------------
> > --
> >  .../{gnu-efi_3.0.9.bb => gnu-efi_3.0.10.bb}    |  4 ++--
> >  2 files changed, 2 insertions(+), 20 deletions(-)
> >  rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.9.bb => gnu-
> > efi_3.0.10.bb} (95%)
> 
> I think this caused:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1402

Thanks, v2 sent.

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


