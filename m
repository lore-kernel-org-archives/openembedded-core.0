Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SgaOw-00085N-0V
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 13:45:46 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1SgaEb-00057N-U7; Mon, 18 Jun 2012 13:35:06 +0200
From: Phil Blundell <philb@gnu.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Mon, 18 Jun 2012 12:35:04 +0100
In-Reply-To: <4FDCB690.8090004@linux.intel.com>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<5f472764f7cea2d386b7ee572870fc03769868fc.1339799869.git.dvhart@linux.intel.com>
	<4FDBBD8D.1050201@linux.intel.com>
	<1339863500.3339.150.camel@x121e.pbcl.net>
	<4FDCB690.8090004@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1340019305.14857.147.camel@phil-desktop>
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
X-List-Received-Date: Mon, 18 Jun 2012 11:45:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-06-16 at 09:38 -0700, Darren Hart wrote:
> With the above goal in mind, can you accept either of my proposed
> patches as an interim solution? Either as an added tiny DISTRO_FEATURE
> or as a simple addition to the defconfig? I do believe these two
> features are useful beyond poky-tiny.

Well, obviously it isn't my place to accept or reject your patch; one of
the oe-core maintainers would have to make that decision.  But,
personally, given a choice between those two options I would prefer the
latter.

However, I do still think that the best interim approach is just to
provide a suitable, complete defconfig file in whatever layer contains
poky-tiny.  This doesn't need to involve splitting poky-tiny into its
own layer, doesn't require any extra tooling in oe-core in the short
term, and doesn't necessarily even need to involve a .bbappend (although
it would probably be easiest if it did).

p.




