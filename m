Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7C17F7E686
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 06:32:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Jt7N0x9tz29;
	Thu, 29 Aug 2019 08:31:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567060320;
	bh=pkaIOHzG94K8dSNG2CZUYEzwjZSjL249e0/nCkbzOKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JIe1B6aYZ/vOk1TKOk4dKLoPoaXwNPLhOSQeEeWv5KhtFMaqnKcxgT2VocJkA/856
	nt0f17YKuFdDY/OQU6AgtuccqBznrT6mg8PN2eQHEz3K26tFC3o84geXrCw0z4xi0J
	X57DwStwJm2iSl9rpoQMm/x2Br6PqxnM0I5xS3dgJznF83O7yt7G6bfTtM46TAZa/R
	vgyk9ieJ6zJszS1erHIcYvr58+6yLf7OibaVYScl5+Wy9yiw/MhKfluVxgQyku5e3O
	rKImaovdB2YgfbBGtRNlLTftmXuh3B7rZif7wElJh+Si20f4jfE8puhm5ilRvIhQUb
	s5MFEBGUYx6WKWg4K2Tj5s72nUkxXx0pwYUY+V/IFoUHs2oJUU5q/0euHOYAkDHUJk
	qgIgE96/9H6JfbW4f0Wrp0EV8aKfDHcnnYRC5jeTrUXWp5KCr/0+7k3B+ZXE/7YCbP
	NMtCJ7TDZGp/MF/zpqNU6UQpN2fslad2qeGhqw01mhzIJH1L8oYpnDcws4OOZlGNk1
	cDZJeQ47XVll2EYpZYKJSLmp5+TAQT1ytGW5qArvdfLa9ow0+JpTqcRxogJXCQ5wlV
	nDsMCQ0SzHraylQ1BiweYD/lBahfnAWT3EVQXPRcaX+VA9czCyMJKZbhYh7Hfla0im
	FnXSv4C13Gdb9aWDR3qEICxc=
Date: Thu, 29 Aug 2019 09:31:58 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20190829063158.GG3044@localhost>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
	<20190828200536.GD3044@localhost>
	<CADkTA4MBTDFUam5xvwvc0KKO+fX7ZfmBYtoe6_ZdrnspJok7Rw@mail.gmail.com>
	<20190828215810.GF3044@localhost>
	<CADkTA4NbtkgR2LrZC+Srtn-BC+6q=7HQH9S7tbJ3H4u7=HQm7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NbtkgR2LrZC+Srtn-BC+6q=7HQH9S7tbJ3H4u7=HQm7w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Thu, 29 Aug 2019 06:32:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 28, 2019 at 06:06:04PM -0400, Bruce Ashfield wrote:
> On Wed, Aug 28, 2019 at 5:58 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Wed, Aug 28, 2019 at 04:11:43PM -0400, Bruce Ashfield wrote:
> > >...
> > > There's zero risk to these, and no reason to sit on them.
> >
> > What range of LTS kernels is covered by the "zero risk"?
> 
> It has nothing to do with LTS kernels.

virtual/kernel is special since real products have this provided by
a BSP layer instead of using the kernels for the reference platforms
that ship with Yocto.

How do your changes interact with a BSP layer that provides
the upstream maintained LTS kernel 4.4?

> Cheers,
> 
> Bruce

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


