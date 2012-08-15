Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T1lXC-0001HT-9I
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 23:53:50 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T1lLf-0004D3-UT
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 23:41:56 +0200
Message-ID: <1345066801.7750.68.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 22:40:01 +0100
In-Reply-To: <CAJTo0LaKHbXJVAE3Y9jO1wDJYO5iyFAEMYM+U5cgGDhQ6xy+aQ@mail.gmail.com>
References: <cover.1345047378.git.ross.burton@intel.com>
	<10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
	<20120815211232.GC3108@jama.jama.net>
	<CAJTo0LaKHbXJVAE3Y9jO1wDJYO5iyFAEMYM+U5cgGDhQ6xy+aQ@mail.gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] make: add make-replacement-native 3.81
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
X-List-Received-Date: Wed, 15 Aug 2012 21:53:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-15 at 22:17 +0100, Burton, Ross wrote:
> On 15 August 2012 22:12, Martin Jansa <martin.jansa@gmail.com> wrote:
> > eglibc was failing to build with make-3.81
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=2314
> >
> > so I guess once this is built (as webkit-gtk dependency), eglibc will maybe sometimes fail again..
> 
> Interesting, this is the first time I've encountered 3.81 having
> problems.  So we can't use 3.81 and we can't use 3.82 either. :)

You can use 3.81, you just need to install it either under a different
name (e.g. call it "make-3.81" and set $MAKE) or in a different
directory (e.g. ${bindir}/make-3.81/make and set $PATH) so that other
recipes don't pick it up unexpectedly.

p.




