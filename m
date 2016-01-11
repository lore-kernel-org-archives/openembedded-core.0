Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 66641731CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 19:52:17 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aIiVl-00032D-DR; Mon, 11 Jan 2016 20:52:17 +0100
Message-ID: <1452541920.1950.27.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jan 2016 19:52:00 +0000
In-Reply-To: <4A8643CE-5D1C-45E5-8E89-891B18CDE7A6@gmail.com>
References: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
	<1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
	<20160108170054.GB2573@jama>
	<CAJ86T=VQdAB9dRRb4c_XmFOO+BxH13ar=-Fi209Z59Ry6zVy1w@mail.gmail.com>
	<4A8643CE-5D1C-45E5-8E89-891B18CDE7A6@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][RFC] arch-armv7ve.inc: respect armv7a override as well
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
X-List-Received-Date: Mon, 11 Jan 2016 19:52:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-11 at 11:10 -0800, Khem Raj wrote:
> So I was asking was what improvements do we get if we choose armv7ve as tune
> and I did not get any definitive answers. 

If you compile with -march=armv7ve then you get the integer divide
instructions, which are not enabled under -march=armv7a.

>Why shouldnt we keep using armv7-a and tune the handful of apps to
>armv7ve where it is required.

That'd be a distro decision.  I agree that if you are targetting a mix
of cores, some that have hardware div and some that don't, it may not be
sensible to compile everything twice and you might want to standardise
on armv7a as the least common denominator.  But Cortex-A15 is
widespread, and I think people who select tune-cortexa15.inc would have
a reasonable expectation that it would, indeed, tune for the
instructions that their processor supports.  That's not to say that it
necessarily needs to be a generic armv7ve tune of course.

> We should strive to reduce this tuning mayhem
> on arm especially.

I agree with this, though.

p.



