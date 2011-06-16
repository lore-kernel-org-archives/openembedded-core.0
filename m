Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QX9f6-0001Pk-Tm for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 12:18:57 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QX9bn-0006Ri-MC
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 12:15:31 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 16 Jun 2011 11:15:30 +0100
Message-ID: <1308219330.25285.4194.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: eglibc testing?
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
X-List-Received-Date: Thu, 16 Jun 2011 10:18:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I just ran "make check" under qemu on my eglibc-2.13 build (from oe-core
master) and got rather a lot of failures.  It wasn't immediately obvious
to me whether these were libc bugs, qemu infelicities, oe-related
harness problems, or some kind of local finger trouble.

Before I spend too much time investigating this, are other people seeing
the same effect?  What approach do the Yocto folks use for glibc
testing: are they running the testsuite directly on target hardware, or
via qemu, or something else?

The gcc testsuite is next on my list to look at and, again, I'd be
interested to hear what approach other folks are using there and what
sort of results they are currently getting.

thanks

p.




