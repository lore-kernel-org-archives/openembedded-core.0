Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SyS9J-0007JV-3Z
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 20:35:29 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SyRxy-00040S-8z
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 20:23:46 +0200
Message-ID: <1344277316.4874.2.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 19:21:56 +0100
In-Reply-To: <50200899.7000500@linux.intel.com>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
	<1344182057-15981-18-git-send-email-javier@dowhile0.org>
	<50200899.7000500@linux.intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 17/30] linux-firware: use ${base_libdir} instead of /lib for packaging
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
X-List-Received-Date: Mon, 06 Aug 2012 18:35:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-06 at 11:10 -0700, Darren Hart wrote:
> On 08/05/2012 08:54 AM, Javier Martinez Canillas wrote:
> > It is considered good practice to use the build system provided
> > variables instead of directly specify hardcoded paths.
> 
> The firmware location is explicitly set because this is where the Linux
> kernel requires it to be. 

Is that actually true?  I thought the kernel just supplied the leafname
that it wanted and the knowledge about what directory to search was
encoded in the hotplug helper scripts.

> This patch will break firmware loading.

That might well be the case, though, unless the scripts have also been
patched to respect ${base_libdir}.  

And, notwithstanding all the above, it's not entirely obvious that
${base_libdir} is semantically the right variable for things that aren't
libraries.  How does the udev recipe represent the patch to /lib/udev?

p.




