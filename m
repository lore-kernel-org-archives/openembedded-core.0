Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzvyT-0001L6-CO for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 20:01:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GIxoZW007746;
	Wed, 16 Mar 2011 18:59:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07337-06; Wed, 16 Mar 2011 18:59:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GIxhYY007740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 16 Mar 2011 18:59:44 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <DBC31B04-026E-4DD8-A9D8-B8F748BE0087@dominion.thruhere.net>
References: <cover.1300297594.git.paul.eggleton@linux.intel.com>
	<72630e485ee5606ee308b97f58c645662f9e2108.1300297594.git.paul.eggleton@linux.intel.com>
	<DBC31B04-026E-4DD8-A9D8-B8F748BE0087@dominion.thruhere.net>
Date: Wed, 16 Mar 2011 18:59:31 +0000
Message-ID: <1300301971.30423.1905.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 1/1] sanity: detect if bitbake wrapper is not being used or pseudo is broken
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
X-List-Received-Date: Wed, 16 Mar 2011 19:01:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-16 at 19:25 +0100, Koen Kooi wrote:
> Op 16 mrt 2011, om 18:49 heeft Paul Eggleton het volgende geschreven:
> 
> > From: Paul Eggleton <paul.eggleton@linux.intel.com>
> > 
> > * Shows a warning during sanity checking if the scripts/bitbake wrapper is
> >  not being used
> > * Check to see if pseudo is working during sanity checking, and if it
> >  isn't an error occurs (if we are using the wrapper script and pseudo
> >  has been built; otherwise it is a warning).
> 
> Do really want to add *more* poky references into oe-core when the goal is to remove them?

There are two partially competing objectives at the moment, to get a
high quality Yocto 1.0 released and to work on OECore. Doing both at the
same time is proving rather tricky but its not doing too badly.

In this case the script is still called "poky-init-build-env" in both.
Referencing a script that doesn't exist isn't going to help anyone and
that is the only reference I could spot so I don't think the patch is
unreasonable. It also addresses a serious usability issue people do run
into.

I'm not going to block any attempts rename things *despite* the horrible
amounts of pain its likely to cause me juggling patches for the 1.0
release. Nobody has sent those patches but I think the hesitation is
probably warranted. Why?

I still don't think the TSC has figured out crisply what should and
shouldn't be in OE-Core, whether any scripts should be there period,
whether they are purely a reference or whether we encourage people to
use them. Same question for distro config, I moved them out the way in
the poky repo but I get the feeling we're not ready to do that in OECore
until we split the config into pieces which we might be able to share
some of. 

I starting to think the best way to do this may be to sit together at
the "TSC" meeting before ELC and actually write the commits there and
then on a projector screen to get this figured out.

Cheers,

Richard





