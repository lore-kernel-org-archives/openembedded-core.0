Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SfvtG-0005ZA-Ok
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 18:30:22 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Sfviy-0002gA-07; Sat, 16 Jun 2012 18:19:44 +0200
Message-ID: <1339863500.3339.150.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Sat, 16 Jun 2012 17:18:20 +0100
In-Reply-To: <4FDBBD8D.1050201@linux.intel.com>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<5f472764f7cea2d386b7ee572870fc03769868fc.1339799869.git.dvhart@linux.intel.com>
	<4FDBBD8D.1050201@linux.intel.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
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
X-List-Received-Date: Sat, 16 Jun 2012 16:30:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-15 at 15:56 -0700, Darren Hart wrote:
> So the delta for including SETSID and CTTYHACK is 2560 bytes.

Personally I am still not in favour of adding this to the default
configuration.  I appreciate that it's "only" 2.5k in this case, but
every time we make a change like this the binary gets a little bit
bigger and, over time, it does add up.  This sort of gradual bloat is
quite insidious and difficult to combat after the fact.

So, I continue to think that poky-tiny should just provide its own
busybox configuration and turn on the options that it wants just like
other DISTROs do.  No doubt there are some things currently included in
the oe-core defaults that poky-tiny doesn't need, so you would probably
get a smaller binary that way as well.

p.





