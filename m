Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QvoQl-00072H-R6
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 12:42:03 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QvoMC-0005K0-Uc
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 12:37:21 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2011 11:37:20 +0100
In-Reply-To: <201108231032.19140.paul.eggleton@linux.intel.com>
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
	<20110823064454.GA8170@chargestorm.se>
	<1314091333.6733.311.camel@phil-desktop>
	<201108231032.19140.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314095840.6733.334.camel@phil-desktop>
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
X-List-Received-Date: Tue, 23 Aug 2011 10:42:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-23 at 10:32 +0100, Paul Eggleton wrote:
> On Tuesday 23 August 2011 10:22:12 Phil Blundell wrote:
> > Irrespective of whether it happens to work or not on some or other
> > distro, "cp -n" isn't POSIX and we shouldn't be relying on it.
> > 
> > I can't really see why the -n option is needed here anyway.  It looks to
> > me like it could just be removed with no ill effects.
> 
> Sorry, I wasn't aware that it was a non-standard option. I'll post a new 
> version with it removed.

Yeah, POSIX cp only understands quite a restricted set of options.  It
supports -f, -i, -p, -R, plus -H, -L and -P in newer versions (and the
obsolescent -r).  Anything beyond that is not guaranteed.

p.



