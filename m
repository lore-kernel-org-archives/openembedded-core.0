Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ud4sS-0000qy-RH; Thu, 16 May 2013 22:34:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4GKIwTI004365; Thu, 16 May 2013 21:18:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CBDRQ-Ruxr3A; Thu, 16 May 2013 21:18:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4GKInjp004341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 16 May 2013 21:18:52 +0100
Message-ID: <1368735334.18324.170.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 May 2013 23:15:34 +0300
In-Reply-To: <20130516092905.GG24809@jama.dyndns-home.com>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<2253707.h5Yg7SAvOu@helios>
	<20130516085954.GC24809@jama.dyndns-home.com>
	<24887939.8KrA2KDk4J@helios>
	<20130516092905.GG24809@jama.dyndns-home.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Thu, 16 May 2013 20:34:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-16 at 11:29 +0200, Martin Jansa wrote:
> On Thu, May 16, 2013 at 10:10:45AM +0100, Paul Eggleton wrote:
> > On Thursday 16 May 2013 10:59:54 Martin Jansa wrote:
> > > On Thu, May 16, 2013 at 09:29:48AM +0100, Paul Eggleton wrote:
> > > > On Thursday 16 May 2013 08:31:33 Koen Kooi wrote:
> > > > > Removing layers is pretty much impossible, though.
> > > > 
> > > > With PRINC gone would there be any other issue that would make removing
> > > > layers a problem?
> > > 
> > > Does PR service really fix removing layers? I don't think so, if you add
> > > layer and checksum of foo is changed AUTOPR is incremented, but then you
> > > remove the layer and the checksum is unfortunately the same as what you
> > > had before AUTOPR will go backwards.
> > 
> > Then I would have to say if that's not the behaviour you want we should change 
> > it or at least make it optional to force it to always increment even if the 
> > checksum is the same as a previous value.
> 
> That won't work with multiple builders using the same PR server (I don't
> wont other builders to always increment PRAUTOs used in builds which
> populate official feed).

I just went and looked at the code and as far as I can tell PRServ
defaults to always incrementing upon a change. To get the other
behaviour you'd need nohist=False to PRData() in lib/prserv/db.py and I
can't see where that is set other than to the default :/. I'm tired and
perhaps missing something though.

Cheers,

Richard



