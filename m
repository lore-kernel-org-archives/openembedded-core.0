Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qf86T-0008TD-Gg for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 12:16:09 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qf82k-0006yR-UX; Fri, 08 Jul 2011 12:12:19 +0200
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <201107081103.37637.paul.eggleton@linux.intel.com>
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<201107080938.37370.paul.eggleton@linux.intel.com>
	<1310118829.18564.13.camel@lenovo.internal.reciva.com>
	<201107081103.37637.paul.eggleton@linux.intel.com>
Date: Fri, 08 Jul 2011 11:12:12 +0100
Message-ID: <1310119932.18564.15.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Fri, 08 Jul 2011 10:16:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 11:03 +0100, Paul Eggleton wrote:
> On Friday 08 July 2011 10:53:49 Phil Blundell wrote:
> > They can always provide their own OLDEST_KERNEL setting, though.  To
> > some extent I think it's a bit academic what the default in oe-core is.
> 
> Yes, but let's have a sensible default value, in particular that will allow 
> the majority not to experience subtle problems that they will have to spend 
> time tracking down. Many people coming to OE fresh will not know this setting 
> even exists - I only discovered it the other day by accident.

If OLDEST_KERNEL is set to a value that's too new then the failure you
get is anything but subtle: glibc will just print "kernel too old" and
exit.  I guess we could enhance that message to refer directly to
OLDEST_KERNEL to make it a bit more obvious what you need to do.  Also,
we could teach kernel.bbclass to issue a diagnostic if you try to build
a kernel that's older than OLDEST_KERNEL.

p.




