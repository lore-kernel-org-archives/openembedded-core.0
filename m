Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REq7c-0004kf-AG for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 00:20:56 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EMLoLU003245 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 23:21:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 57xX6gLRq5yp
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 23:21:50 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EMLkDq003216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 23:21:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 23:15:02 +0100
In-Reply-To: <20111014160553.GM3542@jama.jama.net>
References: <1318603356.2342.20.camel@ted>
	<CAP9ODKod1GCk5gFPq0YkEPb0rZ3NHsD6YBu7cAQVDPLW0PN7xA@mail.gmail.com>
	<1318605925.2342.24.camel@ted> <20111014153034.GL3542@jama.jama.net>
	<1318607759.2342.28.camel@ted> <20111014160553.GM3542@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318630511.2342.52.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] mesa-dri: Enable swrast only by default and intel drivers only on IA platform
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
X-List-Received-Date: Fri, 14 Oct 2011 22:20:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-14 at 18:05 +0200, Martin Jansa wrote:
> On Fri, Oct 14, 2011 at 04:55:50PM +0100, Richard Purdie wrote:
> > On Fri, 2011-10-14 at 17:30 +0200, Martin Jansa wrote:
> > > On Fri, Oct 14, 2011 at 04:25:16PM +0100, Richard Purdie wrote:
> > > > On Fri, 2011-10-14 at 11:46 -0300, Otavio Salvador wrote:
> > > > > +1
> > > > > 
> > > > > Just another thing, I'd prefer to have DRIDRIVERS as ?= so machine can
> > > > > override it.
> > > > 
> > > > I really wouldn't recommend overriding this on a per machine basis, it
> > > > needs to be on a per arch basis. This is because the recipe is not
> > > > machine specific (nor should it be).
> > > > 
> > > > Configuration therefore falls to the distro, not machine.
> > > 
> > > Why not make it machine specific only when machine provides own module
> > > (like the case with glamo on om-gta02)?
> > > 
> > > Or recipe cannot change PACKAGE_ARCH in some special cases (like
> > > $MACHINE in path to some file in SRC_URI) anymore?
> > 
> > It works just fine but its not nice practise in my opinion for a library
> > like this and I don't see there is any need in this case. Certainly I
> > don't see it as something OE-Core should be recommending.
> 
> So can I send patches adding my glamo.patch to libdrm and mesa-dri so we
> can add glamo to 
> DRIDRIVERS_armv4t ?

No, what I mean is if the layer containing that machine appends those
patches for arm in general (or armv4t), you can then enable the dri
drivers for armv4t in general to.

It means you would have to keep the layer enabled whenever generating
armv4t feeds but I think that is ok as long as you know about it?

Cheers,

Richard



