Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdONw-0004xA-Fy for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 16:47:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLFe9FK010440;
	Wed, 21 Dec 2011 15:40:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09981-04; Wed, 21 Dec 2011 15:40:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLFe1Qo010424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 21 Dec 2011 15:40:02 GMT
Message-ID: <1324482003.18348.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 15:40:03 +0000
In-Reply-To: <756581D3-FAA6-48FC-9ECE-0B7CC1262A5D@dominion.thruhere.net>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<1817157.LPoMfdErnK@helios>
	<7B929D63-E14F-44F8-81B2-49AA90181BA0@dominion.thruhere.net>
	<4077851.vBmcQh9dAf@helios>
	<756581D3-FAA6-48FC-9ECE-0B7CC1262A5D@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] psplash fixes
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
X-List-Received-Date: Wed, 21 Dec 2011 15:47:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-19 at 19:48 +0100, Koen Kooi wrote:
> Op 19 dec. 2011, om 19:32 heeft Paul Eggleton het volgende geschreven:
> 
> > On Monday 19 December 2011 19:27:06 Koen Kooi wrote:
> >> Op 19 dec. 2011, om 19:22 heeft Paul Eggleton het volgende geschreven:
> >>> On Monday 19 December 2011 18:50:35 Koen Kooi wrote:
> >>>> Op 19 dec. 2011, om 18:43 heeft Paul Eggleton het volgende geschreven:
> >>>>> Set the default psplash image to the OpenEmbedded logo, and provide
> >>>>> a
> >>>>> script to allow people to use their own custom image.
> >>>> 
> >>>> What I did in OE-classic and meta-angstrom is to use
> >>>> update-alternatives to provide different psplash images. This way you
> >>>> can choose a different splash for each image instead of having a
> >>>> distro wide one. Is something like that suitable for oe-core as well?
> >>> 
> >>> Sounds like a useful capability, however, does this mean that when you
> >>> want to override it in the image you end up with both psplash versions
> >>> installed?
> >> in a splashless image you can just do 'IMAGE_INSTALL += psplash-angstrom and
> >> it will only install that one. If you want to reuse an existing, unmodified
> >> image with psplash and add your own, then you will end up with both.
> > 
> > Although I guess another way to do it would be to do a VIRTUAL-RUNTIME type 
> > thing like we do for other such selections. At the moment in OE-core, psplash 
> > is brought in via task-core-console, and whilst it is a separate variable that 
> > could be overridden it's a task which once built really makes it impossible to 
> > customise per-image.
> > 
> > What about a "splash" IMAGE_FEATURE and then a VIRTUAL-RUNTIME_splash to 
> > select which psplash to install?
> 
> I will say again: I absolutely HATE that virtual-runtime nonsense. If
> you need to change a task, change the task, don't introduce things
> that make it non deterministic. Guess what happens when you change a
> virtual-runtime *after* you have built the task already.

That virtual-runtime stuff is clearly distro related and should only be
changed at the distro level. Doing anything else with it isn't
supported.

The splash screen issue strikes me as a distro level issue with
different distro's wanting to rebrand as needed. It therefore seems
appropriate to handle psplash that way?

Having them parallel installed seems overly complex and a solution in
search of a problem :/

And yes, personally I dislike the virtual-runtime stuff too but the
alternative is a ton of copies of recipes with one line changes which I
dislike more.

Cheers,

Richard




