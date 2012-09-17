Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TDQFE-0000Ka-M7
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 03:35:28 +0200
Received: by pbcwy7 with SMTP id wy7so8072564pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2012 18:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=/J9kRvzo3xGkdxr/sPxpVGhOEu19CtbAFfw0GSne1jA=;
	b=kyOhBDln7qpReXfCTK6/W7YDmUSN/FVkcAeJBRbudzUYvmP+BenzniGcZ5JpMUPlK7
	C4WMNNv9LrMQTfuC000tkRrfVkyVnJBpfFRhH/wXGHyJR/u2JP0lbnFsy4CMbe5Gqboe
	4pJyUKhLYxbHi+8SPYHIYq6s+qW/amdGoWYWHK+Wx8kCYgm6zGTagTwygJ8+rjwByROo
	PdQy7yxlgnhPmPAth1L9N5hMBnw2uPvCGHP1YepnvTP69AY4cnQzkK4GM3wHYHoeAKxR
	MHfp2PzVgQGoFGPZwjfZs5GdXuszVZHA4wFMVP4qncprpJMRHuvtnclx44ZiqWG0SOF3
	X/Cg==
Received: by 10.68.234.65 with SMTP id uc1mr19091608pbc.89.1347844969992;
	Sun, 16 Sep 2012 18:22:49 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id gf3sm6020403pbc.74.2012.09.16.18.22.48
	(version=SSLv3 cipher=OTHER); Sun, 16 Sep 2012 18:22:49 -0700 (PDT)
Date: Sun, 16 Sep 2012 18:22:34 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20120917012232.GA30291@sakrah.homelinux.org>
Mail-Followup-To: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
	<20120916060626.GA3628@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120916060626.GA3628@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils 2.23 call for testing the recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 01:35:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/09/12 08:06), Martin Jansa wrote:
> On Wed, Aug 08, 2012 at 10:45:19AM -0700, Khem Raj wrote:
> > Hi
> > 
> > Binutils 2.23 branch has started upstream. Given that toolchain
> > components require a lot of soak time, I have created the recipes
> > for binutils 2.23 and pushed it here
> > 
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.23
> 
> After last rebase of this branch, upgrade from 2.22.92* (or something
> like that) to git with SRCREV d56d3537a00d85d9072156026f426c931ba21fba
> 
> I see errors like this
> https://lists.gnu.org/archive/html/bug-binutils/2012-09/msg00036.html
> when building 2.6.39 kernel for armv4t
> | arch/arm/lib/copy_template.S: Assembler messages:
> | arch/arm/lib/copy_template.S:100: Error: selected processor does not
> support ARM mode `ldralt r3,[r1],#4'
> 
> Is it binutils bug or something needs to be changed in kernel again?

This is a binutils bug
see discussions on
http://sourceware.org/ml/binutils/2012-09/msg00128.html

> 
> Cheers,
> 
> > 
> > If you are using angstrom set
> > 
> > ANGSTROM_BINUTILS_VERSION = "2.23" in local.conf after pulling that branch
> > for OE-Core it will work as it is
> > 
> > Let me know if you see any errors.
> > 
> > I will keep updating it until 2.23 release
> > 
> > Thanks
> > -Khem
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
-Khem


