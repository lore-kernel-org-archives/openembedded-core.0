Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RqABZ-00045x-Gd
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 22:15:17 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RqA44-0001oG-Py
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 22:07:32 +0100
Message-ID: <1327525645.2716.38.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2012 21:07:25 +0000
In-Reply-To: <8762fzo5of.fsf@sonatest.com>
References: <cover.1327519635.git.sgw@linux.intel.com>
	<ae108b14ac3903401a784251e370aef987c99e25.1327519635.git.sgw@linux.intel.com>
	<1327523312.2716.26.camel@x121e.pbcl.net> <8762fzo5of.fsf@sonatest.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] pm-utils: Add grep to RDEPENDS to avoid command failures.
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
X-List-Received-Date: Wed, 25 Jan 2012 21:15:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-25 at 16:04 -0500, Marc Ferland wrote:
> Phil Blundell <philb@gnu.org> writes:
> 
> > On Wed, 2012-01-25 at 11:29 -0800, Saul Wold wrote:
> >> +RDEPENDS = "grep"
> >
> > Don't you get a QA error for that?
> >
> 
> I didn't see any QA warnings when building with yocto (edison
> branch). I'll resend the patch with some corrections.
> 
> Here's bitbake output on my machine (with RDEPENDS = "grep"):

Ah, hm.  Does yocto not use recipe_sanity by default?

p.




