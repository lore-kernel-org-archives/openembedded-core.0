Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPryg-0005H3-VW for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 11:05:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q438tnfx030540
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 09:55:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30415-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2012 09:55:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q438tfe1030534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 09:55:42 +0100
Message-ID: <1336035344.30113.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 May 2012 09:55:44 +0100
In-Reply-To: <20120503054649.GD4658@jama.jama.net>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net> <4FA1A25F.9030502@gmail.com>
	<20120503053806.GC4658@jama.jama.net>
	<CAMKF1so4ut2C8xKXqSV9KXG1pYN9bqqbDCXFYiyR0L+x_rHJbg@mail.gmail.com>
	<20120503054649.GD4658@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 09:05:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-03 at 07:46 +0200, Martin Jansa wrote:
> On Wed, May 02, 2012 at 10:44:05PM -0700, Khem Raj wrote:
> > On Wed, May 2, 2012 at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > On Wed, May 02, 2012 at 02:08:47PM -0700, Khem Raj wrote:
> > >> -----BEGIN PGP SIGNED MESSAGE-----
> > >> Hash: SHA1
> > >>
> > >> On 05/02/2012 07:09 AM, Martin Jansa wrote:
> > >> > On Wed, May 02, 2012 at 03:59:45PM +0200, Martin Jansa wrote:
> > >> >> From: Tomas Frydrych <tomas@sleepfive.com>
> > >> >>
> > >> >> These are required to build recent versions of glib-2.0
> > >> >
> > >> > similar patch is needed also for other site files, just noticed it
> > >> > while building for qemux86-64
> > >>
> > >> would you also include rest of architectures too please ?
> > >
> > > I did for x86 and x86-64, for the rest I don't know the right values or
> > > care enough to find them somewhere.
> > 
> > will this upgrade break glib for architectures that have wrong values
> > for these vars ?
> > if answer is yes then I think we should do that before applying this
> > upgrade otherwise
> > it will be a regression
> 
> glib-2.32.1 will build there fine, but glib-2.32.2 will fail during
> do_configure, so yes someone should add those.

Lets be really clear about this, glib 2.32.1 will build fine but crash
at runtime due to divide by zero errors.

I'm not taking any glib patches until we have this working on the core
architectures we support.

Please can people not send upgrades which knowingly break things. I'm
fine having a fairly aggressive set of updates but anything with serious
breakage like this will get reverted and cause me to consider patches
from those person long and hard with a lot of testing before merging in
future.

Cheers,

Richard



