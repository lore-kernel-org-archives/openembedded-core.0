Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rj9Ay-0004hE-JL
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 13:45:40 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rj93q-0003iG-QM
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 13:38:18 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 12:38:17 +0000
In-Reply-To: <1325852434.20759.92.camel@ted>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<04bb0f6bbd41ec9c2234df49130dba2346d9a3bf.1325744640.git.sgw@linux.intel.com>
	<lyboqh86qb.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1325848065.20759.84.camel@ted>
	<1325849632.28005.151.camel@phil-desktop>
	<1325851561.20759.90.camel@ted>
	<1325851670.28005.154.camel@phil-desktop>
	<1325852434.20759.92.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325853498.28005.162.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 04/28] ncurses: move libraries to base_libdir
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
X-List-Received-Date: Fri, 06 Jan 2012 12:45:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 12:20 +0000, Richard Purdie wrote:
> $ ./i586-poky-linux-ld --verbose | grep SEARCH
> SEARCH_DIR("/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/i586-poky-linux/lib32"); SEARCH_DIR("=/usr/local/lib32"); SEARCH_DIR("=/lib32"); SEARCH_DIR("=/usr/lib32"); SEARCH_DIR("=/usr/local/lib"); SEARCH_DIR("=/lib"); SEARCH_DIR("=/usr/lib");
> 
> which makes sense since the builds are all still working...

Oh, right, fair enough.  I guess it does need to search /lib for NEEDED
libs, at least, and maybe it just uses the same search path for .so
links.  Anyway, yeah, that seems fine then.

p.




