Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QvnG3-0005BO-Sy
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 11:26:55 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QvnBV-0005F6-5G
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 11:22:13 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2011 10:22:12 +0100
In-Reply-To: <20110823064454.GA8170@chargestorm.se>
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
	<8c4bf939c0906cd744debeb85d5d55de622c184e.1313606178.git.paul.eggleton@linux.intel.com>
	<91BBD9D6-2616-4A85-B87A-5DFA1AD82152@dominion.thruhere.net>
	<20110823064454.GA8170@chargestorm.se>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314091333.6733.311.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [RFC PATCH 1/2] image.bbclass, kernel.bbclass: create warning file about deleting deploydir files
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
X-List-Received-Date: Tue, 23 Aug 2011 09:26:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-23 at 08:44 +0200, Anders Darander wrote:
> * Koen Kooi <koen@dominion.thruhere.net> [110822 23:01]:
> > Op 17 aug. 2011, om 20:37 heeft Paul Eggleton het volgende geschreven:
> > > +	cp -n ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> > > +
> 
> > That doesn't work on my debian box:
> 
> > | + cp -n /OE/tentacle/sources/openembedded-core/meta/files/deploydir_readme.txt /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy/images/beagleboard/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> > | cp: invalid option -- 'n'
> > | Try `cp --help' for more information.
> 
> Which debian version are you running?
> 
> I've seen no problem, as far as I can tell, on neither my ubuntu, nor my
> debian box. (Although I'm running debian sid on that one).

Irrespective of whether it happens to work or not on some or other
distro, "cp -n" isn't POSIX and we shouldn't be relying on it.

I can't really see why the -n option is needed here anyway.  It looks to
me like it could just be removed with no ill effects.

p.




