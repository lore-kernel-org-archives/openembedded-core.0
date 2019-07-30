Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CB4547E687
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 09:47:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45yWtS0Wj1z5k;
	Tue, 30 Jul 2019 11:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564480032;
	bh=DZSRin2tZRiK94/Hwe6RIPc25njyCN59G5ydJ8hBYWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZi5s4rzrDUW+GfNUAEesd5vthSN4SNoSQGAJfzOD+yXtDNtm/S8gy+owjUfsHReN
	ps4hiA11lVw44yTxXFcFuBJjy3gMHi3UnOU9ftO2tyQld5sI8pKwN3i/DIY/KiGPN4
	CDtjTU3lGFnkg2g23eL/eQJJ2jVvfkpP9n0IKiTvoXkZvdHSS83moWRrqOIFNpKGQc
	5f0/hBUqbr+elJV4W6vnoZOAtZ/srfh1+CJZLPCGglwHZtpw3MQlQT5rEo3B6S7uf3
	+SQ8CcCIC/wahqaR8XT0SVgjx7caMQ4ek0XB8i9iynt16WIII+ld/x7zHxuRRdKGlE
	0qNJC/QFl450jJZpC0PPllrI9fA8UbHYOUwsnz9Ch/rJaNdj1FtnQcvBVMY3NyNPaZ
	rLZ41r61pJK6Isz4meJT6dyLGIFF1fJHLB4dldnnH/vru2Mv0wGzdS0a0oHjEX3H2O
	YLN5BPffrMYRLkAr2fiCwylaMFkxLfOw4a9FwMzNEoYqoL40iaBkVYQw7qA/x1HC8k
	2+QhEa9IEQBRMG5yOUy9Nk8BVgSCSw4KCL09ttcliu03NNggjYPwiBSphKMM784B1h
	sypZuNyNq1SGzcoXoxdAqCMoKs6ej7C5NghtujixXpYRkt/yfaEQw9rgC4JZa0E3eH
	NXsTupGpSx1KchDwVyBa0k+Q=
Date: Tue, 30 Jul 2019 12:47:10 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190730094710.GB11235@localhost>
References: <20190729100020.10517-1-bunk@stusta.de>
	<5acdfa6c-f88a-7812-a0b1-108e4532ebbd@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5acdfa6c-f88a-7812-a0b1-108e4532ebbd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Remove RECIPE_NO_UPDATE_REASON and follow the ESV releases
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
X-List-Received-Date: Tue, 30 Jul 2019 09:47:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jul 30, 2019 at 02:20:40AM -0700, akuster808 wrote:
> 
> 
> On 7/29/19 3:00 AM, Adrian Bunk wrote:
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  meta/recipes-connectivity/bind/bind_9.11.5-P4.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
> > index 1355841e6b..93c406f778 100644
> > --- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
> > +++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
> > @@ -26,8 +26,8 @@ SRC_URI[md5sum] = "8ddab4b61fa4516fe404679c74e37960"
> >  SRC_URI[sha256sum] = "7e8c08192bcbaeb6e9f2391a70e67583b027b90e8c4bc1605da6eb126edde434"
> >  
> >  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
> > -UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
> > -RECIPE_NO_UPDATE_REASON = "9.11 is LTS 2021"
> > +# stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
> > +UPSTREAM_CHECK_REGEX = "(?P<pver>9.(11|16|20|24|28)(\.\d+)+(-P\d+)*)/"
> 
> So are you setting the package update policy to LTS only ?

RECIPE_NO_UPDATE_REASON was a bug in any case since it prevented 
upgrades on the 9.11 branch.

> Its a function over maintenance question.

Yes.

> I don't understand why this package is being singled out. I think it
> should be an OE  architecture discussion

My impression is that the default in OE is to follow upstream LTS,
and not doing so would be the exception.

> - Armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


