Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SfBAD-0007cf-Io
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 16:36:45 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1SfAzy-0006ak-8N; Thu, 14 Jun 2012 16:26:10 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2012 15:26:08 +0100
In-Reply-To: <4FD9ED69.50800@linux.intel.com>
References: <cover.1339650859.git.dvhart@linux.intel.com>
	<3b44305edae36265295087fb5f31d22d660599b8.1339650859.git.dvhart@linux.intel.com>
	<1339666865.14857.39.camel@phil-desktop>
	<4FD9ED69.50800@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1339683970.14857.86.camel@phil-desktop>
Mime-Version: 1.0
Cc: Yocto Project <yocto@yoctoproject.org>
Subject: Re: [PATCH 2/3] busybox: Add setsid and cttyhack for tiny DISTRO_FEATURE
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
X-List-Received-Date: Thu, 14 Jun 2012 14:36:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-14 at 06:55 -0700, Darren Hart wrote:
> Another approach would be to just consider these two features and decide
> if they shouldn't just be part of the oe-core busybox defconfig anyway.
> I don't see why setsid shouldn't be. I can see arguments against
> cttyhack (as it is a hack), but I wouldn't think either should be a huge
> deal to just include. I thought the DISTRO_FEATURE was a reasonable
> compromise between that and having to maintain a bbappend outside of
> oe-core.

Well, you don't need to maintain a .bbappend as such: you can just
provide your own, completely custom config file for busybox.  That's
what micro does, what shr does (I think), and what I would suggest that
most DISTROs with non-trivial configuration requirements should probably
do.

I think most folks do actually use a .bbappend to fiddle FILESPATH in
order to get the configuration file picked up, but I'm fairly sure you
could do this with a bit of suitable magic in your distro config file
and avoid the .bbappend altogether.

> How would you feel about just including these two features in the
> defconfig then?

Not massively enthusiastic, simply because the logical conclusion of
that approach is that we end up with basically everything in busybox
turned on.  If we're going to go along that path then I think I would
prefer us to be up-front about it and just make the oe-core default
configuration for busybox be a "maximum features enabled" one. 

p.




